Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC7B2566E9;
	Thu, 12 Jun 2025 13:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734922; cv=none; b=bPxdPYd4RYGbR2y335MQ6zKsVKmTU6yyxy1nM+sSnoyep+p93AI5AatHHsxcdudCDzYSbAPltW0TDCCdEnOZvEGy3y8fZ0ixhiscfz8Q0KLaGt85clvKP8O0O+Q/zp1Fhd5SpiuWvKo2iwjXxpidNSCRQ5Fs3YVXZtwOGLb/JEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734922; c=relaxed/simple;
	bh=z8TUXJr5QsqnYYZqY2zibHKBXHeJjmjKYYu3RcdvDME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dI5NN8xGPt9cJ5Ce8ywGCybPsiNjDmRUIVMxIH4mZ3nyQFA8rLP1hx+19c2g1R9J6StuN2vEmeDZaGyapqtXgHclrZlvOM7Zw74o8x1b9b5HeQE1nevG3E5bEZcNyIRraaPQ3VaHDpfgSkjaRU4wxQJJ0jCfY6epmMDmOLx5Xwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIHJdZQI; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIHJdZQI"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a5257748e1so772368f8f.2;
        Thu, 12 Jun 2025 06:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749734918; x=1750339718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSh+fsCj0Vt40lW0BMzspPkUOeAQ7bE0kflPk84hamw=;
        b=iIHJdZQIG2EBEzKJqTQE+ncSlWKvLulQVMThtoOqvmCiVpPc1S8cAueKVX6zTxIFrb
         e4RO9KiOSILcMkXiSnS9d+cAXHj7Q0MFjmLpsKQJ0enCyQ3TasyRuwXzCnX77mi0QmHw
         0HiTI+hsutd6Xk+3eDHH4G5y84WzVu5euVTt1TzBxkFaEnNM4zUrqo0ZHOORqIJoEcvC
         BR38vAvycX6/McL1g+bkLJlIf09/9g0YVqUqQesNhIfsq6T9p/NxVX9mMKaN/PjzTqhF
         UsFe/SGPsGsdc5bBY1MbBZYfjJ+ZRODnz5MPUx9C6lYPPLj1JhY8yZJswct5jCu+NHff
         lvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734918; x=1750339718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSh+fsCj0Vt40lW0BMzspPkUOeAQ7bE0kflPk84hamw=;
        b=H8wPXxAT9LyMui3kyCopQAYBI69qmwWVPRu8q+P+MBJsMHKSRZc7U0tTx9vU49GaG3
         mFBUOb03LMm2YCcH+/XpVVlxDKUOyCynUYsVFU6zgQNTJnNNsgciK+QgsETuKAvmaCul
         bfZ4IIP9x2H+W3tG4NBzkHBjha3fIof8hM5YTuvQy9U8rSVzwJN52xK83C/iiQWaqcbb
         EKdppwaZnZZG0RuyEUog3y6jrPCO9fQjdbBIoAHs4wQD3Fv+PXonftdL2CAVm5qauepY
         vU03I1dqYErjc45GFdCQC5BU000XUV0Rn3QymZbZFeaGjm47ypYB/zJTl6KNM3/z9+Nv
         qe5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUogZ3AqFYEJHmsZmHVERRX9StGbavbUheS0RW8k06IrFmNCt/N2GdOduRVA22FVvIr2ZxaYr9IbCiCAdg1@vger.kernel.org, AJvYcCWH49WbeqxewKE7Nz6pRJTeAQxOHHr0kcLq+tK+0ukEdNfNH4Hq2CPVuKt323lw7PUWotb5n80GSJuj@vger.kernel.org
X-Gm-Message-State: AOJu0YzgZB2/YKqLWAWtTssJGVZVZobn7CkAcjEfgV63Tqz7srxITOy2
	etx80arQUkZbTa/e6eRa+SOkfmHcAdbWUKzl9+ENHXZGFMiDH6Upd4sU
X-Gm-Gg: ASbGncsIyglJiyxYBvHFZ8DVO9E1tlcNRpXj7I5S1aXzGb86eRc+flmfjUd/VJQ6pNM
	LvUu/g8brSg+Qr4x0haR6hUuuBmjWONRyQk1PQn8eD2v/1vF766ViQ24rcOK6FAw/TPN4CXnLbx
	CtIJIobiJTqrgHfip7o3/P/zYVmms6IxvSDKHqe8Q8eHKEcxDTLsE8WJe0Ezu4NDjCQ1bsP3MbR
	3coZcVOruCqwmKsfD3xbwQS/bAlIsIxoiXqTSecYtYvRktk0B8herN4JDr2n8o3iOcLnkmI2WFK
	wsCFXpuPk+5bKTYpbU+V6on+4NUc/JzvpDND1GUHYjucITgv8MczfQ1ulKn71fhQoBCUbegkgZY
	=
X-Google-Smtp-Source: AGHT+IHV6e6anEHK29lgBtoS3Bqax2FI793ZjT7balAPQMK3rYPdrVYTPT9jvAqFViLEp5FxmMolpA==
X-Received: by 2002:a5d:584f:0:b0:3a4:fefb:c8d3 with SMTP id ffacd0b85a97d-3a5613749e0mr2289648f8f.40.1749734918324;
        Thu, 12 Jun 2025 06:28:38 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b653d5sm1982809f8f.86.2025.06.12.06.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:28:38 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 5/6] arm64: Add SOPHGO SOC family Kconfig support
Date: Thu, 12 Jun 2025 15:28:13 +0200
Message-ID: <20250612132844.767216-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First user will be Aarch64 core within SG2000 SoC.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029aa4..8c23aa111e94 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -307,6 +307,12 @@ config ARCH_INTEL_SOCFPGA
 	  Stratix 10 (ex. Altera), Stratix10 Software Virtual Platform,
 	  Agilex and eASIC N5X.
 
+config ARCH_SOPHGO
+	bool "Sophgo SoCs"
+	select ARCH_HAS_RESET_CONTROLLER
+	help
+	  This enables support for Sophgo SoC platform hardware.
+
 config ARCH_STM32
 	bool "STMicroelectronics STM32 SoC Family"
 	select GPIOLIB
-- 
2.49.0

