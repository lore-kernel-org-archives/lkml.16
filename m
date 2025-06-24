Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A583C259CA5
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750751391; cv=none; b=KTbDo0qtSbf/nqykjl0dK+1SkfYHgQhh9sIzH5RBjILipD7KECikalU7+B3jjeDcLS3qfiYOw01PsKUAT58pDN07xRWoQ7e9Fhl6wWk5kS5RzKAzB7MPn1ZcSjHbGYt5m2H2tPRfPNFpK7/l5eo1sfmsOAkmCMzzZefirWuIPc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750751391; c=relaxed/simple;
	bh=4xp2xPZJDUDY92X1KIl/IiLpG/PQaUTTvnUq4UFdyEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FvUhLJ1GiC5SR7rc97cIsd/VZf7Y2cFXZYBUMjiZ7eTAB7D3aiOyPLwuEjLa2I+IArYrLLDfpdx7hgLYd+LUcq8UVMMa79EYblx5iQTUGBoSK3lm0FuicCoX2HYGAPQ9KoPavQwH+zyoFCUdhJAA87AbpZ6n6xzOoC7TuXEf9O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=Cm0w5dW9; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="Cm0w5dW9"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e819aa98e7aso120528276.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1750751388; x=1751356188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2GgMgmkIgP4lsnQEgW9b05jhOBEpY0FKkTliFZZAZY=;
        b=Cm0w5dW9hfdydwMGSpxd64uT1g/bXw+bKlOMqkCgD3s6/idU+t41baNPVPjUGOomh2
         5APYHmjUYMvblqw4l2KBVa7e5V9qD1WyTgfYakc5BSHL0WInn/m2O5Ds5+t212PD8+Dd
         PVWLUqyfmJ38y85BVw9lrObN+A120KgLN1abI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750751388; x=1751356188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2GgMgmkIgP4lsnQEgW9b05jhOBEpY0FKkTliFZZAZY=;
        b=g79Wwp0lcvEIAXOkyhgWthoWKb0thsq+X+SLWF2Dqr1PiWUhqQatyc48lK4CV5U6qk
         TWjy/TP/d2wuzw91UJLWTpZlWL5Y+ZdCtV8DBPkufSZaua+6Trwz5r3gQgHuz3onDCxy
         Pm/PcwShQMR0KoFakr8zKYkwsuiGa2kBj3ucnKg5fqs21igpKiypGCwe5kYyNgcDmMma
         1tjbjjjJafTx6V/ld7YRsg5dpnpzme0R/UqozExKADtQYSzcDa3P8zCJP0JyyS0bf2KS
         E9mPrf6u1hJ63ilSMn98AHBFHQ+heBkkJy0k+IqGZFezaHffcbrwmHz4TksSBaflafXd
         4szQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMMz/lAvp1XYJ9SNX2Ryi2lCjLb5GA47A7iZXlHzdwCH8GBarESm3qMNZdhV1k5IKV+LPbcS7+5tAGXz4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl7Gj4LPuxLu7lY7wWQgnx2NtqLarfViK/v8ot8ONF4hdhRWSL
	xFC3qsShDgSEa109fChn0vQjnEtMiANvEibSKCS2tPs1r4cmO6lANZR7w+hgJtnSHdFcX2iqOGQ
	RqPwm+Z76jj6S8kkvgP6iHFw1mubg26axE1IIrl4bznRtvMMZcQRJSVY=
X-Gm-Gg: ASbGnctutHdDW4q1Ml/Q1PGdmV07Fak/uVMoN+DhSvMycWmXvJsM4cpmMXGSyvxqU4H
	+KSNetT1rx4TFN+Io7ZzYEYfHKoi59DJq/MQZOUYP0zhiRxWd/XEAXiVeNZUIxn3fb3+UMmZbqa
	JY3RqcvEYvvKJzrKGHwRVcyIvNN1nUl79kHmNqYSAlqT8=
X-Google-Smtp-Source: AGHT+IHv2WVZ5dtrz0QnXvOVMUjZgn0BsemAVul3jgQVDjh7OOHw30oiyOpFvnzhvWJNYzcwCTPLBstNxqzXGoDdbJo=
X-Received: by 2002:a05:6902:108e:b0:e85:ed6b:4981 with SMTP id
 3f1490d57ef6-e85ed6b4a78mr4950966276.23.1750751388575; Tue, 24 Jun 2025
 00:49:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602053231.403143-1-pavitrakumarm@vayavyalabs.com>
 <20250602053231.403143-2-pavitrakumarm@vayavyalabs.com> <fae97f84-bdb9-42de-b292-92d2b262f16a@kernel.org>
 <CALxtO0mpQtqPB0h_Wff2dLGo=Mxk02JJQkK4rn+=TuScNdSfxQ@mail.gmail.com>
 <3570be5b-cb20-4259-9a9b-959098b902d0@kernel.org> <CALxtO0mH=GwhQxQBsmMQYd+qgAue9WxXN1XWo9BncVJvJk6d8A@mail.gmail.com>
 <cd6e92af-1304-4078-9ed7-de1cb53c66da@kernel.org> <CALxtO0mVMTWqidSv7LQSQd-rA_TmJy_0xgBSd=mP27kg=AXQRg@mail.gmail.com>
 <e08b2f76-17b1-4411-a428-b2f0f8a7d7fd@kernel.org> <CALxtO0nReqeGKY+BNCBD10KSGttxxCrFzczxPjfrQM0eXv9Eug@mail.gmail.com>
 <b207cba7-47d3-43f4-8d59-38df9ec4eec2@kernel.org>
In-Reply-To: <b207cba7-47d3-43f4-8d59-38df9ec4eec2@kernel.org>
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Date: Tue, 24 Jun 2025 13:19:37 +0530
X-Gm-Features: Ac12FXx9KD4UOHhj75qGAiuyDem7sV7v10kA6Mwb459PbL5ZJU-1N8SzFZSnTsI
Message-ID: <CALxtO0k3_ib2G-4pL0h5HxHUXgJ=ArNY6eaThEzdsPiYPauDWw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: crypto: Document support for SPAcc
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, herbert@gondor.apana.org.au, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Ruud.Derwig@synopsys.com, 
	manjunath.hadli@vayavyalabs.com, adityak@vayavyalabs.com, 
	Bhoomika Kadabi <bhoomikak@vayavyalabs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,
   My comments are embedded below, appreciate your inputs.

Warm regards,
PK

On Fri, Jun 6, 2025 at 6:34=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 06/06/2025 14:58, Pavitrakumar Managutte wrote:
> > On Fri, Jun 6, 2025 at 4:55=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 06/06/2025 13:02, Pavitrakumar Managutte wrote:
> >>> Hi Krzysztof,
> >>>   Appreciate your inputs and feedback. My comments are embedded below=
.
> >>>
> >>> Warm regards,
> >>> PK
> >>>
> >>> On Wed, Jun 4, 2025 at 7:37=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>>>
> >>>> On 04/06/2025 14:20, Pavitrakumar Managutte wrote:
> >>>>>>
> >>>>>>>>> +
> >>>>>>>>> +  snps,vspacc-id:
> >>>>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>>>>>>>> +    description: |
> >>>>>>>>> +      Virtual SPAcc instance identifier.
> >>>>>>>>> +      The SPAcc hardware supports multiple virtual instances (=
determined by
> >>>>>>>>> +      ELP_SPACC_CONFIG_VSPACC_CNT parameter), and this ID is u=
sed to identify
> >>>>>>>>> +      which virtual instance this node represents.
> >>>>>>>>
> >>>>>>>> No, IDs are not accepted.
> >>>>>>>
> >>>>>>> PK: This represents the specific virtual SPAcc that is being used=
 in
> >>>>>>> the current configuration. It is used to index into the register =
banks
> >>>>>>> and the context memories of the virtual SPAcc that is being used.=
 The
> >>>>>>> SPAcc IP can be configured as dedicated virtual SPAccs in
> >>>>>>> heterogeneous environments.
> >>>>>>
> >>>>>> OK. Why registers are not narrowed to only this instance? It feels=
 like
> >>>>>> you provide here full register space for multiple devices and then
> >>>>>> select the bank with above ID.
> >>>>>
> >>>>> PK: No, we cant narrow the registers to only this instance since it=
s
> >>>>> is just a single SPAcc with multiple virtual SPAcc instances. The s=
ame
> >>>>> set of registers(aka register banks) and context memories are
> >>>>> repeated, but sit at different offset addresses (i*4000 +
> >>>>> register-offsets). The crypto hardware engine inside is shared by a=
ll
> >>>>> the virtual SPAccs. This is very much for a heterogeneous computing
> >>>>> scenario.
> >>>>
> >>>> Then maybe you have one crypto engine? You ask us to guess all of th=
is,
> >>>> also because you do not upstream the DTS for real product. Any
> >>>> mentioning of "virtual" already raises concerns...
> >>>
> >>> PK: Yes this is a single crypto engine, maybe I should have detailed
> >>> that in the cover letter. I will fix that. And what I have pushed in
> >>
> >> So one node, thus no need for this entire virtual device split.
> >
> > PK: Agreed, its one node for our test case.
>
>
> We do not talk about test case. We talk about this device.
PK: Sure
> >
> >>
> >>> the patch is my complete DTS. It might need updating depending on the
> >>
> >> If this is complete, then obviously "snps,vspacc-id" is not necessary.
> >
> > PK: Yes, its one node, to keep things simple. So we pick a virtual
> > spacc with its vspacc-id for testing. That way we could test all the
> > virtual spaccs with a single node, on a need basis.
> >
> > On the other hand we could create 'n' nodes for 'n' virtual spaccs and
>
> You said it is complete, now you said you have 'n' more.

PK: I think the mistake from my side was to create 'n' nodes with the
same base addresses and different Virtual IDs, and misinterpret your
earlier guidance on this. Instead every "virtual" SPAcc instance can
be represented with its own DT node, since its base address and IRQ
numbers are unique. The "virtual" refers to a hardware feature in the
SPAcc. Each virtual SPAcc, configured at hardware design-time, has its
own control registers, IRQ numbers and contexts, only the crypto
hardware is shared.

>
> > register 'n' vspacc devices with the crypto subsystem. And bind the
> > individual nodes with unique vspacc-ids. That might depend on the
>
> I don't understand what is "binding" here. Use Linux or DT terminology.

PK: My bad, I will take care of that.

>
> > vendor use case, for which we will add incremental support.
>
> You did not get the point but you keep saying "yes". This discussion is
> getting meaningless and you really do not want to listen. You have
> either incomplete picture here or you have only one node. In both cases
> virtual ID is not necessary. If you claim virtual ID is necessary, I
> claim you have here incomplete picture and you are trying to represent
> one device in multiple nodes. No.
>
> Typically one device, one node.
>
> NOT one device and 10 virtual nodes representing virtual devices.

PK: Thanks, I believe I finally understand your point.

>
> Amount of ping pongs here is way beyond my patience, so before you
> respond read that carefully and come with full and accurate hardware
> description, so we will not have to ping pong trying to get any sort of
> details.
>
> Best regards,
> Krzysztof
