Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A67226C390
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 06:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746082161; cv=none; b=PMmbEumsxYMBdyPBlTBJAZNeJbY534PD3lrJij7SO0EFBEsxaYYCv0nXytJ5OvlZlZwAOaNj5HKLbwL3rg8sYy3foZvSDbaNyVjRlQ5QV/bZxY7HHp6UX5mjUsEhy+3ZVe75i+nc6lv//Xbf2W+vup4SgrjcfPg4p2pdyhA5Ej4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746082161; c=relaxed/simple;
	bh=538noH7wSha6Gfe6NGpoKJ7R1j0O3wJrwD4f0JHuo4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WldkIeme7I8pQGwUGiKCYvtX+fh3JB66C6uFm3SW+xu7PM6eHD1dFWS+BbD3iRQ/iVfuKA5r/I/vVxN2/k1n8A/ccBmlGzx7LhZH98YO1MnLus4PXlY3S4MzAHIOoaXWHky+wMTGrnEvC5Rk/z77Vunz2Fi84vWgqNBl57s2i9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DejFtXq5; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DejFtXq5"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f62ef3c383so1192951a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 23:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746082156; x=1746686956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGJYx9JJv1up4GGUdlgk1bx9YrInkIDVtN8toig3qkM=;
        b=DejFtXq5mr/gZ7bayr02dpHMSvIvndKRLZTrUFALvQTMvocibwiA+Zh9mGo2QySuHw
         M46u7aXwT8HCIE/xl163OGetS+qjT5wAEUQt9Mi8UWieC4siIUA3fGHemy0w802aYadx
         lAar0ctn9YRNtEqtwfposka8VTb0P6n+/++sCOjlchTh6vPoWzQj+sCh2GpvcaZ1q5OK
         cS938Xqt4z9nWY3TvBA6lwSE1JtTTd8Hm7zdht0LlDxFC7GwAgCmRcR4jZVjnYmvEflp
         CRdYOiaHEKCCDxKX+irQufWoxfCl89Hrv7qdd3kEtPa1h798nrTHGeplsHS6WuUb5Lf1
         lrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746082156; x=1746686956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGJYx9JJv1up4GGUdlgk1bx9YrInkIDVtN8toig3qkM=;
        b=SYEwdAGNaZDxh4Xi4azzV7O2krO+J5x8qHShyqWnwLFEJcTPR3qlu/RHCC+y8wR+C4
         f8LvsiRu9X5ryYKAr4kqUCkg2f2r5ytRAuZ/3NN3bSchPBchwAf9fBYVHnbHHSJclHzc
         mTv8SvMufGpeI7YuVC+Z013DnU3Bn3O/FVgVYt/h7IawkqNxOQ8Wh+vCCyN7bknfVHW1
         Wx2p4envyPGI9hiuqNacLR8SkFiR0ilI3Ste81tmjcTAbiMXBOjTvsBa4fR2Qj7D4kqH
         GpAm0MgKan6jMKz5vyY6J84GGTLdhA3BuShrhY3z1E7e8DwZ/s1hrt7nzE2IKyVugUbo
         N/FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSdeYR/+GyMoIPaB+XF9PhJJDpVNLgeLAsDR/qIv1VMOB2OnYbEuI6z/nnXJUQGTRoURiJ1dQXf8ejmRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4K9hUxTQ1iUTCD+e61EyXh1bAKT3zTD6Wtc5fIXJs/Ymnkl6N
	+dWfkrSUyLrn2hT1paQnY1htoDBKtYtdABq36TwFRpE60oeqnKEc1tsl93H9UwU=
X-Gm-Gg: ASbGncvZP7TcoIIKzOT7iWu7TOkydRDqXqhkuC5l1FIMXQeOQW3AN/UrC+E4HqvBHT4
	VlPvfiQcOh7ShuX96hn6XxE68AHKOZejjx9vGJIP0oM60QQiiYiFmF7q8K1uO9qTIuRkgcm2m3M
	JRZyxNJFixaYHdUdDf02a5tX1w8wTdFeqW5obogcNJSSK7T+q4sbRxbdL0fUa11ex9UKjMNv1PK
	BhzQgXKzc80a5kDX0mscPlk73Bd2a4ZumVBm/j7TRCYVAtdWMLtPJ1q/Qphdec4MeBg+0ZmymG8
	wcKzV4axu50lQqVdiyc8fxgXBay9UlTz7BAXPcbNhtgtmMpkeeebggUycUNQQpyCUWRmNv2IWSl
	P608=
X-Google-Smtp-Source: AGHT+IESb+QLyV3Vp9nFjqLZstSoj0lTzPWBk3gdi1NsT9A6t34AFz5LTYb9MDeueE7IY46205q5+g==
X-Received: by 2002:a17:907:c23:b0:ac2:d0e6:2b99 with SMTP id a640c23a62f3a-acee2404095mr605506066b.36.1746082155788;
        Wed, 30 Apr 2025 23:49:15 -0700 (PDT)
Received: from [100.64.0.4] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8cc1sm1005486066b.89.2025.04.30.23.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:49:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 01 May 2025 08:48:48 +0200
Subject: [PATCH v2 2/5] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4
 sound card
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-fp4-usb-audio-offload-v2-2-30f4596281cd@fairphone.com>
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

Document the bindings for the sound card on Fairphone 4 which uses the
older non-audioreach audio architecture.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 57f62a228c262f38e703816efdcf443355052619..6f82e5cf6df30e021692015df9ad7b09d4b2c7c6 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - fairphone,fp4-sndcard
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard

-- 
2.49.0

