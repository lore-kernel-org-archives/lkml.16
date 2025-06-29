Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62E81E32D6
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 05:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751174783; cv=none; b=Lx2I7gwTvcqvm2AnKdwi3yZNXVPSvTP/FnjNB9bSrQzPw/ZzTTijEoK+TzR0Fedwbdm7Si45xnsngmaMOyZbbWRELvIcAnOZvC3uL+tXemlHvrI0byQqfOD1g3m/T0MOAwxoeyvveE0iQ4ldJRZWZJ3Xl0qYZSmenFjJpGvctkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751174783; c=relaxed/simple;
	bh=8g5yIzSYG2g8++UrRc0gw8uBKh1L7UBCsynjZqQUmF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qgUm6D4pRQABj+IVH5jRex5JJFnblD9v+q/D3NIkGbZ42u3WJQlJVVopIHZ1Ta+WnUmjkNZ5rRnITsxai+c/HlGfK7NN0A+Nn6Z204AbpM9pO9O05XZvHp/jtZhgOarGVrg4/Hx1/a4H+b9RWEksQEenkn1BZK93ogL3VhkQ4uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ZOWXpJ+v; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ZOWXpJ+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751174775;
	bh=8g5yIzSYG2g8++UrRc0gw8uBKh1L7UBCsynjZqQUmF8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZOWXpJ+vsGlBwME8/KSdgrpvbdaDI3O7P1ZB5A15LVSZ9Y+u61dtgij4M7ZZBrQK3
	 4NjQ7C0l5ChK158U+hNpNA5vjsSmahJXlvHQ9+rRunaYhUI/3JzgQO3pFN1np8Z/35
	 fW0i9m+YEC02MJAe6+VKqqqeDQOv/kxKQNR2LbF4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 29 Jun 2025 07:26:03 +0200
Subject: [PATCH v2 2/7] sysfs: transparently handle const pointers in
 ATTRIBUTE_GROUPS()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250629-sysfs-const-attr-prep-v2-2-9ec5fe39083f@weissschuh.net>
References: <20250629-sysfs-const-attr-prep-v2-0-9ec5fe39083f@weissschuh.net>
In-Reply-To: <20250629-sysfs-const-attr-prep-v2-0-9ec5fe39083f@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751174775; l=1101;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=8g5yIzSYG2g8++UrRc0gw8uBKh1L7UBCsynjZqQUmF8=;
 b=7hHyM//h1Fc5wiKoKowcjyOWzhcNsfAxwGmTlYKXYjmdv8GezNO9V79gfMp0rd86PB7R+erpJ
 P30dS3JQQL9A+Z2U0moUNY6FPH1Ou8kWFfD6QgsaYHKolz/DOCEuRXI
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

To ease the constification process of 'struct attribute', transparently
handle the const pointers in ATTRIBUTE_GROUPS().
A cast is used instead of assigning to .attrs_new as it keeps the macro
smaller. As both members are aliased to each other the result is
identical.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/sysfs.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index a47092e837d9eb014894d1f7e49f0fd0f9a2e350..118a9b1d3b3e7528fb213d83f85d31bbac0dc309 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -290,7 +290,12 @@ static const struct attribute_group *_name##_groups[] = {	\
 
 #define ATTRIBUTE_GROUPS(_name)					\
 static const struct attribute_group _name##_group = {		\
-	.attrs = _name##_attrs,					\
+	.attrs = _Generic(_name##_attrs,			\
+			  struct attribute **:			\
+				_name##_attrs,			\
+			  const struct attribute *const *:	\
+				(void *)_name##_attrs		\
+	),							\
 };								\
 __ATTRIBUTE_GROUPS(_name)
 

-- 
2.50.0

