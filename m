Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302B930E820;
	Thu, 19 Jun 2025 20:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750365779; cv=none; b=mtYB/0z1MCoL0Nxi05nkPLcNYXH9THfGp/8UrRoAw6UDMk+7+TzFxKR83XHznF7FoBINMF9g5TJ9r6u1sL6ZaxUDZ/lSdcIkMHoGMcTw1ZmKeFk+saqUjtQ5Ar0FJ8+8AeFQL9oqXnNoscDRuZODdcZh4xdbN0BmSCJgnYp5NTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750365779; c=relaxed/simple;
	bh=fEwfBX72BDHJ1p8k/mUbFDkhasM2oWGT16uCGDonsm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQg6PZRuGFNsIhb/ox/pTtBEpjKSJdBC1ll58LaN9jV4uxuk1O4/RCupNFJbDKOZTvM1+tzOLjgCtZbJp79nU2/A2QQrAW2vZHXCKC8ZmaD3uP9+OXyDAi1kLk4DFcXrs9HZ/94Kng2TaxfBrAVVXGxaPOqSKQ6BiWczcPsFuvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myjIRMpf; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myjIRMpf"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b2fb9eb54d6so179751a12.0;
        Thu, 19 Jun 2025 13:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750365776; x=1750970576; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbBa8byaD2Et0RppgbWeiVFTBKZXgDvn9zUnXCeR9HE=;
        b=myjIRMpf7Wyzp2g9mDZyz6ow4ETEHbxBxnF6IlE+iFjJpIkaubERT2DODKDfirAs3L
         R8JFN/4ri7q1fQ/a3/Rl5bukhdcG3q/YLoSBKSIZ9u6fcHzJ90HducYwZuJrHAFiWXvv
         AmQfu3nXK719EAbkBQJckYDqnUIwj377toFIYH63tEAM8xza9+JNjvV2pghp1+C2XXZ5
         b70QRp9K5Q5waIrwZZyZBKGHsgwuXqc3KDB+g3C+tHdBIT9bCH7YYJTrtB6s3dEOBXDB
         ne1LxFf2xmXwoGPrM/BN1lNfiTXRTVmjYDUM0ftWxrqiXjPH8w5LsW13riYNObBurXt/
         yq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750365776; x=1750970576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbBa8byaD2Et0RppgbWeiVFTBKZXgDvn9zUnXCeR9HE=;
        b=a90mmkO7STFBEwceeU8JyTWiGfDvMTKcSiGrOU0CG80CQ/qttWdqG8C19G0kPsohBk
         6zc7R6Wh3sEfMgiBisEqGTyyFLgFr0/UkuC95UADTfVoRvMrF8T3BhMjiJlp7+NZYL0m
         8pgWu1AHehJO/+HgpaQ+ANoubdxRb6gG94X2l5BnFBgBjnW/paNJ4U1UMQdMFDvNiCHb
         NmonUwSpauhQIcgQN7BokmesctYXDF9QcPNwGf+9f5llhQoss27M6uyn8ljddNlQ30c+
         Ap6Ym6P+RiLwJ4TRvlcuK8VOeCJiR/eaQOL4d8RCkMfNP2pLioLvK5CzobWoT8vgi6vp
         OmlA==
X-Forwarded-Encrypted: i=1; AJvYcCUB/t/UfP6JRjVypkpAFtfe1gjeyoSLLE2n1z5QIW4C2jbDFuhljZvcgY4twHErsXZFIAb+T9d3YANw1qrArg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6dufm6/HaD18VegKaEt9QWwhsY7t/yfWe9pzn/Z4HnGgIXPN3
	dTKXmk/Sr82Vwj2hfcY0QPi+La/RJU2fM2UgaqdeumE4DYT0jizO4FTYhL6damyrEFnH6LQ9lDF
	TS05YaOeZlMBxZ68w/CxdG87QxX6IEdAX/k1ehDs=
X-Gm-Gg: ASbGncvB86N7J9X8NTh1uVJRz/u5UPvZhy3bhz1WL1mQ0ZsKwA1F8uPZAMhij6wo6p8
	LGnOfwoG0lsDiwBOFOcSwCmlZ8cEJ7TomEydzZTglzsbIEdvgvY5aDLRYRDu93v3ZPjMuNWXGGd
	24cvC1y/PZN5gWVCZTqzBU+ot0zPt5Z1sREQjUGn3pt+A=
X-Google-Smtp-Source: AGHT+IF/f36KVimQv4kZFi86AQa3q5FANZ5oyxKgP5oazU/tJ9vmrYgK9n0eF46cflHhaZCB+yClqjrmpjr/+eEOYQo=
X-Received: by 2002:a17:90b:5828:b0:311:488:f506 with SMTP id
 98e67ed59e1d1-3159d8dfcfemr289899a91.6.1750365776370; Thu, 19 Jun 2025
 13:42:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619151007.61767-1-boqun.feng@gmail.com> <20250619151007.61767-2-boqun.feng@gmail.com>
In-Reply-To: <20250619151007.61767-2-boqun.feng@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Jun 2025 22:42:44 +0200
X-Gm-Features: Ac12FXxM8P9Cfr_NtgW7aVwLRG9DuDZEf-dSTfYvrNJFq9KGrNN-Xbe-34Jdw1U
Message-ID: <CANiq72n7d89aHiM2fcHnEUE+9=0zyEAFmBoURi4O02w-isSiKw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: Introduce file_from_location()
To: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, pmladek@suse.com, 
	fujita.tomonori@gmail.com, mingo@kernel.org, tamird@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 5:10=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> +///     // - A path like "rust/kernel/example.rs" if file_with_nul() ava=
ilable.

"is available."

> +pub fn file_from_location<'a>(_loc: &'a core::panic::Location<'a>) -> &'=
a core::ffi::CStr {
> +    #[cfg(CONFIG_RUSTC_HAS_FILE_WITH_NUL)]
> +    { _loc.file_with_nul() }
> +
> +    #[cfg(not(CONFIG_RUSTC_HAS_FILE_WITH_NUL))]
> +    { c"<Location::file_with_nul() not supported>" }
> +}

If a `let _` works, then it may be better -- please see a similar case at:

    https://lore.kernel.org/rust-for-linux/CANiq72=3Dph_XG0TtkdsNJCUZMiAMYB=
o11eJaCTLCTpTAFXtcNMA@mail.gmail.com/

The new version looks great, thanks!

Cheers,
Miguel
