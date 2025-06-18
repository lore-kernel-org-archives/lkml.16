Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36DF186294
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240355; cv=none; b=nEcuhhJXaxrPfBPe77Zme5zsyq0OMKxrGNKzOFeqbEWtHg52DpUuGOBwa+s503bP1ewJ8RgDzP7SBCGYSIM1++BOqkvAAO/jRNj9UgO9T1ldrIHjdocsf0IcwYztSvCGTxdoXEiXN54fwsWdX+W0yPtEtLupihSfoAkf/SK75yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240355; c=relaxed/simple;
	bh=5bEnpNZFMrj7qCJtwgu60iTdn6bjP4AVMamgtkgw4qw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Np5RsOOHruupWqb0EWPk3vjSdY8dK5qAFCqgt68tF0fF0uc4cc4ujtPAUrkUz1GMo8sowxI+Waovfq/rq7DPj2o2A7HejT7cOmuJAY8DBs0HBus2bSuoXREJy37WeR81s5lUObSx2nQuSbNCgtbMcqWdSQ1dWPD0jeMuUvjGRqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cYgg0bqN; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cYgg0bqN"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4f8fd1856so3273203f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750240352; x=1750845152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bEnpNZFMrj7qCJtwgu60iTdn6bjP4AVMamgtkgw4qw=;
        b=cYgg0bqNQij2+8nKOQbrbv7lxoh/XgsxLMhMBqvdBPePcYR6mQOqz/Gnr8TJhO/uof
         I5bvH78jzzcnXX2LaiU58vV14G6BSBjWg5ayJhfx5vUyAmI84dyD5NinGvyu8d84jRku
         +6WpkT5xkDnbLGfoEW3KILOR4Yatstsux4UBVIkrbhz4Gw6PoY+aryatcUpXeU8b/K1S
         x+yTtXSvZv9FlKgF4PlMJ8WK1OeiI2swrab1MNSYegkUK28UQmhx7DeV/yRgQzjzQLpV
         K7kgNH7Ztpt+J1wb/YwkZlVUXJGJkwCZfqbLNAWLTByWeS2SJo1ETn4URRsKyGzEk5Xu
         ib7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240352; x=1750845152;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5bEnpNZFMrj7qCJtwgu60iTdn6bjP4AVMamgtkgw4qw=;
        b=HF61NJ3fYaudPSkwz87WvYtDWnDPPan+UOOhJ8C/3In/SF29FbUXwhI/kh78+7AhAg
         gUhX3h95zt61dZUyFNIDbe9g7hRILai9aDcUeRMYMgce0n6xUfBdF/2+M/eKBxegMC3k
         QE/mtPR8/J6Y7SEIRm+95YcY+xj/vPlC9YTGIH3wxXIpa9RJKvBUi9VYmDJLotVVTnK3
         2fqcFMJyHh5sgtjfRCF3iyN+knHCvguflm/QuyYLcV7NwStWpbWALZhqw4cRPVflgFyd
         mm55KX/2hMmGoT3j2mWRnwl20YTZF/RwH+BgBE9wBpKhMHk7+icdzAsujPtviEMgzTWe
         o/ug==
X-Forwarded-Encrypted: i=1; AJvYcCVoRYG3GmF+4ZvtXdcBgXZbMZgjalHwWhokGluDgGOK3EHjpyQ1W5zh8PDYrTIzP0J3aViSRediRtecvqc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcxr/DBj8Rj8zLRFoVOAv4eZREtxoqvzp/wcmGQtHZB30pPxpS
	6y1lgmgEHIBdbvdemrjjwoP2eQWrtMxMumxbfB1J5yyqdpsXFPPWF//ncY2egZ/vkkPbX7pZ1g0
	Amf73S7kEhqATWYeXgg==
X-Google-Smtp-Source: AGHT+IE3kYpXlFdUKU3nwq2/d/ISrrwVjPKX3MaqFovbery7s8OVJiNXEcZ8fmoH61Jbhx+Lgcv8YDANMjz6Ec8=
X-Received: from wrvk10.prod.google.com ([2002:a5d:518a:0:b0:3a5:75cb:ae])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64cb:0:b0:3a4:ff01:218a with SMTP id ffacd0b85a97d-3a572e45e20mr12738829f8f.50.1750240352358;
 Wed, 18 Jun 2025 02:52:32 -0700 (PDT)
Date: Wed, 18 Jun 2025 09:52:30 +0000
In-Reply-To: <CANiq72nP+dKugMv3KXdJJsFE0oD01+zYgWbjz3e04kmhj_5MbQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250617144155.3903431-1-fujita.tomonori@gmail.com>
 <20250617144155.3903431-2-fujita.tomonori@gmail.com> <aFJzNCCERjKHIVty@google.com>
 <CANiq72nP+dKugMv3KXdJJsFE0oD01+zYgWbjz3e04kmhj_5MbQ@mail.gmail.com>
Message-ID: <aFKMXqak-mHraxU_@google.com>
Subject: Re: [PATCH v1 1/2] rust: time: Rename Delta's methods as_micros_ceil
 and as_millis
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	ojeda@kernel.org, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org, gary@garyguo.net, 
	jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org, 
	tglx@linutronix.de, tmgross@umich.edu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 11:29:26AM +0200, Miguel Ojeda wrote:
> On Wed, Jun 18, 2025 at 10:05=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > Why are we renaming them? The stdlib always uses as_* or to_* for copy
> > types. In my mind, into_* means that you want to emphasize that you are
> > performing a transformation that consumes self and transfers ownership
> > of some resource in the process.
> >
> > See the api guidelines:
> > https://rust-lang.github.io/api-guidelines/naming.html#ad-hoc-conversio=
ns-follow-as_-to_-into_-conventions-c-conv
>=20
> We may be going in circles here... I think the confusion is all on
> what to do for "owned -> owned" `Copy` non-expensive conversions.
>=20
> I think Tomo sent a patch to change the `as_` and `is_` methods to
> take `&self` to be consistent with the guidelines, since they say
> there is no "owned -> owned" case for `as_`. Then you mentioned that
> `self` is OK and Andreas agreed, and I guess Tomo ended up with
> `into_` since `to_` is only for the expensive case, even though it is
> not meant for `Copy` types.
>=20
> In other words, either we say in the kernel we are OK with `as_` for
> "owned -> owned" too, or we take `&self`.
>=20
> Did I get that right, everyone?

Yeah I think using as_* naming for cases other than borrowed->borrowed
is relatively common for Copy types. Looking at the stdlib, the rules
I'm seeing are more or less these:

First, if the method is expensive the naming is to_* or a verb without a
prefix. We only use into_* for expensive operations if the call also
transfers ownership of some resource. Example: CStr::to_bytes()

Otherwise, if the method is something that looks inside the type (i.e.
it peels away a layer of abstraction), then we using as_* naming. Or we
might use a noun with no prefix if we want it to feel like a field
access. Example: Duration::as_millis()

On the other hand, if the method transforms the value while staying at
the same layer of abstraction, then we may call the method to_* (or just
use a verb without a prefix). Example: f64::to_radians()

Alice
