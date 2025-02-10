Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C54A2586D0;
	Mon, 10 Feb 2025 16:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739206326; cv=none; b=s868+WptyHmcIFiJYDQMo8uyC9WDnWhUcnA4ypyRa5pyXdTY3RD/VHeCh49S7EpgbZjAHzQwvf5mywbHibHoibLxPSSuDTLyGF4QY15+xzrWdyXITByeCRenomM8w8zFnbLgJI+ctVqprUZmh7GPgheensKp4E1SHZEz8Lm9By0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739206326; c=relaxed/simple;
	bh=7ECKvYjnKAOWsTCz/UAestf8pnTvGhA+2SxD4HYkWaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h6x4PTGYLySDkMWVUx864JY+0LsmMTLYY/liMcHUwBH1cCyEg8QtWnpy/8llg3d9YZHayQ0D3R0a6PjQuzgqoQTkckMW7o/KbRYLfomhwHgQ/64xIkj4wpVfbG9KGL3UjaSNc12VMWVscuaoXT6wxjTsb8PUILbfhomuFtAtvmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhT1iTo6; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhT1iTo6"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-308f71d5efcso4649761fa.3;
        Mon, 10 Feb 2025 08:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739206322; x=1739811122; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ECKvYjnKAOWsTCz/UAestf8pnTvGhA+2SxD4HYkWaU=;
        b=AhT1iTo6Cvfj6G3gzLehTm3+zDgs8uJs1KakFGSnnuFSWM8EbZdPF+yuoJE8pDLv+S
         TMimoNy//BBcV+T5zM2zVRy2jXVghxbmqCRs/PyTufhvibd0n62eSYAgRADTlMy/C2E2
         wsTLZoDfx2T4pm8YgsgolQwSKTscDRWuaEuPPNQjl1DuTrytciuxxr/sh3FR/bgnBpa0
         mSA7Wd4nEkYWnMPs7hJAtY/LSioohUQfuqy/xNtbyfFjM11VHC9BfxdBcjzHPBYclSzO
         whJ59lWvJ0967HcEQhS4nNAh18Tzob9eTy8Q/2q1cYC0Pp6uxDmRzl8nqOg1hjy1Do8y
         la+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739206322; x=1739811122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ECKvYjnKAOWsTCz/UAestf8pnTvGhA+2SxD4HYkWaU=;
        b=l1S4pWvNjWox+L7JR5TST82fdyDEgU7bwStQ1D+ciWqyjcITYKcEcR2PreI8+JJGRc
         xQcUK34ApahDpu12t3ISbCn8dwxoZv2AxyP1WuZyO3v7306DZ4ccpgS5vEQOBg6WFN/X
         q9nJaqhIe8ozr/LvxV6oNVpgHGtJE/MmRAZklbUq9yzOYNvGYC1APK24QkvO1344pR7/
         dQGdUn/xQnU4ep0SCerK54S2yE4EuJ+l1Q4Ji2sRtvkw/8yzExevtG4l1W6VB7+w517+
         3MFC5CHaKznLDnS77h8zQvQoB1q2cFSn4FguC2wcu7LqdwvK7YCfN4QluOYTM+GmGLSP
         RZ3A==
X-Forwarded-Encrypted: i=1; AJvYcCU0LTEPiWkH6mqP9z8RPqdvhdIcEIXN+lqw1ykDPQ+sTPHXChXIungiblXj8jHSSISiI+vO001Q/vVA5rqv5Sk=@vger.kernel.org, AJvYcCXttYyAmU4Bf/6GIH2TDOSKjbx3bz8KfkxmS/7Z5Z/DvxJvg3vhNIF3RR+i/X73EDzzrNBWLDNYbetyRd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN91bnjctvBJD1DivWg5jphJe5k+G8S4gWdPqMklWuknPeFcek
	2FVOUzjKw9NTjWjsIxGVdj5/yuEfzURva4CO5nFw/EwDZma+ctgRdktEGLH8TrIEr0lAaPEkLek
	Tuc2ikSXnEuFgYYT3dYa2fuPdq/Q=
X-Gm-Gg: ASbGncsh5clicc6tgnZekuQX9ZV16cCasFN+r2IhxDoLNFMFwe3Mwv8hw4obU8LpGM2
	c03HDU9bRXmHL06YTAk405h5CBerl98WLnSmqRurJTrHh1sEGTv7vWz4Sgg6TZNOJtgVniI+wUr
	9gqj5d8Am9qonN
X-Google-Smtp-Source: AGHT+IE5InQBAspnhmUOUgK4eO4HVcDUiJWnN0PsAPvX6dx818veoTWgNP3LaYoSDxBZ4XuzCZrKJkeGp7wWpvY4pXU=
X-Received: by 2002:a2e:a98e:0:b0:302:2620:ec89 with SMTP id
 38308e7fff4ca-307e581a2e9mr44795951fa.19.1739206322179; Mon, 10 Feb 2025
 08:52:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209-rust-analyzer-macros-core-dep-v2-1-897338344d16@gmail.com>
 <87a5atbw1j.fsf@kloenk.dev>
In-Reply-To: <87a5atbw1j.fsf@kloenk.dev>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 10 Feb 2025 11:51:26 -0500
X-Gm-Features: AWEUYZlrNNC1uhcEPWMffnDCzT7CJLvQXBkUysGirQKVu84IK3j87iCPzAmOjBI
Message-ID: <CAJ-ks9m3SV4ezHda0cu00_TRLwY8mNg+GxJrji+FQMs=mfuL2w@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: generate_rust_analyzer.py: add missing macros deps
To: Fiona Behrens <me@kloenk.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chayim Refael Friedman <chayimfr@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 11:32=E2=80=AFAM Fiona Behrens <me@kloenk.dev> wrot=
e:
>
> Competing with https://lore.kernel.org/rust-for-linux/20241205115438.2342=
21-1-me@kloenk.dev/
> but I do like your aproach more.

Missed this one go by. Sorry!

> Reviewed-by: Fiona Behrens <me@kloenk.dev>

Thanks for reviewing! I'm going to respin v3 that looks a little bit
more like https://lore.kernel.org/all/20250209-rust-analyzer-host-v1-3-a228=
6a2a2fa3@gmail.com/
which is the proper fix. If you're OK with it, I'll keep your tag.
