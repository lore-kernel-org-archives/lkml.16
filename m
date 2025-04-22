Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD7418A6AB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310086; cv=none; b=lSyfm/v0Nsl/HCNI3T4qSiZqd9+FqXmE2DhW2O2jeBmz0BAOEaT2hrNVTe3OC8fbgFRRgPOR+NwdmBw1BJDWQ0ofvenctD1RjXCV9WRIsI9i1wxLaUGVgbakIezjbJbdpeZ2/1XcdV66KF1mk+fUKIBIzvKBTykTDFfCSjwSLis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310086; c=relaxed/simple;
	bh=jpRL4uJSEdZLr7FL6t1JTRk0auYOuocwYz9sSV+moUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GX60Y6l8o5GQdABkgNl1Qn8493RFfhAE6pZ780VU9d142mgFdWTHS+G/i3//n2ha+PBsT63EYj3vvBD1Q9U3te0xVWrBGkUXG9NVziMBDIUp4eIcLMMJ85VKUmqeb2WTFESX3buxRMadZX4a7FfQEuY0mO8V+L16eVAC/NJwb5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TivrMAQL; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TivrMAQL"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso3781628f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745310083; x=1745914883; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TuoukROcO2ElaqlkQLbNy3B557q2zcJ5qBkhA4bvFAU=;
        b=TivrMAQLFWx6Cn73WaO66dKGfJsdzVnoy/zPOVAbwif/nja7cHH2iQhRQ1fcfbAXpb
         wop0ifOeniF1JI+ruIVNGylpVpsdWc+4t79QO5ObGLhlmCeiRpihu+iPRGGbDyLKQSaG
         8mSopqRwueuI3Bj/uA2gSgodpZ264A/FlOrduEWWjgo952bQRqS5b3xBqny41kUeLXLz
         SaqvnbGrrJc2jJPTgYgpqV3PLR24XJ1i1xDn0tNPjY+wGP+f+t6Yn3C4+8Yu6PU/csJL
         6p2kuAM7vqpaAuf+6R/BE7mhy/Tp3z94xPlBPxku2EDGZrd1xrTpIWm88bZ36rFnXS1r
         kT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310083; x=1745914883;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TuoukROcO2ElaqlkQLbNy3B557q2zcJ5qBkhA4bvFAU=;
        b=CtMLMBYpiNJcXkHJIerjAsFeKA0+0mn9+w1onDAQ91ZJ1U055fQtqkJ/ClcNqs1mAV
         vkQ1YGePMY9agERw7I7s7c0qUxqw+mkPB/3wNnLnlDPuLZ+3sqSw0qbVqRFuYptF7Xe7
         giI99i6fzkR/uKsV0LAdQbptqUrWL8Pv7snVDAqycW2uA2jqixwCLTV39VfNU2I/fi4F
         Is7p7yCug60dMKdBGMh2820UbZtg2dZ1CTyOkWhd5DpPcYsK56pe3rMgE+BTl+UVlbWv
         KbXOqdIYB4gnwCJWfZuzWp2StOmKbnigN6+acNrlC/+mzTcmj6B/1iqV6npu2POsm1pC
         OTwg==
X-Forwarded-Encrypted: i=1; AJvYcCW8mCmvYz1YaWIR5kDfzfq6IUKPe+UA0pQkzt1V2UADuCtvgqHtRT36MeFDAUC/axQpztYBIX9i0Maxim4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzujJ+K06oxNI2EflVr0Bo1wfTLjkBYhCS5wK8eWYpQviglP+oe
	1kl4UXG2g8dTFS/2QCScie48qa6WU5x4JMKiPX2ZtXFg11iEYEvufSQ2ufhxlHU=
X-Gm-Gg: ASbGncuBhBuNubKtGIqSQB/PrIk3deSYyh98k8cqdFlO27gbU6kl0VUzVG9zi443+Rz
	hFOmUUYX5mlJKnNtwd/FsIHm50JmDEuEBpYIkfGUxZ2/1vnurIHtxJSUyjtF0WJykIi44iJuTe/
	h3HLikygttRmk6umUplvrfT13hbjadkUnweBRla9gqgd8qP0oAZ4kVkSc7HZv0UvynF18H5tlGG
	ajfmD+qjny4XGhshpTopekMrmUZrvXCT+scgicrmKhL3RLDjXFXPpRFXFOiw7ymJKyGydobc1rM
	Ic9jan3J6ug4CBgDkCfsA55oSrrbNz6M2MGVJRqfDp0rAOcT2gRAqEQS4X47Lc8=
X-Google-Smtp-Source: AGHT+IH9tuae0RqMiAjlvkLAuiChQYIp6/1WIla4R14zZPg7A3cy3CyoOen4tg78+umwpPgStlkyhw==
X-Received: by 2002:a05:6000:40db:b0:39c:1efb:eec9 with SMTP id ffacd0b85a97d-39efbd68416mr11766494f8f.13.1745310083047;
        Tue, 22 Apr 2025 01:21:23 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:28ea:ef8d:b4cb:c00c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4331a9sm14597808f8f.36.2025.04.22.01.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:21:22 -0700 (PDT)
Date: Tue, 22 Apr 2025 10:21:18 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: =?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
Subject: Re: [PATCH 0/2] Fix fallback qcom,ipc parse
Message-ID: <aAdRfirB9AnAOlH8@linaro.org>
References: <20250421-fix-qcom-smd-v1-0-574d071d3f27@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421-fix-qcom-smd-v1-0-574d071d3f27@mainlining.org>

On Mon, Apr 21, 2025 at 04:04:15AM +0200, Barnabás Czémán wrote:
> mbox_request_channel() returning value was changed in case of error.
> It uses returning value of of_parse_phandle_with_args().
> It is returning with -ENOENT instead of -ENODEV when no mboxes property
> exists.
> 
> ENODEV was checked before fallback to parse qcom,ipc property.
> 

Thanks for the fix!

Would be good to mention clearly that this fixes booting 6.15-rc on SoCs
that still use qcom,ipc (e.g. MSM8917, MSM8939).

Anyway, for both patches:

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Tested-by: Stephan Gerhold <stephan.gerhold@linaro.org> # msm8939

> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
> Barnabás Czémán (2):
>       rpmsg: qcom_smd: Fix fallback to qcom,ipc parse
>       soc: qcom: smp2p: Fix fallback to qcom,ipc parse
> 
>  drivers/rpmsg/qcom_smd.c | 2 +-
>  drivers/soc/qcom/smp2p.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> ---
> base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
> change-id: 20250421-fix-qcom-smd-76f7c414a11a
> 
> Best regards,
> -- 
> Barnabás Czémán <barnabas.czeman@mainlining.org>
> 
