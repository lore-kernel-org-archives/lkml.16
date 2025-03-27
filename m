Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD6225771
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 01:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743038463; cv=none; b=BR91I2KW6iOVj23/HI52zmVZMc8s+BeMqEtF0r0YFapaxXm449qVgJhimBAC6s5eheG8Va+4GdrzrzDTKZrlXaDSATr8NLOFJB1Hg8TDOAxlGkfPl8eSkYA2Xq7wTDpozoGra4CP/9NCXZh2AdLRad+NOjxDoGZqDp3OdzIJcVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743038463; c=relaxed/simple;
	bh=rkxtS5suWD5Evz+m11GQWGobt3dWkXZJA9nOgREsdpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kq8bQIjL7249Y0vetAedGW/q2VgRiZyPUGoKm2RQ+KfD41GJ9SDDcz8GA27IE3EkgloKdHxWXZmQn3dVo0KoQfS0J2slYI3UO0BIoRTBGatNiWzO1qw1YIvQbd0rf2OQRnEe2MkF5qGtHAxNuF3X4lvcLH5HU8KsRBdqTp/U/F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fO0lC0Q5; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fO0lC0Q5"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2aeada833so89862266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 18:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743038459; x=1743643259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mI0EdooEMFFqAW+WoUqWF95O/QEtZzQxFpMruePbYtw=;
        b=fO0lC0Q5L7yl7BoWFzBl5s8MdxZCFE7o7aOt/C3TcVHso3WPBWeVNkAi/HS3g3GJk1
         ZHLjHRtkPAnHRHgdY576UtwsSsKyvhpn0JfbHDD0M9yVggBFp39i5Bk+IHCu7Yi0Ootz
         WTaoBDttKVa7MmH+vuxUVgX4d5fVMs4Bun1qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743038459; x=1743643259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mI0EdooEMFFqAW+WoUqWF95O/QEtZzQxFpMruePbYtw=;
        b=hlpzNABRW8lBsnU53vjWZfj00PAXDib4kMpQcWAR2UI0CKbyWIz7HEzR/fKFFmNTI6
         AEnBZ7MgiVa5KK/vhavVvmGEOXDhoLAYHUdvI0Pyw6Hdll+0r2qNA7smAFBHt2sFa54V
         q5lIOFNoLrN7M2w0HCYMJXdG28+ESNvjoOenQ5xAOh141PqHfNWkg8Wk+zqE6tsxdYBX
         xWuTyk2R8eQMcelJIiMPvlQMaaR0yd7NJ1WZ2yMNMFBJDtQnDTNOzJhcs6thta522d4p
         Hv1eOzCEFVDqWlvQgizvUHXgW+acZzB4QDrEQW0uB42OdzgeqxXZ2B9/6aXubMRUZnCb
         7XyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLDqXQWTcyQDqfrRJo4rhA7bo+tsC0PTFSt13YS0BItKdH+U2G4XAeqQa91JeDPXHWDv23cDARk1CG2cg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxjsfkNj09B8ihA6LwCN5P7zkf7JsJq/Nh6ord0Blk/sNWr7xi
	92E+LUoiUMtjJ8T9zdts62Swu+bf3k7nQLfzUWcdE18i4bTs5yx0ypgM2uM2LvX0ui4CKsVDJXM
	+jEw=
X-Gm-Gg: ASbGncsTFjKXukV2ko8TJXbGGMPybelj722q7xBdz2939J1W0oqvJCVJMrmT+R+klZx
	9L9t1zN0CGZgmB6PtI3P/UcVvEHDRuKuxW2mOwCNCEKlo6Q1lmRHVbTANWAJiGJVgrR3hCHbm4J
	A5DJJ1GhUaG1hKK+SMqoXnnWhXu0xMlUE5RokYyMqHiMaAK8YQSh8EK4pIwiAv9SmcsSWrfe4e3
	+poEjm/YZISXZGLbpLif03ymcZTtuH+2g1G2sGBrrBxIUkTQGGVy1tXIsBTNEhbifJ+0K7W9/5F
	pRDhFrYz/qn+jisnqMPHzaYb9Iu4DGgLfvJ6PK7jWGijjjPZ4Ij8UhVYD19Cd2PHyj62ujrdQNA
	3Hgc+B2HztP+gKbZ0r8I=
X-Google-Smtp-Source: AGHT+IHQ2AKobGxiQrlWIABMl6sW3Xucteq9Lxq9LyM/28SbmBqxNAnjHbAmGZxTDme6Z80ERbv8kQ==
X-Received: by 2002:a17:907:7204:b0:ac3:25ea:822 with SMTP id a640c23a62f3a-ac6e050a9b6mr595377666b.4.1743038458805;
        Wed, 26 Mar 2025 18:20:58 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efbdfcd3sm1133684466b.132.2025.03.26.18.20.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 18:20:58 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2aeada833so89859366b.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 18:20:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUsMC1csWqeC/EA5Ge32A5MFIVlt5StBeCYDaBEsEc69SeMu0ARDKZMWrJhEIWdcRfXKTe/QPCJFFtlUvQ=@vger.kernel.org
X-Received: by 2002:a17:906:c106:b0:ac2:b813:ac25 with SMTP id
 a640c23a62f3a-ac6e0a48dc3mr490833166b.14.1743038457610; Wed, 26 Mar 2025
 18:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d0ade43454dee9c00689f03e8d9bd32a@paul-moore.com>
 <CAHk-=wjbahY4JjLCXNT4o3xVq2cejqBG69z+MNfHsN9FQBnbOw@mail.gmail.com>
 <CAHC9VhRExVqdhHqs0njs7NY6bFg0BfcE-gMpS30HW9O7MSDfWQ@mail.gmail.com>
 <CAHk-=wi9m8-_3cywQCohJQEQtuQ+teS4gOtBkWZrhFWzNy-5_A@mail.gmail.com>
 <CAHC9VhT3D7X=4SpO5xbYm=JUwJqTa7tn=J6QMDBV96c7VBUw4g@mail.gmail.com>
 <CAHk-=wiH3hoPTxX3=xTRzRuCwktf3pNzFWP45-x6AwoVAjUsUQ@mail.gmail.com>
 <CAHC9VhT5G6W7g9pB3VM6W7wCEJjWfYSUWNgWF+rRiQ4ZQbGMEQ@mail.gmail.com>
 <CAHk-=whwQhJtafHN4B1w-z2Gno__xLHS4NouKKHrYNTYa8kz3g@mail.gmail.com> <CA+zpnLeK2Ecj1mBod2rFe4ymd9eXiJkbyYwFh4Yrmck3DVB2SA@mail.gmail.com>
In-Reply-To: <CA+zpnLeK2Ecj1mBod2rFe4ymd9eXiJkbyYwFh4Yrmck3DVB2SA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Mar 2025 18:20:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiBH8FBL+pnXui8O-FSdyoG-yX81mUF9bsZcC6rR5ZtgQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrMmGY1WBP2YbkNsM86xUUFOzf4O7ZMelOhzvZwerRqYfGCFS_CQ-gr9m8
Message-ID: <CAHk-=wiBH8FBL+pnXui8O-FSdyoG-yX81mUF9bsZcC6rR5ZtgQ@mail.gmail.com>
Subject: Re: [GIT PULL] selinux/selinux-pr-20250323
To: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>
Cc: Paul Moore <paul@paul-moore.com>, "Cameron K. Williams" <ckwilliams.work@gmail.com>, 
	"Kipp N. Davis" <kippndavis.work@gmx.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	selinux@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick Kralevich <nnk@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Mar 2025 at 18:06, Thi=C3=A9baud Weksteen <tweek@google.com> wro=
te:
>
> Taking one example from this merge request: kexec image loading.

So this is the kind of "why" I was looking for.

> Currently, any process which has CAP_SYS_BOOT can use kexec to replace
> the existing kernel. Android has 5 processes with CAP_SYS_BOOT, only 1
> of which needs kexec functionality [1]. By using these new
> permissions, we will ensure that this process is able to call kexec,
> while prohibiting other processes. SELinux provides us strong, kernel
> enforced guarantees which can be checked at policy compile time.
> Extending on this, we will use this patchset to guarantee that kernels
> and ramdisks executed by kexec come from known, good sources.
>
> The other hooks are of similar value to Android.

Now explain to me how the firmware loading hook works, not some
hand-wavy "similar value" thing.

Because it seems entirely bogus. Exactly because the context of
firmware loading is *not* something you can depend on. There is no
"one special process" that has firmware loading capabilities.

I'm looking at selinux_kernel_load_data() in particular, where you
don't even pass it a file at all, so it's not like it could check for
"is this file integrity-protected" or anything like that. It seems to
literally say "can this process load firmware", and as I've explained,
the firmware loading is done by random processes.

               Linus
