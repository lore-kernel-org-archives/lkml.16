Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAAC2045A3;
	Thu, 10 Apr 2025 06:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268191; cv=none; b=jlSZmdGxE4NwreQNr2NGv80gOB9ehRL+7qN6R4SJeCwo5ai9V/5ZfhF/K/6YAB92jnoSY6nHaNEskvQSeHB8VcdVOCaNEoSTQkgNDYw4FyRG7yVhaA8SRfULE1DwbDCPohY1kHijulPP1qOx9AK9YqwUXqYdX7hfXb6EwZIGN5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268191; c=relaxed/simple;
	bh=5FNuOMkGySczX4KaoEeUTsJSA/7MQK3TIqHQS3kKeQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDTsqNzPq4+lR8ZHMdrdmpP2pdh1wlTD+CRmMldG8+aSOyrFGiJGPJ2iye35SgrIJVmrP7ze6NTZBXHx29OmvTPL6lZRENQe2NkuzmfR31UTRrlf1XckEtoAovrbCEac8nWtMAjsx9dJqrausrf/iJ32UxogIpawfqTRs5o/Ro8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dUZJmrQR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dUZJmrQR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 842EFC4CEDD;
	Thu, 10 Apr 2025 06:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744268190;
	bh=5FNuOMkGySczX4KaoEeUTsJSA/7MQK3TIqHQS3kKeQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dUZJmrQR24XidyGrKRG/csN8cxTUgD01jZchdfGkq2uMu5/4sctorZdAGYGH3RRjW
	 9pHqBGw9Hk227G3OIy1MdxrEB91bguuNPLeQcmvPexPB3ORMiMLE0Eysmn1lZtKH/f
	 tSrx0zwvtih7M9jwEQ3eSNysBy7F7eFgOT4dDtlWOSciCmjYYPxfRVjldckZakg4NY
	 okDJw0t1Fr8haNF8naQdbaBzZOp/WylIle0wLXv/M9o+x9/ukBRhXJbLCqgr6PcEH5
	 LDxj36N2aVRJ2XQ470kf10DWxD+OACCaZK7nsl2W89+5EA55HNy487zHLgUJFPcR5S
	 vmTTVPb+UJzZw==
Date: Thu, 10 Apr 2025 08:56:26 +0200
From: Ingo Molnar <mingo@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: kernel/sched/syscalls.c:979:8: error: unexpected token, expected
 comma
Message-ID: <Z_drmjgelvOokDRl@gmail.com>
References: <202504082254.7GLSWAbI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504082254.7GLSWAbI-lkp@intel.com>


* kernel test robot <lkp@intel.com> wrote:

> Hi Ingo,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   0af2f6be1b4281385b618cb86ad946eded089ac8
> commit: 04746ed80bcf3130951ed4d5c1bc5b0bcabdde22 sched/syscalls: Split out kernel/sched/syscalls.c from kernel/sched/core.c
> date:   11 months ago
> config: mips-randconfig-r064-20250408 (https://download.01.org/0day-ci/archive/20250408/202504082254.7GLSWAbI-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504082254.7GLSWAbI-lkp@intel.com/reproduce)

I cannot reproduce this.

To test it, I did:

  $ wget 'https://download.01.org/0day-ci/archive/20250408/202504082254.7GLSWAbI-lkp@intel.com/config'
  $ /bin/cp config .config
  $ make -j102 CROSS_COMPILE=/home/mingo/gcc/cross/bin/mips64-linux- ARCH=mips kernel/sched/

  CALL    scripts/checksyscalls.sh
  CC      kernel/sched/core.o
  CC      kernel/sched/fair.o
  CC      kernel/sched/build_policy.o
  CC      kernel/sched/build_utility.o
  AR      kernel/sched/built-in.a

Note that the config was *very* old AFAICS, from v6.10 or so, and I 
accepted all the default .config suggestions.

Compiler used is:

  # CONFIG_CC_VERSION_TEXT="mips64-linux-gcc (GCC) 9.3.1 20200601"

Thanks,

	Ingo
