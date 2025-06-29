Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B22316E863
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 05:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751174779; cv=none; b=FFlDwrU4Ugbxi6Dqvzy8b/qr8hTR5qf2v8F3bYGYtnPvDhybV2Vq9XKU2BVRoFQyMJ04beGdUjH/b9BkP+OCuZnRKJWJBkNzwHyYKbZqAti+g1Vdq4kgaRir9Kc0MKcp6wAxl12/B09yxN24hM/l3wq1uanKt+OJwz0GwAqOwUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751174779; c=relaxed/simple;
	bh=m/hm5AxnEzLyalI9RPOnF4DqFLU60o5NaKsO89W4g3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ViJvJwXVMj8B90EBqlKhUiCgcW+jdPLShiOWJmzQmyfVsiMaHtuTiO3gvlNXl7fePt0zGEiBJAVntjq1CtUEB0zw9kWMDGGRAma+5jFqbr2uvWDz47LleSs7wJtV1JQ2hd1zNUGDJDvLY5dW0TAG50+yBG0GBMsN7iHoHHz1G2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=T4JH0E7l; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="T4JH0E7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751174775;
	bh=m/hm5AxnEzLyalI9RPOnF4DqFLU60o5NaKsO89W4g3M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=T4JH0E7lobBQdHq3PRkLuspZaPV69ZJ776SQfYlFJRiU8y+DeHPLXUJNa926+j4zm
	 fMamd/846giCIh75LXjMhj+v/sF1QuNSLqbsOWKamRzLRhkb4b5X0hLz97a4S2gMJA
	 Ud9Ibr/5ypTn31gFakH+o/YJWYHCIuZfpYo3ONsk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 29 Jun 2025 07:26:08 +0200
Subject: [PATCH v2 7/7] sysfs: simplify attribute definition macros
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250629-sysfs-const-attr-prep-v2-7-9ec5fe39083f@weissschuh.net>
References: <20250629-sysfs-const-attr-prep-v2-0-9ec5fe39083f@weissschuh.net>
In-Reply-To: <20250629-sysfs-const-attr-prep-v2-0-9ec5fe39083f@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751174775; l=2010;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=m/hm5AxnEzLyalI9RPOnF4DqFLU60o5NaKsO89W4g3M=;
 b=/s1dKNRoWQI3p7Vz5QRYq8OQzniXsCsvWqTnyheBXvPWjYEhdGumuLU7sE3OM3qapo0VKNkX8
 OAWDsmVlVgeB+SXDdPTs4iBn9ndq4SlKPd17qkLeOmr1J/cCDi4Q7FB
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Define the macros in terms of each other.
This makes them easier to understand and also will make it easier to
implement the transition machinery for 'const struct attribute'.

__ATTR_RO_MODE() can't be implemented in terms of __ATTR() as not all
attributes have a .store callback.
The same issue theoretically exists for __ATTR_WO(), but practically it
does not occur inside the current tree.

Reorder __ATTR_RO() below __ATTR_RO_MODE() to keep the order of the
macro definition consistent with respect to each other.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/sysfs.h | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index 1807b0369bd4d993deab81c4497903468b751a19..2d6f984e10a96ab9916024ae7b72458edf0c5bd6 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -254,28 +254,20 @@ struct attribute_group {
 	.store	= _store,						\
 }
 
-#define __ATTR_RO(_name) {						\
-	.attr	= { .name = __stringify(_name), .mode = 0444 },		\
-	.show	= _name##_show,						\
-}
-
 #define __ATTR_RO_MODE(_name, _mode) {					\
 	.attr	= { .name = __stringify(_name),				\
 		    .mode = VERIFY_OCTAL_PERMISSIONS(_mode) },		\
 	.show	= _name##_show,						\
 }
 
-#define __ATTR_RW_MODE(_name, _mode) {					\
-	.attr	= { .name = __stringify(_name),				\
-		    .mode = VERIFY_OCTAL_PERMISSIONS(_mode) },		\
-	.show	= _name##_show,						\
-	.store	= _name##_store,					\
-}
+#define __ATTR_RO(_name)						\
+	__ATTR_RO_MODE(_name, 0444)
 
-#define __ATTR_WO(_name) {						\
-	.attr	= { .name = __stringify(_name), .mode = 0200 },		\
-	.store	= _name##_store,					\
-}
+#define __ATTR_RW_MODE(_name, _mode)					\
+	__ATTR(_name, _mode, _name##_show, _name##_store)
+
+#define __ATTR_WO(_name)						\
+	__ATTR(_name, 0200, NULL, _name##_store)
 
 #define __ATTR_RW(_name) __ATTR(_name, 0644, _name##_show, _name##_store)
 

-- 
2.50.0

