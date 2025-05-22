Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F49281519;
	Thu, 22 May 2025 08:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903504; cv=none; b=fKtJDqlKMVOAh1lWIX/ZS98qvKl7jh5AiDlfh1HcRe4Fi0gcwv9Q+SZeQVBOqgNEYL66GOWjfpyhV+cFlC8vw7YnLJo2ibQvir5fFOFyjyKrRA+jDhuf9k+tVkjvRaajNiWr6Yc2jIEf9bwv0hHaQwYJvfml/P5QU/emfzQ+h/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903504; c=relaxed/simple;
	bh=e9dormL9HrrIAVH/MkapwqpUc/OQw/GWiqS4n86n8Ls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1/IJYmM2BOCB6FzRAP92i/8Qvu0vwGFqCJjF07PeDj60QJgMoU+HdbQm9f6+A+GjXtNRPe7OLH6owP7L9RUn02v1wFLRXQEXUcZsXlQ0XdIMBGmmBZtZ5F9HkWYTKQ0vUQgDkkXREBfLxVltdALJm4FgMrJO4kPCw/X1QgOKCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbmSFQgt; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbmSFQgt"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-231ba912ba1so7726035ad.2;
        Thu, 22 May 2025 01:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747903502; x=1748508302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9dormL9HrrIAVH/MkapwqpUc/OQw/GWiqS4n86n8Ls=;
        b=bbmSFQgtaHusxpP79l1qV+v+FDQdYyOnPMHOAIjs6t7mvqGiO0FzX+TrgkDN3kOsYN
         A0T6zS7XolAQYSzqVVm8Pgc3KmR7p69LZDHmcfDNNf0jg27sDHAG1xSAANmPeSZho9L6
         2/MGL3IiNJLyftJb34HIZGx/J3xSH9dyXJEWmHUFJHvF4pNCL5NE9bFg4ChPpxrEo3FI
         TbvRvwSDsxrc6zO/SzqHBpz/NvvvS3kkK2Jt9TzUsoaGVDaz3ajWw0QKEmvObvFe7AFf
         bfzOH5OwwAz0li089w+w1iA3qoiMT2ZZNJ0Ch0GKI4X4hs7C62k1X5pUnFL20n+SIrvD
         f+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747903502; x=1748508302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9dormL9HrrIAVH/MkapwqpUc/OQw/GWiqS4n86n8Ls=;
        b=tVQ/b6fRGoe8jSj3VljA82ebxLGJScdAUeFSl8YD35PYj/XfxWjuwOnmiCNtKFTRdT
         Hb9hwZYsUZo/PIh+m04iFBxUIgW3FUlMJINgl6wcc6/sOGvobWRjZ7hJfR/W1fvrLIAt
         aRopRtdAtMZb7xzPGzAdKRRfIXiqNqkYu8bxwalHj9PlhLsTqcJL0R1eH5/xL86f1k7R
         QPBN664pvfX1ZuuLVelIEr6e5zXV8PCroZub1odKukJzkdc4b/1OfGu4oMQUB+nyo6wi
         LZOWLMTYhBHgSmD0tEPlZj1GFX7xkkM0pTNJzojw3rH5uJTLmXlt7tItWo2yxYBirMJa
         fFxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfWkHV75Hw+UP8EWqpocDDyUPternQznfDob08/2uJK2JOWylr002qU4NUTe0Gzx3eDglXYrJKR4fQL6g=@vger.kernel.org, AJvYcCXl2q0+rzSAQ0S1P36ody4hequ8Xy/HoYE4rTp6+pyyf1GKm43jPDy3n6etHl2eoGY1AzjOGUS4e6rfYWyO2Vk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEoDOuKzbNxPzXgJ0RQ1ExUzM9JyNlAspXdpfNFcjS5aTz/TNh
	pD34dQbvzDiKWI/gZDZ25qrXueJI5KQPxYEEDAQMcpG/wdCouEgJjcqA5zZ3IqQQFUqGIWhEZh/
	ksMeMSZ7X6ar77WpJZRRxG6bHH52UUmw=
X-Gm-Gg: ASbGnctKefhIzE5LTbsfv+mRm/X2Qtlc9Z6iVqE/muWklMdSYuk44DUFMoVrzAXauTv
	/avqwGWwOIhVZV/yDQK12rFaFZyeDer2gGghcBApzF7di2/15PvqCq5+uNH12ajr4b6mhlx2EQL
	GZN89obzRbwwyiIIEAKIHH7xmapdg3M9Zt4DICSGma+Cs=
X-Google-Smtp-Source: AGHT+IHcDoEYiYNfDCdUkacNcMEAOzs+8U1TP1/BcHDhQFdNfXEeXQOFjK7ijS68XWJepFQkaZKUMIQQVff3hXBYuFc=
X-Received: by 2002:a17:902:eccd:b0:22e:50d1:b8d1 with SMTP id
 d9443c01a7336-231d437f0e7mr141804895ad.3.1747903502395; Thu, 22 May 2025
 01:45:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com> <DA2E1BNC668R.MMCARZ3K2NTS@nvidia.com>
In-Reply-To: <DA2E1BNC668R.MMCARZ3K2NTS@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 May 2025 10:44:49 +0200
X-Gm-Features: AX0GCFvCHoNK_pM6k7TEPjfKCmoWB02CvdL9c9h6ygApOUg3uOuHv8pwBTVxdiI
Message-ID: <CANiq72nQwxqeRGWBW2WSHijUKLs4c26UGQvJFjt-_SpnJJaaYQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/20] rust: add new `num` module with useful integer operations
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Daniel Almeida <daniel.almeida@collabora.com>, 
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 6:01=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Either that, or we enable `#![feature(const_trait_impl)]`. I just tried
> and with it we could indeed define and implement `NumExt` as const,
> which looks like the cleanest way to do this to me.

Hmm... I think that one is actively being worked on, with a possible
syntax change in the works. We would need to speak to upstream Rust to
see when we could reasonably stat to use it, and consider the older
compilers (e.g. if the syntax changes).

Cheers,
Miguel
