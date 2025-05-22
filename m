Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EEC17A2E1;
	Thu, 22 May 2025 08:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747902135; cv=none; b=UNzU3X3PId02zq0TFoOpEwMRbKx5nMRcM12g82zSh0CDdJ7ohSYGX6q1FKw9jd1BuKFTpSmjtbnKIz06igtqZ/rEYGkGRcAZ8+eJCFgC/IoiQ21q4AbXPTOpqCLVHui/+5nqQdkuP+4iQggTrJKQG4rTCdLSg+Du1U3Q4cqIF+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747902135; c=relaxed/simple;
	bh=HJpZF9KlDiTFw4LdyYEPTP7DBDQGdT5e7+/N31GSelU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrLlNiroldY7VXGdBeJgIKk2pnn1pD5+MAqIbyl+2czCAYuvdoH6pu+jRaOCWHhtCvNNetB8fYS5iVSl/CvNI0vaAqDQxf5oljycysX5yykxsVJvbEIl+50Qx9/BnODH0/eacSZuBVih63i+1zajlOsnj7Rvtm52zuuk0DCMBR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/rjP3yC; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/rjP3yC"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b2700de85d0so517669a12.2;
        Thu, 22 May 2025 01:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747902133; x=1748506933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONODD9O59Xo3Ja6pqA8L/7sjkOJQ6kUNEStCVy7GufQ=;
        b=e/rjP3yCzzRPwom0gTcoonywks6M0MVxd9Qos7o23hiYSWlXKwGZ2Wl3Nhqh0ajr0+
         2YNsi4eZBqYv37DZFoWNF1J4MZ66ZY+x79LhTx8r8JZ5oXjhEH+cXJam8tCp38l5BVLo
         mrkz7HQ6y4GYk3iH0H2BvYHX1OLd1oNofdAsEd8BuhYExaYBl1UIhEUExhK1msvx528e
         /lf2BvzxjlOOpkLuq8C0MxqkbtD032f97ILQa0LHjtRkoEx0yj3wAlWdOU5jKadLyPZe
         5fkX+1+OBG7d1Pxvxeh2N24zY9v67AnQVjYQ8UKmO09+i7dBDruyfT0j3YmRmfmDK8To
         nHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747902133; x=1748506933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONODD9O59Xo3Ja6pqA8L/7sjkOJQ6kUNEStCVy7GufQ=;
        b=MgO56Jdx6O1pBLZwfy2CWNb6xAftcrmOCwMm5XZMJ6NocKXPEK9TmFJRWzCPXwZkWG
         u2M/5xLq4fr5k+lZYy9pmuTE2v24xrX8etqmDYsF3XuqYNh+jcRimKy7TA8lGlTxUYkr
         af+7RPHfD9KIcbWGR0TytZJfoDO0iypWYYWxI1u/6SM7ZZKCrl9rZsbh7onFP+46GANA
         xhakj4jWChZ5FaGF9mfaBo+HIB7XGYT+/8xG0HhFy6645DVdqg1xXRziMPqVqEXw3Te8
         70bJ8JCrsYDEiqzuoNcIB7RpG06f5PxebXDVyjICQMgq9Eg4Y7L6qvVi+oznqkoGO5Jg
         edTA==
X-Forwarded-Encrypted: i=1; AJvYcCVj/p8tqu6OtClnr6yCI8gAh0hGbYwFsIvNvPKSsRvvGWTY9D/NM59xuXruQd1IX7lJEeVoFnrAPque41sL2rw=@vger.kernel.org, AJvYcCXbIqSuO+8ZvJu39SYkh+e0Gg229FFaTtPXr8CtEJZeRs3cO/WG4O2q3ERatWUSixaNZi9WoFFStnrqZSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsT44Yr1ztTf8/pZStC5LfJ75UA7gi0RlJ8GmZL7WojQ8zWUzD
	r7PhxbocUaq35UNq7n9GrxeN4WQVETxBepZ7PDpvugbilIGoOlj5jB7Xge4Lu45uqME3ZVQ4PA4
	rdD8U1Mr1G/WHtdsp3y1sA8kC7EqrwYA=
X-Gm-Gg: ASbGncv6V0hvjSNlGs8B7OBssgH54+Kp5+t75qg3laQPg2V6y1IwY8RdPgC1vxO0IeC
	mKGPXzc8vhY9jfJVgwsuSTtD8dxtaQ/lwJ3JSWcQc2VrmRmmRHphoqZxellKorYa1+f56IS9ARr
	G+FND1QKNE/EMdHfUXJj/DEdlpsyqJP9gKEEz+J0om3CQ=
X-Google-Smtp-Source: AGHT+IEnwT6n67OpiIrImjuZYIvpN8McYWE9dnW1NEa8a52ATP3QKsZyj4A/ke0Iltd+2GuSC3YNtjYPS4g5jGlfdpM=
X-Received: by 2002:a17:903:2ed0:b0:224:1785:8044 with SMTP id
 d9443c01a7336-231d43980eemr116310475ad.4.1747902133004; Thu, 22 May 2025
 01:22:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326-topic-panthor-rs-genmask-v5-1-bfa6140214da@collabora.com>
 <DA2D41UHSQTB.2P6FHWB6TBVO7@nvidia.com>
In-Reply-To: <DA2D41UHSQTB.2P6FHWB6TBVO7@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 May 2025 10:21:59 +0200
X-Gm-Features: AX0GCFvSjSw4v9b0T-yvzVrFm3RDdHT4iKSbP0P7X-wzqcfGXVrYbTbpxi0kp1I
Message-ID: <CANiq72ny+uSZ8wNyqozTUNma1tKfS4du0yd4+nTjioYmyw25CQ@mail.gmail.com>
Subject: Re: [PATCH v5] rust: kernel: add support for bits/genmask macros
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 5:17=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
>                 // Compile-time error if `n` is out of bounds.
>                 pub const fn bit_u32(n: u32) -> u32 {
>         // Only accept values known at compile-time.
>                           static_assert!(n < u32::BITS);
>                           1u32 << n
>                 }

I think this was meant to be `build_assert!`. `static_assert!` cannot
be used when the value is potentially not known.

(It would need to be `#[inline]` too).

Cheers,
Miguel
