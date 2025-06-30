Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7FE28B7C3
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290429; cv=none; b=ZOEHbaAX2I3LGX47YI2N3G5xj0isu3yMMINNwYGcCee81t0twT9+vqP8NUORmSWLVmqKHEtXxhDcXIgE6mMxb/xphj+3tdxNdlNvg0ytGGGIKG9ycgiUIUvAbew528BOXbOkm2chmXwW6Vl4AswRdP1XaprLfaRwa05u1Tvpno0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290429; c=relaxed/simple;
	bh=o45INCbiSeQE2IgHq1YnHw8Gfkpjyezwdh5cW/jtGEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M2mt34bp8xXoW2J9sDLkilmhWd+7ovc8+tMXp4eLkbCkXGjdwsGgYKwFvSZVSxMKL4SsbSv9kVJh8e0ZdQMZu+aBv7yaX5qeFiXBfhJfodUUpYUMWXmctel8dwl1bJP05Y3oojnvIJ/49Nut5Ni2vya2KOB8mQYDaOZbD+DiC9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nEDF8MM2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nEDF8MM2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453749aef9eso15905565e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751290424; x=1751895224; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o45INCbiSeQE2IgHq1YnHw8Gfkpjyezwdh5cW/jtGEk=;
        b=nEDF8MM2pc7lbtsVi3CTNhTyrzz6UkXzdgcX0fhTCrPjr834pmMvFk52be2MR4awJ2
         2iZxXtR+m0LYrOA07pY7LU8wCNwAHrg3qDBc3H1e+CWspixjdCYJyNEtNfj9nqyiaAWQ
         i8qZLNe68flg2qa7cKoyhxqVfNuPLX8o31yTJFWrvC+gTfrxY2X7kv7LNDgxz0kDg8+M
         png/m9NgUoS+8Ictbqop2IAFtG77TozE36kwQ5i0J2B+B/MzQgRUHDjY0RDjgddNQW3I
         OrPQBM/IGfi+N0Nk/dSbQbFUtBO9JTWu1S2LAAEJeOWhjPew/dnpviw0LX7IYKD4+Jrh
         o/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751290424; x=1751895224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o45INCbiSeQE2IgHq1YnHw8Gfkpjyezwdh5cW/jtGEk=;
        b=Kkx1Q6U6I77xAZvVJPVO9HOdbMliLK4gaQMWmshNZbiOMB7nBqgeCIpHivShTu+YRG
         yk8TP/62FC83JgnwM6VcJ/8LVSqVtTsR1wtmOF1psUCcmILXVmAf+96WgS32NuKER6tQ
         wggq09GxzQOM17ii1cPfktoW44he+AoXVUbQG+xq+pSloYmZSnLpJ3MR00JWyZQR40nh
         hjbHq8nWU8U8+xXjPNnSAnA1NCUZczeQO+8ruvasMivg5R5d4Hh24PyaxfiPQftM12oY
         ZVHt54iIDMDCQzxArP7BskHXDY/1ISWio6/85q+2iw0WTmy9qL/DKS8qdCXgMddyjECe
         +RmA==
X-Forwarded-Encrypted: i=1; AJvYcCXx+s7I0zfZQgrdWlsBZxfGZ8H5PULJotHnzVCDMGDAT2J1pkqRNEPnDmoCF7w0Y8BvIn1F9wS5gRomJLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzaXL8OgbxhYXDTv0RDz60ldEz+0ceS5hfSOsxoGiup/l8Zcie
	KRer/qfPN4do451OtxjtTElCYlI80WnND6JiNvSu4LqNhbdczFwfZ4N/zLTLC8SsBybyBGBxE/m
	pf6H4dzzX/0vxEcBu2RO2zXnSg8JfQaC5/1Yzt8Um
X-Gm-Gg: ASbGnctJXq4wdwR+vj9lFa70FQoeBbOWiXe6dtQ9QCkC0Gn4tE9ccl6B/zadaTlWGO8
	W/XokgMPooBVtikgf3jgcMX3WtdalHLZ4TiRIVgYUgC6XhJQ94CWHd0a4TtXYnGp6gx56gbNFBb
	4JOKmA/8BG6NWiat0+JBSal/tnC9408J+qOpmedCFdOliXCJgNDRVV6Rym58Dws/peMrp0tz6i
X-Google-Smtp-Source: AGHT+IGVJu/D277FQPc0r0siJTAo3I5FJWrKQJdxkbD3ntuYhNVrd8Ps5yu0EVn0gdE5xaSnpYRMnPIuj1WaKYAXRKc=
X-Received: by 2002:a05:600c:698e:b0:43c:f513:958a with SMTP id
 5b1f17b1804b1-4538ee3bb38mr125353655e9.13.1751290424357; Mon, 30 Jun 2025
 06:33:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630131011.405219-1-fujita.tomonori@gmail.com>
In-Reply-To: <20250630131011.405219-1-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 30 Jun 2025 15:33:31 +0200
X-Gm-Features: Ac12FXxucSgJGsLEUQk81gSz3INXTFu7cO5Eq9OXyDy2vbnALYwRo8UAsMt7WH4
Message-ID: <CAH5fLgirsNn9WwEUgFaY2z9+9gG3SWssCoNSzpE56F=sS02kEw@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: make ClockSource unsafe trait
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, ojeda@kernel.org, 
	boqun.feng@gmail.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, frederic@kernel.org, gary@garyguo.net, jstultz@google.com, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 3:10=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Mark the ClockSource trait as unsafe and document its safety
> requirements. Specifically, implementers must guarantee that their
> `ktime_get()` implementation returns a value in the inclusive range
> [0, KTIME_MAX].
>
> Update all existing implementations to use `unsafe impl` with
> corresponding safety comments.
>
> Note that there could be potential users of a customized clock source [1]
> so we don't seal the trait.
>
> Link: https://lore.kernel.org/rust-for-linux/Z9xb1r1x5tOzAIZT@boqun-archl=
inux/ [1]
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

LGTM:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Though you're missing `` around [0; KTIME_MAX] in some places, which
may be worth adding.

Alice
