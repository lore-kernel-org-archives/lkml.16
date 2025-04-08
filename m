Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2131D5ACE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123894; cv=none; b=iBherkAu+1+VOlYdEV6k+7oG04dTYTsATso1xYvtcm9xlnZx5B6WW/VoVmJqkA+vJEXGskNQX9nM9fgBEhKtTFb57qmzgMSAZOS4JtP0+Ye9X183NEWI0UQ/aKsT2HJYRq+qLPmeOEKRTP+eZmbkpEVenK0yohdevobu695qSg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123894; c=relaxed/simple;
	bh=QYspwtBhVsFSgwIRvDlo0+t6maQ17Xcqzma1ZXsCdVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DR9KE4xT1kTdJOK4QO4viMYb5OHvjrNZZNHHeHm5vACjdDdcakLOsMeposJbDABzGRHCGuTe+O9wiJWE0rkIiTjbNZLpPPbLFG65cS9/AYf3UpPrUu12wH1oU7Z3pVneAgO5aUM9ECXAC161fUheB8Q/a1dz9YKMvrgtoyRu0gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unrealasia.net; spf=pass smtp.mailfrom=unrealasia.net; dkim=pass (2048-bit key) header.d=unrealasia-net.20230601.gappssmtp.com header.i=@unrealasia-net.20230601.gappssmtp.com header.b=2fG5I6s3; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unrealasia.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unrealasia.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unrealasia-net.20230601.gappssmtp.com header.i=@unrealasia-net.20230601.gappssmtp.com header.b="2fG5I6s3"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54acc0cd458so6878665e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 07:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unrealasia-net.20230601.gappssmtp.com; s=20230601; t=1744123891; x=1744728691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MovUcynSAJffR7RJo4naoiiZN0xmuejMREjzSeCfcHU=;
        b=2fG5I6s3EPcMLwsFhg8HqffOYdlumC3bicuAJ7myLMNSEw2dbOmPrAUPwP/SWzC2uP
         Q7Ef0U7/2GzNqZfp8XSVB6WqU3E6xkYcPCdLrtEigFlRJbUOOLcaf+ajPhzNoj0p3rQp
         sstqkIH9oHDp0T0uEPLtrZCAHc1tHB3GQwVN1/kv+gkqBbfqf5yqrta/0lpdz0RwZdzq
         Jg4rHi5NptKWfNVDa3CtelgG5N6FptYPzBXvr7olO+OxFEbNEiYMGe2vTqqHmK3KL4F+
         n7J08IjGDFkOg+hbai0L3FlnibHXPYYSXDHdiTJNVZIbZtVjP4VbeoSRXo6kMJKuWmJZ
         vITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744123891; x=1744728691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MovUcynSAJffR7RJo4naoiiZN0xmuejMREjzSeCfcHU=;
        b=TG04WqY+VU85Xzyx+Zvvvb2oU1YTtbT9BpXHXE2gf/+kNdRxN7SFrAn/jUhGHMgSjw
         7CbiW+NrfJ9d8FINSFDQHwVQIBua+szY0LSVtX1fQenTM/w6jKL4Fy3Lpa6QQO3/ONcK
         2etcpHP6tnwmGbDSgzRdYHz+M7nVY8Wih/+EO6NZYdV4rjrwZVz3Jpo1I+LVIGf+cN1p
         z+7rYooSYC9vQ7E4LLZbHa/euMOUfuJpHuC2RgEuT6gU+i0HOo0EvoS5TTUbjhRN3GP3
         plu90IiLZh+4jbsHM3979vQ2y6pJEEDQ2QPM9C95z8pRyZiKHWw7EMytat775KaFoxGo
         EvGA==
X-Forwarded-Encrypted: i=1; AJvYcCXAOROAITpb4ViC5lo9LC+MeKr6Mpkcun8++Jb8A3h2e+ikUSG7X3jlEIubUKE133k9e+t3qqgh92XBm2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwczUClcqM+xVTJELbuQCaYz4amqngCkhrWCMw08JH1lgXefNL0
	EGIssdhqNQqvvWC4TLDA7n0o7QVFFRBR8VYhsG7jOY4LG3AURugS/TsHlejft39wpQzp69mtqpj
	3LiPfEzQrhpJ0w9o4UIsn0NUoQwNAGnhPz5DSC9VJk2FX8+3X
X-Gm-Gg: ASbGnctuBNCBUfPTbKKYBEY7NeClL75fxMkRwrn+AMMu9X7nqB1HWDhe+/WHiCuPrdP
	U2l3tVgLyxg7pRdCrLDM4PxV1zQ8AcmKRkMV5BBgTedDl7U8BCYiojrtF+TLKxyQ+9uM1UOfA3e
	7ClGhXSX5SnziOqyqLw8E06ajHedHkeSXZhmzoMAoEgwRFNSJQPbhrkPeJJs8=
X-Google-Smtp-Source: AGHT+IFzWK434nhtb4w+8XqXvvTVLz7cQ33CfkusPzfC4ffnVIgn0gGz66HquvJCMDt0tb15sjoUDK45j0gNOhYrFlo=
X-Received: by 2002:a05:6402:26d4:b0:5f0:7290:394b with SMTP id
 4fb4d7f45d1cf-5f0db889fb1mr12787948a12.27.1744123515199; Tue, 08 Apr 2025
 07:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2703842b.58be.195fa426e5e.Coremail.slark_xiao@163.com>
 <DBU4US.LSH9IZJH4Q933@unrealasia.net> <W6W4US.MQDIW3EU4I8R2@unrealasia.net>
 <f0798724-d5dd-498b-89be-7d7521ac4930@gmail.com> <CACNYkD6skGNsR-AH=6TWeXLqXeyCut=HGJeWUadw198Ha3to1g@mail.gmail.com>
 <CAFEp6-2_+25Z+2nPOQtOzJPgfJM8DAs2h_e6HTQ4fAVLt0+bwQ@mail.gmail.com> <BB06D58C-E27D-42FA-8043-AE767E9B5E91@gmail.com>
In-Reply-To: <BB06D58C-E27D-42FA-8043-AE767E9B5E91@gmail.com>
From: Muhammad Nuzaihan <zaihan@unrealasia.net>
Date: Tue, 8 Apr 2025 22:45:03 +0800
X-Gm-Features: ATxdqUEXOuMMmnIAa6YJ-BdW2lii4EbPgcz6D2oVlm5dOhxW2qYubUdeN-IGJGI
Message-ID: <CACNYkD7FNx6KR_aKA9S10=bXx4-Xj9WLnGVGDWTgNERerCc6uw@mail.gmail.com>
Subject: Re: GNSS support for Qualcomm PCIe modem device
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, Slark Xiao <slark_xiao@163.com>, 
	Loic Poulain <loic.poulain@linaro.org>, manivannan.sadhasivam@linaro.org, 
	netdev@vger.kernel.org, Qiang Yu <quic_qianyu@quicinc.com>, johan@kernel.org, 
	mhi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Loic, Sergey,

Thank you Sergey for your time for the prototype.

Looking forward for the code (and coding help if necessary) and help
to test it on my machine.

Zaihan

On Tue, Apr 8, 2025 at 6:27=E2=80=AFPM Sergey Ryazanov <ryazanov.s.a@gmail.=
com> wrote:
>
> On April 8, 2025 12:13:17 PM GMT+03:00, Loic Poulain <loic.poulain@oss.qu=
alcomm.com> wrote:
> >Hi Zhaihan, Sergey.
> >
> >On Fri, Apr 4, 2025 at 7:42=E2=80=AFAM Muhammad Nuzaihan <zaihan@unreala=
sia.net> wrote:
> >>
> >> Hi Sergey, Slark,
> >>
> >> Using wwan subsystem and it works without issues, maybe i might miss
> >> something, perhaps the flow control but i never have any problems even
> >> without flow control.
> >>
> >> I am using gpsd + cgps and xgps with a small modification to Linux
> >> kernel's wwan subsystem in the kernel to get NMEA data.
> >>
> >> I had posted the patch previously and i can post the patch again if yo=
u like.
> >>
> >> Attached in this email is the screenshot of cgps + gpsd.
> >>
> >> Maybe it should be in GPS subsystem but it's working for me even using
> >> wwan subsystem for months now.
> >
> >Yes, I would strongly recommend doing the extra step of making it
> >registered to the GNSS subsystem so that device is exposed with the
> >correct class.
> >From WWAN driver perspective, it will not change anything, as we could
> >have the WWAN framework handling this properly (bridging to gnss
> >intead of exposing the port as wwan character device).
> >Sergey, is it your plan?
>
> Yep. I made the prototype exactly in this way. So a modem driver should n=
ot care about the port type. Just call WWAN core and it will do the job for=
 the driver.
>
> The prototype is done. Needs some polishing, proper description, and prob=
ably, today night I'm going to publish  the RFC.
> Hi Loic,
