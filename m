Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466F919F101
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935660; cv=none; b=CmwUQcA87EUypnHRR/SaVpdIhJVKGu4KQIiGddB0rPAq7r9mfgIcsAsyidw7xBFQyTRGb5GDtOuI7aa8c6wSnV3R0iqUnukXolt8CWPLzxOMUSW4UjhdvZtthtPCN2odWVCstdtMtwIOwNMr6kz+c8+JxyeCreMyLkFn+B8r8C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935660; c=relaxed/simple;
	bh=BTGlPNBUqufLWTLKvpNxjSK3+Nvn4+q+dEmnWIZc2m0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5g2FKq29lEbVBZkqLzS6OV65xD1x5xCSM5wwa9tIez1rfHMUw3oqCjXNvPjef804mkcLBsOrGDPemF7Ifo5qek9E6wvLoL6z48ZzlW6rYLnlteZjtRF+1+KW21Q2GEMZIGjwYlgPJGZ6WaBwqNWQYrUv7WEpJ1TXDVjmSl4YR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xuClYz/F; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xuClYz/F"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso83730855e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935656; x=1748540456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLQ39SsLjmpmIAzQnJOz4snESZPOPzY3BiAe6iDYGQ0=;
        b=xuClYz/FNAcR1XBd9lrteBSgwu079CrWakSSFOvN+AGBTh2bDUnfa3e37KFsfYqzmU
         Go8qmzJzm0dAbHptyDJ1NQF81Nk4oWWedSFUucy6ccFHPjwnrASDProjJhK8nhpPPqSJ
         y6BzFUWEVMHyq15AK25wwqr04K1j1nnAjTerHmpKilzO/T2462exJrY9QDT+/vV1nUPZ
         9H1Ig0hh7fuvIJD9Wk5/FSqY6z3RBIAJ3FoQHGuV0QmXPqw5xs9tlJshZPC93MuZFTW5
         wBU5GCzbab7hDhR+xAgMEBLo+cDamjHIOEYBHr95fnED1S3MttbHCeVZcBhOnqQlPohh
         LFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935656; x=1748540456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLQ39SsLjmpmIAzQnJOz4snESZPOPzY3BiAe6iDYGQ0=;
        b=jA1DbE2cXrhb6/AjQ6juhZKOaBVMLM+mWWmx7CHHp4wyfvcbglwrPljlJ+qXXfwZBU
         49i2a/0pCZNIsfGHrTvbMu9Ytraij7J4DcE2gDQqximRW4jhZ8GQBaJ4lXYKNhOAQjah
         3m7raYu+1Xk3Pzvj68/bH/XTv69a7t5bXkixRBJ2SKDj+S2sS5eoYSodfbQgNfX3oICI
         mGgSKPzLVzSJ2HTFM9RExQJWxcH/4AE4ry3/OwvXKKh9PjpKL6RHJQIdclDwL5egYYiX
         4lXUC2NlIwfIr5KqSdn9ZQ5PuyOrpiLBbmsF/H2si/OXHfrxsXKQu9lHLnciiKrewB84
         6TUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSIA/9R/Dh32fb9tpy5NPYzsP4YfISumv/cctI0qhzjZl8Oez0hNF1M1nJOomXhplT9Vo42KyLE8KsTlU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtO/kxROt+/uyINMt8FZrfDq6qnZPdfqTtDEyDAR+blPOAL1mt
	dl83v7T++FsZWcYcvbOV41l88p68kcKeNW+AYt1J+5ehqSGyeGKfF9pLekVBYmve7Kw=
X-Gm-Gg: ASbGncteU4nQCfkc9BR6YpvbaLjyLk4QrRQD3SB2EdDFu4CvYt+wkccL6+nQBovGfZt
	80Jv5EriA60+E8+6835Z0qzE/fDnkspW71VlVY9k6rvOERovr0IEet6vD8m2yH4hhIkkNyOktbB
	RGhJJWbuCDxCofedTEa23dPJ0opjDA8pvpKknnUNb5ElHHCwiUs9nRVDnkNU3XBPGpF9QnpDZnK
	6j9htRsMoAcB8EO6uAu2lbeTZIzx7YXeM404v2CO/+3b21wC4f3fEhygoanvKgdUL9e9XMExCYU
	LeVWpfw4t1MK9gH1GG3LaHnERi0Qi5CGZdqKJT6C7tzOirY20mpX2PvizidJBPTMDUbfmA==
X-Google-Smtp-Source: AGHT+IEBbmBeEZeBEDTgs2S0bIt/X0hdjEoD/gWNab7fsmjGtWFgCjNCvRyckETck0ijr3VIY19D5w==
X-Received: by 2002:a05:600d:c:b0:442:ff8e:11ac with SMTP id 5b1f17b1804b1-442ff8e1221mr214812715e9.12.1747935656418;
        Thu, 22 May 2025 10:40:56 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:40:55 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:40:52 +0100
Subject: [PATCH v3 02/12] dt-bindings: arm: qcom-soc: ignore "wsa" from
 being selected as SoC component
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-2-9eeb08cab9dc@linaro.org>
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.2

The pattern matching incorrectly selects "wsa" because of "sa" substring
and evaluates it as a SoC component or block.

Wsa88xx are family of amplifiers and should not be evaluated here.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index a77d68dcad4e52e4fee43729ac8dc1caf957262e..99521813a04ca416fe90454a811c4a13143efce3 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -23,7 +23,7 @@ description: |
 select:
   properties:
     compatible:
-      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+      pattern: "^qcom,(?!.*wsa)(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|smx1[ep])[0-9]+.*$"
   required:
     - compatible
 

-- 
2.47.2

