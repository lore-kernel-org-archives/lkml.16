Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76F228C5D2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290804; cv=none; b=TfvJcdxDHP/pGfQhKWcYw7nYGcazrkzXZfhPE4xh+hhtENjst2Gd0ZJoyC5stneE8JXjrDmEOYGFRdEuiMmf5EgUMiQMj3cZejo//rIM3GCTtOtleE4rmX0Bgdu4oyphl2Ax4vUVso3jAkQNRjpehyxS8QQ6BT8HiqL2ZhyV5I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290804; c=relaxed/simple;
	bh=sQpFp6z42CdWEfMIAZaPPEwloL/1gzFFXVvDuk7Bii4=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QVtb3QFBFqe5J7fVC9pKp5xVZOggojgp86A6DhPM+Zfde93Quh8g+czwL8YKMQKcVk7a+lg/PY60qZCmgpyIqeTUfh4rAasJrOV+YsPUucsLmC0dDt2YxivT3U3bB3AempEoHCC8RapNPGDMrNyFvcZ/sqm0+1O8/7BPhOQyIYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=Z9LUWN6Y; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="Z9LUWN6Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1744290493;
	bh=sQpFp6z42CdWEfMIAZaPPEwloL/1gzFFXVvDuk7Bii4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z9LUWN6YhT48RfpfBUXHDwePN8AJtKEU77s5lNU3VQiOiYj/LvfJQCyFGhWpvyXUx
	 0Fl4pwqqVSH2rh/LC2Bx/3o2oZ9NRp/3R4F9JhInnJ2D6xk7UVaZHDJ5bfM/6gSb6T
	 UxyOkhdAE0OcF0Vst6k0PhQmiNvn6dsyr3ul9CJw=
Received: from localhost.localdomain ([116.148.99.229])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 20B9904D; Thu, 10 Apr 2025 21:08:11 +0800
X-QQ-mid: xmsmtpt1744290491tq1ifvk0l
Message-ID: <tencent_4E3BCCDC793A514260932AA16BC5910F400A@qq.com>
X-QQ-XMAILINFO: OZZSS56D9fAjr6qLxhni7Tm4NW7ja+8BStA3IPchsjk620SZ+EkVmC2c+v4twk
	 ydL+vji4X0EHr60B6VbWjmX7Fd518Cshy/zeqVle6U7PfPIk0ExOkprebKc8R8Rghi/fH09zF8Ym
	 94k7yZPYR7W/WcSKwAdxvtAHUNG3CTd1RljmypUV/or3K/GVUjvihI0oNEVBjEVw7UV9REfjQN2/
	 IFHQdjmtCwfpCNThiwg3vUcCTnfu1Xg3AboPhjT8TcacYAiwNKN7KwyXTBgBVkoeeBGZ/V6kcA6c
	 KIzQxqMT7pfKMbqJ+sCpaECK6DcrrB0++AIM9ZN4ucewaKK4fWiqpMhrbGe+CYI8wH/cWBMZK01l
	 yQdgOGtQXmj+/FgqAUvGPCldMpy+9Dpkj2JzKp0hV+gGLLGgjz23nh5E4gNUSzNnedt75a0CU1/u
	 c68JWRT7fUVLWtTNGqQELZkPaxipkgJAByhDOKXh9L9DT9SzHFZs2C765iEdv6XiQH72t6hAlcWp
	 X9wAExopLMWyOR/zctVPDc+7svT7oJ6nuvVNCBGg78lo1sIhCbFTb9RGEcg2swGkjcbSyGlZOtlW
	 XaOnUfjZDQsT3fX0brkG5thNik0R2w7QSQQll7VIXDVZs/EAFnJjxDZx8YiVr5mp3V3z4RJPktoK
	 BRP2SUjBUc55SD59REEZ67J0sNCG0724Q0Je3mfxd1bjEHPSTu07b7zKptBxyWScHKDnzYKcGm2Y
	 OibMhO4Zlb6vk728XUtAninYgXUYvypARemgzm5Cs/lCDQTx8ihwNA6r6wOl3N3kl+coT9GjMnnn
	 gcOCShMe3ZBKWm2Fxmgtq6ckVO75br6TUY9qL9+TMA9D+479RgExd90ZyoRzw0lQQwTitoetZ6qb
	 Q775ULf9i9OeCTjhu5JxXsPQkcq0MexHNZpLRHyGGbt49JCVcc+jRR8qTaw7qySz/tCr3hzU5L9e
	 RTJ3bGIH5mjtGBp6oJ557HSeBxKpLf6YQRaOeAi9xuEFr/4vHyrw==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: zhoumin <teczm@foxmail.com>
To: hirofumi@mail.parknet.co.jp
Cc: linux-kernel@vger.kernel.org,
	teczm@foxmail.com
Subject: Re: [PATCH] fat: Optimized FAT bad char check
Date: Thu, 10 Apr 2025 21:07:12 +0800
X-OQ-MSGID: <20250410130716.879542-1-teczm@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87ecy16ub9.fsf@mail.parknet.co.jp>
References: <87ecy16ub9.fsf@mail.parknet.co.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Hirofumi

> Why do you need this change?

I encountered an issue while working on our own bootloader. The problem
occurs when short file names start with `0`. In this case, our bootloader
mistakenly interprets it as the end of the directory entry, causing all
subsequent files in the directory to become invisible.

While comparing our bootloader with the kernel, I found this bad char check
function. Treating the `0x05` deleted flag as a bad character may
potentially disrupt the parsing chain for subsequent files.

In my opinion, adding this judgment aligns with the spec and should not
introduce any negative side effects, even though I haven’t encountered this
situation in practice.

This is the rationale behind this commit, and I would appreciate hearing
your feedback on it.

Thanks,

zhoumin

