Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443731FF601
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738575302; cv=none; b=BH+m1xoFECNkkA12eKLq6IGQ9Oq0V5YfBmSXkh2JzNm4iur/sLBrB/lXme/PEposomnQ2xOVO8sVu9muY0iNXy1qJv9NX1rRdoiqvoTsIpPerlcJ3y2R6i8mrCszTnyulA6/yU5UGeZ0R6da60llmmJfJTWnbRlq+5R/bDNrzCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738575302; c=relaxed/simple;
	bh=xZcLWZQ4QsdglfRdxvaMevm12D+Ww9w5x3JcltngFEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nEuZRJURzU0LZtCeia775xW4pmdY1v2noG2BPTgGg3HbZs7NlRPlaUL3tx0t5ADzP6rNx9+UzXE1CcC75U7DMRrHe8aQjnP0uF753OLi5mguJBdr0F3psGPmOX/R+IBPzZiNVNPZX0feu9HoaFMROryBWAEXlQ32XAsHnSRPm5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jeyS8KBy; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jeyS8KBy"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3862f32a33eso1807862f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738575298; x=1739180098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fWoYWHyR7+TsWQTCalZOp3pZOOrnoTOaMnK3QTfKPhU=;
        b=jeyS8KBytJWP8ZwN+rJbzYiSgtmjVq5MhKvv+racgR5mqO9gMrlO2aUwdOO9Kc73if
         6NWDHTJW1zUbJ4eLmsqMbaeWsGvU1qvATalBMf5js7alOyqVRN3AlI96hn19G3OBmFG6
         mn1M5i0Brs3RAaXnN5GKuCEfkOmqJO2C686v00LAvys6EfJQbzwPx/LnyU8aq5cVhhuN
         4XHA8OUW3/P2PSJDetAjSMjE0aGs0xZv3pWWiFkG10iZfco+Jmvb9mH6Nl83zpzgZbyA
         7avRlsiGRk+6qIwYQdmkJVD6Dq8JwlxAO1MYYcUJDCUXtVjmX2N4qqGPJ/jhdzIzRo/t
         q3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738575298; x=1739180098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWoYWHyR7+TsWQTCalZOp3pZOOrnoTOaMnK3QTfKPhU=;
        b=BtLiOFeJZvQbk6vksklLjI+ct+fBoYFDLxKGqshuvfwISGoL0N1I5iD+t3xn7bozuB
         TBLbKVI0/6dYDLXyOc83dsfAROCZlPIbMLgkj8kfYyRinwjmjRri025D8txQhKQY3VFf
         9MBb03JF75TYDAXE1gtf9bRs7EY2ezRNi5OOZHQtx4Vo9UiBYxrmPSfVB59yOp2NrpRS
         pe1Sy2azXF7okX3TxOX4RliCBy5pcqJPbY/jjXm2dvI77bhuYP137Z7g7RaC7SMYOp1x
         bTwDS1dX8hY/6L8pzoy7uYxUITHsr2wWAoZ7+0y0y7lvdO5qR5FY9djmq6mbzAQBaOlM
         6rWA==
X-Forwarded-Encrypted: i=1; AJvYcCXcaAAy9FvkFEapFNTUkR6DQ7zZ1SJaYVHonFkBlFELmfRtB0zNzwioO3jLhGEvvDPCKQiBZPLkDP2hPlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9lfJe8kTZCodpj91lwwwpqAQqrap14peTr+zHWVTCv8Q1cxQ6
	arRprI8OHBMfh4FrqF9Ij/tCjny88QReuVUZnjIrQR1dafRpDHO/2uYfUnekXpI=
X-Gm-Gg: ASbGnctVRa7ffRx5eWDW53Ce8N+uIlWcqiucqcG5FDgPNa4kxed34zeBSh7wlPBrcZw
	2kny1TASEzBcQs+7rQI5WCH//MgXPa0Cjzp3AbkuJaLQBwOE6BvJlSsR+EWlD7H33ovgc8imDXN
	YF5eJz+7FXC1AoHL4mEB5XAY4XfqQIEly4/3E3MrjMWo3nAy3bk869HT89plaMdXhqEdDmnAMBa
	2h7insgSc8hKRaRcUWVpikgMJT81CLRNLEfu3pd+BC+uOl0jB1rucDwgPKRcrGOfcH17xiJVvcE
	Q1T34/w4EdDC
X-Google-Smtp-Source: AGHT+IHOWivSeEuzXEynCPDAfVYghr4uhGNZt2BHavq7Fng3NU5UTsswmBnk1lHximf7bX/n8I2h8Q==
X-Received: by 2002:a05:6000:1f87:b0:38a:624b:e37b with SMTP id ffacd0b85a97d-38c52097bbamr17750130f8f.53.1738575298184;
        Mon, 03 Feb 2025 01:34:58 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:f705:a3ac:14fe:4e1b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-438d75de282sm122561995e9.2.2025.02.03.01.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 01:34:57 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 03 Feb 2025 10:34:11 +0100
Subject: [PATCH 2/3] arm64: dts: ti: k3-am62a7-sk: Add serial alias
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-topic-am62-serial-aliases-v6-14-v1-2-f26d4124a9f1@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=645; i=msp@baylibre.com;
 h=from:subject:message-id; bh=xZcLWZQ4QsdglfRdxvaMevm12D+Ww9w5x3JcltngFEc=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNIX9C4PlmaeFNx4cFNOSuD9qtCZ4eLZFtXVs/4Il+r/U
 3RtSbTtKGVhEONgkBVTZLn7YeG7OrnrCyLWPXKEmcPKBDKEgYtTACYS/5iR4eg3haXHPrSHlT7a
 FuD3a4fHcsa+O0dzVF7KLhJTW9POUcfwP1mkqe/ecY7G0H2yNpPv7UnWrhQ68zdjkddHtz+XtqQ
 a8wMA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Add alias for mcu_uart0.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index a6f0d87a50d8a7ebdb61e609e8071d6681dbec9a..174afe1ba4bcc01f7f67c50d65172d9f6cf6c6ff 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -18,6 +18,7 @@ / {
 
 	aliases {
 		serial0 = &wkup_uart0;
+		serial1 = &mcu_uart0;
 		serial2 = &main_uart0;
 		serial3 = &main_uart1;
 		mmc0 = &sdhci0;

-- 
2.47.2

