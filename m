Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4B510E4;
	Sat, 31 May 2025 02:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748660267; cv=none; b=jjoC5CgNy2BHW66MRTNuz6uDZdhK1LrpjYFQVFvAZYHhM64U2B0PS1g6pb9rZ8NdLktg1etVxM0uNfXBD9JziO14kiSFdzelUre6KfzMmku/BpZT6VZHx9HOckE2A5D1ww7QxppVcENli7/9MtIhftGGaAalkEUO1hIg2bgy944=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748660267; c=relaxed/simple;
	bh=8BhFUu8r59r7ymFPCa5lKDBhW311A5cwppU6cmaHNJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRXzCXeSwy1C9CtX2qySfx9QNnzcaSRMOarcdR6FJryJnUzQ9A/ceFGE31Xp0sT/DLoTidv1z1nVcvVdBGv2qTBRXMytScv/SWYFgLg8JhNRdZ/Kmkd9rOu/c8VsexvaJFCL5taJgixfDwIm/qbGeBLALSzciaiQKbyXr2LQadM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRF233fZ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRF233fZ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3121aed2435so2232965a91.2;
        Fri, 30 May 2025 19:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748660265; x=1749265065; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BhFUu8r59r7ymFPCa5lKDBhW311A5cwppU6cmaHNJQ=;
        b=HRF233fZYHR2FNs7Kt8bUx8VyWjf8R7aC9QIdLaVrFO5Sm/68XtnO/uzD//bfcVMKw
         b+zIWzogtSDxh87GpAg7/NiZEvu+mIWzAMhnR/z9qrbLgfC06/4Gx99Pv/ZH7fm3UQis
         t98Wf14bXmb6iPcghHW5fZMAFaVk2rPeW/yHf7lOmN1U0kug7RbPt3W7NxJoPl8EptEo
         U53jc2ozal+37XBN0tpkLXNPWNU4UUMlRqVXVKJasopAYXszPomzvfFDaFl06ZdDb6vp
         2iwPglNoSwHFdtH5AoRZqNxWhZE9krVI9flEu2vUqmMb/+ScHi6MA1LSgzyO8dwZgOAH
         sCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748660265; x=1749265065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BhFUu8r59r7ymFPCa5lKDBhW311A5cwppU6cmaHNJQ=;
        b=lW4J+QNMBAFUdpA4aWDbWCpy4fqIPrpvXk84XVxdJfJtrpBPdAbQNfIRvj3YplTb0N
         ouKSA0BhSt0B6eYzqtwiC1Xfkda790fDOIg/hFoxzPz/YAIXqv46PzlwslMCZSsu8bPr
         BKzn95jSm94+iasv9KG35zrso1DDwQz7MbM3xtXrYVLSRmWetLosfBU05To7mRUmq1tT
         7TO36MryRh4tFk8fMF+qJrGWNFIURD6LL6pHJZyyobfp7j24DAxkK28PerHvGkJfFNbC
         fRHMHPhEnEerZz69KPC4awez3mV3DRYalcHWktAZbuqKwmTrqqRBZPvGlw5vgJdudFr9
         KAdw==
X-Forwarded-Encrypted: i=1; AJvYcCU7BO2+y0Z3WLeO4TV32R5Yboi465+Z5G2eRiZn0SnGAs+8lL+HFllmhrZLb+j/drC2d/JRKZAoQfoZsjk=@vger.kernel.org, AJvYcCXKhgrXKWfPqPb7uJVyf2lJm5INdfgEl6J5VdUw2EU2/UXy4mQAZseC5cUm5w/QfbccTJvKjTWho9ifat4S3Xc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqXWTgLedwkzepukwIP4URW3krmr+zLiIjQ21HLuMaJi4QHTaU
	uaE76RWL0BX15EmN839ZJB4Vz6gl1C4H2SIcEgBVapsC9MnH3SgrtSzSefFV7t8KquAtWEe80VE
	D5Is9a0+9AdgwnQzkmxdxvb2kQEFECSc=
X-Gm-Gg: ASbGncvSnRG7mBWE1bORj6axaZ9TBqbmimX6L7CZ7Z/kaJ5Cwmoht8CDzgvPjalKEYg
	ZMMSNeqHuiX6S/bXe2Lna7scflnmnfp2aRmVoKJJEk1+SJBWeJwDg0RpsDuJBp19eBF7iCmW/vS
	rL12GbcAfn0CDQlo+Stkow7TBrSigoKpEsHJdAzF36HxudYvv62cVoH1XY5+XY2GrAP5mt0ETo7
	oxTTQ==
X-Google-Smtp-Source: AGHT+IHDqJJQmpOJp0WvGWU3yq3h5opBCiUBX2qvxFfQ6P9sn+RjMb2+uISHm+91HX8tVAbQEI+sXcsW2tfyBytazFg=
X-Received: by 2002:a17:90b:384e:b0:311:abba:53d2 with SMTP id
 98e67ed59e1d1-312415265c4mr9169243a91.17.1748660265261; Fri, 30 May 2025
 19:57:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530123129.31505-2-saivishnu725@gmail.com>
 <DA9QL5A8747E.17QE50WBD6JOT@kernel.org> <CANiq72npoVzz01syorhUcED=tcs9FJf8bFHthFrUQ-bE-AXJ8Q@mail.gmail.com>
In-Reply-To: <CANiq72npoVzz01syorhUcED=tcs9FJf8bFHthFrUQ-bE-AXJ8Q@mail.gmail.com>
From: Sai Vishnu <saivishnu725@gmail.com>
Date: Sat, 31 May 2025 08:27:33 +0530
X-Gm-Features: AX0GCFthIL7b3VrzhAlECu_BEtO2Hip9aGMKG2gQG9MZ8xMd-0_9euJIXKb0ikQ
Message-ID: <CAFttn54qYu3ajcBPWWnhjAS-6pQ8Ox3ujbTF6D=Q_BOMkTLq6g@mail.gmail.com>
Subject: Re: [PATCH] rust: doc: Clean up formatting in io.rs
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, gregkh@linuxfoundation.org, daniel.almeida@collabora.com, 
	me@kloenk.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 1:09=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> We should also probably add "region" there, after "memory", or
> similar, especially if we remove the second part.

Thanks for the feedback! I=E2=80=99ve decided to update the comment to just=
:

/// IO-mapped memory

I=E2=80=99m new to kernel development. Should I just share the updated patc=
h
here or send a v2 that refers to this one? Thanks!
