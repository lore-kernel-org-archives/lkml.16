Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD06524E00A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744897478; cv=none; b=I6dJXBegepKyw7CZ+yvDwqMHm797lAQfr+D7IDZJmfOZm2fPBNdJfr2PrHzb6iarzBtpjJWFYZ6iFEzEasP2uFCx7nfyfcy1r/7cbjP/MfpOGP+fNhukLQf7gDjx5TBPmVksuB+BOJ4ha5sd9cna/e+u99KULFHTZzmS5HmQUTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744897478; c=relaxed/simple;
	bh=tU3V05jhQullaooJeoNgHG/weKtABakyMeEGO6lArHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vCVlgg2VAgDyPZUpq7F28+UOUb4fRgGzQcw0Nk4yL5HeEe8Ba93o/OhNieQ+9XUZeq/cKEv/w4sQACwDOr8nVpIw0oRDSOfvjrFpFKRdpfAevfo5Gu/Vl1OXw2RZDGfSWhpjHtEQWFAnUkgfQID/PWFiYu2mQxTUYMBFXIBvhdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QHIsRFY7; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QHIsRFY7"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so6311265e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744897475; x=1745502275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nU83/Q3lqWGLR3UHxt7XR3/5paElPjXKNr8qPQv0P+I=;
        b=QHIsRFY7fbmJKaSz1h1JoBmcfJQ/LOpSkXP7rBnPnial4jQVjQ4VNDTk9KjBolPT1d
         y+Ty8Gs5BClk1hOccmvRVlRG+wOYG6irkDxCo4Yr5YbLCC4RIXQczQ8aVITixXzeGmP0
         DczBcPkM2huWa3yxZCALoyo2zb6xUPSeP8ou42Ih1THCxm1GvqsEYyCjONulMd+f59Ae
         gXk8bYnwZh2WU++z2oftiQkTrODnRYB2N5mu0W0bPSEbrV4pmWKeHHBrbPQ1PtjA4LFk
         QBiYwzUPkRY7olQUv5ZVktUdZlZjoyK3JBpXVvPcu0gYqXxfUm4q/1Lgk6pKR+huGT5e
         4oxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744897475; x=1745502275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nU83/Q3lqWGLR3UHxt7XR3/5paElPjXKNr8qPQv0P+I=;
        b=jaajQOR8GTLKhcWsYWy4E7KQLN311aGUC989GD7APzw5qLsT9112ShQoyjqRf62KQd
         uYNuUSn5hGdKO6twygMCTKN3UiTSgcHypFg/5jcjXI/fYuuHDRFT5ul07eV0cTt8G4CF
         h4w1qdjCMonCyMrNQN/3vpUb5aBam6vDkCrL5BqFosF6rT90T0W1/ZGnF4QFYftDFIyF
         t4jh6oAYnTIRK9RdAKT7pcqTsqRSMY3h8tj6j/+QohKbJF+rcO7KnRkYxeK614PPZL6d
         BDtvyWmVMwxhL/9O2gxy7GNV7slGmRGB9HQXyxnQn9RUphRFWGWYdYlsDOWQrFEuAN2J
         fJ7A==
X-Forwarded-Encrypted: i=1; AJvYcCX5pdw7B/+xT/rDqTssBa1TKFlNTs4JqCrFKEWZMHYebvV9CfqE+Jmvx07iHAE+Kd+qbtR7FIIZukYQNyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyior1ZvKXudOh6za6LdbjXYTG9z7Pysu2huRb0l9mvza1DPyJq
	xpcXOEavUOejf64wydSvKYf7FAPpkgOmadupLeUAU7z6e4nuyu96YC93UmB8/bo=
X-Gm-Gg: ASbGncuIJfqjAODRhKNJf0FNS8xnUc4Co2+G8DmsBIafudHB0AzcWpRe8cN+6omV8cq
	Kp5FGRXpDsoWFcZRMPVQzeK2g1hO9cHKYEmmuKKzqtzcfmqzSFs3w1dwo8KEq4xWHzpR4tvwKXs
	WPg+C9gIk36OdMUzn3htSa9TXtyz0ISiWTHRDM2pmWPbgHBqG5kfYkeDfKFOl/+7dTREydy1RAa
	HzgGbhH+mfDTe56TAfVi6bA4Eu06OqCIpRgcRnBs26gntO/dv6lUdgLlWCSo7BfBOgHv49X6lyx
	gQgIz0VrpD/CRqJjxLs5PiI/0C0Nz2pAfMpBTX+fXhV8giDzd24gjEc=
X-Google-Smtp-Source: AGHT+IFtZm0nX+xRr8RW0qfpHEY69OZaCbvVJ/866PACgwrK/SM+ZJkdegmJ5AGlfTMTegyA/+Qb1g==
X-Received: by 2002:a05:600c:450d:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-4405d69b537mr44482305e9.23.1744897475010;
        Thu, 17 Apr 2025 06:44:35 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:2167:2c91:1c64:6619])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4405b4f3227sm54667495e9.20.2025.04.17.06.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 06:44:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 17 Apr 2025 15:44:22 +0200
Subject: [PATCH 1/2] clk: add a clk_hw helpers to get the clock device or
 device_node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-clk-hw-get-helpers-v1-1-7743e509612a@baylibre.com>
References: <20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com>
In-Reply-To: <20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2566; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=tU3V05jhQullaooJeoNgHG/weKtABakyMeEGO6lArHo=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoAQW/+d+R1tHoBukmIrCSQUS5wX5OiAescwxps
 5h09qL7j46JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaAEFvwAKCRDm/A8cN/La
 hSk+D/0dt5Pe9H+FVd2tbtrSD5RuJY5tMEE9KctFOZOj8rZ0H+ttnv0fpdDLV3+wcLCTyU0e7EM
 T/lKbyk09LYwmuRz3y7JdFDhsEQz0w1kdeuot7+MpuZpMKcBod0I2U40iwOIgTbp7ZBSf1M/dmf
 2xQ4icBMJyKdAztcHIRhgZdkdoRbH4oe1PLxF7vE6g+fK/ikGzPqhWq9Dsabovp/dQQRH9EBn6D
 gqYPCY7ZTr0D3Zdci18xCjZ/+Q1qNNzjpGkCIxOMU1wdsJTL9WFiZdW0hmvUba3mqadw/AjY7g/
 NypizNOKZWMXq115vAIzVLJhJmf2AnKOrux6f8SDzPn/W6m7AB/+NX4qszJlXvmgsqH3igwU7Sn
 lWrpcC1g7CTjUBvjlJu+RukcIhf3xnSE8iIQ/kVUrvW1AUT3sQDHce4iCm1v50kcC4t5bLB1+cT
 kgejLocI6Yx9b5pitpj/o8EVOODWdU6EBy5IKq/FZsrROcJs04xb5bWiAICKV3Hhl8yqvc9HhnI
 mHbtKbflqVtE0RebkTwlnUIl5K2zBSEIWQ2PxS/J+xapqPFKT6U86Vzq52hYRAISJKrT8P4txDT
 a+fCJD0mSdf6bqeOxg4OuimjAaqmFON5yBSvbnDJx8EWVdXMHO3+ULxJUsOKBgWZGQ4bB8MGSQm
 T8emD+tvPjhV7CA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add helpers to get the device or device_node associated with clk_hw.

This can be used by clock drivers to access various device related
functionality such as devres, dev_ prints, etc ...

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c            | 12 ++++++++++++
 include/linux/clk-provider.h | 26 ++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0565c87656cf5c557d8259c71b5d2971a7ac87e8..b821b2cdb155331c85fafbd2fac8ab3703a08e4d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -365,6 +365,18 @@ const char *clk_hw_get_name(const struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_name);
 
+struct device *clk_hw_get_dev(const struct clk_hw *hw)
+{
+	return hw->core->dev;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_dev);
+
+struct device_node *clk_hw_get_of_node(const struct clk_hw *hw)
+{
+	return hw->core->of_node;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_of_node);
+
 struct clk_hw *__clk_get_hw(struct clk *clk)
 {
 	return !clk ? NULL : clk->core->hw;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2e6e603b749342931c0d0693c3e72b62c000791b..630705a47129453c241f1b1755f2c2f2a7ed8f77 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1360,6 +1360,32 @@ void clk_hw_unregister(struct clk_hw *hw);
 /* helper functions */
 const char *__clk_get_name(const struct clk *clk);
 const char *clk_hw_get_name(const struct clk_hw *hw);
+
+/**
+ * clk_hw_get_dev() - get device from an hardware clock.
+ * @hw: the clk_hw pointer to get the struct device from
+ *
+ * This is a helper to get the struct device associated with a hardware
+ * clock. Some clock controllers, such as the one registered with
+ * CLK_OF_DECLARE(), may have not provided a device pointer while
+ * registering the clock.
+ *
+ * Return: the struct device associated with the clock, or NULL if there
+ * is none.
+ */
+struct device *clk_hw_get_dev(const struct clk_hw *hw);
+
+/**
+ * clk_hw_get_of_node() - get device_node from a hardware clock.
+ * @hw: the clk_hw pointer to get the struct device_node from
+ *
+ * This is a helper to get the struct device_node associated with a
+ * hardware clock.
+ *
+ * Return: the struct device_node associated with the clock, or NULL
+ * if there is none.
+ */
+struct device_node *clk_hw_get_of_node(const struct clk_hw *hw);
 #ifdef CONFIG_COMMON_CLK
 struct clk_hw *__clk_get_hw(struct clk *clk);
 #else

-- 
2.47.2

