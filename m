Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE54BF9EC
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749214717; cv=none; b=ZGaX9K0wrKl/Iljv6Q+T7X8cf/gfA8qD4faWM9kH5uYcNTj5DVIPfs9l0jhhsWPb28qZn5CG/yN9Eo7MHwoieJeIYAH80kEyIejff/gQc1HEIms6w27075/X9/rR2+7aOcdziNQR874HrJF1cVgo5Ge5Vb9IsH9p3QFO5szA438=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749214717; c=relaxed/simple;
	bh=uha/h2PgevouYEmmRxRudFkJsETHpxRuQukXfnQhRqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GiKbRQUTSToxiTncSV5aFugkif77R+SOL8Rq8+B5V1LwapKkP5qYvAGIwSGsmT+zCHDQGz56pI0UIykTm/ne4Lisnl9Zr9V9fSQ+uj7nMVtZ4kbyr6q0t1TM6EEL/gl3tvDx+WTvQ2s9IDuHkQiEFnntxAI7lNXe8tOGo24UMBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=OaGyYPOp; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="OaGyYPOp"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e81a7d90835so660727276.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 05:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1749214715; x=1749819515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYVM84VoP6sUarPE9u1qb7GqcXhlKnWyP+lB1fAcnnY=;
        b=OaGyYPOpDrckLwTVUDX9k+4Yzdpwrhe3Pek6SVngf+p+PKrnnG0Wx9ZPE7Ux6SAI+Z
         GWLj1BAoOkvbrvlu3m78lUeXinSY+/nX4RkFtIRNISxEBuDfIdijizepEwdboTWx71ah
         Iq1CXtFZEaDpEGYlkBzMtfED2OuEoICromTqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749214715; x=1749819515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYVM84VoP6sUarPE9u1qb7GqcXhlKnWyP+lB1fAcnnY=;
        b=t5sn3mmgoaPEspRFEMcBxnKhLodPv67JbygOSfcnaqCjLSEc0XwRLN6jjENyD4CnI5
         Lmdss4JSkRZ8wPaH15/gwmOkT9zShub0qfdLQCtvSZwJsu9Oa74KyW+DlHeZbwxXkDpm
         y5F/nWdHalmDR3rprPNyu3qkwJgylc6tf/WJS014kk7Hslt6ni9T/VZcDPvwVaM97Gez
         ux0bG0KZaKnrrQgx+3rNv2ERKX5lKCUSvWuSFeGVJDQR9oqjdy6bhGzV3qt34fpzM9Tg
         nGKZIA+kVAQfxKN3LPJjocH+3+CQIpdUM9rhCYhhQ8J33k/k1KLWGOl5AFQMm6TPi5aE
         X3iw==
X-Forwarded-Encrypted: i=1; AJvYcCV/t1lTbz8fOKnfxiVZ/ZJuOdTZ5AkuF+xvTV7B1fHKsLRmWQHRCKTfROniRJqfExg2xHvLASHD3c3jX7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw63AbVZzoAiyUB8nXcOl2vaQdu8yYvQgc9yLCLnE35aoXzkj0Y
	oh7GX4Rue+cM471ZeG2iRmUZ0STrShUSim1yrl+KAXT4qo32rK2Fa+5dSqAzf2fGb7V155yCRRN
	pYKJ5crFt97foaxbVWCBh+K2cGUd5qS+Qgj87I7skNUaqvWz6tQ3lubQ=
X-Gm-Gg: ASbGncuZEJPAeIRuLDe3mUGg0hbrz0ZYnfG1dmoTXYfT/GKcOgBffGYFQ2VxvQ11DHB
	D/M9nDhpkH5eRUc72Mj8pYOUu5UF+btirUU6wipG0XeI3K7m+fwFkHVPVqLig21sm+983gaFSWD
	gPNhhUlXN+Dq7Nb7/DnKKlNma0jw7HXVVqLw==
X-Google-Smtp-Source: AGHT+IERw6EH6isuoOp/tViAHSC9/1iGGlc7AkUNjP83hB+Xm1O+NBUINFmr2cFpvG9nP8zidAzav3pjNmYHuSi1FCw=
X-Received: by 2002:a05:6902:2401:b0:e7d:c87a:6249 with SMTP id
 3f1490d57ef6-e81a21d8096mr4996073276.36.1749214714686; Fri, 06 Jun 2025
 05:58:34 -0700 (PDT)
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
 <e08b2f76-17b1-4411-a428-b2f0f8a7d7fd@kernel.org>
In-Reply-To: <e08b2f76-17b1-4411-a428-b2f0f8a7d7fd@kernel.org>
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Date: Fri, 6 Jun 2025 18:28:23 +0530
X-Gm-Features: AX0GCFsakdzQ7OpRugY0oL9f74JC3JUnvft7ryph7GBminNclioJcgtbl7Z0Pxc
Message-ID: <CALxtO0nReqeGKY+BNCBD10KSGttxxCrFzczxPjfrQM0eXv9Eug@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: crypto: Document support for SPAcc
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, herbert@gondor.apana.org.au, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Ruud.Derwig@synopsys.com, 
	manjunath.hadli@vayavyalabs.com, adityak@vayavyalabs.com, 
	Bhoomika Kadabi <bhoomikak@vayavyalabs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 4:55=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 06/06/2025 13:02, Pavitrakumar Managutte wrote:
> > Hi Krzysztof,
> >   Appreciate your inputs and feedback. My comments are embedded below.
> >
> > Warm regards,
> > PK
> >
> > On Wed, Jun 4, 2025 at 7:37=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 04/06/2025 14:20, Pavitrakumar Managutte wrote:
> >>>>
> >>>>>>> +
> >>>>>>> +  snps,vspacc-id:
> >>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>>>>>> +    description: |
> >>>>>>> +      Virtual SPAcc instance identifier.
> >>>>>>> +      The SPAcc hardware supports multiple virtual instances (de=
termined by
> >>>>>>> +      ELP_SPACC_CONFIG_VSPACC_CNT parameter), and this ID is use=
d to identify
> >>>>>>> +      which virtual instance this node represents.
> >>>>>>
> >>>>>> No, IDs are not accepted.
> >>>>>
> >>>>> PK: This represents the specific virtual SPAcc that is being used i=
n
> >>>>> the current configuration. It is used to index into the register ba=
nks
> >>>>> and the context memories of the virtual SPAcc that is being used. T=
he
> >>>>> SPAcc IP can be configured as dedicated virtual SPAccs in
> >>>>> heterogeneous environments.
> >>>>
> >>>> OK. Why registers are not narrowed to only this instance? It feels l=
ike
> >>>> you provide here full register space for multiple devices and then
> >>>> select the bank with above ID.
> >>>
> >>> PK: No, we cant narrow the registers to only this instance since its
> >>> is just a single SPAcc with multiple virtual SPAcc instances. The sam=
e
> >>> set of registers(aka register banks) and context memories are
> >>> repeated, but sit at different offset addresses (i*4000 +
> >>> register-offsets). The crypto hardware engine inside is shared by all
> >>> the virtual SPAccs. This is very much for a heterogeneous computing
> >>> scenario.
> >>
> >> Then maybe you have one crypto engine? You ask us to guess all of this=
,
> >> also because you do not upstream the DTS for real product. Any
> >> mentioning of "virtual" already raises concerns...
> >
> > PK: Yes this is a single crypto engine, maybe I should have detailed
> > that in the cover letter. I will fix that. And what I have pushed in
>
> So one node, thus no need for this entire virtual device split.

PK: Agreed, its one node for our test case.

>
> > the patch is my complete DTS. It might need updating depending on the
>
> If this is complete, then obviously "snps,vspacc-id" is not necessary.

PK: Yes, its one node, to keep things simple. So we pick a virtual
spacc with its vspacc-id for testing. That way we could test all the
virtual spaccs with a single node, on a need basis.

On the other hand we could create 'n' nodes for 'n' virtual spaccs and
register 'n' vspacc devices with the crypto subsystem. And bind the
individual nodes with unique vspacc-ids. That might depend on the
vendor use case, for which we will add incremental support.

>
>
> Best regards,
> Krzysztof
