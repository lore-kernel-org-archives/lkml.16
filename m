Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7192BE0F3;
	Tue, 13 May 2025 20:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747168160; cv=none; b=Eu0k3+BpxnsZ5inIS6tXiULbRqkPmRYqWUnS/3yINh5l4hHETDRMsj/rkbH55LmLOpyuc+78blW04aFAuPksqWA5LuuBIYONtF6N1qv3NI941wz6PRcrdtbKoOzLP1Tvan+WVXU8BIWohMFQ5cocT7REf2hcoa0uS7yIlTx6lyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747168160; c=relaxed/simple;
	bh=X/I/DznjppVpnLor5IbJ8j5cSqt21DQafLMLXcElZkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3yS/HImmvXZVK8BnH/U9HqwWkmhxx3fG33rD1dF1IZq+hOfUUfVV8gcrbX1ZugXzyRnnIFrX86loo1qcfDbgHVeEf91k3Opg8DYZwsqtVvdZfTsU3y4qiY9A9JjFyU2R/cmIN1DA94P2hgIqOo1Zaom+Ol3E3Bgn2ySn4ubB7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 03163343516;
	Tue, 13 May 2025 20:29:16 +0000 (UTC)
Date: Tue, 13 May 2025 20:28:35 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
	guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/6] reset: spacemit: add K1 reset support
Message-ID: <20250513202835-GYB518096@gentoo>
References: <20250512183212.3465963-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512183212.3465963-1-elder@riscstar.com>

On 13:32 Mon 12 May     , Alex Elder wrote:
> This series adds reset controller support for the SpacemiT K1 SoC.
> A SpacemiT reset controller is implemented as an auxiliary device
> associated with a clock controller (CCU).  A new header file
> holds definitions used by both the clock and reset drivers.
> 
> This code builds upon the clock controller driver from Haylen Chu.
> 
> This version uses ida_alloc() to assign a unique auxiliary device
> ID rather than the value of an ever-incrementing static variable.
> 
> This series is based on the "for-next" branch in the SpacemiT
> repository:
>   https://github.com/spacemit-com/linux/tree/for-next
> 
> All of these patches are available here:
>   https://github.com/riscstar/linux/tree/outgoing/reset-v9
> 
> 					-Alex
> 
> Between version 8 and version 9:
>   - The auxiliary device ID is now allocated using ida_alloc(), to
>     avoid colliding device IDs, as suggested by Philipp.
> 
> Here is version 8 of this series.
>   https://lore.kernel.org/lkml/20250509112032.2980811-1-elder@riscstar.com/
> 
> Between version 7 and version 8:
>   - The structure containing the auxiliary device is now allocated
>     using kzalloc().  That means its lifetime is not tied to the
>     parent device, and auxiliary device's release function is
>     correct in freeing the structure.
> 
> Here is version 7 of this series.
>   https://lore.kernel.org/lkml/20250508195409.2962633-1-elder@riscstar.com/
> 
> Between version 6 and version 7:
>   - The new shared header file is now named "k1-syscon.h" (suggested
>     by Haylen Chu)
>   - The SPACEMIT_CCU_K1 config option has been removed (suggested
>     by Philipp Zabel)
>   - The SPACEMIT_CCU config option is now tristate, and selects
>     AUXILIARY_BUS (suggested by Haylen Chu)
>   - All code is concentrated into a single file "reset-spacemit.c"
>     rather than in a directory (suggested by Philipp Zabel)
>   - A bogus return value has been fixed, and a few irrelevant comments
>     have been removed (suggested by Philipp Zabel)
>   - MODULE_AUTHOR(), MODULE_DESCRIPTION(), and MODULE_LICENSE() are
>     now supplied (suggested by Haylen Chu)
> 
> Here is version 6 of this series.
>   https://lore.kernel.org/lkml/20250506210638.2800228-1-elder@riscstar.com/
> 
> Between version 5 and version 6:
>   - Reworked the code to use the auxiliary device framework.
>   - Moved the code supporting reset under drivers/reset/spacemit.
>   - Created a new header file shared by reset and clock.
>   - Separated generic from SoC-specific code in the reset driver.
>   - Dropped two Reviewed-by tags.
> 
> Here is version 5 of this series.
>   https://lore.kernel.org/lkml/20250418145401.2603648-1-elder@riscstar.com/
> 
> Between version 4 and version 5:
>   - Added Haylen's Reviewed-by on the second patch.
>   - Added Philipp's Reviewed-by on the third patch.
>   - In patch 4, added a const qualifier to some structures, and removed
>     parentheses surrounding integer constants, as suggested by Philipp
>   - Now based on the SpacemiT for-next branch
> 
> Here is version 4 of this series.
>   https://lore.kernel.org/lkml/20250414191715.2264758-1-elder@riscstar.com/
> 
> Between version 3 and version 4:
>   - Now based on Haylen Chu's v7 clock code, built on v6.15-rc2.
>   - Added Krzysztof's Reviewed-by on the first patch.
> 
> Here is version 3 of this series.
>   https://lore.kernel.org/lkml/20250409211741.1171584-1-elder@riscstar.com/
> 
> Between version 2 and version 3 there was no feedback, however:
>   - Haylen posted v6 of the clock series, and it included some changes
>     that affected the logic in this reset code.
>   - I was informed that defining CCU nodes without any clocks led to
>     warnings about "clocks" being a required property when running
>     "make dtbs_check".  For that reason, I made clock properties
>     optional for reset-only CCU nodes.
>   - This code is now based on v6.15-rc1, which includes a few commits
>     that were listed as dependencies previously.
> 
> Here is version 2 of this series.
>   https://lore.kernel.org/lkml/20250328210233.1077035-1-elder@riscstar.com/
> 
> Between version 1 and version 2:
>   - Added Rob's Reviewed-by tag on the first patch
>   - Renamed the of_match_data data type (and one or two other symbols) to
>     use "spacemit" rather than "k1".
>   - Replaced the abbreviated "rst" or "RST" in names of newly-defined
>     sympols with "reset" or "RESET" respectively.
>   - Eliminated rcdev_to_controller(), which was only used once.
>   - Changed a function that unsafely did a read/modify/write of a register
>     to use regmap_update_bits() instead as suggested by Haylen.
>   - Eliminated a null check for a pointer known to be non-null.
>   - Reordered the assignment of reset controller device fields.
>   - Added a "sentinel" comment as requested by Yixun.
>   - Updated to be based on Linux v6.14 final.
> 
> Here is the first version of this series.
>   https://lore.kernel.org/lkml/20250321151831.623575-1-elder@riscstar.com/
> 
> 
> Alex Elder (6):
>   dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
>   soc: spacemit: create a header for clock/reset registers
>   clk: spacemit: set up reset auxiliary devices
>   reset: spacemit: add support for SpacemiT CCU resets
>   reset: spacemit: define three more CCUs
>   riscv: dts: spacemit: add reset support for the K1 SoC
> 
>  .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
>  arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 ++
>  drivers/clk/spacemit/Kconfig                  |   1 +
>  drivers/clk/spacemit/ccu-k1.c                 | 239 +++++++-------
>  drivers/reset/Kconfig                         |   9 +
>  drivers/reset/Makefile                        |   1 +
>  drivers/reset/reset-spacemit.c                | 297 ++++++++++++++++++
>  .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 ++++++++
>  include/soc/spacemit/k1-syscon.h              | 160 ++++++++++
>  9 files changed, 755 insertions(+), 127 deletions(-)
>  create mode 100644 drivers/reset/reset-spacemit.c
>  create mode 100644 include/soc/spacemit/k1-syscon.h
> 
> 
> base-commit: 3f7ca16338830d8726b0b38458b2916b3b303aad
> -- 
> 2.45.2
> 

I'm satisfied although you will have one version bump for this series, thank you

Reviewed-by: Yixun Lan <dlan@gentoo.org>

-- 
Yixun Lan (dlan)
