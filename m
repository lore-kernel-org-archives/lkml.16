Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61D6145B24
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744118505; cv=none; b=JkmPFgWji2qRVfrqUj9NmjkAxLAknZZGZNyXB9kzCk5S/+CmxeGQBj2h86uxtcrfD+yv/Su8dGk42g1nqTBOL9MxgKnqJ6AURBGWPsMWxB9stFJN4jk4h+ICPdKD3uGevObxtSuRnBjcc1us8jgG7gJXqp5PPtj2iCW6JqpzTBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744118505; c=relaxed/simple;
	bh=mJgJq+zZMLWqDbzOKvdDkq8EaWO1dzLuMwrkMz0KsXE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fs0jVdK/vOI/6KxD4SNnZbOjrRECBSoR3bYEOt/xAtwiRc6gqzItFX9IAV6mCXKH6lqSLSVNKdQ16jt/4gKDo76sDmxlJ9qiKAPbz9kmilmvqtBVY0MM7yaeWYDGvq65ikG/njmuhOYGLlpYXkyFngcK/odoWMOsHiyPFPwZVPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mhl1XHJD; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mhl1XHJD"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736a7e126c7so5016183b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 06:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744118503; x=1744723303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xl8SMQ6yFSz1U//qzOWMiPyaq5J817/iUIFM3Px6Z1M=;
        b=mhl1XHJDK2IcvJMfVaV9eYBDBDW/rRNIA7PJJTcblm/L8azrynygygiiYpMp90iMSB
         u8UIgT2bW5C/w1z1iDfsyXZIZJsJSkFtNJE1xBn2yX5RRtvGNJFfA2LMz5McLBnxf5Z6
         t8F4h60frllFCIweaIH7c7y2Axm63nDkslwxmw8SISZlxeKEPjq8neOcvhqEqd0hmVT6
         EZYVFYKAb9ma+j0VVZTdOTySTL+YcTcATzEfkWLI+wvTrRAVIsCiMA/fQWtzSXbs/tKo
         wq4sOiy1jrcDSaA6juSksXURBeukpcYQKAGno9HILovjmo+GyZzMt/gTg/cXDdzZnQ3G
         DLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744118503; x=1744723303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xl8SMQ6yFSz1U//qzOWMiPyaq5J817/iUIFM3Px6Z1M=;
        b=PcFCK+P/svWEljDoQMQOFfApPQP7g4bcn67AVFUfX/yQR3y2dd9aKVFOzZVUX7spql
         VucuoLz0AaEYtTCxj/Ht2MUy0SsXD1dQbmavgQqypd8x9aI+OJdL8i0egjYiSdKzA0qy
         6MZn2XrRk0sW4SEAnQWRIZvdqf05HrSdeyY4/pT6+FaT/LLDGlBy1owLdcCuzGs1/Ckp
         874wRUue66880zjh3NIb/lI30vSEl5h8q9iyXD9Bax7I00ralDWdyu8NyJhhIScMVpWy
         PoU8u1yTP2ljCcfQcYae0gipi6Ngxj3+LVrjpQsIFtftU++/FpKTrXnrdFrOcjIukW+2
         Kdpw==
X-Forwarded-Encrypted: i=1; AJvYcCUKzslNnTB1UvyCtWXLgzXlFHcdn0WN7rq5lAQlz4DAbCDMuYS9WFsgUVt7/XvkL6yp+23c1QP/MsO373E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhfjpzJ7l7MnXINdOM5FjZw3H4U803PsoD4YeWpCybbWPvZ0Rg
	hHnOOlgWxtoEGvQ1F0wUUfGUy3TXiccx/e+rqK6ntgGPTxOLMjbsJ4DFh2hIq2REW+WJOLDIoz1
	7
X-Gm-Gg: ASbGncvAnoTzONVhalAz+lIPY8TCOoI1Kqa3iBW6kAjTpBKL2YNKIqHpz49tj6bMkNL
	4zZDrYjTgnEOozAxuT8YPqw/7B1xnAz65Q1ITBRlvfVEp/bTco3urkYYeiMJau8chGoU9sKBW0Z
	W7thtWcSIAXZifjS9fpWF3lWm/J/3k25hNlOnWABdCXErwbkKYkkAVc1cduhTr47kIsZpaL9LlH
	/8WCeSc+8dADeWXW+IWx209na+MYCnfPfyqLWPpDNiQusR+GnBg6XxJRD4nL6XjdTcAwXK4/B0M
	UVWBoa7h+zV+GMb1tt4VnHAHwfkfpPccJ0a+p1NmBO4jj4CdfUV1+0Vxev+VZhNz2jt/hzraM+2
	RXOVCJHrvrkKK/Gi1Ww==
X-Google-Smtp-Source: AGHT+IEYI0yvG77vI7wLIcJ1amCXAazIRjj6uaOMMeamEoCcUQRJzOz8XlTJXNoLFtSNfoVsf7yykA==
X-Received: by 2002:a05:6a21:3942:b0:1f5:a3e8:64dd with SMTP id adf61e73a8af0-2010404f3eamr25769684637.0.1744118503224;
        Tue, 08 Apr 2025 06:21:43 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41af71sm7439565a12.75.2025.04.08.06.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:21:42 -0700 (PDT)
From: Sukrut Bellary <sbellary@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Nishanth Menon <nm@ti.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: iio: adc: ti,adc128s052: Add adc08c and adc10c family
Date: Tue,  8 Apr 2025 06:21:19 -0700
Message-Id: <20250408132120.836461-2-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408132120.836461-1-sbellary@baylibre.com>
References: <20250408132120.836461-1-sbellary@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The adcxx4s communicates with a host processor via an SPI/Microwire Bus
interface. The device family responds with 12-bit data, of which the LSB
bits are 0 for the lower resolution devices.
The unavailable bits are 0 in LSB.
Shift is calculated per resolution and used in scaling and
raw data read.

I have been able to test adc102s051,
hence adding just the missing ones in that family.

Lets reuse the binding to support the family of devices with name
ADC<bb><c>S<sss>, where
* bb is the resolution in number of bits (8, 10, 12)
* c is the number of channels (1, 2, 4, 8)
* sss is the maximum conversion speed (021 for 200 kSPS, 051 for 500 kSPS
and 101 for 1 MSPS)

Complete datasheets are available at TI's website here:
https://www.ti.com/lit/gpn/adc<bb><c>s<sss>.pdf

Co-developed-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v3:
	- No changes in dt-bindings
- Link to v2:  https://lore.kernel.org/lkml/20231022031203.632153-1-sukrut.bellary@linux.com/

Changes in v2: 
        - No changes in dt-bindings
- Link to v1: https://lore.kernel.org/all/20220701042919.18180-2-nm@ti.com/
---
 .../devicetree/bindings/iio/adc/ti,adc128s052.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml b/Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml
index 775eee972b12..392b4a3e867c 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml
@@ -16,6 +16,12 @@ description: |
 properties:
   compatible:
     enum:
+      - ti,adc082s021
+      - ti,adc082s051
+      - ti,adc082s101
+      - ti,adc102s021
+      - ti,adc102s051
+      - ti,adc102s101
       - ti,adc122s021
       - ti,adc122s051
       - ti,adc122s101
-- 
2.34.1

