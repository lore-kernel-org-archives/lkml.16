Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9735EED8;
	Sun,  9 Feb 2025 03:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739072558; cv=none; b=TpiUMb3WjfPVLaPyz+xirm2yxOYKFNQPjRkiL05aQ87ePZhu+BFBEGKJXkApgt9M+1B3zwE5ZfLVjJzEicERrwkb0zhzdJsQogCRR7O5j+CXszcJ6tJTp+q75OR1VeHauW9AjIRZYUkA4Cn9mI7mZTNA+dEbeiPfcSJ8ziq85oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739072558; c=relaxed/simple;
	bh=9sm3gxMiOwsNPRto3FrFWPnVsGg+EBADVuq1/l3kytk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=bnMvxTjRRfcVMEEHgCfDhwmYuKByEVQsiM2OCqx+LWYme72700gUwj1iUJ9v6Wfsk/4aUyCk0M6hywIBt9+rQz0Bmr1fc4bOqtrvc5LejVKZAcS/hU1bUVOviX5WkfKUqd0iq6BrqpjwebeXdeuExywCrqcKqjivebuktoPd5SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkTbDuIK; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkTbDuIK"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f9ba87f5d4so4691459a91.3;
        Sat, 08 Feb 2025 19:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739072556; x=1739677356; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sm3gxMiOwsNPRto3FrFWPnVsGg+EBADVuq1/l3kytk=;
        b=NkTbDuIKhEKhOopAqIaF6eQYUsxRFG35XR2otG3PdKgQrzVR8kwqVlTqX6zy4Vi+T8
         rWw7yiPT0vLDLYqrvOAPT299hifhcd1zZMlnzlZPj0g09hQTwy9uC4dmMB+xeJ4X1feE
         e8jwfleCmsYDpiGWo5OYWGzOmNo7uhfJSaXKuIi2P0xa70exi6Ntlj3w6a6qO7nNyh01
         dNJqLDaR+rB/YiOuhO8jyv1SnQK0L0od6cwn9wd9lN2cvUUl74bhyI52Vz5kVY86l93u
         6sGIV95vPVGmh/QtwlAOalBXUDZBKPEnxhjZwp5U2L2J+C9OnBcyXJfrbxjiAkmWZGhQ
         ZRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739072556; x=1739677356;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sm3gxMiOwsNPRto3FrFWPnVsGg+EBADVuq1/l3kytk=;
        b=ObufBjXfRhBU4UmJeKcXOK9ee6wioW+AR6szLjPwuKUayaYuuVNabA7GxSGEumE4+I
         rvt5WlFD1otxcv20TIFqhWjhjceEg+ZEdRSIQQkFSvy828IQmL3qJQWBcHGglH+izyfS
         it4ocmlcznzDlzlfledDihVkfcDvzC9Ik3h+lnIwmK2YH8EtbxPF5Rdo9RaNSf4Zopps
         XoxmjFsh3R9KEHYthWlG47EwXNLO7RVhxiLoq0YpNyYeTtaXBe7m0tlGnzAgZhM+dRW0
         rqn4AFSlbIcLpNtWF2CqWVUd/7IbMPXR9vrR/zQI12qFpNnyDKDbwf84+gYa0NkOY7yw
         cO5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWchY6NOH+uvMJcQnju2YTRwe8Uh0JpkF7tROsMzcHYi3n5SaK9++0N+IUTk5tM14hDEIzCCTeQPO523Oosh90=@vger.kernel.org, AJvYcCXCrjZTwaIzMxLEmHUaMIXerniEACio85smFtnLg8q9aZEnP8mlpCunTY4dT+q7nb62hfNkPlt7b5ThauU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXYsdtyQ+O+8VlKiHCq2bY7db54RbfomNEZ30bqOz33/LVP4Zu
	Ag7aYHS7HRjwpaJw6SHyBkYfnAuiUJMvgsiSrTlsXg3yjXxON4Sx
X-Gm-Gg: ASbGncvUXlS3tkOA3e25KxDf4Kwm6RHr0eHzX4kvQA3J1eDoWeq4IYav+pTDiLotD5X
	W9SaJiEFufef3OmRBBKr//NSJHeiWMsSh4cClGSh3kvoZ/TWAV+naT/n3zOGBO6b+cqpIRUFpsa
	Eu4FIDUx+teRrh0QXht+5nT84XyTjTKFdkaSeIytMpkxPyFd6e6t4mLEiROb6k9tf7YQCiC0TEU
	kPmmqy7L+e2WrPJg3/rKRlJKmEX5Uxfzz8rr9z7UEMu84I2TNHvQmIH0uiJjTgKaTglQ2zb7YXz
	hAOVJ4i2QFKjmvzr99fwRwmhDfO86CRUETwcdg==
X-Google-Smtp-Source: AGHT+IFIGPvbys18Pg2PiTRNkYOvGrVtZH0DY6ZMJMhtbD5njuL33AsHDahXPogl9WTOTBn7c+mybg==
X-Received: by 2002:a05:6a00:2e27:b0:725:db34:6a7d with SMTP id d2e1a72fcca58-7305d5931cdmr13418207b3a.23.1739072555893;
        Sat, 08 Feb 2025 19:42:35 -0800 (PST)
Received: from smtpclient.apple ([2601:645:4300:5ca0:581a:da0b:12d0:f2d4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048bf1413sm5423354b3a.98.2025.02.08.19.42.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Feb 2025 19:42:35 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
From: comex <comexk@gmail.com>
In-Reply-To: <20250208204416.GL1130956@mit.edu>
Date: Sat, 8 Feb 2025 19:42:22 -0800
Cc: "Dr. Greg" <greg@enjellic.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Hector Martin <marcan@marcan.st>,
 Dave Airlie <airlied@gmail.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 phasta@kernel.org,
 Christoph Hellwig <hch@lst.de>,
 Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com,
 aliceryhl@google.com,
 robin.murphy@arm.com,
 rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 Bj??rn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C0508D03-FE8E-4253-A29D-97E7E3768CC4@gmail.com>
References: <2025013030-gummy-cosmic-7927@gregkh>
 <20250130172437.GN5556@nvidia.com>
 <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
 <20250207121638.GA7356@wind.enjellic.com> <20250208204416.GL1130956@mit.edu>
To: Theodore Ts'o <tytso@mit.edu>
X-Mailer: Apple Mail (2.3826.400.131.1.6)

On Feb 8, 2025, at 12:44=E2=80=AFPM, Theodore Ts'o <tytso@mit.edu> =
wrote:
>=20
> including an upstream language
> community which refuses to make any kind of backwards compatibility
> guarantees, and which is *actively* hostile to a second Rust compiler
> implementation (I suspect because it might limit their ability to make
> arbitrary backwards-incompatble language changes).

Rust does, of course, make all sorts of backward compatibility =
guarantees for stabilized features.

The list of unstable features used by Rust for Linux is still long, but =
getting shorter.

https://github.com/Rust-for-Linux/linux/issues/2=
