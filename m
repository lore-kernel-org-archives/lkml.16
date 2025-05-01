Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BDC2741C5
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 06:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746082163; cv=none; b=gGU2qR3ZgWQtpajVHp1fnjiXXYJijMHZMHtQs+cBF7iwBLsga4PYHC+kGk/QBf72osBAgIWOgXXxQDY+E7X/DqA7HhRj6LTkp4mf26dyPHrSHVaqcRKqDLpRYnA4sxQVIptptm6lzy70+/WCvGhBHT8cb0A3QZlqGqESo4AaqSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746082163; c=relaxed/simple;
	bh=j6c00ET8Nxx+FPWVkkikQOyolQ/2oogumLYl1rwobr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QDCMU34EiJGcx5/VDCHxdpg9t/zeAIJpE9CstHe06QPTZp7hsInBogV0+jq2Kq/1hrYye60ZnFbo2kkbU8cUsRFGl0hEmBSq+1xmozORKjfkUVQvArfeZ+QYxTztUaLf2fkY9NYUj5O4rvCj81g3PsbssMIcFJ60DcqN2LlHAAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=NkvQCWE6; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NkvQCWE6"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ace94273f0dso128677266b.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 23:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746082157; x=1746686957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lUWQcPoDjPlS4TbnEJ+VKcF2YrS6UcuvK/GRv4EP14=;
        b=NkvQCWE6QdxGUOdyFCgTLho63TOEuRrokB/EvKZ1f5PyPzP08LKxXq98axHw/ek58U
         e47GM/mvup5I4yG9owU1t2oOBJcYWXJ/MfMTu5RgQhO4Jvtc7MS5WRwAxnRU0egNAAsj
         4b68VnNC/rtgSWl3JyIu+1ZT6BoxDVhP8Z49xIu9PJDaffBuwh8LfP6ODkIG8FZ5rQe9
         8Cjo/IqoOnh6hgxyFPNGm2mCMFPoo+Oqdunvxe6qWdwKTwRZa8YY2VtQ9kCg6Wfa70z2
         awqrZUm4gHGTCcQFrlMFJOOLOTlRo+y4JwMALOTlmLQFmDdrOVx4rQViBI/TgKRgfj6Q
         pJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746082157; x=1746686957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lUWQcPoDjPlS4TbnEJ+VKcF2YrS6UcuvK/GRv4EP14=;
        b=tF1LcpSDj7Trks4gmjkIIVRAfXTxiQwcLFEVonERCxq1yar47qdob7sEYcCmU/qK2I
         RO7g1q2/tuyIPnKNmYlYPcx/vnVp+1wzzvey0B2K29jrhfbzkTHULAAPJTX61hH66NvQ
         qTtY6v+KIhhhipyEG2BhMGL0CaGqApuR5t/y/s1F5SGNg+nUtXWoFyzi1+61R+NX5XxC
         D9KYlJVqPZLyB5m9CmStv9M7vbAUeJC8B70N0rFRZ3dQVAgmy59hIu5qeZzn87dpN2zk
         2TulDwnKLCgg2bTzwjhyvsXLvJGVsA9mlDa29qh71X3zyk0T86NTbXkL7AQS5xyumf3P
         Hgug==
X-Forwarded-Encrypted: i=1; AJvYcCUWqKEXfrcbOkV5uDb9b7xnWJUtKMjWuIZ+xWdGXw0GLGP4OpBcUbB/yz8Kh5JK0kMoiu0TGGvwwSSxqeo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5671OQUvYifdGz0LZxlwqMGh1QhpTf3vGsWTO0j1N3M9rp/LG
	8vjJcTw+wTC1ao1KGrWS+KvnqKn/wIiTp9v3WiSXc3+NDkrZBezaLZ02m/ku0IM=
X-Gm-Gg: ASbGncu0X3zMRmHThluVB0msAf0VMUGUo2VuQ/liBkoaO7YPd0petdjPJPQRkxtXJRp
	BNkF9HcdyS4FY08E1baGAeKSRPW+hwpgIqSAxknvA3a74dB/sxFbih5PE6QFPEQ6nz3Ikeaqh+Q
	B7MsRYyIDnEpdf05+kqFyAzv9kP3rdJPntW3sJ8VDM3ieTlX3hUaZSS9IgS9bDWhgWd0ROdH1DI
	2VGVMP11kRp1O4NYdM9TwutRJZN1eFyhDd7tr53oxMezDU7lbh4KwSRdhN9kYJ7wOMnmkZ20bG+
	i/YSA8hVQKqAh3/JnsFCa4rL4ju/swhjUfyAJTRTJujkWhecb7WGJ/B4nFAmjAvVKsZFRni6j7d
	BSkA=
X-Google-Smtp-Source: AGHT+IG63RNYN4HNO9Ko5hFY2UpicLAgom7xY0lbRX66pdh+OA4P68D6+HAwzHg7Vtk5TsYdejiLEA==
X-Received: by 2002:a17:907:d0a:b0:ace:6a10:6bf with SMTP id a640c23a62f3a-acefbfa083cmr147786366b.44.1746082156726;
        Wed, 30 Apr 2025 23:49:16 -0700 (PDT)
Received: from [100.64.0.4] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8cc1sm1005486066b.89.2025.04.30.23.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:49:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 01 May 2025 08:48:49 +0200
Subject: [PATCH v2 3/5] ASoC: qcom: sm8250: Add Fairphone 4 soundcard
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-fp4-usb-audio-offload-v2-3-30f4596281cd@fairphone.com>
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
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add a compatible for the SM7225-based Fairphone 4 which can use this
machine driver.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 43c93e24d77259f232062c7e4182a39151111c59..0025c8957abddf54d0aab6eb68acc79f031917f9 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -208,6 +208,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
+	{ .compatible = "fairphone,fp4-sndcard", .data = "sm7225" },
 	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },

-- 
2.49.0

