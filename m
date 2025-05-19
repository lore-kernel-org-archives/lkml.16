Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA27679FE
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 18:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747679538; cv=none; b=FgBlUCzJJWMVhJ+vRde7mK+DTOvNlURqXge5UN/1Uv+kcGap5rkbFx344AzoM/lkBYsYKcwGSCQo36ZYPDMJ9GXCO/HF9JBjE/gLFWjRZVPmk0w5K+HBTMaw1xmmF6PZkLHaTUqiwI6I0WNIoU2kxBjp0e/oNX9pu/Iz1vUtkzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747679538; c=relaxed/simple;
	bh=P0+BvqT6Ysl7rrk0C5kjhOP/Ds4FsTeqcC13DrzqPwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AIiEuKb3kkROwS6kfKrF9RFMXv5T9hsMl1FLRDKPzk4QrrmW57TYssnlrhELbpLxNi3aIUIy3AeeiX9LepGf7gnzfBaLMFF3uc1b1XfwJdHq8WPIaoaguM2kPw7yOeGETpVGgl9kPGyRIafYk6F3+RaA4ZPcCkEQ5DUZmynYXcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qJe0Z0rx; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qJe0Z0rx"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-443d4bff5dfso114145e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747679534; x=1748284334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLUT3QeRgGdo7f8VdpZlNNkkvkkzawS11uAKz4Rzhok=;
        b=qJe0Z0rxfoYam93epo33SB03mIssykBVLVkosahDlgB130RCvPpkDbQpg2r133rSmG
         M3JbKIdjCaF3MLTXKhTMdnvzxmdSKycUT+5aCnLhRRjV2cot4V5MbblGhKKTf1tcudLK
         sQEm4q23NmLSbWJfGnWQ6YS9gja3oJcnjXt1C7hMF36LXiO/NTwdKmhxnX5iKgwTkukj
         bGoLjHu4ZXWoqvqFOCjoyKNChkTFxgGX70/fLSWbXGOdFB+m0Z0qpJe9nWY44abiw1EP
         BtAMlrqvSLSMbbqi2t70w5gxZoMEQDpJLw8soHR01s+uH58HZgrJcEAtnu1aq0kdCIdd
         ftQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747679534; x=1748284334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLUT3QeRgGdo7f8VdpZlNNkkvkkzawS11uAKz4Rzhok=;
        b=Ed06mEx9iAXpYwbPMHHG1U6BCY0NJrECEcwTAYDxn9ajmdN6dRWhhb/aqvgWRiTniY
         zc3A895rkVCY4/q7UhAHjViAACwM+h+agd5vcnRUiTVRJnWwND9Re8xYU7muXrNHUP/v
         GKXWNgiNQqRdFgvl+tbmEvVU0u+T/KY3VvXeff0jnAOQpx8gt28e7kAbKYwuWyqMKK35
         qEtavTCOzlIWwONSZPc8Uhj8fNbPp0/OWuC4h8WScKfnsVbZjIoMdTHCWXiJ2yA3jEVr
         OxCJpfd3PL9iIXpik1Edlg8jjoy/8mHFgLOTOS1I1yp+1Q2ECQyDY0OHtlzYbcIdBB+A
         EfrA==
X-Forwarded-Encrypted: i=1; AJvYcCXx3mjjtpt216CJojVGRdJLeS1y89V1VDIOkyQT4Y1eWsMY4LJajzumAMpk/uCUFQ2EXcuUQAiNj0Dxv5o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7pz9cr8NvfYKta12XomxTq3uDCYWIDoIbmSj5ByUswdJ4YofX
	om6jOB8bu2SQ8CGkpk/jWDAT/Yk2z4aXZ53FR4b/yfIHbkVZyLWte2wunuRz7Z08EDaB1HNw/2b
	y6v5ZakMGGOJSUxTQmDYKr24TvehJvbCEl9C4+7k4
X-Gm-Gg: ASbGncthERSVXDZGdmUYyuI3NrMtRE6bswP4LkijxkkNYfdn2E9p7sS0sR0E8a1qWBX
	YiNIrVNJbzc7bs865/Vk2TVK9psmuZfWngqZkLOeE27UK9sgaFYEeKvICvzCl9skUXlvsOnAs8K
	owjkAZqztXTwOqGw78nx5iwCBo8kXPlMKpwom46TABW1ufDJWqF0LEWYAj7LJre3Wl6nQ+mgEF6
	A==
X-Google-Smtp-Source: AGHT+IFeQBMSJPGO6v2VuM8ztRxqMzIqpj33vzCux4RHIlkwC3+m/YPs7WMFqhoM7/7BuqtI2xAWugCPRVwZNdXYQS8=
X-Received: by 2002:a05:600c:8417:b0:43b:df25:8c4 with SMTP id
 5b1f17b1804b1-443ae3dbb82mr3982765e9.4.1747679533912; Mon, 19 May 2025
 11:32:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517001110.183077-1-hramamurthy@google.com>
 <20250517001110.183077-8-hramamurthy@google.com> <20250516185225.137d0966@kernel.org>
In-Reply-To: <20250516185225.137d0966@kernel.org>
From: Ziwei Xiao <ziweixiao@google.com>
Date: Mon, 19 May 2025 11:32:02 -0700
X-Gm-Features: AX0GCFtcDw89GhEYpTmvUrwgGsrlQLb2hyDI-d2hTEgfQI3bhERRmIlPbeST0F8
Message-ID: <CAG-FcCNVAMsvrtZscdoFEFerdTcM9OeSL_GM49ou8ftFraXpMw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 7/8] gve: Add support for SIOC[GS]HWTSTAMP IOCTLs
To: Jakub Kicinski <kuba@kernel.org>
Cc: Harshitha Ramamurthy <hramamurthy@google.com>, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, jeroendb@google.com, 
	andrew+netdev@lunn.ch, willemb@google.com, pkaligineedi@google.com, 
	yyd@google.com, joshwash@google.com, shailend@google.com, linux@treblig.org, 
	thostet@google.com, jfraker@google.com, richardcochran@gmail.com, 
	jdamato@fastly.com, vadim.fedorenko@linux.dev, horms@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sat, 17 May 2025 00:11:09 +0000 Harshitha Ramamurthy wrote:
> > Subject: [PATCH net-next v2 7/8] gve: Add support for SIOC[GS]HWTSTAMP =
IOCTLs
>
> Sorry for the very shallow review, the subject jumped out at me.
> You're not implementing the shouty ioctl, you're adding ndos.
>
I see, I will change the title and commit message to be more related
with the ndos.
> > +     if (kernel_config->tx_type !=3D HWTSTAMP_TX_OFF) {
> > +             dev_err(&priv->pdev->dev, "TX timestamping is not support=
ed\n");
>
> please use extack
>
> > +             return -ERANGE;
> > +     }
> > +
> > +     if (kernel_config->rx_filter !=3D HWTSTAMP_FILTER_NONE) {
> > +             kernel_config->rx_filter =3D HWTSTAMP_FILTER_ALL;
> > +             if (!priv->nic_ts_report) {
> > +                     err =3D gve_init_clock(priv);
> > +                     if (err) {
> > +                             dev_err(&priv->pdev->dev,
> > +                                     "Failed to initialize GVE clock\n=
");
>
> and here. Remember to remove the \n when converting.
Thanks, I will update these to use extack in V3.
