Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C1720E31B
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748577817; cv=none; b=IxYiRWPdY0xmDZV5CUXDriSFl18lqS8xXjAA1GZEHIfaHUanXp3ELWoxKPAwsjGFVk7wtQR03oTIJSCxl/kUI3k3LVtlEOX7uIGvuO9J3AH5WQqfk4FsGoW5wlPL00sroi+U+Kwe4xvcNWtR+pXBNeOJejdGXMjDha9sLihlQYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748577817; c=relaxed/simple;
	bh=dUenq90UtfBa8R0EBUGvlV9x0d9hlq6T8P+rB9uxwWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rn6ejtI/sJr6S+GZZlLc2GLrNIMNQGRX+AZzYLh+e1EWZUa1DzA9IqKFB9dZLLutU1Jhgxs2t8MdoBA5lfC+KuUIS0wi5ccau2DPaHP+tV0ojTrfHqgdIueBTnAWPq4NRPEcjyQagtOa+KZ0CORld/ZI5vTamBm0bJXDv2Sjo+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Xgtu32J3; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Xgtu32J3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1748577803;
	bh=dUenq90UtfBa8R0EBUGvlV9x0d9hlq6T8P+rB9uxwWQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Xgtu32J3ovM8gpTo+yF8DIxOW+22vjx7R8yQ15DjoQR/STBnZZr0DBDf23SSbBYWH
	 a87CuAjMr9C8tIE6o/mBvdtFteM8wTqfhyjS5PRkoGgWfyrhH/rTprRXzuRbKrgJ/e
	 DGZRt81/nl+DlWsx6G2zLFuUCHDOIGrT1YTq/G9I=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 30 May 2025 05:54:40 +0200
Subject: [PATCH v3 6/6] sysfs: remove attribute_group::bin_attrs_new
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250530-sysfs-const-bin_attr-final-v3-6-724bfcf05b99@weissschuh.net>
References: <20250530-sysfs-const-bin_attr-final-v3-0-724bfcf05b99@weissschuh.net>
In-Reply-To: <20250530-sysfs-const-bin_attr-final-v3-0-724bfcf05b99@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748577802; l=1064;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=dUenq90UtfBa8R0EBUGvlV9x0d9hlq6T8P+rB9uxwWQ=;
 b=BdVFIB/ZSb++pscgFyKgGiaXbFsumeHEfkLT1iZ5juVE3Qgxoj3fdsWL5bUUJ/fGdKGlK83+w
 /1DFV3sUYdzDWhowLoAU3JAQlWuPZLtnTMMgFQe0eEvwlR5on0X00xt
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

This transitional field is unused and unnecessary.
Remove it.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/sysfs.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index 7544f6d81c05982b5d168624f376cd647127ab51..9a25a29116528fab77d667390dd3ef5957b86554 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -106,10 +106,7 @@ struct attribute_group {
 					    const struct bin_attribute *,
 					    int);
 	struct attribute	**attrs;
-	union {
-		const struct bin_attribute	*const *bin_attrs;
-		const struct bin_attribute	*const *bin_attrs_new;
-	};
+	const struct bin_attribute	*const *bin_attrs;
 };
 
 #define SYSFS_PREALLOC		010000
@@ -293,7 +290,7 @@ __ATTRIBUTE_GROUPS(_name)
 
 #define BIN_ATTRIBUTE_GROUPS(_name)				\
 static const struct attribute_group _name##_group = {		\
-	.bin_attrs_new = _name##_attrs,				\
+	.bin_attrs = _name##_attrs,				\
 };								\
 __ATTRIBUTE_GROUPS(_name)
 

-- 
2.49.0

