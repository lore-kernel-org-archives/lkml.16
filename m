Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39F24A23;
	Mon, 30 Jun 2025 05:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751263051; cv=none; b=lgbWSC3iqZ7mUDOv5aYJQD0a58R3t8hav52X7PzprNSsxkIXIG4OivygpsfPKjnR1ZaloyWh11b950ECw+kjWPT+LBtzyKEXMGdEH5bKdI6PivFNqBMZTkYpG22xLnHKzkd9NyQ/bBoQ6/Wyk60bcog9yBZLMh80KaYwzl1kbpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751263051; c=relaxed/simple;
	bh=OY5FnNZGUzQJJVdY+bYafYRhPm+gNzUjp5rwfE9mw98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HA0G70EZ37+nue/cMoEcfKsl8ZmHeAYdh9B3AZp/A4AMLkX2KT6ruHt6wpt9s0nv33HU5zfvkNriiuvzmwn97I3SgEMgz0F4U4KWreReU65KhVMOeOtK1GAmGmRAKJVZyHOC8dGqpCSRHwTcqC7S0v4ztQjmD9hILAoOzTDL1f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6IFAbbs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6IFAbbs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1CCAC4CEE3;
	Mon, 30 Jun 2025 05:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751263051;
	bh=OY5FnNZGUzQJJVdY+bYafYRhPm+gNzUjp5rwfE9mw98=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D6IFAbbsR9baNXm7IKEg3A/pxbYPQ+rJifRo4vcljd0Cqa11Lx6ptE9P+HruolI1u
	 n71CqVBWo72Nx85zn4Nm2/Wm4Wk7+xzwmf1673xf+EUiTp/o83yaqKqJV0xoPoFb2o
	 E4fJyyw1dRCYWwHuhpGnTbYzPqCYMwn1eFlcIG3SY9X08cZRNQ+fE1TLI3qa32Iowd
	 oH3P/grFN6zYNeE366QVFifRibxnKBq2e9lP0GURUj1u7aT10tVK0uEcT0By93AYLF
	 Pp8wSVa4GcQ6jwwdSgMMPYob2RG54fb5A5AoK4GElndNYQZ9LDdYHqpJ3VM6R0vgpm
	 6ACXsuAbvhXPg==
Message-ID: <9f1ac97a-6109-40d1-bf85-f2a8e25138f0@kernel.org>
Date: Mon, 30 Jun 2025 07:57:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] arm64: dts: rockchip: Refactor DSI nodes on rk3399
 boards
To: Diederik de Haas <didi.debian@cknow.org>,
 kernel test robot <lkp@intel.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Dragan Simic <dsimic@manjaro.org>, Quentin Schulz
 <quentin.schulz@cherry.de>, Johan Jonker <jbx6244@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250627152645.740981-3-didi.debian@cknow.org>
 <202506290852.bWro2lBe-lkp@intel.com> <DAYXOI4WITJW.1G5DBWEQDDY1Z@cknow.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <DAYXOI4WITJW.1G5DBWEQDDY1Z@cknow.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/06/2025 12:09, Diederik de Haas wrote:
> Hi,
> 
> On Sun Jun 29, 2025 at 2:32 AM CEST, kernel test robot wrote:
>> kernel test robot noticed the following build errors:
>>
>> [auto build test ERROR on rockchip/for-next]
>> [also build test ERROR on next-20250627]
>> [cannot apply to robh/for-next krzk/for-next krzk-dt/for-next linus/master v6.16-rc3]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Diederik-de-Haas/arm64-dts-rockchip-Refactor-DSI-nodes-on-px30-boards/20250627-233300
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
>> patch link:    https://lore.kernel.org/r/20250627152645.740981-3-didi.debian%40cknow.org
>> patch subject: [PATCH 2/8] arm64: dts: rockchip: Refactor DSI nodes on rk3399 boards
>> config: arm64-randconfig-002-20250629 (https://download.01.org/0day-ci/archive/20250629/202506290852.bWro2lBe-lkp@intel.com/config)
>> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290852.bWro2lBe-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202506290852.bWro2lBe-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> Error: arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso:75.1-6 syntax error
>>    FATAL ERROR: Unable to parse input tree
> 
> The kernel test robot is right as the ``&mipi_out`` node is missing a
> closing ``;``, so thanks for that :-)
> The problem is also present in v2, so I'll send a v3 shortly.
> 
> Luckily I've now found why my build script didn't catch it.
> ```sh
> export PATH=~/dev/kernel.org/dt-schema-venv/bin/:$PATH CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64
> make distclean
> make debarm64_defconfig
> make CHECK_DTBS=y W=1 rockchip/px30-cobra-ltk050h3146w-a2.dtb
> <quite-a-long-list-of-all-boards-at-least-I-thought-so>
> ```
> 
> (debarm64_defconfig is my own defconfig based on Debian's kernel config)
> 
> That long list didn't have ``rockchip/rk3399-rockpro64-screen.dtbo``.
> Is there a better/simpler way to validate all rockchip boards without
> having to explicitly list each and every one of them?
make defconfig && make

or make dtbs

Best regards,
Krzysztof
