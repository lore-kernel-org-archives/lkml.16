Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E0A2E11A4;
	Wed, 25 Jun 2025 16:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750870609; cv=none; b=STeTYtK/zaTtfc701EjE+sosMZ1KzQB7kGtXRBnOiSzxhC3tkFqPlH4/2EKc9dTNIx3i39EphCZ1Rwxarcsh4l7JuhEusarwEEaheu/dx9kYRDc41BTch70kFi8yfmd5rxj1sW3jDnu+ne3hqfeJ49rh9BVQxJzZ5xKEUCCMuRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750870609; c=relaxed/simple;
	bh=/yJuaZm1kfnnTUIDik8a/i5phYdhtcwPtDFfSM3pngE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ic/c96oNU5rA9xa+ub53HzdBrUc4zk0+R7wQnBkVvhmkO6FwG+Ww1cfT4EoKbODI2UZjdSmxyBi0QmqVaucXGk4HsQCgs1sZpllQB3vyxZpiwcxEiFUErNK7b6ju/a6rsCaZv+Kq67kRXLl1k6wo39NUm85g1/N4KBg/7bXDfc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isNlvr8z; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isNlvr8z"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-312efc384fcso3838a91.3;
        Wed, 25 Jun 2025 09:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750870607; x=1751475407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6WTH79hQK6NLtAht/80ecYDCXoA4J5POv3PkbpHQOc=;
        b=isNlvr8z6fu/WF8SKmJxxuXv0H2QEpT0VkfDkfXxID00uhCEr4QGAquXitq0/Wa6hm
         DZmCqa5IrVmn0KjdMsp1Zzo7VlCtXvUSBhhpqiRxzLHdS5f2FC8RbkJKfcG5uQJyiipk
         d3RO1FWFjGY+TW6J7GbgDSa1jze5ZUbbPT0XcLdWTM+s6E+sZuhrfQ+CQkHAPYk5hJkZ
         gplSnhyFDncZAdLYEBBosgu1x5VXUYjUz6lFj1wghhHEs/9S7hLY+nk5v+C48Xzb1Sb3
         zHIdT+CxMGc9hhsB30vfUZIUBLFWxyaVWeziXj0a4M0SaRdSnES9oYdsXE+c6lGWvvZa
         uzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750870607; x=1751475407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6WTH79hQK6NLtAht/80ecYDCXoA4J5POv3PkbpHQOc=;
        b=SCb71nV55PZawtnWq9HAU6WPJDWHLUQjMNsinZCq9CSO78mn80cuf41B/qmQWWLRA6
         bRwlyGQ8NCfLMts9Z/go8KBOW0GRKa3YuoN5VXoaRtDPjsKClMvVrHlDoSVW8NcNx8us
         LFZfTwlPEAZuQfR9ZigYlbHRfqAR9oip4SC+uVkxLB4nX7WVcghJj84nb65r9r5OF5IV
         wD42hA2AZp5tF8M//Efnt+BetYSE0txvbnVzomLBrG9zuOjdvg5OLZiBreNukcXpr02M
         IGf4JYSzaj7tEqKS1GDzNQS41i6Q08M63YdGEWZZQTtxAfRJNkqZxqaL/XAk/LluA6JY
         ESjA==
X-Forwarded-Encrypted: i=1; AJvYcCWV0nfD05JrnBn7qKza9LuJwSJNjozowmdbgdBb8sARYL81eSGPhQxAAhLakQ4xHesCFw3zDK6N4G1mFa8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPRrBb685MA9vxllWA3A5gxHqe/hg/wTcs0rJNB404MjaAX+w4
	a5jab0kiTP4GlSkHIxkizdk1onA7SYvv6ExIzywZCpsSHyP+LGVIKT5tYDErYnjJa1vT5Tcn/Kh
	XVeqIOUowWrM7GPGbeXDeuDu9DMRJOXE=
X-Gm-Gg: ASbGnctK6VylYDcv8pCY1sDbFctEluLzLIEGbIH7v6ga2Oauoe+BgM6GkXL+r4v481z
	lTRtwPgihxcsyrp9OV6Z2L+oFwJNfLnW/xyIjsfJXHQtdhid0V/a+qBHJxoWaReOZV4KNrut/R9
	wZKkZgrNMhduRii3nAEg7K3NhUvoc1zCLu+lkeYBKHSGE=
X-Google-Smtp-Source: AGHT+IHgnR4DtVMaUu1NN1eLUP8fU01OtdtxkGKoYiBlYVDiZIDg6nSBdKUioPP8VzF4obtTDtEEYLx0DrhiLekpVBQ=
X-Received: by 2002:a17:90b:35c6:b0:311:488:f506 with SMTP id
 98e67ed59e1d1-315f26b869fmr2043554a91.6.1750870606969; Wed, 25 Jun 2025
 09:56:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625134245.14505-1-work@onurozkan.dev> <288841750859443@mail.yandex.com>
In-Reply-To: <288841750859443@mail.yandex.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Jun 2025 18:56:32 +0200
X-Gm-Features: Ac12FXxA_3SvkBY_uiyufmsKJE9szL1QD7gdDjzY-TXLBqKQ8FB9qg3HMXrDdlI
Message-ID: <CANiq72mTvvNA+VGOA6vC5b=QTMKGDDG4TiidsRHbK6ceU_iZJA@mail.gmail.com>
Subject: Re: [PATCH] rust: add fast path to `RBTree::find_mut` for empty tree
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, 
	"gary@garyguo.net" <gary@garyguo.net>, "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, 
	"lossin@kernel.org" <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>, 
	"aliceryhl@google.com" <aliceryhl@google.com>, "tmgross@umich.edu" <tmgross@umich.edu>, 
	"dakr@kernel.org" <dakr@kernel.org>, "mattgilbride@google.com" <mattgilbride@google.com>, 
	"wedsonaf@gmail.com" <wedsonaf@gmail.com>, "tamird@gmail.com" <tamird@gmail.com>, 
	"daniel@sedlak.dev" <daniel@sedlak.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 3:52=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> Oops, I didn't realize that `rb_node` was a pointer. Please don't take th=
e patch seriously.  :)

I think this reply didn't reach the lists because it uses HTML.

Cheers,
Miguel
