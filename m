Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598E726ACB;
	Thu, 10 Apr 2025 13:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744293288; cv=none; b=FH4DMMwmuBFa8937MYYCHu+s5CiYYtbRiwDHaxUYxs7Tkt4cHtEaGZEDedFncKaYVl4v5pEpcwspqaS5A+M7yRfZxf+KyIlH62Mi25ejrFDBXcidgWYEdxbs8xNGhBfy6VxF3ozmGiNUVGGyCFPpuG1eMPhm11T2XRrTRObqJRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744293288; c=relaxed/simple;
	bh=6GrO3r+mzqdQXwa8PNCYTT0tF9roIIDLcW4jwywxARI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bKsid14UOkvuIeGWX9zLTPI25zO1yHMQzrPFkbVkNPwNnpgAlTI4AXrgc+C973pdzZNSyzI6xzcX6EQoJuwBsauBFADssV3cmV1L/BP4O+aPCLelwuPMOYp3UJwIub+Dl/v0zs/6XJdz5xmERH1zyt08oVclpGh5RNZrl+9a7F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3Op28PW; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3Op28PW"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3054e2d13a7so152153a91.2;
        Thu, 10 Apr 2025 06:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744293285; x=1744898085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GrO3r+mzqdQXwa8PNCYTT0tF9roIIDLcW4jwywxARI=;
        b=T3Op28PW/Lyxx/OpkB0f7O8kq6irEkhzZk4UOGWjkwr7Yhl5AObayYPSwkw6OfpdpR
         JKxn1yE6YjB+EIBjZib+LXdmH29Jy+KCqRZThOjTSzEFaefMb72yDAlgVTrwpV9/qg3F
         G9WoVYD/lYmEvub5fwDvQr0/CTIo3FkgfIxMkgWCs898zxDdp8jgQID4mNjY8FImLg2r
         Xv+1UTpmCr+ba7m/Bt4QmcKIcgHIlxzSdst3fKCgAvMzhZgjpYqY2cUCga8fDDy/yXJQ
         4cZ/m2Og680g2sALWJbHwWS8CC0RKLRAmvfpBfn5gLhrK3auhjMUdFhLlRGxXATVhZGH
         EeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744293285; x=1744898085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GrO3r+mzqdQXwa8PNCYTT0tF9roIIDLcW4jwywxARI=;
        b=ZF5VmBHQDkef6FwJZbPfanHH2hNWgi7iRF84Vg5S4Iu4LtMhkTklqXERHkpqqZhWNr
         8oQyLH3P30JbJkGgDn52Bbgd9Nx44cZH0CwPpXzZOy1A/Gqek25CLvAQyoElqZqiyz0h
         sdlQJYPXdaSyz19TKB1//HQ5JDTne3rMzCjssJD9FccbTr5848ZsDoUYC9YVTw51M2HS
         UjQL9YiUk+xztsbHBcp2OlXIK05c2tpWpUM7+dQUUPS2f7k5JtniQP9Ca2/j0Lihb+os
         xwMXspzp/d8cYPbL1zk5otp7jmNS4h4MyR4fs63AmOsx73KroHUTyDyxJNtYQ1GZ3U0O
         2DXA==
X-Forwarded-Encrypted: i=1; AJvYcCV9V8qRLYmYapiOBy6ZS9Kh5aXb+JPv1CXkBTZXNpikQsrRDWwvX5J6RebOYMJ9yVRgkvjInzmVCRscZAA=@vger.kernel.org, AJvYcCWPtIOxGILfmISy1K42JT9WcmCjbfbAlJvDXoAeFI99o2Xqxi4jK6J91adBvZ06mhjhmdok1nwz1pHsRaribFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsiCMhywyU/VOjR8jP1hEYSVZgRxqqj5BnDRQGzSuI1OXdgmGo
	oj4l4Cy0pm90lU/K2rsu4i64geqDkKaBJ5dashzvgi9kYXy60cuEjHBX4m8hZ9pa51QF1W5COgV
	HrJFDX7n8vg8EYvO6xopZJC65qdM=
X-Gm-Gg: ASbGncuEeGWcCGLPQ18xR4auv+wkMyoTmFrLj2coL2p2CLS65cxA1e5ffJbEcie/QGl
	uFps6gcjJKJzTSzqTbVGkN3pVVQU3fXL5yefDUUz8cFZmUS+xir9PIKpbFlQlAWwmZW4+UmnuFs
	wRMTkhEcEoIdfRSJoEfBhq9Q==
X-Google-Smtp-Source: AGHT+IG7d3qL1AVWHrofGMKEeBa+OEXMZ0HJbqrYuWYwIFpqEZACPYYqtewx4VnIFETVW4FswqHqR9tCSANed6+9hlY=
X-Received: by 2002:a17:90b:33c9:b0:2ff:7b41:c3cf with SMTP id
 98e67ed59e1d1-306dbc09cb3mr3879295a91.4.1744293285580; Thu, 10 Apr 2025
 06:54:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410115420.366349-1-panikiel@google.com> <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net> <20250410130944.GA9003@noisy.programming.kicks-ass.net>
 <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
 <20250410132649.GE9833@noisy.programming.kicks-ass.net> <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net>
In-Reply-To: <20250410133446.GF9833@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Apr 2025 15:54:32 +0200
X-Gm-Features: ATxdqUGnulLPyImGzszq5Vc9mxRdWiusXFMngbv3ViWDlKUA1C4kMWpCGFNqMo4
Message-ID: <CANiq72neZj+ESvkxwXAQFnznwYBiQAcpW4OqXg1ckhxZj3fd4Q@mail.gmail.com>
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

On Thu, Apr 10, 2025 at 3:34=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Anyway, given this core nonsense is now CFI unsound, it is no longer
> suitable to build the kernel. So either refrain from using part of the
> core that trips this, or get it fixed asap.

We discussed it a bit yesterday. Still, until it gets resolved one way
or another, we should be avoiding people to build the kernel like
that, no?

Cheers,
Miguel
