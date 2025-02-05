Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3DF15198A
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 12:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738757746; cv=none; b=XUcRlkVzWh1Tv37WtnlXb6ElQwm10Vn06L7HoPtKJ5th30Ri53ooImTPGiLKHJJSo1YPV7mE36taPnKC/biLh5pP/nT/nQknck6fUgLnDsm7GQzGQAmIXy50zOzDRHylZ4YfYTQU1DqI7zQot3dtFQSuHejqtrvvpQxptW7FhgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738757746; c=relaxed/simple;
	bh=J7wilqmPHsuhrjWldKeEduAhOIlOAovrmJnuTkf85mU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FiLXuFMRwPYVKgcmB7GKS9MFPRI/cO5l/RbMd6eR0WHPqoiOOh20S5ethqFCBvZJB9l30+LsTe/Ajv6QrJtaXVQbol28YtLb2AT4Km/do8C64JSe+s0KqW5DBo6RWZfFCTfcVxeQBZh0KVRs+xyfB0sak4qsNJTM6n8uc+YfOx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fv563eM8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fv563eM8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436249df846so46034735e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 04:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738757743; x=1739362543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RLrvslM9aFEcwqi4eoMGeCeN5mBvMg4pwEiJB6GaxM=;
        b=Fv563eM8kjRfnVHBsAY+gimHVvYSVD4Z0r6ZgfudHh+dVVc3mPuQY6FitheAj33Usl
         GoM2V7pHX1kT1oK3QD/AYXQu5DIvVJ3P8hjFQqoHjJGE31Gqn1ObyviWSaaq74GXutsK
         QXpPHKSNBiD4YSar61ZscV3W0UJoPen2KetRV4KtmPt2htKxV+eUyqKAUuQjilZifkJg
         gFeopTQfdXeoJBMC5FLc5JLhgNBrfgSg0eZby4Djl23NPAZx80Qh7f042FD1HIfdNHm6
         439/lC5tXkuAskajoIHugRWRTZEB2omo5qJdiq44IkqD0am/S7IOUgCUbq1FOjvvBOf0
         Y4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738757743; x=1739362543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RLrvslM9aFEcwqi4eoMGeCeN5mBvMg4pwEiJB6GaxM=;
        b=rc2kQGGGqV3ReN0og6WfFyBZIM9bHViLUOdpQjk6GcVAhRfooCSAWwbRWGuKMXMBEX
         URjhJStLjrEUEPGG9rE6iKupw6PC/cFH+ZigLCaGtzjZYuxOp1fTN3AtGs0rw+7BgUhT
         su6xp2VE5DDhY5hIsFcJ1gsTXNMbR/alAGw23zlqoPiKHmJNwxOGRIxvwS+13K+e9xrG
         tZMj273JKpViKgizKsCDDD5kX1Z2hdarxFZiXy6i0pCzK/lX8kRGecmkhik8zi8IRBvU
         Ly+WZZaDEBscwuIPfcrDbwVy4buPGm5vTuT6ktEH7QKS9UxxGUMn3xRR2pS2osD5bLzZ
         qKBg==
X-Forwarded-Encrypted: i=1; AJvYcCX7DWsKC8XSs9ip/bJ4yDxCVzdh496d6QMVdW29nEkzIBRbK/dTpJEzwG6m+AyB1iA2qNY3MIgd0ZokXoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEoFyoLG/PH0Fz37RnnfyrLKetekhNMVRTDa9MHArNuum4BtIm
	PMG1qejv5vHPU1TzKmWp2w6pszPgjPZaREnisqwVXNolFHDrWaie+NExbLzSxo6fzOoU7FoRSmT
	17eFEPrL1x9AxCDt/UWsndLcY+GeknJHgWZqW
X-Gm-Gg: ASbGncsj32aFbvEDFJf1Peoi10n3IGkdBEvaV+egk6agNcTmM62dQGDlgCDFURNTeD/
	RQTGK8O1sOlWcrH1W5TKNho7qeU2T4WgHlN7/EEfmHLLLc7IwgkvhzowtYSgqJz321tNWiDBoHn
	/hNzT5+Ie/hodqdPJYWXRCcRvjvfw=
X-Google-Smtp-Source: AGHT+IFFRYDcBNRUvh03b1ZpAg+T3eOWU8MKC6oSOTuMU6IgCntz4KLfqSMmEcACpE/3OM6T62hPydq7xJ0UjjusIvY=
X-Received: by 2002:a05:600c:3b11:b0:434:a852:ba6d with SMTP id
 5b1f17b1804b1-4390d4342abmr18361165e9.9.1738757743090; Wed, 05 Feb 2025
 04:15:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130-condvar-freeze-v1-1-a91d5661d505@google.com>
 <20250203115418.GB14028@noisy.programming.kicks-ass.net> <CAH5fLggyyP1A=uNxr2iYNKOj0V5rxZRU83TRgs6Ah1uJ=Ee2uA@mail.gmail.com>
 <20250203133843.GG7145@noisy.programming.kicks-ass.net> <CAH5fLgjVyCSTyZqS7uSzWMTKvrxPL55PKUyM-H0RrnuZiU9VEg@mail.gmail.com>
 <Z6DS6cIWgGsX7FXL@tardis.local>
In-Reply-To: <Z6DS6cIWgGsX7FXL@tardis.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 5 Feb 2025 13:15:31 +0100
X-Gm-Features: AWEUYZl0MM3H2ej-cs_2WXNnkdTtvZUWRhiPa7g5MlTz6fq8IJdCvnZGxjsiPnU
Message-ID: <CAH5fLgj0gGxSWv1U+kjWTwAx7yfJCJ4u_cjfBwZjghZ5udbyuw@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: add wait_interruptible_freezable
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 3:30=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> wr=
ote:
>
> On Mon, Feb 03, 2025 at 02:41:37PM +0100, Alice Ryhl wrote:
> > On Mon, Feb 3, 2025 at 2:38=E2=80=AFPM Peter Zijlstra <peterz@infradead=
.org> wrote:
> > >
> > > On Mon, Feb 03, 2025 at 12:56:05PM +0100, Alice Ryhl wrote:
> > > > On Mon, Feb 3, 2025 at 12:54=E2=80=AFPM Peter Zijlstra <peterz@infr=
adead.org> wrote:
> > > > >
> > > > > On Thu, Jan 30, 2025 at 11:30:44AM +0000, Alice Ryhl wrote:
> > > > > > Binder allows you to freeze a process where some of its threads=
 are
> > > > > > blocked on the Binder driver. To make this work, we need to pas=
s
> > > > > > TASK_FREEZABLE when going to sleep in the appropriate places. T=
hus, add
> > > > > > a new method wait_interruptible_freezable for the condition var=
iable so
> > > > > > that sleeps where this is supported can be marked as such.
> > > > >
> > > > > The constraint on freezable is that you must not hold locks. Ther=
e is a
> > > > > lockdep check for this in the code, but it would probably make se=
nse to
> > > > > teach Rust about this constraint as well, hmm?
> > > >
> > > > Unfortunately, I don't think there's any way to enforce this at
> > > > compile time, but I'm definitely happy to add this in the
> > > > documentation.
> > >
> > > Ah, ISTR people talking about teaching Rust about the whole raw_spinl=
ock
> > > vs spinlock vs mutex nesting order and figured if it can do that, the=
n
>
> Peter, are you talking about the POC idea I proposed on tracking irqsave
> status:
>
>         https://lore.kernel.org/rust-for-linux/20241018055125.2784186-1-b=
oqun.feng@gmail.com/
>
> ? I'm working on this right now, however, I don't think this would help
> spinlock or mutex nesting? Because there's no global(percpu) status of
> acquiring these locks. Am I missing something here?

I assumed that Peter was talking about klint, but I don't know.

Alice
