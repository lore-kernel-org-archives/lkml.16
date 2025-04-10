Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FA9276021;
	Thu, 10 Apr 2025 14:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744293969; cv=none; b=flYxx6x6Mg0dNiL6g3b2TTZPht052lf//QLdiHHc94wn5T6wabCSyxjf+jjmbUPCIPplIw7XPyNsbkTTI45udsfo2mbI9egu2b1sbisnJA/WrbF2lK0EbPu3aNsj6vWX7MsVHfIneMUApypo67L5YDonJE4Yij24u36el/9/zsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744293969; c=relaxed/simple;
	bh=tei3hsEoTD1xgaLQbNCRbSNtEgHNibOXE9Oyfe+Y11o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t2Teiky9tG0Lt9nQcVG9rZtwvutYSeym6BE1S66LQThgjWFq2XtiGO6nl2dSpENUeq8hC7jL7gnvS99IXZbeMsFmshyldS9bvRrzmUNlwYHVJniEjCbj7yOqDNFw8tpk3RMiSL6lS6CkGu4+lFYmYGgwSMupgQvPdhCb6/ZqDFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGRkvC1H; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGRkvC1H"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ad55376c2c8so60967a12.2;
        Thu, 10 Apr 2025 07:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744293968; x=1744898768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tei3hsEoTD1xgaLQbNCRbSNtEgHNibOXE9Oyfe+Y11o=;
        b=jGRkvC1Ho1WvHiZy2mC6WyLup1TgnlpwUI20xzy2TA4htK5e1Da3b5pm3pSlqKZKNR
         3vkk1CONtp5yqX/kZE9JiHWuMfc1DnD0qfP6XBAzT4iLPto2wwm5yeKZVlUYdb/u3SwK
         NOe37jFc7q+Uj4mqsE+84X9JsVGyaH7aqzqg0XQjczZd/MRUhJs1KiWnzMULpyCEkqHu
         y201kP1yZfF0+9E5RpsmjtY3ek792gqjf20G2Uqg6GR0sEiF8gtDa6MVSs94SzIe8Tiu
         /vjxe88B5zflSPDchYB9oce0dkT9zg0E2QDK/8UUSlBAUps+xQdvN69GvNYPiFyYcxdb
         LYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744293968; x=1744898768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tei3hsEoTD1xgaLQbNCRbSNtEgHNibOXE9Oyfe+Y11o=;
        b=VqLJRoP17PKQMC3UhaX+dCz0LlKsNbqy+sGkEpf6zS5oAW8oJpmz7OGoSJvkPcXust
         QI/J67qfp8Q8eAvn210wvGUjdizFbyxG6em7Prs8tnyfmAFe8d22bBOuaw/TPvWhDhUI
         FZb965MACISnYnpUw1tWNNv3yncF+zmrrPvd5P3R6/TyYV7N/6dovkHl9zbvyrugKDLX
         ERsGAmKBa1hm70RBO3RLzQxVoeZTDYPb3YxCV0IBO4jZUnqTSieqjTUgxL1ZE13D527n
         1knxfcfpy7WlUgDN4/+R2OKnMeStay73iossB5hOrfzvI5zBDAWBN7iSiXSpcvtPW1cL
         HSAw==
X-Forwarded-Encrypted: i=1; AJvYcCWdNwZ2ERewWIDm8U5Pd7bSvMF2omUZWltDYBxSXLCRCLGqYxXJ2Aq8ra673XUYSkH2O7PrwlDAPYd5PUs=@vger.kernel.org, AJvYcCXA3VFsJr04B7wneofNRdMbCSRgApgkSexsbg9QvAVA0+KZnd9v7Y3F8xUGiNJV6uGHjTpu1T7XnMCvQsMPYtY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuk2Zk2bEadgeItTb0qBbEg7rSLxLce+TJIh4FgjGuMoZcvlOJ
	f7836H+FHcCZSCcy7h6ibCbybOerEhoETSPtbxfhk06i6W4/cQudXaExgPNhW5htuwRtphUQs6K
	CXIvYZB4QCXUo3qnNvvhzkgNMjpQ=
X-Gm-Gg: ASbGncsr26uHzCVH6tIAsRFEKDJLqMpT/XmEfoKb8cKQp5PvoCeWg/7cFUri6RmAMfQ
	tv/64+qcG9NX04qDH4XmRtiQit+Ql4Wzrj9Ldl81c25H+OzhU6dai/KIUrCvgDEAN7v8zGa3tKq
	2BBHqYyLcSwuHQxY+mFlDuBg==
X-Google-Smtp-Source: AGHT+IEtl0TOfCd3432K2syK7t6Hzi2+MbtCJCRDKAL3XnVMH0PyAgZBKTqu6Ecb8fXNNBq0SIIxQGFPWhbitcHHOkk=
X-Received: by 2002:a17:90b:2d88:b0:306:e6ec:dc82 with SMTP id
 98e67ed59e1d1-306e6ecdf7bmr2648630a91.6.1744293967421; Thu, 10 Apr 2025
 07:06:07 -0700 (PDT)
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
 <20250410133446.GF9833@noisy.programming.kicks-ass.net> <CANiq72neZj+ESvkxwXAQFnznwYBiQAcpW4OqXg1ckhxZj3fd4Q@mail.gmail.com>
 <20250410135713.GG9833@noisy.programming.kicks-ass.net>
In-Reply-To: <20250410135713.GG9833@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Apr 2025 16:05:54 +0200
X-Gm-Features: ATxdqUFrdVKSoXJ7d3U5-MA0fO_i74QGL5_3EkGijZJmtrZ967F7Z-qp8SLV0GI
Message-ID: <CANiq72=uj3G8ibnzpuYzhY=7T5xrBBPoeuAX7X-iBKdN+crQUg@mail.gmail.com>
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

On Thu, Apr 10, 2025 at 3:57=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Remove the offending Rust code? Afaict from this github issue, it is
> just some formatting nonsense. Surely code can be adjusted to not use
> that?

If you mean not using the formatting machinery from our side, then
that is a major change -- we should just fix it upstream, really.

If you mean fixing it upstream, definitely, but we should still
prevent people from building an invalid kernel, i.e. when Alice's PR
or similar lands upstream, then we can relax the `depends on` based on
the Rust version (which is something we have done for other bits).

Cheers,
Miguel
