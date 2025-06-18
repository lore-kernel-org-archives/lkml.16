Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8730C28F5;
	Wed, 18 Jun 2025 09:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238980; cv=none; b=r2xNIWI8Txc6P+ncNh5IMAUnwxpHIFTB5rHEZr4p+AZapRlJM/D5Dw+zLQsJiN1xU1+RnWV2SPrH8Glhyv1KeAhS5AX/vn99wwAYrkewTFqXEuvwWxuidvVSstaYHNDnpOyJGsK2jOzq1BsjqG+K4G4DjjI3yhewJVY5ZkCDo+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238980; c=relaxed/simple;
	bh=lq8AeziRUxf5lvKq1yaxH+5Hh0Yx78J2T3z8FTiID74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MpWTOjdi4/Dfhd+G471w76+V5EUfXwU7+1xFd45QwGtNhAWUgqqfWr+HYlsLD/RKzhMm3sAlMSBMsVNx+tRROeUw47XKHqULimq7i1El7gdNQRf6n/c+iel1sEnBcAH+TrBtiJx8Jvax/YUMSeyqy/7eAqRJaKRdob30+7ZE8DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMkrXsjK; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMkrXsjK"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-312a806f002so1078213a91.3;
        Wed, 18 Jun 2025 02:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750238979; x=1750843779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lq8AeziRUxf5lvKq1yaxH+5Hh0Yx78J2T3z8FTiID74=;
        b=aMkrXsjKf/asoAbSRceIuy5M0B0lFSlItOpgkSXCMtiXkxD38Qe6iIrcwl5mfZEabe
         vfXw4ot0PZzHPm4uDkqthj4KdhnUmH3xiIWLVrKQIHdZYEwJfJWRgi1VUzyW1ATjjMER
         PBpZ+Krgt7feDPs5sfeG/qJMcyd8xMCpXhuoqZwDr8+MMuqPa5asuljXhFnYfCVLoE5m
         bL/b2aBOCVbeS/FPx+PkAtR9LrE2Ov6w3WPSUe6k41o/9aaFPsTZzNjZOjUmNDdnVJyJ
         XSngQ9B7ffLP1JWl7ZktEUMzaSS6CiIHnXeLkFoPT2yGtueaqHHOaMzRbf+n8MgvaSmx
         bCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238979; x=1750843779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lq8AeziRUxf5lvKq1yaxH+5Hh0Yx78J2T3z8FTiID74=;
        b=aB8TNxNig8a7f0WWD9iphjAc6zbHEZ+9FR+OMtIuybMWGcTSYj4W+P5MmYjLEg76HP
         065D3U2TxY64lvy2PVCjmxbZiFYSEVWo3/D9z5ccwgOIRu+sSPMzJkf6Q99Qbh0yndCD
         OGsk+6MuOznK6EzbKqeqLRB1r7E/D80u4yeqYW8qdiiQ+f29BgAerilYRsLt9CGHUc1M
         mXqyqx73o9KKtAuIQ/yF1BpK5UHdF2jP/SBr61YIiEQyv8MMlnp+YPDh++M0rczUl0Xk
         MLIweHp9qXNjCyX46I0S1l7LvfOkEaAJVIyKNaWxKxOvBhFOLljwC8oqn03kcNCC9VFX
         dqSw==
X-Forwarded-Encrypted: i=1; AJvYcCVdxlE7q5x2l51Kho3P3S5YSwf6WzXPKPoYKhLyVe+st+8YpJ+yJhqiMx0DmQn3/az8B6fiXhXnDdM4n/o=@vger.kernel.org, AJvYcCXJudqmo7LB/V55N1vAcB5YIRY6kuOcw0QgP7T3JDUzl/OChyZZXlDxlstwdw96ZJRrEZ7eLZKHc/z4RbTT+CU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHB8t4zWT0+Iu0cA2mVUFiYVZLCjYLOMbfUwC7kRW/1uz+F5MM
	KsHGhrLftjzYgN2sREr4j4iQEGic6o4342oiTTbF/BlvcGNzYdGUzqoW7R1rj5Hrq7dLd8z0+gT
	JtUFw4VtT+vHYe45FaZzBvc7FoHzfQh8=
X-Gm-Gg: ASbGnct259VGZCVfud+tf2j8wH+Pe0COPNx1JjartTQbq7+XgsOlUISp8SIBp+yCvFC
	KEJxk39vRzLaqnLRh2AqfdPQ/T/a88SxEWTvCymbxTziwNIV0/M7l4KhwpfKhrbpviW2hM7ootO
	JrzuRV030CgRpuKju6+I1Eq2gOSRauQV03U71hEadcLGw=
X-Google-Smtp-Source: AGHT+IER8vbUdfTwJ92jRmQyEnCwVC/UzLa/zdhZwkUq4ZgFiBGWzS8qvQmSwKmOywmX0o2u1e/ZkCKaQ6QBTgjm8/Y=
X-Received: by 2002:a17:90b:4e8f:b0:314:29ff:6845 with SMTP id
 98e67ed59e1d1-31429ff69fcmr3047658a91.4.1750238978667; Wed, 18 Jun 2025
 02:29:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617144155.3903431-1-fujita.tomonori@gmail.com>
 <20250617144155.3903431-2-fujita.tomonori@gmail.com> <aFJzNCCERjKHIVty@google.com>
In-Reply-To: <aFJzNCCERjKHIVty@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Jun 2025 11:29:26 +0200
X-Gm-Features: Ac12FXym1bM_3VckxSZwWR3iLUNrBIeF26Hy4dwHA1O4-hsUxddODKnWT0y_MmI
Message-ID: <CANiq72nP+dKugMv3KXdJJsFE0oD01+zYgWbjz3e04kmhj_5MbQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] rust: time: Rename Delta's methods as_micros_ceil
 and as_millis
To: Alice Ryhl <aliceryhl@google.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	ojeda@kernel.org, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org, gary@garyguo.net, 
	jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org, 
	tglx@linutronix.de, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 10:05=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Why are we renaming them? The stdlib always uses as_* or to_* for copy
> types. In my mind, into_* means that you want to emphasize that you are
> performing a transformation that consumes self and transfers ownership
> of some resource in the process.
>
> See the api guidelines:
> https://rust-lang.github.io/api-guidelines/naming.html#ad-hoc-conversions=
-follow-as_-to_-into_-conventions-c-conv

We may be going in circles here... I think the confusion is all on
what to do for "owned -> owned" `Copy` non-expensive conversions.

I think Tomo sent a patch to change the `as_` and `is_` methods to
take `&self` to be consistent with the guidelines, since they say
there is no "owned -> owned" case for `as_`. Then you mentioned that
`self` is OK and Andreas agreed, and I guess Tomo ended up with
`into_` since `to_` is only for the expensive case, even though it is
not meant for `Copy` types.

In other words, either we say in the kernel we are OK with `as_` for
"owned -> owned" too, or we take `&self`.

Did I get that right, everyone?

Thanks!

Cheers,
Miguel
