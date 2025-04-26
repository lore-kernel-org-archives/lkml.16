Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A141A4414;
	Sat, 26 Apr 2025 23:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745709830; cv=none; b=jUkKjYEE6KwuAe2V1PpnuqxU6EBF3UIPu3gtQIG7w6k/BETA3FL/7mAzxvPGAEz8BndW6sWb8raruWCfE9H6QmyPCrlOcpRlI1M6iEAmu/wz91yXIdls76YX2uIe3KpKn8ERzmDCLycPJMCns0CHTm2bXBGHN6JS0fidiBGZnYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745709830; c=relaxed/simple;
	bh=0EzI2PsxZX+NCSTOzZTgOkGoOnmSI6hi1Q7oSC2m2BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcAsmrvtZ9gqmwo8q8nHwMQ/Onp/D8c1sTMiWg8xUMqyWSqMD+4nj3dPoyKXpU4Qdo04iKyitzP1YWB6dotGSmd8a4t02MIpBt5cMDKeqG3Dx84IiE/9sS1AgrR7/NYSfstjbn5/lPv3wjugKwNpWF6K0bqoPhZ1c/k+VafW0Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzlmzQaD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzlmzQaD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D811C4CEE2;
	Sat, 26 Apr 2025 23:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745709830;
	bh=0EzI2PsxZX+NCSTOzZTgOkGoOnmSI6hi1Q7oSC2m2BQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gzlmzQaDWmCVVuyKJBFhgxPi/QyNZdzcHOnM46pg2w02j6agoQMEnDNw3Ya0pJwmw
	 Pl1Pa+4rqDzYTc5FgsmIX2EvVdz+N2eIEVF1HjwMU4mVG0uFV88ZQ5SmMZmfQaVlj3
	 g63YgGX2D6DHZRwcxbCrAeGV2zFgcRX91jLYQCskCVaF3pETvU1smL51mHIInrOU2T
	 B3KlsL78r0+gAcziSyL1C2TVkfCY9oMshyTk/W0evOD72s0ZyvMJspIHHxzOgICLA0
	 3l8bVkPivxNLmNmaX++FLv8b+oMAqLKbYNTAV4EkdjX4oVnbD8dZiLZUe1PhurQRq8
	 asV0DSpMgJkrg==
Date: Sat, 26 Apr 2025 19:23:44 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	the arch/x86 maintainers <x86@kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	llvm@lists.linux.dev
Subject: Re: clang and drm issue: objtool warnings from clang build
Message-ID: <20250426232344.GA1395819@ax162>
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162>
 <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>

On Sat, Apr 26, 2025 at 01:56:59PM -0700, Linus Torvalds wrote:
> IOW, there's a *big* difference between "the programmer told me this
> is unreachable, so I won't generate code past this point" and "I have
> decided this is undefined behavior, so now I won't generate code past
> this point".
> 
> So what I'm asking for is absolutely not "trap on unreachable". That's
> wrong and just plain stupid.
> 
> I'm asking for "trap on UD instead of *assuming* it's unreachable".
> 
> Because clearly that code *can* be reached, it's just doing something undefined.
> 
> See? Big big difference.

Ah yes, that is a big yet subtle difference that I had not considered,
my bad for missing that. I was only thinking about the implicitly
inserted __builtin_unreachable() from potential UB, not the explicitly
added ones from the developers.

I suspect that it would not be easy to split that distinction in LLVM
but since I am not a compiler person, I will see if this has come up
before and talk to people otherwise. I know there has been work in LLVM
to try and stop undefined behavior from destroying control flow with
things like the freeze instruction but I am not sure that would help us
in this situation. Pardon my ignorance though, isn't something like this
basically just '-fsanitize=undefined -fsanitize-trap=all'?

Cheers,
Nathan
