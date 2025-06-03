Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1035A2C859
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748942336; cv=none; b=ZINx5UopLP/OPmzTlEW8VmtFWZrVMo2T8NCifC19nsGtlM9Nsv0q66lK6A0UJCSz2QSlod0xjIUIMe1zyAku+nUAkEmN0h3lIe47kZjvF0P0an0SIkxiKVdQ6gl1SjVHXaREDTX2zsyVC0mceZqBIsFJeCtDXSXdw325C/y9su8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748942336; c=relaxed/simple;
	bh=IRUyetBBMeNmSoeirc3K7KcZMisWubGxtV2SEUGhSJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbWupvPgU5n0DVyAImkIT2RmDPYJ5yXF3Jt49+w4C2a6Gj2o73PcvenePJD6u1XcAev2oVSPVH+cPX33uNWZ9ezIiK+wh1INzvrWXp5268igG47yWRD7ztAdGeqkRkRUy9c0rnR4M62Ijyf6fUNGYumi8e/hCNAb0+x+621qW+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1bGD/oUU; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1bGD/oUU"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a361b8a66cso3224481f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 02:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748942333; x=1749547133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axAJ/bPKqueibBnSLvaZpLMbrsAnFyV/PPzf79qElD4=;
        b=1bGD/oUUeXdoQVl466gx+0zzQzrS5CUosYNbgM671SfWIeMhkebu/STL4zDPwjbbfQ
         dAw6DmIjmGHCWQcJoTzrfZSnzWFrmOQ+R2n1IRBzTJM9b5wstNg6JhSTUGxRAbGuRSJu
         SSN+j8slLJGh+D7zlo2OfX+p5/UG8zCe7zEoDzOkXTSQKUlfzg1ihcdQyefAxd8onUY5
         i7kbcZ6vz599OijPGuqoAquBaZmfy94nQpUyuUxbogqqkamOvqz72Ib0Vsp8eJPZ/5sU
         HvqCYKtLRn6SefmWt5PATeG8nERzwE/8DTY1EHi7hB6EndfGNTa9NsCrBKW5/SPuQS4Z
         /Pjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748942333; x=1749547133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axAJ/bPKqueibBnSLvaZpLMbrsAnFyV/PPzf79qElD4=;
        b=fF/6nwiwC5uonFf7A0LKIYez7IaecKGO7F+IphycCBn1nueI6us0aam2N4KSRiqe5k
         WmjuOW8q5VB6P6XWuAEa/a2UCJH/IRqFIXVCkQC6TFqNmGvnH+30kSNwAux+di7mPP0c
         +iHRngeL/zIg2l0viPdcGCl6JmUtFMGSM2XvNCHclR6BseriUR22TrMBcp/DyfutBgLI
         q6h7nQD08v/1e5PS+wbOiwVrLUTitEefWxUbiYtMgc9NFAWALslUfGU7C8duJb5zTvOR
         Qa82lxSwXBTUDDlf8PWqQkt/YNe+kAtAmo3UfQU4YKjNRKuvN97WHyeWNZNJY6wPIe2/
         qu8A==
X-Forwarded-Encrypted: i=1; AJvYcCVeGdbzD8ICoUaRnMpIVdqjXDBjbdq8397pfRc09hlowWq4Pox8fKUS7QoxFXy5t9nZMK0SQx5jTWOabEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZP4EERH9i03nwmvXnzRQ8tZ0wR6Z6yfLHGxMiExbkcjFuMmzf
	qKfKt16rZlJFPWVnGIhEH1sPJQzJS7DawbcYoNRg13Ad2PDL8p8XLlSLpEmO6Wkciju03037TBA
	clyrf1noBj7nqvpnPFsjYrmU3AUwdoTgFbM3zACGG
X-Gm-Gg: ASbGnctQ7pcNeeTBYa1Hi+hZsXk4myHnDE0E7+0xTEwtZCKKpzwzpf5NCUhe0dRfVpG
	sipXfhY0qwkGihssQ7ciHsSEr5QxXKWE7xgIBgG+x1JFrryOiXX1dWItFCrVP95GU7/E6nhK616
	uwMbbxoV8G7D7KMTymUzb5tiO2eC1TXzXoqdw8o3it0UUx8aihkTCLGaoSKQvFf1kymfU8C69Oa
	w==
X-Google-Smtp-Source: AGHT+IH6Yt/VhYGEmRfZPAGJ9WIfXjhQshnf8InBD+npCuucBZ680ZB6MhVroRk+R/qvO1IR07giEmIeh7nFH21Mhn0=
X-Received: by 2002:a05:6000:2886:b0:3a4:fa09:d135 with SMTP id
 ffacd0b85a97d-3a4fe3a819fmr9061408f8f.54.1748942333162; Tue, 03 Jun 2025
 02:18:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <aCUQ0VWgoxdmIUaS@pollux> <aD3PCc6QREqNgBYU@google.com> <aD3f1GSZJ6K-RP5r@pollux>
 <aD6yOte8g4_pcks7@google.com> <aD62ZGBwqXxTroeX@cassiopeiae>
 <aD64YNuqbPPZHAa5@google.com> <aD68BzKRAvmNBLaV@cassiopeiae>
In-Reply-To: <aD68BzKRAvmNBLaV@cassiopeiae>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 3 Jun 2025 11:18:40 +0200
X-Gm-Features: AX0GCFs__6xDcyl4WK1x25O-qzOMPTvm5GVhwfyjOlM9nMlQhRz9UAwXc24Pi5o
Message-ID: <CAH5fLgjweugttOtuiyawNp5s2N9JPoo5FTJ+Zs9t_S87ggC1Gg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 11:10=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue, Jun 03, 2025 at 08:54:56AM +0000, Alice Ryhl wrote:
> > On Tue, Jun 03, 2025 at 10:46:28AM +0200, Danilo Krummrich wrote:
> > > On Tue, Jun 03, 2025 at 08:28:42AM +0000, Alice Ryhl wrote:
> > > > That optimization sounds like something we definitely want, but I h=
ave
> > > > one question: is free_irq() safe to use in atomic context / inside
> > > > rcu_read_lock()? What about the threaded-irq variant?
> > >
> > > No, free_irq() must not be called from atomic context. Hence, it's no=
t valid to
> > > call it from within an RCU read-side critical section.
> > >
> > > I assume you're confusing something, free_irq() is called from the de=
structor of
> > > the irq::Registration object, hence it is either called when the obje=
ct itself
> > > is dropped or from the devres callback, which is called after the
> > > synchronize_rcu(), but not from an RCU read-side critical section.
> >
> > Ok hold on ... I guess the issue I thought was there manifests itself i=
n
> > another way. What about this situation?
> >
> > Thread 1                 Thread 2
> > device removal starts
> >                          Drop for Devres starts running
> >                          devm_remove_action() =3D 0
> > device is fully unbound
> >                          free_irq()
> >
> > Now the call to free_irq() happens too late, because there's nothing in
> > the devm callback stack to wait for it.
>
> This is indeed a flaw in the Devres implementation.
>
> In my initial implementation I even thought of this, but then obviously f=
orgot
> about it and introduced this bug in commit 8ff656643d30 ("rust: devres: r=
emove
> action in `Devres::drop`").
>
> In order to fix this, we should just revert this commit -- thanks for cat=
ching
> this!

I don't think that helps. If Devres::drop gets to swap is_available
before the devm callback performs the swap, then the devm callback is
just a no-op and the device still doesn't wait for free_irq() to
finish running.

Alice
