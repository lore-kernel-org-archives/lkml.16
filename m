Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0048421ADC5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743157750; cv=none; b=bxIlMBUnGv+famae8JjJ6LsHulxK0YUf6HyYBrf3W0GohB42Ges7RGgAU6aiMAzBrWnPQI8GpJYZAtT9/v0dVfEDNQ/dlylxI3vyMOjP/w6p5KP3Q/TsmYrSodUbVQwERG/KX1DJk6XiO2dJ7Et/LAzbvLaYc3vVAD55U8DWQgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743157750; c=relaxed/simple;
	bh=K37yE3iyYuruvJeuoMfhV+Q8sLRd6nF2BXd0h3DpmUU=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=cxH9NNbBx3ViUvuzV4FBSujhxgotSerssd8KNlYLP1WKov+nGyKhynJtNevmbJ7fG77CHQuZMJ3msHvQ/+UgRMEL/7LTJBD7DZQ5NmIaIotMlEr/ffUjTEN7DOeWI3QQ3FOEIQOAIHh3qUxzBihvBbHEvZyy6afId3H8DzE5UIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com; spf=pass smtp.mailfrom=red54.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=HkJb0hyf; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=red54.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="HkJb0hyf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743157743; bh=I2eMAS1QoFOyVHmK1FI/Y9oGcQmoyT9GZd4/d7u4S2Y=;
	h=From:To:Cc:Subject:Date;
	b=HkJb0hyflb/1EuJPHQnZWzlka/VTRKvcRRVQgEDJIEs9z3G5AtIyq+zaIQRifSqE9
	 mTv5O9iZgLZSapSUkFa/12eOiZ6WEfZrJbCMjLgVa9+x4t3bjBqzMkFi7rzZzo/PJl
	 ZIN/EeahmydpA9k/9+ny0c0Zh38zPftP0UHkUwDw=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszc11-0.qq.com (NewEsmtp) with SMTP
	id 5179D080; Fri, 28 Mar 2025 18:20:23 +0800
X-QQ-mid: xmsmtpt1743157223tws36nd57
Message-ID: <tencent_3E8155B4A33D48D6637F16CFE5ED293F0E08@qq.com>
X-QQ-XMAILINFO: NQR8mRxMnur9ApmSjGAwIgWVyFsdwRYfpF6XWUljFL9CGWaXb+SYBegsQSuHDa
	 nI0O7Z+SDmOWqkDMzxaTGO3i7OLfvQtyuwZTtBFzupP2Hhi4/Jw0ie/8c8I+9e9Bz6rOBMDvmpFh
	 LjGhF4kIEyIHDng1mYjUXoPH/4hAt1ExAxHyDIfOuEOFGTrXsz1GvmEJgWev5InZEOe6XNT7KOfG
	 i+HZ/Z8zXKp6BCf6dZqzZu88SHg3p70mUuuoE+JaMupi7pDsHUdXqEHfjnuAX0bXY4RfnpDdI+Tt
	 3Sw1o6aBIdLu/e9hsxnwp8ecxctSB/sw0x8xjmVnfImb9HwPWjXX3ON6RwRge8jWYKHuusMa8QCE
	 fOJ/7yfeH6Ls7UxIifcVcAHwbZVKQcPbeZTbFFnf6M5GlqlSWispUd5euM/9w7l3l8kjcMHZh2H0
	 IiXm0GawkZ3AIq37R9Ec3IIvjMhEWkV9E2FTWEoDH9HX4/rkDkwUplHMODNOWqBdAgAMr1k/QgVz
	 h1KVDcnqTnjgu/3rTRmLBOtdjqcYkaCvD6w4L5KBBTmu5zaaiZ3ZUVFi7KBY7OmDSR4AEUzsYXGc
	 TBJpGK6KdTXxMYWh/rYT9ZBfLvakVZvrdm8Bp2o7o6Boa3NUhrC0gpBirYS2yYMfJ+mf0E8wgspC
	 ZZkBLrUnYNo1X0qpepJJBohoWZaRGZQO3Hz7/W+K/nuCV32tdCjA9LEtI+DPfQQd16sdOqXfAAJ2
	 Nom+TP5uAR4l6SFs8+vfPoKIFsaXqicDrtE/bePN7AHSNRUM08NAOwgGIVFhhGUX5EBpR9Szz+fm
	 SJ3ijjMWKDtbF9BKHbKYHxbM7noR0mR3er4vNLCs4eqKUIS4BL/6TzKLKoeVBFHAD+O9VY+/oNoE
	 tdl99IPisRdF7LTjyQ/MrnZzdJDveQYP5gUDYegQ/QIQWOeliZU44VZHgARWnCbF10OfdZzWcDyZ
	 vN6+jra0REvKMV93KNnddkuFcsX60ue7kGgVMA6s/9mG3jF+u1aw==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
Sender: yeking@red54.com
From: Yeking@Red54.com
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Yuntao Liu <liuyuntao12@huawei.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Dave Vasilevsky <dave@vasilevsky.ca>,
	Nathan Chancellor <nathan@kernel.org>,
	Victor Boivie <victor.boivie@sonyericsson.com>,
	Nicolas Pitre <nico@fluxnic.net>,
	Oskar Andero <oskar.andero@sonyericsson.com>,
	Bjorn Andersson <bjorn.andersson@sonyericsson.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: Fix support for CMDLINE_EXTEND
Date: Fri, 28 Mar 2025 10:20:17 +0000
X-OQ-MSGID: <20250328102017.53121-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>

It should be the default command line appended to the bootloader command
line, not the bootloader command line appended to the default command
line.

This will be consistent with the behavior of FDT, EFI, and other
platforms.

Fixes: 4394c1244249 ("ARM: 6893/1: Allow for kernel command line concatenation")
Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
---
 arch/arm/Kconfig              |  4 ++--
 arch/arm/kernel/atags_parse.c | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 25ed6f1a7c7a..635e4da33fff 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1534,8 +1534,8 @@ config CMDLINE_FROM_BOOTLOADER
 config CMDLINE_EXTEND
 	bool "Extend bootloader kernel arguments"
 	help
-	  The command-line arguments provided by the boot loader will be
-	  appended to the default kernel command string.
+	  The default kernel command string will be appended to the
+	  command-line arguments provided by the boot loader.
 
 config CMDLINE_FORCE
 	bool "Always use the default kernel command string"
diff --git a/arch/arm/kernel/atags_parse.c b/arch/arm/kernel/atags_parse.c
index 4ec591bde3df..bd163f00602e 100644
--- a/arch/arm/kernel/atags_parse.c
+++ b/arch/arm/kernel/atags_parse.c
@@ -120,15 +120,15 @@ __tagtable(ATAG_REVISION, parse_tag_revision);
 
 static int __init parse_tag_cmdline(const struct tag *tag)
 {
-#if defined(CONFIG_CMDLINE_EXTEND)
-	strlcat(default_command_line, " ", COMMAND_LINE_SIZE);
-	strlcat(default_command_line, tag->u.cmdline.cmdline,
-		COMMAND_LINE_SIZE);
-#elif defined(CONFIG_CMDLINE_FORCE)
+#if defined(CONFIG_CMDLINE_FORCE)
 	pr_warn("Ignoring tag cmdline (using the default kernel command line)\n");
 #else
 	strscpy(default_command_line, tag->u.cmdline.cmdline,
 		COMMAND_LINE_SIZE);
+#if defined(CONFIG_CMDLINE_EXTEND)
+	strlcat(default_command_line, " ", COMMAND_LINE_SIZE);
+	strlcat(default_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+#endif
 #endif
 	return 0;
 }
-- 
2.43.0

