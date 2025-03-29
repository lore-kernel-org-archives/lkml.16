Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E2D1C36
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 00:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743209768; cv=none; b=iL7zXgN3M3OGdqOp/+U7p5xtPLpvHydyZpgcYeXhsa74qjPZc9B0fu/8GHRkFwCJxZgeZ2mxZzNO/z494ug2H4evTEHst7kJ4fcq6op2rhFQ8KDneIf/Ips2hWdL5yTTw9FE1bQAzhCxUvkR+KE5gXnP4vfeMJwuS9H+T40x/9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743209768; c=relaxed/simple;
	bh=SRLVOvX1rqJPa0rdDK4NGHG/oUL3idrdNaek12/nQE8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I/PU11q2+hZo8SLv+BQfMi1iqNe8kgzuoppX9ymP2BeYdMGHtSNGjJ8OIgf8rDx2UhQFKb0d3bR69lrhxbs/S6jTWPi1O8l17BADSYEwOLNfg+ZIY25CCuIJX9dNWbnHINljR/O26xPWR+Ej7kDSBPJi6eWp6NvkCA1F3vJBeKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6HSW08O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6HSW08O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E7DC4CEE4;
	Sat, 29 Mar 2025 00:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743209767;
	bh=SRLVOvX1rqJPa0rdDK4NGHG/oUL3idrdNaek12/nQE8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T6HSW08Os7vTdT43pZly/eISmFsCqq4CcrPRdi8X+F56bsL94Wkwn9PTxjmdHzqqh
	 hK2VrC6hUmvufewjES0Z6Qb530SR7D38DPREtkhYdYNUhj6JDh+yzWhLjC01jYKg6e
	 ma4o9lj9DWGb8qbYZUr8Ly0QxiOta8SQv+ogXO5FGGgQAMAdKFwgd5XBiaGWO7KIQK
	 vnfdrJLoM9+zjGoE5Y/7d6fmSeKSt+9uO+BJnZ2U4tB1pJwX0mlADoK7xFndgCig0Y
	 mrjY8qe6NcJ1+eUQSUmEquqEgjETsPCGNG0yvgeDsuHSDnzIXIfN7fdYKYn+VNa8BP
	 l6owi2cSg0QtQ==
Date: Fri, 28 Mar 2025 17:56:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, "H. Peter Anvin (Intel)"
 <hpa@zytor.com>, Michael Kelley <mhklinux@outlook.com>, "Xin Li (Intel)"
 <xin@zytor.com>, "Borislav Petkov (AMD)" <bp@alien8.de>, Ingo Molnar
 <mingo@kernel.org>, Nikolay Borisov <nik.borisov@suse.com>,
 "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [tip: x86/core] x86/cpufeatures: Generate the
 <asm/cpufeaturemasks.h> header based on build config
Message-ID: <20250328175606.5c7cc096@kernel.org>
In-Reply-To: <CAHk-=wi8h2fNpPBYakOMGhCk=pBSAQoLv=YG4KiTy45SZSQe7w@mail.gmail.com>
References: <20250305184725.3341760-3-xin@zytor.com>
	<174238223959.14745.6970497940010271580.tip-bot2@tip-bot2>
	<SN6PR02MB415756D1829740F6E8AC11D1D4D82@SN6PR02MB4157.namprd02.prod.outlook.com>
	<CAHk-=whChrRQ0kuRuZo2+9D+J2BO9Q=1CV2eEk_yjrNi8kdjBg@mail.gmail.com>
	<SN6PR02MB4157D2C2260E6BD529BCF08AD4A52@SN6PR02MB4157.namprd02.prod.outlook.com>
	<20250328162311.08134fa6@kernel.org>
	<CAHk-=wjn1m+j1NYN6CKXvozOp-mmhXNFJLCub7Tr9JEz6Su5Lw@mail.gmail.com>
	<CAHk-=wi8h2fNpPBYakOMGhCk=pBSAQoLv=YG4KiTy45SZSQe7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Mar 2025 17:22:03 -0700 Linus Torvalds wrote:
> > So I think the real fix is something like this ENTIRELY UNTESTED
> > patch.  Whitespace-damaged again to make sure people don't apply this
> > mindlessly, it needs more thought:  
> 
> .. and that ended up being even more whitespace-damaged than I meant
> to make it, because it also line-wrapped.
> 
> Oh well. Not pretty, but I hope people still get the idea.
> 
> And I just actually tried doing a build after touching the .config
> file, and it did seem to work.

Excellent, can confirm that it works for me, too!

Thanks!!

> But since I had _also_ messed with the config file on purpose earlier,
> I'm not sure I'm actually testing the thing the networking builds
> trigger. So I might be entirely missing something.

FWIW the exact commands our build script uses are:

make W=1 LLVM=1 O=build_allmodconfig_cl -j 6 allmodconfig
./scripts/config --file build_allmodconfig_cl/.config -d werror -d kvm_werror -d drm_werror
make W=1 LLVM=1 O=build_allmodconfig_cl -j 6
