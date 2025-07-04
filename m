Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619F1274FC1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751612727; cv=none; b=QaqlME+wHa4Bw+Yl0LzcCGZBZg39pRRb7lCFD/M4W+1Jbba0dyzzCFFwC6e+M9ae9F2OfYbeh6aeYxDQqq32Fl0xKP2nEz1oV9g+xLAQBlwwqEM6V+SRtfbmOfyaURph+FdBR5P+CwWXadTjs2ee1YC13B4FEFqI/s9zoBwE/co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751612727; c=relaxed/simple;
	bh=UBn+LBjax9N4GZfXPTV/0yYRe68OpjEpS5e1cFYqyMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DRnO55PXwEZmDWLjd9Xt+6CadsCYzfHTwWo3O8Hr6cH92vQt0/VthJju2Fmn3ut5FBW4JyomqXk70Jr+2hzqBSR68uhOF9b4IC8BrXzXJCU4EhSl34wb6UAoU5u9tx8YWKqXB4zOTDCUfaFWrQQ2NFnJd/PKpoiZoPg7Hs/nv54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=WZzBcgBu; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="WZzBcgBu"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-879d2e419b9so434550a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 00:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612725; x=1752217525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bl+ki3sYBLOuIZdWtmik+PFOlIYEBNco4Pu8AxHtczE=;
        b=WZzBcgBu3ZD0HXOm8MishoZ5Db2MopL/9n7SiiP3YxcOCcl+zii4Me+DJ9yW2CqbWM
         7GBQr03Ibg+IDrIEk1xMhrT6xC4KL9Mr51XUTCzrPR68Xz9+e2UQbF43VANMOUJcaebg
         k2zq/6lSHNOAEim/Jjyk419KPtjG9voJCItwKCGPiwgWmbKhb7/xR42SvhSvvqBD/pBV
         UFM9rmUtGQ/ZzaiJxMHR3Y9OmUB0FIECgepVVAdJg8oSV9gMAWjEOLnSuE38TLu8q2ZI
         bG6EZ0dT+ckdeMHUCObhWE8PEbJsz02T4w2cj/AdYr+mPrklXKtnblgJOAZc2gxf2A/P
         q30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612725; x=1752217525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bl+ki3sYBLOuIZdWtmik+PFOlIYEBNco4Pu8AxHtczE=;
        b=NUBAK50XXXkswN/bOGgAoVnEzRAa8G9bSfKvFf+zvTosnFgtpSC0zVk3VDJ7EXWqN8
         SDdzA9lBVLkxuQ7mEC3G1kX4ajmZ3eEZYLXGUZp1CMwmDax18rDMefARc5xv8VF+egj5
         /xBwJ6/Wj72hikfUe+VCguxmccCx82bgL4l+Oeh3XHvQ10E8U7W48gKG9RP6c6jmyKPs
         USAPGuivvN16tE4I3TEfgmRDdXyz/a817jA4QhMmZqk1+EPmau1+Bykv94q1V2iMSwJv
         pm7LdHCWlPnBuGm0QX+ol9qV9/1ij6WtBkWEaWnhViPHDDe7thpsxY3fdNC46DVAi3Fi
         GV4w==
X-Forwarded-Encrypted: i=1; AJvYcCW++HHQyBhzB9ksLTo48C60YFJbEPO1JOabz10FXMtB/AguugaEaEdbw+oGJZMPsxbTw6ZNQQh8YZx+3P0=@vger.kernel.org
X-Gm-Message-State: AOJu0YypZUJ2oyK5ALz1o7K6A95zCQLSEQDEy4EkZiVCcTt/37/Xza/8
	pvbhTb/7AbByHXEdgnRbv/jDa5P+W51c1Sd55Vs8Pg+/LSzzvBL6N68p0jHGJoduaSw=
X-Gm-Gg: ASbGncu1VQa3Xj1qIzn+uIkMQA89xAqzPUziniQGfX/obv6WHrw0gr+IOa7KR1hSNlt
	NftJ8OtimJC/LBUI7ehWjtaFnvBPsNdjYcgenG2YTv1WxODHmdQUbo+N4yy3iauxAFNJtT8pwVy
	HJnN3RWEkYhftb1HHUsIorbvpj2h6djqycg7Kj9hbpOcIN2VX1D33GgozRLayXkLPBJP+S30Hhv
	UG59yq5+GKIeKt9h7GaZAZOkGt3tqRCtfEDeDut2BsRw7AUaeH23yFLVC908qOwszTUfB6xuIWq
	C8nPFzsJzWk1sH5sSMrbyFBKtOkyykTwPWuhVeT4exlQZ8H52Iqr0g+3+YsZzWA/j66z+PTJATe
	NFqT4pKaGRjKE6jPl4mngH/njYA==
X-Google-Smtp-Source: AGHT+IG2Wztw0stW3yOl6KCgbq0+m25wabHOLxe0e4i/arpNNnZE0epPwB2VK7aaXsKsyXh0wihgNQ==
X-Received: by 2002:a17:90b:2f0d:b0:313:20d2:c99b with SMTP id 98e67ed59e1d1-31aac44b34emr2635726a91.9.1751612724260;
        Fri, 04 Jul 2025 00:05:24 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:05:23 -0700 (PDT)
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
Subject: [PATCH v8 06/24] byteorder: Add memcpy_to_le32() and memcpy_from_le32()
Date: Fri,  4 Jul 2025 12:33:38 +0530
Message-ID: <20250704070356.1683992-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add common memcpy APIs for copying u32 array to/from __le32 array.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/byteorder/generic.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/byteorder/generic.h b/include/linux/byteorder/generic.h
index c9a4c96c9943..b3705e8bbe2b 100644
--- a/include/linux/byteorder/generic.h
+++ b/include/linux/byteorder/generic.h
@@ -173,6 +173,22 @@ static inline void cpu_to_le32_array(u32 *buf, unsigned int words)
 	}
 }
 
+static inline void memcpy_from_le32(u32 *dst, const __le32 *src, size_t words)
+{
+	size_t i;
+
+	for (i = 0; i < words; i++)
+		dst[i] = le32_to_cpu(src[i]);
+}
+
+static inline void memcpy_to_le32(__le32 *dst, const u32 *src, size_t words)
+{
+	size_t i;
+
+	for (i = 0; i < words; i++)
+		dst[i] = cpu_to_le32(src[i]);
+}
+
 static inline void be16_add_cpu(__be16 *var, u16 val)
 {
 	*var = cpu_to_be16(be16_to_cpu(*var) + val);
-- 
2.43.0

