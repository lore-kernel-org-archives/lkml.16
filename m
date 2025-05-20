Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BF818BBAE
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747774882; cv=none; b=Ea3jHKxvrGZtIHBSl/dkn6H+nx1sFXM3S81zxGHxb1z3cIBQPNK9qtQdDc2tQnaXFdaW8AagKjEICNn/Fsro4n8bM2p3r6CGwTj+QGPekIlJaubstNQrr4h8I8/Mr/3yPAnBz45eG2ewTaRuARjX0z3PJHATc8LffQWNpl73cCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747774882; c=relaxed/simple;
	bh=Afxwdef0Jf2HSBiCXGtNVmL7wJWM8CS0UaEkxk3+CTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZkT+FqJVWY2tVjSzQBSf9FcA2YEytwxQ0PUEL3PodqG9QdtRXtkvu2tg93SKePGspb67Ait6Qr7+FOm9W+px7QDj/M+5s9PyJOYHZkCfxZhb6VkhK1enSDLMyZySu4cpenTC4vrQFXWMyOn8gecmjDzpd8O6/JIUX0WVkc4J0Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uEzqWk6h; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uEzqWk6h"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72c40235c34so1993861a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747774878; x=1748379678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fp00wL1Y5X4So9ecfuqEeP+KnSz3366qtgJ3q9p0wb0=;
        b=uEzqWk6hLoYOG1/xsTIxSHbE6ApHxSubjdnzOVIGG7wG/ZAWxO4zLvY6Qkn8bpWxdx
         0ysPPIyfgXHNIjT8SAdDPzDAjZWEGjtH11nJBUJ8f0gAghREC3WWmPUGMkvZwiAYHxyz
         rBET8CwJW+4fx1pBt+cvFWlSblh/48eovAOJfvPARDeMyhW/fogTysDpvHs/WjDOAQlX
         R19pG1zqfLu6FAohpMb1VmvahtM2P+Y7rGEyfuZLWjXs2gepFE9+4ANS/yuuz2uj1eD9
         2z8fsBVSAIuczSmfCFHlTaOxftjIfLHmcgEidw3vAjf/oowIImXccxbA/uIf0eJZMLVz
         Zv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747774878; x=1748379678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fp00wL1Y5X4So9ecfuqEeP+KnSz3366qtgJ3q9p0wb0=;
        b=FgFco33lOMp3jbLPnlxDj/PmHZKWugOjeDjI2pNdptwdJQqLDnn7nY9WJCVKwQCyhm
         4J2mvodSGrTkZCB+IKgXuOWMAZw+oq5NB5zlz8deXEId1mpDsca+/ZTpQHSDHqp4ADxH
         clRiI1jjXHNEtJrngLCE3K9sZq8TiwRUqMJGYwawlvKJtM5N8dPleeUNle7TOvfp9r0+
         /PI+6oUkXfpTg02orgUyg9PKDSgi0Z/YjgdfetzdhJWC77g/rDLtSYOY2LaweSYwZOJt
         bm+TTi9D8Ft5XB8LyHKYnTQSx1bgefHI98CcovG093fmB1W6HZEeZOr5jv0CqBCqxT/c
         26yg==
X-Forwarded-Encrypted: i=1; AJvYcCV1qhvdafPx8+sY49cStlUSKar1aRD/cr06CqpYHyWZv6URhjGknLujznTJM/rWzS7Y+yPoSzNQn5QgB3M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3/ZZ/Bveta43oouqZEDlHq74D2z+sSplAdoFJcQ8is10DZSks
	OTmEMlugqmUe2Oh1ABKh/EU1ktQmGO95SMP3ZtiepEmYfkhGpJMx19X3MC/GIWoy108=
X-Gm-Gg: ASbGncvG8Q9+MvspZtNK4jPj4N+1o+4thGOQYlThO6GAlH4kZxbMRXkqScaStvk9oA3
	dOKCChLO/Zfx6xiMbAaaNAIr8DR5fW9wZ32Aug/muhA6Heixew7Wcl9HJF4H9GgXQlCpCmpm00b
	wePVpPefGkj7MT+4Bq1OO8R4wrNPwAGXOZGYKNrZtyc29EeEvYgADaGb5WxqWhJo/VBC43utGwD
	/t3+Useg1g8axj+xAz94KvkNC2mr110hkhrskap/q3t2S+ELmobGviNDUl4+hVFwL4rf7NdoLSs
	aKPIhoZyXXV5mWFZyN1fvFdbXwVJ2fIPXICuGZmUfbfk0RwdcccLbcJY
X-Google-Smtp-Source: AGHT+IGSTahwpAX7LljmxRMHFEq8h6BDIh7NR6hXlQMHRupeFNvQ3f4OkyspW4HnfY3R6YHMmE2VdQ==
X-Received: by 2002:a05:6870:9f0b:b0:2d5:c61f:c2db with SMTP id 586e51a60fabf-2e3c856789dmr10978508fac.34.1747774877841;
        Tue, 20 May 2025 14:01:17 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:d77b:6acc:2ad1:8ff])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e3c0b2e1a7sm2348470fac.48.2025.05.20.14.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 14:01:17 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 20 May 2025 16:00:44 -0500
Subject: [PATCH 1/3] dt-bindings: pwm: adi,axi-pwmgen: update documentation
 link
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-pwm-axi-pwmgen-add-external-clock-v1-1-6cd63cc001c8@baylibre.com>
References: <20250520-pwm-axi-pwmgen-add-external-clock-v1-0-6cd63cc001c8@baylibre.com>
In-Reply-To: <20250520-pwm-axi-pwmgen-add-external-clock-v1-0-6cd63cc001c8@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=958; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Afxwdef0Jf2HSBiCXGtNVmL7wJWM8CS0UaEkxk3+CTk=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoLO2IrLVVgQ3h8rSSHUUEyxF54KwLtl/rLRTCT
 OAEf9luY5KJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaCztiAAKCRDCzCAB/wGP
 wE6EB/94O78sxYgWzSctw9RteUH86F2DfXA1xiszLyiQGRtJk7SeXtAjGkqO+26/tXVytEcCz6i
 GHvXeDef+Mbe7TT5SAzSnQJtNQO/LuPK7SUW+fbuZ0IDn0q0/0nxhiq980u7kywwCgrkifV6F07
 GeecSV69FuPrW/oBynvN8VCo9OLvJZ+tGoUEcHr/kNC9UU2BqMibSrI0sORevRZeUnaCr7hs2xK
 V9eJSNjoVt4wCGXwmO+7H8mPahMUy1gYJ4lhWihhyBJjienA41y6eIO9rcBOSGaF/vD2Hbd3mD9
 zaI3VD1PmSaDClwS+T8yZYeMEcnDlKtIUJdR3OPVgyxU1guU
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Change the documentation link to point to the location with the most
up-to-date information.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml b/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
index 45e112d0efb4663bc7fbb3a25a12d66aa8b7492d..bc44381692054f647a160a6573dae4cff2ee3f31 100644
--- a/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
+++ b/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
@@ -14,7 +14,7 @@ description:
   The Analog Devices AXI PWM generator can generate PWM signals
   with variable pulse width and period.
 
-  https://wiki.analog.com/resources/fpga/docs/axi_pwm_gen
+  https://analogdevicesinc.github.io/hdl/library/axi_pwm_gen/index.html
 
 allOf:
   - $ref: pwm.yaml#

-- 
2.43.0

