Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B810237172;
	Wed, 21 May 2025 06:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747810157; cv=none; b=SG2PxyYL/k4BUPphWQp3GwtTZUFAgQ3LfWOBckWxpvp+Z0J1+2dOlDpixkQPDJxc+MQhS/rfTUK1UUEYIGMO1W1fQnsW1OqCG1Z1OiLPvHSyY8s2eCYwDJzHTFvEvRdSbhooFi31QTMk0urG5jqvv+ejiAJteweap7LVs05wuok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747810157; c=relaxed/simple;
	bh=pMgfLOarE3sLn9ApmPKE5gjOoiEH3KlE+dCmFXpW1gM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cR0pmqJgbSlokO1u35t4t+Y3BCtuHVx3ufGNEfnbgk03qvg3mBxthE7WsYnLAEx7XXrkHxXtC3VdGcaus8Z/sKqZRsWBUf8GalFq8Nabppkis7zOamgrXoy6ofPwk5Nx+1+/V5qwGIq21K/r4DF8Bl7j9i/m4QXR2fEVwEtRtVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvGb5n1P; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvGb5n1P"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30e85955bebso885697a91.0;
        Tue, 20 May 2025 23:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747810155; x=1748414955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMgfLOarE3sLn9ApmPKE5gjOoiEH3KlE+dCmFXpW1gM=;
        b=gvGb5n1PoCDt/jIHV2wF8JPzT0NflywpYmrJZbnbTj+dbhkzxQEHGUpXF7xqwIxkE+
         +OG6xm+Z8HbrVG2Af9egsNHbFk+TYh4Dm+bPuOVK79L8TuQNVqWboWBwf9upaouPMzGF
         ejoTFWbuiX5wwSq9xxd3QUUHDLmcUUBDBvm90npNj2t9m7m4Ymv0OQqoHi4XFshdMJcJ
         YKywyOWwqoEi1i0MHKcZkqvmrgpiR2QgtJHPz9oKlIbJ4OAmTV/wIzjz673tR6ib34I/
         rTI4aLhnBlG1d7o/OSGIyej47dR9LQYD/XgHblatuxFJFcid66EbPyLqTQTaPxROl94F
         JevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747810155; x=1748414955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMgfLOarE3sLn9ApmPKE5gjOoiEH3KlE+dCmFXpW1gM=;
        b=obI3tX9QEVC59jJevBpHOsXt0zmiD1/26HbFtmJLutZV+AIHI7PFdn2V94idUmptRr
         3xLMM9zniiKYjwYik+fA4VutTltzwpd4n350ctJtnIjDFdyQUoJX/vvcV7Prpbdfq122
         kDUvgvr79tlhHLB6kWWZ6txIlpAw23mzBrRxicSZWHLshWtQvsIyW3lmfleSjyQ9/Xcj
         cPjA8rNSjo3yBG0I/eK1QwTS3GCNfYGsrK1A0PqYnLPPFQEF3Rl6c/EGvU0vjUvkFKHy
         XvifddLteoCAWgm5OXDpPTfvUtuoHBoGcMpCx5YrAxjzyc3Eo8fiyzmJZddYGqJQKMWW
         IyeA==
X-Forwarded-Encrypted: i=1; AJvYcCU791woDO2sjwSp3NVUd8i9YIIDbYmTHF1+oqZIn824/sWDiM4FrtyCB/ZWO/TAJW1zSSfjRMVtPeRIc1O6ykk=@vger.kernel.org, AJvYcCXEuF5w9lvZQJJVoM9ye17EqM9wR/tqdSlwUL1o6YOwFaYnWsDmiX4VUvJ8GvGUuJqITjfShSsdDlpOCIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzIs7k2EVeTcc+sOmaubeFqogwO0gmbTNm8mYf1Byn1g8B4ie+
	0Ap1za9L+EpFxT2j6XQ6RWhdG3jdRwfMg6Qo6crroGyTIKC27qHlElufsY9DqRYl0DRQVn2vbnh
	OllK83U4eTMsxiiX1ZoJSnGV+XkSe36c=
X-Gm-Gg: ASbGnctEqpd09fsV+vP6n5g2nvSYz7vzGPDqPVwZl4HHBoMaM+R0SSmwWkGk8TJJRCG
	4iXspfnWRqiCtQdqjA3jEhMWvRwwZPdMUzfQpqbqOyfjbI6XhEBZPoh/Vy2WqcIhQNeiO2sZIFT
	ba9b/7J2skHjtSfH/O15HADA9AdBNwwZQn5xTyUHamr1U=
X-Google-Smtp-Source: AGHT+IExmNmxiGkYVIFhd609smsGiWGOh8Tpu+Ows+3ubk7FR8CgblGAfBU0mW4P84FMoxwFG0XtVUhmE0uQ2j60ZMw=
X-Received: by 2002:a17:902:7d86:b0:233:b829:691a with SMTP id
 d9443c01a7336-233b82979b1mr7087165ad.12.1747810155231; Tue, 20 May 2025
 23:49:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com>
 <20250407183716.796891-1-ojeda@kernel.org> <CA+G9fYt4otQK4pHv8pJBW9e28yHSGCDncKquwuJiJ_1ou0pq0w@mail.gmail.com>
 <CANiq72napRCGp3Z-xZJaA9zcgREe3Xy5efW8VW=NEZ13DAy+Xw@mail.gmail.com>
 <aAKrq2InExQk7f_k@dell-precision-5540> <CANiq72nPtr1FE_SBU_+wHVptfjnoSGaxjP4LWMzVbOF0M6LvnA@mail.gmail.com>
 <aAo_F_UP1Gd4jHlZ@dell-precision-5540> <CANiq72mPZ-ik8k+04BarAu26A1=rV_y7GYZHkFnCezW4jpXq+g@mail.gmail.com>
 <53dc3112-9e34-43c5-852d-aeafea882247@gmail.com>
In-Reply-To: <53dc3112-9e34-43c5-852d-aeafea882247@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 May 2025 08:49:01 +0200
X-Gm-Features: AX0GCFs8alyZvoCaX-vEw4ZGLJj0dXRTRZ3S4mg4Ye5KYmwczTJfDAjcYR-KhaA
Message-ID: <CANiq72n=pTHrXJysvJVV+xK9Y1O9owF=rxEnrMtMeN=gX4E=Sw@mail.gmail.com>
Subject: Re: Build: arm rustgcc unknown argument '-mno-fdpic'
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Christian Schrrefl <chrisi.schrefl@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, 
	Alice Ryhl <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>, anders.roxell@linaro.org, 
	arnd@arndb.de, dan.carpenter@linaro.org, laura.nao@collabora.com, 
	linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	Ben Wolsieffer <ben.wolsieffer@hefring.com>, torvalds@linux-foundation.org, 
	Nick Clifton <nickc@redhat.com>, Richard Earnshaw <richard.earnshaw@arm.com>, 
	Ramana Radhakrishnan <ramanara@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 1:21=E2=80=AFAM Rudraksha Gupta <guptarud@gmail.com=
> wrote:
>
> I went ahead and sent a patch to Linus directly since it seemed to me
> that this was about to fall thru the cracks. I signed both you and
> Naresh on it since it seemed like you both were happy with the small
> patch. Apologies if that's not standard, please do correct me as I'm
> still new to kernel development.

Yeah, it is not standard, but no worries -- I will reply there.

> Btw Miguel, thanks for introducing Rust to Linux. I'm not too good at
> kernel development or Rust, but hope to one day. The modern Zulip board
> and documentation is very nice for newbies like me. Looking forward to
> making my first Linux driver and Rust driver soon. :)

Thanks for the kind words! :)

Cheers,
Miguel
