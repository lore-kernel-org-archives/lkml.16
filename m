Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD141624CF;
	Thu,  6 Feb 2025 16:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738857950; cv=none; b=SbkiGOYAOKLic2lY5SyNP1YufLqGUQl8V478cgeUCSPXkrERpmuH6cKsW1Sch+smug8RgjcmYYTqn5VBGR7Mw55ORAmERwyZkqdwbWreV64pq6iUnaTUv3ICFJooEEo5/VjtTeYu+yyO05FwsriGMET+rkF096Q+X737NfsjE1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738857950; c=relaxed/simple;
	bh=RMrQYMNjAHqDCcRKaeos3nu037ShcpDNHPY0RlHFfzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=joEbUHqK9+Y1Pt+1Tjs6WACd2Rk3AHWgxPR6+nIRu7gvCa2aAFay/8IDMVGNJLUiM1tYcTnJXOWBH661zIFHQjEoqXzVaCoRVYWHy/zYbefUujwcUMqYmo+L8lJXWs6h2rffZRRstyO2cvt4NDWR+yUUNCPVp6/PVXMp8LPiREU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9bjz3xv; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9bjz3xv"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2fa18088594so88575a91.3;
        Thu, 06 Feb 2025 08:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738857948; x=1739462748; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMrQYMNjAHqDCcRKaeos3nu037ShcpDNHPY0RlHFfzk=;
        b=N9bjz3xvaGFjnFmXZGq9KdLaLXyd4g1H7mVb/P78SNzIdZyTfdgeGLCAEMBifgPuwV
         EWCXk5XpJbzcJS59vZIkpuHnw8zztf0Ui3Ua6ylzl3uI9GSKTP3YiKeKPIhVTelyhjz9
         TSNUPFT1J2cCwWGsCGT2B8CGmPlD/CuD3lJHyVtDdkfNmDd8xgqh8f18f4leSQjvcaiQ
         q24ZRAiJbMT59Bq7aSJL73WIgKveuJgutE54zSHA/2nspxaynl/L6UOxC70/y1Ur86xj
         tQojki/mhLMjhukzNCTwv1CftyYCY75iH/XDNsUuNTGB88cyh1o0OWFKapIH5I+AiUhc
         ub7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738857948; x=1739462748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMrQYMNjAHqDCcRKaeos3nu037ShcpDNHPY0RlHFfzk=;
        b=k/yNtNL5oSlbfCksBf6CZdAkm60rjEcmnywVqs6vqoUN/ZgGfu+vGWL6/DEdku2Dwg
         6JHiPGiQxBZbSm7+UfKC2pJswUdQ/hvHRRBUzPpdNxMVTjQdJLBjrD5zhq0t2WWrIV/z
         RqtxjN99PkQevuhNC/UaYixdNmuP+/iwCEizcwLc86BSVsvkNyWoVVKZpLqK5wz1qfbr
         ETUPLQUDdFbWWLZZPVaglHrgenN66WryVkTb8yfuyhsC3niuBiHzDaDJ4JW2ZOynbgh5
         GGr9yleBwe7zWfXb6wcPU9DDhx13XNukHwdmNLKdj/+Vm3HAP2EIJw1Hi4fDUj8GASUB
         X8iw==
X-Forwarded-Encrypted: i=1; AJvYcCX9FERKIJpwNzaCS6DtIut9EXlgC1orMr++k3n1DEQ+CTQltir7JnyJREJyLsQ6mLMJaOkuXrnkcmjcn7Wy940=@vger.kernel.org, AJvYcCXAfoLl4/u69W5QbTbNaT2R715W0osakbz6dT3s99dcDPpqyfLm/sGWvhGhiYRCLz0/bTpMNuaNPS4Vp1A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3/xaljqofyUU6t0722Q/pmcBal0TjVpeltYzzP+Arv6w8AUjU
	lInLHAsKKLYHppVQcB48n9jF60kFjjVUqPDlHHvW+rB0b/XZC0QH/mGj4cjgY/WAmJXUj8bhh+M
	8RVfMSYowauSXNXWdZubeFrywl1iawcTL
X-Gm-Gg: ASbGncvGZYpriQKihxYsoSIkgC7kZmU/4TIwFYMtNfyaEYbVYBx0O2CgG7ldj0ORoxd
	FcH5qu2jK0v6cxpnhKTSrfBGwQsUsNaXGno/0GnXRHnasCXPqZomXFsKWiOUvdJdW5oi3LY/c
X-Google-Smtp-Source: AGHT+IEcEVc1n+/1BATnRABCQtSTL0mXGZKlW5jifmyjswrEEpzNHa98iAun346JC1c3U1OFW3KbAhLZghNlm/ahSWU=
X-Received: by 2002:a17:90a:e7c2:b0:2ee:d397:1fef with SMTP id
 98e67ed59e1d1-2f9e0849b8amr4619355a91.6.1738857948115; Thu, 06 Feb 2025
 08:05:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130220529.665896-3-daniel.almeida@collabora.com>
 <tencent_2E2CD1359817A58BB51F59E790325CFA6A0A@qq.com> <67AB9311-3EDC-44A8-9C7C-ABF2ED6B632C@collabora.com>
In-Reply-To: <67AB9311-3EDC-44A8-9C7C-ABF2ED6B632C@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Feb 2025 17:05:35 +0100
X-Gm-Features: AWEUYZkcjCjFE2ZfblHsg4HLGJ_kRZF8wduKdGhZRN46Ma92tmC4ZEHZtLYoimk
Message-ID: <CANiq72=opw-X6-qXCFsdtLw8FDOO5Ekvj9L-r_4LSwoNShjwEw@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] rust: io: mem: add a generic iomem abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Guangbo Cui <2407018371@qq.com>, Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, 
	alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, 
	bjorn3_gh@protonmail.mco, boqun.feng@gmail.com, boris.brezillon@collabora.com, 
	dakr@kernel.org, gary@garyguo.net, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, robh@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 4:57=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> I know that we can=E2=80=99t really provide a message through build_error=
 itself, hence my
> suggestion about the docs.
>
> I can send a patch if you agree, it will prevent this confusion from comi=
ng up in the
> future.

We have some docs in the Rust items and the crate -- perhaps those can
be improved (e.g. showing an example of the error that one would get)
or rearranged and then a note referencing those from Doc/rust/?

That would definitely help, at least those that read the docs (but not
everyone does, and even those that do may forget details, so it will
not fully prevent the issue).

Ideally we would get a better way to do this, perhaps assisted by the
compiler(s)/linker (`*_assert` in
https://github.com/Rust-for-Linux/linux/issues/354).

Thanks!

Cheers,
Miguel
