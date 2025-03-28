Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170521E4B2;
	Fri, 28 Mar 2025 05:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743138452; cv=none; b=Of1zphjF1j9BqojQZJOFgjigmAZ623tK2kJICt0igKjaGfQmC23hcuN1Vqwrf+pdG4podsLdH/P4bt7YXyV3u5RvKm1J8O89MQJKOScukY5CtBqIwHaqkC91NbXP99S5i/xeA4tQkQGlGq9Vt6wySZBhQ80bl7pWmNnns7LV3Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743138452; c=relaxed/simple;
	bh=JmdbrI/9KD6/fdj9lXwJjvW+Rj5YjzJNtL54jIw2VuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJoVlnYGh7u3muLzkpPrJ7mYhqX7P4Jb8ClyffcxQCBhw3WG8YT5JScgQ5L3MyB+ro3zp3H2TJM+kezG3uwnUgtGTGVz3W2OzUZur4n1xxZnUzkydPRCFnussbVRj/H1aadMWrlyU1kwA047K1Fx5IvpUjTOAHt2PSbs232tA4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yu83rbQR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yu83rbQR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629A0C4CEE4;
	Fri, 28 Mar 2025 05:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743138450;
	bh=JmdbrI/9KD6/fdj9lXwJjvW+Rj5YjzJNtL54jIw2VuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yu83rbQRJ/b2NeQpjor00xunRDMBZMSfm5qVGcIYOUNSjvr15FAM5ksmbfjnZGcHA
	 CjqWu60pJWnCMS6INoFoohumdbxlq+YbA+dCgkVvYoTJM84qR/cg2iAQTPhR0fD0F8
	 2TkPQmzjcFnhtlxRmtztz1Pkyfyv6EFl5qOLSaJMtQOGHzTQtoF3XOf5Sk7+ZQwLXY
	 UsnHjjzWbYugTIw5XlpCX4WET0ASIi2P92sYiPDyVtIGxVLpSGFff2RJlbFLnEh2As
	 qq6QmkYdMfD1fWxQCbeG2zeyRiatWVrVbTylfc+1Nwv6++dsQaY37ljYCZPGaz5xXS
	 akVR6OTvc9yZQ==
Date: Thu, 27 Mar 2025 22:07:28 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [tip:objtool/urgent 9/23] arch/loongarch/kernel/traps.o:
 warning: objtool: show_stack+0xe0: skipping duplicate warning(s)
Message-ID: <e2wodavgddmuzngh72vw2pptyp5wd4m3t3vqitcgw43blpsxnl@ojuunzuaswjk>
References: <202503280703.OARM8SrY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202503280703.OARM8SrY-lkp@intel.com>

On Fri, Mar 28, 2025 at 07:31:45AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/urgent
> head:   1c9d28fdf70d4ae3e8dfeadee982461403c6bb50
> commit: c5995abe15476798b2e2f0163a33404c41aafc8f [9/23] objtool: Improve error handling
> config: loongarch-randconfig-001-20250328 (https://download.01.org/0day-ci/archive/20250328/202503280703.OARM8SrY-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503280703.OARM8SrY-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503280703.OARM8SrY-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-160
>    arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[23]=-1+0 reg2[23]=-2-152
> >> arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: skipping duplicate warning(s)

Adding Tiezhu.

-- 
Josh
