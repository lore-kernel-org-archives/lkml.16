Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409B3212F94;
	Fri, 28 Mar 2025 08:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743149980; cv=none; b=oIRE8Wjeo6hRuozIMK3dOZvPLcZXywpntehH7m8UHOc6hs6rJwCzOYwxX5j7jkNKH0IArqAZ8M2THhKzO+UH4YTU4DE/3iIoK3D5XlaSMrU66EG+eZUWjcefhb7EiCadi+Q5h7g+bj6Qk6uoxAWD2VQT/0MI1CSkje7vWeT6Wjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743149980; c=relaxed/simple;
	bh=dG8Kk5eXzvdbp81i+MgQHGycYLnKTqRZKMJ2FxelLk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tVdowRLkZ2DabidmrLbvp/fcpQfXtdDA+WziUjveoQUS9RklW57iP7bUlgqlcqT2t1SOyY8bploaF+AuTw6XKGEGhyprc5DZ0OW920iIjPjFIh9/SKVsYDklKyzD6A9MePdX5TDZHCU2kef3I5ABI5fQGjjihf7slvtyRvYFsfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrHqWQQH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrHqWQQH"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2260202c2a1so4217165ad.3;
        Fri, 28 Mar 2025 01:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743149978; x=1743754778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9unC9bRNCOdbQsHq9ldD0TFRGSKuPU7FMP0NBYOBHc=;
        b=QrHqWQQHkADv3jmHHojeabxaNLSACY8z4E9odh1PkjaMW5o0bBsu6xZIVCJHDxVstE
         X+EfVbIQJ6zSscSBY4pADRCL51ckOCacs7f+l0bJeYyaRIIH1K+cT0ZsLTq8rKJxATfj
         k/6vidjXdz4SaynZEEodgnjdPCHQGYh/yeSin4Ioy1wm3YgyC9eB4n49jsWxzAZF+G5B
         z4SYg/8yP7PHYtfEWKK5iVE81jy67T8wfzzyKmBfYPUQYS8xEKkEADpGutY9cBapHcCA
         vnq838Bj4SzPAkxUoLnLa5D0dbvQiLPGQqZv+K+Zq+BpUpJKWZaqViSdC7C5+PBUGB5m
         nTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743149978; x=1743754778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9unC9bRNCOdbQsHq9ldD0TFRGSKuPU7FMP0NBYOBHc=;
        b=lSPBbphkhlwlgmCl8RFDNdn+9INbKN0TZ7fSS2kfTqUbI6Umu2w2il7bduCLmGeHMm
         s/Ib1Vihm4eH5lu61mPzPtL3aZrhL4uyzJuFOzZScpa+bsnIUwHPBNu71acT3CiBiK4t
         oCJ/N8c0a9wutOKa9mVkqEMf6t59RZniAc6SX4W5xxzN6QVHKgiLosVIxIK5AurBVLcr
         UB/M16dj5bCXZTUf6qtysE8LqxZPqigRxzVo/hyyNg2QaqTBjwHbu+oCMFl+N0Vn3yej
         DpHo/o0MjDKkcWNV1V3m8LLcA+HVzZq71VNY/ednAU0XK+H5U5XyTtNBqMqJF9owslGN
         x/2g==
X-Forwarded-Encrypted: i=1; AJvYcCUC9zUuXI5+FKn4I7eh9tmN+WmT0gyJxQN+sEM6sM3VUcFJo3LuSZY89i0PCjZWj/sC0t2w3GAfzHhrPJZI5Nc=@vger.kernel.org, AJvYcCV+PpxHXKJQqT2zhK0dgEjR8QnQ8cvONNHG63Xe9wgM30g3qbGAXU6iZuBvm6x53Kn3aF+FLZQSHHRbnr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUGbgibc8wpgKeMQaonnqwnGeu6j//g2Rv5PjeyGNGrI3z9KuJ
	VYqKs6xRjFixlpgJIgQIU/AimwSH4ByDaR9xpCgrBTBALgqr4vutBGEJ4meRTk07FRZAtrxho1n
	Y7Q+jwdwaGP0DZX2ONNb8xUBL6+c=
X-Gm-Gg: ASbGncuHaOpmzXZTLxnB6CDuyAt7KrSckl0LY2XoYSwPItL3qjfQmO1RHtiRf0/x5CG
	Sdr61xbmmXUalBqObNUB0E+WeXYr6xtmS4YrieoFMq212FWLOIS7USnWiTTcjIf78FpXuW3WDt0
	u1yGw6YrRVcwLX6pmuaDpkkaEQsA==
X-Google-Smtp-Source: AGHT+IF0//qcBT07gmUhcVUDFpY/xo2mTXg5BmPOxNGcp0uk0KKm0Mli050rUH/yXJPkHTE2qILIWhXLdoGYB2AUjwA=
X-Received: by 2002:a17:903:192:b0:215:3862:603a with SMTP id
 d9443c01a7336-22806909490mr36453705ad.10.1743149978273; Fri, 28 Mar 2025
 01:19:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327211302.286313-1-ojeda@kernel.org> <202503280805.Oq84ECdB-lkp@intel.com>
In-Reply-To: <202503280805.Oq84ECdB-lkp@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Mar 2025 09:19:25 +0100
X-Gm-Features: AQ5f1Jp5M1SVPjlM3lBMbr_cReSlOrVe1dKVs1dHDt1dHT-S8Pb1bd9lKvRUvJk
Message-ID: <CANiq72ngUCVnYT9rQ9+ebTfTOUv7zuhJduXDO=VRRZ4myT1iqA@mail.gmail.com>
Subject: Re: [PATCH] rust: clarify the language unstable features in use
To: kernel test robot <lkp@intel.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 1:10=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
>    rustfmtcheck

I will replace the newlines with an empty `//`; otherwise it reads worse.

Most of these lines will go away in some months, so I don't think it
is worth diverging from the default even if `rustfmt` had a config for
this.

Cheers,
Miguel
