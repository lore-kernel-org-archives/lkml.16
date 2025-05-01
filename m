Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D3123183C
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 07:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746083864; cv=none; b=G67eNEs+n172kE6YoJlEZ68VULRBABl8QaGcgKnMLpl7GW5qYnoLudaSfjfshYc9Dhl4mXhb5VqlD69DNq0HFxtlb3MU7bYmt7uoUbCs44m64tZFwP0DF5KPnFmcfl3GjH2EgvkhXDXFaZpwds4dO7qOaoAuqDQuG4DqwmTj24o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746083864; c=relaxed/simple;
	bh=IsEFuKr8MdJiyQYBneHaUVR7yEJMImUpl5m96czfCBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JqG+yOY/QAEQkZrKBoXaA+Ow9qKF7ox6uq3T47vsNVwLD+Y3Lxp3lQAUEPV65xchuBH+DwbZ6b94qn5xcoAdlphaFAjgOmkzf1/DEjOqAuIAdVZldIE9z8dIzQ1Imgc/OOI2OgP4sHiy5BF8quGn51vTEsXjuPqT1VSVJrK7wFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Asn/uqIU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Asn/uqIU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d0618746bso3275995e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 00:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746083860; x=1746688660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfbpd6S+j/Op6XJKqOKEnKbRjtTW+fQ4p2/1pzW9EyY=;
        b=Asn/uqIUxT7H2kQ/yyk5Cmwqr/XYQ1vR7NRDs85+JIjC94pJ0WiCH210kr6HMWehA+
         RK+fWpOPh35jxVn0qsFnktC/b7eEX7oAr7fcRTLOYd0E5pH4zZU2s0EhMHmwTPPb+rzU
         5tCUaHA2opkTFrNVx74YQ89+GjMVYSh5ggqiUsu1Nw95vCJBAAGEqtmPqZVJRt/pR0Rs
         twAABu4IMFnunx4ZTEhbzPphrA+D+QV4SjplxxRIcApSLfZGhS7sgB2SnY1yaIdiEa/u
         NfnY4EIli1TzDxuu+NTsEXp5fP89QxJe/y2YUapKrWwwvnroZrIE6mVm2WlrQeFe3XvN
         vr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746083860; x=1746688660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfbpd6S+j/Op6XJKqOKEnKbRjtTW+fQ4p2/1pzW9EyY=;
        b=ifJvOJfYfl4yWQPqy875oxMKNmtt8zIWsFyHxgv/mZ1f7xWR+pC5XwV7WRwaI7vDpv
         Hu4nAZfTJmKRGSsrHGFJjskAcstEUBMJ6HjdTXgFsJ1ndcj1r7uhQPSLKxrNIVqat2cw
         0f491slmRDU8iZnSRYXYXgFXJrcFFoLzWMppwSM4cjr3aCn04JCu+R5YDhhOZrJLx1j9
         dir5MieTON1vGWeuag283VqOtDDAXJBsXeUI20OzRo0Yt4WjCS3QZV2PB/q3MFkksdxG
         cQwkvzRozuMpQzWlD/r5zFzrBJiQWEaD9mwBernWt6DBPuqnuePqF0i9cg5f02liKEO2
         NdkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgIH/u5WiuxTZrEgpedg1SAskOQpnGQKUeQF0KhopubpPplhY25oQEVYJsV2gQFxGn0seZPiciT4XqJAg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2JNSnKgbrBiIWuCTG5U0/uV8nhOheD5vstFIp76DEP7TL8ehW
	bMXgZbfxHzEzt2qapbCGZUGTQ7QNBR+TJ+rGQEdjqpe7qaPvK4hjrjcGBST8V8Xli8bwZ4Flivk
	P4TmgEbGoiWJ1sVMiPpnmLI1lbtS197TK/RIX
X-Gm-Gg: ASbGncu2q1BsPol6M1unoo9TJugxmpujxrIlLp9A7rWdvE9AwkIK8ZU3khpn54mg3+M
	UombMy4CI2zyYvcR0Bu6x5D1zo03lV0Jq83EieREnrfu/8R9uRT7UtqvbJFsGEG0nvAw/XdrTwj
	mPI/3sHYBCzRVI8kylEE010BE=
X-Google-Smtp-Source: AGHT+IFduWCt9dAJ2C1o84Xte2BlzpK0E9RUVCMttsag2Euox2KT9XXx00vsgL2LSClUGCr9nJXH2sWB2Mwl9YOh+0s=
X-Received: by 2002:a05:600c:3493:b0:43d:fa5d:9314 with SMTP id
 5b1f17b1804b1-441b653c894mr11786975e9.32.1746083860001; Thu, 01 May 2025
 00:17:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-rust-xarray-bindings-v19-0-83cdcf11c114@gmail.com>
 <20250423-rust-xarray-bindings-v19-1-83cdcf11c114@gmail.com>
 <20250430193112.4faaff3d.gary@garyguo.net> <CAJ-ks9nrrKvbfjt-6RPk0G-qENukWDvw=6ePPxyBS-me-joTcw@mail.gmail.com>
In-Reply-To: <CAJ-ks9nrrKvbfjt-6RPk0G-qENukWDvw=6ePPxyBS-me-joTcw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 May 2025 09:17:27 +0200
X-Gm-Features: ATxdqUFyUNh-QBM8NkJE1Rola7V4MLYJmp0oVbJRr7K1gApSfORdSuG0qeRLbzM
Message-ID: <CAH5fLghKLZR7i6YQk8cQrvfOr11xEKia5LHtj1fn8dD3Stv0dQ@mail.gmail.com>
Subject: Re: [PATCH v19 1/3] rust: types: add `ForeignOwnable::PointedTo`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Matthew Wilcox <willy@infradead.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 8:57=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Wed, Apr 30, 2025 at 11:31=E2=80=AFAM Gary Guo <gary@garyguo.net> wrot=
e:
> >
> > On Wed, 23 Apr 2025 09:54:37 -0400
> > Tamir Duberstein <tamird@gmail.com> wrote:
> > > -impl<T: 'static, A> ForeignOwnable for Box<T, A>
> > > +// SAFETY: The `into_foreign` function returns a pointer that is wel=
l-aligned.
> > > +unsafe impl<T: 'static, A> ForeignOwnable for Box<T, A>
> > >  where
> > >      A: Allocator,
> > >  {
> > > +    type PointedTo =3D T;
> >
> > I don't think this is the correct solution for this. The returned
> > pointer is supposed to opaque, and exposing this type may encourage
> > this is to be wrongly used.
>
> Can you give an example?

This came up when we discussed this patch in the meeting yesterday:
https://lore.kernel.org/all/20250227-configfs-v5-1-c40e8dc3b9cd@kernel.org/

This is incorrect use of the trait. The pointer is supposed to be
opaque, and you can't dereference it. See my reply to that patch as
well:
https://lore.kernel.org/all/CAH5fLggDwPBzMO2Z48oMjDm4qgoNM0NQs_63TxmVEGy+gt=
MpOA@mail.gmail.com/

Alice
