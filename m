Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCCF1EB3E;
	Sat, 12 Apr 2025 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744466764; cv=none; b=VYEbhsCNZyN9NewUR00vO7VBeNWeEd6LjbMmpZdsS/p0oGddJUhOHXg55Jvx91VbfHgdrd32oT4QwT88iWe5IuLVGUo5p7XeBex6+iCKMluiUp2WepiSzvFWVZrrPIwqocfBZVBQp8jP1eFoyFhiRVfY9r6qYVwuS+2PGkcsZts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744466764; c=relaxed/simple;
	bh=D4vtNM/AeJV6M1nJxyoGkOmqX6HuRM/R+DRn1WQhXck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iCVHgyArjd08C1eoz0G9ymSQ4p+0XOYDFJNPkHDyX6HHmtWxITb/AK/ndN9A2M6wH+F4dV3vcRD5/KaCct6oU8h1j1Wg6wLrmTbMy2b7InF+0HN+jEZ0lLslwppNXJEKpZNRpqkkvAVrqAGdARzsyUCDxaBjJSvYlZAzpN7NrN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q066v9Oj; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q066v9Oj"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff73032ac0so367746a91.3;
        Sat, 12 Apr 2025 07:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744466762; x=1745071562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpe5BZI98ovtJR4rpCzzkwuonA+MqIXKFFvSG9YBc6s=;
        b=Q066v9Oj2pGXdqhMtah51LBLFDKejxPVElG+paHf7Z/4l2mZeZE+HDuNLsBPmjg9y6
         nTSZQ9PhxMWSYfr7KuFdSLpUfdDlkM+rJ1JaJ+2hnq2KEWxl3Pf22OSK+6sOI8VkDDjh
         0hicEHBiT72B6NXcbAHX70AZX/40NojsZMh+0HJqNzDjEg+xwxPikHgNyTx1zMrgL9jd
         HNNpF/gWWH7sw3FdavG5/vPeJTdRh++5Jbvl6aT8qqkp+Jh9fMlug7mciRzSBbhBiXNL
         5+WNXAGaJYQbl7B4Gqp9uACUAz7JbAJTobb+Mb1soJTBPL5qJDoiuKo7UE8RHEFIcdfZ
         Af9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744466762; x=1745071562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpe5BZI98ovtJR4rpCzzkwuonA+MqIXKFFvSG9YBc6s=;
        b=DWCVQJrz98P2aVie7vtkqknwOh4+VqTGZhUr0EqOII4I1l0DwM+CfRM2WGZALozL14
         MNpdKXKYQZ0enJ49NbEEMSnXJMQazg5gtTViidryxrFP0ZMkSiMCXFaKQx7TzteObys3
         Zyj15AxEbslBg5oBEf66VRRqR6WddpIgx0f2cXX9ZmiYTr1/vSoHv6/owsIvM+JChRAI
         2+LswnV35lWY2Dk9BizuVtHH97nV0ZGAF0hXv/D1hJ3hMKiecq3zQXbIeAT4+asAR3mc
         aL6aRrXGyz3MILiUbo8+6z2/YHUyAdfKepKpoZx2QK+ostiNNOLaQv0RcTOvpgXv3v43
         Bt/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4Weu15MrscJ98z51hzN9hmTwGnCocnTIal4xXZ+pZv+PkB6dFaoiuvtqL6tkQef/nh48+kW24vxD6G5zQeKM=@vger.kernel.org, AJvYcCXNczyvuqgQHE2SOvoIuXcA1uh2q/ZeTO+ABQm8gCcabrWNwB0cdMKLbTcxNBSoAWFerqdYWkIRzNf5ZOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhYCp3sN0ueSLAYCG0aSP4dBkt8ylChc4nJ040m8vfj9ISWWOf
	hppTNttl4aWTOAparA988X0FK97hwPq86xemFwxyuERoyzdjXxO+pnmcT5RbB2i0D04y8urECCQ
	65mOBOWChrorV3Zm6r7VLKsWzbUM=
X-Gm-Gg: ASbGnct+dhSXMZa/Z4l3NxHBZ1nyBcomNggYNLFOwKs9a3REsqRk0rq+O8xtTgB36uM
	8hF8Wi3DWDkTT6MPCZ5fDZHOVSuiv4yImivIuU4AH4rDXN6ZrHcOIHM/FuQ6x5KwP3gW3sA/gfo
	fHJttEvGObnUZf9XFc5KZoryG/oMKDE8Vp
X-Google-Smtp-Source: AGHT+IEJwJkloTfnCLOMHYt4Q7+NPP4HVIwunx3KXcCNPxs0UYSvR0TYil4LI6tfaXqEKUKHS62BUgCAQLjwExOa5ec=
X-Received: by 2002:a17:90b:33c5:b0:305:5f31:6c63 with SMTP id
 98e67ed59e1d1-308237c9f1bmr3594590a91.6.1744466762136; Sat, 12 Apr 2025
 07:06:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412-rust_arm_fix_fw_abstaction-v2-1-8e6fdf093d71@gmail.com>
 <CANiq72=BoURMmkwqBzZ9Bzf5oXkZbUia-gZKJcNmVt7Qg8bKzg@mail.gmail.com> <Z_peBtLuLhEDHqga@pollux>
In-Reply-To: <Z_peBtLuLhEDHqga@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 12 Apr 2025 16:05:50 +0200
X-Gm-Features: ATxdqUG1Xx5WEm8-r3L7KoiOZGOoscCY1Hj0R9_I141AIMVcLI9vyEdLWS9jPaw
Message-ID: <CANiq72nf7m-_5FWdC1ktFcdPDo7BmFfgJXJEFfArgV7Bonu-tw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Use `ffi::c_char` type in firmware abstraction `FwFunc`
To: Danilo Krummrich <dakr@kernel.org>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 2:35=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Typically, firmware patches go through driver-core, but if you like I'm f=
ine
> with you taking it through the Rust tree.
>
>         Acked-by: Danilo Krummrich <dakr@kernel.org>

Happy either way! If someone else takes it:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

> Just note that before v6.13, core::ffi is required, since kernel::ffi doe=
s not
> exist. The firmware abstractions were introduced with v6.11.

It exists nowadays in 6.12.y (I backported it with the big `alloc`
backport series).

Cheers,
Miguel
