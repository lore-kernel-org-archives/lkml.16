Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7A51E2602
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 16:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751128977; cv=none; b=CcpVb6X7mN4NaHQtLkXCOuOeUKrmxza5X7TEE8XMvbNKhb6+7F/RyVerCs0x30pIMBny9bsL4EBLsaKfl4QxuDKFP+1iH8P8tu6hzAgYBuHs+l3+LoQC7tfUdM0vr/i+0yBnl7WacsnYTi7s9V187oJFH79fpKdquwTQZ4OShSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751128977; c=relaxed/simple;
	bh=8+0Um3IyKyjV1O1yQIgBid/7yX2tEmqks0sJwHrXkHU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=RL1arV5FEpgjnBSv0Ko9wbkuIlWnq4+rdDsjB+qhFYLqpZBp1W8/PwOJPffCyf+Kz8gXIjAMbMHKManS0rRZam6if0hRkjpJK4peIVx4FWzTdEgQQo7d+HEbI+0fviDil5HXgAY/cEeF+duByI5kD7TpIiNR003VlaY/8zSi/Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IXrLLTSi; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IXrLLTSi"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a51481a598so393636f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 09:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751128974; x=1751733774; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+0Um3IyKyjV1O1yQIgBid/7yX2tEmqks0sJwHrXkHU=;
        b=IXrLLTSiDQ7PCOgZvs8/ngQy/O5SAjTF7srjEcwqjngnGHZ/VFA/rcJUEFl01dg8WG
         pqnO1WWYC0myEY2V1941MXEUzrbhvkPY7MR0bDHPvHdhlXJZmKjGhpszcD3Q53x9efaX
         wdHXQhteGQxWLZ4w14kSeLioSuap68yRB50Wk35qdWT0Ol/qYRqtPvp7LeoiePNdrQvr
         tZQSy57SqsFscCDtKvJoT7R7b1OkGVjYDM2Z0GZvVHFDCK9OsyS+UlsIa10WcNI1yhTb
         t9T+r7k7gpyLJWZxDWH0GiZgljfyaXdWvYbPkKKWp7j0yyE/S7RgqKSNmT9ZxPvgCJOu
         XGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751128974; x=1751733774;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8+0Um3IyKyjV1O1yQIgBid/7yX2tEmqks0sJwHrXkHU=;
        b=b3Vrff8JGSHDhr7kzft5CvCSw2x9Bjg4+4A23ELtwiGk1+ol2P+vW3d410aX8J6MFZ
         /rHN5H8TnHkR42C+br2AjDIF/ms2NBjZ17hOjbuURSXaDvwKpPscGvKsCNdWA+NaLSmG
         8/cZNqIltFVK2pZuAhqanq78/pJjYgrg4o069S1Y4uD2A2uNMJLIIR1O74n4/QFnJDZ1
         xTQo8cEPclNWC6VQMiSLtzMNKWCueBJK7Yqq4AWvvLmVEzAklJzL3liSR9sDP9KOw+rR
         gc1WOvPEtN9m1JK2nfiabuGhup152/7MnDWTA5gdYX3hneZELvmVvQRyb4Yg/DhZxat9
         L8gg==
X-Forwarded-Encrypted: i=1; AJvYcCWf5mAkeOH7wnchNCmltNvtMjvt0a0Mq2QqEQ38odMqV9MX52fs26UepcYGLCyWHoh6MTRPnq4qmruov+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzWdZLoYARgD62TNlz5iS9qB8BWKzm+YlcXWz53A86OUl+tHUk
	8+F1Q8mjBgqZ+jnoZLYCyFaU+Ro2EpNLyncuKh+XGwT62V9m2iU4YPUqzvuWiZFyfCM=
X-Gm-Gg: ASbGncsHoDCSe1cjIS4YPMkLrzhIdJGl6KBh4oJbTE76qKBHCtHl15NvVPBvm/E2G0P
	EJRJTCkh8FTMCka0krCFKNlJnidRA/GeZLhzG0DABGA/EqRF7X9Co5VohF/fJeD9AxhJQ956Ncc
	AcCi1UGhrHbJ6vPXQePqZSq30bu296XDmzWob4SQiyNp0tOn1L8mzGYuxjOnwYh68YJmTCwcZ+7
	vbvchYtQyUhbc+1v/NDbG/ic9JAnLyYty2cHdkClhbpMSqEvIR7pxMzoYGlb2LWlbPZv4m8kro7
	I8o3KobKb2EUKWq9o+ne6aDSL0LWukwt5AOdSqEGojx6k0cDC0+2i9udovdMXsbjuh6u
X-Google-Smtp-Source: AGHT+IGFXbwNYTSyjPQd7nh+H6Es9NPSjiD5mA2m1ub+Q2Abl5oNI0WlfEOljgb4IM3zbq46WDBVfw==
X-Received: by 2002:a05:6000:4404:b0:3a4:f66a:9d31 with SMTP id ffacd0b85a97d-3a8fdb2a034mr4733769f8f.16.1751128973831;
        Sat, 28 Jun 2025 09:42:53 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:e33b:a0ed:df4b:222c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52c99sm5609102f8f.49.2025.06.28.09.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 09:42:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Jun 2025 17:42:52 +0100
Message-Id: <DAYBEWESVDJY.1ZDYI58M9OEWX@linaro.org>
Subject: Re: [PATCH 2/3] dt-bindings: mfd: qcom,spmi-pmic: add pm4125 audio
 codec
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Stephen Boyd" <sboyd@kernel.org>
Cc: "Lee Jones" <lee@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: aerc 0.20.0
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
 <20250626-pm4125_audio_codec_v1-v1-2-e52933c429a0@linaro.org>
 <eb5cdcb6-7e40-4ed2-9cc6-6eff43da353d@kernel.org>
In-Reply-To: <eb5cdcb6-7e40-4ed2-9cc6-6eff43da353d@kernel.org>

On Thu Jun 26, 2025 at 9:48 AM BST, Krzysztof Kozlowski wrote:
> On 26/06/2025 01:50, Alexey Klimov wrote:
>> PM4125 has audio codec hardware block. Add pattern for respecive node
>> so the devicetree for those blocks can be validated properly.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>
> Remember to ALWAYS explain the dependencies between patches (merging
> strategy), because this now creates impression is independent patch. It
> is not and should be squashed into previous.

What's the proper way to describe such dependency?

Best regards,
Alexey
