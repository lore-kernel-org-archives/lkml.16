Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736A6EAC6;
	Sun,  9 Feb 2025 17:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739120978; cv=none; b=eJYZPg6+/v4833GXkJp3NYOeyFDWgH3WUs9ucxETxgStknGATxLvqPOIMmQSb3Z6OZQ2TUZ0DcZ1dOyfaaVqYX+Xf7JxVJAcFAoWtXJbU9q3KRwie2TNRjpY/VkmUido2C2VleFFhI9xsX0nskUZ8gHoH6F7dEX6KVtpBf+csDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739120978; c=relaxed/simple;
	bh=VgMB+QfwpLXBdjbXVwqsB5TrqV9pZsn582gDNIxTitk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TjlC9gWwsNormmhqZqPMgX4EpHNMNjFt44fG/BFaabznmiqAX9jOrFWTB7ja3MutdcpgPEMhgaJT5MNpT0r4oAFvXKyIR55JTBD+j+oUPlfw+xg3YJqoQcYmf7Fs7Z6NtUzUpkrBkQwOuC/BDgUZB9c4XnBcweZFcralmAUyuqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mw6Y1/LH; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mw6Y1/LH"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30616d71bb0so34992531fa.3;
        Sun, 09 Feb 2025 09:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739120974; x=1739725774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgMB+QfwpLXBdjbXVwqsB5TrqV9pZsn582gDNIxTitk=;
        b=Mw6Y1/LHLepDbT3+1cHsaaIhznwGKb6CkG/OydHjVfHhIkN3MUB46vEnHoa1UMHGrY
         SJBGscrUCimipwG5PBKRDpsL+sUQBpcRB3DS8LYoVUzmtu/jdyl5prQLVovER0cpTIaP
         YjSNh8+zWlFm2sPnvSEoIWQOLubbq3IyUv9r7yaf/vasUae2Eeuggw1T+ZMX2XjvsM1m
         gEndTkWr+vMzgi9+6rfCZVonRjBNr/vZDOTiPvyVR+14N5SGrQP1BCHT64Xh1kgc/l9C
         sCYslWG3Vb5y6rYmZZ5nvlj7xUGYqqu3frL0DT2l5Ztnt6haFpLTddc0bv0+jDpwIqR7
         6EfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739120974; x=1739725774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VgMB+QfwpLXBdjbXVwqsB5TrqV9pZsn582gDNIxTitk=;
        b=tVLbQUmcom+t/KhhK36s3es2VYQ5SNNWkmlpYkmfMCdxC4oW0EIFVG6RX5M95bW9xm
         G60LVXbsUx/H020CC71ixdrsNIYjf6ngKIoJf0Ab80nBnb2EB1Qq8uCy1h5nDaoyJK4B
         ExZd5qOLGEa+QknW7EEgjyke8Pl6aE6Mvm9uTxiSys8kPLk9ltaRiDu2kX3PHkB95ERS
         o4YxV1ehCCc5hW3clh7rmLzh0Sv35QHFI+NvAdSiHphWYZdw6FMeHhg63arPvbq0sdWS
         WM08aAeVO/0OVH3m9wSU7jtngA9za2Ek7V/r/paEnm2JJK7D3U4SGvb3578zYdIM0WGU
         GC+A==
X-Forwarded-Encrypted: i=1; AJvYcCWdGQilaqbmUpfH8BCK4Nz+LrhROeQ3ixrt5wdX3FN6ai5cnc3Z0h38z3gUZ0DLBz9QYUt89+74w66OOpnKeag=@vger.kernel.org, AJvYcCXd9Z2YUdmpsaDueYb5oQezsOfnI/Fjuo/fqmtS1u5Z3+F11DEXj5HOCSOMjJxigrnfaKB+j7ojg3Cq8P8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqADD6kS3JEjJK6XkpMFf07E5i6jf0u1hDN7Yv5tbw5bXwRGqB
	IOiAQnfdeKv7mNlHUaemcn+qdu9lDbCkqNhZMXThv3DjzBb1qZFaCGez9XFgaguwsEs/PFSYU95
	W6Cn5G5kg5EymFcvmD8azZxGIJ3tN0tTI9jI=
X-Gm-Gg: ASbGncshj39Q8Ad0u/9mBc9I49i6D7WAfWR4t9RGpclkViadWc/cMHSC0JFJOWDyUob
	aPOhEPaj3uEssry9zP0MNPP2KIeNXNwrgRIzw6vNiWix/18odZ/oiYoSq7UqFz0mjo6yOh7ds4K
	gljxyx101Ifpdln+VeokbF5FZ4kZATWv0=
X-Google-Smtp-Source: AGHT+IGjqKcD7AM2T/saQ/4jZ5vnToWdQaDh/GZecbGMBciIkIUTZeQuBnn2x7jq6RM3w1BR1n6UsOQjs8RpXnlFxA8=
X-Received: by 2002:a2e:bd02:0:b0:307:deea:f576 with SMTP id
 38308e7fff4ca-307e5a8da83mr41045761fa.34.1739120974326; Sun, 09 Feb 2025
 09:09:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209-rust-analyzer-macros-core-dep-v1-1-5ebeb3eb60a9@gmail.com>
 <CANiq72mw83RmLYeFFoJW6mUUygoyiA_f1ievSC2pmBESsQew+w@mail.gmail.com>
 <CAJ-ks9nMjPnyY_J1xH93MEepcekYWQ=Ve+Kq_TaM=MvA4B0Phw@mail.gmail.com>
 <CANiq72n2WTAp28PeNVw1hOsxw5Bo1HMxtpTb7N-f7z_aGMppBg@mail.gmail.com>
 <CAJ-ks9k1+n7GS8mMYg1BzrBwsEJK3P9xPnj6xGO7Prx0qWSs2w@mail.gmail.com> <CANiq72=sCeT0xwmszLZ-sOyH5YdOvvbzSgMsz5SgzF_wRJTbxA@mail.gmail.com>
In-Reply-To: <CANiq72=sCeT0xwmszLZ-sOyH5YdOvvbzSgMsz5SgzF_wRJTbxA@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 9 Feb 2025 12:08:58 -0500
X-Gm-Features: AWEUYZkNMxcUvucRgTfh_fvkcuOAIiv-s4kRjSRFKaAAInaduA1NHdfm4_cCGlI
Message-ID: <CAJ-ks9kBuw=sEFWDZPMKiPD_hU=NPtseXBLyPeSrR6eEtJE4bQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: add missing macros ->
 core dep
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Fiona Behrens <me@kloenk.dev>, Kees Cook <kees@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chayim Refael Friedman <chayimfr@gmail.com>, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 9, 2025 at 12:05=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sun, Feb 9, 2025 at 5:49=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
> >
> > Ah, I see! I'm happy to do that in this patch if you think it's worth i=
t.
>
> I don't know if it is worth it (it requires testing it, I guess) -- we
> can go simple until we see we need it, especially for a fix.
>
> > The python function `append_crate` takes both `deps` and
> > `is_proc_macro`, so implying dependencies based on the value of
> > `is_proc_macro` could create duplication.
>
> Yes, but the dependencies for proc macros are a completely different
> set -- that is what I was discussing above. And those dependencies
> will be shared across all proc macros, when/if we have several
> eventually (e.g. per subsystem).
>
> That is why, since we already have `is_proc_macro`, I think we should
> just use that. It may make sense to split `append_crate` into two
> functions or similar, e.g. having a `append_proc_macro_crate` (that
> perhaps does not require any dependencies) -- it would be the same
> idea but cleaner.
>
> Anyway, the simpler the change, the better, especially for a fix. But
> please take it into consideration.
>
> Cheers,
> Miguel

Heh, I keep typing a reply and you keep beating me to it. TL;DR I came
to the same conclusion: we should keep the fix simple and refactor on
-next.

I'll send v2 shortly.

The detailed reason why splitting host and target crates requires
refactoring is that we currently we use `display_name` as a crate's
unique identifier (i.e. both as a way of naming it as another crate's
dependency, and as its name in the dependent crate). If we wanted to
have separate target and host `core` crates we'd need a slightly more
sophisticated way of describing dependencies. I'll work on this in a
separate series.
