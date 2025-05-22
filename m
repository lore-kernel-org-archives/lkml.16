Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902D62882BC;
	Thu, 22 May 2025 13:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747921745; cv=none; b=FZ7RWXrhU5wfoPfe1yxsX0CC22At3pDKBC8On7E0L2nxehRd0whmjUkZx1fZFnRsFGj1siW+BvGGOMJE7ZPwq8RoY8dMJpB6m3NUadv653aUR0qs0bC7GVpWnAgY/02rUuS5dqON7805CsyBk9rPfGmvQ8opS1PCbRtN5BeDCMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747921745; c=relaxed/simple;
	bh=seTFlfjq6NSrzxnC63mhUew9n0vw2LOFO1OLNic6qCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBTs7x9Ysa7cMv2aWeq7W45UeeNnCas9j20ysRR0Q+/blfNamEYP/J1Ax74iDrbJXGLzTGpFaLMtB+kcV8iXOAWczD/HLzfqdhw3vqPCsGj3hAI7w2Y6aOWPgl+n16/r+IqzywtwQ51Cn7yTqAeEMqMlDHGS234sy61jwC+SAqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMSPCoUC; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMSPCoUC"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-231c88cc984so8099265ad.1;
        Thu, 22 May 2025 06:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747921744; x=1748526544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=seTFlfjq6NSrzxnC63mhUew9n0vw2LOFO1OLNic6qCI=;
        b=QMSPCoUC3XpBWccKfhfoLREXhnIYuoNCQxvCOQUP4hVrcETkNbYYSv1iYxIIC7enwK
         QT1lOFhGSaPJbyZXSf2qLAjpKqpxOEvyOnY3pb4qGH6jO99NJ7QZEJA26l89w/M1qSms
         GYmCaXfoZ0Iek4JIibIG5T0ZJaswqMWcdAXPIzC1NI41/s01SkZMFP0JRzZ+J7iBrBse
         lw0J6fwB8fZUAwAUOVz6lJ8I9dr/ihlEu2oZctWG8qmPMfEf5oI3dMOXZj4xAAqeWYvc
         EkvxdWp6wv+gTkmCIUxZTQu6WQMPajUEDklyY59BObaPk7gpI12XtITz03x/S9oOPVDi
         NeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747921744; x=1748526544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seTFlfjq6NSrzxnC63mhUew9n0vw2LOFO1OLNic6qCI=;
        b=dHoMKrTMmqR/KDZ325AaCDUFw0QnAQSFwBMqpMJbNf+ZIlI6b8T4c10EeqMqzLqgU2
         fFHzDmokgrXQw2BIxP1Xad92CJYHl1kJBOuLvRHYBBnwdJlfeogcqkpJxjnebcVIqL+Q
         H2van+ErYa8j7KOwWyTzZotxwAtXvnkehxBWE3OSbtJocoEqXekCcyUHrltwYlu+gnoB
         bZe9tLweZuNMVaMHeZkOP4GmM+efKsQ/H6iS7Wa/ed0cfgi4O1/X8dZ/c0bCbyUobjW2
         lia13jR4mOX3tZuWO6SsrQxhIjSyZCdpIWyY55B8x79k/h3lcoB6d4ZnQDkx5RA+/TNa
         vYXg==
X-Forwarded-Encrypted: i=1; AJvYcCUEpLusP/2UqYC3uOVpbIShGXIINACoq1HAM9JwL/osTPoNLf944eNS6k4XxBpu2KRlv5tjIMQy4PbWhX4cy/w=@vger.kernel.org, AJvYcCUcn7ayJdY19ak8JvU2Og8mIJb+2eN29elNAtvAV+Q5wURwK1jKR/ngRPAsEsYAYqZaWlWxOJfvQue1Hew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7fRKZvN1Lnxh+X0P0AgvgJa9rOLlqRPsArhVRV7tAg6U/f/Mf
	y0SNWpNleGHDjKcKA+D44EiSYLySKQNDg2MLinDe2rkXGr2HGHcKWhB1CNQodQtjz2QOO3oWr4T
	/knxYY+5/0PeHGZNGyhfo3LwmY030CqI=
X-Gm-Gg: ASbGnctuIQ9Tttaw98fTlNza0JYwYUYMAj4k5tZ8CWoM4LTaSltxP3gMEVrNPkRC7Z4
	fYv5w4MmGnNeUODKhTp4vHaLvZz4uPxXHDbePrh3E1ORHomWyULLlYkkXK3cvpcdVdYFN3EYwcO
	sbYfqWaaSRH2xpr0wEFQeT8KeIY9ZKmP+S
X-Google-Smtp-Source: AGHT+IHmxBM4ElYPl0Cgle+X1a1N9BYizs0g64Q+6AGqDWvHtYhE0YZ6Ro+0RmtEXcsihYLu9rT/e9fiJZd+nt7gyiY=
X-Received: by 2002:a17:902:ea0a:b0:224:c46:d164 with SMTP id
 d9443c01a7336-231d43891f9mr119531835ad.2.1747921743759; Thu, 22 May 2025
 06:49:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-rust-mno-fdpic-arm-fix-v2-1-a6f691d9c198@gmail.com>
 <CANiq72mh1h8d-EWrZef=BPPtadZyHG0B+tg9GgA_RnWiETWMkA@mail.gmail.com> <db93019f-0a57-4b1d-95a6-ed5a6ab9a989@gmail.com>
In-Reply-To: <db93019f-0a57-4b1d-95a6-ed5a6ab9a989@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 May 2025 15:48:50 +0200
X-Gm-Features: AX0GCFu-gY2Uaiye5G1giuS4p4mScik6sBBHkTTkGYR5OKRXRPGKMWWtMoHevFE
Message-ID: <CANiq72n3UzgG4BTcZXd9aJK_9+BwodRkbzewPtipi4-iCqdeqA@mail.gmail.com>
Subject: Re: [PATCH v2] arm: Fix rustgcc unknown argument '-mno-fdpic'
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	torvalds@linux-foundation.org, Ben Wolsieffer <ben.wolsieffer@hefring.com>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Christian Schrrefl <chrisi.schrefl@gmail.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, anders.roxell@linaro.org, 
	arnd@arndb.de, dan.carpenter@linaro.org, laura.nao@collabora.com, 
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev, 
	Nick Clifton <nickc@redhat.com>, Richard Earnshaw <richard.earnshaw@arm.com>, 
	Ramana Radhakrishnan <ramanara@nvidia.com>, Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 3:27=E2=80=AFPM Rudraksha Gupta <guptarud@gmail.com=
> wrote:
>
> Thanks! :D Happy to send in a v3 if needed

No worries, I will apply this one :)

I will remove the tag, unless you want it there for some reason (e.g.
because you want to point out some extra testing that goes beyond what
would normally be done).

Thanks!

Cheers,
Miguel
