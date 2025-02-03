Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063252557C
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 06:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738565976; cv=none; b=JKOprIOmxcRD3i4ppck/A9McwFtMIXeSFQZ5HjiSlWtueUgvJl2TDRqqg4khAv7m3SdpE8tS15/Ywv0hrawDzr/xrYqRoBfvp0H1UhoP9FLGotqquRy5JpIfQPe0DdHkVNGrVwVJ8+gzioDTblmU5rVfSIw08A/hBkmWde46jyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738565976; c=relaxed/simple;
	bh=vFYnAZUFUao61yVy6zNuCPtiUmdvsXsUKmfDPfyAsoM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=aaLrTBXU/vbeilzJYCBKfilN3nnH/JOHy6YwS8kXWcv9yPlFRMJfuHU02RFNPLiU/wyiyM1kzINMGPQa1qnhGv4utO3RnkA/ujT6XQ3hROjP+dCctxJL6rBBKdkpPrEIuIXkmByhgOhKB6+tNeetV2PBQzTPx1XHRN8K2O+0XL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com; spf=pass smtp.mailfrom=jrtc27.com; dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b=hKHVemmA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b="hKHVemmA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43626213fffso30753855e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 22:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1738565971; x=1739170771; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFYnAZUFUao61yVy6zNuCPtiUmdvsXsUKmfDPfyAsoM=;
        b=hKHVemmAVaTkjNqH/W3BgBcImFbvp+T/DoD66OENWyYIwcZPNXuWETm5vO1EZQRAq2
         re7HX18xGiPo6ZbZ/UzZUgwqvnfEd6SIZwb7OSJxbS14srS6tn7+ry++R04dZjmDAiFG
         c0sBYGIZLUxrf/Jo8yn2oFvzfOHIyMEG23vQKTy/YOD89dlQLf0PaUcxb6n9DIxDvyiE
         WECUVLbS6zKn//Z+OLtK75JFQxK9EHBBPJV8xk99VncgWEZ5jVQYBnEYwccNh8m+J33D
         uI7tRcdr2EsjdwkZV6gQkF7FP7uLAC7kFS/w+S43ID158TEAteZ/Kp1pmFOMv+772vHK
         MiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738565971; x=1739170771;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFYnAZUFUao61yVy6zNuCPtiUmdvsXsUKmfDPfyAsoM=;
        b=gsd/KLNE3ZIJYa4PVX+rKOXkr9Fq+1b31k20TeI72AgSfG8IooYi2pn0MX8tua+a/4
         nz3abh+ViB/OsQ54/BujccBvKRopde/ew5c4Qz9nOtesJLLeAlvlFnIeMKF+5PkUzt9I
         j5099ZmUhQFwNldJaVU5q0mBaD5raFCUxwcvXM5Asno4eXXN8Ij9/Cttrefw5q8rqpFH
         gR5cWqpbuJE/pU2Y0g7BbJUxjkX3ansYg1CaFcWNE2QEw3o8dj083Rf4eGH+myNqN4v/
         c0B+1Lz5UAvEFBU0bw09LHYie1SKRw93vrq96XmZxwhZbzm2n3poasqsYCQZOVQp4WSK
         zDVg==
X-Forwarded-Encrypted: i=1; AJvYcCU+ToSTwTJblxxmsTJYc5ycbm2NtuvBn5U4nbNoIoVgYjY/sCmQee4+up8iDbW7H0s9vlrDHx4Pyz7lQ/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXknl6e3VKwoFNQo91FDVmLQyYdQXvnWV+Rsr2Wu/gY1hhmVgT
	n9gU5HalAVxKzjPiMkgxj/00CdVstQanQ6wKoVzxzKDncD31gRqhMTuoG9YikBc=
X-Gm-Gg: ASbGncunckkjgy5092Hs4b2tursvpJXWX6GLBk6l9L22pB/Y1palJHNhMCWmRZXFA0t
	FaDHaSZ3xGRRT1iUKSuhLdRCly+M/jdvzZ0wDXmyA93NBToGiMYZpFJ8GlqWkoHmSUj85bKxpiI
	BZ0/QR66LhY1E2KFaMqxLvF2oCsVq7Pzn/sI5k55CRXzkv64NkHJnx71rJbalgFEOhawXnneDQj
	CaCzyIw6t5AfRMTdwIJ2lm02XK9wCZqHVXfAG7jkQqV9MRsHF4kvDEgEoIq/OjCEd1OATtGHxbT
	JJXQs0iREWad+mNuck+z0f4PCJpd
X-Google-Smtp-Source: AGHT+IHc7TsMH05mlkvzaFMBpTxzhfd0jlMSaJGgcjOwELt4l0ZR8Uoj4RfcTaQK8b7AR3LEmPTKuA==
X-Received: by 2002:a05:6000:1a8a:b0:38a:8d32:2707 with SMTP id ffacd0b85a97d-38c60f77922mr10339567f8f.26.1738565971037;
        Sun, 02 Feb 2025 22:59:31 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cfccasm12025244f8f.92.2025.02.02.22.59.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Feb 2025 22:59:30 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v2] riscv: Use Zalrsc extension to implement atomic
 functions
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20250202-clammy-skewed-eb0a0fce18f1@spud>
Date: Mon, 3 Feb 2025 06:59:18 +0000
Cc: Aleksandar Rikalo <arikalo@gmail.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Andrea Parri <parri.andrea@gmail.com>,
 Leonardo Bras <leobras@redhat.com>,
 Guo Ren <guoren@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>,
 Eric Chan <ericchancf@google.com>,
 linux-kernel@vger.kernel.org,
 Djordje Todorovic <djordje.todorovic@htecgroup.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D0D039F7-26EE-4687-9836-DE076006F2F0@jrtc27.com>
References: <20241225082412.36727-1-arikalo@gmail.com>
 <Z4CSpE9UKkJNM_g5@ghost>
 <CAGQJe6oA8oiZmg0HGW7KrjdOJ7nXNK9hQFm4jdQ6n0WTG6i-vA@mail.gmail.com>
 <20250202-clammy-skewed-eb0a0fce18f1@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)

On 2 Feb 2025, at 20:08, Conor Dooley <conor@kernel.org> wrote:
>=20
> On Sat, Feb 01, 2025 at 01:04:25PM +0100, Aleksandar Rikalo wrote:
>> On Fri, Jan 10, 2025 at 4:23=E2=80=AFAM Charlie Jenkins =
<charlie@rivosinc.com> wrote:
>>=20
>>>> From: Chao-ying Fu <cfu@mips.com>
>>>>=20
>>>> Use only LR/SC instructions to implement atomic functions.
>>>=20
>>> In the previous patch you mention that this is to support MIPS =
P8700. Can
>>> you expand on why this change is required? The datasheet at [1] =
says:
>>>=20
>>> "The P8700 core is configured to support the RV64GCZba_Zbb (G =3D =
IMAFD)
>>> Standard ISA. It includes the RV64I base ISA, Multiply (M), Atomic =
(A),
>>> Single-Precision Floating Point (F), Double (D), Compressed (C) =
RISC-V
>>> extensions, as well as the as well as the bit-manipulation =
extensions
>>> (Zba) and (Zbb)"
>>>=20
>>> The "A" extension is a part of "G" which is mostly assumed to exist =
in
>>> the kernel. Additionally, having this be a compilation flag will =
cause
>>> traps on generic kernels. We generally try to push everything we can
>>> into runtime feature detection since there are so many possible =
variants
>>> of riscv.
>>>=20
>>> Expressing not being able to perform a feature like this is normally
>>> better expressed as an errata. Then generic kernels will be able to
>>> include this, and anybody who doesn't want to have the extra nops
>>> introduced can disable the errata. A similar approach to what I =
pointed
>>> out last time should work here too (but with more places to replace)
>>> [2].
>>>=20
>>> [1] https://mips.com/wp-content/uploads/2024/11/P8700_Data_Sheet.pdf
>>> [2] https://lore.kernel.org/lkml/Z2-UNfwcAQYZqVBU@ghost/T/
>>=20
>> So far we haven't found a way to do this using errata.
>=20
> You mean using alternatives? Not implementing A, but instead
> implementing Zalrsc, is not an erratum. It's a design decision.
>=20
>> There's no way
>> to patch one instruction with multiple ones,
>=20
> Have you looked at how the alternatives work? There's no requirement
> that the sequences have the same number of instructions, padding is
> allowed.
>=20
>> and we also need an extra
>> (temporary) register.
>>=20
>> A CPU can implement the Zalrsc extension [1] instead of "complete A"
>> (which P8700 does).
>>> =46rom "Zaamo and Zalrsc Extensions" spec:
>=20
> Why does this statement differ from the P8700 datasheet linked above?

In an LLVM patch several weeks ago it was said that Zaamo is
implemented in firmware by trapping and emulating with LR/SC.

Jess

