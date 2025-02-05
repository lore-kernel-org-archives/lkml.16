Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483E4208989;
	Wed,  5 Feb 2025 21:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738790917; cv=none; b=NgoFIi/SpeyelrZ61WSjxK39gEM1p8B75DJePm7Li7IwCzhOMscKcxLFxewWQy1hYMwFqHEXTG+H16C+xVPfHn30Jntv+O+QI2vM98R9h8vgUGBLE/Jm0tsAfbkJ5dRpX+9pJOqaagOXFDrE50JKDfbWVBPf/50HEM07F3JcJ54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738790917; c=relaxed/simple;
	bh=7cTiWKja8ahpB4cG7xBn/0D3VBJyS3IVnXM+ObDED60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2PRcam2Cf+L0XLC27PTwnj2n6xbg2mWFwedhFK+fs1uMbcx8qJjB7IKjhsugPfMazKkcmWWU9o8wtcQ3j5YESwoUzLqHWJTc+teyQgMLE5eai7IjbUEpISNh5jgAgDll178ifMBW7AMD8BjrHgvBAo07LBr71KU3lvYqwjSwEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gzr7ovXh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gzr7ovXh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA8B6C4CED1;
	Wed,  5 Feb 2025 21:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738790916;
	bh=7cTiWKja8ahpB4cG7xBn/0D3VBJyS3IVnXM+ObDED60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gzr7ovXhUYUByQb2QlVylFjDoipQApTHo9KjwVI/thJyLkYaAGqufTnV79TA6yBVi
	 kK8kwiNV2rSJFf2e+iYVvi3yf9h1m2CQt8ovUSRuS5vMEtIEkTr814VlCbQqn/JUNX
	 zIxM8n/ohq6moz+2S3MJz36IUl1W+wyK5R/NcoAM/qRnd9xlvU6akvdAxoyjcNwBSi
	 UO+GHb0QWH47yanJ8ORSg+CaACYC/Em4pHP5XNmzMo1cXolqJULApqRDfBDh0xZY0t
	 FWVBvRRZNFhZoDrfg9MZgZLuqwb/YrUIkJd+QQDx71OjbjmGQ2kK/BCY/uUY9DS2/Q
	 s2GRJZ/ba9heg==
Date: Wed, 5 Feb 2025 13:28:36 -0800
From: Kees Cook <kees@kernel.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
	justinstitt@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/1] alloc_tag: work around clang-14 issue with
 __builtin_object_size()
Message-ID: <202502051327.AE8C0706@keescook>
References: <20250201200503.2532357-1-surenb@google.com>
 <202502051056.B910C691C@keescook>
 <jdnvctbd4kfzgjy4s4wpd24zpv66zsn3cjgnsialjbnrl3oa4e@vexb7u4ku2tr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jdnvctbd4kfzgjy4s4wpd24zpv66zsn3cjgnsialjbnrl3oa4e@vexb7u4ku2tr>

On Wed, Feb 05, 2025 at 03:16:12PM -0500, Kent Overstreet wrote:
> ARRAY_SIZE() is sizeof() underneath, just used creatively to guarantee
> that the input is an array - although that property is probably what we
> want here, since strtomem_pad() really only makes sense on static or
> flex-arrays, no?

Exactly. strtomem*/memtostr* are very picky about the destination being
compile-time sized, so sizeof() under the hood seems correct. I'm making
my way through testing a patch now...

-- 
Kees Cook
