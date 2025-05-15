Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E082980AE
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747306212; cv=none; b=rKEmjsLSoehLq3ixf4O7awMVd3QCKMi3BCGZ11pOVJaYyf9TfZDGyfLUcAMjuVodjiA0y9Rupy5/0FvjXcQMrW8KyuBBkfD89UIn2Gzwp8Aqb6uEiju8ufbmElAaRFtGZXMdvAzOD8GjZ+tMHK6V47zmbDEuABkSnJhxFutmQLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747306212; c=relaxed/simple;
	bh=+IEuG948LXrMZMS5OGNBPOGxqd54s2Puls6YfPlNeVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K45u+UxINo3TF2aqRe+RA+c82MwAEdATT9+SYZGuLqHwLM7RqkJoS/desBmWxj6zhHTsVLkHAmyfmEtJogd0J2+p2O+JngDeItt9COC7SqNf/GhNv5tobuoqC5Cs5d7CJIZQ4Q4uTxTV9o+zI4mN26dAyXmqcmwYQkf7BxHUUMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=twQ5YpDO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="twQ5YpDO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E011C4CEE7;
	Thu, 15 May 2025 10:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747306211;
	bh=+IEuG948LXrMZMS5OGNBPOGxqd54s2Puls6YfPlNeVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=twQ5YpDOJFzAVHXlp2V2orlFbGTYwXT5xp7GAc9XnYAmwQceib6jxQbYq2k8UCAYW
	 a46QokaiLAK1ynq85b8nI0juQC9OTOj8lhC+whUucgcCKt6AP3rreaC3r+0lOB/vod
	 f8+lW/cAGp+C3QmZcsfUeFyFhmdftNst+gloZxivKsQDm21r13xW5fC+x7YQwDQQXg
	 5j2puOfSfYOGchzmn8NnfKRU/nZQhzWHNL3trSv2rOeM2IuSjv7nip5psz0C9WLEHZ
	 gQTOUEvX781Osjb7HYjeNE/XmjZ4x/on3nA0P6WLJzpyZUChQAwSZI15kivj2hNI6y
	 qnCLm8WApkMIw==
Date: Thu, 15 May 2025 12:50:05 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>, "H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 07/29] x86/boot/e820: Print out sizes of E820 memory
 ranges
Message-ID: <aCXG3XwU4cmlmcM3@gmail.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-8-mingo@kernel.org>
 <aAc5Wlwj4gaBApIy@surfacebook.localdomain>
 <aCXFdvWiNW94F24R@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCXFdvWiNW94F24R@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> > > +	}
> > > +	if (size < SZ_1G) {
> > 
> > Can be written in one line as
> > 
> > 	} else if (...) {
> 
> Done. (See delta patch below.)

Actually, I take this back, as there's a return in the branch above:

                        pr_cont(" %4llu   MB", size/SZ_1M);
                return;
        }
        if (size < SZ_1T) {

Which makes the plain 'if' more readable: the previous 'if' branches 
off entirely and control flow never gets back, so mix the blocks with 
'else if' looks a bit weird.

Thanks,

	Ingo
