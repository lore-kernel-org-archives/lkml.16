Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1496229B27
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750417982; cv=none; b=Iq3J7GbTbZKG1vkrjhRj5Bb9cQDeBL9Xv3Ny1IzzzF2euqPfh/wofmv3tL/941XPOAH2tDqEJFVOmM1sObm6YzaGBd5VdKwFctrC6uBZQBQ1ikTOp7aBVZ0ZuZQguns5o5378578uTKWVF4rq2ijKoQOGpUbXhappopADHfll84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750417982; c=relaxed/simple;
	bh=Z+FfhbY2dIQj1OgYnBauCW6kLhQRKO0ds9VLINPnkqc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OFZXpco1pfFiDkwvPGmUvZINgnX7U5ighNIaxg2k1cIcLk6Vo1iND/JCIEH2qnSPonX08DKNbaWaha7VpBNBTJHQEoVD6XudnFZqmjyrs7HkK9GhFCnLi6NLWCHD7I1KNU06iujPm+qB9PbsoTYpBPYHoNYZ16IRp7WWNmXDWVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDyuj5Ew; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDyuj5Ew"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD33AC4CEE3;
	Fri, 20 Jun 2025 11:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750417982;
	bh=Z+FfhbY2dIQj1OgYnBauCW6kLhQRKO0ds9VLINPnkqc=;
	h=From:To:Cc:Subject:Date:From;
	b=BDyuj5EwAviEGIEXuSCZoHjBq2v3OJqRI81UdNRoIs3x6p2SKoHURMU6pCVK+VuIr
	 PajUfp+Qg5iXaO11tioHL7nHhYflpctwSW6WBJWdv2M5toGaiyb8g5cT1optX3reHK
	 UTDNEClf1FJnA3VCEfkA9Bls/jNtm1T0q7CSNXa4bv3LQU0nDyadFoTLm14UpuPIZB
	 jzfU2iFmNOtJ4yCXzklVHh1UxxUr7uAsjPDYLW2r2iV2VJEvHdW03xtbGWvpUv6kvJ
	 VqsnqG2j0xf4Q1wy9RO0HgPdFJK8FaBubZbQ8NDSEGmPC0KW4saB9qlukrwrYsfBZC
	 /UJlW2X1sLPYQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Abbott Liu <liuwenliang@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: export __memset/__memcpy/__memmove
Date: Fri, 20 Jun 2025 13:12:44 +0200
Message-Id: <20250620111257.3365489-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When KASAN is locally disabled for one file, the string functions
get redirected to internal helpers, but those are not actually exported,
so this only works in built-in code but fails for loadable modules:

ERROR: modpost: "__memset" [crypto/ecc.ko] undefined!
ERROR: modpost: "__memcpy" [crypto/ecc.ko] undefined!

Add the missig exports.

Fixes: d6d51a96c7d6 ("ARM: 9014/2: Replace string mem* functions for KASan")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/kernel/armksyms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/kernel/armksyms.c b/arch/arm/kernel/armksyms.c
index 82e96ac83684..1ff50106afa4 100644
--- a/arch/arm/kernel/armksyms.c
+++ b/arch/arm/kernel/armksyms.c
@@ -83,10 +83,13 @@ EXPORT_SYMBOL(__raw_writesl);
 EXPORT_SYMBOL(strchr);
 EXPORT_SYMBOL(strrchr);
 EXPORT_SYMBOL(memset);
+EXPORT_SYMBOL(__memset);
 EXPORT_SYMBOL(__memset32);
 EXPORT_SYMBOL(__memset64);
 EXPORT_SYMBOL(memcpy);
+EXPORT_SYMBOL(__memcpy);
 EXPORT_SYMBOL(memmove);
+EXPORT_SYMBOL(__memmove);
 EXPORT_SYMBOL(memchr);
 
 EXPORT_SYMBOL(mmioset);
-- 
2.39.5

