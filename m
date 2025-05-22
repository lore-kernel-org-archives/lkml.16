Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E682BFC64
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747944619; cv=none; b=KO49nxNMEDq5HILuU/AwF21cCUBx8ol0+MCUthc7qJ+VXE7EIde6D4EbI4M1G1rSSgOS3X+K7Ozprer4ybM45grPaBetngUAVY+SeLvLOtbx0Htn1l04I+m1j0YHK1yRNtJm2YI0jwFKcv6m7jK7sz/WUqWRwcXJ+0QC8y87AqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747944619; c=relaxed/simple;
	bh=u1d0amzEQMXWLc+O6o+EmY9H47Q/ZLgRR2P2wcViHWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8IXQei1d+oHg8yvjRGUHHMWov3RX4ktNj+KfVhUrxML69f6aELJH/7lXEO/IMrp7S791qKnaJisf8AXfIaWhIf0OkBG2T5przei3M0cwrV8VPHQ6n+imGDkeIUYz+v7dLSIU74y2RPuSZpvSTNnSblFhkr0T31bVPb2pLR7DbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fl556fUl; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fl556fUl"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a36748920cso5608310f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747944616; x=1748549416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zi6UK63Kniro/hiv/vg69lXNbuiW+Rc4uGAFOEdYP7c=;
        b=Fl556fUljacUaSLGbWtgKpbXHUXrH7uPQgGPfrjX3KR0zEHB/4GmEqMjK9OCeqq94z
         Bn8oiIWpZT6IoX6uJDM4OyfYFDyKDzEEpM2eAu2xd2ft+Img4qTmPLAASVD6X1BE37u/
         aRF2XK9oZt7FJiAAMy44KmBT0wW/s+jg0kxLFZ0cG1WQ8goucEU3TEMV+x3bNujiOK8v
         cUP5MaZlySPFYWlvxBs6uA7XO/l2SsodAaYTQscV+ej4fVnWH64606/gis6bDQxBRojM
         csCO4LwkEohVkZ30yoCSUBW4tBD9JkLYqC4amEwjjeqaWWo084R8Hneq2YK7REzztQpy
         ukHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747944616; x=1748549416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zi6UK63Kniro/hiv/vg69lXNbuiW+Rc4uGAFOEdYP7c=;
        b=HEAlrLiK3p+DW1qzkcqcMp++HWU2wmmtHG4432E82/tzZwZa6tRjAUAQkD/914jFp/
         pdqWXAguwnAImImdlj0rkmWe5BM8n7aSR+RRlJ81O26o4orUwglmJGz1geFyWLJhGg82
         xqYQ3tviAr97s71UlbSN5iafuce6l1Hj5IAtZb+sBw+it1RBrWBoKh/dSt6i6/mWjNay
         n/Dj4VV+ZJxwIila5bG/oOX3trv+HEno9JDF7+7t8ZAQgjaSWq3OCP9OKN9a5gNu0+FG
         qc1v15sPEtf7uVDqGOZbPDMrG3bhe/kbNsUO+rE3tD/75AMHwj0ybz84pK8z/U+Ls0fU
         25fA==
X-Forwarded-Encrypted: i=1; AJvYcCX9OX2nzryuus+Cpxh9buLLhNzKdFnikfNm5aYYvBFETQgo9QJ0qAnZGm+7I8rria3YPs3v6g0x2RAzVk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy7eFsXwFtg1ThuujnfrkjJkQMC9N8PIh7ApqfRs8Zu4EIkZuk
	5a6IKnPWFmtvFx2o6Z2VuDiZKtSyOGAMIBDPnRf2bY8qg/wHRQHjrTdTS+wYwbKK/T6If728w9W
	aeKhkn0mKpDaIxvYLOrOWSQguT8Ej6Krt2vFXFi05
X-Gm-Gg: ASbGncsqQ9+v0HcdbjTD9MxiW1pijTryfW/KQU9AlBhl4pn/lTArEcqyLShHnicTWGj
	XmlTTW5T+sRA5iGIggFLOR6tkw2m/epsHCXo/m9CmLOiCr3bDLKFnRy8y0KI9OTWIXQxjzptZ/r
	LF9ZJ7KuqjoVjTW+UIW7xGT97QMzx7VA/qrUlyIrfx4/29LkP/TVVPi/HnoSZrt/aReNxQAXJsl
	A==
X-Google-Smtp-Source: AGHT+IHd6YqAoxYw8miBcoEkIf/xB+HqLUuOOhvJRjCeKRZF7C69+8RuD1SZ5w0zECEw6IKhFE00IUJDA7Pw53bTrRo=
X-Received: by 2002:a5d:64c7:0:b0:3a3:6584:3fa1 with SMTP id
 ffacd0b85a97d-3a365844ba6mr22936770f8f.44.1747944615640; Thu, 22 May 2025
 13:10:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250413005650.1745894-1-ojeda@kernel.org> <CAH5fLgiF0kZdOYaQi18_LTNx6Onq-5PBomA=bwS0m0z+C0wtvg@mail.gmail.com>
 <CANiq72ngfTJ5PTYaJOOQ2NedERrLYzA62hL8Fgw5C4QkuZ2R-Q@mail.gmail.com>
 <Z_0X8Z9M2H0mmcK8@google.com> <CANiq72=ttuQYrGNDqNZDmBN5G4TUpna+ex8eD85HvOP723frDw@mail.gmail.com>
In-Reply-To: <CANiq72=ttuQYrGNDqNZDmBN5G4TUpna+ex8eD85HvOP723frDw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 22 May 2025 13:10:03 -0700
X-Gm-Features: AX0GCFsS36Reksqvi8aRibe6a18Oz-bTGUW4k34hhUquW5v3Uv-Z43TgekyqjRs
Message-ID: <CAH5fLggfFJ3TmoDbVa1SqOPywOHKDy85CR5pz5wZ8VpZj+Cr6w@mail.gmail.com>
Subject: Re: [PATCH] rust: add C FFI types to the prelude
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 1:05=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Apr 14, 2025 at 4:13=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Hmm. Maybe, but I think having it at the end is okay. Could we catch
> > core::ffi with checkpath instead of clippy? Just search for core::ffi?
>
> Sure, we can add it as a good first issue (Clippy would still be ideal
> -- it allows to check all the current code).
>
> I came up with this, which puts the right way first:
>
>     Rust kernel code refers to C types, such as ``int``, using type
>     aliases such as ``c_int``, which are readily available from
>     the ``kernel`` prelude. Please do not use the aliases from
>     ``core::ffi`` -- they may not map to the correct types.
>
> If neither of you are against that, I will put that in a few days,
> including Danilo's tag.

LGTM
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
