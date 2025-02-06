Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46B91DF24B
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847304; cv=none; b=lzBk5GtbwVzqsXSz0CY3ojIa5ShC0va1fiLdA0eNey0HM9QBzYdrk//8PykIu4jECdCIizqA/0a1T+q+ZhFIUMU2JD4aKm133eDog3AP9w3v3jAYDaEOkzmIwtDJFzaSIt15acKbRNjyqQX4n7v5R9OoY5HnfYdTFUI5cpS2ppA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847304; c=relaxed/simple;
	bh=YTG9xptoyrfZ+iyT/y9FYepYTHdoDzEqJMV6IaGD2nA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BZpT+75YJG/h/Ew/GFUKalBWaz8trDKJaCkRhzKqqoCHjUcdHqS3abDBMYfFrD7aM4eNR0w0MOCy7FOLNcwWiY6lZG2f8FHTgeuw/1qgn12rPoQQpS4gG4RChfK80FOYdI7n4BlN9/kjox0udad+VIIeXBUjKmS/xk0rnO+XTd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cOS1BBfY; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cOS1BBfY"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab7157cf352so394775966b.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 05:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738847301; x=1739452101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2REuoysCPKRak0tj4nVzCn8fUcKqMMqOYeUqp9AjQG0=;
        b=cOS1BBfYN//KiGLWBufrTnguRCX3wZkZRsbaqke/HyD21ibt0gziHYBRPnjuMUSHDC
         dpbySd3bexiUIGUr69zRuY1tlOGRDVLlYn24C8bsCvBB7R67pZ8VlN+vA8dXFc+Th5h8
         8LPzwTxZQGG/tSgCWMnCKyzWSd027utxJCvxpRERDa6H4vzHtNniDXZ+Mbwb7Ht319zr
         AP9EnoNLuzLd3bweuTW9vVMvQdNCVhBOFncbZvb7e3wxmoN4nLspYyeUNfin/tWulhg1
         BfzAmEGYibBSB7uZHDCwzBoooxIdJ2UJPsKqxi0upN1wTFN2oTF9RGUvYytfYM+vCYC1
         9QzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847301; x=1739452101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2REuoysCPKRak0tj4nVzCn8fUcKqMMqOYeUqp9AjQG0=;
        b=AyDhGzchzywP9x5pivENomPu6vjuT1j4D291ak7rTzWFWqmLwd2EvOvSRc1wYntT2b
         wl6ee9fBmx8joS8fsMBgDXRF60rtHag/OPJdD5EVO+zyNRScNKYuYWPhFyOn3WQyfM6U
         t8b4VSxB8PpQOR5ZN3o68f40+fHcxN54so9BtlyRx9J/TfDphMuna1zSVR8fJ4/ePRDj
         OSCRYVn5m/RGX0T3JkX0+QZ72E8mOv9w3NgMW0saF6kguiyTq6uN4BfHE5NaFO71bWIe
         2GBJjOGYfM/inMApPw0PSWOXv39EfqSolfQbc1ISRCRk8IjSeCXDIAs251X9WPZClIQK
         giIg==
X-Forwarded-Encrypted: i=1; AJvYcCUnCSElXYXZkAcerFrnPE+URnQZt+6ud5R1XSBbapnvIAjRXzlHpP96MHLba9x5DSsSQzCosx/xlX5GxNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpeKKemZRQgVsEp4aDDknfpYLF3w612ZeR+OYDE5uH/iLNK2ZS
	S0sRy2ttnSuzB+r8Q/H8sTlqw0nnjwIpmNqcP8yJtI9o6J/C6cPbJr4sWm3cPgA=
X-Gm-Gg: ASbGncuG6Zd496BDZ0I7BitUJupaDOosTnnr/VKSwFt2ubFdUI33CAIBJZI+1vYHg4l
	ZuNZzCyiJRzpEtTHbRM/b6n4CjvIPd2TJ5OxYbdSntNpgHhkpEp05WB6AgZIx/v4wXtTLoAS09w
	vwfZrxoDyNeM64aCDGWYXU7u40zoM2hfI6L0KKdFkdDjtxDidm+HNsINeZbMmDE3E3BvC6/D4lU
	U5RHW2heI88EFCweP6b7ExlC+Al+XViCNzPifj7XTX1wnItQw6QWPyvugEqdmum7g+KnwGMu0yd
	iwyT0YwETltYQSx318ANlLVmWp6Pa/8jZkt33/OkceE6DO29mW7SkRDbrtA+7mwyH1nwYGSYxXw
	=
X-Google-Smtp-Source: AGHT+IF1BlIvboKtAcfd9MgfY7h0B//QZpwtD6hvZuGWR6NA7xoR+qRJFpfzOckYvT3dhmaj0oJQoA==
X-Received: by 2002:a17:907:97d3:b0:ab3:47cb:5327 with SMTP id a640c23a62f3a-ab76e84c45cmr374142766b.5.1738847300776;
        Thu, 06 Feb 2025 05:08:20 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b73f8csm830235a12.8.2025.02.06.05.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:08:20 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 06 Feb 2025 13:08:19 +0000
Subject: [PATCH 2/3] arm64: dts: exynos: gs101: align reboot and poweroff
 writes with downstream
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250206-gs101-renppt-dts-v1-2-cdfe993fb3c5@linaro.org>
References: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org>
In-Reply-To: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

For power off, downstream only clears bit 8 and leaves all other bits
untouched, whereas this here ends up setting bit 8 and clearing all
others, due to how sysconf-poweroff parses the DT.

For reboot, downstream writes 0x00000002 whereas this here ends up
setting bit 1 only and leaving all others untouched.

I noticed this discrepancy while debugging some reboot related
differences between up- and downstream and it's useful to align the
behaviour here.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index e78dcd506a5c..4f45bfeb33c0 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1401,13 +1401,13 @@ pmu_system_controller: system-controller@17460000 {
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
 				offset = <0x3e9c>; /* PAD_CTRL_PWR_HOLD */
-				mask = <0x100>; /* reset value */
+				mask = <0x00000100>;
+				value = <0x0>;
 			};
 
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
 				offset = <0x3a00>; /* SYSTEM_CONFIGURATION */
-				mask = <0x2>; /* SWRESET_SYSTEM */
 				value = <0x2>; /* reset value */
 			};
 		};

-- 
2.48.1.362.g079036d154-goog

