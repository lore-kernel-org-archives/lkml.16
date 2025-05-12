Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B5E12E5D
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 03:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747020544; cv=none; b=O0/gzajUcZUQF41yWlxZJ4QiV08X+pQbYqJn+Si5ic2i8PQbvqpxUnigz+Z4qWiQWs+nw+2oXcfHTPZQ/MXPIX7DGDfN4ItYr8ZDTyVhEOOTlP/3KzrrLFXuW5p68ZxoVd4syz6aH3/jGDHNNLQwuRlfRbEV4ao+5spuMdt2WRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747020544; c=relaxed/simple;
	bh=mY8R9inhJBfVS60tJs9PKJkwD3X+3bhVO6wtxbHX/Xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ddw7QlGaT+kwTOE9oyttHvjP5jmIgRF9q/kpgPeIqi+1OHem+UeI/ZU9TiKIgqH6LkkFR46zLAn159pYEeQkmT6SSSd0RVB0Moc/3ahWiFfUMqCH6ag+QSnpXZP+S/TN4J4clI0JKydANmtW1y45S34985WcwBw6E9W0d4sjHMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=GMfnHiCP; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="GMfnHiCP"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e6df1419f94so3145715276.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 20:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747020542; x=1747625342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmqsshPmY7H9QOb+mn4lTusa/z2qhgLdDUm/2L4LcwE=;
        b=GMfnHiCPJ7KpHaVf7F+4WFZPYWlo53Pa+cYcAQg4I+BFxuEY+QsxmmScG3slxqb+6f
         Dq3CwaqcgeVKJirverVwTsXo2MB+dr10Ig6s57KDbqFp5LZCDnZ8TskbA5oEIG18duQX
         h1pUIhRVcMlQPRIZ7oepHcEVOnJCQftEowXtKcxkJifQc28CYMUkbTWtlzIMKj7F7VvX
         zGCoMj58Jasr3LNR5n5PdtGT2qYbLGG2vO/2AeTvA+bC8FCvMrNKsqAGk812Oxu7hLTI
         AWj9FylTYSQzR3UIf0hDYubwWrdPLNxkeO54pQsCok5nhF/noOY3Yktnu61S36+2PbYR
         xknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747020542; x=1747625342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmqsshPmY7H9QOb+mn4lTusa/z2qhgLdDUm/2L4LcwE=;
        b=L4Bin3OtjALNj8R2YAtWhdM2GS7afuclsh+Zj24QDWcY74EPzL8zFVETczU8Zx6Xgt
         yw7GSrLdggaoQHB+Vlv15SlVK+uSNAlnervTG7OD0R1zmSnQCHecaMWlGv5/JwmExv0h
         3usIEEAtRJUUaW8fO+I1J8oJxNOSANL2T6vqrzHEgmfhGI5MoCDMsTcBK/Ebs3hofcjo
         rALdZ3EL2vJknIeuIgAu+/8Hc/xcHjh7SKaDM58rmk2PCaTnXpWkMYg57JBsTvIhkym9
         /e2ua7TuskxC4nozNZ9KG05n0w7ah1iYasUAE1CkP/PnA2VLA8qMpbK12cZ8myb5ZOjN
         TVtA==
X-Forwarded-Encrypted: i=1; AJvYcCUXIfHP1kqrb2/6fu3eHVA8t6GLV/2yn6dFc+k/CS9TeIjUESsWDOCZWVcA/BhCOEgEwaVAj4y40YP9RXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzGXFfEsl4rMnueYeN2NnBA1UgNpYQiAN4V91cQMgUNZ28b2RE
	6h9Ao1XAS/w6popOfqQ1cG80m4TZHYF8Lbhiam4R6Z5ZFksWMJX+Zqis7aGH+wcB6mFtc8nbbZU
	G0gMUydmCObjqIp5WbYLyA8Oe+DjYdu6IAe9YjQ==
X-Gm-Gg: ASbGncuv7pWK3PbL8/c0NdrGvBkG7E2gDdjnyX3sdxbPZtnd39r747sD72cf2czX/wJ
	US7op9t4AkuruWQ0dxEbMdkrqjV8xowatkFc1BaO54QcmvaGSAmb6Of+JnYgRdJQsGMJ/gcP2hS
	nBAT2Bm+E+RZVN6aHQluIplovk10AR2gFwTNM=
X-Google-Smtp-Source: AGHT+IEFaNiH4m8SfL7s95SR1yaroida1cIZ6e04N6YGot2PHwDpN08d57NAQJEqGB4qgW357SQelDenklQ6NVilKz4=
X-Received: by 2002:a05:6902:e02:b0:e73:2da2:c300 with SMTP id
 3f1490d57ef6-e78fdda3cecmr15370879276.44.1747020542325; Sun, 11 May 2025
 20:29:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509021605.26764-1-nick.hu@sifive.com> <20250509-small-graceful-limpet-d0ea41@kuoka>
 <20250509-subtract-caramel-08d47ed3281c@spud> <c91d99c9-0ecb-4dcd-9beb-5a1e9fadc619@kernel.org>
In-Reply-To: <c91d99c9-0ecb-4dcd-9beb-5a1e9fadc619@kernel.org>
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 12 May 2025 11:28:51 +0800
X-Gm-Features: AX0GCFu8apu7KqsRMVT6pTWyP_dDY5ZSOdIicXfNhfDZ3ehPXy6u4YhVzFdti1c
Message-ID: <CAKddAkDvJcXoAtgvgVBhMOY-NUwdkjUODytGqXeZgfybPRmbfA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: power: Add SiFive Domain Management controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Cyan Yang <cyan.yang@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 10, 2025 at 10:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 09/05/2025 17:57, Conor Dooley wrote:
> >>> +          - pattern: "^sifive,[ts]mc1$"
> >>> +      - items:
> >>> +          - {}
> >>> +          - const: sifive,cmc3
> >>> +          - const: sifive,cmc2
> >>> +      - items:
> >>> +          - {}
> >>> +          - const: sifive,cmc2
> >>
> >> All of this is just unexpected. Why any compatible should come with
> >> these?
> >
> > It's also not quite correct either, right? Or may not be correct at
> > least. It permits "xxx", "tmc2", "smc1" and "xxx", "smc2", "tmc1"
> > which mean that the smc and tmc must be identical in terms of
> > programming model.
>
> Yep
>
> >
> >> You need to use SoC specific compatibles.
> >
> > I think there's some slack to provide here, sifive are upstreaming it i=
n
> > advance of there being customers (or customers ready to upstream) and t=
his
> > format allows us to accept bindings/drivers and the customer will have
> > to add a soc-specific compatible in order to actually use these in a
> > dts. I think it's better to accept something along these lines than
>
> Sure, commit msg should explain that and probably these {} wildcards
> should have comment as well.
>
I'll update it in the next version. Thanks.

> > stall out until a customer decides to upstream their user. That said, I
> > would expect this to come (as you mentioned above) with the driver.
> >
>
> Best regards,
> Krzysztof
