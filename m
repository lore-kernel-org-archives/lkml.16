Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062011DD0F2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744380251; cv=none; b=Pr0M5+lYeD3Pte1ftolH1culq+9n3QC+Bv8uV5t689Tt9N9/tIMAbwTBZCF55Sv5QF5MZZzo34KHxrQ6cXErfqTZilVNHA71NrzpgUyQNtjOAAKG0PKeMpKvTfsQL5BbvyLRYfsRuPkyYjLGYWIDgJtJaXpKw7M+aaG9/IgVDyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744380251; c=relaxed/simple;
	bh=Ubbxb2bHjPtTIgxbhNVN9KrZrgvceENegW/Wx+7aLiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hPm/0p1eSW34wuacJf1WbJa6lIVg0dSBO4lOfueC1pnxodtcqX5eMHYxDMJZ4qwex6Z2Ic4CcjZU5XEZ0DaEa6e0LCJ9A2IGK2HuRybZfO0Jvugs7ldwFhuGCp5WaAVx5zcg7NbM9svqF0fINTL7f48m4Y41HB9wb42gnMLUlGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tXMDgwUf; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tXMDgwUf"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so16137975e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744380248; x=1744985048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NFAq1EfAGe7+mU4CLxqlGsdPDug9rpW5Qn5zNLxhCg=;
        b=tXMDgwUfoPWNF9E55yjFJ1Mj8iaFROohMET7Hp4VnpX0vygX2+ON4jIrOKBAZ7kSf6
         LB7yAKn9Nfq0ZyyrLPbHIF3ueJnrhb+YEKsZqINUOWXDnaMXVI2qup4EKbACGj8pZBih
         8wvxC/4jLC7XGy6JKjy5oZAv55BBT1H2z/CKVKUe+P8m0mbv2VZUwoBaFoUbRywI0gMY
         N8ffhBl0/am0X8cNdGsugweHPCj/toEF8mIBAIQByaU0A75fsBKhhOiRxvlu/z/uk8ej
         3+4/xEhb8rfkgqyB2Yml9/HKSSUrHpjoQUXk0hw93Cb5BGuK/LJyYmWJ/gJq3pDZGXKV
         6nEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744380248; x=1744985048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NFAq1EfAGe7+mU4CLxqlGsdPDug9rpW5Qn5zNLxhCg=;
        b=WZwhyyo9Bxec7BZiE06Jk2RX4jCpz2B/Msz4tJKYjXXhe+MqpCIJTnFVSvKjqCF8cF
         Ge0qVn80oXJvwi97zomR+l7Nt0c8trO5dJyvQzLWlUlGbhrVU+QVE+hLD1jpwnmfWhyo
         Li+uqqnnoY9Doibo0BcGIKsZzDLrjpRWh3q3o3QaQqs5hDGwFh0qljp7Ky2ayLa09hWf
         LgFwkqiFTeWs4QunIyXFHkQic90OQDviUTu5aFXdV4EE4VIVl8lLNliXy4PD3jJnbtJA
         Sl8dWVZaXDAQqHRZF7SXAq+SbHK10A2vMocWWSubP1u8y6DwjU8kf/JnL9lctWcBxoSG
         MUAA==
X-Forwarded-Encrypted: i=1; AJvYcCVcrgQQDSjRPzt5OfbQi89VLBUccRRiQp/bYUJg6GS2tPWUZGaMTHWraEDPY5KXCQ1b6CrVJeifa0NFyrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN0miW4hunHA13T8fSTs+mVhm+4C0tTPmw/IJJu+zRKNBwJewe
	zJOjw5LwMKH0Aqz9HOCu4GZtk5+e8uOIL6bj1aW035rNSCqj7Kugs8rDofg7gqf2oVRRLxjlPLV
	Uyi1lpiBuRKLabcx3htg0mZKhkvKfkqAOLn5J
X-Gm-Gg: ASbGnct1S2tBQ59/K1IihuWajDs4zQKCtOccXRNIHfgrFCxzUaC00DCSom7UXAMZPu9
	T0wpQuv0OMiCbhX9BRK+NaUPsVrq+o6qLY76waFth5U2NxnvhBwRC20632bI5ClpoIijzi9oki9
	weFNTIJRmiCzpcc3xwiGE/mSc=
X-Google-Smtp-Source: AGHT+IFA1agukbluKMaNAK8/Nzo2zAHxJ+1B9VH4QUSarYItlzRNIQQWZBJ1lw2yIq9o5G3ylfA1vyQ5gZ4J7p9hwUA=
X-Received: by 2002:a05:600c:4f12:b0:43d:24d:bbe2 with SMTP id
 5b1f17b1804b1-43f3a9b02e3mr21068765e9.28.1744380247946; Fri, 11 Apr 2025
 07:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409-no-offset-v2-0-dda8e141a909@gmail.com>
 <20250409-no-offset-v2-2-dda8e141a909@gmail.com> <Z_eMe7y0ixrBrHaz@google.com>
 <CAJ-ks9kms_jFEAHX9MnW1pUOyTeuFuyWwXk-A+qhCPQQNfJdAw@mail.gmail.com>
 <Z_jcjEtKZRpRi9Yn@google.com> <CAJ-ks9ka0sASqBdhFSv6Ftbd7p1KCBuy6v-2jNd98gDpyAgQGA@mail.gmail.com>
In-Reply-To: <CAJ-ks9ka0sASqBdhFSv6Ftbd7p1KCBuy6v-2jNd98gDpyAgQGA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 11 Apr 2025 16:03:55 +0200
X-Gm-Features: ATxdqUG8hC_u__HK8-CW3gNS0gPxgHK6AdZX6UOb7LflknvLRFcPY7MceIw6q8A
Message-ID: <CAH5fLghSWJKDYae+oDsbkQHSWLVyAS6fqGYt7whHWaA6PXox_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: workqueue: remove HasWork::OFFSET
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Bjorn Helgaas <bhelgaas@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 3:57=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Fri, Apr 11, 2025 at 5:10=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > On Thu, Apr 10, 2025 at 10:15:53AM -0400, Tamir Duberstein wrote:
> > > On Thu, Apr 10, 2025 at 5:16=E2=80=AFAM Alice Ryhl <aliceryhl@google.=
com> wrote:
> > > >
> > > > On Wed, Apr 09, 2025 at 06:03:22AM -0400, Tamir Duberstein wrote:
> > > > > Implement `HasWork::work_container_of` in `impl_has_work!`, narro=
wing
> > > > > the interface of `HasWork` and replacing pointer arithmetic with
> > > > > `container_of!`. Remove the provided implementation of
> > > > > `HasWork::get_work_offset` without replacement; an implementation=
 is
> > > > > already generated in `impl_has_work!`. Remove the `Self: Sized` b=
ound on
> > > > > `HasWork::work_container_of` which was apparently necessary to ac=
cess
> > > > > `OFFSET` as `OFFSET` no longer exists.
> > > > >
> > > > > A similar API change was discussed on the hrtimer series[1].
> > > > >
> > > > > Link: https://lore.kernel.org/all/20250224-hrtimer-v3-v6-12-rc2-v=
9-1-5bd3bf0ce6cc@kernel.org/ [1]
> > > > > Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> > > > > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > > > > Tested-by: Alice Ryhl <aliceryhl@google.com>
> > > > > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > > > > ---
> > > > >  rust/kernel/workqueue.rs | 45 ++++++++++++----------------------=
-----------
> > > > >  1 file changed, 12 insertions(+), 33 deletions(-)
> > > > >
> > > > > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> > > > > index f98bd02b838f..1d640dbdc6ad 100644
> > > > > --- a/rust/kernel/workqueue.rs
> > > > > +++ b/rust/kernel/workqueue.rs
> > > > > @@ -429,51 +429,23 @@ pub unsafe fn raw_get(ptr: *const Self) -> =
*mut bindings::work_struct {
> > > > >  ///
> > > > >  /// # Safety
> > > > >  ///
> > > > > -/// The [`OFFSET`] constant must be the offset of a field in `Se=
lf` of type [`Work<T, ID>`]. The
> > > > > -/// methods on this trait must have exactly the behavior that th=
e definitions given below have.
> > > > > +/// The methods on this trait must have exactly the behavior tha=
t the definitions given below have.
> > > >
> > > > This wording probably needs to be rephrased. You got rid of the
> > > > definitions that sentence refers to.
> > >
> > > I don't follow. What definitions was it referring to? I interpreted i=
t
> > > as having referred to all the items: constants *and* methods.
> >
> > I meant for it to refer to the default implementations of the methods.
> >
> > > Could you propose an alternate phrasing?
> >
> > I guess the requirements are something along the lines of raw_get_work
> > must return a value pointer, and it must roundtrip with
> > raw_container_of.
>
> What is a value pointer?

Sorry, I meant "valid".
