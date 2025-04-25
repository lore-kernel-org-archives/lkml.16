Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34AF24888A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577988; cv=none; b=lP5rzc+pjrVl1I/tgph/kMNqv1fi8grb2aiKiYdezU0d2Ug9lGU+o36oNy1trnlGez7fTMx4T9o772Z0eznupwIEIivxL8LlgLG36Su3PVqxJX/AGMLGK21ozkRKf0PDf8sVn3ou6arpntyopt1iTInqqB7iW/yktpKoltaI6lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577988; c=relaxed/simple;
	bh=85B3q5YxIURMuwDetlbKPbds6WVQ//EnUVbXQdNluFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=usjgEuSHjDUKLLQGoO/qlbnrObcYUjQ/6AH6rNItZmrAyJ3dnZgldGoGggeHLzQPy+Zv3XuuLqkiOcjlRsaB+E5K3WZa5PfpqXL+cwXTc9AjWNxsvU6rBV4p7+uWTEuZ+FMyhMcV44NPzgzXngNe1csAOoWuRnrtFcRY0p1gpBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=rGeRWTWI; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="rGeRWTWI"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acb415dd8faso308619266b.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745577984; x=1746182784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JeacGZrrM+C+tPMotUpkenMrM8geMPef44l5x7iZcs=;
        b=rGeRWTWIj6kPYx04Y2qyYOpqkrP9wTl6YHQc4uplKTpzcd57ZLCX5q421XbHnUT08/
         e1aLWsQORsiQZ4TyvSm7HWEY/HevFZfXI/sxLRTskY3rR0uJfv8dQiHmfOFhCh4O9aw0
         uNMhQXJcwYRZsSWepjcfDl/5j48S8GK6+c+jssmDr626Hcwd5v2zngaYkM66L41reaWv
         3FT/G5NQtVHbTvrl1z/m9IOrlMdR2Gbfb8zT/acH1TeA4xmurBNlITWDKBywE3w13oz8
         sskb93lJXe20rhAlTPpT/bOB6kEajcQ6d+4qxkCRBWXjBGVe0T0dbHaBdkj86NL8SwuA
         nWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745577984; x=1746182784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JeacGZrrM+C+tPMotUpkenMrM8geMPef44l5x7iZcs=;
        b=mjp1tvwTNaQAGAcvsvurk79KsNoms7uRfzrZbsGJB1AyejUkcX0t+bMcNfwEJ5KpAu
         y09bsLqVrTFdxDYhAR2wx207gDLvfAJ7nRCfpE1m8DkdwZl+jDn3B6snHFwrK4ScWa4v
         UN9kO7zBfikSuM7eZg1ZATpwkNXGA6bSzbSROdfWeMcOCQhe16AcOHUMY1m19AcEUiTj
         naAGocSznhmNLkH1/8gZz9uxfv2nM6oPXjZuh4e0SSx63lbdpO6iTqitkhJAcRvW838Y
         fhUEfpRJ8JCjxbsP2SQuUlR57MdgyMGsVG0Z4Rq5k45PQHdejUui6qSIQVKr5SVokrUz
         ROJw==
X-Forwarded-Encrypted: i=1; AJvYcCWZNg8WFQrg7xDEeqH0KE/6C53nq5qpmphnEN4Bl+HTyFZzORoEnXwBYw4EUbitWlUF2NhgZMN8XOIpAoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJFALvKg03ywOW/45h6UGP7bNPaY6F/Muin5lYvwNCwZT+yWJm
	5HtqqWWPNQKqXbbEKGNtKXV5xGs+qsOS/xR8FTv/H1Wo9CZIB90fy8M6aqZUzbE=
X-Gm-Gg: ASbGnctmcPJbaCg5NNnxGXEBTb9qN6tVf30f+N9UVoBVMwOaZP8Q6l11fdzzXGqYmwK
	Uz840bjffTIA2Q8z+dc/jhs3m2NsR1+AAePsj3AZfo+b2Zz3+DmMf/ntAaq1lJ2wJxw5YS1E1Hi
	ueN/WPr0RGd7+UTz5udR1nVBMNyng93nhpVYOjG20q7zcuzYBLotLkXKStagHfE7AvU3o62S4Uh
	ECmDmdiuC04Phmj7WrE/5p+GzrXVrGYsE4Bk0ki6jAp5Uq5eCQqNfLJHbx2Zwzt09MqZqEU7seu
	HOK52ZytaouApigJg1hbUgb1k9iUzQuQ5rAu1IRYY32tV1LCCbId51OWzct7K4Ky1y0QNNgx2UE
	56ZX+OEzWh1YibbdZ45lfeGqPcmv265aRegkd4XIM1wWel4Dc/AKHadVS
X-Google-Smtp-Source: AGHT+IGUOsRcDWXWXshgw3+eUDsixcC1XjCIOga2rl+spBxCUbc06RAYeUk78gF6BzGL5litsgHz+A==
X-Received: by 2002:a17:907:2d1e:b0:ac6:ff34:d046 with SMTP id a640c23a62f3a-ace7103877dmr173149066b.2.1745577983978;
        Fri, 25 Apr 2025 03:46:23 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7b98sm118765066b.66.2025.04.25.03.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 03:46:23 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 12:44:53 +0200
Subject: [PATCH 3/6] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4 sound
 card
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp4-usb-audio-offload-v1-3-f90f571636e4@fairphone.com>
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

Document the bindings for the sound card on Fairphone 4 which uses the
older non-audioreach audio architecture.

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

