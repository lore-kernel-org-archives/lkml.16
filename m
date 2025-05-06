Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741DC4B1E60;
	Tue,  6 May 2025 22:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746569966; cv=none; b=piPhkBp7rFC4vHCsbcYauNo4R1zupoRiQo4ce8/zecsFPuBA47gpRa9ac5F+VTAHyWk3f5l6vH8WwNF9p1UKg6mhM1jJXq8r3FD7CLo4ptuirNckvVfZXU9mtlAbHpIFoenBl1H4N0m50gtWWYksafc/WcDdk8kc6/dT63kQQms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746569966; c=relaxed/simple;
	bh=msYraZeG23tMmnyNeSplinYDOrlE8I2UiaVU3Kpkbg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MQv3uonasK4ffybxLC+2p94RKrOIWrLswWu3yPxNf4p8zNqJQr3niEOFLZh/rVliz2jpQBWKoZ4mKWPyX0EGu/CYPqHNuuqBHm+2PNC+cWU3ycnSO68tGiYxdl6DnfJj+j25EYrhTRheIRizn1AYwNdchOEJGAwc9P3aoqN1VcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdOM2thd; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdOM2thd"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-308218fed40so545608a91.0;
        Tue, 06 May 2025 15:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746569965; x=1747174765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ffzXsESE06QaADA4Dec3evlw7VYt4gDexnnRqODOEU=;
        b=NdOM2thdx6609E7+6UB+BV9kWSm4uB7cGxqjlUPESvwMztuJt5DnohWCIMXtpRFuN/
         bIk1GIphBYE6SA7Iws/Nf1OeKiMNzfptrV3Za6TLFSjeNiYrnEShaV1my4iLiUJ6tkTy
         vKaOSRQoH2QeQQgt3nmZ83VI/5d44jfsjIEGtgGQp9LixAkDIMow3/uHlVdTRf2TU3na
         XB4RWK8IRSqGjkNmc5aaYPlnb9slcWV72u7n6sLx9qQ1JIweutiakVPiup3t9YpMa0lw
         50gzFoCyAabZZ5ZX/RpT0CZi7jMl96UyvPTA4xHn7CkoEsKxOC3TYqVYOiVxlXh8Pc8x
         sdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746569965; x=1747174765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ffzXsESE06QaADA4Dec3evlw7VYt4gDexnnRqODOEU=;
        b=LKD+gGNGr9L05Ohfvb5Z+1pB6CnmM3dLdk4jW7WAk5U48JV6AYGl0k2RofkSnTA2wK
         9zwJyJ93cwJS7C8lZQozLB7jqKyzKZbQLkTUkshoT5fmekhsq1lYFC4Ffp+WObEWe/+/
         /JHMQU0egMRq28/+fxsf3IK5Ka2Oqh3q6eF02jf4kaagCTh64z04yQPgm+M9RNSYHnbQ
         rw3GISx3CQPRwYIhirJIT0pc9ZFfUqVU12O8pdnRdDoIYmzIiLM7ndqt3NTazTvPPJLf
         u7pHJCjtArN1dpNiY1xvG9Vij749eOzUJPYzsQmsQ6vaaDn+cOBdwpZh90xixRP8w81+
         nTDw==
X-Forwarded-Encrypted: i=1; AJvYcCVEDRIEUNBRhQH/S0IohFdPfaM7tVbidS4u2BzJltSXNt0wtNEEq9c4kLdYNbogIQKeyOj1kCRc4L2Hfoxr/YI=@vger.kernel.org, AJvYcCXiZNlml+WCJmyuFv2nE5kH35eYPmKGYe9iedi8LgDTqPStSgjPflkNn7ndl1Y6ujGIH4IHeVrQgBTZZT8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ibCEPqbScHYYIU8xhRPvlqGSWKsmlvo+iZ8f3CGY4T/1oyxS
	csQ/trWrUdLrXem8lO3lmzKSzAWaxqcDZajQa+knqAqabRFVv64tnbnT9dFMl2cHL1bzmzaJUKh
	8y4bF1w09DEg9o4GZKVEy8wdZLRM=
X-Gm-Gg: ASbGncslRofj2lvW0rYtBLSBE3mVNMfWf5FPeHUzFVNrfc/cwZWVmhig0SMVDVlEk9n
	jBPPifj7cntybFYp54CVUIpLLYzb8Fn4dn7eedE9Cc0eV4h3wVuNGobijX+ssI9BfaZMtosfLrD
	i4mOoDJ9pzokKNZ9FAXzD+rw==
X-Google-Smtp-Source: AGHT+IH6OAVnyTKPBGyvXJCewyHrwDaRh2ZdRNAUiXZJqFKsDPNMI2SjiTwPdL53oi26rGrzQe/dbUc6nKixiFccVpM=
X-Received: by 2002:a17:90b:4a05:b0:2ff:4b7a:f0a4 with SMTP id
 98e67ed59e1d1-30aac1f82dbmr634458a91.3.1746569964608; Tue, 06 May 2025
 15:19:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410124526.GB9833@noisy.programming.kicks-ass.net>
 <20250410130944.GA9003@noisy.programming.kicks-ass.net> <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
 <20250410132649.GE9833@noisy.programming.kicks-ass.net> <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net> <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
 <CANiq72k0AM3v9JZe=8mDN6T1ToiAt1-1e1zJ3z0Oh6ZWfchzag@mail.gmail.com>
 <20250416202040.GD38216@noisy.programming.kicks-ass.net> <202504161442.66CE2596@keescook>
 <20250417081818.GJ38216@noisy.programming.kicks-ass.net> <CANiq72kjDM0cKALVy4POEzhfdT4nO7tqz0Pm7xM+3=_0+L1t=A@mail.gmail.com>
In-Reply-To: <CANiq72kjDM0cKALVy4POEzhfdT4nO7tqz0Pm7xM+3=_0+L1t=A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 May 2025 00:19:11 +0200
X-Gm-Features: ATxdqUGuoPWZ90y4coUWjP0w6j_-l1DRzzJ20zkE3IhO-pUDHeT4XIdswuIaWMk
Message-ID: <CANiq72muSS+NNs5fxp4GPKWWhyXT95spvbGsZz6AJnK8RerUqQ@mail.gmail.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	=?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Ramon de C Valle <rcvalle@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 8:40=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Thanks Peter (and Kees for clarifying) -- not sure how you/others
> prefer to route this patch or if you expect a v2, but I got the
> following (attached). I converted your Ack.

Applied to `rust-fixes` -- thanks everyone!

(If someone else prefers to carry it, please shout)

    [ Rust 1.88.0 (scheduled for 2025-06-26) should have this fixed [1],
      and thus we relaxed the condition with Rust >=3D 1.88.

      When `objtool` lands checking for this with e.g. [2], the plan is
      to ideally run that in upstream Rust's CI to prevent regressions
      early [3], since we do not control `core`'s source code.

      Alice tested the Rust PR backported to an older compiler.

      Peter would like that Rust provides a stable `core` which can be
      pulled into the kernel: "Relying on that much out of tree code is
      'unfortunate'".

        - Miguel ]

    [ Reduced splat. - Miguel ]

Cheers,
Miguel
