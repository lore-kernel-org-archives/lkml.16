Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA95277817
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530592; cv=none; b=UNswF/np4BSFzkgqkkZjKLK6R3nsZ4yvGfB0C6IEMPS16PqS9QIfGC0WLzdr8atlVS03kUfdeIpklkGNhxCLn3zloO2hQyhJgIcEtDJ7IX8ikzHPGQjklgBEGNndKtrgejWPMJUsK5OAW2jWmUtmceSRcPYf1OzRnWbYq5UK3so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530592; c=relaxed/simple;
	bh=az4dYZs3gVYsnvm6V0lUq0ENtKxG51OEc0gHDvBf3eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfjePxw00cV4fwEAxdeoZKCB8c6VpWYxVHgefjI+HGPz4yN30amxlvdPgf1h40KgldL2dJkhfln+XClxkdsHihly/S+hdnqfHCfoesUdk6LJEex0CEPZopMoIXm7PG7eEM3qSWi64Vu5MnD1sfIv1nS/oEvaZJvvL4r2RkIHUW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozIVVOGo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozIVVOGo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D395AC4CEE4;
	Tue,  6 May 2025 11:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746530591;
	bh=az4dYZs3gVYsnvm6V0lUq0ENtKxG51OEc0gHDvBf3eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozIVVOGoTBtZBXvgiyRaQ+SN4Wb6jvTQURoTF7NJylU9Y8eZ53M8/EvzfPinh2H+9
	 aqv9K4rTl4GF9OS2/D7VIkXm1dmxlSR6H04ge0M/vJx8FZLYYWZ6J1zANZj5QTdv1x
	 W0rjvwfWFc3/lKMnJHKZFLCXgwx98X9b2e8tsvaWU1v3KMJuy9phmNdc6zZUzDZqTY
	 R1KbYRizXX2woFodKABMSKDzbM/7O5hIzqyOEs0DBdVrBY8Xvy5pVuDYfI0MzWV8ts
	 GsAwY0dW3SBe5PujYoDBBq1YQBqpjTDMenTNPl9fjwQlml1s2n8FM4r9tdnHEZHwd7
	 LxKP8fqNDoIOA==
Date: Tue, 6 May 2025 13:23:06 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ivan Shapovalov <intelfx@intelfx.name>
Cc: linux-kernel@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH 12/15] x86/kconfig/64: Enable popular kernel debugging
 options in the defconfig
Message-ID: <aBnxGuJDCteDU70Y@gmail.com>
References: <20250505110946.1095363-1-mingo@kernel.org>
 <20250505110946.1095363-13-mingo@kernel.org>
 <9b1d18baf8d6839630073058a3b33c31d1b4649f.camel@intelfx.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b1d18baf8d6839630073058a3b33c31d1b4649f.camel@intelfx.name>


* Ivan Shapovalov <intelfx@intelfx.name> wrote:

> On 2025-05-05 at 13:09 +0200, Ingo Molnar wrote:
> > 
> >  - CONFIG_DEBUG_LIST=y:
> > 
> >      Fedora/RHEL have it enabled, while Ubuntu has it disabled.
> 
> (Please forgive my potential ignorance.)
> 
> If I'm guessing right, the point of CONFIG_DEBUG_LIST being enabled
> everywhere is probably more about hardening than debugging, and given
> that since 6.6 we have a CONFIG_LIST_HARDENED[1], wouldn't it make more
> sense to use that instead?

Yeah, I agree, and I've just changed it to CONFIG_LIST_HARDENED=y, 
which I agree is the more sensible default.

> Or is the point here to exactly follow the typical distro config,
> without regard to whether it's actually the optimal thing to do?
> 
> [1]: https://lore.kernel.org/all/20230811151847.1594958-3-elver@google.com/

So Ubuntu doesn't have it:

  /boot/config-6.11.0-25-generic:# CONFIG_LIST_HARDENED is not set

While Fedora has it:

  .config.fedora.generic:CONFIG_LIST_HARDENED=y

in which case it's basically a judgement call whether to do it in the 
defconfig. I agree that DEBUG_LIST=y is pretty heavy-handed, 
LIST_HARDENED=y looks better to me.

But when all major distros have an option enabled then I think in most 
cases the right policy is to enable it in our defconfig as well, 
because the option has become ubiquitous and we'd be denying reality by 
not having it in our regular tests.

Thanks,

	Ingo
