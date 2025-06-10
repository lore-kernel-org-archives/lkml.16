Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16DB28CF77;
	Tue, 10 Jun 2025 10:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550913; cv=none; b=T1wmW66zqVl4npvqrBeKfKf0qxD01oYwCLaB5myDf8u3fUMhUpeXK1umcLAdihAyZlLa+nE7p67LP9zVRA/3ankGr7m0mcsb/AMjFbXHye/mgUMYDvkiDnR0mpktWLwFH6IIrdn8YAgdgmRTEbTMF+mgex8vpucrUTOLQhLbC78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550913; c=relaxed/simple;
	bh=4kpMBn6GQNFiEFjzGftMFhT2bJNpcgvm3M4m7notmzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZ5UEMmTwPZEEcIlgpeTwG87NvP0E/6bgnYDU5kQXFBIWQ3c/lwEU7ZX8vZODAW+vNH+E0D+cc9e17kecNaie3R4f1PD6EiCwHckn1fCimZe/Qk4va3BiT/gQhCZvIzYv1TrRD4T6Fn/S1SO7N+y+xZoIiK5N0n+22PcUTmRm+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKkxDWVi; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKkxDWVi"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234eaea2e4eso9328805ad.0;
        Tue, 10 Jun 2025 03:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749550911; x=1750155711; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4kpMBn6GQNFiEFjzGftMFhT2bJNpcgvm3M4m7notmzc=;
        b=ZKkxDWVi/ACybNTJpanlzq6OaDRtjO6FEwTWvtxz4b4QyMrwFxvJMkEHNxv6Mm05BU
         kD8/G5KBzqeaWPXvlGhEpEQka9mqOs9pn53y0RvlK+Bod1GSa3dL14BU9VMGa+U/fUNs
         vy9RMIM+uNozmkQa6lDGntmEBt6xxrJrORgPsRV92sUjpPsV6gaH/WsUCluhBJ0BAytg
         UxfCLksNbLSTXZQUrK2kGdMlCvcUG1DKrWLeQ+LYuXslTiq4WRRpBmxI6LU0yQBFhqUa
         sEQzqxN/p1P138c3Kt5ARt1r2TbPAtUg6JHKstSxg1rKgzT5dZoPZTf3KDK2Zb+uL+Ta
         3HLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749550911; x=1750155711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4kpMBn6GQNFiEFjzGftMFhT2bJNpcgvm3M4m7notmzc=;
        b=OT6r5AYPNe3E5yrTOfGSThiuAH+iD3bWzIXkyVXlArO72jU+g7d+/jhrUshjXAu4st
         0hb6qMdYeMxR92hy7hIGJ7Vb6UFYhNJcZ0Es4/3M1qwLcBrufAF/ZFBhpLUebYWqFFST
         sqE66VNIBtaq6i5IZIVvOnNxYoaNZP/bJR36mY6rTOlwnhuZLrO5UQ1gXMzq44gnQ8ap
         9h88IjGEXsAhTV0308vwk7O1nViZ/C9qP9T/2YxgrLr1fgnSjttMukA3rXA8wL96eb7w
         aNe6WwMWyuu38U38mSXkQm01zJF5M5+h32yq3phQOgYJ8Vy01zF2/lQTwTbw+eZjpAFG
         7Ueg==
X-Forwarded-Encrypted: i=1; AJvYcCXKzb2xsZQoDw5y6pi1yiWnSeOfFaGauKkqd8Ob+MYwolUDZy3QtCKlPc6fzwAPdAaBK8M6scWuJwuQrNs=@vger.kernel.org, AJvYcCXcHdORaydcNLnRGQ1OiM4/98I6bGrikyXPPvYo1+WYiDAJLOEGSOZRPDGvFdCicwi4v9P5Q0Lf11Nq1anqSp8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb5AdsSS4ewsiPXS+eRRmYIdS4lBZz1QZG7Y3gcUG7ix1VTmrU
	E41ls7IT3dEQcEhEyb/xD0HrO2Om6zfUoVvsob5AceBf/BjVLjqxKuo34n/ztUVgxkYI45m/QR2
	eAo56sB1Y3T5lZE+g/nvngLgYWftdpTo=
X-Gm-Gg: ASbGnctnpHXPXY+JPNY/qB808w5KWD++REwJj6YTJb9Tp7VmCP2970zc9C4H5oaxdnR
	/nUUSWMkg7MdqZVIe8b8ZtPGF8YHDsU+0QgWdcPkTaX/44sbKvSQ/Q9YZCAIvJJ+CKD/HQIqh1s
	yPw8iCiDZd/COJIB0Ygim1st22J3wbOnDg27lQWj/jmns=
X-Google-Smtp-Source: AGHT+IFH6y7ooJkeSFFCIBLz19dfQF/jQDvp0F2GatZHa9JkxgpA0vpuQaRhr/I6u9tbv5I9qQmWS90ETMWJUse5iZA=
X-Received: by 2002:a17:903:41c7:b0:234:ed31:fc9f with SMTP id
 d9443c01a7336-2360407b7cemr93317855ad.11.1749550910982; Tue, 10 Jun 2025
 03:21:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1749463570.git.viresh.kumar@linaro.org> <f10910c7585f5556869ea6f34b64d4136b8d5581.1749463570.git.viresh.kumar@linaro.org>
 <CANiq72=WpuGELzLbH-fxdOeJy9fiDFwatz6ynERDh=HP2z2MBw@mail.gmail.com>
 <20250610100025.e2jadqzlmimyq4rh@vireshk-i7> <CANiq72=dKx22CksQ_r7XuTrufTCh8ty-aAicPwFX62Q4JeAVTw@mail.gmail.com>
In-Reply-To: <CANiq72=dKx22CksQ_r7XuTrufTCh8ty-aAicPwFX62Q4JeAVTw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Jun 2025 12:21:38 +0200
X-Gm-Features: AX0GCFuSbqeqdE1ctXnplv2BJl5ueuM9KFOPQVuFSd-Rsv17ie4S38Jf4pmKVcI
Message-ID: <CANiq72=uZLZ-ddUpyhPA8Kn-4DRKDgYT00wzc+zDRLOX3kv+dA@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] rust: cpu: Introduce CpuId abstraction
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Yury Norov <yury.norov@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 12:14=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> But if you already did it, then please post it of course. (And maybe
> you just don't want "good first issues" for files, of course).

I meant "for your files", I meant, sorry.

i.e. it takes some work to guide people and help them get their patch
setup right etc., so it can be often quite more work than just doing
it oneself. So it is understandable if a maintainer doesn't want
those.

Cheers,
Miguel
