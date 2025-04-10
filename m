Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD55204849;
	Thu, 10 Apr 2025 19:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744313569; cv=none; b=Mb4UUKrkRTQn1/3DHh1vWjgzrXhiQeQlvUG69BGiEKxxh3ZZnZ6n3mTUA0F5LVseXRkttjTL61EQs5VhXhPphbee5CTSV6+vn5/VxjBxsjr9HOujbKD6EB+jhRQQ7q1EO/NMP5wqXvURZ9xYg/qe5IXlDoPHMN9jJDweZ/3v+vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744313569; c=relaxed/simple;
	bh=SeQf4Ekar68aJz2lLkiDfxXINl+MdYF4NtdTyGq0ndI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ckMyc0affVHKdBRB8DsRzdITFRyJXmEdsvkKA1KdcH3q9N5LnCEZEG/NRNFTAu6Yqm3Wf/MNhTClDS58ax0w32XDn/rumNlMDlsGciHbpxJnKOC5LsAJ+dJkBXf8pVw8fZCEfZkFNDDrDDPgwvCh+2hqVkWAtY45cl5+Dlf/GSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gaz1yM+V; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaz1yM+V"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff5544af03so316273a91.1;
        Thu, 10 Apr 2025 12:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744313567; x=1744918367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeqY15aAyimA99ymII4lyCTC8S630lknHY0ZYFJUm3U=;
        b=gaz1yM+V1aqjbfm+H3uQI/gKAFKWk9b1xYb+G6VfpGaFluCRrDtcg0cO9T+beSoajK
         cSnkmkUdr+JQsTTa5if98Qn9MFfOAUSH4u4pPDw5ioOWsFFBNPXvHYdIMHtUc8VhTO/y
         IiVqIkPsE1qr0obs0lAPRmrnOMYjiwip46VBo0GOmJDygmle3h/4UHGxGvi2N9fnhcwO
         SoaxDDms2VQ/RFwfi8tCzEhKSTkuuf153T+8Abe4xcfvNNeft50IdYeQf26mRovVH0j2
         waLoNJKtBrPg/qxdCoKS/qNoJVbqby8VfwMaFz7CP3bQV+pzyVk3y9FHA3cRkSmou9o1
         uIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744313567; x=1744918367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeqY15aAyimA99ymII4lyCTC8S630lknHY0ZYFJUm3U=;
        b=aaHMdL0ZrXl2su9yVGJvlQV3eqY9bD+D7aceWNnhqsJIGSWSvsj7WRztjPjKUbgew8
         yFSIKOJ6Y0MB1nixPrKSwwkacBKEiCA4yylTFNi0sOrut8IuCZ3VCSPvAP/QPdNbxGEg
         Q3KKsJW8ugEtbExCKfNkOj1WskGRVLM0bfYjbcAalS/vnSjxZ/MbBFGS9v0Uv/YXY4hx
         gXgBmZ5zzTu2Ky4vMh+nSWKboLFO+LBXrfz9ClIGPHzuAQ9l/dNYMJ4K6zgQwWoIhe0o
         xBMiUpf39g1Ds8xI+7L3434Y6TkDt5Vyt+Rqm1sfbyFrP6n/PguM0k+SwhGRVATHLzqA
         qlkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUknisilyyJ55ortMjXiq0dHVTyEZaxWsVc0e8mC/q8g5pz0L0KzZ1hUAuclVfeZ4/dPFHiwOYf6zy13mSVHXU=@vger.kernel.org, AJvYcCXWT8wFUz7KHuLteLPFdvoaOH+IUyWtQ29NtgM2kT01IKTqhoCYwwcFPCO9N2unx1W5saF7BuCAuGqF6sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyclB5XbLJe+kQSC5XMzfsV0Ep56isBVnvFP75FR/Z4IPAwJ/8B
	vdjs+mRCUdS4/CJ4u7nO1lfQJCOMlnPj4LdlQY3TXKkLyS/AM7MWe2/NRFxSQZLYtjBaaoqFsc1
	/6yPLYtj7vfkxlxt7aAHX4ZUlsKc=
X-Gm-Gg: ASbGncvbgjX02seX8YlmgNT4qp1PEPB0F19+q3oROxfkvLZ8rhbKZWsUHVnWC++UgXK
	mxMYR3PKQkcf5hIMGtw7AgpqfZ/adMoR5D3qk10hgXUojoNf+6M4xMoiBKTww0Q79yfHQONHBvR
	EYA6z3KHcP0gkC64H9YB4+VQ==
X-Google-Smtp-Source: AGHT+IFnU2ZUwuiyWhkRsLS0PT1QXn5dmyassrZ3+vhu10jNVWGMQL5v0QKXhkDgDM1HqwH+gsFMEOlwmMINJxdFRIY=
X-Received: by 2002:a17:90b:3ece:b0:2fa:6055:17e7 with SMTP id
 98e67ed59e1d1-3082378c79bmr81605a91.8.1744313567288; Thu, 10 Apr 2025
 12:32:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410115420.366349-1-panikiel@google.com> <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net> <CAM5zL5okN67bsTs6ZodcJd45zQ_BP+ruUwOkPMY97Snma0ugzQ@mail.gmail.com>
 <20250410132522.GD9833@noisy.programming.kicks-ass.net> <20250410154556.GB9003@noisy.programming.kicks-ass.net>
In-Reply-To: <20250410154556.GB9003@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Apr 2025 21:32:35 +0200
X-Gm-Features: ATxdqUHMXzgP8f9dLLQH8Z9Yxc2FXsl6vpG4FakDn0KsQ3tBiBxX5Hm0rcmcEro
Message-ID: <CANiq72=gBYbyGG9Ty_QmA4nadG9COM+hZpvxVq5t5bBvtwva4Q@mail.gmail.com>
Subject: Re: [PATCH] objtool: Detect __nocfi calls
To: Peter Zijlstra <peterz@infradead.org>
Cc: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 5:46=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Detect and WARN about no_sanitize(kcfi) indirect calls.
>
> Apparently there were a few in some Rust 'core' that got included in the
> kernel and things went *bang*.
>
> This is not a supported form for kernel code. So detect and warn about
> it.

That was quick!

It seems to work -- I got:

      LD      vmlinux.o
    vmlinux.o: warning: objtool:
_RNvNtCs8DPF7ip8WBQ_4core3fmt5write+0x170: no-cfi indirect call!

Cheers,
Miguel
