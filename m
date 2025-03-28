Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82B3C2C9;
	Fri, 28 Mar 2025 16:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743179479; cv=none; b=ft7cPMmNkcr4svnrhI64k8MDuaBhIS7Ch4LAomTAqbXCWxhId+yWgBszfQqKTxqmOAIkbOdCLIyPtvZZZcSmHRAIAtw2ZPwY+rZAnkZnxt51JfV1tBmMWTW3938GFiJ4zQWzq1/ewjRXcxlYAnKB95vSbAouvqFXgFu6lTxnoeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743179479; c=relaxed/simple;
	bh=jqvTRmFLhOFgQNBQGPsnJ5VkLJC2Rw6TfFZp8ZKodMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGHCKA+AyKdLhu2s0kiU2hW33bZ0wjoQGJspUKlcY2i7OXkjv4bxl7WsMNuwgRiObm652FJcA/v7K02qcKplWosWiRvd6MKwNvzkXWt9wIAMxkCYTBNU5j1bgBU1EeGTB0MfR9Zvj83TTIL05ljBptcbA/TTc4icLLA6q+YyUWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvuGIhvC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvuGIhvC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7A2C4CEE4;
	Fri, 28 Mar 2025 16:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743179477;
	bh=jqvTRmFLhOFgQNBQGPsnJ5VkLJC2Rw6TfFZp8ZKodMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RvuGIhvCT/41/CqHehp1hGqoFwVkuE14OaWaMwzEi9iVjhPdFIlwAwPrUvfBDu2nM
	 7D27og13oAO1H3Tyswbp1ak6yZJRqCY+BZFxZ2cMoaGfBDx/pABlHDLclRMMzrE4cU
	 OKd175GPXdry4LjYAc/zKr8A7wdufnyB1SOPe8rdvNnGXae4ytv7sUkrXo7Z+iPyg6
	 k2NLG1QbC1vjFBv5tPzz5aN2809MaSakJAXgqUA2qyOfhyaGyUk5JtYa/fdDORNIeK
	 JvLXoRhrgnxmEj5CtzsZYvtHjGDLlZwviZyFV6INpGA8gNET4JrQPMjFR7IkheIklg
	 784FPb9G/xPVQ==
Date: Fri, 28 Mar 2025 09:31:15 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: Re: [tip:objtool/urgent 9/23] vmlinux.o: warning: objtool:
 cdns_mrvl_xspi_setup_clock: unexpected end of section
 .text.cdns_mrvl_xspi_setup_clock
Message-ID: <az2awlpfs7wt46kwql7ke3iereryykdroymfuaxawz5gozaxyi@rhlmbjkp3sdg>
References: <202503282236.UhfRsF3B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202503282236.UhfRsF3B-lkp@intel.com>

On Fri, Mar 28, 2025 at 10:49:22PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/urgent
> head:   1c9d28fdf70d4ae3e8dfeadee982461403c6bb50
> commit: c5995abe15476798b2e2f0163a33404c41aafc8f [9/23] objtool: Improve error handling
> config: x86_64-randconfig-161-20250327 (https://download.01.org/0day-ci/archive/20250328/202503282236.UhfRsF3B-lkp@intel.com/config)
> compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503282236.UhfRsF3B-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503282236.UhfRsF3B-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> vmlinux.o: warning: objtool: cdns_mrvl_xspi_setup_clock: unexpected end of section .text.cdns_mrvl_xspi_setup_clock
> >> vmlinux.o: warning: objtool: synaptics_report_mt_data: unexpected end of section .text.synaptics_report_mt_data

Hi test robot,

I'm unable to recreate this one:
 
>> vmlinux.o: warning: objtool: synaptics_report_mt_data: unexpected end of section .text.synaptics_report_mt_data

Can you rerun with OBJTOOL_VERBOSE=1 added to the make command line (or
exported)?

-- 
Josh
