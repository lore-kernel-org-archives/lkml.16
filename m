Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8439F243364
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577986; cv=none; b=JkSzYD+/2JJEBp8fXYCYSyjMCrHDZ8QVKSY5Sj2I4trJpTxw2HnTrt0NGhjuElIHMjzvpi88F/lt+6Qp0NutYVITB5tn+w8Dz9sWyOM8Z40zM54r5CkkbjBj4jhZSJvrvbOIv/zFcviyaEnuYqMTCYuuqbHbFBKvCQ/m79SiY80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577986; c=relaxed/simple;
	bh=yM8BRFHXQ57lwyVkMBlhdAM+Q5zCu+0Nhquu24Prusg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I8pARE7D+JOR6wkrziaDdek/ok/zSTEPLEJILPvITtCRbEgFcG8nXKKf/Ioit5XE38J36pc3+GSyxP0M+0wMULSfFRKkDVNuu2GSsFk6vWdvwuoNDo63ewxBDtUKhCI6iVmpK7cJ0cj2u3zHciBeuQl1L9wvkWl6NKWtn5xhetw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DCBvgc5E; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DCBvgc5E"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so4063220a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 03:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745577983; x=1746182783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLUosvBbF3U4VM5lbGixDzvfiX0alERKsKLS31xYB2c=;
        b=DCBvgc5E40z3g8D/FKf0tRPVeoH5cdze5JE98ZBBXFkRvWSjvkdBmRrCmnBUvSGV56
         17mxm47qjap9zg2xoSB7fqRijeyiC8/tBqKw7TToJrBhVEFgGsRWhNYqjwx/00wWl5yq
         O118D53VSlNK2qyk/7xuPXC445k9NtLWRGLEShSTEkzVeOG9G8tac2bLTQSC58NOBZpc
         4c3o6MJ0xghEOd57QFmwcYFp7DNRUMIk2Rj9I2lxwSBVPb85MRwVXWhHDfrk4g8Xe5uH
         yoxYgHGA2lIWvWW2rWZ9zZIYsBmRB72CfJqNcQKXNCB7RNTUN6muOlXPvr9A4wacO3wg
         GtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745577983; x=1746182783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLUosvBbF3U4VM5lbGixDzvfiX0alERKsKLS31xYB2c=;
        b=P6I/mMkLK0salUL0dOXWQU3AJ70ZTqo/4J1t6uAuBv6HKhqmDZSnmqQ4HSbmJZN4Tz
         A3WJ/5UjvmmPQslGnWbjNgDMCM7uACHkVwpoeLW0sdoSKrre9/ISVMajmFbh5umy8So0
         OQ6R7bLph00YKWrOVrR5QeY/UhHADWZTzPy4AlekaLtvyo0viZAEVg5/f6fen/eMQIs3
         VNVAe3cspIKJKsurz07LRAozIZeKKYUWtxynVudlJTPKLdqOSqN3re+8psqb6gem8e1K
         JdH5gXKr10O66UIq3XwFy/0pWZJDFldvS8zHDhUbkROg1myHS5oB5Z/gwTypE88dOlBi
         nY+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAtEEnYYxR0wUt0D1Jm3dOjgsDoMgkEU1dnBuFZC0LicKFax0B7MqtaxbiHEpvoTzKWOupWAA4UATuUhA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxejxZxnA5+5PaIv5Q5/lLghMnOnSDGh6b02IscWVhGKvBirWu2
	Qo2WORTkJRGUpXDSbE4Rdr074AVA3pWYlZE1sVhXDz5HieFgKD/UKpqr6lCSf54=
X-Gm-Gg: ASbGnctRrfd0xwvRs9jepJmNJS3LbO/C3g3MOEGAj4OP5ag3hCxmCnxPaeovkp7pPt2
	b0DCLVTzHwiLBaqy/2SZK9GycRttBhPEX5DgHdvv8uUQBB7K7ViOxjX2bZRcDdn6IHBPZb46xIy
	AelA19Nk7UPYkVE26w5dYjLDwkyWD0mXtInfZFFjgMwynnfH3bNmznoDZkUdRaPpoUEZkd25B12
	6TIv8fIOCfe9LUFor7VTxisPQG1obfWXuRSS3mcKGXaHylCFxpYAUP2IDGAdEGbk02dDfv114ZV
	ojFX9LCxVhLtzOraxzuD7oDt5ynlz9lSNElhru3sjaDFgSp9EMQa7twRBdtF2O7+8HiIIzKNwuQ
	v4A/RgTud2zxyRlUIPk6vFrYA01RK+sgtI4NfNUdDELZq+pxrti2EogLu
X-Google-Smtp-Source: AGHT+IEMO/qU8Izgv8WgQTjq/p2rXnbTDGbYkosmMOLUyUMdq3+DaLxBEwE/Ly/BIlSR6mHqOeHOOg==
X-Received: by 2002:a17:907:1b03:b0:acb:b966:3a8f with SMTP id a640c23a62f3a-ace71337b53mr162428266b.39.1745577982688;
        Fri, 25 Apr 2025 03:46:22 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7b98sm118765066b.66.2025.04.25.03.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 03:46:22 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 12:44:52 +0200
Subject: [PATCH 2/6] ASoC: dt-bindings: qcom,q6afe: Document q6usb subnode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp4-usb-audio-offload-v1-2-f90f571636e4@fairphone.com>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
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

