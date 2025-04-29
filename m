Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1A520FA90
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922655; cv=none; b=MWEt4MF/QJiuB1ySfCO8OuI8965kl12fB1e9iSLirIPvxunafbm6+MQPupaz/1asgA8A/1ayQVlMR8UffJHsI1y4yCDjqEiWKTC8Ld+Wo8f3lw111J32KV+31AHivCcCLC/UjViHBWa1zC5NHSv+Nfd5njcsr9eEoACG2VRm8pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922655; c=relaxed/simple;
	bh=04voz7/BTZUb5byXuw1Puz41gaRYXd2u6G7MthIyJKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CY2ZxWiRscUAZCqO5tTo5ymXFij83GkvosPZ2OJJZF3qILrOYBZy2/rHYvs51UnOMi9DIFX/0HVri3KTx6ChAVWRiALcQME6KniBPtZ2tcLR3x6eqQRxD+d4Kv0oyNNCdVZz8Iob46bmfsCkXXGhq7NKGThuagRcnIglFF4k6pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OMaD7Voz; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OMaD7Voz"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-acec5b99052so136744466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745922652; x=1746527452; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiBauZO2ElGRG8B3vbx0E57UweONyPLJm2l7Gk1dbO4=;
        b=OMaD7VozvpMa4bkMVEieUrp5t3Ku1QDn9QTLxKgp+aiZwbOUoQe9VrgQQwsjM2SyrP
         KSIo/qKYU9aSwegcncIM6FWe9SsSs0Xa0Pqjd3MIE7JIivLMZYK5Pb1rNn+vbTeoRX5A
         iDvTrl7ICn0aKvdDbxC+4P3/PKbTD4wVp7Qh6i1C2iHlfdqGfbAcjcmsx5teBYKmxWPN
         WbhjTOW5wu88XNR2em8t6vJHWB0aUTLEJBunir1g2XwOb/pkz9xPBk0YVs+GLr+hf28N
         7c1rY4r4yHgtnI8xOfn84M0ZsOu2s6duICPq+IZ0rFmjSLMwm6ZOD5p0PamjR0Bzf9if
         W2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745922652; x=1746527452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiBauZO2ElGRG8B3vbx0E57UweONyPLJm2l7Gk1dbO4=;
        b=AntoxmrRWjQ9+3zB2InF/7lhW8q/7WtEeDq9pguzZBYsis8zTVJZ3XMv+Rp20325FQ
         MRh8Iv++pA1agenld8oqjeFXQONfq5tmhy5v3jvnGGzbWWW2xyx3Pc0DpNggOyQjhuL3
         TbMYik4s7k+fKVM8l5qQdaGLcg4vnAoWZIakyMjNIE6PEFYWdpmx2Qgx8Bnur86+18Rw
         mv6OyIFRssMpDuainlyo5cfUQ1IdqlzKwLFFxZAGNjw8WM0jSQD6AEQuVjLg9CXMQ0TK
         j1XuSf7bn6zAuyhnDMSJhkmy31VaWLptdys9P3J0BQMgdbOuoFVJdbb+dURKu5VIX2th
         B86g==
X-Forwarded-Encrypted: i=1; AJvYcCUf+Q/HADwQOqJJR4alPwOdXO2U/Yc5m1kyeoAhhmRziZUL17CSgTVEPmsmn5zHz9iBFwPbSMGgTX7dUzs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxan9HAHudq0+OtJbvq1ept37ljo6HahPgQH06u64pvZROcPqwA
	OjZ9MyS9a+1bhFepIgiVk1MHYCnasOzWI4Sq0y/qDeoV2zQNJtPA+oq48qfI54yD6pe2/91nsD6
	cK75E7vqOvYvZsSvKLA9AOgSR0pp2PzBKik/IVmjd67WtwXFTBg+5
X-Gm-Gg: ASbGnctZ/0eZF6Q6PkPPSQ5ukSgRh7sZmuL98ywgZ8G1TAe13rwQoj/l2qF8kvjHCR+
	g2N18f3QUOSfA+1n/ieeCvAbCC/FdmIBXcpDj1zTd/lTCuMNd+GBT/00g5chkImk5dcDOdMnowO
	X6aCWneKWHPN/X0l+07Xwa6NXBAkRVtDbnPHXeagUaFJCnWjxEspcTHhLEe2ClB9Y=
X-Google-Smtp-Source: AGHT+IFmHKm9kqNhujcVpdgOw96B4rLpnKryxzvvMQ8LDiaaEUClLTQnJ9pgBvY5KlSnoISbcndqYP37rgcSfo6LGIU=
X-Received: by 2002:a05:600c:3547:b0:43c:fe15:41c9 with SMTP id
 5b1f17b1804b1-441ac853dc1mr23585585e9.9.1745922640597; Tue, 29 Apr 2025
 03:30:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
 <20250429-strncpy-from-user-v2-1-7e6facac0bf0@google.com> <aBClyLz4y7a15WMg@pollux>
In-Reply-To: <aBClyLz4y7a15WMg@pollux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 29 Apr 2025 12:30:26 +0200
X-Gm-Features: ATxdqUFa3J0LW17Z4A1KkrE2MYyUXXKuptQZ7VbxgSdoPeqBASznqKjNgJpcxCM
Message-ID: <CAH5fLgj_wW=8XgdnceHGv=VL19X_c3es7w_-QDqgK7+PoEcdZw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] uaccess: rust: add strncpy_from_user
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 12:11=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Tue, Apr 29, 2025 at 09:02:22AM +0000, Alice Ryhl wrote:
> > This patch adds a direct wrapper around the C function of the same name=
.
> > It's not really intended for direct use by Rust code since
> > strncpy_from_user has a somewhat unfortunate API where it only
> > nul-terminates the buffer if there's space for the nul-terminator. This
> > means that a direct Rust wrapper around it could not return a &CStr
> > since the buffer may not be a cstring. However, we still add the method
> > to build more convenient APIs on top of it, which will happen in
> > subsequent patches.
>
> If we can't think of a use-case to be built upon outside of
> rust/kernel/uaccess.rs, I'd make it private. We can still make it public =
should
> we find a use-case later on. If we have one already, it's fine of course.
>
> With that,
>
>         Reviewed-by: Danilo Krummrich <dakr@kernel.org>

Ok, I can drop the pub.

Alice
