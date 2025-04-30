Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A22742A8C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745989605; cv=none; b=UP9IAirlYgq8pUW4n0hnHqbvQGXZRIlwsMrafr1DeSDF4bmZShghi+JEiF3cUY6dXomyu0MWbBkaMAYtRVSEvGXg75Lq351yhA94+9farJeoXRj4bPyoVK4ttX2exCHv0ov7T0U2eNq4r4RkH/I/3v6I8c1mTsY7OgdetLtcGls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745989605; c=relaxed/simple;
	bh=LBI2fG5yl1PAjdo0BMunHcJDpVY8i6Vg1flsFNpReZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1+lYvDrK8pXY/2vrPTBpZC+3tvIyOFG65j+8tJM9QgdawNuKUfXLglX/6FI3nEFFpQkUQszrojKDUREGYm2Puna6gFpu8RU1qbw55YJFEztNlgaCbDFVq0fnP9gfgNcI1UUxLTPxF2sEeoDn2710HmM4mInNXxS65o10jo9yW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXHAsxsY; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXHAsxsY"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7390294782bso1046491b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745989601; x=1746594401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPXDhh+HvBh4rGOyWQU6Gi61Wi13PrW/ZJi+FHXHhnc=;
        b=iXHAsxsYsHtiQF6CzCBgN3IavET4Y3UVj4Kl9JocwhIEecrxubp5MsFT3gdWvw3ziR
         tJAScGz4+CJtFBbJn6lI/RiVZI7iCS6d3QJTI46riNUb8nadnhecf+H3VRk7byNLp2YB
         SnfjIgYBOYYQjsKEh5+AOZmbE4LTK01cq4PLe27mExMwHDHWovaCfQcbCq2VpmgEEYhE
         Oggb3p+sKDrQkWPysEk9+NgG5KIv6/mZr9BOldVYlamX93GOJZz767+LUWfN0d2n5F+E
         lTR1B8n568Lwg8PzxayiGCl4zs5maTUujs5FfHnskqGKEeFaG2/hWrzir7k/9J9xxEF5
         quAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745989601; x=1746594401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPXDhh+HvBh4rGOyWQU6Gi61Wi13PrW/ZJi+FHXHhnc=;
        b=EO/15TziWKSySzuvlAMrZ3To9SKyH9G4Bpfm6sb1WtJYOBQZjQDjcl0YVNOhag3Lyp
         y8e4eeP/8SbFCXbthXV72x1hxQxF/DqxeM/PlQ1yUGknS1YUFyHAXjmDF9mtHZ9C2wVW
         t7n0wM9IZgCN/t+ysGUIfKxC+iwPlz/aErJ1QvCcGpN0CZt81/jeP7ylmkCRsgjVeBLx
         cABwwnM8hmHM5YIKhGWAknhtkPCSYIJ98jvf20MoUnuJNtCe1gkFuJVkBBKGx8mToqHg
         tmnHUTydBU55JnpslNqBIexE10BcASFASeY/u5jKdRw6ee3QWwELe953k7fnmR/q3tGh
         8hgg==
X-Forwarded-Encrypted: i=1; AJvYcCUii4AfhyaZGgjNH0NuqCr+jZ4rZYu7wGjQsSpQcDKf6pfyw24eCc+jMF9YYKPbCb9GKibY/xA78Q/I1Io=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMxdAjlDn2NJ3NN/JXV2URQgAWkHPYkTRoLgeqq3Vn0TJDRN5P
	siA+GsYLNN+Af4leseCXdHx1RQnYrhZOk+Cox6et9jFH2oF4EjxwOiS1CKCMJGWxNJ3hs/NgxbC
	2WgcBS4plduQbUDoXoS9j75tjrrA=
X-Gm-Gg: ASbGncuwmNG59NGTfA6Jr1tkMb5Ek8kj35IfXJ2TNnLCHBkRQBm5cYi4IJeOh+h6nnJ
	4U0YX5pbwmc6G+ooX2Y1dvKWOKMevy/q9fYFbajypYrv5E1O4q75SEwb7x0fDAoFvd4tL3cWP+g
	K99rZVoFz/E/zWuz3f1+geDA==
X-Google-Smtp-Source: AGHT+IEzqC4paYNq+CnclUgZwSKfOpMtymiWrVElxIXTnJhK11ZchV3pDUjrj8GgmxCihX2zoLbLZ65xRi4DAXKpYpc=
X-Received: by 2002:a17:90b:1b50:b0:305:5f2c:c580 with SMTP id
 98e67ed59e1d1-30a335595b7mr890206a91.2.1745989600684; Tue, 29 Apr 2025
 22:06:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202504301208.YQCguEmE-lkp@intel.com>
In-Reply-To: <202504301208.YQCguEmE-lkp@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Apr 2025 07:06:28 +0200
X-Gm-Features: ATxdqUE04ahtdk0VVUgpSRZDrUSkdYxIwl2xeO0hSjDBIOSm9RZjm6rJjgvOkwQ
Message-ID: <CANiq72n6tTox7jMX89p4vLihghrJeDcBL+MWR8rp4_Y0LyxcKg@mail.gmail.com>
Subject: Re: error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
To: kernel test robot <lkp@intel.com>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 6:55=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   8bac8898fe398ffa3e09075ecea2be511725fb0b
> commit: 584e61452f75bfeac2cdd83730b4059526ec60c7 rust: helpers: Remove vo=
latile qualifier from io helpers
> date:   2 weeks ago
> config: um-randconfig-r063-20250430 (https://download.01.org/0day-ci/arch=
ive/20250430/202504301208.YQCguEmE-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf=
1a2591520c2491aa35339f227775f4d3adf6)
> rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250430/202504301208.YQCguEmE-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504301208.YQCguEmE-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
>    --> rust/kernel/block/mq/operations.rs:15:33
>    |
>    15 | use core::{marker::PhantomData, sync::atomic::AtomicU64, sync::at=
omic::Ordering};
>    |                                 ^^^^^^^^^^^^^^---------
>    |                                 |             |
>    |                                 |             help: a similar name e=
xists in the module: `AtomicU32`
>    |                                 no `AtomicU64` in `sync::atomic`
> --
> >> error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
>    --> rust/kernel/block/mq/request.rs:16:20
>    |
>    16 |     sync::atomic::{AtomicU64, Ordering},
>    |                    ^^^^^^^^^
>    |                    |
>    |                    no `AtomicU64` in `sync::atomic`
>    |                    help: a similar name exists in the module: `Atomi=
cU32`

Cc'ing Andreas.

Cheers,
Miguel
