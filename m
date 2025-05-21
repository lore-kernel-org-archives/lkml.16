Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3FB139B;
	Wed, 21 May 2025 14:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836276; cv=none; b=Uzxt/uTz/nzXZ5qLJ0K+aBAG5Q3LS8ZExn+hendpbJ9aCfcVuAbOLnSkw+vbAhm2AjA1X5Irej78yKPg8lUsG8QpZZIDx0jGpKTyyzsk6Z2OMMNhChshwKOKP87mXYmTPUATxjsbtzGmqtRbi3nMTvo40yqq+S1e7n15aA5Zx+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836276; c=relaxed/simple;
	bh=xnA+wwMbOQ7MC6W8afuzy4z9/c0vOHbk1GRUJbtdhSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1Ywh/rm+w+qg96s3QzDa0faJ6BbNsTNdH03yMw9ds4SdGHuCwjNNEKzzfTYvrCXvOaecIkc7MWwWarv79HAeEdq/BD9Sa5CIb1S6QSw0pCjxaMLi8ODXB2ctqb/3Fouggha6OxirLKUb7Ax40jtiG25zPg+7zUdMZ2RbFEctq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMM+3a5m; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMM+3a5m"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4766631a6a4so70239961cf.2;
        Wed, 21 May 2025 07:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747836273; x=1748441073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnMSEARNlVgPRWKeN5p+uHnOxtjldaYnJP4wZN+8kzk=;
        b=AMM+3a5mAvbcbiSg/zRkAndjiUbuOlo0PBysGDm1l0v+/KTC437LiztUahindqSuvn
         9FU0mP2KXAI8K5LMlm/bvzUk5nA6Jht14RpMBfX8NYQRyQ4y9MDPneDWPFz0vYEnqncE
         xNG/fZx9TyKGj7C+v80vRW23kTWVTikMNpI3ZNlt5wmzUQ7sbdPac7knvO2Sc4OcvpO5
         O48YZGkTQDfWpemYzl3xwHnWe9ky0vxqV5Lmgm9jxoXHKY8rbXoU6l5sP1YcWweBGS1N
         so1D2L0GfokCtNiqlauIElclzEQ1Np1xypgELyDknbxxSZT+sE4eAw2+GhWls99DUJjs
         Gv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836273; x=1748441073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnMSEARNlVgPRWKeN5p+uHnOxtjldaYnJP4wZN+8kzk=;
        b=uwrK7lUBATJvp9XAn9bMhJTOMI/0WrOCqiTwNGBblATyrULEkGEkwBXBUPUERADG9c
         NdM3YX2Z5QagV+ZfAfY5XxTRvtJyQQXKYJNeP+6HO378Gu1IkIJCe+QtJhtPHGg/u8kn
         Up1d/Pc8rW9fndORaV+Jt6f0PHhkY8zOfJIIYY6+7xh45BXQ0D0lxV9w+a6QqAkTK8bO
         f2NJnB4kviUgzp2IQ0Ph69gE1h7jBEb9gDntPxOJ4at+y6JW7m5Hfu1voqZG67KFob4j
         uazHNYd1KUr6LZ29vRGmIht8BPuDQzySw9+fbqpLL1xCn7sw33+Nw/xH1+j1QzJNSCZ7
         +lYA==
X-Forwarded-Encrypted: i=1; AJvYcCUdOoNav7LtqWnAds96JreeKYlldtSLlPoMJKY0sQdSDrN/6vgJv3y9/dm2N/Tq6R0jpvBos3csSlts@vger.kernel.org, AJvYcCWb1Dk4I8D86EbUmCbSYdelaHr/nl813+JPCblenRxQ1ZNeKxJwaokbeN8QViA67EUpU1sc3e2frYDH9kHR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcw9nECvCh+GMpboBWo4YVjwJB5mKaHBjdyfdHBXQ9VSk+fCn9
	ICwfWAh7peygZeBK8TE1iXvsvIGFizPhmwZG1Lt6U6qDeJB6OteJIYA8HRhq0sOjcv3llF8lPiU
	cmUN9jTT9YZHdEdm9MzdS70+dR4g8e1j3sEmmQF8=
X-Gm-Gg: ASbGncvHYPFFAiuaSlU/Vuq9tePeWKU8Ss9+RC4dOy6Q8pDhYsHgyoW1xVXMlOEMFj0
	+OocInT8PuSwVXBwSQVk+BCeI4IIjXI6J43eu9DDj3JjueIg4pXYyi4f2mq2Yaf9SB9mxLIsoaP
	LNOp26vslN1T27qyXwij1JBe9fYJevK2RoZZlOOEESbspageTppbdTx0e+S7XNanLv/g==
X-Google-Smtp-Source: AGHT+IG5fKyWSQijXdok293wDNISKRz4c0c0mL1AgaXBBaBchJGfRjQeSJYGuKTki4pnTMQy9k4rmKwSVvXk0HgISaU=
X-Received: by 2002:a05:622a:5589:b0:476:8288:9558 with SMTP id
 d75a77b69052e-494ae434787mr345964801cf.46.1747836273231; Wed, 21 May 2025
 07:04:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
 <CABjd4YwoVRpJEMss8UN6xT9x4hf6GSjm34GtTHmmnHi8Q42DAQ@mail.gmail.com> <c33a23c6-9883-4f3e-b2e3-6442ca90a7b8@kernel.org>
In-Reply-To: <c33a23c6-9883-4f3e-b2e3-6442ca90a7b8@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 18:04:30 +0400
X-Gm-Features: AX0GCFt4BEGM6IPuCHg8AhY1gdu5ORHuOAa78BDG1xqhEo7D1jh3oHrYQqoxZ6w
Message-ID: <CABjd4YwGM0=k4Jk07O=Z7oAzk2DNLP8HHmGR8QbWJOiMVuxLUQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ARM: dts: vt8500: Minor fixups and L2 cache on WM8850
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 5:32=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 21/05/2025 15:28, Alexey Charkov wrote:
> > On Thu, May 15, 2025 at 11:39=E2=80=AFPM Alexey Charkov <alchark@gmail.=
com> wrote:
> >>
> >> Small fixups for VT8500 related device trees to improve correctness in
> >> light of current guidelines.
> >>
> >> While at that, also include a DT node for the PL310 cache controller
> >> present in WM8850/WM8950.
> >>
> >> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> >> ---
> >> Alexey Charkov (5):
> >>       ARM: dts: vt8500: Add node address and reg in CPU nodes
> >>       ARM: dts: vt8500: Move memory nodes to board dts and fix addr/si=
ze
> >>       ARM: dts: vt8500: Use generic node name for the SD/MMC controlle=
r
> >>       ARM: dts: vt8500: Fix the unit address of the VT8500 LCD control=
ler
> >>       ARM: dts: vt8500: Add L2 cache controller on WM8850/WM8950
> >
> > Krzysztof, could you please pick these up for 6.16?
>
> No, we are at RC7. I closed my tree two weeks ago and sent pull requests
> already way too late - a week ago.

Got it, thank you. Note taken on the expected cut-off time.

Best regards,
Alexey
