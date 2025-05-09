Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFFE21CC60;
	Fri,  9 May 2025 19:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746819198; cv=none; b=hsAt0uOamUcZGhIfozN+dg4wzSoAVBoDNj4k0y0EQ3HveunXxBoyFb7xOU1OMF/QkclrMYYtqAE9wZRQFLcxmpONgJrW4C9ZeJoeRbpdnzlLdo7qvgqlX6WnjySgswZWIkJmno8U7JRR+3CGeMqWouq1xQWdgWcsF0jWdxoKlc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746819198; c=relaxed/simple;
	bh=gcXbNo6dJxypnrrB1Lryz35q6/nYgcIJf/jVLyFqoL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=smDJ/FFBA1vsq0bMj3TlfaIwYUxukpQGnhzZXEeQBWHNSKFiqBxG4CcEy1lY/bDzu63BO0eSos+bTPpGdm9D+RG+a6WJpIf7Dlskw1jXfdIOailvW1mFGw/voY3/fYT9y2+Gjq9+yWKuMiIHj9dOEl0I1Ndar7akaHPPlXuRLUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJoqr1Ew; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJoqr1Ew"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22e696bbc85so3861675ad.2;
        Fri, 09 May 2025 12:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746819195; x=1747423995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcXbNo6dJxypnrrB1Lryz35q6/nYgcIJf/jVLyFqoL0=;
        b=EJoqr1EwPNyQmiTHlflpBtnkpzIrIm2LuLAw9wrHClRN7SD00jyhHtTAK+3Pz+Qk8V
         OZAbzgsXzXTHfHNqJqa6mpnfbz5nZPn0KdUt6B8gB+Pe5sUe1m0GcZ4Bmc+gHM7H4x+e
         n/b9IjTCuQWhzF3KnujU88FETH/6/C+X6Db9e9C50wO/LvpzmbqC8sg3HYODL4bZ+30D
         Prj6hdk+YhVVmx2tRgLjBcCQh85yB8ac9E6tWFVBOuj+2QIzS7wD1ckA8aV7j/+G6agz
         BzYT9SAXNd0vcjrIOJ+VgjfQIJsphG6NWsAvMA0aWamRrzNBe6TvWzJLaC/f8q7wukWP
         sJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746819195; x=1747423995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcXbNo6dJxypnrrB1Lryz35q6/nYgcIJf/jVLyFqoL0=;
        b=PtUB5K+CXWMyIUPRKKWKdtM+siLAxKq/CLPcaJsRznACB4hr2LW3/Vod5nPLVTr6bv
         ySS6x1rA4lnY7XgTHXWkEa+oSW3KVhaCBaPzkbtnGhQcAjhuYgqBDsvZEtSZKJmLa6/6
         3HVV4V5KYKXefW8KkdRGz7BU0ReGmREql02+AXq6m03N5AaHfp9/zNNfwVCOZsFn7Trs
         svQ3t76P9HGQ3O/XS0ws2sXVVRSetZ1rgdQmxApP9cbx8lweClDhUtdvSG5LOoZrjhZT
         bRjiQS35nlZBUjQEYxb9g3K9hfi3F5mYdZqrgW2BKFYCR36NwDs5DlEYFlh/G5g9eL7/
         GoUA==
X-Forwarded-Encrypted: i=1; AJvYcCU7mvYN3+0LuF2vZtW8EubWOLvmoohRKx5fW604lHo0mQ6bsgBAHJi5/AGVMuXH9L+0HqtBC+YQRbTEE8Qm4kA=@vger.kernel.org, AJvYcCX0Hhlt6KX1CLmb1Qbm4hcvgkByLKRiutYxeDzcEWtRPlvRjILBUlNl+HYXkk9dziwruH2jUfCI2Clf0Ag=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZpc+9FrSv9xtVa/uIMjy9QJH/XY8o88myaGzvZR7Rx7LvvMU7
	I4VGczKmhG65FWSrsMrCDnB7X8tK9T7q53EGkCeKE+XcRdY+ZZPaZuE+UV06YLJf9o3wHCFAIiZ
	/eN4Wd+MPLXK8asxS8b/OX6GtIhc=
X-Gm-Gg: ASbGncur01Rrc76A8Akx16QCtGhMoNm8Jz4HlfLXnXMv7o/9b+hCZljsSVrCRYW/2bQ
	C/byTu8OvnDXgVTIuRSKnePXSyCOvLnjQDwrvpOuhcwAhxiCwFlcTFQsWdkiUaF1zwUkfyteRO0
	NiiFgLgKuGsswQYU7imcB2ZcsWIkPb2WtH
X-Google-Smtp-Source: AGHT+IEc+d5JlKdjlFuIvBIjbzfQ3nYKhJC8MzeBGJwwq9mAHyd9wC7lk9Jb4ibJ0mKKb5H5AmC+T8ZMCBG7KEqaRMM=
X-Received: by 2002:a17:903:198d:b0:22c:336f:cb5c with SMTP id
 d9443c01a7336-22fc8b5d360mr27329195ad.6.1746819195491; Fri, 09 May 2025
 12:33:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410132649.GE9833@noisy.programming.kicks-ass.net>
 <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net> <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
 <CANiq72k0AM3v9JZe=8mDN6T1ToiAt1-1e1zJ3z0Oh6ZWfchzag@mail.gmail.com>
 <20250416202040.GD38216@noisy.programming.kicks-ass.net> <202504161442.66CE2596@keescook>
 <20250417081818.GJ38216@noisy.programming.kicks-ass.net> <CANiq72kjDM0cKALVy4POEzhfdT4nO7tqz0Pm7xM+3=_0+L1t=A@mail.gmail.com>
 <CANiq72muSS+NNs5fxp4GPKWWhyXT95spvbGsZz6AJnK8RerUqQ@mail.gmail.com>
 <aB3A0Qe5WqmxXQJt@google.com> <CANiq72=NymSwziZw1a0PUNyJ=TCN5tkr3PojJRQ0sjqFWDjz-g@mail.gmail.com>
 <CAM5zL5psM0ED0A5ZkEdNi34q2itfyMCi+QRBtG-5URUsChUU6A@mail.gmail.com>
In-Reply-To: <CAM5zL5psM0ED0A5ZkEdNi34q2itfyMCi+QRBtG-5URUsChUU6A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 9 May 2025 21:33:02 +0200
X-Gm-Features: AX0GCFtkYaIQp1AmgGJnhaM7CVq74VADIURITEbAJCO-BFghfABDmVAwuLpLGuc
Message-ID: <CANiq72=eMued_fEb8j8auBmEUiQ7Cnh7fQiTv-kMeKgh-JALFA@mail.gmail.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Kees Cook <kees@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>, 
	Ramon de C Valle <rcvalle@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 11:12=E2=80=AFAM Pawe=C5=82 Anikiel <panikiel@google=
.com> wrote:
>
> On Fri, May 9, 2025 at 11:04=E2=80=AFAM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > I thought the intention was to avoid disabling FineIBT at config time:
> > https://lore.kernel.org/all/202504161442.66CE2596@keescook/
>
> I think you mean enabling FineIBT - yes, this patch does exactly that,
> it's still possible to enable it by hand with cfi=3D

No, I meant avoiding to disable it at config time due to the rehash
discussion between Peter & Kees in the Lore link I mentioned (I see
Kees has replied again -- thanks!)

Cheers,
Miguel
