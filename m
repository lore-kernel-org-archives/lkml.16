Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD08257435
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 13:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970934; cv=none; b=m/460pzxBPZ+iReEVMFE2Vn2xvREBp49jKi4LHA9JVcLF9QC7a8ebAO1mHYnKM2+gjL6Qgq6RYXw5q5m4V+iNVM499kLKfaiOd++/zVEcOp56IDKGdu4PwKk62oLjvLcjSw5HbulSpfyABjbzPfkY6S6jfdZcdfN6BvHfLxuJMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970934; c=relaxed/simple;
	bh=/NGx6vVyfAmL2H7PdAWj8+6zweqVE236nRfnQRAZ3A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZFavz3YqBEks75/7fmH9VFck3lsO9vnmh1n/9xeYCLwz/bhZBLpkuXgcjeDkdm5JM3glyRsuGIJ1AsRuz1kdzmrQ3bEP5MrRP5NKOOY0uIlRMZkeeczSnjvqU5P2wEur5aMIOudkQZTYOHqngHNd6unVeewho4iuAnjZQng68m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=IMPtSRjg; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="IMPtSRjg"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30abb2d5663so3520214a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 06:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970932; x=1747575732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGByiNcbOS4lR4Bfcs//4xBTg2VCmvMstvJytXn1tOs=;
        b=IMPtSRjgBr3i68nOc4EDEZbJPW8Vw5AEGAmIgRqGtmMib/ISIN/ibdNU4FRteTq+0D
         BzVJVMfUkAOLA37bVVtEmS2zYwaApPjFVZyH+yQlbcJ7M/Fs1IIajoMh6xrGxlWG+qiB
         C7DNtjiuMMClNtSk0/flvuA/vcEIUHZicNCztTy3BUfRcXsc3hU7G+ZYyWC3/RJSQbRc
         6yOt4wBLkpFtbtGpAavlFQZIM4hHO8dbxbyvHkoiyKuJJ0CjWteNyBiIKUznOf+8KkVy
         iSbsnsK9FaoskHjEwGNsr69i7gJvetDH9auckeuQgPWOuXK5I2T7uJOY06k+zW3Sqr+7
         nTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970932; x=1747575732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGByiNcbOS4lR4Bfcs//4xBTg2VCmvMstvJytXn1tOs=;
        b=UWOeA0jL5dsOqG0r1w+kBBUZ7DyjFrF05618xkNEuZWfXBoyadwu1dJG5diaiUBx+X
         u04LXxDQND75S85hQ6+oCmb5DG/y9LSF7UPd6T/TLRo7aB9STp8s991SIsWnqTGaDbzx
         vlHLxZ1PbgPPOIi+Z5oNGoVJ0d5tisezFDSJoK9OwbpyIolrB3gf0o0CO15yaMOwkfUx
         e7PwL1Y99u0lO6mGvQIDxuGnOWpy0a2JL0T8NXIwNz2LQ4+79ageP/tzB783yCWoDVDo
         GLGt8YpgyIOUuxt60gCuUXxrMOIezp/cB9whPP3dyYOcG5YcdvL2U/x/Q9lCnRaSJBg4
         +eCA==
X-Forwarded-Encrypted: i=1; AJvYcCVvX6qwUPUmIK1wLX9PIBIGbCrf5vOm0y9WnJWvlAOxLC4nw914IFaTo9pGQdqgS5MszufyBgvFdjSP/d4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZhy2Ej+RslH4gotztb6UHkSSkHpiW3yihIVVvRsKAnzefd8LZ
	Llhz7aR+Ua6JhZKZrlIeAmWsGuvaOZhQLTM33Nb8/vhquAmZfXIfTD3L8cj80Lc=
X-Gm-Gg: ASbGncuwPk6TFHLif8otCLEzg/MAVMGVfC5vWiAwGtklrLS4mXNLwl979LqX6dW6m7E
	sc8NAAje1TU/PRUQrqfxsF9aTW6kXbKYnuJVAX2XhTaFZJDZG3s3sY9L4y/p04rxpwXnZ3c9Nh/
	aFjZBm5UHcN2K6aRoubcBOXEjssO8Adi/u5awFbwcVuEVvgMSKVD0LpNRylttAZJWlCfyoLGox3
	3vBLmDLa7XGVRwUYbQdMm6zBIdqYv+/mwUzFKQ7vfjHC+w7c1JfX0dvOz0z+Q76O3wqu4n5VIRG
	d1tD8E2O0f9HHzs+jbROcfjjcdVxDZDPhIVZVRTDcGjcp8vBmv3kdjAlcqlGb+KY54n5HRWlkAs
	MpQ/GaFi03QZWCw==
X-Google-Smtp-Source: AGHT+IEVz2y4z8RabHXmB0ZMFkEbguqpeJ841vPD4v6JLrHHmpUprIGAeUTqvLaFFNsGdONbOeY4pA==
X-Received: by 2002:a17:902:d4ca:b0:220:eade:d77e with SMTP id d9443c01a7336-22fc9185ef8mr159540425ad.40.1746970932037;
        Sun, 11 May 2025 06:42:12 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:42:11 -0700 (PDT)
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
Subject: [PATCH v3 15/23] ACPI: property: Add support for cells property
Date: Sun, 11 May 2025 19:09:31 +0530
Message-ID: <20250511133939.801777-16-apatel@ventanamicro.com>
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

Currently, ACPI doesn't support cells property when
fwnode_property_get_reference_args() is called. ACPI always expects the
number of arguments to be passed. However,
fwnode_property_get_reference_args() being a common interface for OF and
ACPI, it is better to have single calling convention which works for
both. Hence, add support for cells property on the reference device to
get the number of arguments dynamically.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/property.c | 15 +++++++++++++++
 drivers/base/property.c |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 364c58faf13f..51352bde617a 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -960,6 +960,13 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 			if (!device)
 				return -EINVAL;
 
+			if (nargs_prop) {
+				if (!acpi_dev_get_property(device, nargs_prop,
+							   ACPI_TYPE_INTEGER, &obj)) {
+					args_count = obj->integer.value;
+				}
+			}
+
 			element++;
 
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
@@ -978,6 +985,14 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 			if (!ref_fwnode)
 				return -EINVAL;
 
+			if (nargs_prop) {
+				device = to_acpi_device_node(ref_fwnode);
+				if (!acpi_dev_get_property(device, nargs_prop,
+							   ACPI_TYPE_INTEGER, &obj)) {
+					args_count = obj->integer.value;
+				}
+			}
+
 			element++;
 
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
diff --git a/drivers/base/property.c b/drivers/base/property.c
index c1392743df9c..172dfb950328 100644
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

