Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D823E1C5D46;
	Mon, 28 Apr 2025 19:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745870045; cv=none; b=dpeniTnfvh9OhiCt94A6AMSlXzZG5PRu6ZGVw+vk8ijnUZNl1tSWl+ghE9GyiWhp0wZAmhSzefhOG4qG25dvarolUuCT4SYAtQyQ+f+IYbcstdqxZuzv3wbEuXmV5v839Z6JE7STajS5IismHr7xLMI1czM9eja8BIn0AHSkU1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745870045; c=relaxed/simple;
	bh=6JkWTiyBuD4FuO3Hff8q2laI10ryTLbOINF7R3/RJdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQWfHo0ehjr4FPJVKTEdJJsGSV6O2B9/PCfusmt0EqRQCzbd3xZFunAT6PP1bKhJxE9xLAKS3v1s2dANJT+mtfA6Gqf4EBJmct+iZ/ep2gTrpxQNo9olhoyLYstXn8GLALCx0ofSWCdl/7NMSAyLmlrmDHnaGlzskXqOyedDdIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4U4wEmC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4U4wEmC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8799DC4CEE4;
	Mon, 28 Apr 2025 19:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745870045;
	bh=6JkWTiyBuD4FuO3Hff8q2laI10ryTLbOINF7R3/RJdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R4U4wEmCxeGgaraJ6WbFWYsUNEsCN5ZB7pFL2aq6terjMCCgqYEv3Ihm/4GPrNHuD
	 +7ch2BSj2Edv8I3znl3WeAYSGJVHZZ8KLusRCPMN6ygreeYvLu9YrXT/Fq5ASZOX5S
	 4fCoLfFSrjPXsApm+/OC33fYCvskX3sy5U2TygIWfNjNzKVwB3TRT3p+g94GHzwRe9
	 xdvUVMtcy0t+AxCUryRwnp74c1JAylsWkkIX2CCjRs60nBRWkgRIbmsmWXychgeXNN
	 f9Zn8qUtrazmPM0eVF/m6lhD0RxocX5zPjDgh6Iiej1j0rfwVO179a9cwmBM6qaPmP
	 FEim9H8DOOPGg==
Date: Mon, 28 Apr 2025 12:54:02 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Justin Stitt <justinstitt@google.com>, the arch/x86 maintainers <x86@kernel.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Subject: Re: clang and drm issue: objtool warnings from clang build
Message-ID: <zizdtmyqqprnlgy2rzvvmqzhganxpuxqqkudhwakianlapl6zp@zucf2xtoabez>
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162>
 <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
 <20250426232344.GA1395819@ax162>
 <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
 <CAGG=3QUk8-Ak7YKnRziO4=0z=1C_7+4jF+6ZeDQ9yF+kuTOHOQ@mail.gmail.com>
 <CAHk-=wgrT9++rFTnM1vh3bwx2Pcc18anDGQCwEL+0d2nDm3p+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wgrT9++rFTnM1vh3bwx2Pcc18anDGQCwEL+0d2nDm3p+A@mail.gmail.com>

On Mon, Apr 28, 2025 at 12:34:27PM -0700, Linus Torvalds wrote:
> Honestly, the least wrong thing is to just NOT HAVE THE CHECK FOR ZERO AT ALL.
> 
> IOW, just generate the divide instruction.
> 
> I can almost guarantee that that will actually then generate the best
> code too, because you'll probably just end up sharing the divide
> instruction will all the *normal* cases.
> 
> So the best model is to literally remove that pointless and stupid "is
> this a divide by zero" code. It's pointless and stupid because it
> literally just makes for more work both for the compiler AND it
> generates worse code.

BTW, I've noticed Clang also generates UB for negative shift values.  I
assume we'd want it to stop checking for those as well.

-- 
Josh
