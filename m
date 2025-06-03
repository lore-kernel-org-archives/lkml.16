Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C8E49659
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748940570; cv=none; b=bkgXiw/H2zE6V5mqSYxjuNe0+gKCTyE1wplXVZiHuzdKaZDMiC84VikHXcxgvrBUyZJR0Cu1n0HKxZ2JPQycjOEqYQE1VeZRk7H8NxrPRojTbZqvSH93KZ7UhSSiirbigj/osX8lylVahGOfZqXMMgTMasgXDEn/w8SAmovn3xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748940570; c=relaxed/simple;
	bh=jo2emWYPuVUdFhGH9tNfCU/2M1V1dUWXzJprgmcZuBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PGxeEil3Mt5SEn6AlaoRTYUQBu+hMnzJZQKtdUlEDpMLuRHmdp0E4TEGrUcthtIT4LfZDjJ7JIB7/nHwlHCzQELzVeNudHrKzcvJ9lqM5/J0P4Yox2SBOtDnSGh0IUDqh19zfV13/YWxoJHN62pAbUOPpWmB1ka0RWMDil25OkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qvwyneo+; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qvwyneo+"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e8134dee405so2321251276.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 01:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748940568; x=1749545368; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jo2emWYPuVUdFhGH9tNfCU/2M1V1dUWXzJprgmcZuBE=;
        b=qvwyneo+o4KK8Nx3i0dp8y/e0dTY4Tc2rv4jiD44n3kbRZZPOkpM2qHA9zOG894dXL
         +c1/9TxqKDXqZGZ9OJSsIsfrK32yA97766VpNmp6us2VicHD7ZiRI8MOVWJjWBE2+bk8
         Jk0I4hJWswp+iJxMNaxWR3+1c7O2mIRxtEV7yqeDWZh+QMUmjTsuSPwjYOGGS9TCQJfM
         rncxjvVFLLED41qydG1VI4QvXNuDOW7ykHgMwvGSJXN4quiNC454r4WwWZU3aVIT22ET
         OvGtRr80KYwZ7Kb81WOS4Qdjaiv+neEcBiqzR15hSXbdyRyPogZ9A2hu74ruAmiyb59a
         BeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748940568; x=1749545368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jo2emWYPuVUdFhGH9tNfCU/2M1V1dUWXzJprgmcZuBE=;
        b=CosdYNIQ/KvhpcfGEGb5Ecnbe8fJfYvU1Wyji4LEwU1A6ZQtMi5HPbdGEBlSj4g1Bq
         GHD7Lp5bIoT8BFuUcyw6KnJyRfPHODMHxZGljDiIkF9O/MwHYuLZXca8e1SvakBxLIwD
         n2R+zOzb9MRtrHPlmXm91cemcG7MO/1ZfFjd6N94p6xayrQF6q7RaGTxfXyXhGO5wbtC
         2047CzIDo7vy9x+KGA7Z6vAVRixhFYX2FrI6cxgogymHGFWPlsz+NU0L2b30F6Cd9J+T
         hAGmYVNynLqpDxTFbZCA0VWjH9XfEJhJeeP/1NNBNET782K3ljx37GB82aNXC7YjJFJJ
         6ivQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK+ASILoZnwTxqzrPapH26jZflEaCroYg/rClGGzoAQ08pR9n9UHD9RcJOUCbxMe/krNdHSan31Iuw6TI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmi1k3rosXiuyuq6QuH+Zx3vL5MSuEswodZHeNIfz1n/u91XM4
	boV3J5xdbdTHDGAhzMJkiaUCZ0+XDqlOpEBR70g+mxzuWOjcywoUd/FVNkwTWBjHK8Yr05F9dOb
	eJTiuIA8g+s519oJiScvqY5xjmv9N7TndlCfPPghYnw==
X-Gm-Gg: ASbGncud/Jm2Gopf59GQrWTAF6hTd8g/eAzWkTJ0lZEG5SpXmt/xGQFOha4m78/MRQM
	zJyEhS++Oi1TPXiTtLmMDLhI46nUvL3/ItkC6/GKwFUD/AxVFHRA8HIYbMNAlIKhJiwI6pEfGo2
	h9y2hOdxTPgj+0lQ/KqzoJGG8fOqDpyjl5n8275Qj3PdsA
X-Google-Smtp-Source: AGHT+IF9VRq2mySV+NZMOtlPS7LHY1UWFTHf5bGIaGf3A1nwEUi9V3fmFvH4FzrgEJH86VureCFE0fEwOls4JbNcPeg=
X-Received: by 2002:a05:6902:1007:b0:e7d:c9f4:952b with SMTP id
 3f1490d57ef6-e8128d4bc50mr14186933276.16.1748940567941; Tue, 03 Jun 2025
 01:49:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org> <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com> <aD6ouVAXy5qcZtM/@lpieralisi>
In-Reply-To: <aD6ouVAXy5qcZtM/@lpieralisi>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Jun 2025 09:49:16 +0100
X-Gm-Features: AX0GCFu7h2yvWT4ZtvcEtnOs57BjRyvz7X83NedEDQZkf8q2f3eizhXDfws6ZwE
Message-ID: <CAFEAcA-X3bwCXYjp5JccsHyXri2VRULSWR+cjKWkNPq0iw8XGw@mail.gmail.com>
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, andre.przywara@arm.com, 
	Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Timothy Hayes <timothy.hayes@arm.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Jun 2025 at 08:48, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
>
> On Thu, May 29, 2025 at 02:17:26PM +0100, Peter Maydell wrote:
> > The dt bindings do allow for describing Secure-world devices:
> > Documentation/devicetree/bindings/arm/secure.txt has the
> > details. We use this in QEMU so we can provide a DTB to
> > guest EL3 firmware that tells it where the hardware is
> > (and which EL3 can then pass on to an NS kernel). It would
> > be helpful for the GICv5 binding to be defined in a way that
> > we can do this for a GICv5 system too.
>
> It would be good to understand what DT {should/should not} describe and
> whether this DT usage to configure firmware is under the DT maintainers
> radar or it is an attempt at reusing it to avoid implementing a
> configuration scheme.

It is definitely on the radar, not under it -- that is the whole
reason that we went to the effort to agree and document secure.txt
in the upstream binding documentation :-)

-- PMM
