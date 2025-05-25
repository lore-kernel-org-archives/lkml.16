Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2441F1921
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162970; cv=none; b=hCFaY+XcBsYozKCk68vnUcHe7cRVfZKWKWAtVoPurQA0kgbd/Yytm3DxIlcqh1MNTiUUG4MMh8bSKD/s7eKsySles4A+xlZdpQHVr0XqwzLlxnM15p6joa4dCKqz9nLKLt1pKqa6S7nLQ4KpK/4xG3K/Wh3aaxY4Hh8o4npWwTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162970; c=relaxed/simple;
	bh=MuJyfj0pHWnRkEcbvrQA/wJDke7vM4uboKRNMUCLA5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GwFkMHuvO7GA6i9ovx8EqKs9He0x/M4rKcGQjIcxEMyhCFEa3a1815vqdLYXeHBbX1bRusfNUdOwp5vjRjI3r4NYaJRtR9qTAOfVYw5dQbV3tZBT4VoF5mwNnAcu3nLBuYam9U7+UaL4e9BzzKfa1xDKeRmanESmvkJS7YDyVv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=fGoPA0fm; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="fGoPA0fm"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742b0840d98so813995b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 01:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162968; x=1748767768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Te183q+oK/UUiJXJqywViKcAzUsX+o6NlP4bjtzs3DM=;
        b=fGoPA0fmjjwK+E+9bNeSEzJcs32jRrsqdD5lLmYpQCBFV5VmpbxIYaCxzldiyT2Ks2
         7vOzyWi3DGvKplEBfGZtiCqJqZGlMNFtWxB4p4E8WdWRK9WWumNSn+1uOqhejx3giTUl
         KvB4d99JXwEUQ00Mi055W18WOT09P3/Ko+qV1N/gsOiS+oQ9xOwXcQbmtT5ofxMjmnyV
         HcgAvSpyleQ2tbqOyeyGAiQ6m2h/xLJv6DuS8Z0Ev1fR+BZrlp2Qjax1eA9kHGvLaIPG
         5WXJck0keVQuq/5OPcGlfPmt5fFMkQH79MfkHHo1m1FU4WkG0f8UhEtvid2tVveTP1yd
         /8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162968; x=1748767768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Te183q+oK/UUiJXJqywViKcAzUsX+o6NlP4bjtzs3DM=;
        b=Z7fvI88bqTaiY+3XdBicOvGHi6e3YupNYvNij+G81PoRQPLIfF89KJwbVOViZ28Dkc
         tUZTEAaCkdHj9v10pYGnvM/FGCGOlM+5gP5CUjZKCwEGpLd2r1VXXHg9Ztxx0grYOUJb
         AJMgO05RTM8TfT2/air36A+3UCIjE+8HzWsyKpiRrSQqDaFWlCKvENO9VqDFDz+9O7w6
         H7RswCkhNig55kQio5fVscLNMm69oya3qj0Gu2BlnJhiZxcgQy79Qzhm1bc3wENt31Yy
         eEa1McNqD9oSOnNXR0k1whZ+J02IQ5AWxP0XFGWM5Zbc5IiNrhZ7wADPQ4i3AFi/D6Pi
         slpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS2KKmCtNA90o22J0nU2YI5bbLqqxILOJc5UKjARvK0wMxGK9F8vBrt4jMxFcdMNBGsxLVSNTk9aRfJ0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX9B1l8D2s4LrGVFgerBhfR5LZtLm0FMSD4WHS/dv2rfsL9vEz
	BNlxVRMd2d1ycQCYNpkmJtOlhl9XxWMmVoHDDFVbniZVNAt3hZfDE3+dmVKDKWOzdPs=
X-Gm-Gg: ASbGncuc12wmG12wERg/1uzMRux3Y2PD2OKBDn8wWStcrNQNLQKW+JfgfXfD5bzr9/s
	/mrK0QHSKhbAhP5EL1WjYcXvYuPBAv0qhCUc7/X2DONNy6UtMs2V4BH2Q6LNrbPTY7EEPrfnxFo
	0EUGXvoTpY+blYOiKAHIFw8lpdybH9F3vyzjJkoGBcx/uaNxITBr7RC5d5zJSe14auLFK/FZLaA
	lT75RiTEDEotWKCJdwvgFobaGrA5tXRdvrw++T2Jo8fAgxL2FAjRqn0U3NNCcuyl3jQVtaJjbKq
	UudO+YrnOzAEr7GQmBOE1EnEOHUstMKViQ/HvPxvR/c+bjySq3HDZHi798OFLRa8eQHgJMOywWc
	tm2pIGobN
X-Google-Smtp-Source: AGHT+IHvodyfLDw8dU8rN0uEdUKyajUEF59LEZ7NqCCr7saQPd/1HfpNeU3hAKm+Asik2TwpoaM2Sg==
X-Received: by 2002:a05:6a21:3399:b0:216:185c:af0b with SMTP id adf61e73a8af0-2188c3b494amr8573479637.39.1748162968385;
        Sun, 25 May 2025 01:49:28 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:49:27 -0700 (PDT)
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
Subject: [PATCH v4 15/23] ACPI: property: Add support for cells property
Date: Sun, 25 May 2025 14:17:02 +0530
Message-ID: <20250525084710.1665648-16-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
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

