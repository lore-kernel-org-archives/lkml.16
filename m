Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04277235067;
	Tue, 17 Jun 2025 17:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750180880; cv=none; b=E0a2dRTfCYkFHXgSoGLXHgmfSm68J5fGotQbGEq//A0enxmrj+P848smdK4ERyuAMRYetCtNBJo78R/RSbD+qfnqn1dIveP+oXY0vNCa9ed3U2jEQ9T7AIuLhY5Om4SEISpk6Lk3qs1pF/W2wFv2lHUtEruYTx8DPAvyMWET1xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750180880; c=relaxed/simple;
	bh=Fwbsd1ajmQ9yoWRgDFMGo3wZxhBj2BiAE74tziItfN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgwnL3uG0VzyAFafQhqL5abjZk6CobRdGayimoZKH3AX1R85gok1WLiw+2mefzRfIzwtfcqHU3qmUVeF2lmNdvX40s2arCYnA8Fok8PhbdpuEec5jUUUWXKSEfqwKH35QAry8ecffu9wkHidjOG3oHKGd9Jl0DwZBq88yIbGFFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PrDx4k2P; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PrDx4k2P"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2352b04c7c1so6749035ad.3;
        Tue, 17 Jun 2025 10:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750180878; x=1750785678; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ipj+aTnblz2LP5Q2kLN6FjfahQfHdmFixmJPRU0FmA=;
        b=PrDx4k2PUtFvMkcw3Mk00oXldLlGtfSommllxPG12CH1xMtXTRAhUX/DGAx6nZ6jF9
         1K/TrAisETjUBYLVNUQnxJNIwcBtqI+UqpbAF3dV115wYUdeTHSuKIGQQS6hf77XKp6d
         W6jtjgJFkT8wTvkylBjUoO4bvHSV22wOxTOpbdnxGDbd/ugqCE8wKQpqelDsXnH4yxIX
         wHQNfW0FVOPWDNu3CEt+OG2IMzgvjna/tjpst6sb3LjxwZZPA2XEB1Zy3DJj3ZaroE0/
         OWjRYvaSgpKH9ghKw8CPZhBTsI59RWAk9vJzMyz2acRb9rs1bMs7hwAUQuNnr41Yku0w
         pgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750180878; x=1750785678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ipj+aTnblz2LP5Q2kLN6FjfahQfHdmFixmJPRU0FmA=;
        b=WSgTE4O1rhy7mhiXlcHPG3YUbaAR2jkDWr0PAsbkQCLIf673YJsC2qceW/InFp4xWD
         sQrVD1sZsYpMIA/kgqA4lITAh0Sm77thxCZYTLtO228uSvbH7ViCVL0MA+11w+KgOmMb
         52k7IV8HJmjNwg6AuaxrdcRyGQ3/jiygTbpEXDLbsCqPd9q11XwjFKx/5zXtBAh1DU4j
         dAzVAib9HZ+WGZeL9N2tYq+pvqEupE0/e1bWqYvnn3nJcaaXYUskyjLpitwPY56GpkYI
         z5euBLuV6vZi8TwbGEeEXT5VVSdn7KJ5ys7GaAJaMD3P8UcU3mLeTgyB10cbzAhjJeWz
         qg3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXa6cjcZpHc+06PeW+MLq86BaKR2gfh8RZ3UEhISMFDn7eoRrGJspzwUf91DYn85M1b9iKkQfFpVwM/2PkRzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxLtBq+2ku510M1KSeHgTaMtdLF1V2npn94ls2BDZfcSBffZUF
	NKjINaFXwIdgts5T9swEEuYI57+Krg5dEt0gncHgJ8YXSJNypSdpLRq0E4gOQVP+H9fG0vTOAll
	mfXsFlDox867o5TQ5pdn/lmkudqlWpHw=
X-Gm-Gg: ASbGncsfh0tEO5bqQb/azUEnH6uJ++tHxm+uhLc8IH2pOU8xu11lj7jQnaUWfJRVZvD
	e6EPIMXHI3LEBITplO6+DQIKlJoNUl6QKMIiPiFAMP/etLoJVgDW6mB0etnrPZzyRfk1/UQac2w
	auP3RcvvhveEUwDBCMg0QGi1xp5BOTdObZ/QyAbe99p/vXt+SkkFjytA==
X-Google-Smtp-Source: AGHT+IEM26uY1d388hFZfwghfd6CTp1WOfXwXNCsaqVBcEUR2ypaLMguHrdCwqsYOYXwWcxd7sX7a8xYYQgqW+6csgc=
X-Received: by 2002:a17:903:b45:b0:236:7050:7464 with SMTP id
 d9443c01a7336-23670507835mr74063215ad.11.1750180878215; Tue, 17 Jun 2025
 10:21:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616153604.49418-1-boqun.feng@gmail.com> <20250616153604.49418-2-boqun.feng@gmail.com>
 <CANiq72mZV3Ezxb4FvDdMvn=O+ReUPBx9usUahLgwTKKCFD_+cA@mail.gmail.com>
 <aFFwumsjuAEIJVUF@Mac.home> <CANiq72k+d3FzM8O7R9_WrpU3o3RygpGAS3S0Z5wPZsvC3k6=WA@mail.gmail.com>
 <aFGenbg8S36G1aeP@tardis.local>
In-Reply-To: <aFGenbg8S36G1aeP@tardis.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Jun 2025 19:21:06 +0200
X-Gm-Features: Ac12FXwAAgg07NHM6edGCHC0TnH7Ghe5ZYl3YNZDoPqcv1aJ-y5bu9zWd0SM83w
Message-ID: <CANiq72neJ-1e9Cef5RJMdJGEqWVEW7F72_J0GcDpJuEd_APrxA@mail.gmail.com>
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

On Tue, Jun 17, 2025 at 6:58=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> This actually helped me find a bug in the current implementation: I
> should use core::ffi::CStr::to_bytes_with_nul() instead of to_bytes().
> Please see below for the update "Examples" section:

Yeah, writing examples can force us to find issues :)

I guess we could conditionally (`cfg`) assert in the "otherwise" case,
since we already had one case, but I didn't suggest it earlier because
it is a bit heavy, and the interesting case is the other one anyway so
it wouldn't have caught the issue. I guess we could assert it ends
with `.rs` for the interesting one.

By the way, I would avoid the actual filename, i.e. I would give a
more "normal" example instead of the `doctests_kernel_generated` one
of the example itself. Something like:

    // Output:
    // - A path like `rust/kernel/example.rs` if `file_with_nul()` is avail=
able.
    // - `<Location::file_with_nul() not supported>` otherwise.

It could make sense to have an intermediate variable (especially if
you end up asserting anything), then you could put the comment on top
of that instead. Then the `pr_*` call could then perhaps show a
"realistic" example, and could inline the variable name, e.g.
something like `{caller_file}: my message\n`.

Anyway, no big deal either way, what you had is also OK.

By the way, I noticed a typo in "with a NUL terminated." above.

Cheers,
Miguel
