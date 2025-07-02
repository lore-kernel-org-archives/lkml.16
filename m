Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACC421C19D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 05:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433363; cv=none; b=ddAxnsL7yDg3Gux11/hYXXd+s5Ost57OKQ7G8ETr8TOhDCYuqMwc3XjIXp0mZ0QBTg5gqmplj8Q8Bd3rUEoPM9pyL4H+tI/qBYeKh7GdIbQJN7t+j/yGyZjhmU0H/9RURSqKE1avdSA1Cg/L6rROwTSImhfLPpa91YiGL5bh+1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433363; c=relaxed/simple;
	bh=jN6vr49WydQekpKegVkjH3kRWbiat3b6Jw7xzzte404=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JwbMNVfdPKohQs8HylJQdsYr0iiIcJxwzzCBNltOGzgHshxmZnver7HFtwUVjxuhToeVSdA73PO8O9JQWK5jEuJOY580/DD/VvYu/fyQpXhMsIXLHmeuXRqTgQ3H5XeqJqztMxxDXhQ6QmXivRElz2axF8Lr05KwwJDMgDtoY7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=TkeEvLIW; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="TkeEvLIW"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-237e6963f63so25525875ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 22:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433361; x=1752038161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QmlL9kMvvcYcWlU45z5MYmmVSDmE1amNKft2tyH29n8=;
        b=TkeEvLIWFDN+/Cx7PbRqqnWqGlFU9US+Q4PiaWrRD9Y76t41oG3Laeb507aBjoY0Ei
         sADyFMM2mrrlv3IK0NPUFJsgqekO15ClMFT0wW5U2lO/LV/wrudF4x8YbncksRcGkw4Z
         wzKhrzPifSPxhqex94PS5/bUtj0vk9zYC4k/aOq8yLo3iX9oOCnq/x2LWsqxme+83kyw
         lsPA99a0dLUvaA1sra0BRGmiKA3oWAChSuKmOh3QZpmRVsCdVO54gSWUR3c3TUYkOqN+
         TPk4lyaQgKHIAgkuIW0HPmu7tQEDnrNv9oMba0HDWyE/qSSemVmEZYaAdgyyOISMi1tf
         qqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433361; x=1752038161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QmlL9kMvvcYcWlU45z5MYmmVSDmE1amNKft2tyH29n8=;
        b=De41xXDHPL814z9AkeBrQt/yTcwQs1oKHRhxwoDaxkocXljbwbPm/1dkp9+MNC85ct
         hB/liQ8hlZm69z5MLeqmWb9RyPlFWtzWuTE/4f7nhWcvAaURCVKzHninSyWh05JC+6gd
         cILD0uSH9VOJJRjjTNroT1Dwg/Et8oN6gNeRkFzwRSxC2uD6sBCukWkFebVQBKJ7lsrK
         TDLZXArDIljJHCw9VFol3E/V8pwT1nSj15ksmjU+YipfOJshbpgK7cSNxuH3ZyfYulqT
         jY3v9SKx4rc5Zlqw9Pt0kdt7LHZ1SHlnHNvk4vfK5ih9uh6CaD+VUxfl2L9HDspZgtqB
         yPXw==
X-Forwarded-Encrypted: i=1; AJvYcCUPX5ck85LaF4nvZGg3i3ULjjzsSgAP7JBJqWizDP1XAt4VrTD+iTiQSHvFGjcynnpzrJ3jCnCkQFm8DUE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf1lFWQaRHz7UWmclbGpw7QcLNu7hDmJsMl8HTMRku+CqHKMCK
	iw7aYvAkXfe8heuIXcbzcmt26GhSkZmoamv/g/QMDjvDfS8F12OvC3gkBG2zBNLFXkY=
X-Gm-Gg: ASbGnctnOdkCn5qTDNBUUK/aJ6ITbCpnJgwasH/KD8jTe7oNzQ96aUas/zBNNsSc4Ke
	cvlCi/lp/NQmbRNDj0FOUSX6L/K2Zq46T7n0jL5XaxsrlcPeew7viOx21sXYGaj62HCvrI/nWVO
	Le39MTRk3U23iBeLNYh/4dkdAF//hWoBhzdbkGJuNcWwBKYpG2AVGaPK9FYXnVPyCei2xMZm7RO
	qYTpud4QbHAuIoPBrJNUCn+6wmKIXoKOM61O6tOYQZtVmjBb6ZpHkSGXntl1I/S4u45RpmwX23I
	UDwytjspBSXYd1tjLgGIY2OPCnIAZDNrS5ZO1e+3UC/nVOEURbkUs0eJI6QmrfOPpw1+XZy6/b/
	Y6LudycXSov8fXIvy
X-Google-Smtp-Source: AGHT+IE1P7SGRwHhgK16MRfDAXrEX7DH1YLnpHg6sa/GNFGZg6KWOiAXLcWOV6zX2nV96zG+z8muGg==
X-Received: by 2002:a17:903:3c47:b0:235:f143:9b07 with SMTP id d9443c01a7336-23c6e483a2fmr24735045ad.5.1751433360617;
        Tue, 01 Jul 2025 22:16:00 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:16:00 -0700 (PDT)
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
	Alexandre Ghiti <alex@ghiti.fr>,
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
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v7 15/24] ACPI: property: Add support for cells property
Date: Wed,  2 Jul 2025 10:43:36 +0530
Message-ID: <20250702051345.1460497-16-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunil V L <sunilvl@ventanamicro.com>

Currently, ACPI doesn't support cells property when
fwnode_property_get_reference_args() is called. ACPI always expects
the number of arguments to be passed. However, the above mentioned
call being a common interface for OF and ACPI, it is better to have
single calling convention which works for both. Hence, add support
for cells property on the reference device to get the number of
arguments dynamically.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/property.c | 22 ++++++++++++++++++----
 drivers/base/property.c |  2 +-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index d4863746fb11..d08b0ea5c915 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -882,6 +882,17 @@ static struct fwnode_handle *acpi_parse_string_ref(const struct fwnode_handle *f
 	return &dn->fwnode;
 }
 
+static unsigned int acpi_fwnode_get_args_count(const struct acpi_device *device,
+					       const char *nargs_prop)
+{
+	const union acpi_object *obj;
+
+	if (acpi_dev_get_property(device, nargs_prop, ACPI_TYPE_INTEGER, &obj))
+		return 0;
+
+	return obj->integer.value;
+}
+
 static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 					  const char *propname, const char *nargs_prop,
 					  unsigned int args_count, unsigned int index,
@@ -892,6 +903,7 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 	const struct acpi_device_data *data;
 	struct fwnode_handle *ref_fwnode;
 	struct acpi_device *device;
+	unsigned int nargs_count;
 	int ret, idx = 0;
 
 	data = acpi_device_data_of_node(fwnode);
@@ -960,11 +972,12 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 			if (!device)
 				return -EINVAL;
 
+			nargs_count = acpi_fwnode_get_args_count(device, nargs_prop);
 			element++;
-
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
 						acpi_fwnode_handle(device),
-						&element, end, args_count);
+						&element, end,
+						nargs_count ? nargs_count : args_count);
 			if (ret < 0)
 				return ret;
 
@@ -978,11 +991,12 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 			if (!ref_fwnode)
 				return -EINVAL;
 
+			device = to_acpi_device_node(ref_fwnode);
+			nargs_count = acpi_fwnode_get_args_count(device, nargs_prop);
 			element++;
-
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
 						ref_fwnode, &element, end,
-						args_count);
+						nargs_count ? nargs_count : args_count);
 			if (ret < 0)
 				return ret;
 
diff --git a/drivers/base/property.c b/drivers/base/property.c
index f626d5bbe806..6a63860579dd 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -578,7 +578,7 @@ EXPORT_SYMBOL_GPL(fwnode_property_match_property_string);
  * @prop:	The name of the property
  * @nargs_prop:	The name of the property telling the number of
  *		arguments in the referred node. NULL if @nargs is known,
- *		otherwise @nargs is ignored. Only relevant on OF.
+ *		otherwise @nargs is ignored.
  * @nargs:	Number of arguments. Ignored if @nargs_prop is non-NULL.
  * @index:	Index of the reference, from zero onwards.
  * @args:	Result structure with reference and integer arguments.
-- 
2.43.0

