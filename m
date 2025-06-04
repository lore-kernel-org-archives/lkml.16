Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B3717A30A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749039658; cv=none; b=e8mnHIztFk7m9cR160we7Uo2UIQRRDiHbuLfmucvI7jnEolhs+NoNeqK13rjrCozRTXgCNm5qVRm1nD+sNttLfxo5TU5VgSJder3ZyJrtNmABjeQS3yuuV1jxqopGZs6KOaCfxW8Ou6AGC0BrxW/jOO3gV/glEgQ1apFFah5hpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749039658; c=relaxed/simple;
	bh=UJO8fx4zrjzUtoGazJLMeF4iUYaNpSkc62UBtLsRXWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjF54rhAxc5SzRqVow5O79I7BPLfpzT2RCmx27QhP509eP++3e3DuVHHqxsIjBQcwATOZis4TYjzdnOc3/rlDNSb4mDwts5yLY5PMwfqOknQ44Af0UnljscQmrWhr0fJMW9HXm1909o4UGELqxCp33L3OPhhBB3nJHrjknxtYzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=NMkVPZiv; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="NMkVPZiv"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so6381914a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 05:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1749039655; x=1749644455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ztn23ugr0Et0nrkznY5+W0yWLUSMNK7u22fb8u5+6Hs=;
        b=NMkVPZivcRBwtpL9R+33KwuaB+8SNvHkf2nNNgHoUFVcjzLjbkjDrZONUuGCM2wGku
         KAoBJDWybfEdwheXsoq1yV+fmEDyIlb+ML55J9Jk/Qd4wVVZI++HhF972M+6gq6LnyaH
         TCWXS0+ieU+yvH0gJnoYcvyEkZaZkUJehc6qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749039655; x=1749644455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ztn23ugr0Et0nrkznY5+W0yWLUSMNK7u22fb8u5+6Hs=;
        b=PHjfWF0u29duaw9hhrQ+4i+IIWdE1AkPLFGZZjUMdHk/Y0jfncOwXwCYlOzYlnYPCt
         zKdYBOVX09H8OpcHH9hl9D0OOjSFd3BzmaO5EeMdd9Leg8q19RK8YoMdnVB0jqA/ANUB
         tfYtEPo4/hTbHxiVZLcibCLl78GMhJ0pwHKoeQwxp7Bor2wmP7/sNhxyXtYaHVvTV4gV
         2hJS0wsCepPpME8NIG6mMnO0nj+JhXbG4Ia6MZ0ezEVSYIxsSGiesDtau6TpKsejp0Q5
         shQhb0j0M7fdB3ETPuZUZjVHUmIAKOf+TdzsY4bKEss3bltvmZy1NcztV2oQoCFoVWqh
         kvNw==
X-Forwarded-Encrypted: i=1; AJvYcCUQIPXsuwc84iF38PNKyeDdD/UJ7vaQj8NpichOQW9fBQ0HiB6nls+1dJZB4+VSvgkp1M2kaqa3kcVQ7as=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIM1sCvoAbRJMVhJnKt1UgQj2sWqw5wlZOlTPUPTS+NwjXHVaM
	ryY6bPaCRMqmhj36c2hHC4rl2a/mAWHBPY3Ldnq35CEiUAUqHx6UpSc6SJFOdUi418cOwLq/CaS
	ezWeBq7jhX3JZibBOBoYQE0mQ9EsCB/6SMCWK+SFvM26jnO8afEIcwbk=
X-Gm-Gg: ASbGncu7DYDD6WGb6WHGw5Z1MmO8iASL9Rr9d0/JYkce3mqSGqcMFbHKDOJZALFXJbI
	pFNV8f01s9s+AxaK/J35zph8E8sATy7yoygM1NJLc2D8HXQ3lJ5SGmSuatoREEuFhB+kymIvqvu
	tIEDRcNQG3byXNP8YLnWA+l+HrPSD1LsPuZw==
X-Google-Smtp-Source: AGHT+IEGMdIOkMV/uQ7zUK4UFRQ/YPtl1qy/zuPQpsLGtSK7QRRT2HbpWbVUamoQWNHk/kCuifvCQu4eWbBNQYRgwmA=
X-Received: by 2002:a05:6902:1207:b0:e7f:66d2:702b with SMTP id
 3f1490d57ef6-e8179dacd59mr3554043276.35.1749039645410; Wed, 04 Jun 2025
 05:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602053231.403143-1-pavitrakumarm@vayavyalabs.com>
 <20250602053231.403143-2-pavitrakumarm@vayavyalabs.com> <fae97f84-bdb9-42de-b292-92d2b262f16a@kernel.org>
 <CALxtO0mpQtqPB0h_Wff2dLGo=Mxk02JJQkK4rn+=TuScNdSfxQ@mail.gmail.com> <3570be5b-cb20-4259-9a9b-959098b902d0@kernel.org>
In-Reply-To: <3570be5b-cb20-4259-9a9b-959098b902d0@kernel.org>
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Date: Wed, 4 Jun 2025 17:50:33 +0530
X-Gm-Features: AX0GCFsFCDL3Q847lJwuNMF8LuDkhE19L7HG54evtY5CFetlay22p3RmnolgEVg
Message-ID: <CALxtO0mH=GwhQxQBsmMQYd+qgAue9WxXN1XWo9BncVJvJk6d8A@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: crypto: Document support for SPAcc
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, herbert@gondor.apana.org.au, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Ruud.Derwig@synopsys.com, 
	manjunath.hadli@vayavyalabs.com, adityak@vayavyalabs.com, 
	Bhoomika Kadabi <bhoomikak@vayavyalabs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof.
  Appreciate your inputs. My comments are embedded below.

Warm regards,
PK

On Tue, Jun 3, 2025 at 5:34=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/06/2025 13:45, Pavitrakumar Managutte wrote:
> > Hi Krzysztof,
> >   Thanks for the inputs, my comments are embedded below.
> >
> > Warm regards,
> > PK
> >
> > On Mon, Jun 2, 2025 at 11:28=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 02/06/2025 07:32, Pavitrakumar Managutte wrote:
> >>> Add DT bindings related to the SPAcc driver for Documentation.
> >>> DWC Synopsys Security Protocol Accelerator(SPAcc) Hardware Crypto
> >>> Engine is a crypto IP designed by Synopsys.
> >>>
> >>> Co-developed-by: Bhoomika Kadabi <bhoomikak@vayavyalabs.com>
> >>> Signed-off-by: Bhoomika Kadabi <bhoomikak@vayavyalabs.com>
> >>> Signed-off-by: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
> >>> Acked-by: Ruud Derwig <Ruud.Derwig@synopsys.com>
> >>
> >> Where was this Ack given? It's not on the lists, it's not public, so i=
t
> >> cannot be after your SoB.
> >
> > PK: Yes, its not on the mailing list. I will remove that.
>
> If it was given in private, then happened for sure before you sent the
> patch, so it should be above your SoB.

PK: Sure, I will fix that. Yes, that was an internal Ack.

>
> ...
>
> >>> +
> >>> +  snps,vspacc-id:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: |
> >>> +      Virtual SPAcc instance identifier.
> >>> +      The SPAcc hardware supports multiple virtual instances (determ=
ined by
> >>> +      ELP_SPACC_CONFIG_VSPACC_CNT parameter), and this ID is used to=
 identify
> >>> +      which virtual instance this node represents.
> >>
> >> No, IDs are not accepted.
> >
> > PK: This represents the specific virtual SPAcc that is being used in
> > the current configuration. It is used to index into the register banks
> > and the context memories of the virtual SPAcc that is being used. The
> > SPAcc IP can be configured as dedicated virtual SPAccs in
> > heterogeneous environments.
>
> OK. Why registers are not narrowed to only this instance? It feels like
> you provide here full register space for multiple devices and then
> select the bank with above ID.

PK: No, we cant narrow the registers to only this instance since its
is just a single SPAcc with multiple virtual SPAcc instances. The same
set of registers(aka register banks) and context memories are
repeated, but sit at different offset addresses (i*4000 +
register-offsets). The crypto hardware engine inside is shared by all
the virtual SPAccs. This is very much for a heterogeneous computing
scenario.

>
>
> > This was also discssed with Rob Herring and updated from
> > "vpsacc-index" to "vspacc-id" based on Rob's inputs
> > https://lore.kernel.org/linux-crypto/CALxtO0mkmyaDYta0tfx9Q1qi_GY0OwUoF=
DDVmcL15UH_fEZ25w@mail.gmail.com/
>
> Yeah, it is still ID and thus look at his comment about proper
> justification.

PK: Agreed

>
> >
> >>
> >>> +    minimum: 0
> >>> +    maximum: 7
> >>> +
> >>> +  snps,spacc-internal-counter:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: |
> >>> +      Hardware counter that generates an interrupt based on a count =
value.
> >>> +      This counter starts ticking when there is a completed job sitt=
ing on
> >>> +      the status fifo to be serviced. This makes sure that no jobs a=
re
> >>> +      starved of processing.
> >>
> >> Not a DT property.
> >
> > PK: This is a hardware counter which starts ticking when a processed
> > job is sitting on the STAT FIFO. This makes sure a JOB does not stay
> > in STATUS FIFO unprocessed.
> >
> > This was called watchdog timer - wdtimer, which we renamed to
> > "spacc-internal-counter" based on your inputs.
> > https://lore.kernel.org/linux-crypto/CALxtO0k4RkopERap_ykrMTZ4Qtdzm8hEP=
JGLCQ2pknQGjfQ4Eg@mail.gmail.com/
>
> I suggested to use watchdog schema if this device has a watchdog feature.
>
> Why would you configure here different values for the same hardware in
> different boards?

PK: Agreed, it does not make sense to have this here in DT. I am
moving this as a Kconfig option.

>
>
>
> Best regards,
> Krzysztof
