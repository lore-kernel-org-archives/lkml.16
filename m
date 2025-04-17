Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2681F63F9
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744874405; cv=none; b=r7RM4f8q656Ye6n/l7UOW/0WH4Vm01knZ2Ntb2iU+gVxidkJLmEI0V5hdKYFzFi30AxjxiP20BLILx3p9yctiGgbe58fs359+Q5/GJ2TFzb+90GYVn3VJOGp3L8fVYYwurYw37CF09ixzXdFeWdur7cTv0bC/hWeJ3W0otY3Ts8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744874405; c=relaxed/simple;
	bh=rvbzzbyIt38638XUwt2IokS25EPoQQKWLDft0IbfC3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exZ/cZpMSj5oBhTcbAxho7xrxtQoC8yTNgUK42d/H+cxtp8mGW6f/jkyq7mDtIUf9oAgkBcl/n0aScewNbIkHyP2yFhLprls9g/ggNYqPRR+6CD3aRHvBmc5+lakcBT4zXW2ca7o6FTaKz62UauqFnkf+tQJnMt1i1ecmhwuF8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=Y3oA72xK; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="Y3oA72xK"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e702cffe590so378772276.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744874402; x=1745479202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yu0QNh1tbtBnsibOOQ7JhloRzOCSdcHTsH/2taEqzT8=;
        b=Y3oA72xKM7d90dc4xU9IrFvxOpgFCUNGtlc8mWkKHA/ZALMDfUs7V1wjf1ZuCLF6qB
         9yy1DIX3i8924oVaVsn4V3A+tRmvoUJI3Ni2+Fk7DCgNzprRJblYXurwIa9Z5nVg6lzg
         LEkJ2DfoxgZV/7zJLDWwlZlgmLy1fBLw0wXptcc0v6WK+emDg84AJqLeSvlFegpIOib2
         7NxxVaQziBK/gtd0MU5JWvxjK1nzwXAivpyC9U/YXVFp0V/CG4ED24Cm2yMS+ZiY9AOL
         zy9TmG/K79ifxoIxTQTUwA4Yagnr6Fw8eHVDJoXj597aeVmDth723WUOoorDrIC2aUBl
         F50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744874402; x=1745479202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yu0QNh1tbtBnsibOOQ7JhloRzOCSdcHTsH/2taEqzT8=;
        b=t+l6GCQmwhclzjqQ2OLK7n1VfCCkTi9PiAfCSlxQz76sZoqTOj8WgPnNIZfh5myDGQ
         o5icxzGOFyTiti9uXggS6OMTZ6UBGpoOoh/WiFmm7m0SAKNwpRGTve3StDY7nAv8Ktfe
         ZdL0kYGcmN9JLiohWn8XrUsyIpr0RRXPKWQn5rjhd4vGLpca72CpYI7f5zmXjWdT34qU
         rujUq35eD1xj71S5yCWHIQY9NFicvm2CwiDk0x0+wuDmCxhHPXe4ftBZBwhEOG7LLI0u
         QMjpoMDY9HakG3HEGCSHyHR59nsAze60zQhSJqU/s8ioUFfvS6CUJWV3IH+zqviRd3fU
         uIgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRUGRw3rphNpyuji0mz9Eptv6Ot6H6A2StzBfB2hAsOTP15vr8Q+uevZx0yhsmjOy5sekUntW0qd3i8zA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2aUdSIvRzEgyZJMet+sBkLGkWyn8moM3O5AVGV71jrduRmQFn
	4WeQZMf1kyVjx3HAGQ0OotbH62CP81a/2mSBFuJC8hptk0zfDeq0JLnT1gyhxmqjmlTNJCN3EL0
	amE5i8FEiwLnjHuLzZ5lP07l2SELNo1L/vZJ9ow==
X-Gm-Gg: ASbGnculU5AhhgHQfyIhnqjcD5DZRtri5f4N/Y7Lng8uelixuhjy604vIxx9ASIbeP0
	yZsuAK07Gj2NuegfodMwKDe2DDBHKanlAsahHeFcwmMnwzwHP/7+RfRmM9VtzRU8bhhS1xwVlAj
	PJe1QIsfvy1hpEl9W2c5Ixgg==
X-Google-Smtp-Source: AGHT+IGJQAARqDZoOSPzwzCpDAzhpoGiPTB9Z+UpBz1/KjS/Xy32RpLnadI9jr0F9SZTmBleBsB0xGvMkaLK027XqjY=
X-Received: by 2002:a05:6902:15c7:b0:e60:a16c:d017 with SMTP id
 3f1490d57ef6-e7275f01225mr7332971276.49.1744874402570; Thu, 17 Apr 2025
 00:20:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-11-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-11-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 02:19:51 -0500
X-Gm-Features: ATxdqUGjGjoAzKGuMfy_tgb3N3bcwvdlNAOSKPXLcZL1a1OnfJ-Q-7dmbokdxkA
Message-ID: <CALNs47t-VEBO__NL=CM5ty-x4naHonKSPnri8uLL5j7JrpEdeg@mail.gmail.com>
Subject: Re: [PATCH v5 11/13] scripts: generate_rust_analyzer.py: avoid FD leak
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 3:07=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Use a context manager to avoid leaking file descriptors.
>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Fiona Behrens <me@kloenk.dev>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Trevor Gross <tmgross@umich.edu>
