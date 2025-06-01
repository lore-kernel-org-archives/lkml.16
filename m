Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8341A2DCBEC
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 01:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748739965; cv=none; b=oUjXLzlkmSEJVoscfX/x07Klc+3/+uQQAf3IrqlS7RA9vD4V4yx+uYWkMMASp2Wxi+4xxutGyD68txI2MjUxL+xQy57m1nQgeP4JCjuzAUo9FCVNEpq0lmzxRtI0yWBfwQ4AEFlDHbxCxRNYDXCgPmmKxRWuPhX+gaSAC3R1VuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748739965; c=relaxed/simple;
	bh=OCFFPpwfMjsBcthpFZsFQ8vXfWAgsY+sDr0ECvut/QA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Ava3qiTPzDMFg+2hlVKtUlH5GUBv3jzCGIAvyxt89vvUr4mKCzXwZ1EutYLJgITBRENlluVNCK+NXZhYuvVUuWkeU8kskr1xQHyzVaLnIuvZIPWw6WQGCsOmWMZBj5nbcRfje2u+vooL+YSpYPNOCHWSan5E9QQTYKHZRWUkw14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/vIDi2c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/vIDi2c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4C1C4CEE3;
	Sun,  1 Jun 2025 01:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748739964;
	bh=OCFFPpwfMjsBcthpFZsFQ8vXfWAgsY+sDr0ECvut/QA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=s/vIDi2cyiOxSlcrVgPO3fZMGd3WkV9TxH5Kt0yP/5vB15czNp8bWicKDzwgS4Yoz
	 ZmcidXh6/mkwPQzvq51rHsMMYFrel2YxiKQH4GMH2HsJSSe0MiYdRHLIEiFtN7ZC7Y
	 YEqax3uVaTVtfyak3GAImZGpyQ3ZRqX/nBypNkLUvkW1+0+rIvAjB13ra4xUMiIVXS
	 Xcf+QZMT9adIkH/OUOSQQZNegxSqCbbpuxOxjZZvc7eMBeVt6k50cYfgny5PtyJbCK
	 HKlNmqA8DMiocW4T1D+eCK7Q1QhGUP5gc4a3TRyxfqhWdKDEfcromtcOOjtZvNfV3j
	 XXktV5ej5m87A==
Date: Sat, 31 May 2025 18:06:00 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
 Ingo Saitz <ingo@hannover.ccc.de>, kernel test robot <oliver.sang@intel.com>,
 Marco Elver <elver@google.com>, Nathan Chancellor <nathan@kernel.org>,
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: Re: [GIT PULL] hardening fixes for v6.16-rc1
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
References: <202505310759.3A40AD051@keescook> <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
Message-ID: <156567EE-E5BB-43C4-B5A6-439D83FF387D@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On May 31, 2025 11:20:20 AM PDT, Linus Torvalds <torvalds@linux-foundation=
=2Eorg> wrote:
>On Sat, 31 May 2025 at 08:00, Kees Cook <kees@kernel=2Eorg> wrote:
>>
>> Please pull this small handful of hardening fixes for v6=2E16-rc1=2E
>
>WTF, Kees?
>
>You seem to have actively maliciously modified your tree completely=2E
>
>There are completely crazy commits in there that are entirely fake=2E
>
>You have this: f8b59a0f90a2 Merge tag 'driver-core-6=2E16-rc1' of
>git://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/driver-core/driver-core
>
>which *claims* to be from me, and committed by me, but is very much
>not=2E It's some garbage you have entirely made up=2E
>
>Yes, there is a real commit like that, but it's has the SHA1 ID of
>9d230d500b0e=2E
>
>And this isn't some kind of innocent rebasing mistake, because this
>actively lies about who committed it=2E
>
>This is completely unacceptable=2E
>
>I will now refuse to pull *anything* from you until you explain what
>the f&*^ you have been up to, because this looks like you have been
>doing actively bad things=2E

I have no idea=2E I had noticed a bunch of my trees were refusing to have =
sane merges=2E I kept trying to rebase them to sort it out, but it seems it=
 has not worked=2E This is all on top of an SSD that was getting mad at me =
and I had to replace it, but it threw errors during the copy=2E I thought e=
verything got recovered in my various worktrees, but clearly something is s=
till wrong=2E

>You need to nuke that tree, and come up with a good explanation for
>this kind of shit=2E

I'll throw it all out and rebuild from patches=2E

>I'm cc'ing Konstantin, because I really think these kinds of games are
>COMPLETELY UNACCEPTABLE, and this is not the kind of behavior we can
>have on kernel=2Eorg accounts=2E
>
>Konstantin - please disable Kees' account immediately until this is
>cleared up=2E Because this looks *malicious*=2E

Sorry! AFAICT it's all just from broken trees I tried to reconstruct (badl=
y it seems)=2E

Since I can't push to kernel=2Eorg, what shall I do for resending this PR =
after I've re-re-constructed everything?

-Kees


--=20
Kees Cook
