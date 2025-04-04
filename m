Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15391A9B32
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 09:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743757290; cv=none; b=Ahjjp/g48HuV3cR9S7pM0JBUNhr4bhG2xFTYdmt3MwxJlCewdwCjyCeeCAptXjRFul/2eyiitEn1dc1xIYTIIahP3UGpfq5X09QxlBc1KWIYGVIvh8gwniXxDNDzoMrnKsvvmzAG6KgbKqY3oNhkCxH5i5ezh5p7M730riU3/+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743757290; c=relaxed/simple;
	bh=YzcC/8IF6WlBpTBBJmagM6VLu/QII2dkapejxYRXF+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FA8HPo04z2Z8sOWwHoHTxHB0P4kbHffDX+KP3W9VNUxSOtJwLBoykPpBNdJEgliLJM5CAjpBUG4xq5quh5ZwLa6IsTw7GAsyPi6m8Hzggbdx8YSUP6bYanA7JYBO+En0RzFxGEtIONktZO52A6JjqgZTeQdPpryjivqBotZIZ4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=sPbHTNIm; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="sPbHTNIm"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CD1A83FE37
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 09:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1743757283;
	bh=xut80Yyq76Rm1brNcTNysemzqDnut4empLNRrM1YUC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=sPbHTNImQPdYeirXjL9lDGGRfe/f9TJc2zUpGG8fZ29t/wll55D5ngPa7QNUztyP6
	 8HHp4RCvnkDcKFhbHLdwMnH1rGj1+w7SovzPC5WmpBR9cQ3okNcF5deBxXWwwjLEFb
	 YHv4YKlo0xmb/cRhcGc7Js34lEEMlPfQSMwKNl+wm1Q9gXaix1/1ccp+lyQjW3JW7p
	 ZVbHJLW0ScJ7rCjaYs+WyonlYdBn6O7q/AIp0oYR51QCOF/NTv7Yy5lfq0uvqv+mlu
	 8Ep2Mv+XC5gPY8sotn1nyhy3l0BN0iIETLtlIsh21ORNlsLcx+4YAMWC4YozbFtvIE
	 hGc7pHdFQW3vA==
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43bd0586b86so10155775e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 02:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743757274; x=1744362074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xut80Yyq76Rm1brNcTNysemzqDnut4empLNRrM1YUC8=;
        b=Ha1QfbrVuSvODjeEr/fBKu73/+hbQ73y5Kurm//sU1b+PFYITHq47hzwAsGD0D6ESv
         OATjSf1AN/lA7a1Xk8Pc0/LaA5Ll62y6SofaomDJGgpfrLA5K2rGmbLm/GOKQAgVzo+V
         PdnGwjiArE8FDsyCzBZL9kq/wNUaBzycU72YFyFwNJYkJhWfS7ZePzDIPF7rp25u/aXD
         U078dsnTh7atsK4cm4eZnAX07QDTrJmJLhFuktn5AAYKOnh0JUi+Nl6Q14UTGotZznSN
         tdpN9dwb9A2sx9Pg2IAe79ivNmdlUHc0ZYIsLGnN9cT7VCOFizrDoqmIhOPf9VI1PxbL
         se/g==
X-Gm-Message-State: AOJu0YxdRW6MdfvMX7qX+CNigsb+eFYGRIijImVquGGHGAOTla25Q8JE
	jhkMU79WvheD8HxdcWZA9qDRAKQH9F8Zj91im35JfoH3o1dnTzw9E/gE0aSbM+/aN08OEWXLUZr
	8Osfb5/N21SsILOXbKec5VA16ljjS3MbV5jLVZ84II3s1jufI1q4rEi12jeseO6t7DXE2KNYI6U
	QhWw==
X-Gm-Gg: ASbGncvKcIIv2Wyvi3yibMAgzveqkiudSvg6N/WUf399qq+BemVLajZKxVxbUK9grZJ
	qijlw+5F3uJfBsRkCXemFBC5F/PX65xO7gYesnv/a+/VadX2UQPbm1y9tjtG8K28ETr1AL4kIHe
	8ischDA5S5Lpt5S63soB145Tf4e09mduGNdRgCy+DmWPDQhNTjggeNWuUuXBly2j+CwBfFG1ARr
	1Wv8RZQQB8gpjc5QHWFPZEdK8MM+lvna77b/hx+tIfpDHilcUnoJ0sUpqN2Uq8qAhonvlh7+Pc1
	Mn1m9glKr/5G9jCgHFR49AUerYKas5utdVkajY/G0pdXTF1pb/VMziCScfep
X-Received: by 2002:a05:600c:3b13:b0:43c:f5fe:5c26 with SMTP id 5b1f17b1804b1-43ed0b481aemr19668145e9.4.1743757274443;
        Fri, 04 Apr 2025 02:01:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdpABidDuATXZ706ls87vLzgKf56I7dN2yooTu5/p7/hh9qVoP7Z4UPtu+CCEZh9am2E7ZrA==
X-Received: by 2002:a05:600c:3b13:b0:43c:f5fe:5c26 with SMTP id 5b1f17b1804b1-43ed0b481aemr19667775e9.4.1743757274077;
        Fri, 04 Apr 2025 02:01:14 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c300968a1sm3895816f8f.11.2025.04.04.02.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 02:01:13 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] dt-bindings: arm: qcom: Document HP EliteBook Ultra G1q
Date: Fri,  4 Apr 2025 11:01:08 +0200
Message-ID: <20250404090108.3333211-4-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
References: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the HP EliteBook Ultra G1q 14 inch Notebook AI PC.
The laptop is based on the Snapdragon X Elite (x1e80100) SoC.

PDF link: http://www8.hp.com/h20195/v2/GetDocument.aspx?docname=c08996392

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 6260839fe972..1f2a26ac33b9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1133,6 +1133,7 @@ properties:
           - enum:
               - asus,vivobook-s15
               - dell,xps13-9345
+              - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
               - lenovo,yoga-slim7x
               - microsoft,romulus13
-- 
2.43.0

