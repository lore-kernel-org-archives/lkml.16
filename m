Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1FA1E0DFE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744234048; cv=none; b=sn25qffamQ8X+ZCBnKUI9PTRfC74kJ1EQyjH4UZ3b9E6mlTCSsXkHttThQvbU86e3HyqDeYgnvM5NvpKpvg1kSpHoLq2xCzTEoXnLLpimhauty9YqOOKKQ7a/5ZHJB1TGgOvLfz9/CYUufk/yZ4T/iwsgfsDvfxCYjGgWqj+OTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744234048; c=relaxed/simple;
	bh=L+B0i46XfrjvvVcFUV3K7XjgDdW6nSMWuvpEBrhptnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pY0EHnItzQRi09OA/RiDl50pgooP9Nklk70nhdzguAO48HvVRJ0vPFHQ3orMYyQAFKSRrIkTPLgmjuGBH4cHk9qWzG8y11IvH8arEjjRld/eIdlmPYUBn0iGL0nKj5BLZgxmwi6TMuk+f40c52g7+JD4/v+s7mrgr1YD5Yu3ro8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4KCIWFz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4KCIWFz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F07C4CEE2;
	Wed,  9 Apr 2025 21:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744234048;
	bh=L+B0i46XfrjvvVcFUV3K7XjgDdW6nSMWuvpEBrhptnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I4KCIWFzYV4xwXNaUC4FkCbCRxFfkpzVxjE/+gWLEVGNv4vESyDJkhD2Vg+Yrzv56
	 tqAFB7jQ+57esNyC66SXbuZA94P+i91FECY7iymsYGzFtIT2egcONQqMyxV+LCsQbh
	 cnteujNB9rSRZs5JH+iHtNuP6GTGopLPOK8kOQ+g9D/GGpQU6xNysnQkDH6MTlYA5X
	 mrx1n5RrHuuSufWEGGxiCi+10xwhadUkP0VFVGajQ1S4I7b6dYn7jg0K5E7AXPrY22
	 /HRYbENOttigyIll6gkVBhwBaUFHHOpZwdb193InGjl2N1AMY4ccYJAyzjVQaqFQbd
	 Cu+D+ODXEBKlw==
Date: Wed, 9 Apr 2025 14:27:25 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH RFC 4/5] x86/alternative: Improve code generation
 readability
Message-ID: <lk33e6ldcyilu6bejru63wzfkfyqt7czvhjotvqlhnp34qnw4n@kt6wt4lwfu7q>
References: <cover.1744098446.git.jpoimboe@kernel.org>
 <35ae5c17e8cc88506b5ae8f3b06d9491f7ef319c.1744098446.git.jpoimboe@kernel.org>
 <20250409143821.GE9833@noisy.programming.kicks-ass.net>
 <4q77jakv67gmglrcbzojngyutbfi3pzgsjayrymkg7dhkxo4hl@mczk3gots764>
 <CAHk-=whAtuMohKpzrzt0HFLP0RdU=KB-_4fu25gG6O4R=+PXvg@mail.gmail.com>
 <qik3dltarxj5trsbgzoifhf545nss4vwnabhql7i2b7qiowq52@y3d5pirwd4ni>
 <CAHk-=wiL8J8v3+XKJGM4Ro83UqJTh7q0GD9UUYrDnwx24jR83A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wiL8J8v3+XKJGM4Ro83UqJTh7q0GD9UUYrDnwx24jR83A@mail.gmail.com>

On Wed, Apr 09, 2025 at 02:20:55PM -0700, Linus Torvalds wrote:
> On Wed, 9 Apr 2025 at 12:51, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > What if we were to use a global asm() to define an alternative .macro
> > whenever "alternative.h" gets included?
> 
> Yeah, I wouldn't mind that, but I have this dim memory of us having
> tried it at some point and it didn't work.
> 
> I think the issue was that the in-compiler assembler was not as
> complete as the external one (ie not doing macros at all or something
> like that).

It seems to work with GCC 14 and Clang 18 at least.  I can try to find
some old toolchains to test with.

-- 
Josh
