Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8381C7017
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152363; cv=none; b=WuhkaymYPWg/ZqBIA60z5e/zHT+Vg8jNSENQ7mL56KH28mB3GFfbNGzkqeyIAo9S2kXoUgDxyVmX5ASxlhs2xTH3K2Qoqp28CFLIi/5PWNK550jaF0r0GAZWkG44X2kK5VZLAiwuR2lQ77nM7PcSGNcBd+n+/qrp7Fh0KLj/228=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152363; c=relaxed/simple;
	bh=DIl1J1lfD+AAz0ejm3MS5nT16uIpKNkzKhx5AqYoRk8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QvSTg8MzplWg0SJdBmcWytphg3fdUwMPU2TLkrn7fRjHVSa6NO290jvOKMPTcHMu3TXMnnNizSZ3vZPsd3ayFABMjDVqpnPaV37PvvH3RDPgFdqgQobI9Gtsjerjf3VWFKlJi9dOmz1R3KDdmJxLgZaorrt7sJWYYR/Toi6SMi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gp/+nODC; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gp/+nODC"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45311704d22so36025385e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750152360; x=1750757160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMvrJ9e2K6Zu9RNcJsUAwSea76kcNkVJ7Teqqzm9Z/M=;
        b=Gp/+nODCQ3IKPSSElmpyNltFaA1d9au0T1GNlTnzenax8GP4HH0HVMM286h6BbyDDY
         n6mO1k0uuSgJlS/lCLbaJS1MCZhELHSMunZaMN83dEh7GlgvO+ACdepM/i8UntuE4R1E
         YqiSvc9WdEn243dgF1KazqLOJuIZOPfv5eepQ5N4DlSzXqf2A6DW9H64Sf16/UC1zsFX
         GWaxmiGCqg4W79ckWOptIuq3X3BBPPU7Sgc6lKu6YmFD6OWfAG43cJUwW3Zat6HrlnYL
         6j7PFPsNHlg5pgiEaMtjDgkG7GhPocjk4WbELnqzOa2XZJ8sBxGmYKu/IIm+r4upBj32
         1nFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152360; x=1750757160;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MMvrJ9e2K6Zu9RNcJsUAwSea76kcNkVJ7Teqqzm9Z/M=;
        b=puO0MqRhYwjSbu/g4rqnXeYKOIXgqGwfd8eEEJsM8oEfXSl4XhgLjIdS8+/sH/eNOw
         bOVexajEgK5TWN5EoEMnqf2GxENeM34LE+6UAZ+ZOtz0Mcz/cVIULyplONIiLHpELQvv
         jSGTGf+9fzLroLzx1SN5NUts/0kvbS+Z28QUKqa3rjuzs9BtkH/VbwQpGFCJguH45vkV
         xuYx8gOjwmMaLDK89ke76O4+1IEvbrdWGnEKGQ3DpWaTKcgibuIeQbrM0ruEn/uJfyP5
         celBo2Fd4e9SGWRJH4Wf7Kh/nwP9g8TenaN0Vj2lTTSY3ZD9AKRMTxnk+s44U7DMbZmU
         N88A==
X-Forwarded-Encrypted: i=1; AJvYcCVCHvIjjshCsLQPni76hCf4zJsmo3yKBtGWk3YxXq+i73A5+/vzMEnC7afeIILO1aRVUTKzxZ/ijR96lk4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2UJ8BQGJi/BUzRn5qmFwAUSUfQ1oJ/j2dyvtCPNULjq8kcWJI
	g/cNVCyASxNMSH7mjQ015F2l1EP9Ipjt+oF5h5uAvWwlVhaQqAH9MOriBGejKF3qjbuSxUYWL0X
	Akkng6UdQ6J4ugWzMtA==
X-Google-Smtp-Source: AGHT+IHnruetX9QRbcbZznPXKQ5pSmU+moGZzr/C+9YqxnbCL4s7TXpqha5yBqLOv7hao/Mb4Agzm1vl3X4jOXY=
X-Received: from wmbel26.prod.google.com ([2002:a05:600c:3e1a:b0:453:e55:89d9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b02:b0:43d:77c5:9c1a with SMTP id 5b1f17b1804b1-4533cadf85dmr121011465e9.4.1750152360319;
 Tue, 17 Jun 2025 02:26:00 -0700 (PDT)
Date: Tue, 17 Jun 2025 09:25:58 +0000
In-Reply-To: <CANiq72mZV3Ezxb4FvDdMvn=O+ReUPBx9usUahLgwTKKCFD_+cA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250616153604.49418-1-boqun.feng@gmail.com> <20250616153604.49418-2-boqun.feng@gmail.com>
 <CANiq72mZV3Ezxb4FvDdMvn=O+ReUPBx9usUahLgwTKKCFD_+cA@mail.gmail.com>
Message-ID: <aFE0pjPsuB0gBgvT@google.com>
Subject: Re: [PATCH v3 1/2] rust: Introduce file_from_location()
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, tmgross@umich.edu, dakr@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, pmladek@suse.com, 
	fujita.tomonori@gmail.com, mingo@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 11:19:52PM +0200, Miguel Ojeda wrote:
> On Mon, Jun 16, 2025 at 5:36=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com>=
 wrote:
> >
> > introduce a file_from_location() function, which return a warning strin=
g
>=20
> returns
>=20
> >  #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(coerce_unsiz=
ed))]
> >  #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(dispatch_fro=
m_dyn))]
> >  #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(unsize))]
> > +#![cfg_attr(CONFIG_RUSTC_HAS_LOCATION_FILE_WITH_NUL, feature(file_with=
_nul))]
>=20
> I would change the config name to `CONFIG_RUSTC_HAS_FILE_WITH_NUL`
> since that is the actual name, i.e. without "location".

We will need to coordinate with
https://github.com/rust-lang/rust/pull/142579

> By the way, please add a comment on top, like the others, i.e. something =
like:
>=20
>     //
>     // `feature(file_with_nul)` is expected to become stable. Before Rust
>     // 1.89.0, it did not exist, so enable it conditionally.
>=20
> Alice: the tracking issue uses the wrong name, i.e. with the
> `location_*` prefix.

Fixed.

Alice
