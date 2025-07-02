Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948A023BD0F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751452044; cv=none; b=U4NtxHJkmBcYrUp1f38Q4yotI9k39pt+KTNs4EtxDGjRxw1okpk5L2XtX+Ya6+OOgEODPvwIHY4RYkqGA/Ps/8snb3Vt9oxwleoAqfTWLLYXNi/MpDjme5yieMQz/tYactviyigkUzephxNSyJmwuRUQYbkVVc6J1TPU5+26f7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751452044; c=relaxed/simple;
	bh=e/2DidzQn91ralezgjwJALoi1TnJjVxKoJXQdqSYZ3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qZABE2VW1QOPbZechTVk4JcJm8JIthUBPvkw3OsZ64imDFm+pO74vO33I0maYNQTRgOH6/+iGiJ+Vn67txGxoDahDklLGbB5iWxuLm/kIWNcFz1/b+aQKCLefLtzVATLJx8qS2IqjotSSdrSbw7yOUiK35GILIbW26WkIitMte4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XfaFzWnQ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XfaFzWnQ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a365a6804eso3561953f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751452041; x=1752056841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/2DidzQn91ralezgjwJALoi1TnJjVxKoJXQdqSYZ3c=;
        b=XfaFzWnQEuptvfWwIZRlXOtONgn6f/ci1l4ctOx6ghUq0jWxepAi8x/GI8HmuAkIiz
         UOQ+ZD15fwAH7baXX5Xs1tOECYHtUBgp6vw60jGCSO990NLk8TNRLTNQgpJD8OrSqAmQ
         0+TyY1H4Sht8vD9elPtTC7WuYvF5gP5j8ssU8G8+1s8Sz88A1K36W9NLUw72altdB1cg
         Gao1dq5rZOpipHiu9hWWsWiFDDSm5jN8UwUW9fFEfV3uNpzuHzZIcQ9/G5nA8I1PG284
         +M2ivZsi/yY/4KrLtgmcTMp1jcO8D/LEQAJflqfdbzSLT1ThwKZi8hF8xQ4bhVShbKrY
         y12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751452041; x=1752056841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/2DidzQn91ralezgjwJALoi1TnJjVxKoJXQdqSYZ3c=;
        b=MY1G+n4/XaEV89CZK+D4EgAUB0xJDoK8QzyHY/tHZiy396A0L1MWOwvR9AnItecggh
         Su+Cw4MHt4WJHCBv1VWKKQmMQro+/nvHcw9XKX019o3ITHhKFRXzawiFyTVu00jW6GjC
         FB/sZ0xOluHSxDMpTxthGYRqQMmeeWUt4qKzJlTZW3CgzhUalfCVsZaRAEER6kJLa0Ys
         MCWXWGpucf6Xaz6QCyYjaeioMoLBt2mcXTjzEJTumKfn7FbThdFF5dlURPtEzsStTfNd
         L64QVep7HSca5s2I3/OdrsVRf8ec82TEZHJBUydCLDQ/z3C5cYXy9Vfd+HO6ikEcoS3a
         2UjA==
X-Forwarded-Encrypted: i=1; AJvYcCUiyKo5Zz399697kexrNl6zb32nB6B+Y/F/7qCKDo1t2yGa2Y8XO9QPKQlfjnIlWskplWNNZJUlQxZ7oPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKB/CFle8FHTtWwADP2DBtjM7TUVz5sdNit5z98CsLkuh1nQS3
	mw/GBc6+w0z27vhTSxDkuGnSe5TLjR/XvJOVFzbFLXG7GR+5bIPWcFZ9rrgi/abgXpuA79L80OC
	qesti4XkzouPfELNJvTlre0dcfW5caeLHpedGP8KC
X-Gm-Gg: ASbGncu1yiyUB/NuAMdcflzv2aMJH2KuxIuWzEWXznID5FrrJFKxnW9Cs7dY9drmrB8
	GV90EvdZ7pmiV68OwP3BHY4dGvOrvySnSoGmcseqx9tFyIXzzcVU2WPzeZu4q9+kbQYcJfHolOa
	pEdvYDQim8i+0mnEwX0kONr6WadAOtKYCt3JrDppKRI3nrYNVn21ryVCjcraOjhYAkMLI4lgU=
X-Google-Smtp-Source: AGHT+IHcDKa52ZbBh7xXAnCYNxMEK3W7ps/ysJeG6YWWhxazrmmr2AVmHplNPOuhkyB9cQitMM0Mw35ydX0IITJf55A=
X-Received: by 2002:a05:6000:1ac9:b0:3a1:f5c4:b81b with SMTP id
 ffacd0b85a97d-3b1fe1e69b5mr1844476f8f.23.1751452040702; Wed, 02 Jul 2025
 03:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-topic-panthor-rs-genmask-v7-1-9f986951e7b5@collabora.com>
In-Reply-To: <20250623-topic-panthor-rs-genmask-v7-1-9f986951e7b5@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 2 Jul 2025 12:27:07 +0200
X-Gm-Features: Ac12FXzlflXkEllqBb8Mz1-lOflGv_eOwPN42WDgahWL-HLwQCBTeDY1VvFELhc
Message-ID: <CAH5fLgicRxTsjpBKXDrcJSibOq7HQOsTXdKEBnH1-K8Jt=S-xA@mail.gmail.com>
Subject: Re: [PATCH v7] rust: kernel: add support for bits/genmask macros
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 10:18=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> In light of bindgen being unable to generate bindings for macros, and
> owing to the widespread use of these macros in drivers, manually define
> the bit and genmask C macros in Rust.
>
> The *_checked version of the functions provide runtime checking while
> the const version performs compile-time assertions on the arguments via
> the build_assert!() macro.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Is it intentional that the macros are not available for usize?

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
