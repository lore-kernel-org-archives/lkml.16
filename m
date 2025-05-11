Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B98525742D
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 13:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970926; cv=none; b=QpOhwM6ZaIOTnEVHQkhHiiu7gKAC+65JDJqzkMxpgQTrGSzcd/f97yixie8u7SmgSe7Gv03lyzdpAdcrSf3jhrO4lwKi+TNMR7+yjES2PSHsv2NSaUoshsoCVzoitV0Hl8YCvCQn0idO1rFVv4HK7ziELE1VPQDPgdM2s4N4FkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970926; c=relaxed/simple;
	bh=r0mE0AleBdKzCrmB1zJPeLDlR9s2LH9eMjrYyAtQr1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qvmRKt6u5yDldnOVBN9yMFz3cGuagugXuhOBl7BhKDG9uKZ49KDqfhLQ/K2UgX8Eb1rwb6GgOhM7vtoD/V7wlO5SdsTOwZDK8HFnv8JF7TxDKWLW1KfJXA19n/D6kVLXETrKCR5tesAQRUxLYbsBj4sX+zWV09MUqzfZQEPqdK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Y8qUzeoh; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Y8qUzeoh"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22e6a088e16so25379465ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 06:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970924; x=1747575724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCjUB/xHP3F4lexC15SuUPpKkgJMb+cdYU5YhyAWuJ0=;
        b=Y8qUzeohuRfrWs//H+ds61EMaEWPO5MlqmM86dazSacCEeNLqEmYT0ZXsq0SLtAeKz
         u3N9svUJpGYqyop/Ul4zsO8cE3uSud9QP82TXux+H1/ROa96BKPLLoFsYcgCP534/ejK
         FEJy6LRGLAxprgIuSS5iH38nW3vW+V868Z2mmWxuqmtf7OlDdT+sqdpBSQqG0MFxnTjg
         UiF8xke0ByjQbOGpkO+Ja7p2pqdPelO0ncyAnDOvJwTqBvYsHoUMz6JkKUfPP69J6YA0
         FWnDKGmQ/qsH3pBISja696ArWFaZT1GbnQDeQ2QYiYiQ96ntJKm093XTsuJb1HL/5A/n
         hyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970924; x=1747575724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fCjUB/xHP3F4lexC15SuUPpKkgJMb+cdYU5YhyAWuJ0=;
        b=wJcuV+drYlhB14G1dkVKxKiAtW8wr56kuZXiizjJ00uD0ZaDeuD3kt6v2CVdaQVN4A
         RQufjlqcRaszjx4rDiqndw6oSQ0ilw90egcsX4O229mjyDe6cuPmahRvxZ39oKiv+AJH
         hEfn/n13V8aF65aMpFT7KBlE7qzog148/r1Eynjtqchq2TWb4WZANhfOYmOsuX+tLkeQ
         ayIWvOI9q5qJF+wxErT04eE0Pu3gYbeKed/GIapQXp5mXQC8dLWtZPoHq+WQEM1EQXLJ
         BlDHFbFk6wYfZyGmQoCjVR0uRYjkNfB8vdp0PSVNhPb756l0o1vd8u+RP9cUZXDw1ijW
         ZFVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGS9UFTr7YzRhBOlC/eaO7qm2JI49W0hW1GAFy/brKPTQsBirM0d0d5ekDndzzG2hCE2BFNJUwQsnQUWE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg6TdrpJOXaM/Bsoc9POw+QPOzwbjTxVG9dKlGfo8o/nblkJap
	pJJ3nCqVt8v6OVnO91yFUnIwG0AjmjqPX68DjwoLSKfOPn6roemZ9ohvy/f7QqI=
X-Gm-Gg: ASbGnct66Npt1AQc4eqd0hQib4RbD6spt1dzz/nu8cG4jZtlGxe4ME89NZmwf6NClHZ
	ssgWw1x8pYkKvQMtIma0tmwWn7qROaJl5ZG9rmzKUJUjfXjXntLCgeEI3FGFaCLgcOLpm7tV4m1
	WY87iPvcgu2XSYpV9LAL92/zxj2erpkLXz6+YANtlNUcG6T9AwFhyN0Pma4bn/tml6cNluJRrQI
	1VNbieEmhzQu3I6cX9AfECZf30Vz6B/62SW8ZGwjNUmeV+iATd/7zVoWr1Y5WKYgwjtzla+wp26
	haQ6/GGe5uf43uZJo/8Jk7AnGyWcsrlHkWvxH3ZYNCELlnIdtZ5vmwmHoZKL1MmZUIhQIrrjmlB
	Uyx/2Jdrhl1FxrxWcAanCQFdA
X-Google-Smtp-Source: AGHT+IFMx/VWg5T7jyPRxbypm5h/qHJrEm48g/FhkYBfFVU32uDFENhdL9cY2ghotviQvipOT7WehQ==
X-Received: by 2002:a17:902:fc8d:b0:22e:457d:3989 with SMTP id d9443c01a7336-22e845bcb87mr224010915ad.0.1746970923496;
        Sun, 11 May 2025 06:42:03 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:42:02 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/23] ACPI: property: Refactor acpi_fwnode_get_reference_args()
Date: Sun, 11 May 2025 19:09:30 +0530
Message-ID: <20250511133939.801777-15-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunil V L <sunilvl@ventanamicro.com>

Currently acpi_fwnode_get_reference_args() calls the public function
__acpi_node_get_property_reference() which ignores the nargs_prop
parameter. To fix this, make __acpi_node_get_property_reference() to
call the static acpi_fwnode_get_reference() so that callers of
fwnode_get_reference_args() can still pass a valid property name to
fetch the number of arguments.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/property.c | 103 ++++++++++++++++++++--------------------
 1 file changed, 51 insertions(+), 52 deletions(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 436019d96027..364c58faf13f 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -882,45 +882,10 @@ static struct fwnode_handle *acpi_parse_string_ref(const struct fwnode_handle *f
 	return &dn->fwnode;
 }
 
-/**
- * __acpi_node_get_property_reference - returns handle to the referenced object
- * @fwnode: Firmware node to get the property from
- * @propname: Name of the property
- * @index: Index of the reference to return
- * @num_args: Maximum number of arguments after each reference
- * @args: Location to store the returned reference with optional arguments
- *	  (may be NULL)
- *
- * Find property with @name, verifify that it is a package containing at least
- * one object reference and if so, store the ACPI device object pointer to the
- * target object in @args->adev.  If the reference includes arguments, store
- * them in the @args->args[] array.
- *
- * If there's more than one reference in the property value package, @index is
- * used to select the one to return.
- *
- * It is possible to leave holes in the property value set like in the
- * example below:
- *
- * Package () {
- *     "cs-gpios",
- *     Package () {
- *        ^GPIO, 19, 0, 0,
- *        ^GPIO, 20, 0, 0,
- *        0,
- *        ^GPIO, 21, 0, 0,
- *     }
- * }
- *
- * Calling this function with index %2 or index %3 return %-ENOENT. If the
- * property does not contain any more values %-ENOENT is returned. The NULL
- * entry must be single integer and preferably contain value %0.
- *
- * Return: %0 on success, negative error code on failure.
- */
-int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
-	const char *propname, size_t index, size_t num_args,
-	struct fwnode_reference_args *args)
+static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
+					  const char *prop, const char *nargs_prop,
+					  unsigned int args_count, unsigned int index,
+					  struct fwnode_reference_args *args)
 {
 	const union acpi_object *element, *end;
 	const union acpi_object *obj;
@@ -933,7 +898,7 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
 	if (!data)
 		return -ENOENT;
 
-	ret = acpi_data_get_property(data, propname, ACPI_TYPE_ANY, &obj);
+	ret = acpi_data_get_property(data, prop, ACPI_TYPE_ANY, &obj);
 	if (ret)
 		return ret == -EINVAL ? -ENOENT : -EINVAL;
 
@@ -999,7 +964,7 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
 
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
 						acpi_fwnode_handle(device),
-						&element, end, num_args);
+						&element, end, args_count);
 			if (ret < 0)
 				return ret;
 
@@ -1017,7 +982,7 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
 
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
 						ref_fwnode, &element, end,
-						num_args);
+						args_count);
 			if (ret < 0)
 				return ret;
 
@@ -1039,6 +1004,50 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
 
 	return -ENOENT;
 }
+
+/**
+ * __acpi_node_get_property_reference - returns handle to the referenced object
+ * @fwnode: Firmware node to get the property from
+ * @propname: Name of the property
+ * @index: Index of the reference to return
+ * @num_args: Maximum number of arguments after each reference
+ * @args: Location to store the returned reference with optional arguments
+ *	  (may be NULL)
+ *
+ * Find property with @name, verifify that it is a package containing at least
+ * one object reference and if so, store the ACPI device object pointer to the
+ * target object in @args->adev.  If the reference includes arguments, store
+ * them in the @args->args[] array.
+ *
+ * If there's more than one reference in the property value package, @index is
+ * used to select the one to return.
+ *
+ * It is possible to leave holes in the property value set like in the
+ * example below:
+ *
+ * Package () {
+ *     "cs-gpios",
+ *     Package () {
+ *        ^GPIO, 19, 0, 0,
+ *        ^GPIO, 20, 0, 0,
+ *        0,
+ *        ^GPIO, 21, 0, 0,
+ *     }
+ * }
+ *
+ * Calling this function with index %2 or index %3 return %-ENOENT. If the
+ * property does not contain any more values %-ENOENT is returned. The NULL
+ * entry must be single integer and preferably contain value %0.
+ *
+ * Return: %0 on success, negative error code on failure.
+ */
+int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
+				       const char *propname, size_t index,
+				       size_t num_args,
+				       struct fwnode_reference_args *args)
+{
+	return acpi_fwnode_get_reference_args(fwnode, propname, NULL, index, num_args, args);
+}
 EXPORT_SYMBOL_GPL(__acpi_node_get_property_reference);
 
 static int acpi_data_prop_read_single(const struct acpi_device_data *data,
@@ -1558,16 +1567,6 @@ acpi_fwnode_property_read_string_array(const struct fwnode_handle *fwnode,
 				   val, nval);
 }
 
-static int
-acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
-			       const char *prop, const char *nargs_prop,
-			       unsigned int args_count, unsigned int index,
-			       struct fwnode_reference_args *args)
-{
-	return __acpi_node_get_property_reference(fwnode, prop, index,
-						  args_count, args);
-}
-
 static const char *acpi_fwnode_get_name(const struct fwnode_handle *fwnode)
 {
 	const struct acpi_device *adev;
-- 
2.43.0

