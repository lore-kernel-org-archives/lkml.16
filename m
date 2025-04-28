Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0861DA617
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824488; cv=none; b=EhXzkTUmbQNVOmq6Gan9nZO5tD9Bs6wlt/41WCMD2laWM7ffDmmN+kjN6GehLrr1kytAijUFAaO3mPGG4Gbn9/ScdfSU5LfJZDMz7rrl2mD2wsIB62k+0mbBZSixUQ1tX+LadeuEOyPoKGN91AkfMd+kRcDZ3JdwHvmDQZsb7MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824488; c=relaxed/simple;
	bh=HU7iY1werGlJ+QoJB51RFGwv+gbaO9ieC2TdEUyfC+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kfax7K1DYg8UIAP0Y5pHyJPMIIdNdyO4NwGv+tLSmrvHhI8G28nogdxIC59rc1Z55O3VsY6tmERAqWAJ5zVONdeuPrjXAn1bX4WkLT4R36gISZssGfL+pgk9zlGAJ7U7nVkF1mKNpZO5nD5X13LCUGUW1v+CvQjunF3nkUD3Aoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XHPzu1pa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHPzu1pa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74333C4CEEC;
	Mon, 28 Apr 2025 07:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745824487;
	bh=HU7iY1werGlJ+QoJB51RFGwv+gbaO9ieC2TdEUyfC+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XHPzu1paNX9zJyODrlzu6FElO4xhbEEZHYa20acxNqEtlqZF+nm4tKsTED6vEJvL8
	 yTvbrFIm2nCrPIIUVDcY6KSQapmLZfkO5RY1hpBE5A/4rh/d1OhBNxm+FCcxnddYtW
	 zrGxxT/iAqBcgX+g0nU6KKkNpaREP840N+xO2lkofe3/XyPCCkeUx1koDMsMSK9Hon
	 I+ZymKySOfDFK8DBZfF9HKimQmUDUIQAFmsb7vG+5xsR7XxsQ+gB1MdkoglzMR3GXW
	 3Qnrd6fTag/tIm9Obf/bxHu6QKnQUKfy65MVbupaRJc0jBWlC0zimT+7XGLduXjNH+
	 uaHdoy5OwgT+g==
Date: Mon, 28 Apr 2025 09:14:40 +0200
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
Message-ID: <aA8q4Ot-1zTzv_Kt@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org>
 <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
 <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com>
 <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com>
 <aA8oqKUaFU-0wb-D@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA8oqKUaFU-0wb-D@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> And once we remove 486, I think we can do the optimization below to 
> just assume the output doesn't get clobbered by BS*L in the 
> zero-case, right?
> 
> In the text size space it's a substantial optimization on x86-32 
> defconfig:
> 
>         text	   data	       bss	     dec	    hex	filename
>   16,577,728    7598826    1744896      25921450        18b87aa vmlinux.vanilla      # CMOV+BS*L
>   16,577,908	7598838	   1744896	25921642	18b886a	vmlinux.linus_patch  # if()+BS*L
>   16,573,568	7602922	   1744896	25921386	18b876a	vmlinux.noclobber    # BS*L

And BTW, *that* is a price that all of non-486 x86-32 was paying for 
486 support...

And, just out of intellectual curiosity, I also tried to measure the 
code generation price of the +1 standards-quirk in the fls()/ffs() 
interface as well:

         text	   data	       bss	     dec	    hex	filename
   16,577,728   7598826    1744896      25921450        18b87aa vmlinux.vanilla      # CMOV+BS*L
   16,577,908	7598838	   1744896	25921642	18b886a	vmlinux.linus_patch  # if()+BS*L
   16,573,568	7602922	   1744896	25921386	18b876a	vmlinux.noclobber    # BS*L
   ..........
   16,573,552	7602922	   1744896	25921370	18b875a	vmlinux.broken       # BROKEN: 0 baseline instead of 1

... and unless I messed up the patch, it seems to have a surprisingly 
low impact - maybe because the compiler can amortize its cost by 
adjusting all dependent code mostly at build time, so the +1 doesn't 
end up being generated most of the time?

Thanks,

	Ingo

===============================>

This broken patch is broken: it intentionally breaks the ffs()/fls() 
interface in an attempt to measure the code generation effects of 
interface details.

NOT-Signed-off-by: <anyone@anywhere.anytime>
---
 arch/x86/include/asm/bitops.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bitops.h
index e3e94a806656..21707696bafe 100644
--- a/arch/x86/include/asm/bitops.h
+++ b/arch/x86/include/asm/bitops.h
@@ -318,7 +318,7 @@ static __always_inline int variable_ffs(int x)
 	    : "=r" (r)
 	    : ASM_INPUT_RM (x), "0" (-1));
 
-	return r + 1;
+	return r;
 }
 
 /**
@@ -362,7 +362,7 @@ static __always_inline int fls(unsigned int x)
 	    : "=r" (r)
 	    : ASM_INPUT_RM (x), "0" (-1));
 
-	return r + 1;
+	return r;
 }
 
 /**
