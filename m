Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9299D217F31;
	Wed, 16 Apr 2025 17:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744823724; cv=none; b=HfqSNGIbQPMXfHEy6BJ9JNaDZZ96wblYJ3uzxOyYbEYnHa7SbkKEa5XhbB1U/2JIFnlArmV7xhwiNT9GasGzkxqAoCTiCWtHvemUT9y3mGlnZnc9vWKzEwtarz4TukuYLxR+8ByU6WMuK5cyG/pTdfXskfqT5gJlCHTj9DjoScM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744823724; c=relaxed/simple;
	bh=E+W4P3xxT4IngLEtfDD0JtoIT/PzCiwxbF/MZf4VXZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VonbzioO1mn0OJsIicr8TY/o5mZEWHX3VHrP6kYAL4t4qY4OVPsd/oD57fs5xRj3YowRAJ8PwK0DmuZYCcSiCIrFZdhZoZMazJGYeWvxNZkOZV6emcgCpW6IIzGV0+T/YOSK7TVafTySm4Q+89oMI+ltOVQ9iWsld2WV0tm70KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1axJIhY; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1axJIhY"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30ddad694c1so70780301fa.2;
        Wed, 16 Apr 2025 10:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744823720; x=1745428520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jw6A6RQZAkowDNRuV8VmwQBNPv/8IIzWazzJT533nw=;
        b=Q1axJIhYP3GbRX6JxxGw+aTGye0n8THCnwul31flp3HUydKFFDhc4oRXQWMupfLbdj
         i0Znqvjq2OxnX043gAqbzaAjatst/HTdlu2QEDDROIFkM6IRfGeOZ+t2avWd9Wz317+Z
         Fv7FRR6ldjqwClxn8mP+jhCQTW7mkCh4SRCDJJfMdaTGHi+5j//DrZeFBP94fR1KdpcR
         dNgCsMd5rFqN6rSXiygZ7c1eMNOF8GZoK/FCVf5ywdk5PL34x4Vf1PkIPz3XW5kgXX0z
         aDLNqGmiIK5rBnnMwZP6UJq0WThgeb1h9Ax07GLyhBtGIOzzCo8RbV3Zo0cyCq9ctQK2
         ExcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744823720; x=1745428520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jw6A6RQZAkowDNRuV8VmwQBNPv/8IIzWazzJT533nw=;
        b=KqcU+j9fjUqH3gFQ5qc04F6YQae1/+BQCspHEoBqS9MLdN8svzm8xmpJtqFO9oRaGn
         ODxBurR2HVNqKMVzMxHFepzG4DQfoFTG0hd1bVTaVWbBfxAdsRqPNQg3z+sFkq9t88jk
         0niBwvl2Q2nSb60MtbK6b+aZMvR+EX3oo9HMUoOTlxyxNVvT0u62CHziTYO0y/eNizTa
         BlpyZj3Kk2oRvtOoSIcj9Hr9KRBZCRSNgD0aHuRilAykpGyoNM49lJUZT/U5wOlSXrOT
         BhwhwQIr0S7HDd4zdTJCc7NZUOLmlSK7JAJKN+hMBNP4wLSFC6I/2vf617HSztlVRXYP
         5WJw==
X-Forwarded-Encrypted: i=1; AJvYcCWE6sAwvuV2tGqmqsZAV4kJs57lqUi0PxUH8F1R/Aj0pTMRC0oAUyiMQ3BHG4xgBPfSkSO3cSq1GIm6OjY=@vger.kernel.org, AJvYcCXFGyliV3N9zPdLJwL3tZqw/4cVZBE/KpHq7157Tm8nm7whSym6xsUrr90kEGgYbxPH21meKESgZEpOfWY4Bv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfAXDuSLKvSy4my5HyKxrg7zSWml8RzE7KfAPatEWL1Pf/vlDL
	kk0poQguvGVr0JRCcZV8kYeQ7/19bJHJrZuLupgXQ1+fA8zD2VrJi1CJ7nxgZZxUqpNQzRIlVMZ
	UvaC9cpph+wj1V4PSTPn87FJIIyI=
X-Gm-Gg: ASbGnct9boV8OCajo+lDfn67ScGxzPQfAt1TquL9L8slPDgYDwnj5iWTyW35nWseIjW
	hLJljdsaAhHx8vPGyvSkv76DG6gyS9mgy9us9i+uH/cA6ndXnX9b6FD8+TPEDP/ITLeXLZcUB7E
	ZIpZQMV2HiRlsIKHF8tMk75bX6PhKHMYNkGcRq6A==
X-Google-Smtp-Source: AGHT+IGtf063nL9U2XEq+doiiPuKg0Ws7xztt70UWBUQDWtFdtBKjcu081wugUN/Z+Qbr9eYpRRSAJfETcww9+lP3XA=
X-Received: by 2002:a2e:ad06:0:b0:30b:ad2c:dfe4 with SMTP id
 38308e7fff4ca-3107f716ef2mr12716471fa.30.1744823720282; Wed, 16 Apr 2025
 10:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-vec-set-len-v3-0-c5da0d03216e@gmail.com>
 <20250407-vec-set-len-v3-1-c5da0d03216e@gmail.com> <CAH5fLgh+DsT0=6mxbX+=bx2rb7y35a2cSeg=0FqaO-FgTJ4tEw@mail.gmail.com>
In-Reply-To: <CAH5fLgh+DsT0=6mxbX+=bx2rb7y35a2cSeg=0FqaO-FgTJ4tEw@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 16 Apr 2025 13:14:44 -0400
X-Gm-Features: ATxdqUH0WRof7nsWSDWoryy6M7SVQRKeAtk6Bs6ZD4qg6Em7zE4xZlwqh6U6Rpw
Message-ID: <CAJ-ks9nOh49+Wpm2i-dvrHvHWU6C0O_ZHgz=TNHyBv3Zaew3oA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] rust: alloc: add Vec::len() <= Vec::capacity invariant
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Andrew Ballance <andrewjballance@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 10:41=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Mon, Apr 7, 2025 at 4:52=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
> >
> > Document the invariant that the vector's length is always less than or
> > equal to its capacity. This is already implied by these other
> > invariants:
> >
> > - `self.len` always represents the exact number of elements stored in
> >   the vector.
> > - `self.layout` represents the absolute number of elements that can be
> >   stored within the vector without re-allocation.
> >
> > but it doesn't hurt to spell it out. Note that the language references
> > `self.capacity` rather than `self.layout.len` as the latter is zero for
> > a vector of ZSTs.
> >
> > Update a safety comment touched by this patch to correctly reference
> > `realloc` rather than `alloc` and replace "leaves" with "leave" to
> > improve grammar.
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> This change has a conflict with the spare_capacity_mut patch in alloc-nex=
t.

Indeed. I have resolved it locally but was holding off until some
reviews arrived. I guess I'll respin now.
