Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3B328A406;
	Thu, 10 Apr 2025 13:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291320; cv=none; b=WAhV5+9LtoVY/yQHe9Bq0bm1Rd9X/5UPm6FWc2GSqVtDxo9oo4I/C+k4Jf5STXRpU55Fb+EXdQW6CGIPELLwZDQ8k4EbM31Y1ZHbSUAXt2OUfoVBSlBX48bTabnDQIFz8JyB5X6xjeI4iMVhq0oiOLT7eggl/UjbYu9+51QGoeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291320; c=relaxed/simple;
	bh=y0uvInJ0Ircvi1mTWNsCTtISA6yDiSLZ78+UAneohH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b/SSqusnTt/hEW+e5QPxvxs/wVoLG0vxsNdOCaXVv62P6EF5KzYueK7O8amRWfNe1MEBaJ/EkU4xA/ksF4cv6+p4e5oxqyEc6Ofk892vcScCiS3ij7fWiCUDS8dcIaS7Emme5CxvP7Q3vVz0iORT0TQj/hx/fJsnMCnI8uCQeUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNhJX/Ct; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNhJX/Ct"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff6b9a7f91so138808a91.3;
        Thu, 10 Apr 2025 06:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744291317; x=1744896117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0uvInJ0Ircvi1mTWNsCTtISA6yDiSLZ78+UAneohH8=;
        b=JNhJX/CtiEVtq6awb28tCJaYanzEZLSDVcGbA9r15mR4YeeZdfQhcBnuiRavSJsDYW
         ahTTQNDxI4cKxsEA4kY/a9vxnbz+ABh93/WimHbxU8oCC7aA3jsTZrtMiJOZtYCTXB0P
         CUIBCmdQHeKxCNpTowRN+Eb1vbqI58JYPfg42lSB61ceCxijOCk3+ZdyvOdwQ9b2ZdtQ
         lDCIs385hYgfgcYfVZqlLe/H/Sv/bxVqE7qay5JqzZxvmfisBhZJGMZHSMfHRrm0z/Tm
         pxPpCuaa7sKO2UAmwOeH4chgB8IWQ+a/VjZ6lJ73MbRAgl0XICez368D0wvomffGZlkE
         XGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744291317; x=1744896117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0uvInJ0Ircvi1mTWNsCTtISA6yDiSLZ78+UAneohH8=;
        b=cZUrjyFpLQNhMpqh9mjqA6a+iTMWD2v6rgwnRb4dqXJPikwez9cLs3gn60eHxu8R8g
         Nb2v6xcmELqfS6rpIO3MWLwEE8shwoWblK6tEO32mwJTTMTcxyJGchhL/n2Sp2s6eoyA
         +HIJGSXOfPg6IQhVvsRAm/yki0rzHvACBY2JdrdF7dinULXFO6ojXgTr2LmCgrVN1DM5
         KXAFN8rQF/20je2mlgKOs+cdUptV/f428Ku2P3K3i18gCn5kp9IS/XjkQeZFrRIEduYf
         2/W/dPfaaGGXoAqf3HBZnNFmZuAkR2BXJ+1liFJP5gr/T3Lw/gts4rwML8jpK0lwe+lC
         AdjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKaz5hy7AvSriP5KhYEI7ntXCIP/fgh/g78BMVLuKAel8tFYvu3B9+AC3O2nOrMpHspvPDkU+P1m+QUhY=@vger.kernel.org, AJvYcCXlPf9vOKOQvLUqeShRxhU/dgltfD4GhuleFd3xkk/IU+l9Rwe8vEjV6Z4h+QqSrTwut4XOuonMQofilFJIR40=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKvKJuYtRCkGTG6bthnbeX2c4ZQnO3zDFLGA8EUYxND8pw3DpQ
	e27DfweJrZEMddKXyukJXPANd7BsNsfpD+Vm0/LG8SFO1o2xyDXef4La8YbR4NzqFDzmrokxzqv
	HziD6ZnYH3iFK5Seu1JZwT6Y3+Vk=
X-Gm-Gg: ASbGncv5n3Echg/c/4Jz+Fp7qrYMx/0rkY9QV4nL+df/JAarteY7yOMCKt19+iGd4/r
	uHSrvzNGM7+GjP7XMhH/i/mKzmDGAPHSfed2Zx3BFm+rDo78eO0cFOKxLxFSs2w/libjdGwUEpo
	54VbXxQF7qN7ZW63re7i9n0b41e2Qdf6Zz
X-Google-Smtp-Source: AGHT+IGUYK877F5L4jTU+jDoFj+iZxSFuzmu0z5Y5iBsg0CN0HUE2LQHhewv7hT1hDtWWFh47H9Wv8i9NpORf98sC0k=
X-Received: by 2002:a17:90b:180d:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-306dd172cd6mr3201908a91.0.1744291317192; Thu, 10 Apr 2025
 06:21:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410115420.366349-1-panikiel@google.com> <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net> <20250410130944.GA9003@noisy.programming.kicks-ass.net>
In-Reply-To: <20250410130944.GA9003@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Apr 2025 15:21:44 +0200
X-Gm-Features: ATxdqUHgm_h4136CFPMuwFbkWHlOQC9TQwtDDJs6vHX2n1HxR6E4S11HaW5Uj7k
Message-ID: <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
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

On Thu, Apr 10, 2025 at 3:09=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Miguel, I cannot find this code in the kernel tree. Is this again
> because Rust is not free-standing and relies on external code?

Yes, this comes from the `core` standard library. If it requires a
change, then it needs to be fixed upstream.

> Can you please fix that. Building against external code that is not
> under our control is a problem.

The only way to fix it would be to vendor the standard library, for
each Rust compiler version -- and there is one new every 6 weeks.
Thus, quite a few copies of it. Or keep patches (one per version) that
we apply on the fly.

Cheers,
Miguel
