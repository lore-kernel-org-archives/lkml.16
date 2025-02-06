Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA959199EB0;
	Thu,  6 Feb 2025 17:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864612; cv=none; b=V6TY/mofDctPxup94MmzY+naf+5bJz7fOsxQ0FNHAvUZDHZssF6vuFhTYcz2mGbN0CogVF5gXOHBLuHLit7u1MUIFuBVydtatnaEYDm+mzDqDPJjk8xNHXjB34NeHSUmhiSvf3lR0KrjahI2VQLzFhrmkElB2UbKSaBbQxSGrn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864612; c=relaxed/simple;
	bh=jYytCP0qJpBGP5wsER5Uqp4WrKqtMrE7BId2DaMrAyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MXn+VPRQ3ujCcjhz5z52eDSXEDU64UdwOS/X9Ie+fxHzP0Hr2SGjSl8fEkp63So0/wx3udVEF0gAyOwCPWXli81RL9vC58qEqLTU5J9p3I4nYWxzj9JmVHfKQTUVLzMVaB7jOmg9U7yFxGwY7+ZKxljbLvPfP2D52fg2Hb+PA7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avlLjutf; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avlLjutf"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f9f90103bbso275929a91.3;
        Thu, 06 Feb 2025 09:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738864610; x=1739469410; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GZrPR55++iXGHv46F7g0+fM5+kgSZFZP7hSh6P6V9I=;
        b=avlLjutfu57NrmcWUEm7e/vwEKJiqujOYyf4hBJV1tE8gG1ksrE/qAIBs+SGajYd3r
         UbCOmBYvJNHm0bqGZcbklU5w1jOeQ6U2CDm5qcPQ5FNHkawbo08bpZKcfY/zBr2lt/u+
         di6jlXebNpIQF5Uq+JlJqSStSrNDYrBuBs9UC58u988IHzTzvXL/eEVJDQL9IyywH/m2
         xfbK1mi4PD2w3T7PClXJy/oAuHQliWK6JRYO48Vu9Jfm5wM4CabwHHtKsi7ZCt9XNM2D
         d+jBf84zcN0YRIPWqDgl/xL3AKOl6PvKYi20fU9/lTKtbtJC06Nkun+RaZcrH0Ng1bQT
         CUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738864610; x=1739469410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GZrPR55++iXGHv46F7g0+fM5+kgSZFZP7hSh6P6V9I=;
        b=Y5J97DLUShNSIS9lwPoVc47oatCNYXmrBP61OiQpqAHZezLyfr2ZIUS2qW+kuuBMR4
         JHeUfzf7BH7RGeNlAEes8eI5V3F1hyXCEYtSP1UIlSmVLcQtR/E7+pV9N1iOeUoNjnIj
         qwmZBz/dZVdWdiDcYIJ8NajmgYsocQUTTmwp0e87ITr1uFPdzZ9gDv5PoM3C2LP3fM05
         0zy9rEjkZUPU3/mSou+m8HBbSllUv4R3qAsrPKoeNps7RNQr5TeDgoi2Klt9b/RAPAcM
         ZrhDImIRxstkAXfzbV0G9qxscLaD4XBwP4ebM/WP1sZbRUL7HqZt8ikomcV+KJlIy2kE
         UDZw==
X-Forwarded-Encrypted: i=1; AJvYcCVZWzhB5kPc++itvIMT6Gln9sbVrVlcw5LGpo+4GbUY6VPiAdVzpiupKmoWQ+sRsmgV//buSF9g1kkdFOg=@vger.kernel.org, AJvYcCXaOBCDTU4QV6ItGVZ/bW/JyZXsBogJP/cGkuOPORKYdhfvd8tdRxmXFLXFFder+6m9dk0mOeiNMworf4YEY9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTm4k1OULnYLPfU1XJHYMkdsRGVeXcKQ3Go0+XU46dXAevDPZm
	x/TeywLL4hjbSg1AFsHK9Qv6Yfgn4UdYhs9XqD+CVowUPH3vNfFQlMrAT/TcW8v03jz/rSGx47e
	rDsHRi53TXUaDhKMRw5fWdp5NrVE=
X-Gm-Gg: ASbGncuFTlsM7xnJaW6/f/KhG8IqROTaWvkHLOmUnRGbPX3fYlCqIynGVEFhfoYy2hp
	qVzs5XBFUhCu4hFpXfVk0ncOcCcryQ9UAgjiwRFBnxc8ixah61UU3qGa4gd7QiAKtwrDZ2Bwa
X-Google-Smtp-Source: AGHT+IFhIUrL/iRslgofpHmTLm44LnZvL0EAnTMQ851MDmHJpegXVB0rNBhsBYYYtPfLp3GfzTexItNV+S9LcYeoeQs=
X-Received: by 2002:a17:90b:2786:b0:2ea:5e0c:2844 with SMTP id
 98e67ed59e1d1-2f9e08318ebmr5225875a91.5.1738864610127; Thu, 06 Feb 2025
 09:56:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-aligned-alloc-v2-1-5af0b5fdd46f@gmail.com>
In-Reply-To: <20250202-aligned-alloc-v2-1-5af0b5fdd46f@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Feb 2025 18:56:38 +0100
X-Gm-Features: AWEUYZm_5N8OHkOjyTQbw9Lz6WqRR10ZL-9xQM761VqgRlJzih3prqz5Z4HIMlo
Message-ID: <CANiq72nH3N9UMu2hsPG7WfYCZQwy9M_4q_rQHJnJMScQ3D9-Jg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: alloc: satisfy `aligned_alloc` requirements
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 2, 2025 at 12:27=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> requirements of `aligned_alloc`. These requirements may not be enforced
> on all systems, but they are on macOS. Ensure that alignment is at least

Which requirements? `aligned_alloc` comes from ISO C, and POSIX says
it is aligned with it; i.e. the change to make it work in macOS seems
fine, but please see below.

> +        // According to `man aligned_alloc`:
> +        //
> +        // aligned_alloc() returns a NULL pointer and sets errno to EINV=
AL if size is not an
> +        // integral multiple of alignment, or if alignment is not a powe=
r of 2 at least as large as
> +        // sizeof(void *).

These requirements seem to come from the macOS man pages, not the
actual specification. The C one seems required to fail on invalid
alignments, but is the set of those the ones that macOS mentions? (It
seems the history of the requirements of that function is convoluted
and involves at least a DR, and glibc is very lax, more than
apparently its docs say)

Anyway, if those requirements are not the actual requirements from the
spec, then we should explain better why we are using those stricter
ones, e.g. we could prepend something like "In macOS, the set of valid
alignments is stricter than in other platforms, thus follow those to
support the test in that platform: ..." or similar.

> base-commit: 89a010129b2a60185d34d7377ef8aec7fbb92e76

Hmm... I don't have this base commit (but the patch applied fine).

Thanks!

Cheers,
Miguel
