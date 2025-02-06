Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2377319F436;
	Thu,  6 Feb 2025 18:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867958; cv=none; b=YHXTmKeIw/h93Qcg/xdwJeQqZNpZjGGWR5VLd5ijstizaxA4wI3NfVyNczRNaLgk2ZaU7qkATDXKlu3YHURWEKyoF1J2HzzgvoTmmrvd+sKpRusNyRIYI3VY4XMqn9AsiEKmYjgUFP+zt4fEY92oDDja7b4JE+Vah/je4S5TNAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867958; c=relaxed/simple;
	bh=gO2bv8O6Bx8Wdgtoj/e4brdYtAFIEqhHAYeZvrJ6bqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kREzKmqI9bcyNoJWhVsY+zgYpf+e+Pqc0RxfnWR4QTUSrb0LjjvBz7iUlQZ80fxlgiCIQxG1BpvGJvw1WWf0yzQSXsw9/oiJehFVh5kGSa9gagFMNvdKoWBvzHoOzbUDKR/Gdzb8fqmYLK0jHNkBNDQ92mb4DvV+d51TiCriX9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdOvNxZD; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdOvNxZD"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30613802a6bso13953911fa.1;
        Thu, 06 Feb 2025 10:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738867955; x=1739472755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gO2bv8O6Bx8Wdgtoj/e4brdYtAFIEqhHAYeZvrJ6bqk=;
        b=HdOvNxZDkwUrU4hVUreNfFbQhmLyokQNbR/uyb3wKB8iiLuP/shO5IT7ts8UMd1gat
         rtohgmSYqBb2nOJ/CNH4Jlszt4DYyuQWSojo0zxPZIAAQSEksNCZrJ2v1pg4IJt6W/nJ
         H37rTiZk3cLaATSzqY4Z70hQjPMk34MHR3R/uD0jPJokpAPu69Jyd4/u2rfwyE30wGkA
         Xk9fDDvQClKr7svAaTb0NE2K0agsLYdGfJOK9CocRSUiLmLLqb9fmsmMOgaVlCz6zoSD
         qI2/SL/2HpUB4X4a6PuMVYqsoYok8+XnzddTksi42P7U7Bgy9Gu0si6cUiw2Vl+eubmv
         XDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867955; x=1739472755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gO2bv8O6Bx8Wdgtoj/e4brdYtAFIEqhHAYeZvrJ6bqk=;
        b=In+Vfwv9rHXukXEGhiXBnB3EAbX/eIxYZmUooYIb0zEfq6AdBhic9Q16Sm0z3I7l4O
         A6B7BBoMJj17uyo8U8pIBPj+EX0Ary9yRmDJ0r2+puXMPyKzGjSNe2iX6iU6EeZ/3Ox1
         HKoD1YmofE5g8n0iXzU5RtCfPeyI+puGB91EinWVV+E/s28xvKMKv+gRxo+KYCzLLU7T
         dC3DtPDzoa5+19WNTNZxVabPDX377VxbQcjd96tzrIWdvnPu8KjW0nO2CkXXX0JVq8JJ
         59geqekpRkHKttZ1xnytijwzQpCZzRfCkm4NmqKEuWhRy3r0kUIkQ7e4sWoMhw//TheZ
         zI7A==
X-Forwarded-Encrypted: i=1; AJvYcCVWFJGDQ8assen+iul83tIBGKYMGzR33O+MScsNH2d1MyXwacvvIvaGhm+IPaLDnA8vWlSQsZvSSBaNaxw=@vger.kernel.org, AJvYcCXuA58+UO0qqCjytb8lRE4KUPThJFElicWNzJIZCbvuO4QNEvvYrdop1iOOxu6eD6b+g6EsfVXdMllIVTucIDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxafWZGmgndVsqUMwuUwyiv/w5XBR7SadzU+ZmA8LN3qQpEZVR
	LVwXWSmJihkyvqJkkWF+x5THROpTbFZpypsMHisiEsK4oDEWecF0I2LMc2EuJRg55wOnd25vjO9
	AarUfMLjihBK48cgvXxUgJ1zzX4I=
X-Gm-Gg: ASbGncuFwU0HDpJVVNN7eXfYHaZTL2flmyE+At20c9XsPk/rgPuyqrmKivONuGR8QnM
	if2hc0mP7uVI3HsV1WuZnSx3a6uptRWMhhtKyvZq/Vl6AK1PeT1lUDMYo4nTlncXwx4cRcFpYvw
	6QkjYndElLXn8gzqvaYvfoqtPIF4zA
X-Google-Smtp-Source: AGHT+IH/yZhLtzr74H55CwlcqZNcZXWFUaJLLfsIDNjWSQuiAxojCl3vrC9tKpOFckw9Gkw6Yz9R4Hnb/vpDVLvVXuk=
X-Received: by 2002:a2e:a912:0:b0:2fb:597e:28d9 with SMTP id
 38308e7fff4ca-307e57eec91mr391351fa.14.1738867955076; Thu, 06 Feb 2025
 10:52:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-aligned-alloc-v2-1-5af0b5fdd46f@gmail.com>
 <CANiq72nH3N9UMu2hsPG7WfYCZQwy9M_4q_rQHJnJMScQ3D9-Jg@mail.gmail.com>
 <Z6T5sOWXxmUsflW7@pollux> <CAJ-ks9mokMqBYEucYBgL-72c3o=+L7A8O=6Q=cc9JofFEmseXA@mail.gmail.com>
 <CANiq72mzJbX+_tpqSOsWpgtAeYD0rutVJ2V6u0wDO+zGcB51Ww@mail.gmail.com>
In-Reply-To: <CANiq72mzJbX+_tpqSOsWpgtAeYD0rutVJ2V6u0wDO+zGcB51Ww@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 6 Feb 2025 13:51:59 -0500
X-Gm-Features: AWEUYZn4lCqNpuxIVooAGeq5_eWhgWdWozg_6O6i1_AGM1SRjqf84u7WgsMhzEY
Message-ID: <CAJ-ks9=DMvchc9ZR0bdP4Q3c3cJX2Qx7SyPjN9wgHjH3ht_2DA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: alloc: satisfy `aligned_alloc` requirements
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 1:23=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Feb 6, 2025 at 7:11=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
> >
> > The note on cppreference addresses this:
> >
> > > As an example of the "supported by the implementation" requirement, P=
OSIX
> > > function posix_memalign accepts any alignment that is a power of two =
and a
> > > multiple of sizeof(void *), and POSIX-based implementations of aligne=
d_alloc
> > > inherit this requirements.
>
> Yes, at least some POSIX-based implementation inherit some
> requirements, but the commit talks about the "documented requirements"
> of `alligned_alloc`, which didn't seem right to me (in fact, some
> implementations seem to be extremely lax (e.g. glibc)).
>
> > I could rework this patch to use posix_memalign which seems to be more
> > completely defined, or I can try to capture all this detail in a code
> > comment and the commit message. What do you folks prefer?
>
> I suggested going with that "macOS" etc. line because that is what we
> are doing and so that we avoid having to put a lot of complexity in
> that comment.
>
> In other words, we are changing it so that it works in macOS, right?
> And those requirements seem the stricter ones vs. say glibc ones. So
> going with the "why we changed this" may be an easier way to explain
> why we are actually changing this, unless we are sure we know those
> are the requirements for everyone (which is what the current comment
> in the code looks like).
>
> But if using another function makes it clearer, that is great too.
>
> In any case, to be clear, I didn't want to delay the change -- it is
> just that the commit message and the comment didn't seem correct.

You're absolutely correct, of course. I've changed this to use
`posix_memalign` so that the behavior is identical for everyone. I'll
send v3 shortly.

> Thanks!
>
> Cheers,
> Miguel

Thank you!
Tamir
