Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BDF1FF612
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738575302; cv=none; b=plPgdWp1sMkwSnEfZ+YeaTpbKC3OpQkZyJb2Bw8Q4q37UHwvsZs+yXMPxrzsAWOtK9Jf0iC2WAQirUaUv83goQcTyBAddirRDgzQayhrsPOc4YUlE85v1QwSVlRJgXaKNs2FkX0aWmzsfOLt04RcgMd6slF2iqmkHb5acs3aQVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738575302; c=relaxed/simple;
	bh=B5Hkfxk5WklaHx3GOc9YxJMEsc74Ai3FLRNcmA0w6r8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z2dAwvbptzSABM0BWZrEU4Ke2JK9nZPPo5wAnJdnMZuZ136dx0TqesA06tpZejUS/cQgcZ9vbTUWzFkrDZN1+r/g0NeC5A9Lfx2VwYxPGXol/SftqQDyJxbUb8XmnXG2rQX5ksFQJPsC4ModKOZ3jalvqqdnT0TQGLO10Ys4hfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MPPMnLrI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MPPMnLrI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361c705434so30283215e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738575299; x=1739180099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ent5BMlYQPM9j3M+5ahy76qYgLanS7SSLSe5SbsU8f0=;
        b=MPPMnLrIkAEkzOzBKgUrAXijLQomg+x7Uin9Bg//80z6jB+lU7fX0pHydNjVJj5OdZ
         NcOIB/k8ytUSrFTGwyPCzV76x3nmVHYMWnjygItg3jwn+xe38PltKqHNJQyeAXS8ASeU
         NX2l9Bva3EygDxwc4qEXOKlWIOTTjF3hIxtydPbDCp2BxvONq9U9RsSHpbC2BATfi8Q7
         6Z7MTfHNu/b5CykI2kbYcrkprzfC2TeK+MlA3KgThYMrgj6HDW+J9G7EWUbo//rTC5+O
         UnPyX1D/DKll9L41FuzKf4YFpUIvDuRbkw8wlIXb7uWJCh5PJEWhSvDLiDDOby/aqXtP
         TTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738575299; x=1739180099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ent5BMlYQPM9j3M+5ahy76qYgLanS7SSLSe5SbsU8f0=;
        b=mZWbdOwBupjvOC2UJ376qSHyCmeDrDbAEF/W/NbwtCmMe42wFAEjA/mDm060upjrPx
         ZFMcG1WxP7CdJ6tGlUGA6yISYHbiAE8gL0uQwzKShWJwC0FafkBwwePbmK4dFAOxznij
         mNZGabJW25lREy6mPNuAgkdY+mPpD12U1Qrxahp/LScmd8vybiufn/7Im3JLww8UhNbq
         8jlQlz3n9iJwI8jkXsf9B8clGSbKoox7VrObaAN3+hRiktb1Xa/rZNcKc7aO5PPJf3Tz
         Nbo7Ognjmu988uZjvDs0SiXgouHV8dNB1/wavdKcVh7mSW42Ixu2YfQtYlQzXSDg/hAV
         tyNg==
X-Forwarded-Encrypted: i=1; AJvYcCU+LYH3eHYspT7bJ/fJVrE9foJFCZDiox/63eXLm+xjdDKmVIvtFKQL5FL0n1nUSs1GTaq4i/v/jo0/wSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJut1ePoT3nY9FduWKKzONDA3DI/lGY4Nd0yCwysH+dIlb3sx1
	lNVzv6tb6ufa1sbNulL04XZFAAjkN4A+m8bvCkhKtfGyU+Hqr11d10J4z0il16E=
X-Gm-Gg: ASbGncvsSRjmFGfoG4RxMwkXpkaQMwuo5STahuC0r3laXFGshmGfYX/zoTQAyvDSQ/m
	kJwDa5uKVQEMMnZn2rW+Z+nE7+wfOcwKVXiu1EhJ2zq5Ebq7y5BuS5lyMaEyRZvkMVyWzoTYjh/
	DCj45GboikAJBlJ63x0YPfE2zR/HUZo1yBM3w6Foflf/VGY3R+2NfS48Njx7/5EbeIllauUQJUn
	lNuS4s0IWqB7UQyOOHdiz49v4zJtPM6D+6mL35wf2K3bF0h7Yn/msm8ACBjrJphSLerbeGuBSwJ
	a5XmvKLXwgPK
X-Google-Smtp-Source: AGHT+IH/i47rSy0zBDmlrlLi+ULkPx5emtysPonhzE5Zko+R3RefPIXy6uiptilCB0KPK0c9Zu3S0A==
X-Received: by 2002:a05:600c:4e01:b0:435:136:75f6 with SMTP id 5b1f17b1804b1-438dc34b179mr206291845e9.0.1738575299204;
        Mon, 03 Feb 2025 01:34:59 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:f705:a3ac:14fe:4e1b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c5c0ec80esm12373391f8f.10.2025.02.03.01.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 01:34:58 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 03 Feb 2025 10:34:12 +0100
Subject: [PATCH 3/3] arm64: dts: ti: k3-am62p5-sk: Add serial alias
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-topic-am62-serial-aliases-v6-14-v1-3-f26d4124a9f1@baylibre.com>
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
 h=from:subject:message-id; bh=DM6U8sXm8knG/sEVdw0Vde11Blu3uduqsrLQMjwQyb0=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNIX9O4qPPS3tUzkLIdzwvus/D33e1QaDmqmq9V95ZITP
 +tzYMrJjlIWBjEOBlkxRZa7Hxa+q5O7viBi3SNHmDmsTCBDGLg4BWAib5kY/odVai7VVvn89sVJ
 o5tT54bYh+/IkKkxnXcsn/1xmsfquNkMf2W/GUjobZr+IFvog8LJs0xcW5WWxrVzMms8VH3sIbb
 tGTMA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

From: Vibhore Vardhan <vibhore@ti.com>

Add alias for mcu_uart0.

Signed-off-by: Vibhore Vardhan <vibhore@ti.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index ad71d2f27f538d68644491bc6c1831acdd9263cb..81504ebc6a585f0c88cc4f448eeeb04e215ee27f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -19,6 +19,7 @@ / {
 
 	aliases {
 		serial0 = &wkup_uart0;
+		serial1 = &mcu_uart0;
 		serial2 = &main_uart0;
 		serial3 = &main_uart1;
 		mmc0 = &sdhci0;

-- 
2.47.2

