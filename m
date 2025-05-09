Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872C728C865
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746783584; cv=none; b=tPOQng7bF9cW0Fe6GuxMqNB579KWtj3ikfNKugZ6atfQdQfQnM0DDzt2A4rqBTPGDVHSnapMKfLvf5HpBAlXBIfPi3/xkepGyeKhNOT3ecA1NlvjJfoBCRrKIAZCH7BNR8SvE4I5CXO2XAB2zZcJzOvoO08oVUIBJibaDomYf1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746783584; c=relaxed/simple;
	bh=RplcoCMUVfVJa1bfwTgt+wQZds9GCvttkxCVBpMbMAs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A7hYUo/UnvSwNei+x1OO/k8CkwUdL6T+dfy64lzLvIhwEsOWIpx3SrUNUSwKgax+QV+JwgURw1escH5wupij+xzR7+bjt9KrzCkDLv0m3wUl5uA0EEPllA5wLh9RIJemP1eu8anoFacSpfjxHvakVNnZB6RuFtv5UHr5Fu4lY9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1KSjstOE; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1KSjstOE"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d733063cdso15244805e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 02:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746783580; x=1747388380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTatT7oc6SPkLV8UOO9ITX1WtYVFDfP/JvB23W/R7aU=;
        b=1KSjstOE9582yrWrF58W5WGXVXMgzfWSbEZ+/CG2SN+w7QrXac84FE0O1QcqQYJAXR
         nmTVCZGp4UeuTW/WPmf21LRJj0Ejmxo4vvFk9J30EoAlWhhS+a+0j4WgRriODTORmIp2
         MPdmTsDM5adPFiQ5BlR6a0TcP2v5Ho3UHuCnE0UIMM1cq8XRzOw3W5qljZOW0EpzL5CR
         RVv9DC7pBriz4cvMmzPJv+9RuUnqEHx88ccc/MUE58edVkMEyA6RcY1S3ABh2FH7OQTk
         /2Jp4JrWv6EQlOVglIXib4QiLJTJdUgTs4YiKEWOUCEXc1XTl++kpLXBehlm0qafQur/
         okaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746783580; x=1747388380;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kTatT7oc6SPkLV8UOO9ITX1WtYVFDfP/JvB23W/R7aU=;
        b=Ul1AIQxH0oCCLNclcEoPXeZDoI+xTsv/SjQojoNUftUPsPxWoL92HC2Ew92uamtr7t
         WUaw7l0HAZ814pYP/1xxInjgIvXtT0HV4mvWg4GKSK9dsjoSN0K8aMGXtSHYimRJVfV4
         dV6d6lXu8fb4eHp2iiZ7ZAKIs6BfnG/LJWMNaJ8PVvdfO7oeqtQyxeQUdFOOrNf5/UaL
         aSFa/I11yzFX6vSfTv7p7qJLb80S7ZlqSPREUWzIBSLs3Sj0SlPkcYx/FAauxVNzgo6o
         jF2CI4pjiiItNuj2Mh4Gk+9ON/Ht53NAiRj+QmD1NV/eOmKISu838FBE+kL7d9nFByl6
         wptg==
X-Forwarded-Encrypted: i=1; AJvYcCUwMR160IUVsPYU9p523PLxntXr1TkTIB9H1JMseoVPM6wh0V4+roTCn/KahJGLA7z9IppCjYOU16agVmA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Nn/W3ZPY2nL4N0KJSHPe4QcYeGobgxvw+l9oY6tChrQJhZJW
	BmnIHA7+7N4ntyfypRUlBPMBCUjyRRtSN1ki8O0Hg2b6PU3ajS1KXI+kXRHMtFHWxSe3yCG1SVt
	XXvQ3lm9qtFJWiw==
X-Google-Smtp-Source: AGHT+IHqYY6QgFatnO4kmm/lbjZTm+fx7RZhPxnJgrujsTZiWnAaUwl/SJr0N8FI6m9dTrvKDwuZPkt6E5895QI=
X-Received: from wmbay20.prod.google.com ([2002:a05:600c:1e14:b0:440:6251:31f4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b17:b0:441:b5cb:4f94 with SMTP id 5b1f17b1804b1-442d6d08c20mr22251045e9.5.1746783579884;
 Fri, 09 May 2025 02:39:39 -0700 (PDT)
Date: Fri, 9 May 2025 09:39:37 +0000
In-Reply-To: <CAM5zL5psM0ED0A5ZkEdNi34q2itfyMCi+QRBtG-5URUsChUU6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
 <CANiq72k0AM3v9JZe=8mDN6T1ToiAt1-1e1zJ3z0Oh6ZWfchzag@mail.gmail.com>
 <20250416202040.GD38216@noisy.programming.kicks-ass.net> <202504161442.66CE2596@keescook>
 <20250417081818.GJ38216@noisy.programming.kicks-ass.net> <CANiq72kjDM0cKALVy4POEzhfdT4nO7tqz0Pm7xM+3=_0+L1t=A@mail.gmail.com>
 <CANiq72muSS+NNs5fxp4GPKWWhyXT95spvbGsZz6AJnK8RerUqQ@mail.gmail.com>
 <aB3A0Qe5WqmxXQJt@google.com> <CANiq72=NymSwziZw1a0PUNyJ=TCN5tkr3PojJRQ0sjqFWDjz-g@mail.gmail.com>
 <CAM5zL5psM0ED0A5ZkEdNi34q2itfyMCi+QRBtG-5URUsChUU6A@mail.gmail.com>
Message-ID: <aB3NWUrtWMXOppYE@google.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
From: Alice Ryhl <aliceryhl@google.com>
To: "=?utf-8?B?UGF3ZcWC?= Anikiel" <panikiel@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Kees Cook <kees@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>, 
	Ramon de C Valle <rcvalle@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2025 at 11:11:48AM +0200, Pawe=C5=82 Anikiel wrote:
> On Fri, May 9, 2025 at 11:04=E2=80=AFAM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Fri, May 9, 2025 at 10:46=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > Actually ... I don't think putting it on CFI_AUTO_DEFAULT the right
> > > approach.
> > >
> > > Shouldn't the depends on clause go on `config FINEIBT` instead? After
> > > all, the current patch just means that you can't make FineIBT the
> > > default option. But you can still pass kcfi=3Dfineibt on boot to enbl=
e
> > > FineIBT which would result in the same crash.
> >
> > I thought the intention was to avoid disabling FineIBT at config time:
> > https://lore.kernel.org/all/202504161442.66CE2596@keescook/
>=20
> I think you mean enabling FineIBT - yes, this patch does exactly that,
> it's still possible to enable it by hand with cfi=3D
>=20
> > If another approach is needed, then we can change it on top if that is
> > OK (I am about to submit the PR).
>=20
> Putting it on CONFIG_FINEIBT was my initial idea, but it turns out
> that this creates a dependency cycle in Kconfig:
>=20
> error: recursive dependency detected!
>         symbol RUST depends on CALL_PADDING
>         symbol CALL_PADDING is selected by FINEIBT
>         symbol FINEIBT depends on RUST
>=20
> Not sure if it's possible to make it work.

To fix that, we probably have to do one of:

Option 1: Upgrade the rustc MSRV past 1.81 and drop the depends on
          CALL_PADDING.

Option 2: Split `config FINEIBT` into two options:

config HAVE_FINEIBT
	def_bool y
	depends on X86_KERNEL_IBT && CFI_CLANG && MITIGATION_RETPOLINE
	depends on !RUST || RUSTC_VERSION >=3D 108800

config FINEIBT
	bool "Accept cfi=3Dfineibt option at boot"
	depends on HAVE_FINEIBT
	select CALL_PADDING

Alice
