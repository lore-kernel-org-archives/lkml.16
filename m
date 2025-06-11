Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A495323D2BD
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 23:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749685281; cv=none; b=A8Cyx4wqsAloXPloImHszO6zQhIcWaBnzG21hZaDN+AN/bWyA2eKBhMjZg35TIqVzsu5vfq5niHJ1bjjbphRlfAQkTdDVwOVpejnvQg+7cRB3+nt0bhWa+t9IROGBuofyspmqYB/fclh7Kc8o16Nze8wt0Kmyd/Ujuc1Xn57ZXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749685281; c=relaxed/simple;
	bh=kTjXdiUU0uz8DY8+/rLWqtPAVHSUlHMG7bi7fWmNw8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rjm1c/G+dZh9ZPcQkF0mDltO1cHsbhQ2OI/h863Zfh64qboNn9YRQ5CQXQJaIEjcBT461zrqfFijyo/5RIX+OMrWmehsfYiLdOJMlpp+XrsjRTTJTUthxJ0RNU+ZsLywHsfpdRPSgH5Y8zi06JRVI1iNKzJ1ExzbK1FZwJtQoNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TnxQdsx5; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TnxQdsx5"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a58ef58a38so90911cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749685276; x=1750290076; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnwvu7/fKFkzEdGXspXaHEY/ygF+zDGWlZtFYDo91z0=;
        b=TnxQdsx55rPDt/6EUBIWPDp736iF5pbpcQRZp6OUeDGl7AvIhMBpRQf3HFqTXLLk8M
         oAYY00pgtteYY2SqRB/q9PDAg4FtpoaU0o2y4eCYqBFUi1/sxWlh2QSj+tZ/MsCDscof
         9VSycEgXfpWsGVb6D6krfRcKXXe91p1h2LOuFVCIf/YwDUU5M+DBUdPYYkJhQLJaPbiJ
         64/BtaXtAZz1aeJwgFwecOc6DcRGwftZDZYugjM32IXWivDmx+zXzN9J8FqGWU/LpBuK
         OKc71tH7q2igPG/VlmCADdC9TMn8kjaLtmhE117JCJHIT92/+lLk8JvkzPG9srtP3PxW
         63Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749685276; x=1750290076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnwvu7/fKFkzEdGXspXaHEY/ygF+zDGWlZtFYDo91z0=;
        b=AyH4u3gbisrIbmHVnXNi+jOOl1cOBEM1/2WeNjoLVaoNgqIqwaYXuf3guGtkjwhRNa
         854XTpUlBsYHaQBNFCBoNRn8JzAJDHUAHjXrRtB8sIsAkmNZSNP40c6acw/56dPEnD2e
         /6zqIJi/HkvxRA4jgYxEE3Qekh2AKwDcKbns6hbNFwrm77nQ/I6nKLhco07nPsC8aI+e
         ToimyVsJjY9wtbmatB5qlhu1TJKB25fo+KyvaOrIO11nl1coPSnjd1l6M+arOHAKCwCi
         l6ZYJAne2y+Qn7fX/dIYFT3hYewdkigewHmzYF9YForwS41FuuENeaSt/0vDnlK6qdey
         uC+A==
X-Forwarded-Encrypted: i=1; AJvYcCWv3x2ywkEWMPZipfBbsZq+rS+R6uksAk0gRi36dFfKQJtUlFfg5g8m6gO2Iay3adGDkuRaWnV8bb2iCSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlODebFrIoRjFYZPVcF/QrnbH3NrhctfHI5zxuG7AVHkz182sy
	wEm/NtzhOgBFvqDWS47Kbcluocf6JIlSbRCs8w75Sn0si26qzRxaEDQ1Y9XLwyH4N2f/P1EEaPz
	JSjWiX1HlrnONNDm/ITU4o7LJx89o0Kejm4UIx0eQ
X-Gm-Gg: ASbGncujIUgiST3VzNAZ308qJq5ckOGvbKZ31WS77+IOc/50QwBO1gqOdqT0NJfIDy9
	bt3I292C0zNel+Mz5NdFNKxhuyW+ORjX5BsKCTdPVUfmGUcRP+OB6UAww1+JwPSb38qrnagXAx5
	TWKinjQDEZ2xzOPx/kIzHWIR2Bwe/JayiU6ne1/qNTM+E7NAllbhLCKLuO5yEMkUSf2T9Lt6jmT
	D/lTnB6giTV
X-Google-Smtp-Source: AGHT+IE8VXJ0lACkCQtSqAJ6+lw38b1R52arM/JkN26dV1XojC/+5OQduLUE8A/SijvJokeBDWTCK+sl90zsPAKPX9Q=
X-Received: by 2002:a05:622a:1345:b0:494:b06f:7495 with SMTP id
 d75a77b69052e-4a7242e8646mr1211031cf.24.1749685275160; Wed, 11 Jun 2025
 16:41:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609184029.2634345-1-hramamurthy@google.com>
 <20250609184029.2634345-6-hramamurthy@google.com> <20250610182545.0b69a06d@kernel.org>
In-Reply-To: <20250610182545.0b69a06d@kernel.org>
From: Ziwei Xiao <ziweixiao@google.com>
Date: Wed, 11 Jun 2025 16:41:04 -0700
X-Gm-Features: AX0GCFudQlLirSQu_pfgV-l62e-RT51p_3WK5BG7S3Kaz7L2GVzeN9WeWjFqHhE
Message-ID: <CAG-FcCPwJVw_8MyMyUkjwwTcotQyWa6_g1U6_WGf1YQ4_0n9Ww@mail.gmail.com>
Subject: Re: [PATCH net-next v4 5/8] gve: Add support to query the nic clock
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

On Tue, Jun 10, 2025 at 6:25=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon,  9 Jun 2025 18:40:26 +0000 Harshitha Ramamurthy wrote:
> > +     priv->nic_ts_report =3D
> > +             dma_alloc_coherent(&priv->pdev->dev,
> > +                                sizeof(struct gve_nic_ts_report),
> > +                                &priv->nic_ts_report_bus,
> > +                                GFP_KERNEL);
> > +     if (!priv->nic_ts_report) {
> > +             dev_err(&priv->pdev->dev, "%s dma alloc error\n", __func_=
_);
> > +             err =3D -ENOMEM;
> > +             goto release_ptp;
> > +     }
> > +
> > +     ptp_schedule_worker(priv->ptp->clock, 0);
>
> Given the "very dynamic nature" of the clock I think you need to do the
> first refresh synchronously. Otherwise the config path may exit, and
> the first packet arrive before the worker had a chance to run and latch
> the initial timestamp?

Thanks for pointing it out. Will add gve_clock_nic_ts_read before the
ptp_schedule_worker to do the first refresh on V5.
> --
> pw-bot: cr
