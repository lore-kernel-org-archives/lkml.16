Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA8B26A1C3;
	Thu, 22 May 2025 22:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747951839; cv=none; b=N85cp+NFdV37Tj05I/oBLuskKGtWet2WfC97eK0ltpglHOdkQB6ov42pCPawyP6PBSZWlJob9uy/d+DLM0Uoup8av8HlB74IjXUJjfy1ljV5Kba0gszLmIuzqe4GgBOz33rVXlLqRJsVtfoDtXS7xRSHuPZdF/gQ8pnhS+VTQh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747951839; c=relaxed/simple;
	bh=Vwp7L6L0DbadGmW+6IbLFn7FDl7XlbaZVO+AUTwmZBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MwMwdyLsHDvLimENrulVzopNfWe0csOgNSi5jDR7HOZhxYpZHww/Kpghizlrct0vZ4H6KonaHvmispX161H7OmAkvLSYL4vefnBFFcJzLD6UyEhfXFzuz0+Et+fRyJXbWZwhSmyGou9Vm0vyNWQGBJhQ92k9IF3tGtdoqkiZD1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnWL0igM; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnWL0igM"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-231ba912ba1so8555145ad.2;
        Thu, 22 May 2025 15:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747951837; x=1748556637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaVcQnOHZhXdhQaf8IN9xC9rWiAxsOh9GVu5nLs1VX8=;
        b=XnWL0igMo5ImU27Dr1cDv7pEPZbGBDS865Qun5D52pzVRa3Q51oa9l9/pMnXopidBG
         nPZMF2oOMop7RWc9YKxmsE3Wh1/8WS6WPGFxnOA61TGATn5FMap0BBhRSWVbRWJa3l4W
         rIlkRxtc3QWWY5ttZo7YDX6iFYoxtzo2Zc2FItg/QiX5v8rAYu3F6+L1KihtJ4HaI3P/
         wKZp0r6/DnS8CifaB/fT7xQ+zXtkXBXGEndMa3lS3ZlhFJzsEWybztlaXdiSZp3OrJir
         n56d23ULQXTXncRZGaDRMtjAQt1xsPk2Y3wL6NWQpD9lls6qLv42euvdn4nFfzTKOEWu
         n2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747951837; x=1748556637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaVcQnOHZhXdhQaf8IN9xC9rWiAxsOh9GVu5nLs1VX8=;
        b=nIOc1ErzHjVvLhXkbRgPFjQG9nqipJFSaVcHcce3DV4CahGrV9SNmwlFkPvGRTazTD
         T6OeEvEAym/+OsfcTgJ2g3oe9NKFW4zEsuRIY4gFFN3rIF6k0rlaer4o3J0FhIeanD7n
         JrOIdDQvo6hNaZKIPbsEJZ7tA6yEPuykqbBPtrhyAEN7fMlG9iyQE3pdZPCYQmaT9ZWv
         ywPRLhtxRxJZ71OThg7BFRQ6Wika5y7zEuAsiKJUeOG/mNs4J0Wojn8MPdNOmoQuuOrJ
         DfufiVwBN3WEdy3L8ytvAPLh/XLnUAjPe7UBbjKbIcR0qsKtFsm0FR7CMG8d5XPpfHJQ
         ELzw==
X-Forwarded-Encrypted: i=1; AJvYcCXDXJ6ISCgUeTpbUXvc3lHw3vCGrQw5kVx1jkggnbfnkroWETZGPZd0SQGqHKHVU14XCBmHFCW/3IPyGtfNv3M=@vger.kernel.org, AJvYcCXRsunBudnCAMZSk8HDKvEPgu9fiBLRZLfEgACVROFNbx4K5NnEt3xNsval3dnjvwk83QeGDP7B74AorOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsJP8SpsJFKeeg/ehaex75x9fI2/wsx8hwtiK1VfXnEKuFqCPE
	AXoI7Z/MKHvK+po9tjFVx2sBPuyLROVDidJzkWEtBW/7CXrZJWQ8Ie0tER5zNbel3k1oBYaySqW
	4XdMZ66Uo4pzcz3RRFSuKMnguyxKKanQ=
X-Gm-Gg: ASbGnctTqUikpE+GIj/4zBTm7/WWqgBN+xAW/phTrtzlwSnfjQ8BHj2e2LfmFr5FqzU
	yTqa714iVXuu5O7SS7kBmJVGAmCoNvPD14nTYi2IPJ/OFtHVh0pO9yolSIvBhUtTDVrMulbv7H0
	XGmxQiSHx10Z9QsnlhYFWBUD3pSXwMF2JW
X-Google-Smtp-Source: AGHT+IE6aWxf93Mgju2436vKfZ9FnWr6MAWyx+AfEYRoQoWD+Un59jcMnqr7D+uOUxx2gT5GGNl/U6k7mzVQmXV29jA=
X-Received: by 2002:a17:903:4b28:b0:22e:50d1:b8d1 with SMTP id
 d9443c01a7336-233f3658cafmr976555ad.3.1747951837366; Thu, 22 May 2025
 15:10:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325184309.97170-1-ojeda@kernel.org>
In-Reply-To: <20250325184309.97170-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 May 2025 00:10:24 +0200
X-Gm-Features: AX0GCFuI-Cp0LblAbfBsD5C8vBzb-kYyMkgjULkrHzzq5fNIwQ_8FcHrtWkpgus
Message-ID: <CANiq72mwbJZ4kDe6CGBovX=_y0h+6y_xzYKoY6384oyCmcazSw@mail.gmail.com>
Subject: Re: [PATCH] rust: workaround `bindgen` issue with forward references
 to `enum` types
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 7:43=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> `bindgen` currently generates the wrong type for an `enum` when there
> is a forward reference to it. For instance:
>
>     enum E;
>     enum E { A };
>
> generates:
>
>     pub const E_A: E =3D 0;
>     pub type E =3D i32;
>
> instead of the expected:
>
>     pub const E_A: E =3D 0;
>     pub type E =3D ffi::c_uint;
>
> The issue was reported to upstream `bindgen` [1].
>
> Now, both GCC and Clang support silently these forward references to
> `enum` types, unless `-Wpedantic` is passed, and it turns out that some
> headers in the kernel depend on them.
>
> Thus, depending on how the headers are included, which in turn may depend
> on the kernel configuration or the architecture, we may get a different
> type on the Rust side for a given C `enum`.
>
> That can be quite confusing, to say the least, especially since
> developers may only notice issues when building for other architectures
> like in [2]. In particular, they may end up forcing a cast and adding
> an `#[allow(clippy::unnecessary_cast)]` like it was done in commit
> 94e05a66ea3e ("rust: hrtimer: allow timer restart from timer handler"),
> which isn't great.
>
> Instead, let's have a section at the top of our `bindings_helper.h` that
> `#include`s the headers with the affected types -- hopefully there are
> not many cases and there is a single ordering that covers all cases.
>
> This allows us to remove the cast and the `#[allow]`, thus keeping the
> correct code in the source files. When the issue gets resolved in upstrea=
m
> `bindgen` (and we update our minimum `bindgen` version), we can easily
> remove this section at the top.
>
> Link: https://github.com/rust-lang/rust-bindgen/issues/3179 [1]
> Link: https://lore.kernel.org/rust-for-linux/87tt7md1s6.fsf@kernel.org/ [=
2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone!

    [ Added extra paragraph on the comment to clarify that the workaround m=
ay
      not be possible in some cases. - Miguel ]

Cheers,
Miguel
