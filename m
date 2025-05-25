Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C601AAA1A;
	Sun, 25 May 2025 21:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748207592; cv=none; b=SBsQw1W9/SOSX/C55oRIl+um7h1OAkdk6CkJ4/Gcbsh01+w5eXumc8O68CSoHGOcOpEp3RnK83J6NaQjKLJRoFUVXeYAriUoz9/qAiiueARMj3ivN3oRzYHctu36KQm2UMv7kPk+lLfMnedqde7WSDJvyHgx5dSlWAnMaV/eYFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748207592; c=relaxed/simple;
	bh=yutOagRm7/jPjwci0FN1tltP5msoKbQLQUfg1GE+uf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K5DOVCFTBPeO4QvlUIBFG55h6lx/HxNzyBlOXiXoWiAB/XSxXIqeHX24apS/jEPDh7O+VzVwNZi8MGvAV3qrl/9/K7xkXHrgY/zSkAGlrPUjVTSPJeJj8sM75/DwIOJOAJKQ4Hoo1nDRCgW8kRONCwgCrOwBwQ49Bab3qIIyXPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkXUQ4HQ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkXUQ4HQ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-231b7b21535so1021005ad.1;
        Sun, 25 May 2025 14:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748207590; x=1748812390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XX4Ox7nGMplfoPZEHRnuA8sBW2s4IqgCV4sN1QmT1+Q=;
        b=IkXUQ4HQAtZschaEaIqs+kC0Qy5rVU++2fMTw7m2ZiKCRTsG5xFv0UrHQCLnFUmMv9
         sS7MuFQqJhU6+4hAityNwsVywUlqV3Lj6wB++D8SSe/SkeBpLnIq5SSW0bcP7CmhmnIn
         WFTfLGen1uUmfy3/htqQJ8G3pN8SX9bY3RdH89MRIa1uStP+IniIa5sBBFzCr29rBX2o
         wdJFgSaLLlX38LvBc0esxq/K5ZoCH93Q3rwO7pA1TtwFUujlqy3t3fxMXRDNS9CPPwhn
         YcREFbII+v2sCq5EjuVF1Od1Hy6g2k/c1y1UDPfPAFluk2X7w8VFA4fZvYDr+ThO6Rvd
         6CNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748207590; x=1748812390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XX4Ox7nGMplfoPZEHRnuA8sBW2s4IqgCV4sN1QmT1+Q=;
        b=UdkS1fM2Xv0wJx6aJrWfajhIEY73Lh4pqMLBZKTX1x5UqI21DHOGe06Y3acWgu5Y7K
         /ayhfHDJWnOO+rmVx2ZRbBBnBGJtXdVg4EhturecreyLkTbe1QRENxMQiwInwTeByX0T
         SiBfcsnq3fXVjPKIFKW/j2id+sR0McdcsHDrWgAsHaabevtOpxDJdOHCmFYFeb/0d9gr
         bH1B47uYb/8tK6bztoe7DwC0P78tlOB6Z6mPuDWyQ1SNvEC0T8ZV257H1iTBaV21qWxm
         VYQhxY7ZuBK+QzW25ylzDjZdEcEQbSwJeElGWER4x42/octs+CjtAt4muGAM0DUq6Ja1
         v9bw==
X-Forwarded-Encrypted: i=1; AJvYcCU3jIDi3ajPnhrp3xZV2sRTMr9ZyTNishOLexLn4aVts+1VoKn4bcBpSt+HLG8FX7oJpF3JPMQ5J6uGOV9UdK8=@vger.kernel.org, AJvYcCWpN7DQ82b5fbfJsHCCu2HGZ7sGK9zMCnnWyQ83Tl/k4cubN2B0sL40GlOP1+1kxinYBYUDN3kVKdglROQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZkvkuA7aReF8zecoFDeZ/C5X/McjBg7P0hsbv5sTh01GP0xp/
	mvRevQGUm5ggDQ/FDaH7xmuIBmHzG8GRJiMzkeE6NJKed7y4DTJxOFWu/pO//b6dYTwOZpGqEAE
	3FGNArbLAiEzsBGuhFIiFYXi6dDJGMns=
X-Gm-Gg: ASbGnctM3gAzXXrM0grnaz3zmUdvKCj1K6Iyl9BKZt6JBEzZxk7JKjIXQETzW2/Hdzh
	wf63dUCdq71oHf5Kujt0CJ2CQBHDhmtMkmvPVPDBHU52LYpVcHOhAsaxDOZcji3fMuq7XvqL40z
	GWlffeZ55sKvl4W3oC+bA64pnpu77rItE9
X-Google-Smtp-Source: AGHT+IEfUYwvhLO0+MQrywuylW3sHqV8LRghvR/dDBShngF/P39+CL3M+a5Jusbe8qTBUzOuhXFa4dSPxQN6zgvf04k=
X-Received: by 2002:a17:902:cf03:b0:21f:356:758f with SMTP id
 d9443c01a7336-23414f2f960mr42912265ad.3.1748207590309; Sun, 25 May 2025
 14:13:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250413005650.1745894-1-ojeda@kernel.org>
In-Reply-To: <20250413005650.1745894-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 May 2025 23:12:57 +0200
X-Gm-Features: AX0GCFu4PPuuef2Ppk43U8NCIUkz-S7uTimHbFKJFw7xJySv4__UfxYhAvWU-hg
Message-ID: <CANiq72kSsfBm1rKANrxyrcX=X0MvfJZKTYLGU-yRFaMzBTQ2Rw@mail.gmail.com>
Subject: Re: [PATCH] rust: add C FFI types to the prelude
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 13, 2025 at 2:57=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Rust kernel code is supposed to use the custom mapping of C FFI types,
> i.e. those from the `ffi` crate, rather than the ones coming from `core`.
>
> Thus, to minimize mistakes and to simplify the code everywhere, just
> provide them in the `kernel` prelude and ask in the Coding Guidelines
> to use them directly, i.e. as a single segment path.
>
> After this lands, we can start cleaning up the existing users.
>
> Ideally, we would use something like Clippy's `disallowed-types` to
> prevent the use of the `core` ones, but that one sees through aliases.
>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72kc4gzfieD-FjuWfELRDXX=
D2vLgPv4wqk3nt4pjdPQ=3Dqg@mail.gmail.com/
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

    [ Reworded content of the documentation to focus on how to use the
      aliases first. - Miguel ]

Cheers,
Miguel
