Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B247205ACF
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748378169; cv=none; b=FtppIFgx9WRbUi+fWZmtrf3pz/g6Im8yvPuwrXfynypIJieCwWP2L+cUlRJGedT0poBvE4pWpxMxZ7bHp0f3NV0vZGfGSsD2wib8raOPAa7nXGEYa8A1bSuHSJtYvTcIPlG/JutCk5i+amaIR0k4bbhAQ/bW50iNx6aaDQn/MSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748378169; c=relaxed/simple;
	bh=rDgiCXMJ7QwYx9k3r7b1d7vfNYFGSRBa+0aoACNPos0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lg++19gBcrJGw3UM8z3WDwkPKjF309p9FIR+RmEKBZrtFnaVduyiMdEpBVCcqY7/qqiJNEnvRtx2ylDk5QMV2UMTcG4lJssHpEk57myzT87eyvegEXTc0UVNFibbCxr9awbYsAHZwJTaAuFSEhBaP49aRTKf30QEpweukw+QI2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yo1LVlFg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yo1LVlFg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so44484975e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748378165; x=1748982965; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDgiCXMJ7QwYx9k3r7b1d7vfNYFGSRBa+0aoACNPos0=;
        b=Yo1LVlFgyijdscclGv4wbTxFlD1wtoWZNAcqneEoT78bfsks87fqqpqElkfTaBaoSc
         pDmy64OSrP7XWpPT6wE/2jbkPE0MvN4P1V8drdSRGpjn63f6CdhvMGw/ybamwaqvWeZy
         Z6aELbSAroUN7AXNQNoVJMZJpEMii8dcCMWA9YQcTPK7gslkE1X6LYIJwOkMck/UYWtR
         xucNtK8h077ksJsiyP4sGa6uzjvjFWQjYBs1C9IF5rgUygPce5Nz9PbcyEV7a1qBtM7V
         6LiIhuSq4C991N/C+DpqP0J05bY7RfGSHTHVgWJ5I3wtKt52s7+95MSHP49qN3CYzYTD
         a2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748378165; x=1748982965;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rDgiCXMJ7QwYx9k3r7b1d7vfNYFGSRBa+0aoACNPos0=;
        b=bLwvOIbDGkzoFRrJGCF30YtahqRcHZc4w+JNE3r7VyAQFFhZXsp9GWgXgPQxjjyCRd
         JlVmFMVJvhKZlRqG2vlUVYtS3jdnaC7KdM75B3DMIxmXeRcUJALvkkFUUY8RmV9L+8b1
         vsIPeX642udBl1JjimBoJKbVWP30JzS1Hzlsi5tprKBEGEzredQz9Q42XsWCfGrvaSbI
         NQoESs8snUzF3Mue2ZYHDJx/ymQIHBPJEsIyr6Gb8CBklLRaLW2dVRQ9hrDxPasxfmIq
         qeDF8Wu2pM81wlmKY7/jgw9Hbzgj6CJjXibPeInbiMDHiVh9DH0j/9Q49EAGvZJzFWXB
         qYsg==
X-Forwarded-Encrypted: i=1; AJvYcCUCjoIjC0WciQtwqjoKpqRd2XNpzi6LceYuDgy8ipXuvQlqDPM3BQhWZ4yNLeZ/etuGYe17AG/1/VeygiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkULw2u8Ih7zp/DlQXZVyWEhzH+3aLenTqgBvyo+tIMBA8TA4X
	O3/BoqNjHnyOaRK4vdFoCoWSAqXG8Ml7UfCFtNzG7vo1WTpBAz7rz/ixwlXHWRzN8ko=
X-Gm-Gg: ASbGnctQRn89FbL46k2SbJV2cdZxD94y+++fteFHnZXzekzj3/xVnIQw56Ve4B2SHrV
	V4M4c7T3EGsULeVgVZY5j9WU9mbf8oOCm97Y2U49o8ekfuYK4dS3CABoEoX3Id+mUNhJaL6oBeg
	DeiRq1sLOW+YsgTADP3VxlkPkma7u3e+U8VALuM/3qEVcq+4kDOnZYViAz9Za7a4RrPiEy+57eE
	yWw4qgrzheo8mLLmMhVhuHYD8sHG5quulEZ2C7rEmIBdS0mU9QJiQ2zM2fXmEZqlHIdEuG9WVjl
	Kr/nGypGNus6oJWOsEH1KsGThOCoevfPWeun6Q45Lr2WFSVYCJzo9nKL1Q==
X-Google-Smtp-Source: AGHT+IGt5FX+XfS5v3YhSbY5b3+efgyRPJITcDFZApMuFHFqQmHePgMdC8vqwtpyvxQnDzPox/E4Rg==
X-Received: by 2002:a05:6000:1889:b0:3a4:d953:74a1 with SMTP id ffacd0b85a97d-3a4d9537691mr7998232f8f.23.1748378165373;
        Tue, 27 May 2025 13:36:05 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:f024:90b8:5947:4156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4e8b94f7fsm59636f8f.37.2025.05.27.13.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 13:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 21:36:04 +0100
Message-Id: <DA78C0GLXJDX.2Z7K375XWOZH3@linaro.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Mark Brown"
 <broonie@kernel.org>, <linux-sound@vger.kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 07/12] arm64: dts: qcom: sm6115: add LPASS devices
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
X-Mailer: aerc 0.20.0
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-7-9eeb08cab9dc@linaro.org>
 <26afac49-2500-470b-a21a-d57e4ff14fa6@linaro.org>
 <DA735DM0N649.3NLLMFUW7ANNM@linaro.org>
 <b163bb31-2d02-47bb-a7a1-91c1fb007523@linaro.org>
In-Reply-To: <b163bb31-2d02-47bb-a7a1-91c1fb007523@linaro.org>

On Tue May 27, 2025 at 7:33 PM BST, Krzysztof Kozlowski wrote:
> On 27/05/2025 18:32, Alexey Klimov wrote:
>> On Thu May 22, 2025 at 6:52 PM BST, Krzysztof Kozlowski wrote:
>>> On 22/05/2025 19:40, Alexey Klimov wrote:
>>>> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock controller=
s
>>>> are required to support audio playback and audio capture on sm6115 and
>>>> its derivatives.
>>>>
>>>> Cc: Konrad Dybcio <konradybcio@kernel.org>
>>>> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> Just keep one CC.
>>=20
>> Question is which one now. Konrad, is it fine to keep your oss.qualcomm.=
com
>> email here?
>>=20
>>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>>> Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>
>>> Missing SoB.
>>=20
>> IIRC I took Konrad's changes but at this point I don't remember how much=
 was changed.
>
> And stripped his SoB?

If the memory serves me well there was none.

Thanks,
Alexey
