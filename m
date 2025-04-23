Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650D1263C8A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 02:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745376638; cv=none; b=bGK2gXzqqT4E97aPuV1N+CJUBb/WxcFycxrsh2UGNZiIgfoV6YahoO1oXcAuFe1L4/Axhe+2mPotaHKuwi+WaiISIDVCACaHznSUjtYdHGb0TtlMIH7Giq4vQmuPD8x5A/JVwRxvhSusYb7M5zTDAxVMlnzelxOE1390B3tTAA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745376638; c=relaxed/simple;
	bh=pvLBDDsYBas19wUJSHN+4qLHbj0kQt2zzQgLxxn1VJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oa7sNg1Hgpv5qtMP6wOSEdkhw4rHJD5hOepq8JRZFvkSYSQ1EkGOz3zoUCxg2DlR8MUPD0TEqZrC3FQogvak6Y05YrTcSzzE1zHNhK8WFCiFESRFg5JJz4lS5IoTLXa3hHOrH3SKMPJvMkmN6tpF8iGxet6dBDxy9FQ7LYoHcGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h+m0yruc; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h+m0yruc"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e6df1419f94so4506991276.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 19:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745376635; x=1745981435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvLBDDsYBas19wUJSHN+4qLHbj0kQt2zzQgLxxn1VJw=;
        b=h+m0yrucOX5HIpsRlq7lN321h5ppvDnWIK/JC1wvEWRjWg+E2MaG51nmfjGBqEvT9B
         aV/y8G/ZHmCMuOx3O/uWrkilShB3xHPlUpW+ivkIvfMc4jBk+vNKv3zhTNzhaQ14nukg
         TrnH2ze9cRQ5NNiPGeJ/APrZAO4zf/nds2YWJRi72/eNL6sPrNICdyp2A2Wsvy6XJ04/
         /U8knONifkjMlYGs4hkteCekqRM28nmG45SQ5VjvAZj7mwKcDK7+sh7RJlgMpWoPjNj8
         tGo5wSfVB6MbjrxRc+FNy46QFwP4QaHkzNdZ07+uZvA1QsrcDwL9wdFuAxW+yfWdTGFM
         wvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745376635; x=1745981435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvLBDDsYBas19wUJSHN+4qLHbj0kQt2zzQgLxxn1VJw=;
        b=feY1u8XXU4fAFaW5zru0xCk96f8LGMCEy7pmSQWluz43Nsm9n/D3mp88tjRZcJrJcp
         4ttA7sFUVy5Ts/XWGq3yy5PexXF9MDQc5155UzalXc9FrPC7nvenBXS3UPjQ2cIfi+tJ
         EVxVlKlwEeqlEj7r+PQA0CTDrpnqMeiyzRt6zCWSGJr7mU8DwAjHcG/FvOsigmY7hPH8
         MWlyCTCKWIWSugjHy6gqCOR0WN0cb9C2Cvp8rknEKeRBv6hMnkvyFSCei3lyGZzYATiH
         Bdae2pBE4Y8r1raHndRy8akp74nQaYqAcNCjWigHOxX6HSCDqhWpejLoaLs32D6/SZc1
         flxA==
X-Forwarded-Encrypted: i=1; AJvYcCXXlTeiSIOA8cPdjufVxob9Z7fr9cL2+tN+gJO9ny3i+/0xpEU9A9/PqJqZYCpUQZeyKGS2rWHd/NvbKMA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7dBzzRFAOvBTWmUWPVlaXaNkSV6U+ftHSIP3Lw8Al7SOvdDxD
	HvAv5MlXNjSR2FSSEt1CQXOXVs20xtAc2Wa6tGhNf6j+n50dqiUaROuRwOoH13+zV0A0ZFuiIZP
	LE3hg2UCSmQQMefvZuyKXk7NXsL4qPjqcNH3Ljg==
X-Gm-Gg: ASbGnctVBk6+9bREn8b+sBwDRxavk4VqtwZvaCLOgXBAkDwxTmT54AvmOsHnhmKXlQB
	nH44yK6Th2Qwv57mpuaPRvxinkO0cZbcTzgdhT2PioNlrEJl/kGvdIuA+MhDd1Vp3zk0YpbyACu
	2xlT092rX9OMia7rgYooqsVA==
X-Google-Smtp-Source: AGHT+IFS7GMJaX0GM076iPvZ4Mqv8sbSOQ2aAa8tFq8e5VIVWaIK11j6XpLBL5g1xrPI44TmKCq1OKq9pAfO+Q9jung=
X-Received: by 2002:a05:6902:1381:b0:e69:371d:67ef with SMTP id
 3f1490d57ef6-e7297e9ab9amr24210024276.33.1745376635244; Tue, 22 Apr 2025
 19:50:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
 <20250418183236.209236-1-mitltlatltl@gmail.com>
In-Reply-To: <20250418183236.209236-1-mitltlatltl@gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 23 Apr 2025 10:50:23 +0800
X-Gm-Features: ATxdqUHPz54vm6pZFuzIqsgbIcK5d4qHYfWOJGGxPj-jtXf6WoRf3GOGq6HIB5k
Message-ID: <CABymUCNL2FQax13vie8kqX_FpNOTZBPwKbxvKzmXHaXr2OjbAw@mail.gmail.com>
Subject: Re: [PATCH v8 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: airlied@gmail.com, dmitry.baryshkov@linaro.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	marijn.suijten@somainline.org, quic_abhinavk@quicinc.com, 
	quic_jesszhan@quicinc.com, robdclark@gmail.com, sean@poorly.run, 
	simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pengyu Luo <mitltlatltl@gmail.com> =E4=BA=8E2025=E5=B9=B44=E6=9C=8819=E6=97=
=A5=E5=91=A8=E5=85=AD 02:34=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, 03 Mar 2025 23:14:29 +0800 Jun Nie <jun.nie@linaro.org> wrote:
> > 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> > And 4 DSC are preferred for power optimal in this case due to width
> > limitation of SSPP and MDP clock rate constrain. This patch set
> > extends number of pipes to 4 and revise related mixer blending logic
> > to support quad pipe. All these changes depends on the virtual plane
> > feature to split a super wide drm plane horizontally into 2 or more sub
> > clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> > whole drm plane.
> >
> > The first pipe pair co-work with the first mixer pair to cover the left
> > half of screen and 2nd pair of pipes and mixers are for the right half
> > of screen. If a plane is only for the right half of screen, only one
> > or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
> > assinged for invalid pipe.
> >
> > For those panel that does not require quad-pipe, only 1 or 2 pipes in
> > the 1st pipe pair will be used. There is no concept of right half of
> > screen.
> >
> > For legacy non virtual plane mode, the first 1 or 2 pipes are used for
> > the single SSPP and its multi-rect mode.
> >
> > To test bonded DSI on SM8650, the 5 patches for active-CTL improvement
> > are needed:
> > https://gitlab.freedesktop.org/lumag/msm/-/commits/dpu-4k?ref_type=3Dhe=
ads
> >
>
> [...]
>
> > base-commit: b44251a8c179381b9f3ed3aa49be04fe1d516903
>
> Hi, Jun. The display of my sm8650 device requires 4:4:2(lm, dsc, intf)
> topology, I want to test this series, these patches can't be applied to
> the latest linux-next tree, and I can't find the commit id in linux-next
> or msm-next. Where can I fetch the tree?
>
> Best wishes,
> Pengyu

This is staging patch set. Code clean and formatting is still needed.

https://gitlab.com/jun.nie/linux/-/tree/sm8650/v6.15-quadpipe-staging?ref_t=
ype=3Dheads

Regards,
Jun
