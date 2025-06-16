Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6C9136347
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 01:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750038503; cv=none; b=d6mCMY5RY8hBdKBITlxJTKhr23RyVMMFC5mN6hVr1KUh0vKbAlo6tubDW4Wzb+eFTXKt2mnFvTHU7oDLm0fN4OmciZmBYZ2C4HIXdA9Gd0YKYkCvP8m36cEm+iRnulIhsJUCDS88nDx8VYlRwwLDHE/R0x8J6Sk4vsaH8gvSVfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750038503; c=relaxed/simple;
	bh=EOzSlHGrohqg16jZUYXWufW0vuZiNjJeJ11ROGdnH0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tL1lFReiK10Yq6ZY0kyYa5XJlx553d1wh9eEi7KD+EnbogZ/+hT2Uv0P85jNP8wiBIPP3mb8m1YZWk/+7GYFuFAgakNCH/L37gb2vv5W5eSqjFspnmqktoNMfsb/yiOauqUXd3lujYsKRehYkQGyTJFAXqYvHOEx6VjNFB6u2TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=PHMLFk1S; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="PHMLFk1S"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e7d8eb10c06so2841306276.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 18:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1750038501; x=1750643301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOzSlHGrohqg16jZUYXWufW0vuZiNjJeJ11ROGdnH0s=;
        b=PHMLFk1SFrlSDc+FW7PJvqlR1uqPj/vXiOwU6cmdrNVntcHkBakTg1kTbN3JI31xJW
         p8wdASgjeL6IkJwyRYh9/1PMDano2pbkQWbgZD783fbNCQQv9P9Bs2xWTH8zi98Og9FZ
         vy/lalsJLZ5XjgG8LvFiuKUEHzCAUDJH6nBtiYyZiPiHlMq1zw1bMeLUDtbfvApUmiU3
         CoMGo5o1YhYj/J34rIdDgHfuYZEN8gATZ2QNphvbDGpo2fEm+AwK2vndXNjCN0jhClqB
         4++p7McpYhL7LGLt+U5B2KZfMy2qP2EzepawP4ElyqD1aWIhw5mttF/ldM4DsUgceXHc
         uHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750038501; x=1750643301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOzSlHGrohqg16jZUYXWufW0vuZiNjJeJ11ROGdnH0s=;
        b=ijO+n1gHjDYf0XKUJnw8fgCKOuDofjvH54peGiPM3WkeWTBWbUtIsb1mqimji4rOCg
         gs7Z4If62ed7tDJZbGDBeoJ734uQc4q236s/JHbKyH8sVW9WtNGC5KTPP3MGqDy8VH+R
         64aAdtKRwlFI/dR+Gxcl0lZy0kZ/yyYXwWzmsp/ec0P1wZG76Fd9pn/3cJrG124Rnc7l
         bkh/mHye1yOIdCwSovc7XItWrxdXcdkYHCDBXTbUbQtwfwyAcIXSjHzCbYBaFzXB3s1B
         Wh684nLZiCy93LOWv9xnPobPiMcqiyLL03gyOPHk7SMslxQOvKH0yV8F5ojf/tTjddLo
         Z4VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyRonKBiRIdQj9YBe+j8l76rPVnbp0BnRc6+rppgcOkZMEbWCEOxk+inj1H220cdaQk9uw0sKfpYgZSXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFVxW7cJ796sSIP0DOjOGHbyx31w8YYuiQNwMNjLevthXUXha4
	w+KFlOkttiFtP4lFv/xSqQq8RJNYqPpwIqvj1bMOhfhAOY7ljlZgFm72N8lq/0ncHE0C7DjqaRy
	S9yAleQaJiMeKaNXD05keZjeybEwRNk8h/2rvs9KOLZ7unPXBaR7IVyw=
X-Gm-Gg: ASbGncvwCncJXZp8U63rk6iCNsoXRKQcrm2jrMuZE00XgVBgv3xDhuRi5TNtO09U4Le
	6v1AUV1brO++bG2lMk9Rjcp04m9ruimS4Z4X+Qy41rCgUzUiLayvpeZ69OKafoSKmOvyAT0spHV
	t4PT9zOgTAXVpP5GEDX7QR3dkFi4SgGxEPqo0oxctXFh+5bw==
X-Google-Smtp-Source: AGHT+IFalCf8ZLoxrhpSKn9vCQOzYoFcnEfNXOj4LlRmMvOTsepmvXs4hWpCrqsUwKhOi0aW6UpNob7XRbuxVWD8Dgs=
X-Received: by 2002:a05:6902:98e:b0:e7d:b107:d829 with SMTP id
 3f1490d57ef6-e822acac597mr10474564276.34.1750038501428; Sun, 15 Jun 2025
 18:48:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611031023.28769-1-nick.hu@sifive.com> <20250611031023.28769-2-nick.hu@sifive.com>
 <9c429671-8409-4911-8559-73a069d66964@kernel.org> <CAKddAkAyvRdAz9X_rCGgfdxD0Z_Q7sAt8e5nuJe7=s7G-Y3+AQ@mail.gmail.com>
 <19dd3d16-aadd-469c-a090-238baba14d4e@kernel.org>
In-Reply-To: <19dd3d16-aadd-469c-a090-238baba14d4e@kernel.org>
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 16 Jun 2025 09:48:10 +0800
X-Gm-Features: AX0GCFuk6UQINAiWg9qRWYn3jgDichbt9fCZYVL_UNVZi-NYRKmQpcuss8-kLqU
Message-ID: <CAKddAkB=yeLCh3oVFeot45nTr3d0tZjfiV+YmWR-DWFb8w+=jg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: power: Add SiFive Domain Management controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, Cyan Yang <cyan.yang@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 3:20=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/06/2025 09:15, Nick Hu wrote:
> > On Wed, Jun 11, 2025 at 2:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 11/06/2025 05:10, Nick Hu wrote:
> >>> SiFive Domain Management controller includes the following components
> >>> - SiFive Tile Management Controller
> >>> - SiFive Cluster Management Controller
> >>> - SiFive Core Complex Management Controller
> >>>
> >>> These controllers control the clock and power domain of the
> >>> corresponding domain.
> >>>
> >>> However, Since we don't have a SoC specific compatible string yet, so
> >>> add '- {}' for the first entry [1][2].
> >>
> >>
> >> But you must have Soc specific compatible strings. See previous discus=
sion.
> >>
> > Maybe I'm missing something, but since we don't have a SoC-specific com=
patible
> > string yet, I thought we agreed to include a `- {}` as the first
> > entry, along with an
> > explanation in both the commit message and comments [1].
> But your commit msg does not explain. You need to explain why you do not
> have SoC specific compatibles. Saying "I do not have a SoC specific
> compatible" is not an argument explaining why you do not have SoC
> specific compatible.
>
You're right. How about updating the commit msg to "When the SoCs are
ready, we will add the SoC compatible string at that time" ?

Best regards,
Nick
