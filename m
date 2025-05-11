Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F04125C710;
	Sun, 11 May 2025 18:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746988127; cv=none; b=kL4D1hyg46bOlEC6dfLONT2Hm7AtxQIRuAFeb9xyQdvRsnUlsPmCUuvPvTeBAGUwewdNoO3Pn1457en9wtNdfRB8YJrLxruRXlmOLJCF2u5bNO+d8NeGVq19pLqcIzRLdWVHNWlWHhjVE1KbFExiYlrYOkJe3JkzETyucuWyHCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746988127; c=relaxed/simple;
	bh=mem0KBsBp2payG8qdvLsnklmRC11hWKx33t/iTDmQew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bjmc0/MkeshCG3qUKRgLe2TDf1igV/38GM0XMTiRZEnCKKDeUvThbqYdg/iRZT1VeUxmI17oetuW5zqthK8uPIo96OaF1/BC1+RNeIZRxbnoDTZVbWo8oLDpnwe2IeI+qBv/dk+lnIB7HvMZkktIolhxT1ugkyxJX3STxAsQHV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jw1y+NyC; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jw1y+NyC"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30a892f82b3so706199a91.0;
        Sun, 11 May 2025 11:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746988125; x=1747592925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mem0KBsBp2payG8qdvLsnklmRC11hWKx33t/iTDmQew=;
        b=jw1y+NyCU9fhna6Cj4kciDap71iCS0OJRVdb3hhkhb8jnfz283vEUl6HeWnAPSEJ5i
         CNa9FZBnx8/sIJn4n7dfpaLcBvY9X8u+6aXqFaRnlLM1h/AQKo8mgNtreSotq4LQfRP1
         /+oSNC/Je8VgaYpVOJ22b/G3AZhkkYskqqkfyvTjjknaYlMs1Pb5zEb+KptzGVl7iqX+
         pFE/USBJacZihssgfGgPQb0ffldh4yqLdIxY5r37+hhyPjoqw5WFPfTr8qqbUxc7pkXg
         qRuBCFNZy9iq4qpfcvkZ/4eWjaZ9O6Ve+gM0Gjcsz/Bc+EOdbf5DodjFGAIYpKr0O3w2
         LbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746988125; x=1747592925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mem0KBsBp2payG8qdvLsnklmRC11hWKx33t/iTDmQew=;
        b=a805JPGxr3VNGi0KrLebtyVTYZjXiwnFlG5F6CDEgWqWwMstIioim50j+5wgYps625
         k2qBRAclKHPRnfpqEBaWm+fNjeNGfLDRU0dvkUD2DZJs3q+ceRT9gBbXaQ08mwBri4IU
         VtKRGfS2pv1g+4ez7FNTKMITYpUIVHt277SD/NDPnu3FMN6WtdmcNC5wLumy7MvYE9fJ
         QjkUHYMcPpd9Zj17hXj97jFiZjUCw0kyer/knJgBAEQr5ok6iMGrj5CDE4yZ3PWZQX+q
         qQK8i9hhEAG+0lO9lpUBsQe1jSj97MVNq3G0ILu0lPPWC4S2nHSOozcCDEzNTAsYgRZq
         Nbtg==
X-Forwarded-Encrypted: i=1; AJvYcCUAJFHNI8k/5rhpuirlT4skVwLAJrWa3vlkzbd9drb1ENHGdAInVRprTHwTbqDbHBPnSCpfpivu68DvCGM=@vger.kernel.org, AJvYcCXcLsOIUeSBumnlrFh7jMhTEsagA09mI28va7KqsUdLGNoBMjKxAJ7o7VCvMe0d+0/P8lHiL/ZN/hBwt3Qnteo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhSLWbLKrN8Z+aA2yi0LF9CgMPbUhkJrTnjaOyzniv8jWHHhiI
	bHOBCJ3/pQe6ZXeS4CdAWO9TpOiGR9b6G8cy4PLCWdOi6T2JDMJTJ0jvOpImD5e2I8XYMRoFhZr
	Vl+u7Mhqs8jA/C7XbOQYpf+B3csI=
X-Gm-Gg: ASbGncsfiwfkDo1aiDbduLp9RJ0bxrukeH+ngSJExCppzjH6OSAeXmmMEBQmBH+2v2I
	tbvKFzjNtMaYuNYVQqFhfu8lYiZyksB7BFKCW+TbBqhOnsNAI9zzTy9ijEizvxUSnnMUsWiNpZW
	O8GdQkb925tlLGra0V6Zf/nVnHZWGAx/Bi
X-Google-Smtp-Source: AGHT+IGP4rBpL1L/R/JOyAFwAzchMSP5tWZAsxEut1AYIlcEPC9wAlnS/rSd+SYDLqun4ZCvuMoUm6Eds8E0cpqj0Cg=
X-Received: by 2002:a17:903:2352:b0:223:659d:ac66 with SMTP id
 d9443c01a7336-22fc9188697mr63883405ad.12.1746988125325; Sun, 11 May 2025
 11:28:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511182533.1016163-1-ojeda@kernel.org>
In-Reply-To: <20250511182533.1016163-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 May 2025 20:28:33 +0200
X-Gm-Features: AX0GCFtE4MpER3Q2huYH2uKaee300aoT3sSh3P3I6FTNekp-TpF_BMnKM8eGask
Message-ID: <CANiq72=FhkjUPjBVDakzo0SJ7=P+ab2r8Do1jExDaYeVMp-edw@mail.gmail.com>
Subject: Re: [PATCH] rust: devres: fix doctest build under `!CONFIG_PCI`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2025 at 8:26=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Thus conditionally compile it (which still checks the syntax).

i.e. "...even when disabled)."

Cheers,
Miguel
