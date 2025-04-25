Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0106123816E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573460; cv=none; b=MS+NkJDZaVTJ1SmFRLVm7aKSk4X9rztU+FEl7cV78h0ym40MOCgtLNzwvrUaixzi9V4l8Bn7zGwNT+M/gdhx28oM4vDNZyaWpPzxz/3OTtIwpSZ1+j0ZN+0/19B0S8uW0EFqUnoMBpxkDQ5GpiGDIYi6Yv4EKVPyCs0vBbuk0UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573460; c=relaxed/simple;
	bh=9qmt6GotGtFpPUj43Q5GmrTRbixA9WR9tVJV9/RDqpk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=da5q56loQPIYWyIqiTMgBbpRZDzKumlKRKwiHX4GQzqWDfdAvNVPQxPYVzvXC9eWbs+PYOFoKj6I911T0xkeIRVAfa9Z9xFT/HvajO9w1zWMVYOflSI1IzZcKwEWMOSMFYB9enjmYtzKkyJJgfzumMV1OhCL8Er/xz+2sK07S9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G4ZB65Pe; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G4ZB65Pe"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d08915f61so10347045e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745573457; x=1746178257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qmt6GotGtFpPUj43Q5GmrTRbixA9WR9tVJV9/RDqpk=;
        b=G4ZB65PepfYPVUKTgDSyDgQMJ+g4YGHnftPlwhGAh8bd4ZUeUSO6m1DJh39QhtxZY5
         njU+igAcDfWEJ/jobGwK2hHOtOG6iczWDSHNIifoYb4bsoxzh/BK682QrDDuS9U7tRZ3
         hZJ5rgA+hL0nDrK1/RJdP8WO6f+qYaa7Ke1W90g8JMZZzFI5gKY2e8qrPHEUenjiD1s1
         61guFE6xNVoLlEfLvqj7ogQBounA1uAytotQrAn9URR6P9M7qO2p7jMiVddjO7B8X97w
         sHUSYpg5mwszy+DUl/Melmz+AhGHQIzkHLYo7azyjNyvWl3yj3aOjZIv2uZL3v3K4TA5
         25Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745573457; x=1746178257;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9qmt6GotGtFpPUj43Q5GmrTRbixA9WR9tVJV9/RDqpk=;
        b=W7Lye0xMJbYLnmfDMT40qBL6fK569pQhRw73Y/1iGM57QZv0HntBWujN3PQV4Pe3ny
         Y4DWDbXGi3EGOPAkXQB4KsP7lB+1FvPyhlIE2gou8L0/MeAJF7aKhoMDU516VUen4lL0
         juvOFZSkwW9ggLLwN2sJaEEw8KOBAa3I8soO7fznil7AnoDBkcp1+s5LseHE+DeSrVge
         jclw2KNhweMp5YT8t7Vt7h0ueXNQg0Mc+oEXTdHhOEkqg0+WSEbYpgMJHsNsjCCXu/ly
         McyDAxZXEz1sLiSk5sH1SHFXDiF7fIlSIwRE2tBQZVlpc0VVhrf/gqJXxRVteQd30FKU
         YQVA==
X-Forwarded-Encrypted: i=1; AJvYcCUkFLfmYVvnTqUpkrUkTMMT3QKCtLHpDQMhr/WCWE7H63jlTclBecD9QSFhfoEk6cJfY8aRJD2cvwInCXo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc1wvduDk5ebjCB+U4dd83F/MvSoeQh5rQgKzIEBYZfohe7ndf
	hejITlpFSOUqLQA+cltvjyjT84ooStfe5vkaWFj1dYCL+jfmy5JNgXnoHfe2PSZxHFjk93cNknL
	IimgcmdkCFOjSng==
X-Google-Smtp-Source: AGHT+IGlhetKP7RZkN9IbOK83mTWI2fUL6K0Iol1JDx9CasoRoJrbMiASrCXxGML1ttYmKpDCNVZuZi/O0aH9ro=
X-Received: from wmrs3.prod.google.com ([2002:a05:600c:3843:b0:43b:c914:a2d9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b0d:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-440a65b6fdamr13947755e9.2.1745573457455;
 Fri, 25 Apr 2025 02:30:57 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:30:55 +0000
In-Reply-To: <CAJ-ks9=wr84zoxsyncOu==BQUS+Y7Lc8CUgfgKwuJc9imu87rg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
 <20250422-vec-methods-v3-5-deff5eea568a@google.com> <5fb8bfb7-961a-442a-b091-0349c8aa5ddc@kernel.org>
 <aAokixHVo5YjazmL@google.com> <CAJ-ks9=wr84zoxsyncOu==BQUS+Y7Lc8CUgfgKwuJc9imu87rg@mail.gmail.com>
Message-ID: <aAtWTzUjIZ1F6aI1@google.com>
Subject: Re: [PATCH v3 5/7] rust: alloc: add Vec::retain
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 09:49:18AM -0400, Tamir Duberstein wrote:
> On Thu, Apr 24, 2025 at 7:46=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > On Wed, Apr 23, 2025 at 02:14:11PM +0200, Danilo Krummrich wrote:
> > > On 4/22/25 11:52 AM, Alice Ryhl wrote:
> > > > Unfortunately this can't be a kunit test because it uses the upstre=
am
> > > > Rust implementation of Vec::retain as a comparison, which we can't =
call
> > > > from a kunit test.
> > >
> > > Would it work from the rusttest target? We can use our kernel Vec typ=
e from
> > > there, but I don't remember if we still can use std Vec from there.
> >
> > My guess is no, but I don't know for sure.
>=20
> Isn't it possible to write a test without needing std's implementation?

I could probably come up with a different test.

Alice
