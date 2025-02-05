Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A149C13D897;
	Wed,  5 Feb 2025 18:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738781692; cv=none; b=GqCXNVeC8N1LO72Fhca20txYic9odX5UdmX+scA/y03gQentyhivAv68GJCIuzgGV2zvMhnf+QbQqRWncTU+Z99W5nRyQuldFQd0mERPj0X9ykgoTZ4eIHQ3zU3gScBlhYQrB7hVkwXv0K40rEqjUKU3QBJdow8491OlvDiXlM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738781692; c=relaxed/simple;
	bh=GKI/TgGTHK9mCcf0G2u02uQFtCRvXrud2LDoxZpwd4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r5Ke2MyLwP5qnxVrGg0paK88rdQarwdrmx1FpKRGTSBemk4dlxfCjFfA497YDcZ9cDcFt8WqDubF7nVi2sXs2m4QbQRzwwuDsZAfZj7wTatolZOlXBOhn5dDv2T4As3xIwK2cm+24re7N3chMm38eGBypemFiQKuoXeify38sSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBLHH3U2; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBLHH3U2"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21bb2c2a74dso395745ad.0;
        Wed, 05 Feb 2025 10:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738781690; x=1739386490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKI/TgGTHK9mCcf0G2u02uQFtCRvXrud2LDoxZpwd4c=;
        b=OBLHH3U2aNFCiFZIeWUO/80Uq/fWxvbvPzdSp+fL/cvDxxpM1HWGNf5GCf8N8q5lVg
         opkXRmVj8inSB5OiD4uuIBdq8Z2+/19tEJ90c/87Vy+jF1ujDLOuoSsw93xOEKKN3Lll
         EyCM2a7kwhEs9PMYAgBZ3xeLnPnL3sMiG2q96RWZNaQE9hcXxbrbWoE613l1+Fql8FW0
         fpXTpxP0Wci/yQpZlt+ploH7fvjyt3uPFIVWax+Mje31WvQtMs9mdxESFOOhFpz14J3H
         SzUv0t80UUSIIyz/X7BY6gULL8X0qyjT4jTUEyGWjuOdCwg3k5ohibFIwiH/+TnBhx0m
         1bxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738781690; x=1739386490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKI/TgGTHK9mCcf0G2u02uQFtCRvXrud2LDoxZpwd4c=;
        b=oGpJyez9XFgVFzwvsIOsQQyBmtUlcxdehXLjjpfc4vBzMFNGMmPh9VNXqDr2ai6W+0
         rA3fzGgCQ+p1xCUW0mcV80FU1QJ55Krf4IwDywDXqb56LUDev2CTRqDOjhlyDDPvAHtu
         v39gZUHwfJkq1t32Aq21p7cQ+6N/pGRrrJY6Fb9x5TLc+Ewk/lS1JO537pEwPupDCgTK
         34NNI4hL46NJWfWf9gb2gxZjUPOlXcBJjRp2p3ieuqSiG724W/zrzWGM71BKiTlfUFGq
         lfRfR/Ic1Hb4HA9rIKhV/gQtWGx1EY80GOH5bo6YJHbDrtUQhtcpXfftjQIgULj+Gg7S
         Q7PQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5u5tNoo1VkeRaLiZRbquGTYbUX4HT2rtzMfVM314j7UkTRswqnTVuUM5d4ROFmCGvqOn+l3DdbTGVh+0=@vger.kernel.org, AJvYcCWrkndOXPhKVqBZm/y4I9YuiKKbfGs88PpSTJRGAsgxhFq27B2oBIYX8cRzRIj7T8mJv/bwTB9P4qGJD9LDH8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBrjnlijE5NLsmtFS+5JOPSC6ddmTCiXKBMhAavzlpW0I6lR7L
	ke82z/x/9Ykkb4Ohw8ttdoSry2uDp+j+8+hcVUAQrm64wuS9JHhAHWirM1i+GXUOIAFGqNZ6O0i
	BxNqp0DxbZE/ULMhtT/XTV/ZsSBY=
X-Gm-Gg: ASbGncv8pYotBYmTTxYn0HP1GpLcpK6chpR/apxz974nJs9zg4lkey1sFfzIcJ4m0pS
	pE4BY45SV5QEsw8Jqj8cQEkFI1MyR6elBokO0XfnTO1suqNr3MtEsTJq0TaT0buzYYLFRKA2Q
X-Google-Smtp-Source: AGHT+IGW/pLIzGfDoEdQuNy9nma0qqBDrU0/odpejhQsWKxBtsollWvE+7sbIzX1WXEs4/VLuL3GHN67pMq9fd6mhXo=
X-Received: by 2002:a17:903:46cb:b0:215:94ef:6071 with SMTP id
 d9443c01a7336-21f17f10823mr24728915ad.14.1738781689811; Wed, 05 Feb 2025
 10:54:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129215948.135486-1-ojeda@kernel.org>
In-Reply-To: <20250129215948.135486-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Feb 2025 19:54:37 +0100
X-Gm-Features: AWEUYZl2q6PUFlUvv8HUOBPZ6kUib6DW7hULi2ELqZn5-UI0MGB3ldcll9q3z3c
Message-ID: <CANiq72=e_ZZowaS4QhzxcCeN3DqaXG_ns_2MQaz0O9Z64tr0Mg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add Danilo Krummrich as Rust reviewer
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 11:00=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Danilo has been involved with the Rust for Linux project for a year now.
> He is primarily working on the Nova GPU driver [1][2].
>
> In addition, he has been active in the mailing list and most recently
> submitted the Device / Driver PCI / Platform series.
>
> He is also already a maintainer of `RUST [ALLOC]` as well as several
> other DRM-related entries.
>
> His expertise developing Rust abstractions and APIs for one of the major
> users of Rust in the kernel will be very useful to have around in the
> future. Thus add him to the `RUST` entry as reviewer.
>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Link: https://rust-for-linux.com/nova-gpu-driver [1]
> Link: https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/ [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone, and welcome!

Cheers,
Miguel
