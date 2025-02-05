Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F8D1519AA;
	Wed,  5 Feb 2025 14:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738764808; cv=none; b=Yc2I+RxPiGJf6x5Df4Y3pCfzmzuDJoue7mOwlIO9HdupTH6WV18GAq9mPYGG2eFC5Ql5Oo4eS+LqBE4wbpquYlPSFG2XoYroCHhmFGUnnkWA6uqa7qKZYQkWWPOtvg8L39jpDlW6x9OftxV3PUSeEd+MDL98P3cqUPIgmXVmB9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738764808; c=relaxed/simple;
	bh=y9bBxD6OlYG3QN3t6eEdPcfSBfOJrPnlO3VouFKzOcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gkFNmsMAEMO1M83tJiu2QPaIaV1CdfvyUwzwTRgRD8ckheSxGXdd6yIGotnfdBNx0f91KwjBafE4kI5QmizYo7mu/fJg5BcB7HaMqndrBnTdGWzXSIDpvmJ1kLEZ7fVU1+Q0HC7P4talsBPY6RLYCrSbI12cV0pc6U6Zrfm6lq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRaHtTnm; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRaHtTnm"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2f9cf019884so338891a91.0;
        Wed, 05 Feb 2025 06:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738764806; x=1739369606; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9bBxD6OlYG3QN3t6eEdPcfSBfOJrPnlO3VouFKzOcs=;
        b=YRaHtTnmrhfIF8HGMEGwVSCGY8hS8mIemYSEdFtd2360MdpXl3Z4dz/+ZhS3VD4F0u
         2LsuS6JdMLWiA5THE61/yhYjvW/ZV1eeFjzM28wOGHB0M5ANWD1kCs0MVtQJY1IjOpS6
         pSXI0/j9HHT4CdJa982JSxFJx2r/HnpU3TLcLMmw0ZArYE6ohhCLgE9gYEh3x2ydaL4y
         sLs2nQiS33AarTS2eutot2O676TFnS2Nbo+k2XxdB6BJqtAwYUJ6trwr60XxeY8eSfyB
         +3x5+EmEuGw/uqVKxTWHjaRhUdYFifVeWofNJhJOTzUw6o20l8pkSKt1gX2eIHFlF1bO
         b1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738764806; x=1739369606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9bBxD6OlYG3QN3t6eEdPcfSBfOJrPnlO3VouFKzOcs=;
        b=OGCpejnQQrRFqeC+dP1qw7lOpGg8dF0APdnbkY8q/xU44IbQMLDwGpYKd9ZwRJmSM3
         W7c5RQ5W9KgXaZFrdYvUhU6k0wWoo43UTiFfpcSTkXy/Id3a+tcLG+Uju8iQYcECEhlK
         XNsd50/MyyNlICLfBcA7TV3Z1NeRO/XqoiC0ZnZmCj9xVXGWbqrec80JkJ5vzKZmaI8J
         ks/e0526Hz8laxGTWArDvjDjEm4Qf1DKEm4XiEjCKDUmn9AMmqeY8a+lyDBuTzy5fB1A
         g3Z3b9/0lN1TLAG+ujlltaCiv9Bkhbo3Ynz7/ZfYY7A7Xfb3NrpatfLumWEj5rCZq7YZ
         x8oA==
X-Forwarded-Encrypted: i=1; AJvYcCU0DhFvwdzBHYH6CmAKju2KdnuzEtg5ozPPDRoG9flSlVj142ZcRp+z0NQHoABKuzBZv97QQTd6eeU=@vger.kernel.org, AJvYcCWgV79E69VTo9F61wwUw6Fvwafjc3A9o6sC9QVzZCvbZ5UYYR/ilZ1UlWWPJsPd0J7gHS06Q8LuO3U+9dxt@vger.kernel.org, AJvYcCX+4CiR15hmal1/0fza4v7+YbgDkwE3HZGSdfH5JEqNpKHqZBqSD0ZyTxRwo2mQuzZPSqv9kZZ+iGAKrgQL7nY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEG9hYBxaCTm2ieqmsnfeIgFR7c91YagvLIoOK9hZQUtrTQgDL
	oKqB8ffCo7q+sxwrzBdZziupi8/lbtIRkc1xrm90DMHMQ30uandi9MDkoxtXainR4FRoxitTbYy
	eWI768el1qFDbKu4fvYXYZe54JIs=
X-Gm-Gg: ASbGncv4/Bu7EV/DRvwpIIYJSev8IwoXfW2YMS5YM6ot+YZy0XXHQ2JCUZdqnmzbbt3
	6XaKqR8a8EJYfNMA/mH7taEU1QgZQlSx1r3efeHncp27f0OjCLu4ks+RnBNcO6g+0dR4NQLMp
X-Google-Smtp-Source: AGHT+IF4hKXRVLLC6unmAjENx+zZEHsy43XxaM92zW4ScuMwkiqk1/7Tpba6AbMwT3b4dDa6OhFd6Tj7HQNu4hPCPUs=
X-Received: by 2002:a17:90b:4f4b:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-2f9e06b216cmr1912666a91.0.1738764805841; Wed, 05 Feb 2025
 06:13:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204190400.2550-1-dakr@kernel.org> <20250204190400.2550-2-dakr@kernel.org>
 <20250205155646.00003c2f@nvidia.com>
In-Reply-To: <20250205155646.00003c2f@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Feb 2025 15:13:12 +0100
X-Gm-Features: AWEUYZkGVXHP4hrFG-5_ihud3NGINPm5TNS2CNAPtoXmocfUh6RQ24GiptUl5w0
Message-ID: <CANiq72mxKhCudmRaS=gwnC=gjkCLMhZcC2ZpfzKKaGX1Hivz9g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpu: nova-core: add initial documentation
To: Zhi Wang <zhiw@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com, cjia@nvidia.com, 
	jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 2:57=E2=80=AFPM Zhi Wang <zhiw@nvidia.com> wrote:
>
> It would be also helpful to make the process explicit. E.g. sharing your
> command lines used to checking the patches. So folks can align with the
> expected outcome, e.g. command line parameters.

These two guidelines (and generally the few others above) are intended
to apply to all Rust code in the kernel (i.e. not just `rust/`) --
their command lines are mentioned in `Documentation/rust/`. We could
add a note to make that clearer if that helps. So I would suggest
avoiding repetition here by referencing those.

We also mention it in our "Subsystem Profile document" at
https://rust-for-linux.com/contributing#submit-checklist-addendum.

> > +The availability of proper documentation is essential in terms of scal=
ability,
> > +accessability for new contributors and maintainability of a project in=
 general,

Typo: accessibility?

Cheers,
Miguel
