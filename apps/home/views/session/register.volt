
		{{ form('session/register') }}
			<label for="username">邮箱</label>
			{{ text_field('username') }}
			<label for="password">密码</label>
			{{ password_field('password') }}
			<label for="repassword">重复密码</label>
			{{ password_field('repassword') }}
			<label for="sex">性别</label>
			{{ select_static('sex', ['1':'男', '2':'女']) }}
			{{ submit_button('注册') }}
		</form>