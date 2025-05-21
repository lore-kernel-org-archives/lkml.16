Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9044D4430;
	Wed, 21 May 2025 07:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811381; cv=none; b=uEhtcjnxkOL+lyKbxk0P3oZ2K04Q4NfQy2n9Uvi9XwkaYkhoObHsrjSKVNPtuXmT30MohSV0CAfJWDwkDDcSDscrp1CBPj2gN+Xwt6hAwPdtkGrPRWsEJLa6VvxFk2G/tk7eDV4VMrYzPHvHtEtm04E5EfEL5kAywNfEnd3GBi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811381; c=relaxed/simple;
	bh=M+QgcJjqRVEJQfA4aX9EptR04Xy9P0/WqwTgE5lgNbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j45i5ihJKr9jIQ596sDIcTwZWxJ6iEpDyfZFMUgCsDlIgflKPTH2xE6GZN1Zl3LmQ0xf1kZjPDPpVxphyo2zywEKJnCx3bQ4a7Mr3fvwVlWDLIy5mvM7TNM0FXDT2b8JF5RNrObywL3+ljWkAjpYn1KiDWmHDg7611VtTbXeZJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmkLA/F4; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmkLA/F4"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-232219cc6d0so2532675ad.0;
        Wed, 21 May 2025 00:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747811379; x=1748416179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3b1jzIhFa2FhOCKHPrKMKsuUFishKw8l7iMGb9zVm7w=;
        b=GmkLA/F4D60O+ChUQhWJ08J8apZ4vJY+AN1W+kMRCjRF+8p9M5TiATej247KyvkrBC
         6M/ENMtx1X8FliRSxrz9UsX6j/9ivTTmRvXUMYs38vBooAEMeoUSZ0cduGq/U+BJ6XXo
         IJ8LY6K/4gB/xvkyxzbdpLLi0JbdwLFizB/lwn4przcAroJIRtRyFrjLWv6X5j/WmXq2
         u0YJtPedCKvFc+dRWl7pcNdLpu7NRJCF7TilExU6UffufoVib2cJVlWanB3IOZm8dmbq
         fI+hTKUiDfW3cUN1Js28mg796KKjGeY1kF90HKs28063RVArv9+nN63uJWhS8asw3uyX
         cBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747811379; x=1748416179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3b1jzIhFa2FhOCKHPrKMKsuUFishKw8l7iMGb9zVm7w=;
        b=V2LOWMnAh+df3E82hW1pKIJpbi33M+FvX3LMUAFg7XPoNxxakcp1EhSPnvQ4EgdtCB
         m/Q5hoz6RgT0nfTZTP23Knd7NAc35WDjf4afeACv1wfcvP5S+CP7FXD4SIV3sT6DsX15
         aiGnPRwU5Jnf/n9HkhVG/F6MsleISgklhEfkoFkA9ajVd1Ffl4NsQ1Pracr7DUk9aRIS
         EL/yp+tS4Ojm6Xzl2cVBmNYVMfXe/Np5uNExg46rX/IqL+DIptSDz07PNaF46YxJ1NUZ
         5wGxAfxiYpOKLEpdYhA8z3X7Uu6pcXIbPc6ds2P20Rudu2Sz+3LTtufj2umDYjlmIZuy
         w1ng==
X-Forwarded-Encrypted: i=1; AJvYcCWWtHyXi1EkiKvT5cggymJZoAPhP1bxS6TBSFTcWQ1T9tLH9aFdg+zFr839vNj/rnSYolE7MLLq5BvJrsY=@vger.kernel.org, AJvYcCXNYr/W7Wn2JDswj4xfEf9nqSLCQ9mbGIrIN5RX/JQ6lSwYqcTj+uvquNiAPryad92xFH3klUDYgiUu7n/F2go=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDwDqzmtvyRSA1RZLHTl4sD4jLVdQ7H+4eNx7LrCyp5XZQuDLJ
	mRis4Bkyd5XkSIR26FL1D9UjE/Y5GauJPF1g66FQ0TmQYQLn1+cmnR6C/M9dXZEeeutxRex1+VD
	NRs4mRE4us6Z8Vb12KWfvetVYlsvQFmE=
X-Gm-Gg: ASbGncs52O97EXNxTcY20Kd5vODPIJLLEIAlWMHRdYsEKz6llUxBfxMqSwdDTnuAjn/
	XPkRPzeR29DylG3EwCKyUDru2ROo5Q6p0a47wh6ZnPFkALpt951c3iSgEVsvCQgmVuao7DBwWlQ
	XUQnZCT0HG1ZK+tEOqTJvGscgHfU1olVgf
X-Google-Smtp-Source: AGHT+IG7OrMSs9P/zrw+dkkGpZ5+vimnflwEOeG26XH2xajGx/3nSUoi5maDfDx2SmZ+PQsdtWRVqt79c4BQdmVcmgc=
X-Received: by 2002:a17:902:f543:b0:212:48f0:5b6f with SMTP id
 d9443c01a7336-231d45262a6mr99145265ad.9.1747811378727; Wed, 21 May 2025
 00:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-rust-mno-fdpic-arm-fix-v1-1-44e77fe6b2a1@gmail.com>
In-Reply-To: <20250520-rust-mno-fdpic-arm-fix-v1-1-44e77fe6b2a1@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 May 2025 09:09:25 +0200
X-Gm-Features: AX0GCFsPkNFGlU8TGSg9z4gQIr36f6YCgKgoros-1ed1pfYVZLXdghRHHzY45wc
Message-ID: <CANiq72nUFqM7mnpSGZF65n3Aak37KVVSa0d830o31EuZyh+OfA@mail.gmail.com>
Subject: Re: [PATCH] arm: Fix rustgcc unknown argument '-mno-fdpic'
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: torvalds@linux-foundation.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Ben Wolsieffer <ben.wolsieffer@hefring.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Christian Schrrefl <chrisi.schrefl@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, 
	Ard Biesheuvel <ardb@kernel.org>, anders.roxell@linaro.org, arnd@arndb.de, 
	dan.carpenter@linaro.org, laura.nao@collabora.com, 
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev, 
	Nick Clifton <nickc@redhat.com>, Richard Earnshaw <richard.earnshaw@arm.com>, 
	Ramana Radhakrishnan <ramanara@nvidia.com>, Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 12:48=E2=80=AFAM Rudraksha Gupta <guptarud@gmail.co=
m> wrote:
>
> Currently rust on arm fails to compile due to '-mno-fdpic'. This flag
> disables a GCC feature that we don't want for kernel builds, so let's
> skip it.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://lore.kernel.org/all/CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJX=
Yu7wWK51w38QUQ@mail.gmail.com/
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>
> Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Thanks for the patch!

A few quick notes -- I hope these help to explain how it usually woks,
given what you said in the other thread:

  - Since you asked: in general, Linus does not take patches.
Normally, patches go through some relevant tree, and then then
eventually sent to Linus. In this case, the Rust tree would typically
be the one taking this patch. Please see the `MAINTAINERS` file.

  - You cannot generally send a patch in the name of someone else
unless they provided their Signed-off-by. Here, neither I nor Naresh
provided the Signed-off-by as far as I know. Please be careful with
that! Please read the DCO and the rest of the Submitting Patches file:
https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-=
developer-s-certificate-of-origin

  - Similarly, in general, you should be careful about adding tags
from someone else unless they provided them or there was an
understanding they meant to provide it (e.g. Tested-by). Please see
the "Tagging people requires permission" section in the same file:
https://docs.kernel.org/process/submitting-patches.html#tagging-people-requ=
ires-permission.

  - The chain of SoBs has a particular meaning. For instance, this
patch would mean (as written) that I wrote the patch, and that then
Naresh carried it, and then you carried it. And if I had written the
patch, then the Git author should have been me ("From:" would have
been added by Git). I guess you may have meant to indicate there were
several contributors -- that is typically done with e.g.
Co-developed-by or Suggested-by, depending on how they contributed.

  - There is some repeated text in the non-commit message part of the
email. Also, tags are written without empty lines between them.

  - Ideally, fixes for build errors contain the main part of the build
error message in the commit text so that it is easy to match it later
on.

What I would have suggested to do in this situation is to ping in the
other thread with a normal email (similar to the one you sent), asking
if Naresh or someone else was going to send it, and mention that
otherwise you are willing to do so (under yours or perhaps Naresh's
name).

I hope this helps!

Cheers,
Miguel
