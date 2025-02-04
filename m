Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E45182B4
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738680705; cv=none; b=G6b0LR+YJcu7Ykzm+9HCxdvJWKLOH/ffVRVJn0MUibRvw3dGXpdYQdW1iexE4CrDbot/nRC51T2CKDRxGDMZkodYZnwi2Vlhh3LeOfSJxduwWKSESRZ5ggkY65c293XBM8qgiWQ5hamOsQ1/dSuIJIWAfoCQDNkjoEZZGHFBzBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738680705; c=relaxed/simple;
	bh=J4zLUjXm4prg/eFxGt+fYgNMmII7NdmBc8I6cT7wueA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XeDkyCdZsgiax1It11KVddkXzq7Dd5xNXIlFUlgD0AGWnHa94jGgrpF4ha+L32nq89ka1o3lmKSoM9rArec75JRcu1+uyZQazDLzm1kdT4bQnTt0s5o9TSnViaK/4Qq9FCXwTnRAyKt14DkAyoO6WaAxa1ZAJYlpxFoKIenM00g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=D3UpXQiv; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="D3UpXQiv"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so6020659e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 06:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738680702; x=1739285502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4zLUjXm4prg/eFxGt+fYgNMmII7NdmBc8I6cT7wueA=;
        b=D3UpXQiv3HunVPLghbqWWpB2gr+hhUrvKv7cv5vVhRW2RycnfyIh04o61e/Cv4FF8c
         h/srbM5DFP+xzTJwhqoEDoOXTPAf+Hzd4fGV2Lf+uH0PTpg0F8zORzQeASjDGYIwoNty
         nfJzmFJcUmtiqMA6P+DqtNy8P18wr/RiXrtvxyAgo0EnN/M7ovNiCCrwo5wN2LGZiZ+9
         RUZp6dlvvLBVfCeFTLPtNYDJnz/34IWV0Pt9p0QAJYIKudZLCQhDRXVPNQIhN3woYXdZ
         uhXVcaIIsVVNiFY5L5CozfCalUU2YbpKWg1tjP/hRvJwc8ERVN/rnx35xpQP3MS6eMkX
         uw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680702; x=1739285502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4zLUjXm4prg/eFxGt+fYgNMmII7NdmBc8I6cT7wueA=;
        b=cbtnrKGK6bHQbohUFde4KqSEiRqPEQWYxVRV/qs4NKNc9kp8cemD2vs2Lb0IbtFKmq
         MfDX07l6MMomCYgFS4Kslepd5jtPxIRYr0/VqqCGfOXMK9JxRJ2HTNIPg4HQRs3bP8UF
         cHEvFPakG8Cl/UMcRxnEX/uRrIdu1nY7vWf9cMUcmz1c0CltS93vGWMAlRly3o7fbjd9
         PK2nQZD+MhbaaUza2n2jLY1wjfEamAqe6jKnFyzy4wGz+VaRYdL45Z75Hpbb8fSoBkBJ
         VSjlFrcwMgfODhvm2gEb8I0LKgV6edtGx4lBXBPqJwUqda8SaGfG3FAj+uz0cclM+ck4
         RISQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYyb6Dx01TKarlwuYte0KU0BCOdKl+9y2MaHScmh8AEqbgXzAaJRTFHV1hqeXdREicxBS6IxfCt5NReV0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi19MQh3x7wqVcnj+Zfv0PyM1y/lVGIMGm7c1ZAxRSsTv+7A7v
	J9Bo+MVCvionHWKqIzD9DDwnI0qQIkJ51IqdtWbjOnZOO/mZ4Xw+jo7AOogxxzVoDY07JFhGjf0
	EOIxenT2WzmM1/GYR2FY9xu/WIWrh8A+wVDjqWw==
X-Gm-Gg: ASbGncuzAwx0D6JLTr+Fw1BYQ5DZoSOHaB0zEIT9pwd0UmL2LN336i9NyNA4Kw0C7D4
	xWdFSOZeKVwTB4VeSRK1xKlzBGregCqNV5t4hfRq2RKUdKZjFlJDps25xU/tQ5NYNO7h5TUQQxQ
	==
X-Google-Smtp-Source: AGHT+IFWTKRZ04zHi9yazDmOAR+9nHPiC9DLDSwxIssSS1/sYlKHwCu1qRW2q05nuJpua/OP5aauc8pAw8aEMUpq3to=
X-Received: by 2002:a05:6512:239e:b0:540:2f59:7561 with SMTP id
 2adb3069b0e04-543e4c3c98cmr8359830e87.50.1738680701650; Tue, 04 Feb 2025
 06:51:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204075405.824721-1-apatel@ventanamicro.com>
 <20250204075405.824721-2-apatel@ventanamicro.com> <87frktoo16.ffs@tglx>
In-Reply-To: <87frktoo16.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 4 Feb 2025 20:21:30 +0530
X-Gm-Features: AWEUYZmlBEyFq7UPY0VRDrxJd2P92k6Zjc43uE6bTATPsZOqON-E7U5h2zWhfaQ
Message-ID: <CAK9=C2WOnB9g55r9bfWW4X-BjrST8WArDT8+wLwt7B=TDwYjdg@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] irqchip/riscv-imsic: Handle non-atomic MSI
 updates for device
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 6:38=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Tue, Feb 04 2025 at 13:23, Anup Patel wrote:
> > Device having non-atomic MSI update might see an intermediate
> > state when changing target IMSIC vector from one CPU to another.
> >
> > To handle such intermediate device state, update MSI address
> > and MSI data through separate MSI writes to the device.
>
> As pointed out in the other mail, this intermediate step does not fix
> the issue. It requires that the MSI message write happens on the
> original target CPU so that an interrupt which is raised on that
> intermediate vector can be observed.

Okay, I will drop this patch and instead have the last patch do
the intermediate step.

Regards,
Anup
