Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2751F419B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 05:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433294; cv=none; b=uK39r+eKGufRfO0vqXkErMFZ4FWu9NwIRR831hynfOnpTvd1CoQ2Cbp8+Pmm2sKgzesM+xIg9l0ejTRWqA24DVy4BWjQVlPkN7RVDyQnK3mUnB/o3r0mOdxebhVdug5HzKcmGAcTCnKQlhwxDT0oWjhozCLFFsZareEHQr8pCZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433294; c=relaxed/simple;
	bh=WFYchEV23h84fSWMGcTr9nuW4BY0/9Qrh/fSfYTERSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=chZwd1OQoLKe9/9o6zoq5qw0Lv1nA+0l04JePzqkFbgBrqRv1J8IXsCZ70De4U8mzno9eh6y7zTw5SDwAksbbLfQi3HabOc26ZrXiUd9GGv/4U83tjhAE9iaR7cIDOsobeIzNg+WrFKkpu2v6mxyDoWH7rjPlo2i5VJwRd412cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=KAUunC5P; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="KAUunC5P"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23aeac7d77aso36085675ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 22:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433292; x=1752038092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqC4VLtB/5V/tfhRhr6dfZ8k+2Am0+dgL1H83VW+Xe4=;
        b=KAUunC5POYHxczW+Um+J3pkwdxy2NrUT3EzfwPsMFC02pFOmdL+UiFfukbSUHwh3TX
         tqiNCOi5se3TaLiTznwrFQ4BsKZoafDz7ObQxUb7ptqew8A4Jd1UOqM2goOwyw1c/LAd
         XtZQwFygfRuWjfDflfkxZn5QGEJInm277VNR43ueEOOq2OSuKnNKBHMOi2+9ye2l4Yd9
         ynumkKV1pT/2xTyqYoyxFLGzAD1ksnY+yW5RwTDaA8b58U8+LRQXcnwAivSGIoNdAZp+
         I4Ug0CC1AWudjjHIxWxyfVad/Eq5JZAmzTGI9753lD4M17DZAmCpHIr7Yg57p7HOxsjv
         j4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433292; x=1752038092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqC4VLtB/5V/tfhRhr6dfZ8k+2Am0+dgL1H83VW+Xe4=;
        b=GwxF74h90KNBtNkHxg9VRB8U8JJoU0PX//TYEQPBqsrIiZExfUOWppGE1SI03LL2u3
         ekL0YFMR0q1Cg8Msbom090YBpe8hqAtByE6lZ02kWgZLhFZ4oJ3QKIWwnxJgeY13YsCp
         SGG52NYRrDM0j57ekjf++JC/9VAw+OjCXOWTxKBrB0oQP58Ll7QFOBwPrqSR3CTW+Jrn
         WQgn35vmZtAhAw+hgoQ2vefg8Uz+YJy522zcJCvUsxsZD2YKDQZuLuoUnql9nWosksv4
         0Zr7+Hob9QxnV5CKKUJCMHuK72YYB5iIMjkYUXEFRnYshZSRt1TejUwe/wU9Nc2oMnxf
         ZOkA==
X-Forwarded-Encrypted: i=1; AJvYcCUySZc5YrM02o5jsuuAtuvUQbbr+eIh7ACiep70VWHnYgDu7ZcnyYnRFFJRrAxUD29w0uAmziLLmUpCW34=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCwJnUyH1A2fYqsMvLZY2HaWZnzOea1adCrn1z2cAOmTEpXpts
	wHXZhU10Ci2LUpeIQJGQmb8PdgJAcPZBx5BuyEmQ9KyZu25dGqInZaG8GEFD5Eb0RB8=
X-Gm-Gg: ASbGnctUAiBcJpkLSIeA3kcRtF4D4Isqt/sNtsf3LIAOZkjCvJvUeH3v4MamwT/3zea
	OSI7rVVerc0K4Wexufseatki7//IWZVXHMy+YhPzBYenNoMSHqUruqVEIOoKAxPaEllnvqDJnwi
	FCeTU66wxClfFEuteJ5xe6PDRiKbNtZrR+EAs+8WIBnLuAB6zfUivIvSyMn98j0O4udmDuzqykC
	5jxfME736MZg0oIgXhgXJh+V75ww+/zY5Qifr8RjnMfsVb54K0g4GN3bcqtVs7NKaylisAeNT+z
	JelF30EagQPA2DhN2t7fXB3WCgRKc6vMU3x5+7VB9xB45io59KuWY+xtJYadv2OHnQBBWO7y/jI
	+sdH8A6D0AaULuKrR
X-Google-Smtp-Source: AGHT+IGlyNbAZQuDOeCGGhEH6QTSFXwRevz7KU5t+CywLuVwtZ+G8tX33M+R/3t7hDV3PPKWLn7voA==
X-Received: by 2002:a17:902:d2c6:b0:234:8ef1:aa7b with SMTP id d9443c01a7336-23c6e48f8admr18399295ad.20.1751433291916;
        Tue, 01 Jul 2025 22:14:51 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:14:51 -0700 (PDT)
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
Subject: [PATCH v7 06/24] byteorder: Add memcpy_to_le32() and memcpy_from_le32()
Date: Wed,  2 Jul 2025 10:43:27 +0530
Message-ID: <20250702051345.1460497-7-apatel@ventanamicro.com>
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

Add common memcpy APIs for copying u32 array to/from __le32 array.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

