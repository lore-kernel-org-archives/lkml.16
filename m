Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098C31A072C
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 11:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743851902; cv=none; b=D/B2HfyjXW/JMxLtTLa/vPjtI7ZTXc9mq7Y03UD786rxunuvJp4EAByoVm1aUDo7VGfe1x1cVKZxSTCYLtWWhZTm2d2UThROIgzLcD/SrosKwHAVqTqjRZVW4IgAouLT8aowFbIqyd9EpAB8Gsjr4sDRadQXTy8BMraeBZivvt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743851902; c=relaxed/simple;
	bh=l+pRa8nsaudSPMcT2LvHvsD9/xV2J6NZobi5KXfSLJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iH+R1LOWxdGp4eGkMTSF0If9BlfkNYwszt6hxbO2W6zavku6D1k4wyg7sQHoeV6WfBKm/RJ3fdV4/0njRxQE2ZwUjO415YPHIkmoLdBGZ1PE7adfybslayWmA8gfd4WlrKJmDf6s3OhHyIS8K0Z8cvDJ6i08wT5mlauszt18ULI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K62LkcC3; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K62LkcC3"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-51eb1a714bfso2925985e0c.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 04:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743851900; x=1744456700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECCsJUXC0AyUHsAqS2sdMrX8IQ65yLLdsylphrjlU5M=;
        b=K62LkcC35ofGUBP2UldtrOssbG04SfJXNZ3hrr3FXt57/q3vLF7oh1TmLW55rEL+Ni
         OLvRqUrn+S+iQn1giJ47LAaqwyPG1Pni8xGv47R/XyJOHCSdsdSlj6g5wAdoWBcLJ9/K
         Yp/yB5t+JMlxUkwTiWuXyPOPjZmZg/c6msH8HDYzOmo7cejmqvdEX8vGXm6HLnCL93Cl
         A1JpfJ2WuV3KvCqlYvjj6rpgJfXvMnb7KcLKz3Rn4WzApyA6qTDSCIyoD6YfW363+cZ9
         jioFzbVHSccestkhlYXAN/nXimrA4tHBIoWWQLzlzdSpzRMlS9SR8ukzkU21z9QU4HfN
         +hGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743851900; x=1744456700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECCsJUXC0AyUHsAqS2sdMrX8IQ65yLLdsylphrjlU5M=;
        b=UXjWeEAMz8NZh6Vmv3cbzUkb02iggOKfPPyETKB0e37A4feAP7wL4Z8+JeElGBN3Ys
         czs75sFrjTCfRtxb2mmtDOrD7vFLDiCaGV79ldAdNdCukvHaNeyQAaMRfwu7GgdTHj1M
         xvmS92gjI8k5IV4P4M1VXagikglZbcjjgOxCmSb5dCp32ca9sqXeJc1jFxJE79aOGL4A
         q26hXPMxRqJqrXc8GlFANt9jE6nydWZo+pSiMPE0UMmIZm+Ld9IRZIKOdQv8+VtThweR
         LletCYkxdMRnSn4ScQLgMOOLSb4wE8oE+jD9JV13E2b1HgXLksvIURjDrmMPUU8WhyT5
         f1SA==
X-Forwarded-Encrypted: i=1; AJvYcCUg/xXgN0+EIk8COvcewZ/X/JLlp+XF2w40lZxBxtafwg6XxeTPiiCCIVRRAxKDCeHVPa5B3+Q0XjjNxHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNY+9TdkWBJELdXUtdzOJ4CvmpRrvWcnJn7ZsYTFrv85tnMnEU
	ifCF8whFWfX9wv8jN9lHlsvLciGBe6cboNXue420eqK8fAyHYXgyNvW//apr0draKpjbs423MXH
	OvYzmyAtn5ThBXoId8M3EtsG1HTA=
X-Gm-Gg: ASbGnct7GszMA1NzkpfBIzJCEOl1vBh3v03vMM5b57Y3A8XeQGdM0+Jal1sqx6G/DBz
	V3KqFmDsRyh+gzuB/7AgkjRvs0rYgmzeKoHlyEjk6yck9Ru2T0++6470qU96V1COejDuZQyKS/I
	9Ac1hWAFfWSXNg9esLB6i3CGxuT96d
X-Google-Smtp-Source: AGHT+IEjWohxgS6QFXZWuTg4A0pi2qdj0bU/f77VwfTY/md7vhCf08Tc9jRxGV1xAr2OzJciGVWowFsETUp670XJ/s8=
X-Received: by 2002:a05:6122:3191:b0:526:2210:5b68 with SMTP id
 71dfb90a1353d-52772f2afbbmr1597277e0c.4.1743851899934; Sat, 05 Apr 2025
 04:18:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743723590.git.abrahamadekunle50@gmail.com>
 <2025040505-blip-mower-bab6@gregkh> <69c335ea-dbeb-4c9-135e-2312a77e9ac6@inria.fr>
In-Reply-To: <69c335ea-dbeb-4c9-135e-2312a77e9ac6@inria.fr>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Sat, 5 Apr 2025 12:18:11 +0100
X-Gm-Features: ATxdqUF1PnSgaZiSu63nrpXsdgHcByUG8pGFlrnJPwLDedWu3X310PGlFdLlQqM
Message-ID: <CADYq+fYOvwmMGsjRDCm9AGeHRZW8si3xmFQ7jqEUq8CUQF1x3Q@mail.gmail.com>
Subject: Re: [v3 0/1] Unnecessary code cleanup patches
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Greg KH <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 9:49=E2=80=AFAM Julia Lawall <julia.lawall@inria.fr>=
 wrote:
>
>
>
> On Sat, 5 Apr 2025, Greg KH wrote:
>
> > On Fri, Apr 04, 2025 at 01:02:19AM +0100, Abraham Samuel Adekunle wrote=
:
> > > The patchset modifies unnecessary duplicate NULL test on a
> > > value in an expression, when the value has been NULL tested in a
> > > previous expression.
> >
> > Nit, the subject line does nto have "staging:" in it, so I don't know
> > where this goes.
> >
> > Also, it really reads as "this is an unnecessary patch" :)
>
> Technically, in English, if you have a noun that is being used as an
> adjective and that noun is itself modified in some way, you should use a
> hyphen:
>
> Unnecessary-code cleanup patches

Yes this was what I intended to do. ;)
Thank you
>
> But something like
>
> Remove unnecessary code

Yes perfect.
>
> would have had no ambiguity at all.  Also everything you are doing is a
> patch, so "patches" in the subject line doesn't seem very necessary.
>

Thank you, Julia.

I will update it as necessary.

Adekunle.
