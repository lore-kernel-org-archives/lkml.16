Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAB22BEFF0
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750095128; cv=none; b=G3I8JgahFddGahRpM+XzfoIn6xzzLEiiQ6YOPtQhTEuWQ08ibNdct4ZRdg+Shp2PXAILQtS7cQaXswfvP60TJHtCsWPQRwSYJUiN+K/2lEWf7n84oNy/7pVoJ8KPjMRjPkvjyzxYQyRwd4/Azn3RpVJ9/3dVm+1BkPAOS8FPg+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750095128; c=relaxed/simple;
	bh=H41Dos4nuiBHHj2x24i5YJjmevLAfJf6MRT1WONU3aA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lmrQYNi/hQ0gwVn2his/nwLk4WTc9E9LKFap/m2t2LWcTqjR7oHVQKTQC8s8BhKHbSxcUoRyymwV3yWVQtAkT0xUObNsPmpciyeArDxK5JywU/2CfDNqpPu+/cIYo8pK2llHfkStlV8NWl/0liQDdoouTrqz1HNbjR/M7xMfkQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKztQNF4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKztQNF4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368DFC4CEF0;
	Mon, 16 Jun 2025 17:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750095128;
	bh=H41Dos4nuiBHHj2x24i5YJjmevLAfJf6MRT1WONU3aA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eKztQNF46WfPuiW035B/qC/7nvwIbGDsISPHoB+LkJ1AUqHAXaluUuzLu9K0x+TdI
	 zqg39Ssuy44lknWcwPe+uJd+/XeiJ5VLW2bQTzhZyukICbKBALUlwTvq7QGOakWlFI
	 mGxO0DcO+dHY0ifk3x1XuC1oAj8rFv4RxJqoc7jv0kRp83EfHxul8OkXXJR0nLWfwR
	 VAbt0bkZGRPS9euMoAK2d3GpOleLxX1mDqAkmbAm/H/LqorWLFupDiwBBzAsU3lr9s
	 W1hYmR3ZHgd85PSMhqPcsOUffgB3OwTPEeHO7ssapp9mg6iPl/b2F5mLlBLNm4B8US
	 4TnoxFWH2lSQg==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, sjakhade@cadence.com, rogerq@kernel.org, 
 christophe.jaillet@wanadoo.fr, u.kleine-koenig@baylibre.com, 
 eballetb@redhat.com, make24@iscas.ac.cn, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, srk@ti.com
In-Reply-To: <20250616064705.3225758-1-s-vadapalli@ti.com>
References: <20250616064705.3225758-1-s-vadapalli@ti.com>
Subject: Re: [PATCH v4 0/2] Enable PCIe Multilink and USB support in
 Cadence Torrent SERDES driver
Message-Id: <175009512484.77433.7332008040409961551.b4-ty@kernel.org>
Date: Mon, 16 Jun 2025 23:02:04 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 16 Jun 2025 12:17:03 +0530, Siddharth Vadapalli wrote:
> This series adds support for standalone PCIe Multilink configuration
> along with the support for PCIe Multilink + USB configuration in the
> Torrent SERDES driver.
> 
> Series is based on linux-next tagged next-20250616.
> 
> v3:
> https://lore.kernel.org/r/20250109121614.754466-1-s-vadapalli@ti.com/
> Changes since v3:
> - Rebased series on next-20250616.
> - Collected Reviewed-by tags from:
>   Roger Quadros <rogerq@kernel.org>
> 
> [...]

Applied, thanks!

[1/2] phy: cadence-torrent: Add PCIe multilink configuration for 100 MHz refclk
      commit: 240ef19ad78b12e40ec8808694a0b81e6a3a2c2d
[2/2] phy: cadence-torrent: Add PCIe multilink + USB with same SSC register config for 100 MHz refclk
      commit: 351e07e6b2ecc16ef8669713b14b6f67518c945d

Best regards,
-- 
~Vinod


