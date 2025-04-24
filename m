Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1E917A314
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745518613; cv=none; b=sTxqD7l2Cn3kVlNAjCASOpmTsZZ2KUk2jUsxW75Fc3FGNjH2M5gvHfSOIGJq/lT/Tgjc3rCuYkAm/FKA5prXAHcelJz+SNSkZ8a/dtoSvh/PyGAwOvUjQo9ADvtsApD2V7QrzemNwj4RZGjQVmSkyBvxjqrsY9r+WN2reOLMuN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745518613; c=relaxed/simple;
	bh=nO9oDbUN0pVhI9Ph/BWwbpzy+8+xtBEG217PX7K48is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KO6uCqCS6wcZFy7NKOVleKsqyDTOodLYmY9ZomXIHUtVdhgFAHBoXu+wwZqxxaoar0FvrdHMTk/ERXXH+d3A0XOEo+IBXdL4wT1nDW+n8c53VN/rQ+lLPbxnTV+OVpFk/Fxxbx61KogBsOqkzOBYjwQNDSZ9PEuQ0NtZMdZX7Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5tlIiki; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5tlIiki"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAEF9C4CEE3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745518613;
	bh=nO9oDbUN0pVhI9Ph/BWwbpzy+8+xtBEG217PX7K48is=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t5tlIikiJYpDYjX8QimvoL7mtLIyw4l4GPMsYARwrLyICt8WOcl5cMHR/cVQwnZXx
	 t3h8cSuwYE6RhkTWW4YFTSa1F27o5DFjPaS41aW0iuqBsbD0dlnDoZM+N/z+Ico9pa
	 3jGmZqj9PMHBqwwEtq+WCChBk5nlen5eeU8bs3mi6aOgNddJbDr4EsLH+gK4fV/Bdh
	 e/RhbfvWTP1owVRBxoepOHOgysV1TEwu0GApvJ0V75oj6aTu9WP5hWAgBkhhw2Mv04
	 jJVzjofgbwrhV4rY0rK+JCuZqNvcJ+Pgm5WIic4CS0i1jetILMGIgfqgUM2GrToW3x
	 whtgpRoCrmH/Q==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so1459671e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:16:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGNrjjLxC2OMBECerKBKJtTjf61TGnfBn9tegTS44mw9IkVmi7gHBH8tJQKU750RFGYgfp0La77q5oup8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ/8bPBVlI+p0gSYrZtbqxVFfFL7HHFMOqxSo3jukO2iGzdUZU
	c6OxYYqMaAn4KVxVOc5A+2UfEFhIGwDxQQ/zxTvjeDb92vU/GnbXzGd5rNXK2HRuRq6CzkVfbeY
	aD2LupyKtVY7xlHrGRHFSsd8GSaA=
X-Google-Smtp-Source: AGHT+IEGk1YSO028lcgtWwNMa9C4cSXeOtMO5Qsg35m7q1XC6uXTW7FYvg4W77icgi44fs/zKsXpq5V5fGDCvNgDUuI=
X-Received: by 2002:a2e:bc94:0:b0:310:85ba:115f with SMTP id
 38308e7fff4ca-318a92908a2mr2737331fa.33.1745518611329; Thu, 24 Apr 2025
 11:16:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423110948.1103030-13-ardb+git@google.com> <aAp-SThmX5PcsrWU@gmail.com>
In-Reply-To: <aAp-SThmX5PcsrWU@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 24 Apr 2025 20:16:39 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFswd1Au-tyHuYtCVon_02OJixGLf8X-=k9y7jajoEHUw@mail.gmail.com>
X-Gm-Features: ATxdqUGklj5LUWPDXEqCs2yB2UfYNNrPKsLftO37iwDO0w21MUbOfqXY6mGzOSk
Message-ID: <CAMj1kXFswd1Au-tyHuYtCVon_02OJixGLf8X-=k9y7jajoEHUw@mail.gmail.com>
Subject: Re: [RFC PATCH PoC 00/11] x86: strict separation of startup code
To: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 20:09, Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Ard Biesheuvel <ardb+git@google.com> wrote:
>
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > This is a proof-of-concept series that implements a strict separation
> > between startup code and ordinary code, where startup code is built in a
> > way that tolerates being invoked from the initial 1:1 mapping of memory.
> >
> > The current approach of emitting this code into .head.text and checking
> > for absolute relocations in that section is not 100% safe, and produces
> > diagnostics that are sometimes difficult to interpret.
> >
> > Instead, rely on symbol prefixes, similar to how this is implemented for
> > the EFI stub and for the startup code in the arm64 port. This ensures
> > that startup code can only call other startup code, unless a special
> > symbol alias is emitted that exposes a non-startup routine to the
> > startup code.
>
> So when startup code accidentally references non-startup symbols
> outside the __pi namespace, we get a build/link error, right?
>

Yes.

> > This is somewhat intrusive, as there are many data objects that are
> > referenced both by startup code and by ordinary code, and an alias
> > needs to be emitted for each of those.
>
> Yeah, but this should make it ultimately safe(r): every object is
> either local to the startup code, or has been 'exported' intentionally
> to the startup code.
>

Indeed.

> > This ultimately allows the .head.text section to be dropped entirely,
> > as it no longer has a special significance. Instead, code that only
> > executes at boot is emitted into .init.text as it should.
> >
> > This series is presented for discussion only - defconfig should build
> > and run correctly, but allmodconfig will likely need the last patch
> > omitted.
>
> No fundamental objections from me.
>

Good to know - thanks.
