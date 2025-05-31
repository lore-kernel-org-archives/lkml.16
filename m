Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4AD22AE5D;
	Sat, 31 May 2025 14:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748702343; cv=none; b=BtL3X0dlk9GNIRrOOoOB45tn1uFfXtlzAiRWnefNOq7B1vczF8yAArWmTz092QLneyGF/b6v8xdgEgx//H2xmEhrzFYBcq0OiR5HteifDcTTTVyV/kggJpXTp6Jd3fRiQKFXHFa9UzrSu5x6/JFMn4rkMM7qf97mFcrs57Noalg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748702343; c=relaxed/simple;
	bh=lBf2EFRLJRkJ6YvVPQCtN/ai1rjRjdDDD2Xrd3KVxfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTK9CwLi5629evS+9Gqgn85JiOOsky0smILrPcaImagjjFthK8T2irE/1uccQdD6XfeCFuXZjHlo7DAt42r36d3+BLGnXt3AvpqOs47dgxalCA1rayV4us/N67T5dQc9KfN8SDEnqxiGSTMBv9i3JDSOBnmNYCm4uXHqpKYiBKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6uevtla; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6uevtla"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7826C4CEEE;
	Sat, 31 May 2025 14:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748702342;
	bh=lBf2EFRLJRkJ6YvVPQCtN/ai1rjRjdDDD2Xrd3KVxfY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O6uevtlagdIwTwWPfZh62h1WsHKmbkrJAoV69y2wHYTAnexi8Y0VVRZRPik2t/ppy
	 QcX0fI1/Ji0EDxGZLmJ+cjPYobukt/nWkbP1/DMcbSmutVumgKvwr0IeJF3KOu3iVK
	 HnLYqLUbcdOzyiPTcopdafKtTFTiy+oRaoph/DzwUOTnMdgG4Zd7z6FOfPlMrbkntE
	 oO7eEEyXRoIfGSnAZP+qiZ+tIGvSb31MtjWofEXSGi8At3PGZamxxvHzuqnYtqe9fx
	 0rLJluET+pxTIUszITMC/X1ITxgf/PBKlGn0kkEfB7X1sDpTmHXmbVGmfBDDUae1CN
	 gYnXiJ+HW+kJw==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad55d6aeb07so453759966b.0;
        Sat, 31 May 2025 07:39:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8C/1UODTWM4EAykoNLcacv0wpZed2AGwyV8FhWVFoxk+StbLSA6450PIt8jmqQx6yKoZIf7+Nnq2mC+i6qcg=@vger.kernel.org, AJvYcCWaLBn+VPzvV8QrTYtnOWp/j02RAmrdh1+3zGvIF2naa3zyEgr698pqP99bttKbRdk8pr3Tpe9SuOpXz6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzBFR9FZyFUC4cPAN0Jz8MHeEglcedm8wsJMtOrJDVxDJOHIz7
	Q5bFrYzAOYOZ4EmcGhfn9S1yhmMkXBauh7Q67PKAnLhIVsDLP4P8oKI2w07bmTc8R6y2Yp/T4cT
	uexZ6ZF++cdAsk/2ORwfSvUln9j2BM4o=
X-Google-Smtp-Source: AGHT+IH8YZwXZcj2fodr9EXx2yhE8MWBitTa7ARBMMIbzbNxAqUXEDaLEMhyWcKuZsTQrajJJn5rDiatQbI4A2oYiW4=
X-Received: by 2002:a17:907:3e24:b0:ad5:1c28:3c4b with SMTP id
 a640c23a62f3a-adb36c18668mr557781866b.52.1748702341487; Sat, 31 May 2025
 07:39:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025052932-pyramid-unvisited-68f7@gregkh> <DA935OIFBM1H.3CMSHQ46LLG4P@nvidia.com>
 <2025053047-theology-unsaid-d6ac@gregkh> <DA9AU3OBT29Z.3CX827C91I3IH@nvidia.com>
 <2025053050-maggot-landfall-d5eb@gregkh> <DA9KIGDH4IF6.2T383ZVLTJN0G@nvidia.com>
 <2025053039-reselect-thinness-e0a2@gregkh> <CAOZdJXVvmDro0Mv36grqQ6LB_1O5GzwPx+Dde+wsfu9Cu_me7A@mail.gmail.com>
 <2025053148-gore-badass-1d1d@gregkh> <CAOZdJXVSByiwGWusdajdTVma2aC3ibZtSz9XBpRy4MJrKuxfvw@mail.gmail.com>
 <2025053109-flatterer-error-7432@gregkh>
In-Reply-To: <2025053109-flatterer-error-7432@gregkh>
From: Timur Tabi <timur@kernel.org>
Date: Sat, 31 May 2025 09:38:24 -0500
X-Gmail-Original-Message-ID: <CAOZdJXU1ftLfem40v82NJp3S0WqZoMbqYrqQMw4vZEUbpa6Uag@mail.gmail.com>
X-Gm-Features: AX0GCFupw7ukgTpkTTP1FSn-U3y6iF-JIRAqFNsNgeyuFZpHn4NSWxcIh9bLs6I
Message-ID: <CAOZdJXU1ftLfem40v82NJp3S0WqZoMbqYrqQMw4vZEUbpa6Uag@mail.gmail.com>
Subject: Re: [PATCH] rust: add basic ELF sections parser
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Timur Tabi <timur@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Timur Tabi <ttabi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 7:25=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> What exactly do you mean by this?  That is what I have been asking, what
> is the specific reason why this can't be done in userspace?  What
> hardware "thing" can't be read by userspace, and why not?  Userspace has
> access to PCI devices directly, surely there is nothing "secret" here.

Why in the world would you want user space to read hardware registers,
when the driver is already doing it???????

And please note that the driver has to read and parse a lot of other
register in order to know which register contains the fuse settings,
and even whether that register exists, and at what address.  The fuse
register is hardware-specific.  It doesn't exist on Turing, it does
exist on Ampere and Ada (but just GA10x, not GA100), and it's not used
on Hopper and Blackwell.  You want to duplicate all this code in
user-space (assuming that registers really are accessible in user
space), just avoid a 12-line function that already exists and works in
Nouveau?????????

Please make it make sense, Greg.

> > Please note that there other drivers in Linux that iterate over ELF
> > sections in order to parse their firmware images:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/drm/imagination/pvr_fw_util.c#n29
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c#n925
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/remoteproc/qcom_q6v5_mss.c#n1374
>
> As pointed out before, those have "slipped in" and should not be used to
> justify continuing to do the same thing.
>
> Again, just do it in userspace, if it's "just" 12 lines in the kernel,
> then put those 12 lines in userspace and you are fine.

Those 12 lines are used to determine how to patch the image.  We would
need to move all that patching code and all the GPU detection code, as
well as the list of all the relevant GPU registers into user-space.

> And the proposed patch was NOT 12 lines of rust, so please don't
> conflate the two things here.  That's not what we are talking about.

We can easily strip it down to the bare minimum and keep it private to
Nova, if you want.  After all, that's how Nouveau does this.
