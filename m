Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782A5264A7E
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 06:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746082160; cv=none; b=X9VlK2uksO3yd6MPKuZT0j/j9zIrawZfY1I/jAV65W11L7ozmV6w5Yw/YsbdW+GNk3xZ+lRQJKJtRZ6dRKF6jKi+MEqmj5Vknu7TJ/exBFcYJPXcMRarXd0VI5nG/KqncQQUyw4GVhMTXgKPfZAV3srud4osZGwdZTqyuXjAwrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746082160; c=relaxed/simple;
	bh=yM8BRFHXQ57lwyVkMBlhdAM+Q5zCu+0Nhquu24Prusg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cZMY0j3khR3EbwxKhrYFxT1HFjOfVGoADAB2Q9Bq1e4v1UwsSmt2GePDYOgHr9ihpbOcjLgzaSS7nGG2mtJr1a9JqP2D/QBioBpdnU0Yos/4ukvYC4H5ZewZsGQ4f6YOXr/PtB0dTCwJlYVmTcvDvHhNptwsVZ02FMdzR5A0trM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CMW2KJMM; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CMW2KJMM"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f728aeedacso999795a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 23:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746082155; x=1746686955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLUosvBbF3U4VM5lbGixDzvfiX0alERKsKLS31xYB2c=;
        b=CMW2KJMMrweV8lOLH01MdcylBZl567fZVfFgVZiZPgLCXdd3SX5U6KWazDHw4sTq5c
         H9QxLnBiw1qYhvlPJ1iZA1jOn3/U/dBn4vH9Q3OhFru/tT16ps8ZLFyinHvqdsH9TyXD
         0PZVxBp34LO3SDL3BPduAqNd3cDwZ827gdtU1eS8JdQV1vStBfqIsGX3W1hI88kmWSXF
         TPyKVD5DDmMuQ5YH2787LDmiZDmbPDSYEyyqkav5D80D1v+W8X5g8cNMqf6VJpVlhacO
         WEWrHbvuvK8IPfrEpHqK6OFcsH4Q4MOmm+qC/D6ND/jJRkLkVIWQCzE8aVNLTWfTQ5DR
         yGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746082155; x=1746686955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLUosvBbF3U4VM5lbGixDzvfiX0alERKsKLS31xYB2c=;
        b=pA68SlEhs1WR/ZOX5XI5HtpKz61tqHEooxwvxP9NoxVW6ofje0jwBqjYhC+y+GsY5J
         ocC6tAkMr9FqhNVlE2tUBRbaquBJQmBTgpkwDBgoqk47Fmfhp2QYZG2QmezuP1YhmYAO
         WPETyECsXBhFxZIglyVgQe8zWLEabTUikVUucT5fPNH9R4KEtRpE4ZZvC688CVxkJoW6
         q7/qGSsKQJpt/tC63dF7nfA3cznH6EhB5VL/G3M+YEKTW0Dys8Ai91O1NTnYpER/HcLP
         jYlfKozYKJASLGDDDLRLgjKAp3EqZOUyIBR1sshLKbeNqsbDiJ7k74Ztkz1Gy7gjbmVA
         rTsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe3y4kCp/vx/BjPTfKfulmJjHqjRLEAP9YWjcfRKMEG9muMA8VGGbTsT0vsqbz41XTNtw3DbgcGsWf9so=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxLv9TjXtpjXN+tkMbzrzA379qSwDYAgbnxA66ExxnYJl4gosb
	wTTZY4C1P/gcEEU4YHe2b6EtJhVwaXnpaVK+Vs5zsiL4CSr8QMDsDwreL3mfV8A=
X-Gm-Gg: ASbGncvNpSW2oor9Ls19WULa5mP1BRYT8sV2OR1V+Nv9AIAdbXcR2xx6qXke2ZkGbBf
	Pmotu+QvN1egZkE5oXuJWYjdpcFDxU+LUQhVfgsA8qqNfiMNcOc+WgU4+6kRkJJZdYugxM7Au32
	OLLUGOUHgFU0xIvkZL/sn9RszQEULiFuAN5oDg6KkoToP2h2zS/jddsoZp8yDef6mv0r9C5yo0P
	TCmjV2aA1YbKKkkxoFflQXSBonK8mR0i6tF+O21BXfeaYew4rLR2EUCj3VHXEHY4Rc1yPNeXC6E
	dZC4/oqnkzQmVFnWgF6HOJZm3hgrbcHASMg4PrOHp4D2OHtQMsqXhBnECXBwU5/eXy8vfIYtM7R
	l1wY=
X-Google-Smtp-Source: AGHT+IEzySfUrfmZ2ok73P0GUsMuvaw7yUrPtZVotDDbR6BQlXgasH9wezf9EguddjotsVyoCoHkOQ==
X-Received: by 2002:a17:907:96a0:b0:ac7:eece:17d6 with SMTP id a640c23a62f3a-acefbb1747amr137034566b.17.1746082154701;
        Wed, 30 Apr 2025 23:49:14 -0700 (PDT)
Received: from [100.64.0.4] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8cc1sm1005486066b.89.2025.04.30.23.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:49:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 01 May 2025 08:48:47 +0200
Subject: [PATCH v2 1/5] ASoC: dt-bindings: qcom,q6afe: Document q6usb
 subnode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-fp4-usb-audio-offload-v2-1-30f4596281cd@fairphone.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Document the subnode for Q6USB, used for USB audio offloading.

Cc: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,q6afe.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml b/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
index 297aa362aa54ab41a956b3ceda73d4c7027d72a7..268f7073d7972da2ef46d36264c0f7d8f648071b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
@@ -29,6 +29,12 @@ properties:
     unevaluatedProperties: false
     description: Qualcomm DSP audio ports
 
+  usbd:
+    type: object
+    $ref: /schemas/sound/qcom,q6usb.yaml#
+    unevaluatedProperties: false
+    description: Qualcomm DSP USB audio ports
+
 required:
   - compatible
   - dais
@@ -64,5 +70,12 @@ examples:
                     qcom,sd-lines = <0 1 2 3>;
                 };
             };
+
+            usbd {
+                compatible = "qcom,q6usb";
+                #sound-dai-cells = <1>;
+                iommus = <&apps_smmu 0x180f 0x0>;
+                qcom,usb-audio-intr-idx = /bits/ 16 <2>;
+            };
         };
     };

-- 
2.49.0

