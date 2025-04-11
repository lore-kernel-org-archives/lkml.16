Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8677A2980B9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362642; cv=none; b=s8KB4lnRJo1iIsKszYhyTn2cGR2gO23WeFEDooAX8S017lSCO5iOqgnPWuZnLoHBdiT2b6vBHPnLO2hbz6pZP25bmdT2Jtfdt43usQ4U5MDJdzbb2GzpZtIfqUfxzYFklFksG+zG/DRJGfozazoz2SzXuXaP9QzdgpJLxWoel1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362642; c=relaxed/simple;
	bh=d4KKNjwuoZFI0UhSHvmeJQu1TqXtlyhxiS6Ao/gYqro=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GDFj5ngj5jpv22Y+88bvC/PkgmgAEpePTwwlsX//grBZTrsjObgJQ0+BgOucSuEOSwl60bKVc8oM4dHrFkY61pasYci3y708y+Ztsoc9L1B/wFB/O1q1FPa+zneBMfWXcifbWx24TrM82siauFaKoAzQ8RM3evENyLUASe7jt+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=baRaw0Qe; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="baRaw0Qe"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so11203765e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744362639; x=1744967439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zF5GJW+czRiIiu4D0r/0Z8MC9j7bmRNMDvcUyfABZzU=;
        b=baRaw0QeCwrPeLUmZSZf7FJExbK0zaBPMzKzCnNqmkN7HiX33BMJ/0c4P2uJU5hvvB
         4zqVGRXfifPPIenJ575uSTVQMfQBmvsdXN+uSfXB72bzhko6QDmzqItf0Is3lTXEEZCD
         VbyNc3RKlBMAPKQQUORcnXJyffC6WcXTqi4CwKDIIXZT7nbMIwn8tq2Zyx3EVmd4cjZ/
         EoPHecHIUj2Fe+5V6/FL7v0XHrgFpFAQbYrOq1olmZAkOtuaHfnYVSmr+44DVdWiYy2K
         aOIPxHcwgXQEUK5E0mpOi/NfMGqHNAPZmwrFLErZUuS/azx1iDv/GkVnRObiW5od1iRO
         3Pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744362639; x=1744967439;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zF5GJW+czRiIiu4D0r/0Z8MC9j7bmRNMDvcUyfABZzU=;
        b=N2KXQmhJ6Ex4wR6t6F0+9vYDtuFh8cgXwRkX+pfQUAIaLgQ7DFoTAzbme1zgNF533u
         F8tjY49gI6eVh3hPi1OJMJHqn8Z/je4svbTq6Gj020PMtrKwUSU/yVllBEPc689EAd21
         /wdlEYW/nSXb8WLFeWUSizlNsK8C7AK6AeRevyd1NmeyRepDXyB8oAcYOsPd5/5q3fDD
         tleo5hRPH1X5RQFT2nsuufVOl/7b2rR+xJ57clZ9W8+WjdOah6ElJZNaHFSroeAF3mh3
         L8faEbT1lLeKclRTEg0f7Ev+ze/wdshQbj1Mx6LwSR0cCDA7M132u3z+thZge7M+X1n5
         pS3g==
X-Forwarded-Encrypted: i=1; AJvYcCVYVUKRdfV+4sEFo/S9Fp8pPm7tr63mn2dypIkniLuhq+1D7unt4lCkofZjbbXjmEvVMFNKEiNpathRRMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaE6ojQDHDrpeM3JTHtH6Ta+2R6gZS1+w5VNm8sP6lXBQKyp4l
	5438lbaiTBQ0Qc6UcawYspvENoER9HcR1uj701m9koFk/jIZv/3bVjthut2slQ3zRY+hYOetvNy
	eTIWFQQIT+9yIcw==
X-Google-Smtp-Source: AGHT+IHlmejxcmD4jTD6NlcQhR5M2fWZs6vm160cXr9LWOW4REHUSk7IeQbvwGvehOaDQxPxdMQbpfJ4Mva7ALM=
X-Received: from wmcq13.prod.google.com ([2002:a05:600c:c10d:b0:43d:41bf:5b62])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1ca9:b0:43d:abd:ad0e with SMTP id 5b1f17b1804b1-43f3a9599f2mr13568655e9.18.1744362638990;
 Fri, 11 Apr 2025 02:10:38 -0700 (PDT)
Date: Fri, 11 Apr 2025 09:10:36 +0000
In-Reply-To: <CAJ-ks9kms_jFEAHX9MnW1pUOyTeuFuyWwXk-A+qhCPQQNfJdAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250409-no-offset-v2-0-dda8e141a909@gmail.com>
 <20250409-no-offset-v2-2-dda8e141a909@gmail.com> <Z_eMe7y0ixrBrHaz@google.com>
 <CAJ-ks9kms_jFEAHX9MnW1pUOyTeuFuyWwXk-A+qhCPQQNfJdAw@mail.gmail.com>
Message-ID: <Z_jcjEtKZRpRi9Yn@google.com>
Subject: Re: [PATCH v2 2/2] rust: workqueue: remove HasWork::OFFSET
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Bjorn Helgaas <bhelgaas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 10:15:53AM -0400, Tamir Duberstein wrote:
> On Thu, Apr 10, 2025 at 5:16=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > On Wed, Apr 09, 2025 at 06:03:22AM -0400, Tamir Duberstein wrote:
> > > Implement `HasWork::work_container_of` in `impl_has_work!`, narrowing
> > > the interface of `HasWork` and replacing pointer arithmetic with
> > > `container_of!`. Remove the provided implementation of
> > > `HasWork::get_work_offset` without replacement; an implementation is
> > > already generated in `impl_has_work!`. Remove the `Self: Sized` bound=
 on
> > > `HasWork::work_container_of` which was apparently necessary to access
> > > `OFFSET` as `OFFSET` no longer exists.
> > >
> > > A similar API change was discussed on the hrtimer series[1].
> > >
> > > Link: https://lore.kernel.org/all/20250224-hrtimer-v3-v6-12-rc2-v9-1-=
5bd3bf0ce6cc@kernel.org/ [1]
> > > Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> > > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > > Tested-by: Alice Ryhl <aliceryhl@google.com>
> > > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > > ---
> > >  rust/kernel/workqueue.rs | 45 ++++++++++++--------------------------=
-------
> > >  1 file changed, 12 insertions(+), 33 deletions(-)
> > >
> > > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> > > index f98bd02b838f..1d640dbdc6ad 100644
> > > --- a/rust/kernel/workqueue.rs
> > > +++ b/rust/kernel/workqueue.rs
> > > @@ -429,51 +429,23 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut=
 bindings::work_struct {
> > >  ///
> > >  /// # Safety
> > >  ///
> > > -/// The [`OFFSET`] constant must be the offset of a field in `Self` =
of type [`Work<T, ID>`]. The
> > > -/// methods on this trait must have exactly the behavior that the de=
finitions given below have.
> > > +/// The methods on this trait must have exactly the behavior that th=
e definitions given below have.
> >
> > This wording probably needs to be rephrased. You got rid of the
> > definitions that sentence refers to.
>=20
> I don't follow. What definitions was it referring to? I interpreted it
> as having referred to all the items: constants *and* methods.

I meant for it to refer to the default implementations of the methods.

> Could you propose an alternate phrasing?

I guess the requirements are something along the lines of raw_get_work
must return a value pointer, and it must roundtrip with
raw_container_of.

Alice
