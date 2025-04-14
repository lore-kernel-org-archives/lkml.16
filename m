Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955821922E7;
	Mon, 14 Apr 2025 23:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744672174; cv=none; b=tr33sGufF9T2Z59OH4v2YiGqwrapFRnt9rlJcNI9XEUj+tLxm1R8HM/zcUC5eP7nGmex7PPsJ+HZ8kt6iUSSfpafCknbabv88NTof+Yzkr0NMDwlc2jyCL2mi6Fo+Tq24aXe0LVxboFJ6TwczwnlnzK55ECKaU/j5KoI9QqPKYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744672174; c=relaxed/simple;
	bh=MCAAnyC6iyKI2w05GmfAi4HOr7ZTdsWTC+8ZaYG3sYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jq76EcIRCoTWt2tX4Pi2EbUqkO/7/bdo6trMruVdgaZLxvo40kra0KFxM5fOCZUnM5Nk68Fss5meOpc/MqAaHoSvVBWg0wM5WMmy0jKed1j2uDSAocVEXHuf8DxBjF4Ju01itimun+Uh8Bh68n6Y9GbMeD2LQdeO3uRnptVSBAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4pRrGmS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4pRrGmS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97DF6C4CEE2;
	Mon, 14 Apr 2025 23:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744672173;
	bh=MCAAnyC6iyKI2w05GmfAi4HOr7ZTdsWTC+8ZaYG3sYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c4pRrGmSCOMTrLdgv0PBxDGZZMpxed3zHWXRKayhxP3brM8dxLDXq+3kpWCIEvH/5
	 bZsUOJOzVaBNbid7leT8NXJ/U/GWsy5l9qnWMGdoBMyxw1s8uz9dLqEJSB3+NJBHBd
	 wvrUYaobxXod8rCS9/pz30Xe06RLUkS1K1ZQehrnI5XbJPNY3cfLfQeCO5vUz/RK96
	 uY2pNZTbpZtZ1GXasL09VtBfeB6V9tvlExw8UeZF0WfZ/xoD0I2ev0eZvWmmn0KXU6
	 QbFpRPARFPdLqYJcM1vRw+s7JjGOIHNrEOX6pXhYg252vesTU/WRza6+0Uv1TPM4CE
	 IeLEfaaAfd4xQ==
Date: Mon, 14 Apr 2025 16:09:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Philip Li <philip.li@intel.com>
Cc: Ingo Molnar <mingo@kernel.org>, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: kernel/sched/syscalls.c:979:8: error: unexpected token, expected
 comma
Message-ID: <20250414230929.GA637400@ax162>
References: <202504082254.7GLSWAbI-lkp@intel.com>
 <Z_drmjgelvOokDRl@gmail.com>
 <Z/sgL9Rt9c8ZGhxj@rli9-mobl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/sgL9Rt9c8ZGhxj@rli9-mobl>

Hi Philip,

On Sun, Apr 13, 2025 at 10:23:43AM +0800, Philip Li wrote:
> + llvm mailing list to consult
> 
> On Thu, Apr 10, 2025 at 08:56:26AM +0200, Ingo Molnar wrote:
> > 
> > * kernel test robot <lkp@intel.com> wrote:
> > 
> > > Hi Ingo,
> > > 
> > > FYI, the error/warning still remains.
> > > 
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   0af2f6be1b4281385b618cb86ad946eded089ac8
> > > commit: 04746ed80bcf3130951ed4d5c1bc5b0bcabdde22 sched/syscalls: Split out kernel/sched/syscalls.c from kernel/sched/core.c
> > > date:   11 months ago
> > > config: mips-randconfig-r064-20250408 (https://download.01.org/0day-ci/archive/20250408/202504082254.7GLSWAbI-lkp@intel.com/config)
> > > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504082254.7GLSWAbI-lkp@intel.com/reproduce)
> > 
> > I cannot reproduce this.
> 
> Hi Ingo, looks this problem is clang + mips specific, and it can be traced back to
> early days like [1] [2] on different commits/files
> 
> 	>> lib/usercopy_kunit.c:205:2: error: unexpected token, expected comma
> 	>> net/mctp/af_mctp.c:259:6: error: invalid operand for instruction
> 
> I add llvm mailing list to consult for this behavior, and it's possible the bot
> environment is not correctly setup for this case.

No, I do not think this is a bot configuration issue, I think this is an
"our matrix is not very big for MIPS" issue so we just have not seen
this issue come up yet. Based on my brief research, this appears to be
an LLVM issue so I will follow up on trying to get that fixed later
(MIPS is rather low priority):

https://github.com/ClangBuiltLinux/linux/issues/2086

Cheers,
Nathan
