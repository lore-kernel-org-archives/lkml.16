Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29E428DB4F
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288984; cv=none; b=S5+m3JpE6GaN+FUcFJu57/v18MGCSygXHqPH3mCG/66Unj90sj2inmVoestagyJsMJovKCAxsnhUsBw4RvjcqqhgMCIwlziIFp5xYgpmfsAyZ8VHCfx4D1lN3LiHKFdosCamM737quQThHiV7meH4GMi9EcndrHMCbQel1XRlD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288984; c=relaxed/simple;
	bh=35kZcYzz/9LOBblfP10vus4j++96NgpU34q+9r+tf80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UtiUk4El/EmL/oI0h7jexsb7OfwKbzTWZhAhzISoR0rmpODjUCaeboZwLGZ6XpWoaka2H281lkS+D4LU+ZuwR8aHp1BufQOPVqW4mN/l0c8h//IJeG2WHL7NCXJE/geDt2uE5dBFNCq5UKVXZ8anC3aDUNztSjge8gDEBflv4aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cfEIrMHh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9j2DPIkj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cfEIrMHh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9j2DPIkj"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751288981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZhJ6zb19GsA/tbHqYrAYqtbxEY1uCHz3HH4IVAeWXuY=;
	b=cfEIrMHh/YcrK4OmOLlwI/A4V9ojT6LGIxp08FOlNaeaIWpwwXTDlsjgNEW8Z8oweuBZxt
	TpfwWC330P3SyAfbxw2h2QUMjxCBLGjal74MLlXacbQ5mrdhIffmfKqgjyXum/FmZGDU3T
	HmdQViGtehZ7lW2XTIfR34jiGJJVmNku6z5/1OYrpvon7X2IR8DrFWXW0bgXcKeSClRsMU
	PMPK4EFzdHEvqdcTlMQNnfs7fInCsPhWncKUvKwyy/TwW+W1mnVyfJ/R6Gh6vKFgzlhxhg
	QySEDTrzF6Kzy2/FioXUeziLvpU680+ygLUJA13l0qyfZkzzK1hMtda5HDFUFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751288981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZhJ6zb19GsA/tbHqYrAYqtbxEY1uCHz3HH4IVAeWXuY=;
	b=9j2DPIkjg4NrAAvh/9MSkzinoUFUUAFrtIZwvCbZtS5mkg5OCBlEkGUon2HJVDyBPROD6U
	6WEJJThzY/qqhYDw==
Date: Mon, 30 Jun 2025 15:09:35 +0200
Subject: [PATCH] MAINTAINERS: bitmap: add UAPI headers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250630-bitmap-maintainers-uapi-v1-1-f4fae7db5841@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAI6MYmgC/x2MywqAIBAAfyX23IIPiuhXooPpWnvQRCuC6N+TD
 nOYw8wDhTJTgbF5INPFhfdYRbYN2M3ElZBddVBCdaLXAhc+gkkYDMejQrngaRLj4JwVSktvvYd
 ap0ye7/88ze/7AT6HsGppAAAA
X-Change-ID: 20250630-bitmap-maintainers-uapi-8ddc0231fcff
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751288979; l=1135;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=35kZcYzz/9LOBblfP10vus4j++96NgpU34q+9r+tf80=;
 b=1D7TNvfRWPj/b68yimt+IqJHwlQYql9ttORpmqjXB2CvCoz3GpKdyl+ex7ddVHOPmb8h4mQCI
 hgoyYdCLvzTChGxE46iIwzA2WlTKqRF5RxmFb/Zhb7V71wt+freGZKL
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The UAPI headers have been split out from the kernel-only headers.
They maintained as part of the bitmap library.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4bac4ea21b64445069e1518bd906354627dca438..bb1d7642f5085106f9ef6647adee658b5794309f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4181,6 +4181,7 @@ F:	include/linux/cpumask_types.h
 F:	include/linux/find.h
 F:	include/linux/nodemask.h
 F:	include/linux/nodemask_types.h
+F:	include/uapi/linux/bits.h
 F:	include/vdso/bits.h
 F:	lib/bitmap-str.c
 F:	lib/bitmap.c
@@ -4193,6 +4194,7 @@ F:	tools/include/linux/bitfield.h
 F:	tools/include/linux/bitmap.h
 F:	tools/include/linux/bits.h
 F:	tools/include/linux/find.h
+F:	tools/include/uapi/linux/bits.h
 F:	tools/include/vdso/bits.h
 F:	tools/lib/bitmap.c
 F:	tools/lib/find_bit.c

---
base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
change-id: 20250630-bitmap-maintainers-uapi-8ddc0231fcff

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

