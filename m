Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7D92E54AE
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248977; cv=none; b=A/NSejyvZIiLv1nnb4P+ydgoPxehgGTcXk7RoddktPNgHDNYjjtmTpUMfxvb2eXtRagD/0A4ekRKgwZzR5MtbcJO/P8GsFuSWJ5F4R1QN9pesXjkrZxN2wcpH7aNtVstXWuuB4du8N5Ih56eCemx8JsLuBFrek95Z0VR5UGfh/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248977; c=relaxed/simple;
	bh=uYspFdcUP7K03KSkIbLSgQUq1PmFh7JvyJFUbmFVifk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LxaaDEDFUBGKBGpL2NJdtHqKJTPTxlryVKDJBXjwLf2Xq1Sdskx8OdKxe4S4fHRb3joWMX9Y64h6EikWozYnbX7U1PbUD1QbW4MINa+1hPYGze1D8JkNx5chsrs8AP7fhzc4UfaXxVbMvp0QvEAEB6butlkiYEtvbPefJ5YUlos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=dLpuXr5z; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="dLpuXr5z"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso532054b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248975; x=1750853775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iK7PqVF4zZIJUvApimJUz6BsykWi/7ZoxPUCnW7EQA0=;
        b=dLpuXr5zGl39MjAx66t/TN2gKGOa0ZGnBKy9nzmRGyJSzy1OKRfNHkwmNUeC41K7OT
         nSrQG6qKPLLLy012IAOKR6krPDp0I4v7LAMtT1yZuzPOPyyQlmh7yDUgGVoEb9Kwnoij
         RE1Z0s3Ale96uajhW7iG+h1S1lhkI+U2hwQLAitRvbUVb1oGQIO8Zr1vCANzK7O8H1ec
         qxu4/AoQKxCjPPUSeh2W9GpGYu/9vRfa/KS1g18/MQdsiyluh9TOpVJweNxNG7FZxuZ7
         /7TRLTg1noclGozqnvASDQr7DGgb+aqruTH8EQ9RPgvgpfBcocJgJ3o+kLxut9NvtLPY
         O1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248975; x=1750853775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iK7PqVF4zZIJUvApimJUz6BsykWi/7ZoxPUCnW7EQA0=;
        b=ScKp7CA8T1GmInAwQVac3zyikn7Tcx5ARrckT7DyY8nc6dlmZVBswdP2PqJfMakQVV
         JdFQj08Yl+Zvt8DkT+Sc0uETvL/s946Jj4k+VGTLGSHe61MvzWXdzAru0dLyjxBFNULy
         qWltDiiJQeFhi2UFgTAcLyrBCkQk7Px776+UfrgyZtmUY8SCV+z9OEfrFZNatAg5vI/k
         K8MgqbnQZGcqV/3NwtqWdhXoZVdlDJc3HVWGrBa9qFP5ipVGh7rbuDVHieu7KEjn8Q5S
         tNtxWyfYwunS1FKg9R/5FdXWQmqcs6DxONX03325e9W2Mq2QkGWlEMSUL/7v+bcgRCkq
         +OTg==
X-Forwarded-Encrypted: i=1; AJvYcCWOcvrSCPsNpySYpyFBWT8A+RreLlkryOUtwQjuyMD5YcAWPXhmimlKDUSKDDrDzYYPQbKtS56FCFhHtPY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywae7BpmHK65hDmmzf2AVF8hrxBZeMXHyU93umYltb3YMfHkhQC
	YdLkJ+HIHZx0L79SiXEVjmoFFqaSzg30AxmQy8b017R9Dwwti9uxEj0M7rEQcUz9hkU=
X-Gm-Gg: ASbGncvw9YBVUgR/LVJDao5DSqQYmmOFWLRf9hjy54BVwPD3eaegl3hqvuEsOeOnpsJ
	FzpCB/c366Ts/JvGb75iXZpZqTx+sdCWLipNoINzEdu8C2vub2InKbRVObd+vFcDTpps7mEAVRW
	ST7BRLyhtc7DO0luobkNFXgzcNsftwYIsgefKqBj/6WyVkCBiMmBAKWWTLDF08tuRq1PMn7XQGX
	ZzFJMzGZ8DvcjMLBYW6IhLp3BRRlHc1ADVr5KvRL7hOJFOFOrz1i79Xzls8MgxdfU88J4Ne4phj
	sdUUH+2kWAvE2M1yBOFyPulaQFajhIwSLO4NmUqkVULSAxcAoE4XU97THjC7GLRxRufOWSDvmd7
	g/vhegya+pKD2oYrlPHLQkJ+ksFQf
X-Google-Smtp-Source: AGHT+IHGxdihft+ht1cVZVd1c6PNThCfkYZyuhsm/u3nH0+E43W34IXdgzMXTGbhOuFGPUkF42AqtQ==
X-Received: by 2002:a05:6a00:7189:b0:742:ccf9:317a with SMTP id d2e1a72fcca58-748e7030b72mr2344031b3a.12.1750248974760;
        Wed, 18 Jun 2025 05:16:14 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:16:14 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 14/23] ACPI: property: Add support for cells property
Date: Wed, 18 Jun 2025 17:43:49 +0530
Message-ID: <20250618121358.503781-15-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
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
 drivers/acpi/property.c | 22 ++++++++++++++++++++++
 drivers/base/property.c |  2 +-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index d4863746fb11..c9c3d6920326 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -882,6 +882,20 @@ static struct fwnode_handle *acpi_parse_string_ref(const struct fwnode_handle *f
 	return &dn->fwnode;
 }
 
+static unsigned int acpi_fwnode_get_args_count(const struct acpi_device *device,
+					       const char *nargs_prop)
+{
+	const union acpi_object *obj;
+
+	if (!nargs_prop)
+		return 0;
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
@@ -960,6 +974,9 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 			if (!device)
 				return -EINVAL;
 
+			if (nargs_prop)
+				args_count = acpi_fwnode_get_args_count(device, nargs_prop);
+
 			element++;
 
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
@@ -978,6 +995,11 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 			if (!ref_fwnode)
 				return -EINVAL;
 
+			if (nargs_prop) {
+				device = to_acpi_device_node(ref_fwnode);
+				args_count = acpi_fwnode_get_args_count(device, nargs_prop);
+			}
+
 			element++;
 
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
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

