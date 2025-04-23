Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D64284685;
	Wed, 23 Apr 2025 15:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745422750; cv=none; b=nKOSPjD/5ggEwXJLUU9v3EVmCkGs5L0Nju8a5eOU2r++TyZdLBv+43fhrRO6iZopFD1pCY6Uvm0hgKoFtRdyCWDnknh3hkfwcfLwkkr0OPL87XNOsK/RjheZ/HqepNlnpWG7IhPoqiyzKGWMMmWKVNoNgTBgiy6vVx9E5bQUGRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745422750; c=relaxed/simple;
	bh=aLWLGHASdIvWAs2AKS4uxhlZjTrDzIENEUz3FT77U8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kwrQiBruvrYByrYD9EP45Dq56ZmYyOTTc2lwaNXhYi/H3K/0hl7RmXuMejD6PvlyNvY8Wf1WTs1BEoBx9GqRIQl+5FA41vhuaKzpkCgbTVucOqIgrR8YVdxoJ8Y4b3U2uvdwsA+Ks5TjN3mXQHl2oxUhX5V12AoOr8muEgUtBXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekQhzARo; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekQhzARo"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3106217268dso405781fa.1;
        Wed, 23 Apr 2025 08:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745422747; x=1746027547; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qj/rpTDCGzjajFcuOznqZseSs8yVW83bcJ88dS6enYQ=;
        b=ekQhzARoBIE5TqSLnMQLhMF6D7cuwfr3sq/MGMV/B7h+ywV5beP76/gm05MJ3jI+5p
         z/EZPBKkfU2dIJFcuDpJn+PZu1uUhcXdW97itOmkvhlZjUaYNPf0nnT6H9exawB3mh6a
         ssbncOmRjXiPdgBG8ylzmH0xeXSIPRzt91/PurKCpsoRikl+GJpJKCGbPgEWnlZWJx2Q
         /fEiepTfcOlBUSrKvPqlKIeoL4O1VZ3qFJc4+d1+6ZpRe6I0NbFsUBkCWgt/SuP2LNcg
         Zju+8+gmrU5lknTApMdAMfVEK+rVn802sy1GcDkeDiBS42/FaME0ID5utHp00+0HHAl7
         LWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745422747; x=1746027547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qj/rpTDCGzjajFcuOznqZseSs8yVW83bcJ88dS6enYQ=;
        b=JuqhCcQ3+aH0pCp916zY2zQ7nMybCh0awFezJXOifU3QTzs6GKlFfZQMi+ptB9SaeS
         3AmQm/FC5dCVyT9VLr15sApRCpxi+lxx52H78LFkJ2FpjGt6/3G+kVX+3uf3rY3ra+bt
         +au7qfrRlg8MZUgchTNBE6PPYaPRjSFtYv2kFsuUaBuZypDgMiuINaHxULa/+gpjfM0P
         1oLHOxf/rr2UzhVaeMfpMooCCB1BIW3jLvS3FLsvwYX0OTiX07BK8lnB9rRNxGDc+ZgH
         jnJV4ZaHMuFPisF/ncvX9Vf/0vmDcw6L3iIhWFpaWF/AYVZmBYgOWU0hokUpWKf0ag0Y
         jSVA==
X-Forwarded-Encrypted: i=1; AJvYcCVSt8hgaAc1ms39/78O4fK8XkuZaYIh7TQgM9A9BqJvmR9j3A3U6lq75LZieMOyqQ+4Na/JHUM+fLFSiF0=@vger.kernel.org, AJvYcCWYfqtMZG8ONw0xSsdw4v5Y6PiWigsanjn2C3CF2UH9MiseZrW4V8n7FMBCJk4l/yjvL8Je1oMiuCEJV7EtFCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUqkDhgmVdWAXT1nn/C9YtmsxA/b7C7Fc8eqM90ffZs8WuTyIc
	/uTDsMMAk4O9tJ/yU7U2pJRJYd+6JDakCuc+v0rBNr2Ks3QsEJpCzv7a/Sq4VK/USXUMYtutaoB
	d62NQpub6PYFe+///YG3YWpr5JMQ=
X-Gm-Gg: ASbGncuCbBei1zVwQmAvaSoBZlB48JAvSgXGC4k8Xuy0l0XpskZLNPDQCaxzcf9W8hM
	NPyRFf1WT8yU1uId907OBC1fjuyFt2Bt/W0P0B0+xWqTZhf4FulzPIQtSn576+06/RQV2FomIEK
	z01m5j70GQ9yrnALRfCc5UqKx7eYWaoskg7EH8Kg==
X-Google-Smtp-Source: AGHT+IErTYD9FmiTU04dScC6WH5JBnJKk2+xJBs+4iYQrHVDYocNYDbve58f7lhlHHFbzIrwogO1DTuhgKl8AkuRRcI=
X-Received: by 2002:a05:651c:1a0a:b0:30d:e104:9ad4 with SMTP id
 38308e7fff4ca-31090578015mr52371301fa.41.1745422746277; Wed, 23 Apr 2025
 08:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com> <20250422-vec-methods-v3-3-deff5eea568a@google.com>
In-Reply-To: <20250422-vec-methods-v3-3-deff5eea568a@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 23 Apr 2025 11:38:28 -0400
X-Gm-Features: ATxdqUFiwujpGMdZdZ1giwLuKCi0Tc-D6TTwU-UiYOcKmywexj8MpadUnkae0fU
Message-ID: <CAJ-ks9mg7U0YV805YEY_ViB0i3f_afHcR1xFEe9dhZeQz=rFDQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] rust: alloc: add Vec::push_within_capacity
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 5:53=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> This introduces a new method called `push_within_capacity` for appending
> to a vector without attempting to allocate if the capacity is full. Rust
> Binder will use this in various places to safely push to a vector while
> holding a spinlock.
>
> The implementation is moved to a push_within_capacity_unchecked method.
> This is preferred over having push() call push_within_capacity()
> followed by an unwrap_unchecked() for simpler unsafe.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/alloc/kvec.rs | 41 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 38 insertions(+), 3 deletions(-)
>
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index ebca0cfd31c67f3ce13c4825d7039e34bb54f4d4..a005a295262cb1e8b7c118125=
ffa07ae252e257c 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -307,17 +307,52 @@ pub fn spare_capacity_mut(&mut self) -> &mut [Maybe=
Uninit<T>] {
>      /// ```
>      pub fn push(&mut self, v: T, flags: Flags) -> Result<(), AllocError>=
 {
>          self.reserve(1, flags)?;
> +        // SAFETY: The call to `reserve` was successful, so the capacity=
 is at least one greater
> +        // than the length.
> +        unsafe { self.push_within_capacity_unchecked(v) };
> +        Ok(())
> +    }
> +
> +    /// Appends an element to the back of the [`Vec`] instance without r=
eallocating.
> +    ///
> +    /// Fails if the vector does not have capacity for the new element.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let mut v =3D KVec::with_capacity(10, GFP_KERNEL);
> +    /// for i in 0..10 {
> +    ///     v.push_within_capacity(i).unwrap();
> +    /// }
> +    ///
> +    /// assert!(v.push_within_capacity(10).is_err());
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    pub fn push_within_capacity(&mut self, v: T) -> Result<(), T> {
> +        if self.len() < self.capacity() {
> +            // SAFETY: The length is less than the capacity.
> +            unsafe { self.push_within_capacity_unchecked(v) };
> +            Ok(())
> +        } else {
> +            Err(v)
> +        }
> +    }
>
> +    /// Appends an element to the back of the [`Vec`] instance without r=
eallocating.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The length must be less than the capacity.
> +    pub unsafe fn push_within_capacity_unchecked(&mut self, v: T) {

Did you intend for this to be pub? The commit message doesn't
obviously indicate it.

>          let spare =3D self.spare_capacity_mut();
>
>          // SAFETY: The call to `reserve` was successful so the spare cap=
acity is at least 1.

What call to reserve?

>          unsafe { spare.get_unchecked_mut(0) }.write(v);
>
>          // SAFETY: We just initialised the first spare entry, so it is s=
afe to increase the length
> -        // by 1. We also know that the new length is <=3D capacity becau=
se of the previous call to
> -        // `reserve` above.
> +        // by 1. We also know that the new length is <=3D capacity becau=
se the caller guarantees that
> +        // the length is less than the capacity at the beginning of this=
 function.
>          unsafe { self.inc_len(1) };
> -        Ok(())
>      }
>
>      /// Removes the last element from a vector and returns it, or `None`=
 if it is empty.
>
> --
> 2.49.0.805.g082f7c87e0-goog
>
>
