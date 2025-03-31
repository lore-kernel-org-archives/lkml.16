Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B4B1D63F7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743410199; cv=none; b=B1ofEIMnYbj/edGwbd0wY+BvtbMpUMDpWbtQbP+yhFzPMzdg3s5Bqns3QKvAtwiZanGzYT7HFEXb9vhzLwVY5Fbf3K4A8hdpY2B/DzrIawyjwaq+fxGBlylkuV7VniMaV/6NHYrjYQMNcHoAezIhrKLelwufZxY6ef/nCEA4Ads=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743410199; c=relaxed/simple;
	bh=Kd88/Ls2zS42L2QD93mYpM5+t/RD4xvC04BRh0kG648=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=fmyPoQSA7l2Armv7QnFJEj1WkVCDbSZmPmxAxLkFcGyxWGGue9JtP2XuNWGTIlld2PMt972sQLoGdMnQ7KZkcZ41GDZLddV0SkCR36D8oC1gO+KT3oo0klEXZlCMYCu95lNJa8juPsCQX3cxglIAXHa8zcms5XhNmkQIbLL/16Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com; spf=pass smtp.mailfrom=red54.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=IHNbisAq; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=red54.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="IHNbisAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743410172; bh=Kd88/Ls2zS42L2QD93mYpM5+t/RD4xvC04BRh0kG648=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IHNbisAqUPp+GzpYDZIBquAW0m5xBEdMJYQZYD5sEp9F2EKMHZmz5Ns3iivHagykh
	 dKQT6XEAAUx2N2dW19PusixNMUpCkUKdh2vPzjZ/gk33rk7pnUcjLkNDPAIf6i9Tp3
	 M0RC3QYvuPSmwpjX+yKGDOgUYiQxbdH3DEDHjJE0=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id 75B0A84B; Mon, 31 Mar 2025 16:29:27 +0800
X-QQ-mid: xmsmtpt1743409767tz8xrf3uq
Message-ID: <tencent_F967B6C3FF5405F2D17EF660590BFD213C0A@qq.com>
X-QQ-XMAILINFO: MpvVxjO9l39xxt6E8UMbjpgTfOvMvWwD+cI4qVBLj9WK8K3TesHSFSNSdOXTeS
	 R1IxZcOHITpKQC5eJXL19OPBsgQAkgcmAphNYVeqJTYQdkCCX9jAh51RRZsfbqaiRooKoQ3U7DDY
	 NCVsENHQl7j1/dgvQYZY1/+EvRlThf4G2tNKCfqBHzcdZ+HXir9bGD3uqA8aW8sWeSg/1SeTyTtu
	 j+yu7L/xZNuDGIQQe3GiEm096IuCAWfbZJ59QEpiY70FnE0an4oaMZY90e0jXEMUIkqd6/6Ok9+c
	 YnFK24M6t0jNZ+vUK6tTpoay4/RBzCIDwy8Edsct6KOrk1jRE3StfbB/14QGsRc0eymDBXqPig79
	 H6XKHRM3hrFFNncyp5Ar49ix1gEk2w+DeZwgfsc0lqWkEHbLWBGeomI1EEpSSfX8A4pR5dOULbgP
	 aad8cR9RFsZ/KCqPsjbyLwZMdAHWCi9s+PSPH8QKVZmMiyVyEO+nHIEJYTWatbBJjRepsxRKmaEc
	 bCD2wD6cmw8KtjjCDOvBpk7x8DO/8EWkRXV3M1VKqglzjwjbdoJO/MtwN0dmv+dAMzDNOtiP3kPY
	 DkfXisLv9Ty0mSGASvRv1/tVjAU0SGWEzLJwcOlhsLtqWb30G/tCUtO1Oj4WUgvbgZbIXaIxy29u
	 FdU87u4IMo++hHkxX/6InmFBjhuNKVXXYzNBQ443qz0LAOiPJCR8LDSLgdD33FS9Q0r5SgLRu344
	 y9fMwu7WlzxASCSYwpQxDjt8eKU6TKtZw3xnIa0fVz7ZwqqprGUMfNaS8kuV3jDBldiWiwCH8OyZ
	 kIk3WGbgq9NY16CchmTBl9OS2ltp50M/Sg9BZFVKzRn5eyQ4lQ/40v6oYZnSculo9pffFZU1NsZw
	 uTe9Bort4CweQX2svbSqrDd6kMy0m8z6AloOGNLbqL1im7nh6kT/EENjb77G6x/OQ9Ow2nXA2MrX
	 smbAsMmL51a8UiMdVmmEQ3xqa8N+h0
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
Sender: yeking@red54.com
From: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>
To: linux@armlinux.org.uk
Cc: Yeking@red54.com,
	ardb@kernel.org,
	bjorn.andersson@sonyericsson.com,
	dave@vasilevsky.ca,
	ebiggers@google.com,
	linus.walleij@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liuyuntao12@huawei.com,
	lumag@kernel.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nico@fluxnic.net,
	oskar.andero@sonyericsson.com,
	ruanjinjie@huawei.com,
	victor.boivie@sonyericsson.com
Subject: Re: Re: [PATCH] ARM: Fix support for CMDLINE_EXTEND
Date: Mon, 31 Mar 2025 08:29:21 +0000
X-OQ-MSGID: <20250331082921.120679-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <Z-aWPqAUOIDEzzpZ@shell.armlinux.org.uk>
References: <Z-aWPqAUOIDEzzpZ@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Later arguments override earlier arguments. Any compiled-in command line
> needs to be overridable by user supplied input from the boot loader. The
> current behaviour is correct.

CMDLINE_EXTEND is for the built-in command line to "Extend bootloader kernel
arguments", not for the bootloader command line to extend/override built-in
command line.

Don't forget that the default empty CMDLINE already gives the bootloader the
ability to override everything. Not to mention that even if CMDLINE is not
empty, the default CMDLINE_FROM_BOOTLOADER continues to give the bootloader the
ability to override all.

