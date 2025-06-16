Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6FA22173F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087595; cv=none; b=H0MevTfkyyVW+04zhQaU9kds+RaxwOeMNsxOtCN8Z34uEu24M3pqVeOn0+Z/hCEHu/ubnzXLzvTSwEZNHsMyLdiC4Hypx7qb1WeHtuJ5R9oNI5srQgrEIgP0W9Hd9fiUiUp1fSuF0VbNNUZhXJA0SijeroqLhNZ1lkJcwnTVMC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087595; c=relaxed/simple;
	bh=DU2I2YbMvZtzDPQCuipbYRsqprvK763THV4LfyAtDjg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cd+oMZHI9tNNJlFWus0xFnszO9VUESiTfqQewzVdmff4thEhAI7x3w9Ly1AzWAAaeRVJoJ1aNnt0p6q9Fj/myWrbOnGjTGwDdhaSDCq30Qe4/5xGUWOGdCbsMiRad7NbWPgPHkXV0IyJlM0RypbBpg9bn3p+u1obF/Irt2njyxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DegWTKJk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DegWTKJk"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451d7b50815so39107905e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750087592; x=1750692392; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CeO1+HLlWyoSeTEwNQ32JwkuMNWbwruSJUY5nQLUj1Q=;
        b=DegWTKJk+1H8SZDrCFzedm4dXK6uo2K/zFCG0Y130Z4ryoWPwAux2bBEU0h9IGj3BK
         VmjN96wNGA0K11SObvL7SOvEOJ0Ky2FxOhTz6spYrVDqiYxKWUPjm0dSCi00pQfBiUyL
         /C4x+T1h5WsDvJMU6TA1tcjsnCLG30AH/D0lKZMdz9qvBNriWYgi3PIWdlZTQenXkE1e
         ZCkDfxVdQYEv2h0Zodn5gILcGAlWgo6RnKt8LFPTpRDPBQCtZh54FY8NOCD6tOCmoGhP
         kOezQQpvMFA6gQ/Pu9RydOC1q2V1E2zfvHltO/EgLIVGEnXyidoDe1bLXTOrkTPEHdZW
         WRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087592; x=1750692392;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CeO1+HLlWyoSeTEwNQ32JwkuMNWbwruSJUY5nQLUj1Q=;
        b=PWEUP8Pnvps47mRqSBBh1OXTL7VwCTCAXq5unfJCGzsNRsyUXA56a6TnM6PCBA4tok
         CpoqmgFZHqaxmQL2zwa++O4aJKDyfLGFYsd5MBpI6z/zsnYtsbwNvFo8Xu6IvfPcAzub
         cTpjRLqz2IRtZxf/ANeD88kppS5T3qkXMj7vNA6AFwvtVg9f1vFJCYGIvlWMnpjecKHX
         Rmn79vjcBJdRh9USsIGE1G6X5TPHzeEW4gIBQ0DUGHCPqD0Q7ur/Ol7DWSxNpAFmfe0I
         6NphPJ2Hw11eUimXb24HiSQWdev2t8/cmPya5ck7q236+PE1PUgaJT115SpkvClPomQ0
         v/8w==
X-Forwarded-Encrypted: i=1; AJvYcCVobGyya/QnUCXxpQRPQR1sWL0cT00wjhDxkiVbwntJ7pHE00a+qzmwsdKOIeQ+KVhR1/2Cl9Fgw2EhCcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKIoIr0yoS0A+WPq14IDMVWy+A/Lk4ugoIVOMFK2omH8VVeihS
	a5bIi6DaKBagjEuTKQac+ti+y2p0EjUIHafcDxbvA96oSiMnerjoFeX8FUMH1gp/I84=
X-Gm-Gg: ASbGnctAM+J4m576EyFDSfNG936AbS/T0mueR9eyMvYydKqcPZujKnhNNQdGP9+yY23
	U8cC33/0XVfdCb3KyufTelCcjdMCWLk7OElA07+mB+e42dg0QadAepbPSjSyEE+mne5H/mBeadM
	t0ISWlVULCLYy+o2B59TF0Z5MrjFyD9B1B9gCVDp80t5cWj+7ogihJbNs7i2aK9qxogAj9LSFwx
	qgA1GWztVPh/gxsDfsmWaKuN35VABZ/zXlq9Wn5wDGXDsS9oUza2LPLTtYPATw46LxbBNIv3p22
	Z//qqF/K8OfuxMPmkCnenJLKLj0retUMAFEkamldXMfxJapAROT+ykvbUWrkymgEqnAMEw==
X-Google-Smtp-Source: AGHT+IGCDcDVHp+o6asZzybXhwzPm/BQNSKXNqJmSsNHhGWVr+34NkY95WUCvxFa5Q9CAR0B90qFDA==
X-Received: by 2002:a05:600c:3153:b0:442:f4a3:9388 with SMTP id 5b1f17b1804b1-45350e7c275mr9182005e9.19.1750087592090;
        Mon, 16 Jun 2025 08:26:32 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:32d0:eaf7:ac68:3701])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1925sm151687525e9.12.2025.06.16.08.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:26:31 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH RFC 0/2] Add raw OPUS codec support for compress offload
Date: Mon, 16 Jun 2025 16:26:21 +0100
Message-Id: <20250616-opus_codec_rfc_v1-v1-0-1f70b0a41a70@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ03UGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0Mz3fyC0uL45PyU1OT4orTk+DJD3SQzg6QUYwMLC0vjJCWgvoKi1LT
 MCrCZ0UpBbs5KsbW1AE1K65ZoAAAA
X-Change-ID: 20250616-opus_codec_rfc_v1-b60bd308893b
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Patrick Lai <plai@qti.qualcomm.com>, 
 Annemarie Porter <annemari@quicinc.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel@oss.qualcomm.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
X-Mailer: b4 0.14.2

This series adds support in kernel to recognise raw (or plain) OPUS
codec playback for compress offloading. At this point this series
doesn't deal with OPUS packets packed in any kind of containers (OGG or
others) and focuses on adding missing bits for pure OPUS packets.

The second patch adds its usage in Qualcomm Audio DSP code. To correctly
recognise raw OPUS packets by qdsp6, each packets needs to be prepended
with 4-bytes field that contains length of a raw OPUS packet.
It is expected to be useful for usecases when OPUS packets are streamed
over network and they are not encapsulated in a container. Userspace
application that will use the compress API has to manually add such
4-bytes long field to each OPUS packet.

This is tested on sm8750-mtp. It is expected that next hardware revisions
will also support raw OPUS codec offloading.

Dependencies are:
-- hardware with DSP that supports decoding OPUS packets (>=sm8750);
-- adsp fastrpc for sm8750;
-- explicitly setting format in sm8750 soundcard driver;
-- running adsprpcd tool with support for Audio PD and DSP libraries
loading support (or its alternative);
-- tinycompress fcplay tool that will prepare raw opus packets and
do the required addition of length field.

The userspace tinycompress tool with support for raw OPUS compress
playback is located here:
https://github.com/laklimov/tinycompress_opus
branch: opus_v3_workinprogress

It is not expected that it is ready and still needs some work. More like PoC.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (2):
      ALSA: compress: add raw opus codec define and struct snd_dec_opus
      ASoC: qcom: qdsp6/audioreach: add support for offloading raw opus playback

 include/uapi/sound/compress_params.h | 21 ++++++++++++++++++++-
 sound/soc/qcom/qdsp6/audioreach.c    | 33 +++++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h    | 17 +++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm-dai.c     |  3 ++-
 sound/soc/qcom/qdsp6/q6apm.c         |  3 +++
 5 files changed, 75 insertions(+), 2 deletions(-)
---
base-commit: 050f8ad7b58d9079455af171ac279c4b9b828c11
change-id: 20250616-opus_codec_rfc_v1-b60bd308893b

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

