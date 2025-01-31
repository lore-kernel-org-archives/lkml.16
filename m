Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D941494D9
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314969; cv=none; b=XKcF2DflM2QglHJVWBcitVBpOBaitKcFA9YgkKMU/Kl+RRq8YdSEeK6ZpkAIEEl4Pi7QVNKgevKbAbd+MGrkH5UoQNkU8OLwASi987qDcjLENgW7/XWNk92wtgmXZqpm8nchRm7n8qSqmhxvS16auaSY2HQ6bjsbwuRdrSYNz/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314969; c=relaxed/simple;
	bh=GxIgiCsRud3+MZqjsqsikw5ZSvkIpx2F/MNXdjIwWAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0mhbdlaizNCzRcfFsC8bdaF+hVAweYzLGPZMpL/XPgGo/YSODFDHS/bNm7My3YPnQlpOeLpg7Hw/+xDkff6eFR62eevdQvarjfNpb3ZvPbY/W6IXiNy2WZtnaFOiHxofr6AFoA1w4QDjBS+zy50TabwI3s6YfRYqv3jRWx3ap0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JbcjVgCE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JbcjVgCE"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38be3bfb045so1927729f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738314966; x=1738919766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iv2kpTtLlGjUoGy2eHzUezS9FkVmsWPom4VM6f1zVA=;
        b=JbcjVgCE8kvzKtnripw2z+XzMF5glN8rnGQxp2CxRno+uc+DL5XcQRwJ27dT3TInD7
         8m5FSL/8V4CUahGF6NqwXz+yFKbhdk/ozO8qhscff8XRFgBMI2847kCGkkFjj2W6HkLq
         hSobwJKAjvvD6v/wGuZ2+HVEpKYgzq/kEJbJ7gE37Lw1lAxkUPJlNgz0jbiZKDT13AaV
         HgfII2TYuy+V0vHRsN1ADZLXOnnvNi/d2nDY2yAT6x9Rs7ZEGedWQAuvBbPpIBM9QPRE
         LdZE0HYl3Lb+FeVo/knx4dwrjYDzp3JdMmdDwELjDjFq3muLlNGvePS6d8bI2A/qs9ui
         4qNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738314966; x=1738919766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8iv2kpTtLlGjUoGy2eHzUezS9FkVmsWPom4VM6f1zVA=;
        b=RGO1d+0qQjLyA4FsvsBxcur4SKt32OonlGK9EyW7aZrP2lxIhvAL8Zuhb8+E+0Zfdr
         aabZrflnGsoEiDO3V14g5IqLpczL8bHLDyPgyvEcOfM81zWnPtTGqchRNMSnSr2vN1Zo
         RHJ7LU7dfHZ2XxMmWj0AAUaea0oC0HKDEuA3+yrs5jRBHpvxb679MTVk0wCTx6V7X8QZ
         XUA4b4MAEpSzuG1aU27ji3XkjG3X5ncdB2xpDfb+UqnJsZn0v+FLlNgfvO0PMVz6A3yH
         AbJnaJ9H5DM5D4gYiZ0VXanMqvIoAqjWBdYLKexk44vb4aVomQaxWwYNHZkcfSWzEMJP
         XtbA==
X-Forwarded-Encrypted: i=1; AJvYcCWgilestXN7rKxFNrOEBxMTOxbarhcl2TzVr3V1gtn9ImxWXbJN4/NwBP89tcVULZnFtOmSdhBEcvLXbDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRXg33630ycmmbmVoHn0xuPV49NEklarj4dSFSAJOCNE23WQCg
	gxG2/cXJqd/+bTd4omr1tTib/n9vVKdZgxNd4dlmEHsGkSemqX+q8xRK4QOvkb12YxEgMQByffP
	vEvFk+XYxku9uZcrhzVFkBsg4eEiUmm+LogqY
X-Gm-Gg: ASbGncsVeXTDn+zCKPP/rkO7lIhwwfH4iHB3krVyec64Cn+inaaDM6OBCKjc2u2UDI0
	wvRjom3AxgdwrufJyX746D85sqoDREaoU1PxbtR7ioa+aYWz5TkNRI/lymz1/fCvD/OhFHGdDJa
	4dW4aQPFKFoeLl/z7vFvYihHXOd84=
X-Google-Smtp-Source: AGHT+IEGWROdbt2kjhSAWKfEkANcNBHEV13oGqmUWBNBp4NiSuVi5J+mz3NpYwqHZ9ay7jD4qm4Af7imVhjiAQ2UVEs=
X-Received: by 2002:adf:ea90:0:b0:385:fa30:4f87 with SMTP id
 ffacd0b85a97d-38c5a86e2acmr4959111f8f.0.1738314966314; Fri, 31 Jan 2025
 01:16:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130185138.200993-1-trintaeoitogc@gmail.com>
In-Reply-To: <20250130185138.200993-1-trintaeoitogc@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 31 Jan 2025 10:15:54 +0100
X-Gm-Features: AWEUYZlqmQgrSQzzaYE5VYGyXQMf8iB9X_LdBKfHz7spc7nE1fi5lYltyyhedQA
Message-ID: <CAH5fLgjM4SUEmhW334w_o0Zfv3mUZ76Nz4GnE0H7N0Y=e+G5AQ@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: create the `get_mut()` function
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org, 
	boqun.feng@gmail.com, longman@redhat.com, ojeda@kernel.org, 
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 7:52=E2=80=AFPM Guilherme Giacomo Simoes
<trintaeoitogc@gmail.com> wrote:
>
> Create a `get_mut()` function that receive a mutable instance of Lock,
> and return a mutable reference to data because if the instance is
> mutable, the rust compiler guarantee the access control.
>
> Suggested-by: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
> Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
> ---
>  rust/kernel/sync/lock.rs | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index eb80048e0110..3f9d78bcb37c 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -140,6 +140,12 @@ pub fn new(t: T, name: &'static CStr, key: &'static =
LockClassKey) -> impl PinIni
>              }),
>          })
>      }
> +
> +    /// Get a mutable reference to data
> +    pub fn get_mut(&mut self) -> &mut T {
> +        // SAFETY: the caller must guarantee that the instance is only u=
sed in one place
> +        unsafe { &mut *self.data.get() }
> +    }

As far as I can tell, it's impossible to call this function because
you cannot obtain a bare mutable reference to a pinned value.

Alice
