Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172ED23BCE2
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 15:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748965032; cv=none; b=k1qSNR8JSVF4AmTM/Z232Vvt+kFnQj7cucW82QWDlaEgptA8E7JTzxvEu/7YDWzYe/t5AT36OAkVix/H0U6KnA3blfKBfuitseOVGY+RkPgMauvZmYs5gw1CyBWSqEI5xGwhx9qabTUId46z25JtWcZcs66QkzPl4vHNy/1CzjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748965032; c=relaxed/simple;
	bh=N+pMCHYIBKQlPeyxJ/f+uTZ5/U92w6mRcGd7hTstQlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fz5tn23dI+K+AuL7zJzqG2zBPLfwu7p+cEsboa6Md4muKkLvqgP+gFf2YDJARAgap72A77wBKuUZKL8/LQejo9DNsEd8U9IUwV3pk8M3BIPBr4g/KfVsJXDlSNOGKj00wGsDHh+/SVRvhXWMGNFIdfR9tEuBILwtEA9ETEY4RYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YtVJbX01; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YtVJbX01"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70e3e0415a7so54062237b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 08:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748965030; x=1749569830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+pMCHYIBKQlPeyxJ/f+uTZ5/U92w6mRcGd7hTstQlk=;
        b=YtVJbX01KgM0uu9Btn7EipBFatiROVjnd9vAKG3DMCXw+AgoFmEBEI08+6KoPXMU9q
         5GI9J1n3Rl3XVbGM+7FQJACA2dmuledvEkw40jWnm/sgVwr8pkxODyA8wK7u0qrieUTV
         Vj2nNW2212S3ugXObFwX6TVMlmZgdRHDA9smAWuemdUaIktZ+tpZ9Mm650qzOziVY6pp
         evHWAkyEWYhAHbUp3SbVYISamVoNbRJuux0+zs8Oe2HmOutw5au4wsow42rkknf19DNe
         dqXnfpgaGF5K3MNd0qIfii5N2lqhkTKN6+dvLCFjR1/hmd5OvQf6ibx7QTJXFfHCclWX
         vreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748965030; x=1749569830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+pMCHYIBKQlPeyxJ/f+uTZ5/U92w6mRcGd7hTstQlk=;
        b=O5W9KUr6obhJ/2rxKaWWho19NQKRxETWBaCQx9WlWBPauCOt7rsxLTHl6RN2Rhw1VV
         FDbEvoQidOLybIHG1oFfrXcr0yhRNmjUN5hU3L5YmGT6g3bOFW91NGfmvHemXv3M5BgZ
         l2pxyP8NmeO7IDHIJLKJKEDPaxDTHYvUS47na6bUZMme2njkiqytysTg+7LV/3ub6CRQ
         ct/XWC1FtnS3Me/5KlO+UFe6TOPnLqYAXj3XP5NM8TkIDMzzqBt06gt+VbW9pHlxkyfD
         NN+S8cOo+NFADpzHQ0gFNmJlj1J8pKJ01fzlbB1GXCjezLWa54KvUg2C0UDEdy7oB1oB
         b24Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYyWEhAWO3RhBzQb03RFiKk/R9C9IwBzK2kLcwwNOto6c9wxER5sNLIggAuAbO9vGJ0ox+IzuDMcnfK0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuiPp6SQrG+iRXPTjC8gZMRTdC25Z3PQlC/YYYr/rDQY4hfXIF
	2Oe2+thFT6X2WCLPAQHVmYYkCHa/3TLucxWbuyGM0+eP60wdKKXEc3ZW+OoF0tVHBkB9bVKLVDu
	nzB/i6bmdihF3SCXpb117q28w2/kIgtnKFImisEK7AQ==
X-Gm-Gg: ASbGncvveHuXS3AvcCpuZMZRB0CPN3U9RVF/ZEsZfrYzGYFXY8+MHS6fuZKtIA32YJ4
	ZDB5o0aYRdMF9NJrEnIlpUg1rpneqn54gi7lZZHIFWQd7Jwn9Q5DIHGQaRe85OChuSUfGoH7dJh
	8VDHOZ01eMLmpyiWhkWRQE0FKS4f23fixedI5CtbCNn8fB
X-Google-Smtp-Source: AGHT+IHpl+65a6HRSkGvLRf1r7jeLyLNnGo4sF7oK21xHyQD9U7Bn8mpXIZIDnMPRBSl5Rocwg7he9JmFD+OdOd/90s=
X-Received: by 2002:a05:690c:67c4:b0:70e:3e3d:cfe5 with SMTP id
 00721157ae682-710c9c93987mr35904557b3.4.1748965030033; Tue, 03 Jun 2025
 08:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org> <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
 <aD6ouVAXy5qcZtM/@lpieralisi> <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
In-Reply-To: <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Jun 2025 16:36:58 +0100
X-Gm-Features: AX0GCFvwPjD5ocl7QOfNaTZVaVH9zG-qYJmIWZHqE7gqRYhb1E9PXLq0OwGv4Ko
Message-ID: <CAFEAcA-JrS0BiT66iin-pRVFadrY-pnJZ8TkDNxcjErknSCnUA@mail.gmail.com>
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, andre.przywara@arm.com, 
	Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Timothy Hayes <timothy.hayes@arm.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Jun 2025 at 16:15, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jun 3, 2025 at 2:48=E2=80=AFAM Lorenzo Pieralisi <lpieralisi@kern=
el.org> wrote:
> >
> > On Thu, May 29, 2025 at 02:17:26PM +0100, Peter Maydell wrote:
> > > secure.txt says:
> > > # The general principle of the naming scheme for Secure world binding=
s
> > > # is that any property that needs a different value in the Secure wor=
ld
> > > # can be supported by prefixing the property name with "secure-". So =
for
> > > # instance "secure-foo" would override "foo".
>
> Today I would say a 'secure-' prefix is a mistake. To my knowledge,
> it's never been used anyways. But I don't have much visibility into
> what secure world firmware is doing.

QEMU uses it for communicating with the secure firmware if
you run secure firmware on the virt board. It's done that
since we introduced that binding. Indeed that use case is *why*
the binding is there. It works fine for the intended purpose,
which is "most devices are visible in both S and NS, but a few
things are S only (UART, a bit of RAM, secure-only flash").

-- PMM
