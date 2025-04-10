Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA8A42AA3;
	Thu, 10 Apr 2025 13:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291690; cv=none; b=SDLtcUBMn/Dzr3UD8vWBIls33M0rmKY+v4DRBpFlBOIw0TctATTxX+CfUQZXBnxetthWI/zkN07XbjDYoUEWdlr+UQ+6ce40usjK16Phu/MZTWL0S7Z8+8DqWGeroTIfMsfhyrxY0t/At+rixUGJp2pO3wdi96Rbb23NgLe9A68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291690; c=relaxed/simple;
	bh=VyvWwwz9p2R1aWMTYFuVexXQPTpwodf6/OAv7haJL2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exwX2DKRaPGrMu8epotaBeUHufKbwhjZTVaukzAxaK6raKMuE0HCZoIcN/uqWTi3IDh6KsjrsHrqr9SWDnqibwjhegu9GMjj/sjNcI8ORs1v/KKqw8XX0VFr1eiFci27nxNsTWZdfAUrK83sSAl+lVrutGdjk0MrKEK4rTa4nJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2YNvNtW; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2YNvNtW"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af50aa04e07so93043a12.1;
        Thu, 10 Apr 2025 06:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744291688; x=1744896488; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyvWwwz9p2R1aWMTYFuVexXQPTpwodf6/OAv7haJL2E=;
        b=V2YNvNtWFetx6aRhcxlle2M/3wqxZUI1e4kQdEAwWTDKOBOb6h9claDiogJRH9fgGT
         nv3rNzprcQp2YYvyuk8f90q8MovdkTlPvoo0NBT/ghLrvet0jA3+ssXYXi9u4jhu1Uwp
         04slLb4FfAiQLhrNjgi9dC9ZkI5v7c61ZcRpwwCbJqIPhqM2eTfbr986YcGYZdx9JhJb
         OgxhpMIZYcPgXf7dUH9COMIgodmW8o5z6Fx14tw7/0U7ZtwImB01QgQR1qp5aUBxsTpR
         D8BRabRDjENXYybKhY8c70R5kxmyyaugxS3PDaKODFv0PLZOrl8HXH6Nula+ub9LcBgP
         AdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744291688; x=1744896488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyvWwwz9p2R1aWMTYFuVexXQPTpwodf6/OAv7haJL2E=;
        b=dyI8EIF/41AZQVR6hx/s+bXf4htgnXlvWOYW6Xssh1CCNaUtka3oZgKOL+X7DLZmgM
         lkod6m8b5VNsQCrAjd3JRqG2n8GjbuH0kyWA4xbIHqVKMI8daiG90mIfOtVinCi47QBe
         ZxlJPbTXihBrKEqI4lcuT19bTywdmBGYt2q22eEOi6gYKMoglrKaVnYqRJXNGxx8z5e/
         YZZneWQcVxQmcGKJZCVq7CsDykNwETo5bQfAVghoKmpELKiKMwXKUKucdFEEa9GLOo5X
         0dGr9E/Wh86pysTjcyL/55uP9RD86LaljE3fiHhYqupc6GR1AM9Un9PNXfWHWV8pBA6f
         2XbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDaHf/8EaEzCLtLK7ez22V8dTNOXs4bfmHOTH7Ni4E0xBuUJSCVi9bbyy5QcCQf5bfiFTBg+qNmBUYIFEAVkw=@vger.kernel.org, AJvYcCXB5/QXtt7Dgy1NUl4y+0wqZEjb6VQkqAU02g5HrWER6LdFAMUt5+PeRLibxkzId4ysM2w8LvEwP+vicY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFDHsxlxsASK/lN+edn9670t/IOG3vH0asj4Mn5caiyx287Zj4
	AMFJLwfZUFsS+6jj7fDvLG5nQTE7PZybLPLiqnZ5E/9wPPxhj+h86OYmr7fla3DAYPiax1PlBWx
	qPnJrD0m3uTsLrtvxEEU1LGx0nbM=
X-Gm-Gg: ASbGnctxvwON8pOuBByRu4hZ5D4WlN8llnFq37uLw6387v/FNh+RTt0z/BY4BHyK/rV
	hV8GyGVC7/x+uNdDRlZZIWwqHeLu/3EqheUTXeOcVT4nTP+e+E6UZpI19cemuscyoF4VEwawUay
	f2i3Jpfuu9osY6Gd5gBaJQPg==
X-Google-Smtp-Source: AGHT+IEulN5R0q/qQJxK+GObYPtHhBGuK8BJ15EfgDoKv9QcjGyt4jgTghwbk2n/61iu6LVdMMBDRC/lvS2dCKHVedA=
X-Received: by 2002:a17:90b:4b0f:b0:2ff:4b7a:f0a4 with SMTP id
 98e67ed59e1d1-306dbc1f301mr3695771a91.3.1744291688048; Thu, 10 Apr 2025
 06:28:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410115420.366349-1-panikiel@google.com> <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net> <20250410130944.GA9003@noisy.programming.kicks-ass.net>
 <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com> <20250410132649.GE9833@noisy.programming.kicks-ass.net>
In-Reply-To: <20250410132649.GE9833@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Apr 2025 15:27:55 +0200
X-Gm-Features: ATxdqUGuOKZzeCw6k9G5-shzqA6AEtAJdA4pITJMCpz_r7tSBJ254lpDC8iR48U
Message-ID: <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
To: Peter Zijlstra <peterz@infradead.org>
Cc: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 3:26=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> New compiler can't build old core?

No, that is not intended to work -- `core` is tied to the compiler.

Cheers,
Miguel
