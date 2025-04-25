Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38BC17C98;
	Fri, 25 Apr 2025 02:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745548533; cv=none; b=eb3lrT2fDT2DM0QZPWkSSKa+GfHw5Bbs3x02oC+SQtbdgTt8VcvACHsAN8hlqh18MpxNaoQ8aKqfPZQcQ+Wx/ps95uInoxCj8+NYsJEN5YXsJLNWi/JI46QwZ/p7PM7r6kBUD3e+9snbQpdOefuFvBe+DLsRZGpqbcqZhZ8RZ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745548533; c=relaxed/simple;
	bh=RIs/31Rjyt7B68AoWeqJz+goZQ/NLZV4bEu2N//Tka0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmNiLdB/YHBLQez5eKkiM9tTmQJQNe7kSgjDXhv7TmXrh/jA9bpqMzMvfVoT6UP3651k0TfGdRReEcz1D0RoCIuZpdmi7XqFtKdLpXfKonHNLYm/z9cCQOccFfEZtuloBglxFcXa8agL3X4P4HsU1k6x7fqNxNICg7IR4yH8rKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8484234133B;
	Fri, 25 Apr 2025 02:35:31 +0000 (UTC)
Date: Fri, 25 Apr 2025 02:35:27 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: allwinner: correct the model name for
 Radxa Cubie A5E
Message-ID: <20250425023527-GYA50272@gentoo>
References: <20250416100006.82920-1-amadeus@jmu.edu.cn>
 <174551712323.4050580.15085872783453662439.b4-ty@csie.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174551712323.4050580.15085872783453662439.b4-ty@csie.org>

Hi Chukun, Chen-Yu,

On 01:52 Fri 25 Apr     , Chen-Yu Tsai wrote:
> On Wed, 16 Apr 2025 18:00:06 +0800, Chukun Pan wrote:
> > According to https://radxa.com/products/cubie/a5e,
> > the name of this board should be "Radxa Cubie A5E".
> > This is also consistent with the dt-bindings.
> > 
> > 
> 
> Applied to dt-for-6.16 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!
> 
> [1/1] arm64: dts: allwinner: correct the model name for Radxa Cubie A5E
>       commit: 1e5a69d67d1b3c55c9b0cd3933af1436b5d52aa1
> 
It seems I'm a little bit late for this, but while we are here,
Can we also append 'cubie' to dts file name? e.g. - sun55i-a527-radxa-cubie-a5e.dts

for the reasons:
1) there are already too many product lines from Radxa - Rock, Orion, Zero..
some dts file in rockchip already adopt this name scheme:
  arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3e.dts
2) there might be more products in the future for the cubie series..

Chukun, if people agree on this, could you send a follow-up patch
to address this?

-- 
Yixun Lan (dlan)
