Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC324261393
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745231003; cv=none; b=WcOY0FW8hVWJsY5vi/xBZWm3x4sT0BkTfXi/+DgEXSF232oOmymljcu4U8iVk49QAMcspina6FoNMBD1vbOiDN0jKCbfCMEn+C4dYuaGxqcc07d7RZ2bnN7wNkdcaZ7VmRP45wQn4tl2/7r+WGOzLoYsdaPpbdTHHjfk+ggMN0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745231003; c=relaxed/simple;
	bh=uMEDAIJKgdn3nU1kFSVUwatOowWRY5Q6GYnInvNYP5k=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=kCucG/pxe1WSPIPG1sKVozATOgmqUbvb9Um6U/2aU8qKiCy0F0BI2jJOFTWUjbWbUvuo80DcHvL94C3dzv0U+cUO+RWCfmKuzY6Zsfg8s2O7uPrBuE8UAHUNwut7oOISPUDBD1islvcfWPkQ16CKIGVY5DnJ0+2/07yJ8ITqG0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com; spf=pass smtp.mailfrom=red54.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=kmN2xSAm; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=red54.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="kmN2xSAm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1745230984; bh=uMEDAIJKgdn3nU1kFSVUwatOowWRY5Q6GYnInvNYP5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kmN2xSAmBpp8p/RNOlrcO9hnD08rV4zEz/dJXLxXzjBJPYWdOwUL3T36DeqdEbOqm
	 cIU/CrXcVz+VNC5iQDchiFAumTYsCZTSQFjSoaGqyAGopss5jILyAwLQWujmV7bJj7
	 ZM1dFJXmHQRGf2FsaoB1ERQCsMvAQwqMkZ3XFCbI=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszgpua8-1.qq.com (NewEsmtp) with SMTP
	id 41B23877; Mon, 21 Apr 2025 18:16:27 +0800
X-QQ-mid: xmsmtpt1745230587tp74gul55
Message-ID: <tencent_0E5DE0122D64CFAD35F51FC3B3433BE94F06@qq.com>
X-QQ-XMAILINFO: NJYJgedmaB0kBtBBkNR9QDgomEawmQAcHUG5e+2Vo/YfAYcOpU9wgiTRHyWc/E
	 TZh5Ka3dz61Qx5UHihaUJfFBowv/+j+fRuyLZz/jlfZci4WInTFEzUsAkzLuuY2tSamMO3ICKG1A
	 xdRkvX7BfKc/QmpW+MYkSXMOgSm6hi+6nzN9hc3rrVA9xWCmYwPvR+JEdmkRvoxkfe7M98QRqhba
	 Jz0kFZ/yQwICeRLRJeSiqefD6mw+oOUoaL/TN+Jfhlj2WoGaFuLBvWHi5uuvxevCl4XP7GSWz5kk
	 eH+h12Xoa3Nd/PKxzPXFD1Jab3Y3vCqs4ju18pl0fMlUgb7Af5uD/9F+BXqoyO2DdbzfS8HHBOIc
	 w6JrgWCNAR3KRxe8n1m1YWgDAAe+9O6J/WVchDcQd1C1nISFNy574+xJXSNl5WIfIWgA3Ovk890N
	 MwTcXRB6qz+Rv+QBjgTLC0HPoOawO46f3SZKhBWa3EhllxgSv8tOkPLCrKdADIhMypkFRJzCme/c
	 mIDBPk7mCQoFsbbFmIclPml7pefqzyl2PY6+jd28DPNqfm0KrrxYVsb6bh/IYFDi+jgkKmsnqt1U
	 nqK2lwF2lHFZ7v4+CIemhIYlcNkzQYEfhdEDXPNVE8YICRDjnE3B3YIlJTt7B2QXja56pt2BsYJ8
	 1iZAlwlBmJHrQA8XI54Rf2Zn/QP8Z+CwiCcs2kSbHe+TIM9kimhhh+uooiyX+gpEjH3h8yJxSu2F
	 huH7/OpfcxXbLw/fAbBq55aWb5V0SQmXUiJtfwmhXo4yzAu3EyBc9a8a6NUl4+qnEXXzbMKu7im4
	 3WzfsKiA6JxJdTTtzv2veovobj9DBJyoMHEQwCSeeTUuBeXGlQiDYOWkejJQSsiaagf+prRd79Vf
	 zrwCnu5UySpp2G3NIVCjdw0D7DdEylH0AlMNCU43QjNU5YjIo7fCpXlTW5nmcPaQaIl3sb5jy68Z
	 WGfhj1x8+KtXmWNLzblp/YsQFetTAmNkFCchwAEABrE4SHMurphmtuHyhjAaKC
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
Sender: yeking@red54.com
From: Yeking@Red54.com
To: alex@ghiti.fr
Cc: Yeking@Red54.com,
	aou@eecs.berkeley.edu,
	dmaliotaki@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	mick@ics.forth.gr,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH] RISC-V: Kconfig: Fix help text of CMDLINE_EXTEND
Date: Mon, 21 Apr 2025 10:16:24 +0000
X-OQ-MSGID: <20250421101624.40970-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4b2a6bf1-3642-431b-bb74-3aeae79d17d3@ghiti.fr>
References: <4b2a6bf1-3642-431b-bb74-3aeae79d17d3@ghiti.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LoongArch (merged):
https://lore.kernel.org/all/tencent_7FAF68BF7A2EAD9BFE869ECFDB837F980309@qq.com/

RISC-V:
https://lore.kernel.org/all/tencent_A93C7FB46BFD20054AD2FEF4645913FF550A@qq.com/

PowerPC:
https://lore.kernel.org/all/tencent_6E57A00F6D56CF8475CF9FD13370FBC1CF06@qq.com/

SH:
https://lore.kernel.org/all/tencent_40B6A6E7C79AEEEFEC79A07DE00724909A05@qq.com/

ARM (rejected):
https://lore.kernel.org/all/tencent_3E8155B4A33D48D6637F16CFE5ED293F0E08@qq.com/

ARM64 (rejected):
https://lore.kernel.org/all/tencent_1873443BEECF45E0336D4C4F8C35C19FEB06@qq.com/

Russell King (Oracle) wrote:
"
ARM gained support for CMDLINE_EXTEND in commit 4394c1244249 ("ARM:
6893/1: Allow for kernel command line concatenation") dated 4 May
2011. In this commit, CONFIG_CMDLINE _prefixes_ the boot loader
supplied arguments.

In commit 34b82026a507 ("fdt: fix extend of cmd line") dated 13
April 2016, which _post_ _dates_ the introduction on ARM, and the
commit even states that it's fixing the lack of appending compared
to ARM, this adds code to drivers/of to _append_ CONFIG_CMDLINE
to the FDT arguments which come from the boot loader.

It is DT that implemented this wrongly.

No, we are not going to change arch/arm to conform to something
that was implemented in a broken way. drivers/of needs fixing
to actually implement it as it was *originally* intended - and
there is five years of arch/arm doing this *before* DT started
to do it.

If drivers/of maintainers also don't want to change, then I'm
sorry, but you have to then put up with the fact that it got
wrongly implemented by drivers/of and thus has a different
behaviour there.
"

