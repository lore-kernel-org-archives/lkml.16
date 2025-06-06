Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C883B17E4
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 11:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749207767; cv=none; b=Vff/UQkH0Xn3J11rKhJgVrtdpOu1S0dXdELYdzVLpKSdUV3PhhTyPuANPjSJ3xIZTwi5Dd/pjwVUGKU047JXcA2hrqv+faC74KoAcTcRobC8mcWJ0O2fPBBPYRD5vJyUPwOx8NwDUcaSFgA3vLUmeHYu7S6Aed39Lq8ez7rGuJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749207767; c=relaxed/simple;
	bh=sozKJ1pwU9KulGgyEdYs/zM27kuoxVEnTkT5+Zsz6DA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dw0X7qT1yRjQq/Uoh5swV9oWjDi4B0y8iImAQqGwJrNaFTd1CGEFPlXm6YXjtYi9BCI4I4dgCjOGAdJybFmdV9qT/rhsteTSeKBWHmcCKA62uKoms0dHdU2VV8QAaomixrjVn08+IokKG14bSaxwMbt+NJZ+BrsafRFYGqhTddo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=bgLhgynR; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="bgLhgynR"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e7387d4a336so1911676276.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 04:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1749207763; x=1749812563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahRtYL+8yDFcivQALpBf2mOu61lf53lXLD7NaXvC65s=;
        b=bgLhgynRYJXCbIemWLbGKSD0JM+LwkgiES6QeIwuoM8N659Q4sWIZMPLOsMlaA/9/U
         enBFcl0aFNzt31BPfVMt01cuNZdThraBCOfVipYOruONQ4fryUetYvet/H7ZrPoMPbiU
         diMeAPTrxOpTW6g5xLXp64KAfB2+iiy2/+IPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749207763; x=1749812563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahRtYL+8yDFcivQALpBf2mOu61lf53lXLD7NaXvC65s=;
        b=Ii2u9oh5LLcVV+b6soF3kqDh7QNVwab0dPb6RHPpJm2xZehxrjg6tCYnRVpjVy1SSP
         2/33GJi+tUw3Xz467ZIfhSYdXliH4wa/zRwhLCO6g2SwjC++f9g+JjfWk6B9Ly+1eZ0z
         Vkg7LeH+Gkz8mrtz5h8YDIGNUoDapcRx8fuVso/b/cQ2GV/jcz6a+jZ/J6YDig/2fwOw
         VDhQx9bB1tJVk8mI66RtKz/yGcnFXBPhuCYKU5crNq8tk8NXzyyoOS4YITxKfElbblPJ
         r+8dZDLFU4RivF5HQzlLgiliWUL8ejANVodPKUfPA5ZC0hZLTcdbVIRqT8hILU2ufqFm
         MxlA==
X-Forwarded-Encrypted: i=1; AJvYcCWyT8s9VdOG1wbkYDvt8AoOTKeYJNPbkSVk+ve2iKX4qLCp0X0icW+E7IdyRmKojAMRW/5LnROkF7tfZZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxARwRyLMCEm/DDtH+ciotNxc9Tpzv0aHjk2+QsNuzNckdXd9i7
	Lufvp8YoPMpUCTVO42O5BFCDsXLXjHfwHuXA6zoyscyMFvRbOvRMdPLNBwQdr8bNBiX6M/qBzZC
	R6P41pqHtPmwN2XMys2793I+akG1KN/762mUp7dQTyw==
X-Gm-Gg: ASbGncu7HykxWUPVPTq9eDwfPQHw1hgYP5LWshWAfwcBKPx3185vP3s11wQ38X4Ksps
	SKaE/voJ39qlm1FRvq0AdsAP68Qhy+vrxiHqyOKLumhfd4tqPmoUH+EFE3AkuapY1Aj5+02+Rfv
	VCvxXDo7nQwnHjRd0QCv9EsGdNJ+7OBrX75g==
X-Google-Smtp-Source: AGHT+IGPzGcL995Ml8WGyM8F6pt8IT4FINGEryh/hRSPtX851l83sDh2GRSHk3nE//BpH0WioFvDwKZiue7AzRpCHR4=
X-Received: by 2002:a05:6902:18c7:b0:e7d:ca03:4474 with SMTP id
 3f1490d57ef6-e81a21c56b0mr4251268276.36.1749207763644; Fri, 06 Jun 2025
 04:02:43 -0700 (PDT)
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
 <cd6e92af-1304-4078-9ed7-de1cb53c66da@kernel.org>
In-Reply-To: <cd6e92af-1304-4078-9ed7-de1cb53c66da@kernel.org>
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Date: Fri, 6 Jun 2025 16:32:32 +0530
X-Gm-Features: AX0GCFsCPqpKREAd4CvP0DqZO_E5hMC88EBV6qNiDOowkNyZIs0O6qWj-K7X0KI
Message-ID: <CALxtO0mVMTWqidSv7LQSQd-rA_TmJy_0xgBSd=mP27kg=AXQRg@mail.gmail.com>
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
  Appreciate your inputs and feedback. My comments are embedded below.

Warm regards,
PK

On Wed, Jun 4, 2025 at 7:37=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 04/06/2025 14:20, Pavitrakumar Managutte wrote:
> >>
> >>>>> +
> >>>>> +  snps,vspacc-id:
> >>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>>>> +    description: |
> >>>>> +      Virtual SPAcc instance identifier.
> >>>>> +      The SPAcc hardware supports multiple virtual instances (dete=
rmined by
> >>>>> +      ELP_SPACC_CONFIG_VSPACC_CNT parameter), and this ID is used =
to identify
> >>>>> +      which virtual instance this node represents.
> >>>>
> >>>> No, IDs are not accepted.
> >>>
> >>> PK: This represents the specific virtual SPAcc that is being used in
> >>> the current configuration. It is used to index into the register bank=
s
> >>> and the context memories of the virtual SPAcc that is being used. The
> >>> SPAcc IP can be configured as dedicated virtual SPAccs in
> >>> heterogeneous environments.
> >>
> >> OK. Why registers are not narrowed to only this instance? It feels lik=
e
> >> you provide here full register space for multiple devices and then
> >> select the bank with above ID.
> >
> > PK: No, we cant narrow the registers to only this instance since its
> > is just a single SPAcc with multiple virtual SPAcc instances. The same
> > set of registers(aka register banks) and context memories are
> > repeated, but sit at different offset addresses (i*4000 +
> > register-offsets). The crypto hardware engine inside is shared by all
> > the virtual SPAccs. This is very much for a heterogeneous computing
> > scenario.
>
> Then maybe you have one crypto engine? You ask us to guess all of this,
> also because you do not upstream the DTS for real product. Any
> mentioning of "virtual" already raises concerns...

PK: Yes this is a single crypto engine, maybe I should have detailed
that in the cover letter. I will fix that. And what I have pushed in
the patch is my complete DTS. It might need updating depending on the
vendor use case, which we are committed to support and maintain here.

>
> Best regards,
> Krzysztof
