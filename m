Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2771A238D
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 05:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751174779; cv=none; b=bvA5+zRvGvtwcJRHOoAVptKL0MCjch6/kZRc/77F+mL2Eknh2M9Gz1Uv0o9+3ETqvENBQGxaEMrtznnX2NYHFEnsTaUDyQeXJ1mCPXsqD4uCKCKJO4Lp2aYd9+SVypB6w95OyyjZUo4G+Nm7A1/uVusXIlnCbhDTYsyKocznuL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751174779; c=relaxed/simple;
	bh=wc6WuuCMBXTYVVfNP4h/5HpW5TFlBV0LHRP1VHveG7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NkxeZiM0uq22s2bkJm89cG+KEP3pnAtGqIDMxYa1zvh2VgJ/WqlOP87ydc1T/LDoBUVw4JzlS32DLfisDC1N4cKnpFLGBAqzU2crwqLRb0o2t16eAl4xSHU7ohZHt4NY2ql0Em66dvpdLmfGg4czk8yUb9CV9kQ9EGrhisg8RdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=RTfKV0kJ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="RTfKV0kJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751174775;
	bh=wc6WuuCMBXTYVVfNP4h/5HpW5TFlBV0LHRP1VHveG7E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RTfKV0kJPOicKxylPwb47E4tjFXSRbfwM8oGWccOaU3Vtx8vKWKoUqG8zupKZTvZD
	 jCuFqzT6Zz8+nVNGXR/ss8O1N02t54pYtzok+JztRkOnAstWnIJrws+Dg9y6DWdUYb
	 PrKAsWhgsTuMcqVORmmPrtmRSHAlcymyG23nYDio=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 29 Jun 2025 07:26:06 +0200
Subject: [PATCH v2 5/7] samples/kobject: add is_visible() callback to
 attribute group
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250629-sysfs-const-attr-prep-v2-5-9ec5fe39083f@weissschuh.net>
References: <20250629-sysfs-const-attr-prep-v2-0-9ec5fe39083f@weissschuh.net>
In-Reply-To: <20250629-sysfs-const-attr-prep-v2-0-9ec5fe39083f@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751174775; l=1331;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=wc6WuuCMBXTYVVfNP4h/5HpW5TFlBV0LHRP1VHveG7E=;
 b=rMiVGOUrIoxdvnhsyRfxZi4GeqrhZqvJgzs5LD6wau344qXHRbvfDl4GS5gidjrao92M2Xzh9
 Et/nA8xY0+bC/27AeYfdwB5mosO98xYGoJyXmcZ1QKzDf2jKdILk8Kh
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

There was no example for the is_visible() callback so far.

It will also become an example and test for the constification of
'struct attribute' later.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 samples/kobject/kset-example.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/samples/kobject/kset-example.c b/samples/kobject/kset-example.c
index 552d7e363539a8f82ab8e0446c732f85ed2c5612..7d8c68763ff8af696cbafaed1d5f1b173bb4860e 100644
--- a/samples/kobject/kset-example.c
+++ b/samples/kobject/kset-example.c
@@ -178,7 +178,22 @@ static struct attribute *foo_default_attrs[] = {
 	&bar_attribute.attr,
 	NULL,	/* need to NULL terminate the list of attributes */
 };
-ATTRIBUTE_GROUPS(foo_default);
+
+static umode_t foo_default_attrs_is_visible(struct kobject *kobj,
+					    struct attribute *attr,
+					    int n)
+{
+	/* Hide attributes with the same name as the kobject. */
+	if (strcmp(kobject_name(kobj), attr->name) == 0)
+		return 0;
+	return attr->mode;
+}
+
+static const struct attribute_group foo_default_group = {
+	.attrs		= foo_default_attrs,
+	.is_visible	= foo_default_attrs_is_visible,
+};
+__ATTRIBUTE_GROUPS(foo_default);
 
 /*
  * Our own ktype for our kobjects.  Here we specify our sysfs ops, the

-- 
2.50.0

