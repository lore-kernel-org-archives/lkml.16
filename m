Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E13F191F94
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745823921; cv=none; b=fmf+J6+jzEzTgaW/7FOdNypch0mr0JZmVQJsfUbWyN7U5/9JwMagm/sQIrHdvdh4lT6vTlGgycRqKiqm08CgQkyk9TBaXRKwM5uAordyoDVQgKrFPKhcVPlyv3HCXLDxoPbyjMOutXJh0ccEhm/rb0VDVzgKJma+/HqmJU69qiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745823921; c=relaxed/simple;
	bh=ZR+51/a7SRTRGqwOHXRQQygxFCEZLSQcgVb51P3cI3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vpt4UhZelNy3WeVbiqW62Vr64+2bLwrOXJP0Zim3zb+K6pbltlvYYh1W05XqUGpMAd9EsV9/eVn50k2QGG4B5es8nYvCInAdi5ol9JjUoMEWLTbpESiO/uYV2Uf6dAy00k7uHZGe6+FVIlz37crFjDXnLN4CssVKBYAElVC0jjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nn0CTW7m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nn0CTW7m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4868C4CEE4;
	Mon, 28 Apr 2025 07:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745823918;
	bh=ZR+51/a7SRTRGqwOHXRQQygxFCEZLSQcgVb51P3cI3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nn0CTW7mOuzrRxZANBCgZkQkHaRHLYrAdgAGn4DoDQIEzUJHMPgLbHjEoQ1u2gQa1
	 n0U1Gxbc4LOxpyQAlH2jGTbGvxi0D4T0bL9J4Alg+olwo6qCF6V3sv54uhNBGBXjQQ
	 8XJz69xiKZXFXNoyY52aCXZG/JPfpkMf0omtbRGxtjCUupqdLiCyrLwjR3e3Mp2VhN
	 Og5dbJzOwOo3hf3jDCmUUzo/FUMiLeNcfEv9ieVnwEdBWO28S2stAC54fxJSx5bYbT
	 odBHjud3aYX7F7kVQ2PYr6Wc6dNXzBHyxAkOpqNroqGgexyuhEsTKmKzmSI36hCL+l
	 7qw7NoFQPZBLA==
Date: Mon, 28 Apr 2025 09:05:12 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case
 handling to C
Message-ID: <aA8oqKUaFU-0wb-D@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org>
 <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
 <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com>
 <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA8nF0moBYOIgC5J@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> > UNTESTED patch applied in case somebody wants to play with this. It
> > removes 10 lines of silly code, and along with them that 'cmov' use.
> > 
> > Anybody?
> 
> Makes sense - it seems to boot here, but I only did some very light 
> testing.
> 
> There's a minor text size increase on x86-32 defconfig, GCC 14.2.0:
> 
>       text       data        bss         dec        hex    filename
>   16577728    7598826    1744896    25921450    18b87aa    vmlinux.before
>   16577908    7598838    1744896    25921642    18b886a    vmlinux.after
> 
> bloatometer output:
> 
>   add/remove: 2/1 grow/shrink: 201/189 up/down: 5681/-3486 (2195)

And once we remove 486, I think we can do the optimization below to 
just assume the output doesn't get clobbered by BS*L in the zero-case, 
right?

In the text size space it's a substantial optimization on x86-32 
defconfig:

        text	   data	       bss	     dec	    hex	filename
  16,577,728    7598826    1744896      25921450        18b87aa vmlinux.vanilla      # CMOV+BS*L
  16,577,908	7598838	   1744896	25921642	18b886a	vmlinux.linus_patch  # if()+BS*L
  16,573,568	7602922	   1744896	25921386	18b876a	vmlinux.noclobber    # BS*L

Thanks,

	Ingo

---
 arch/x86/include/asm/bitops.h | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bitops.h
index 6061c87f14ac..e3e94a806656 100644
--- a/arch/x86/include/asm/bitops.h
+++ b/arch/x86/include/asm/bitops.h
@@ -308,24 +308,16 @@ static __always_inline int variable_ffs(int x)
 {
 	int r;
 
-#ifdef CONFIG_X86_64
 	/*
 	 * AMD64 says BSFL won't clobber the dest reg if x==0; Intel64 says the
 	 * dest reg is undefined if x==0, but their CPU architect says its
 	 * value is written to set it to the same as before, except that the
 	 * top 32 bits will be cleared.
-	 *
-	 * We cannot do this on 32 bits because at the very least some
-	 * 486 CPUs did not behave this way.
 	 */
 	asm("bsfl %1,%0"
 	    : "=r" (r)
 	    : ASM_INPUT_RM (x), "0" (-1));
-#else
-	if (!x)
-		return 0;
-	asm("bsfl %1,%0" : "=r" (r) : "rm" (x));
-#endif
+
 	return r + 1;
 }
 
@@ -360,24 +352,16 @@ static __always_inline int fls(unsigned int x)
 	if (__builtin_constant_p(x))
 		return x ? 32 - __builtin_clz(x) : 0;
 
-#ifdef CONFIG_X86_64
 	/*
 	 * AMD64 says BSRL won't clobber the dest reg if x==0; Intel64 says the
 	 * dest reg is undefined if x==0, but their CPU architect says its
 	 * value is written to set it to the same as before, except that the
 	 * top 32 bits will be cleared.
-	 *
-	 * We cannot do this on 32 bits because at the very least some
-	 * 486 CPUs did not behave this way.
 	 */
 	asm("bsrl %1,%0"
 	    : "=r" (r)
 	    : ASM_INPUT_RM (x), "0" (-1));
-#else
-	if (!x)
-		return 0;
-	asm("bsrl %1,%0" : "=r" (r) : "rm" (x));
-#endif
+
 	return r + 1;
 }
 

