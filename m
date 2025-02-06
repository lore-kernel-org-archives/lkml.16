Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D391A23716A;
	Thu,  6 Feb 2025 16:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859530; cv=none; b=GsiRjy+z7Omlzl4hdou8qWafyhXjJTgsl60i+EyCf2N3sxwMhZAdZJz6F/iS6bkN4tcBdkyCtnVI3RQcEHiHcf3Gjo6W8/+ndoZkinrmgMQuksrhBAjuM1CVlUklvJLL5yH2ZD/KV68wpn4G+kM/5HB0q29flzx1xYW6xHzT1Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859530; c=relaxed/simple;
	bh=klVc8VEUvBljdOf4y78l6KZlFsamjNo8gFQARK+fEkA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e99jEIgwVCPL1ciit4b+Z+QOpK8hq+vMIQXpJQi/bn3vR4Pn0s4/xqf4eRGP4n0QInY5PeZK3G/mzOhn3+4LTgTJt3ZNaLPiOvF5xopL81ElE+i427sAp1dLzQ1nH+HBtqG/5410SJLOL7DNtM9LrRXqmUB3cB5XW6vAZPT2wuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=DJUGypL8; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="DJUGypL8"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 848561FA0A;
	Thu,  6 Feb 2025 17:32:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1738859525;
	bh=tcfEFsnmRyRIy3DA6veMUz6QDEx5ba7KNa5BRJ4zmM4=; h=From:To:Subject;
	b=DJUGypL8ShnBPmdv/03FeFwH8jaYZkqyb99W7UAMNgJEDDf8eoC3sYdX5uNz+AGY2
	 /OHO2DAYce+6AO+XhaAr0vGp38VN0SJT0oKc8IjQPJiMx3a4Qpwdt3ftJePnxpAqdw
	 GNokCk8K6ThNc2uN7wecEU7NNrtQ1phpy2l7Hd3f0RJFNtcvPBymhTiCywa6otRn8A
	 OQOoe490TflfDXFnNllBzn84yzOi42oY4aWQQBUOcX4MeNA6BHO1kJY/XNmCni7MGt
	 er/p43g4gplUa4oS0J6EDcf5fggj3NylHY0LYCfOnZnHnpGpF23lGpLIGWegJE9aF0
	 6eNFuruo3vsww==
From: Francesco Dolcini <francesco@dolcini.it>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1 1/5] of: Add of_property_read_u16_index
Date: Thu,  6 Feb 2025 17:31:48 +0100
Message-Id: <20250206163152.423199-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250206163152.423199-1-francesco@dolcini.it>
References: <20250206163152.423199-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

There is an of_property_read_u32_index and of_property_read_u64_index.
This patch adds a similar helper for u16.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/of/property.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/of.h    |  9 +++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 208d922cc24c..c1feb631e383 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -147,6 +147,39 @@ static void *of_find_property_value_of_size(const struct device_node *np,
 	return prop->value;
 }
 
+/**
+ * of_property_read_u16_index - Find and read a u16 from a multi-value property.
+ *
+ * @np:		device node from which the property value is to be read.
+ * @propname:	name of the property to be searched.
+ * @index:	index of the u16 in the list of values
+ * @out_value:	pointer to return value, modified only if no error.
+ *
+ * Search for a property in a device node and read nth 16-bit value from
+ * it.
+ *
+ * Return: 0 on success, -EINVAL if the property does not exist,
+ * -ENODATA if property does not have a value, and -EOVERFLOW if the
+ * property data isn't large enough.
+ *
+ * The out_value is modified only if a valid u16 value can be decoded.
+ */
+int of_property_read_u16_index(const struct device_node *np,
+				       const char *propname,
+				       u32 index, u16 *out_value)
+{
+	const u16 *val = of_find_property_value_of_size(np, propname,
+					((index + 1) * sizeof(*out_value)),
+					0, NULL);
+
+	if (IS_ERR(val))
+		return PTR_ERR(val);
+
+	*out_value = be16_to_cpup(((__be16 *)val) + index);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_property_read_u16_index);
+
 /**
  * of_property_read_u32_index - Find and read a u32 from a multi-value property.
  *
diff --git a/include/linux/of.h b/include/linux/of.h
index eaf0e2a2b75c..5e52d90f6408 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -314,6 +314,9 @@ extern struct property *of_find_property(const struct device_node *np,
 extern bool of_property_read_bool(const struct device_node *np, const char *propname);
 extern int of_property_count_elems_of_size(const struct device_node *np,
 				const char *propname, int elem_size);
+extern int of_property_read_u16_index(const struct device_node *np,
+				       const char *propname,
+				       u32 index, u16 *out_value);
 extern int of_property_read_u32_index(const struct device_node *np,
 				       const char *propname,
 				       u32 index, u32 *out_value);
@@ -627,6 +630,12 @@ static inline int of_property_count_elems_of_size(const struct device_node *np,
 	return -ENOSYS;
 }
 
+static inline int of_property_read_u16_index(const struct device_node *np,
+			const char *propname, u32 index, u16 *out_value)
+{
+	return -ENOSYS;
+}
+
 static inline int of_property_read_u32_index(const struct device_node *np,
 			const char *propname, u32 index, u32 *out_value)
 {
-- 
2.39.5

