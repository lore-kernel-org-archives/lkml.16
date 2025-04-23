Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925D82701B6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 12:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745409866; cv=none; b=iOiikhgoChTJHNKCKeEDhdwLc1/thk/2WWWF9j0z+zgZVWlhCAyPSM8lsbrBhIA6CLiiYLchYqTUVZ/b4MX+xSfr+YhxpTo92UIluB/OPqgm8cIGhkTDpS+08AmJgy58trzXOHRMxtXqjMPV5UiFneYtFxGLilrsqPn0jUKdvvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745409866; c=relaxed/simple;
	bh=cCFAcmGHFdZkxm2uqfupFCuZkBUXpbCaHkYbQIAY3PM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JxEKXrilz7VQX+qhcIuLX0BQGGy6fELmHH+5BGfPehAvLk3APZAz49r5zAIkpyoD0WcV/fVCzEDq7+VMDSX6uNlLn3rz3k2/FGnXEzWsusTnoXQWcWceAkVHj3kaQkSCGxdlMy+44UT/uAQyqKFN49Y7jyNixQGvs2XEHyNg8Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yRU4jF8i; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yRU4jF8i"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6021e3daeabso3004831eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 05:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745409863; x=1746014663; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCFAcmGHFdZkxm2uqfupFCuZkBUXpbCaHkYbQIAY3PM=;
        b=yRU4jF8idCm22UvFcnJ7WzGLlFz8diuMU8tJK0za+7ZZMojJcstgExir0RZpROcbCT
         aKvEg8hk42H/RZX+lhCe8U7Vt/mK5gMXsiLmTwhYBV9Fiuo/JeX0oMHEADXRQGNO1YkG
         mMrIJDGAESes0UqcjpphLHDgNJz3KSrI7mof5N55a7EaK7TIdFmiML+TAYyHoDsCuSPb
         A4z4edqxamg5DbNfUeCt4EkKabcMZh371lUJrSgj+MbA1Hc1xA3kWpSmwjompTPcTX0i
         Ta8AhzLDRhNTreoe/2WTwUut0pigX/XujV/ie3o1qKwHnmPezjAegRvaWuFzlIy1YgfD
         jzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745409863; x=1746014663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCFAcmGHFdZkxm2uqfupFCuZkBUXpbCaHkYbQIAY3PM=;
        b=wsgqkUtcF4yJ7VdnfjlofOArZTigWuAykSrWzEJJghEMlDLXZ/yk/85DoRQNbLt8wL
         ncnSx93H2ea3nNjD4Q4THnImZNC4FQSpQxaONDpKvPr7s52VVkJ5Bi2BvzuQztZvoDwT
         2M+LdNyuJj9kNRGtOucF+djHVXcGbCog7pkOWHOt/IV1TFhSc9kGtxMnKu35OogtkGyY
         8WpdJe8+n3G21ZQR6vBDae0sRg4Kp2eZga8W0kJ6VqT/txB8b8AJgVM/eCDxDMMw4Rxh
         gKb4px0X2b+0OY1VmyipNU/s5l0uT0MI6MipJvYhD4KMgIo7+oVCdy9LB2JoTE34HCQ5
         +OvA==
X-Forwarded-Encrypted: i=1; AJvYcCVaqKdEZo5B1+xOtJVSaL9FnCj5VjVv69am4lWBrhM8DY1d2jpwB2VoqSnmYf08LxrpaDmtQcAvfx4qMvo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq7L4XWBJG1kbc4fBUxOUgLfSINHSNi3YOwxuEdWr7Zo8AbE5N
	i8xxZsVCrIK3NiUDvOLiw3pslPBSreuPE/aStrdUTC0iMQI/aUwc9/Q8FLsWeCnxQ8md6ye/tPn
	xgYxyBzvCuHZ9VEuxl5SpPkUbDgTX72MAVjrV
X-Gm-Gg: ASbGncscW2VP+/mNIw17BlWTe6fFpbLZXbkP7isAVh1Dlt9aln1gEehhBLRnOSOsX7m
	Io2FkJzBNEOrrBxzpLEdEldVq2ST+QYX2+DKntnUEiwtGcnZHzASGg3uQ7OVQ9KZnd+qp2PpQaD
	AIp7mtsgnp/qAuGLoeRqW4/pq3GrV8A3gwruumECW4TWeGo+QakuOZ
X-Google-Smtp-Source: AGHT+IHtAoPhdSQyG9FSnh3fdkHKJbNMU3JAx95nsaw3V9H68oVSKmPKKX05xSqdcM+Dul4VdI4hLYaUr1yMLlmi0bQ=
X-Received: by 2002:a05:6820:3083:b0:604:ae66:1e9b with SMTP id
 006d021491bc7-606005de025mr9834346eaf.8.1745409863451; Wed, 23 Apr 2025
 05:04:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321111535.3740332-1-bqe@google.com> <20250321111535.3740332-4-bqe@google.com>
 <Z92N8dyIE42ROW2t@thinkpad> <CANiq72kYzx7JTVqrJuP0Wo9=1qtaN7s7fqkD5DDcjA59SgMizQ@mail.gmail.com>
 <CABVgOSkjYFwHhQfbmY83iK7crq9ZN9+93Xe514ndhAm6Me3UwQ@mail.gmail.com> <CANiq72=rbA-Tie7JPY8rj5c5iHBqV0oYZvx5AX7UAJvp1ER7MA@mail.gmail.com>
In-Reply-To: <CANiq72=rbA-Tie7JPY8rj5c5iHBqV0oYZvx5AX7UAJvp1ER7MA@mail.gmail.com>
From: Burak Emir <bqe@google.com>
Date: Wed, 23 Apr 2025 14:04:12 +0200
X-Gm-Features: ATxdqUHI-fzn5sRTzTTyDLim6VykOTU57SzlUcMdhSxru0WJHZX0TBkE_1fICFk
Message-ID: <CACQBu=U9S8jhyK_j9JkbvWrgxOL0D=X+6JCT6GMTMFnHMFR79A@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] rust: add bitmap API.
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: David Gow <davidgow@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 10:06=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Mar 28, 2025 at 9:51=E2=80=AFAM David Gow <davidgow@google.com> w=
rote:
> >
> > KUnit. That being said, I suspect that supporting the "just build this
> > one test module against your existing kernel" case is going to be a
> > bit more of a pain here anyway, as it might end up depending on having
> > exactly the same toolchain/config/etc due to Rust's ABI not being
> > stable. (Am I missing anything here, Miguel?) And, of course, Rust's
> > built-in tests here would get automatically compiled down to KUnit
> > tests if enabled.
>
> The ABI is not stable indeed, and modules need to be built with the
> same toolchain.
>
> > So, what I suspect you're looking for here is a separate module /
> > crate which benchmarks the bitmap type. With the way Rust crates are
> > laid out, I suspect this would need to live in a separate directory
> > and look something like samples/rust/rust_minimal.rs?
>
> Yeah, the module Yury mentioned seems like a normal one that calls
> `ktime_get()` etc., so doing something like that in Rust should be
> fine too.
>
> But, yeah, I was thinking more in terms of having a proper framework
> for those, rather than doing a custom thing per module and even having
> those `ktime_get()` calls manually placed for every test etc.
>

With Alice's help, I was able to add a find_bit_benchmark_rust module.
This was surprisingly straighforward. I will send out a version that
adds it right next to the find_bit_benchmark.c one, with a separate
config.

A framework may eventually be good, but the C code also does not use one.
It seems one could wait until there are a few such (micro-)benchmark module=
s.

Thanks,
Burak
