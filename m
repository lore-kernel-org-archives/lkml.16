Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F991FCCFB
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572713; cv=none; b=oB7mq8g7MzmNTu7IL5CZrIGxvldk6vbJdbnAecTuAN6Ss7Lp+JfPEOoXTZKdTssY9Trtcf2PrsrDvlpKJCjoTiJQYNmjMvrbBvcV/XwME4KGJfUfIv8lCpOE992nXyqu4zfIS8Iq1tOpGfQaFLm41YNhq4/JY8QkVL+U6hrA0jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572713; c=relaxed/simple;
	bh=wtPyGsOnqo6rqZA5cXIzoByAuggYFekUK7cyyDI+8fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IUu08fIx9dQuZ8+gD5w0p8oiDMeeFYVrJfhElg/EpNX5cFthkX7RSqHTTVLDGyP+J08dbfaFOar+ddxFRgFM0lLSZnsteDP2FKZOQLChCe/bwalYDnJGeO3QHBQ3SrwdYtdfIqeEjNvtQir8z2OjjHFo1asRULkemM5ARJOZwdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=dfOT3F22; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="dfOT3F22"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-46c8474d8f6so31698981cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 00:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572710; x=1739177510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKPU9Sa0XErJQ269iR1m+yFQ6vBRkGcfLU2YVNEM1yU=;
        b=dfOT3F22kpPkp+a2O3Lg9rA+CWoyG0fKLGyh+C2JVXBLC4djr7VQNqdwshOZrsrsnc
         HaAog7Aw5rjKcf0qVVGLOMgjlsfzXAozRtblaMIISzv0d8wTBIJYi0lMgyV6NYbTT+MI
         8tL5kQDXkcxmYhxwjdrv195Z3dwqokNuyRAtnqjq2OkxUUI3/ZxQQMlRzpV+HkUv02Ef
         VBCGQ9++2+qJoDP6SUwPZAEjmZsNMSzEzZke+sY4PNMWIkbveULUtntVe25IFYABQJI6
         zpCGJ9DiRhlvE/IJV/ESfMw843DnYdnU7SccbXR3p8VgfwZK7psLYSBohnTPv5Px/HHZ
         LgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572710; x=1739177510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKPU9Sa0XErJQ269iR1m+yFQ6vBRkGcfLU2YVNEM1yU=;
        b=QT/ackXkg3H+jK6mfSix8y5VQuR1YooaGBygoplklbGYrsjmVBO0vKkxaQLJzAUxI6
         d+3SeKD7twrzV+sgE72KyDjc2k6AsuZgAfGO6ZBMe6ejsiTg1sEoZN0EdYQancwGi6Fm
         pG3s+oDSd9Vs+dfR5P4mnXNu+KzeBQCz9MKPyh32cvsKpcAxJnnHuHE2M61EDLvHwCoZ
         6onpKfqAKUrhks/CgvrcqZfgqr1oE/ENGLZ084tGxlqLIvPbaaC3jfhTqQUeMhdwFUI+
         KVGOq7DgLTDIfFY+3AUwgt31276Fy7B0C6Hrz0mxrhxkknJgbB6XGjHxilXrHv18K2g8
         ki/A==
X-Forwarded-Encrypted: i=1; AJvYcCX9yQ/u4h7u/GLBmwL75zGIjZgLmyRHlrIg6G0oq9s/e1SMFtTgvd5/TMAW6YCJ073ZWbQdmqrTEgIDuII=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsFepBq9y86hwf9G9EN8RTs+rtgHiLiMQ/WdDjuXMy5z36fxvH
	8rvDMkA95QK8tAHa+HfkWYW3n6dsVreeMyF41syJkqe4qohbM7qgn/m5IlI2mPA=
X-Gm-Gg: ASbGncvw/Lp3tdHGGGcHB0PISJY5fg8PJdOIk8rNKF9+k3igTnvr/i2RujaQL7MkiQj
	5Ujep6gH7gWPY4WC7h+lyqptdo/gckS/lBoxQ4qlM2jfyBPm8gJZ558+e6VjCHRXIQY6BE5W7MT
	UWPukE8tQimYGHZuweTu5Pb0BV9wzvSVa2YRIeSuOxA7s0fNBT4TZ5b6KDpgUOLCby5oNOYgTNv
	Yev1RmbaSOZyT1KiGMeeZz516iXRkt/+1K8ZZ/MAc9RKsB2DkIPCV4qnVqlAt+FSYzY+y+NFHUu
	8xTZseK6Phh1AcNd470PmUfjkmSbBYRoUqZ2SmMy59R+9PbUCNEG8GI=
X-Google-Smtp-Source: AGHT+IEAlKOfPcFGtQpuphtMUGEmXxc2P48rleG0cvQ2g1VY6q+JOVmQhLQFN1AJS8GBnyiR7yIR5Q==
X-Received: by 2002:a05:622a:5a07:b0:467:5f95:679 with SMTP id d75a77b69052e-46fd0b6b509mr303055821cf.42.1738572710457;
        Mon, 03 Feb 2025 00:51:50 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:51:49 -0800 (PST)
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
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [RFC PATCH v2 12/17] ACPI: property: Add support for nargs_prop in acpi_fwnode_get_reference_args()
Date: Mon,  3 Feb 2025 14:19:01 +0530
Message-ID: <20250203084906.681418-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunil V L <sunilvl@ventanamicro.com>

fwnode_get_reference_args() which is common for both DT and ACPI passes
a property name like #mbox-cells which needs to be fetched from the
reference node to determine the number of arguments needed for the
property. However, the ACPI version of this function doesn't support
this and simply ignores the parameter passed from the wrapper function.
Add support for dynamically finding number of arguments by reading the
nargs property value. Update the callers to pass extra parameter.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/property.c     | 15 +++++++++++++--
 drivers/gpio/gpiolib-acpi.c |  2 +-
 drivers/pwm/core.c          |  2 +-
 include/linux/acpi.h        | 12 +++++++-----
 4 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 98d93ed58315..ddea5dec70bd 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -887,6 +887,9 @@ static struct fwnode_handle *acpi_parse_string_ref(const struct fwnode_handle *f
  * @fwnode: Firmware node to get the property from
  * @propname: Name of the property
  * @index: Index of the reference to return
+ * @nargs_prop:	The name of the property telling the number of arguments
+ *		in the referred node. NULL if @num_args is known, otherwise
+ *		@num_args is ignored.
  * @num_args: Maximum number of arguments after each reference
  * @args: Location to store the returned reference with optional arguments
  *	  (may be NULL)
@@ -919,13 +922,14 @@ static struct fwnode_handle *acpi_parse_string_ref(const struct fwnode_handle *f
  * Return: %0 on success, negative error code on failure.
  */
 int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
-	const char *propname, size_t index, size_t num_args,
+	const char *propname, size_t index, const char *nargs_prop, size_t num_args,
 	struct fwnode_reference_args *args)
 {
 	const union acpi_object *element, *end;
 	const union acpi_object *obj;
 	const struct acpi_device_data *data;
 	struct fwnode_handle *ref_fwnode;
+	struct acpi_device *ref_adev;
 	struct acpi_device *device;
 	int ret, idx = 0;
 
@@ -1012,6 +1016,13 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
 							   element->string.pointer);
 			if (!ref_fwnode)
 				return -EINVAL;
+			if (nargs_prop) {
+				ref_adev = to_acpi_device_node(ref_fwnode);
+				if (!acpi_dev_get_property(ref_adev, nargs_prop,
+							   ACPI_TYPE_INTEGER, &obj)) {
+					num_args = obj->integer.value;
+				}
+			}
 
 			element++;
 
@@ -1565,7 +1576,7 @@ acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 			       struct fwnode_reference_args *args)
 {
 	return __acpi_node_get_property_reference(fwnode, prop, index,
-						  args_count, args);
+						  nargs_prop, args_count, args);
 }
 
 static const char *acpi_fwnode_get_name(const struct fwnode_handle *fwnode)
diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 1f9fe50bba00..de8e4d081539 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -839,7 +839,7 @@ static int acpi_gpio_property_lookup(struct fwnode_handle *fwnode,
 	int ret;
 
 	memset(&args, 0, sizeof(args));
-	ret = __acpi_node_get_property_reference(fwnode, propname, index, 3,
+	ret = __acpi_node_get_property_reference(fwnode, propname, index, NULL, 3,
 						 &args);
 	if (ret) {
 		struct acpi_device *adev;
diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index ccd54c089bab..7afd78061e6e 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -1790,7 +1790,7 @@ static struct pwm_device *acpi_pwm_get(const struct fwnode_handle *fwnode)
 
 	memset(&args, 0, sizeof(args));
 
-	ret = __acpi_node_get_property_reference(fwnode, "pwms", 0, 3, &args);
+	ret = __acpi_node_get_property_reference(fwnode, "pwms", 0, NULL, 3, &args);
 	if (ret < 0)
 		return ERR_PTR(ret);
 
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 4e495b29c640..b9fd3c812e1f 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1296,8 +1296,9 @@ static inline int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
 int acpi_dev_get_property(const struct acpi_device *adev, const char *name,
 			  acpi_object_type type, const union acpi_object **obj);
 int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
-				const char *name, size_t index, size_t num_args,
-				struct fwnode_reference_args *args);
+				       const char *name, size_t index,
+				       const char *nargs_prop, size_t num_args,
+				       struct fwnode_reference_args *args);
 
 static inline int acpi_node_get_property_reference(
 				const struct fwnode_handle *fwnode,
@@ -1305,7 +1306,7 @@ static inline int acpi_node_get_property_reference(
 				struct fwnode_reference_args *args)
 {
 	return __acpi_node_get_property_reference(fwnode, name, index,
-		NR_FWNODE_REFERENCE_ARGS, args);
+		NULL, NR_FWNODE_REFERENCE_ARGS, args);
 }
 
 static inline bool acpi_dev_has_props(const struct acpi_device *adev)
@@ -1400,8 +1401,9 @@ static inline int acpi_dev_get_property(struct acpi_device *adev,
 
 static inline int
 __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
-				const char *name, size_t index, size_t num_args,
-				struct fwnode_reference_args *args)
+				   const char *name, size_t index,
+				   const char *nargs_prop, size_t num_args,
+				   struct fwnode_reference_args *args)
 {
 	return -ENXIO;
 }
-- 
2.43.0

