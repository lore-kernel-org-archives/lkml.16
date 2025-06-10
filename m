Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CE223C8D6;
	Tue, 10 Jun 2025 18:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749578923; cv=none; b=DoFOtKtXCTUi/xCuU//4gWsjSakXcTYVHDpokQ75D3gz47kOrssMio+ruSCSuE1k4GFpN/D44aXMGs6NuToPBFK+y/BjyjuxnptkNQAB2my8dRXCQp20r03umwKmC5PB1EcF1Z/v0kF3We6+mikFrPxwVL2QHTghmOMayoDuCXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749578923; c=relaxed/simple;
	bh=f/trB9gBdX486taEnlRRVRFjbcjtKToC5FB3GEofU8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oUzqSqBS+ZQQmNH9TMv18CLZ8uk7IRVtEiQrXUUP+JQFNEoIXZi/S+h1u6R8BudTF37+mxlbmdwbO09iBpqHIyi7njjo5upPfat6DIdDLIAWQ3kbBz+Hppx7XEtA7Hqi4rNPLxK3qBK8HRh9iP1ZzrUDyVqkvFvV6w2P2OWfAEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihdg9RZI; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihdg9RZI"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7429cbbeec6so506453b3a.2;
        Tue, 10 Jun 2025 11:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749578922; x=1750183722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suADUvyRIgj+gbsQ1buxhwTp7SrihibqlhDAOU0DAtA=;
        b=ihdg9RZIDQLndcaY6nGSPVnwp0oG/Eh4y2FE6o08zIfCwFerRJV9Ml65rsJskWjjLH
         m9pxxZR475munQFxFAR4hGvRgXpWyVc3GUzcQsHLPQoQm3FnisYYreXM1O5nDxm++YsF
         aMuxet61SRda8yVuE+PHAhBrAc0vAaGhF39kPQnRrIKHzeXOUiiM81lwn8zYFZFsrkgU
         1fz8RtWGPL1z6XEf8EQaZPHGA3XJ3TSFz6ydLCQOx0nQaN0eAGnNRGJkQ060fJ1Ey7Sd
         bkgMrsQpdcfzDE/l7dK1h0OWhG5YSQTgXheEHbBFqZJRBd1F0pZ8MJa/V8JfynX5wyT0
         z8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749578922; x=1750183722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suADUvyRIgj+gbsQ1buxhwTp7SrihibqlhDAOU0DAtA=;
        b=PsnPd4GvAgmOL5zYTaj83LdK3nFKBniy1OAJu56P74DIkt9euOdT283Dqo087Lr5Df
         kB+bPVn2eJ6taMNebazjW/aHHpDksUZTsU/lqSftaTnhAkAgq3u9F4qbeC1W8KU3+7IB
         ovAZwcHy4boBGnBala+dmStBJko2lOUyZ0ghEJlqeq4jnjI4DSduKJ85oc+SNYzgyMbU
         qJhZ7ebhKGfmVQRnxoclNx6VwXsaspJQSHBtHa1LZd5oPgBygkbmj1FgoMRhpm3J7lX5
         x7s6yPbyZFzhP93HAOyAUMlNs1HYN6/ZhtZEjzK6fl7OZia7OiBqIRgo4VixnaC3636i
         Id9g==
X-Forwarded-Encrypted: i=1; AJvYcCWUUixDtxw92HwpqsuqDwMqJNFjh6WbIrllVj28sL/tZbfOy1bmWvQ9RFj5VCwadUPBhfy16uqziAgQrys+vgo=@vger.kernel.org, AJvYcCXU9b0iZj9zEci3nuIb6mRu+dv8K1SBT8dO9DZumWnJ7DgX8XOXLyWdeczQ48bF9VbXmgiYzLbZDsF7jis=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLR7/qNCvNRoN4HrsyyHHzRdZpmrElPfybmwKtqWD/RC951Cdk
	6ZKpBl8h1dC7jAZ2YcEi6HYaYD4exDWhEaF1DS83BDkaDzeVCvRCsJd5LFNptZTQZpSljDcUdxV
	DmdcGI8xc4FdnMci02AJFLITl2TWoZ+Q=
X-Gm-Gg: ASbGncuHHLnYI+f2EZQ3yqy847hGeNRmA9tx87OTrJ5IW0/O0R0B+5IXryiRONyh/3v
	0v5qCx+WTeX3cTjfe2+5g7H2eY1WOb7grMczLBu/AKof9IoV3mVzzcSFGGUKJ1wbK27ohGX/OE1
	O2zOvsU94+fmmrSR0PMvyoKT2EWCN1NTabrgAQaEILNyJU52TLvzxvfQ==
X-Google-Smtp-Source: AGHT+IHRx7YMx9gNTUdGFtmyYApKLRZvXttKUniU0nmrXlw7DLXZOkJTFFMclU2COpIWl7WmVdBTnBmmPzFiBqrZoeo=
X-Received: by 2002:a17:90b:1d88:b0:313:2f9a:13c0 with SMTP id
 98e67ed59e1d1-313af148e83mr265604a91.1.1749578921621; Tue, 10 Jun 2025
 11:08:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com>
In-Reply-To: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Jun 2025 20:08:29 +0200
X-Gm-Features: AX0GCFtdg3QfH7bHbFpQYN2D-aolaMpTUiyFFjIYo1SJaHLKkUageKTodCLZWm0
Message-ID: <CANiq72nHzEN9D2yEkXNAWGySQADtUCW_V0YtpnCvHG=nxdeDCQ@mail.gmail.com>
Subject: Re: [PATCH v6] rust: kernel: add support for bits/genmask macros
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:16=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> +use crate::build_assert;

You can include the prelude instead.

> +            (1 as $ty) .checked_shl(n)

Formatting.

> +        pub fn $unbounded_name(n: u32) -> $ty {

We may want to have a comment inside here to remind ourselves to
forward the call to the standard library one when available (1.87.0).

> +        /// Creates a compile-time contiguous bitmask for the given rang=
e by
> +        /// validating the range at runtime.

I may be confused by what you are trying to do here, but how are these
`checked` and `unbounded` ones compile-time?

Also, you can probably simplify the macro `impl` calls by removing
parameters by using `paste!`, e.g.

    let high =3D ::kernel::macros::paste!([<checked_bit_ $ty>])(range.end)?=
;

> base-commit: cf25bc61f8aecad9b0c45fe32697e35ea4b13378

This is a fairly old base now (the patch does not apply cleanly).

Thanks!

Cheers,
Miguel
