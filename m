Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DBC2EBBBA;
	Tue, 17 Jun 2025 18:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750184553; cv=none; b=RQ3ww8TeOu0oT9Dk/02zhP3+Jl2Ua+nsFaLetb117JCqhFiXxMpEG4f5NwKfKfyWBmx9l27A3E2ZCWXY3ZBUa1ff5A2Z4yxIROGdBv2oIawubOja7FjD93ZSogskgsX0jmfhMz8C7h4oYIkzgfbwlNmcpCtaEt2wUtN/PEUsPu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750184553; c=relaxed/simple;
	bh=GMjD9IlbeanQyRJKhX3YvPaMSGXGDASMPMeejn6iFFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eCkwsyVb1Aym/kAwk6h24XHyyy3QIy6RRDoFE0RM/yQDrzGUSePpulRfbClsf+1cSDm+5XIkOwzRXjGxfWncEQgHAT93Ce618unctN3JMuSmz2fLkQzlE1T6fLZoO0RPwuUFnRFkwSvSo6Sg21D8EVMj4mDrErc/2DqgyFqlg+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCLb3XRF; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCLb3XRF"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-31384c8ba66so1116837a91.1;
        Tue, 17 Jun 2025 11:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750184551; x=1750789351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMjD9IlbeanQyRJKhX3YvPaMSGXGDASMPMeejn6iFFM=;
        b=DCLb3XRFTJDyH+GfTLiOz6zb8STj5iYmAQpkMI7gbZdj1MNPqGknqmE6zfib9mDtjW
         cQI9hsAfhEkjzeDMtqhGZ6k580hd7s6aX3EeCy/u6Oiv1SGHurkWnJwzDZW1lL2+t8JX
         Mj24nJuxXuGUEASWnqO+2xuKb5jJlZ8nasi7omPWN5OZmt4LcZ2uPaQoBVUYGigvrdkr
         A2oBrhM2KBpZ95hmJeXHyz7kcDRXczT9mSWQC1ruKJxmys8EM4riD5YPujVqtA1g7C7d
         FXh2ftrN3BcLJCkUdIBzphiasCxasEnvPTqoVYtHyRNDj/MN4s+8S4uVdeBteQbmcKW1
         Buew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750184551; x=1750789351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMjD9IlbeanQyRJKhX3YvPaMSGXGDASMPMeejn6iFFM=;
        b=Gtfm0Y3h894p492oT2bDkEZ8aB3O5yo1sOVvMOmA/ZjiXxdzoDHPFT9gwiWOmMBxh4
         Bw9eOEKbfh7vNDjLSJRIEv9Im5lWzlCVsYQ/TwIsIlIJKEfxtEsKp9x+T19scQ9IxIFv
         uTzixBMgpy/3iPGqqj0ZLnW0KfX0ZFlOX9eAKAhnjZyeNl1eaYQtvgNGVlIworC+jrFc
         QaspbtYEP5/Yqxt9YX9gco/4nrr1KACJdsOxiRKOQ7NNuVsgD3CgfR9qV+VlUxP+GFRi
         zzj2YrVvtLNXnZ20PrDmbZ5WvEEuZDn77bw9piH8wFmK8fHopfzxGsxfFHiU5CdkU5DK
         M5CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVPocT/DnYHPMXkW5J2G3sA5jgeixX3t4pNLxBXtVLV2mp09uWBE61lTOHK9SvWVigPTqPmK3gjLtVlMhUzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG0w5wFfneQJrhFE24Q9kXwX8qsMQyFI0HPFJE6mqjVpnB+LRR
	IVVMGNgk5/zxFXz3YYDmMN+jKjbpsDxih2L2pO6txxl2zuUdMOR9AjYDXyUNGysOTcy0TvkBVPj
	vOJRjgIVh9UrlfmIJ6KJOfTmba3VAuwpa1e4XUQjuPw==
X-Gm-Gg: ASbGncuYAS2ntB/5MP2Iz/RoKgXKjDwmADTUsWM8YbWAUSHoXKye+NVVBiRvFgVDhaC
	msLSJtzJnlsGsmZuHGrlMGs1PnndtKy/FJ3nj1zzQSsXK+jwVc69vdF6WjoARF6VtOIBbhABKO1
	ox5Ai94X4djUX11PYq/jmMbh/73ezvwMTYUyquJBhQEF2ZbzUGJPF7kQ==
X-Google-Smtp-Source: AGHT+IEok9EkWU1PyvQArBiOmY1lFE/M9dfXUKUzx+OX+ltftkLR3S+dKhtOv4B7I73Sz15a74hOjVvs/enTobgiPRc=
X-Received: by 2002:a17:90b:268a:b0:310:cf92:7899 with SMTP id
 98e67ed59e1d1-31425ae4ce3mr2343559a91.3.1750184551546; Tue, 17 Jun 2025
 11:22:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616153604.49418-1-boqun.feng@gmail.com> <20250616153604.49418-2-boqun.feng@gmail.com>
 <CANiq72mZV3Ezxb4FvDdMvn=O+ReUPBx9usUahLgwTKKCFD_+cA@mail.gmail.com>
 <aFFwumsjuAEIJVUF@Mac.home> <CANiq72k+d3FzM8O7R9_WrpU3o3RygpGAS3S0Z5wPZsvC3k6=WA@mail.gmail.com>
 <aFGenbg8S36G1aeP@tardis.local> <CANiq72neJ-1e9Cef5RJMdJGEqWVEW7F72_J0GcDpJuEd_APrxA@mail.gmail.com>
 <aFGv7-0PzewfS5kr@tardis.local>
In-Reply-To: <aFGv7-0PzewfS5kr@tardis.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Jun 2025 20:22:19 +0200
X-Gm-Features: Ac12FXzhODxJBk8E1aEoAPmjzCbm-MB2k_WB5dq94po7gW2TN9SyifboMUcR0aI
Message-ID: <CANiq72mtkhZ5uhCfQ9WhLHWdC96iHCXTra4OXChGb+qnpRKNTg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: Introduce file_from_location()
To: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, pmladek@suse.com, 
	fujita.tomonori@gmail.com, mingo@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 8:12=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> How aobut something below? (I use "" instead of `` on purpose because
> the output variable there is a string)

Looks much better, thanks!

> You mean it should be "with an NUL terminated"? Or it should be "with
> a `NUL` byte terminated"?

Ah, I meant that "terminated" sounded strange to me, i.e. it sounds as
if the NUL is what is terminated. But I am not a native speaker.

I would have expected e.g. "a NUL terminated string" or variations
like "a string terminated with a NUL" or"a string with a NUL
termination byte", if that makes sense.

Cheers,
Miguel
