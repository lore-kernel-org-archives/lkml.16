Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE1014375C;
	Wed,  2 Apr 2025 10:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743591353; cv=none; b=Qy6QiBTd/kRKYU7pFnG2j/Sx1Z+yyeJutc61vg8ALBmY8exzkgI/C04Ukszvqm/MmFPkGe583hFJtXDa6GxG+0Ow+NF7rfiQLKaR0RWQ2rpAoz8HNozj6TSEkGa9Fg/gsupTAo9WRfd81cBEi/2NXLfLvYtlzS8ZeBwCDrTPQ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743591353; c=relaxed/simple;
	bh=2unff7AX7/CiMx6nxGFXK762WquO5nYtTjoo3PeLRBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hCZe2Sbp+7asfsYslBYI8N0OZfvLN5t4zNbOVBjXVR7ZwFqIEq17NpFRwv9fAw6BvRo+Dze58MsukVrBRjQt7kyKd4bpyc0vKjeAI59nlPbBLcoCOdxGbHDhL4eJL1eiUbXf3/OiaCXPZRKJ++yOHsfhPLprAWT1CrMf/IyyZMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQe+ry2d; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQe+ry2d"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff7255b8c6so1483242a91.0;
        Wed, 02 Apr 2025 03:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743591351; x=1744196151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2unff7AX7/CiMx6nxGFXK762WquO5nYtTjoo3PeLRBc=;
        b=hQe+ry2dTuMFZ2iM8KPzx/7GQ22396++qCKi5V+gvmYVb22qC3RX6ummSSNbhlJmCN
         rDA4kV/AGA4TV4WtBR4Noj7zwy6EiEdpOp7efifSfW9Qfwg8IVgcTrZJEQF2hj60GnCi
         cSU1Qee7+cPw/xD/aQtu/NVbGHANq8VkLmkL9WaNOTiytO9M17j9Uklq3BPyYda3OBKk
         gnuZpJAJgCWAUJJHXLrSa8xPAtLt4nXTsH0grGuUWnSESBeDIluXccfYOJK6p/N02Xe/
         e1vTPpfnTpcfEPUrezFrMk2uyBNicFkWxjW/OF/V/pj7sN/cnKfdF0Ty1bAceEvZ2imb
         rjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591351; x=1744196151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2unff7AX7/CiMx6nxGFXK762WquO5nYtTjoo3PeLRBc=;
        b=jmgu8h7ELkiJob6mPd56t/nU73dnjTK+NikdOt8ffMJ6ekVmZXBsC/YzkeIioZZeRD
         ZYbETIvjWF5c+hp/i2K+82gn2JwGPi0pPEUYBMU215hhj08+U4MF4Rkhzi8943l923X+
         VDjjbFjZjyVAipo9dFkyfJQEbkUNlLDjkt+uRqh4CJoQg9OGtY7aF5mJSUmVGBHPOS7X
         i+HOJkDMtVpnlqIbz547qKjIJIaJItyCOFUVzVZctUYgLXpYLJTNfdBDaSJQepEiOtYu
         LnudHLzQuyBxTsBtfWO2TH1lt9dYK658gQPZQ1l4aantsHyBqr2B5au2YeCSIT+kM6XY
         5wvg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ9+krkR9qdtEgSvesi3cs/n6a0f6XEO0inl2oEJx2Rr0uEUxF9+JY/1bzyRR5GDLAUTeYM2Q9VY9QrxM=@vger.kernel.org, AJvYcCXgne0O/DnDCpYiq8Khm5CWStC7ZXtLHlrpOH3JcpBz5bTXOGfGMSBW95oRtjvrnbKAbzKPDv4SmEahfuNNBzA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0dTcA79QaHVQoLkPmGXXruPdhAr4W26Zq8TWgXIA8v8CUihot
	e2Pg5HmuxTzXfDcN2TtbkhOcqWHO1OPpUEfA5i/8zH5q1eRXR/lCRmzcNc7mwfbQjeBmp0AASdV
	w7piRcDxXZ0gcYCM9JAXgG5EevkXjdbxv
X-Gm-Gg: ASbGncsJLeoGsyHjfBoVp6VKqAslrx+stQh7EgUuXo3IfV+3xbK+nPXDt0LXaO6Ll+n
	jN9l3IZStrC5/H8QhZRrCg72WlXNCnsTJ6A7Wtro+lzcat8f3B3A6BRtHH3xaKw12xQNFI7fn32
	+3pZzKL0w/JHvySd2bczKynBzHPg==
X-Google-Smtp-Source: AGHT+IEwypRozS9Ypyq+iyNi09n48TXL23+OZQhgw2E6xUF5HInNRbFsqSw9JYkC6uJkSMnlkIhGlvYz6HLFTDTXJRY=
X-Received: by 2002:a17:90b:4d06:b0:2fe:b972:a2c3 with SMTP id
 98e67ed59e1d1-30562d0e8f2mr3139137a91.0.1743591351337; Wed, 02 Apr 2025
 03:55:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401221205.52381-1-ojeda@kernel.org> <Z-0A1a3nvqFiEVtE@pollux>
In-Reply-To: <Z-0A1a3nvqFiEVtE@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Apr 2025 12:55:39 +0200
X-Gm-Features: AQ5f1JpRmankZqFUTpg6TFluVCP-dnEX0-s47bPx1R_EGfUv0T_zApVdT3BHjDk
Message-ID: <CANiq72mmJTYQ+9goEaq6desJCNHNeYKrQN_DJEe67ZVM_7Wggg@mail.gmail.com>
Subject: Re: [PATCH] rust: clean Rust 1.86.0 new `clippy::needless_continue` cases
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 11:18=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Not related to the patch itself: Don't we need to disable new lints anywa=
ys?
> Otherwise we'd get warning when compiling older kernel with newer compile=
rs /
> linters, no?

So far we are cleaning them up as they arrive (and backporting) and
deciding if we want to keep them or not etc. My plan is to eventually
have an explicit set of the ones we really, really want to keep clean,
since at some point it will be too much to clean (if the rate of
changes on Clippy is steady), and leave the rest to something like
`W=3D`.

In any case, `CLIPPY=3D1` is opt-in and the future can always give us
issues: even when we set an explicit list, sometimes lints have added
new cases (like in this patch), so we will need cleanups from time to
time either way.

Relatedly, we discussed at FOSDEM having Clippy be potentially
unconditionally used, but that would require changes on their side
first.

Cheers,
Miguel
