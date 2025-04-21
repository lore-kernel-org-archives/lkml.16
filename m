Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1A4263F59;
	Mon, 21 Apr 2025 13:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745242959; cv=none; b=Dv7OX4tzHmz+uGo3JZyYmA/eqpceo2+4pZYXeXd1PaOI0Hxd5ZLJqQQetLeDgL9uQwdXnM7R9RjfUbQhvRBItMsYs8ueuEV0M0nyzUqwRX+iwNH1vWhYMec2EWKD97U0MHSGgGEPbctE5bJTv6nzrfnwSP1VXHH33ehFgNRN7r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745242959; c=relaxed/simple;
	bh=KXhw3FajxBFcewp5L1yFXiHWp2yt8zvAASSzbJIy+9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVc/Kog+EJ7hRMJr1gEBcPZ26ZYPACrRM0CaNrR1k3IlRoMCQ3QaYkTMLWAGI4Mq//kBMk24Zg3zkdXrqGL/Qtj0SPLcDYKrwmgfFWa2ArXjPyysfKIUUTZvl8DthO/Glj++huwOnT0j/mweH8hP9iq+mt9zcnBQ/E1jZ057KxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1CCB6342FB1;
	Mon, 21 Apr 2025 13:42:35 +0000 (UTC)
Date: Mon, 21 Apr 2025 13:42:18 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/7] clk: spacemit: add K1 reset support
Message-ID: <20250421134218-GYA42923@gentoo>
References: <20250418145401.2603648-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418145401.2603648-1-elder@riscstar.com>

Hi Alex,
  I'm good with this version, but would wait a few more days for
people to comment before taking them..

Hi Philipp,
  Since these reset patches [3, 4, 6] are sitting on top of clk driver,
I'd assume you're ok with taking them through clk tree? I'd plan to queue
them for 6.16.. if yes, would you be able to give an ACK? I'd appreciate!



for the patch series, I'll give my rb
Reviewed-by: Yixun Lan <dlan@gentoo.org>

On 09:53 Fri 18 Apr     , Alex Elder wrote:
> This series adds reset controller support for the SpacemiT K1 SoC.
> 
> Most of the the clock controller driver that Haylen Chu had out for
> review has been accepted (at v8).  So this time this series is
> based on the "for-next" branch in the SpacemiT repository:
>   https://github.com/spacemit-com/linux/tree/for-next
> 
> All of these patches are available here:
>   https://github.com/riscstar/linux/tree/outgoing/reset-v5
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
> *** BLURB HERE ***
> 
> Alex Elder (7):
>   dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
>   clk: spacemit: rename spacemit_ccu_data fields
>   clk: spacemit: add reset controller support
>   clk: spacemit: define existing syscon resets
>   clk: spacemit: make clocks optional
>   clk: spacemit: define new syscons with only resets
>   riscv: dts: spacemit: add reset support for the K1 SoC
> 
>  .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
>  arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 +
>  drivers/clk/spacemit/ccu-k1.c                 | 330 +++++++++++++++++-
>  .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 +++++++
>  4 files changed, 482 insertions(+), 23 deletions(-)
> 
> 
> base-commit: 279d51ad9f6dc0c667f6f141a669b2c921277d1a
> -- 
> 2.45.2
> 

-- 
Yixun Lan (dlan)
