Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E94284663
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434228; cv=none; b=Ahjynf0o+LXafRtb/x28Ufy0rVpQnkM0uL/eyL1f9Fzesc/mQvU6KnCKyrLDN/7EaGRbR5zrKHdbj1OFofr7+EEV/N4q/JPXhly93eMCDrQMaJTlx63UJqJ187vFdXFpBgE1S4loBSfBS88GaVMiniqIp9KTxX4ezktJzGmagxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434228; c=relaxed/simple;
	bh=L2QoiMpgOAYzN7j7NsvzKHgBXzYZoaXqi8JnrpWblsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H+5yTyvaOFOvNCRDh+KVhFsH9jSAP7EipX9Joq7xRyMRtiw06UjzwK7s1WxeRYHYs6kqlySN9qZepR4P//T9+4zRbcBbzU54R4T1P8RL1fJQvM4TodqGj9JmwTi8jNDhJzfrAShFat7gP4tgZRxfVF0zAQjaZJJWDCoqzNMWIWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openpixelsystems.org; spf=fail smtp.mailfrom=openpixelsystems.org; dkim=pass (2048-bit key) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b=fnoVvoK+; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openpixelsystems.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=openpixelsystems.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b="fnoVvoK+"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a36e0d22c1so2957652f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openpixelsystems-org.20230601.gappssmtp.com; s=20230601; t=1748434224; x=1749039024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCHwIJitPDNtzV+MO2vPhGWV1mftwYBcoejgITmYhyc=;
        b=fnoVvoK+RKDsr6kjPWOS9KgbW7tQDaB3uRgk0z2DtTzbQ4B7Gp3RC79wlnc78j8++a
         zrdD+PuElYd5/rhSNii0W2caT2/KKzLy01yCtJ6NNY+7+ZcRe7VcR/uISAeCV0cbW2uh
         0B+ijIxly/Zd17O4KnXdL7gc7nZjXxw1P1yd7vgWHdQ9O1bL5T8pE7ZOzZt7MUyAnZEY
         Myvw7QF9lmJzRp6+HOxDIqDUBnYIuc9icWgljwl5b2nmV+Vum7JTcVPpdOLxI1issX2a
         cQzFPolDC4CfxW0H7Qovr4c+jyD6vu40eFZw7f/2NHGMacAMUaHptx4EtwpBJ68btsYp
         jXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434224; x=1749039024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCHwIJitPDNtzV+MO2vPhGWV1mftwYBcoejgITmYhyc=;
        b=VYSkSPo+uqj2g3s0tHBWLGMNKNjwjGxfPXrNt4IpCBt0AQsmjy6wJdA+PxoSZxc+4V
         YyJGjaYqpt0bQEMiTLg60NqOlCiaMHudeBnXtR81UmpFyIFGFc3nKs4h5Iss+r7XL36M
         hI9koUxCqDZade/QD1bRxDZixmn1AZ7f95JBKYU7RTPdbHj8SyREtb52SqAAWPGI9ghZ
         bw2ecAZYi8N+ZBWTvSr94nuSVbT+mpjlSMKFKDTQLmyrx/hMqzYUSaU00NR7GpVEOufg
         3DMg038voMdjweRzBEU5E8Smz9sPReL4IlbT6gZBs5eE92b9jfpDgLMEUMotsaI19erS
         Q7wg==
X-Forwarded-Encrypted: i=1; AJvYcCX9O6iNCC5uLi9nhgDZcz5XjLSisnmoubPvJvv+sZTQl+Ro1FrrfPubnvAJkJDIBheuIsHfwlxFt5ansis=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVQgTOEPqTEe7p0lrnUK6Z3MGAQLwPjei62kGo0MBRP47jieWy
	GYUFQMtswvk9L2FW8NRFbCiq/VAaBnUYVPrlp0wlYl+9KoSUAgREeF3YRCrqoYvZ+hE=
X-Gm-Gg: ASbGncsC8MoNQkwuis6ZhMNonXaYqOmAaEbQQ2Sr22k27/SQK5aQk8M7+VTHBVpAJrV
	SPSIx0n8TFxYwgEIseH1XcPA9e86rNkRxwfLnL53gs9lFf6mC6S/9EKrpspD8sUEbIc1nhNTiMR
	2X9DaxJ3jOQFZtQmIV2iyBWP2EX1UoYDcGQrj/H9ZlsNwgczR8C0rbR7Ah3hK9wPzzsAZ9v5CNR
	Tk3jBTM/9fP+ChHoQtoeQwH9jtKYhTZxz+EqO4wy15ph1C9/Cwpn3YEKadlwgK3dWAk6Uv4pegu
	+1N+j/XsUTPHrBIFx5sxmOLppPDdmHlQ3MO51zE8jTLxFEBK463wFIT0bnri+FwSHL7qIJd5By6
	kTQO9SYLqjA2/EHGlHG3cVuaV3gomxrPzYnJ7l7sBCoY=
X-Google-Smtp-Source: AGHT+IED45FQM2vua2vIu7C3PBz+jaHdAgReY/lAMgqoxxgZ4KBbr/mmdnIHszTsfaSdGiBGi/ntYA==
X-Received: by 2002:a05:6000:2c11:b0:3a4:e6e8:ac1b with SMTP id ffacd0b85a97d-3a4e6e8ac5amr2972942f8f.51.1748434223753;
        Wed, 28 May 2025 05:10:23 -0700 (PDT)
Received: from [10.0.12.41] (253.124-78-194.adsl-static.isp.belgacom.be. [194.78.124.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45006499727sm19874145e9.3.2025.05.28.05.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:10:23 -0700 (PDT)
From: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Date: Wed, 28 May 2025 14:10:09 +0200
Subject: [PATCH 2/2] ASoC: dt-bindings: tas57xx: add tas5753 compatibility
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-asoc-tas5753-support-v1-2-a50c3f6734ee@openpixelsystems.org>
References: <20250528-asoc-tas5753-support-v1-0-a50c3f6734ee@openpixelsystems.org>
In-Reply-To: <20250528-asoc-tas5753-support-v1-0-a50c3f6734ee@openpixelsystems.org>
To: Kevin Cernekee <cernekee@chromium.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Bram Vlerick <bram.vlerick@openpixelsystems.org>, peter@korsgaard.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=bram.vlerick@openpixelsystems.org; h=from:subject:message-id;
 bh=L2QoiMpgOAYzN7j7NsvzKHgBXzYZoaXqi8JnrpWblsA=;
 b=owEBbQKS/ZANAwAIAblauka9BQbwAcsmYgBoNv0t8tlsWJHF6JYAINe/SQ1/WK7J7WDtFULhk
 aN5eiyvExKJAjMEAAEIAB0WIQQO7PtG7b77XLxuay25WrpGvQUG8AUCaDb9LQAKCRC5WrpGvQUG
 8Bh1EACE40ZRk1UccTLzW3s93Xm4PFR2oG9NTmDHZ8RYCVJqcdnRInm302dSwHxSUZ9kiLaKIS8
 cnchN8+UU4Ry8scY+fyzeTTQYIC9p7xXnLRfUxRYZ/BQcgIruPy1PAxN0yoEG0lWJn6ajLPPnl1
 MTlgP2VDvG0rEwQDavRFpxmY983+kNAaeeoyJ6VGyfSbZozJyV32nJq4Mo39Ptt2OAgN2xxQJJ6
 m3fdggpWULzuD43FlHyBgt4TrW2cMjTyDcLh4ayk7qTG4BmJMbRyeqwoKiDL5TrgttpUk5KXaVX
 I+4bcpC8IBOgvs+DAfA0cSIUhznHfOVDzhgji6Wn9Y4M14t81UYOFBDqOVJXg4SpFUY4ZegHp1X
 RKAX+aM7jjNDDPMLC35guHxD2un86YCsTIZ8ARfo43bpE3PMQcV9KwyvWqHUMjBAL0AZCrTphIn
 is717hztgexbARZanZb8ooOsrp5jdsfPkt0TADW2XKIs1NOlv+/6WEsTNDrdUGb9ZS9m2Z9NAut
 ieJgPhhIynmrrtTqolSgZzfvI6fiyUP+kP25jaOxglurHZEqlFUrlgf/vVBpCW1te2SStaRWaWa
 Lu29/Z5I2bP9pB8YEEFGhFEQ1vtl3F5gtM4fDxu2s+NuCBI+dUh4AlSSAnvmpGipBq2rSj5fRPL
 L/oZ228M92bw9hA==
X-Developer-Key: i=bram.vlerick@openpixelsystems.org; a=openpgp;
 fpr=0EECFB46EDBEFB5CBC6E6B2DB95ABA46BD0506F0

Add tas5753 to ti,tas57xx devicetree bindings.

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
---
 Documentation/devicetree/bindings/sound/ti,tas57xx.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas57xx.yaml b/Documentation/devicetree/bindings/sound/ti,tas57xx.yaml
index 74f7d02b424b9c5d5fd7ea573d7beeb5a2253337..0b013a34e2c10787cf7627a84565078c49bdb7b6 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas57xx.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas57xx.yaml
@@ -18,6 +18,7 @@ properties:
       - ti,tas5719
       - ti,tas5721
       - ti,tas5733
+      - ti,tas5753
 
   reg:
     maxItems: 1
@@ -98,6 +99,7 @@ allOf:
           contains:
             enum:
               - ti,tas5721
+              - ti,tas5753
     then:
       properties:
         HPVDD-supply: false

-- 
2.49.0

