Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D02211A33;
	Mon,  7 Apr 2025 19:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744053942; cv=none; b=E40YkPY5PXzYAcOlywaio8DMTc0QaZwzznVlHhPaillWTUZunPjjLrckqOxO3ueVBwmu5hbOLoeEExIDK3hklhwF5nkZZkGxn5Nfts4EKj4WxsXZqdxPI2rJ757gcSp/ndO2tEXj2RYXq3XAeVZcSnOIeEXoMerClg4kP522ghY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744053942; c=relaxed/simple;
	bh=H3owC1whrKb5S/aPGKDUvcnbX+ziVBy77gaPeStv/28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbKllm5xiCVHVbzUBE6EzJX6T4UeBOB9ErpBVm8KqMngVzqIwBOGherI3FxYgjdhNX/l/LTpYdoY4uL54BWPz2HqA8cRJZaOxi4rZYThf1tGo0XeCrnTLdz8ao+PGv3wJyyvPNHxGiRBsZDZl37PN1KB+/WIcE56Ml2VzS96VwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y768k/EC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y768k/EC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0048BC4CEDD;
	Mon,  7 Apr 2025 19:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744053942;
	bh=H3owC1whrKb5S/aPGKDUvcnbX+ziVBy77gaPeStv/28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y768k/ECp1+3x8hKqM6K/wcX/RWu/fgweR+EJrt4Q9faTILw2P0EZxVVjRCk7bwkn
	 rnYMLfUjTwfeUQVpMa2zy2JyZavUj2wI4iTzW0C4EDcPXCfSL94XD/9h5mLNDJOjcw
	 H4Yqt9BaykSh0HEZYlPYTleQJ2EQh25TU6iSJdQgXLfKg0t0Bx/3i1cnrZ7GJj5NVI
	 viToO+HYuV8p18x8Bhi/WOeUGqq2lxZL7NGJHnkl9PDeE4IFXxfsnmUFkYKdhEQWAr
	 sReju9pdN8JVMv4kjFTiTOT6YVNiRF6pA/1CEOMd1nznQARQNaTq/gkVM8jK3sf+u6
	 VG3k8q30kVn4w==
Date: Mon, 7 Apr 2025 12:25:37 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Peter Collingbourne <pcc@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Will Deacon <will@kernel.org>, llvm@lists.linux.dev
Subject: Re: [GIT PULL] string fixes for v6.15-rc1
Message-ID: <20250407192537.GA518371@ax162>
References: <202504061053.F27227CA@keescook>
 <CAHk-=whVfxi4KRu-H=tsgSdoGdDz1bvu0_miJT0BTgAf4igpdg@mail.gmail.com>
 <FFE5FB0B-CC92-4A25-8014-E7548AD1C469@kernel.org>
 <CAHk-=wijG2dSOOFr8CCYygwxZQxdTUj73rfB8=tyZP-3G-8-og@mail.gmail.com>
 <20250407173741.GA3847400@ax162>
 <CAHk-=wi89ogViEN5oTBmcNQXnMEB5_Qse9G401pSNzocP_dqQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi89ogViEN5oTBmcNQXnMEB5_Qse9G401pSNzocP_dqQQ@mail.gmail.com>

On Mon, Apr 07, 2025 at 12:02:04PM -0700, Linus Torvalds wrote:
> On Mon, 7 Apr 2025 at 10:37, Nathan Chancellor <nathan@kernel.org> wrote:
> > +# Ensure clang does not transform certain loops into calls to wcslen() after
> > +# https://github.com/llvm/llvm-project/commit/9694844d7e36fd5e01011ab56b64f27b867aa72d
> > +KBUILD_CFLAGS-$(call clang-min-version, 210000) += -fno-builtin-wcslen
> 
> I think you could just use
> 
>      KBUILD_CFLAGS += $(call cc-option, -fno-builtin-wcslen)
> 
> instead, and not use some version check?

Sure, I just figured this has not been a problem up until this point so
applying it for older versions of clang should not be necessary (since
the optimization that introduces it does not exist) but also not be
harmful. However, I would rather not call out to the compiler since we
know it is supported with all versions of clang (and GCC but it
obviously does not need it) so maybe just

    KBUILD_CFLAGS-$(CONFIG_CC_IS_CLANG) += -fno-builtin-wcslen

or

    ifdef CONFIG_CC_IS_CLANG
    KBUILD_CFLAGS += -fno-builtin-wcslen
    endif

or if you do want this for GCC too, unconditionally adding it should be
fine too.

    KBUILD_CFLAGS += -fno-builtin-wcslen

No strong opinion, let me know your preference and I will make it so.

Cheers,
Nathan
