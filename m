Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E404D288C90;
	Mon, 14 Apr 2025 13:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637244; cv=none; b=pEOMYGga2riwNWd1phBaHI3G8OI9waFTh6gdbdwJnfPcbB0S4ZX0293FUfYqVvz2RFli212J/qyg3AkdSCK5bHptO3ZhywjGWR9OnMb88aVdJDKfZ0JLn1FcgXQPdIgPSRVpk12KrxW0jlH/d5+59S7NgfaBuvHf9Q2e6IFbLuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637244; c=relaxed/simple;
	bh=LZJSiNjAH6Oa2ChLaKL004LkS+w5IQsL9RmW7A+KpbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bm2e1HajBwpl99aPTkAcsf38gOTjLWVwRXm69/blLeV5VnDLFFkln4mKlT6HRhugmSAjC5qnGbAg/3Gl/aurtCNYLAOkPj9HsuGwPWM4AAtzomRTjBLhep/oJXMnbj/UtACBxaqsT0XbNLm06fjOxe/6vxujrIkQ5do9saKN37g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bq7dejzX; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bq7dejzX"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so41071491fa.1;
        Mon, 14 Apr 2025 06:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744637241; x=1745242041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2GarGfA59cCcsifpfMtHE+6H6aD/cbRRsW+VrYAjg8=;
        b=bq7dejzXw+8dcRpC6N9q4KFFtG+6tZ4ds4sztHbCGsz+SLS64okhU6G7ml4AffXkg7
         GMXa8qqpbyKWAbvGHITmngokDapbt6paLVp/MmwIwDy7Z1AX1vM8cqslX5LxgvMUuO7p
         DFtKPUQNgVt9RLjfBDjyDaMsKUVrfT0doHavbouVTZhjUQknXz0jX2+St+5yCnLDNWVX
         R3oTG7vEqDzEBp7xFlijh5JjOAj5k1MnJqj9R61XNBu4BkpbNh5YrRNqhLp2aZ28DpQF
         5pEjXmu1lrxe50LfvuTXX3DFx95fdgaQRbj5H4Dsr0lXr5SHRRuCDKZvkzPVLnFwsnrP
         mVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744637241; x=1745242041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2GarGfA59cCcsifpfMtHE+6H6aD/cbRRsW+VrYAjg8=;
        b=O7UfSrJxLtIdPtKuzHVTyElR9RN8HtexDzRLifrzJuM6dxKPxh/xFOAa3BPUsWLdMG
         ffaOMbckeBJcy3KuFEKs4tT6WDXLDaQDercJ3XhNEtjRyVHG00aTyc248/C/wrYpe1Vg
         D5h/Mw/tTCbJBriCWrPc00zwBOS98BHbMyrc4TNDZlqqxoyQJ4guQfxM8VO3UDcX1KnU
         9sTjxpq8OWBPI2blnYLUsBQuVx4BMNZ7EgcBSz5KNf8ENga+vDeG7E+1aj8euCt01e/b
         XZO9+yWyl/G08fxlIabBANBqlLK8utadLTnLvdwOjpLkENMy+P+fEpnBmrz2oc9rZ3hU
         we1A==
X-Forwarded-Encrypted: i=1; AJvYcCV9sqNrQaVuZG9ADwU4GCQ2gZ+jL5hBTPGVQzt1fKy9xQk6GOyp6fG0AINyedsW4lGH0j3UQXcNvhz3EBk=@vger.kernel.org, AJvYcCWufq3VKAnExedBNo9XL54ARl7x8bfGuM5BlKJBVfESIZbvVhAUCg+r8eCmDgvUNUQAj4B+VumMGnkPiUeZCNc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0pIWiHeN6rOE91IuBFF1xKXGc9Xt8Vy5KW4L5KRNdSVq7AhgR
	O1dNKC66Cfo1S2v0vMusRzv5O/VAi25uKesnaBnrCQAiY5PTZbpN1RKuirYFaTRpa/Q9v5VDX+d
	6SEu4/UEQF7057ypjWTUjtcYoHBs=
X-Gm-Gg: ASbGncsa481g21BAdns35y/QgDwdW5gaDMAREBXDGprpvYKvyvENcwG500uBIBWcVx9
	WYcWgJ2N+xKk+mvO+tOCNRxBLwwiYhc8WMixqFkON2Zc8daK4cMNsCowWRvNTS2n0+674ZGqCAA
	EMZtFSilAOP9uAjSbPUCsOgDCO3tYqoR1cT3yO6Q==
X-Google-Smtp-Source: AGHT+IElIOolL+iZP0f+Y+BgM95sfaRXz/LuHBUI5ARm+sVv9guruT7fCZ1Q66x3Pby6JWYAylZ00wRHOlSdxvFNl7I=
X-Received: by 2002:a2e:b88d:0:b0:30b:a8c2:cbd3 with SMTP id
 38308e7fff4ca-31049a80428mr46066281fa.28.1744637240405; Mon, 14 Apr 2025
 06:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412-b4-container-of-type-check-v2-1-f3cc9934c160@gmail.com> <CANiq72kAYp0Z3VNS=JgApceCXx1OVXMNJJYcm8OnZdToz0zufQ@mail.gmail.com>
In-Reply-To: <CANiq72kAYp0Z3VNS=JgApceCXx1OVXMNJJYcm8OnZdToz0zufQ@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 14 Apr 2025 09:26:43 -0400
X-Gm-Features: ATxdqUGOesfZN0UEIar63QO9dKjiC7ZbO0odb_mk10rtxaJFzrOTVMNPZXADc4s
Message-ID: <CAJ-ks9mrRYkEGJ38tTkDXg0RkSP7K8=wtWBa8y6S3dxDh7ei9A@mail.gmail.com>
Subject: Re: [PATCH v2] rust: check type of `$ptr` in `container_of!`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 13, 2025 at 4:31=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Apr 12, 2025 at 8:16=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > ; diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
>
> I am curious, what is the reason for the `;` notation? If is it to
> avoid issues with the `diff` marker, then I think indenting with 4
> spaces as usual would work.

`b4 prep --check` complains:
  =E2=97=8F checkpatch.pl: :207: ERROR: Avoid using diff content in the com=
mit
message - patch(1) might not work

What do you suggest?
