Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29DE1FF1B8
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738575300; cv=none; b=rQikVTzlVD6y4fjfBGcQ1Kp1UQdeBTiPIZnvCBGnirAErIxm3+rSKyr2t73Wghkd2qILMgKJQ6+Zrbm5Rr3la+nZfZ1pkcP/QqjNWNCasCc4GSBSQpF88zcdC6pZ7NfBkhPkZ+eBf5gTZ6C/ex7J5xHS7VFi2xSn794ihOMk+qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738575300; c=relaxed/simple;
	bh=FQq+RvU/nx827rTHdk2gvuy7rYaA2bdFnPUICZ34hOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KYK+KNLyVxJhz9tC1zch/TDvpB6bHEZGAOaazWRwN+xyJHtR7O639JrNvHARwSE2nUTtVYVcc3/sJ+s6Mouiye+bQjinbRi6t9UG4ZlwW5EalGLkaFYu0u94Igi8lNZNTHFELtPYOjIm/1FnvD8VcmHYylAyXvmD3uLfNdjlREA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=arzT5eo/; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="arzT5eo/"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385e3621518so1955306f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738575297; x=1739180097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnSS9f3MD8fKZAuW9eSUSFbsKwmpz+6ZY7PPsWdPvPY=;
        b=arzT5eo/xuX+4SYjdSe4KzfpTJk56cRsZBmkcY2AOIy/5BpicRhmPU8tl0gnC1AtoY
         8H/X475w/3iYmHRIQ7MFA9s9Z0BOhX7W9aPH7om369Jae+BW6jNfhRYIWprq6u/XTPiS
         bQY92qyQJz8xS2jW1TXCtm5PJyLjH6IYRMTPNY2Se+u7sIFMV7eI595Q9shf4zph9OMz
         1VBVe4HJJdevTedv3ArlYKhmkpImzKvSmsQiMFrwKbCx+UK7Xf6rfTgFJQiK8DjtvYeB
         bc16faBVeqIKCL/A3r9feUvLBLy4PLusYbTc8K+FOn0XOBggOAIKFLmWtGTzOw2iDJLK
         io/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738575297; x=1739180097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnSS9f3MD8fKZAuW9eSUSFbsKwmpz+6ZY7PPsWdPvPY=;
        b=gueecKifHfU7nrp+93cnGLicCu8De86yZcJMgApBTx+OOEezxSemhr9dBW4TjVZV4v
         7Dr010nuYi9X3k+lWb8JNqTEFWENbmcYHiJB05dcxMqpBIoCyEqZU39/fgv9EIV19mdK
         lPttie526HZqwkqd5h92NVb5MQUygJR6lO1KSyS29VDqywHeDwthKPSeFfka633tsIe5
         4Jvo94z3T/T5sdMKOVTQMX17SX3rqBBcO8VMEOKzEARre1wPgEkG8pPos5odVjMBdroA
         DHYZwpMRFEZhOkf+mSf9YSSwZl+gaiAsGyJzHMYjs2sDGLIQFuALCzRdMU/QRhDYHJ1T
         WyaA==
X-Forwarded-Encrypted: i=1; AJvYcCWWLBmpKjJ/hsGL8Z3HyF4UJJArtpFeOOzmtg7S4U6Zr1R2r2laurEqbAcOI1EauE/pxB1MA5GHBjju+mk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuexdbogyq60JHAI3/3bDNJ4OWAz3e8dhEo4QNCm1UwmVxv0F6
	c5XAC4lJnqU/gmdtjua2R61xmVzJITdc+Yg+Q1Kp87NhgwKusx1c1fwqowBsNEo=
X-Gm-Gg: ASbGnctq7cRCH2x8j+qzUHisNkII47zHhYkDbP4tqfyOXaLi/tGIDBaRq5vwe6KaizA
	ml1COwR028chapQdMD+trvpKzgHDulDV/GP7+Dz4Sv6hp1HgujxWKKRraHUglA2kT0Sfw3jIqa7
	xHAnypCq5nnQQRIyp9bVvAaDireF9zwj7hDpae5PNVaQ9KVRmSFu4SlSOdquSwhbFJbB3DAttSy
	mFqUJm0Jvxp7s3zylmxUakQAHBmPKuxWPwjsY1jLfUktlcUJpsZIiX0TQlkP/sYEkwEp+FuipzZ
	cjhNgHR2qfnq
X-Google-Smtp-Source: AGHT+IHVup80fVqySU5QaAbNVEA/8sgh1BuT2rEc7XuRh35/kJbhk8uzXo9g1CG43bnRoXlXegX1SQ==
X-Received: by 2002:a5d:634f:0:b0:385:f0dc:c9fd with SMTP id ffacd0b85a97d-38c51974c0fmr15234519f8f.27.1738575296879;
        Mon, 03 Feb 2025 01:34:56 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:f705:a3ac:14fe:4e1b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-438e23de35csm147774385e9.10.2025.02.03.01.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 01:34:56 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 03 Feb 2025 10:34:10 +0100
Subject: [PATCH 1/3] arm64: dts: ti: k3-am62x-sk-common: Add serial aliases
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-topic-am62-serial-aliases-v6-14-v1-1-f26d4124a9f1@baylibre.com>
References: <20250203-topic-am62-serial-aliases-v6-14-v1-0-f26d4124a9f1@baylibre.com>
In-Reply-To: <20250203-topic-am62-serial-aliases-v6-14-v1-0-f26d4124a9f1@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=694; i=msp@baylibre.com;
 h=from:subject:message-id; bh=FQq+RvU/nx827rTHdk2gvuy7rYaA2bdFnPUICZ34hOE=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNIX9C6qS0ue+Jl37bOqBIu9Ng55AncafCY1Fx9Jz7+Tb
 h25hGNCRykLgxgHg6yYIsvdDwvf1cldXxCx7pEjzBxWJpAhDFycAjCRFzWMDMtvJ+9KdPhq7hua
 an89wbW6seXwyQKPrDy+AO26uxcUCxkZruU2H5MsZ5HIfq0R1RphveHAm6sHwj0nNhYcvVmfnNb
 HAwA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Add aliases for mcu_uart0 and wkup_uart0.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index 2f129e8cd5b9f127b1d1baab17be868938fae013..d52cb2a5a589a8e5eb325fd90324d57ec1e3783b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -12,6 +12,8 @@
 
 / {
 	aliases {
+		serial0 = &wkup_uart0;
+		serial1 = &mcu_uart0;
 		serial2 = &main_uart0;
 		mmc0 = &sdhci0;
 		mmc1 = &sdhci1;

-- 
2.47.2

