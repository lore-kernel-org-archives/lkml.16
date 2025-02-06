Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD9319CC3E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866114; cv=none; b=LsGvARaoD6F71w14SmIPJOIJLiRga0dRbY4lv23aTzmJhiCeu4v0UG9L7uvcAZoo9KfXsX8iZz3F7vNVmNYFE464moA/AnGaOFUFJ5ASLDRrgwiz9Hi0HdJMVUi4lOwo6FPycp+cp0rfltZmW1Obs5a/tYiHsinvnzWtfuINAh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866114; c=relaxed/simple;
	bh=w+tIK8+0l5BhzRoAP5UEKwhDAiORNA+a1qua81/n1Cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oaV+ozoH0dZWxkFnoXoYt/kzPJeL/VL2Ar0NqmRDqozdSk/V403EQwn4eskqxAE4d0lj0xNBOJiUhZVWjVT/PG2sNFbgM7x23tDgelDJ/jHq2zpvTTZKvAfi/oa5FR0CRxrXa78wLyDRtuV/t+FlWpnQ0d7eqVrB9yqzyDNrpSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st; spf=pass smtp.mailfrom=marcan.st; dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b=RCLSyfSo; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="RCLSyfSo"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 4BE5F3FA6A;
	Thu,  6 Feb 2025 18:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1738866108; bh=w+tIK8+0l5BhzRoAP5UEKwhDAiORNA+a1qua81/n1Cs=;
	h=From:Date:Subject:To:Cc;
	b=RCLSyfSoXCAG3kJgf3lFz39Qq6pbAuSQVNpu2/3AZHuKaFV24Fl74RbxG7x/onwAY
	 Ja5w+tWRhtysA784lWOjtS1SoGKsXonGIAmaHDvE8PLF5dI5BBfWdGREb+wyLr6O5c
	 x18uFA7nDJ46HprMd+xxiEc9eZoZb1IZddzU2qeD3cF4ki1AdE30sk138TmFbGUjna
	 io9q7903dJG94s9owhzrCSvNOn+MkKWCHkUGtmUMlSrQdV9ZkPehKyjofEPXIH0080
	 /e9RUbDd12ZHG9n3bVmoXWEKM+WwdOF3CjliExrxrpLR25d1S4WztyqRgykLC1xBz0
	 VlNaI5lsOa0Sg==
From: Hector Martin <marcan@marcan.st>
Date: Fri, 07 Feb 2025 03:21:46 +0900
Subject: [PATCH] MAINTAINERS: Remove myself
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-rm-maint-v1-1-10f069a24f3d@marcan.st>
X-B4-Tracking: v=1; b=H4sIALn9pGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNz3aJc3dzEzLwS3cQ082QgMDKyMDdUAiovKEpNy6wAGxUdW1sLAIV
 A0VtaAAAA
X-Change-ID: 20250207-rm-maint-af7cccc22871
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 soc@lists.linux.dev, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1068; i=marcan@marcan.st;
 h=from:subject:message-id; bh=w+tIK8+0l5BhzRoAP5UEKwhDAiORNA+a1qua81/n1Cs=;
 b=owGbwMvMwCUm+yP4NEe/cRLjabUkhvQlf3ezrXGdPF1zqoJ5WKiloq/YyxfRaheVGfkmqm29O
 O+j2UvmjlIWBjEuBlkxRZbGE72nuj2nn1NXTZkOM4eVCWQIAxenAEzE/BfD/3iJCy0urBe+St1i
 nfGLoeFDl9eT8wUZvcJfV7L9OsSvEMnwT0H+1nEOBkuxnHSh8/r/cmos5nwyu87w7/ufmfa/HeZ
 sZgAA
X-Developer-Key: i=marcan@marcan.st; a=openpgp;
 fpr=FC18F00317968B7BE86201CBE22A629A4C515DD5

I no longer have any faith left in the kernel development process or
community management approach.

Apple/ARM platform development will continue downstream. If I feel like
sending some patches upstream in the future myself for whatever subtree
I may, or I may not. Anyone who feels like fighting the upstreaming
fight themselves is welcome to do so.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b13d8bbe6bf133ba7b36aa24c2b5e0..c9623439998709c9d6d6944cbd87e025356422da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2177,7 +2177,6 @@ F:	sound/soc/codecs/cs42l84.*
 F:	sound/soc/codecs/ssm3515.c
 
 ARM/APPLE MACHINE SUPPORT
-M:	Hector Martin <marcan@marcan.st>
 M:	Sven Peter <sven@svenpeter.dev>
 R:	Alyssa Rosenzweig <alyssa@rosenzweig.io>
 L:	asahi@lists.linux.dev

---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20250207-rm-maint-af7cccc22871

Best regards,
-- 
Hector Martin <marcan@marcan.st>

