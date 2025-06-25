Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5850C28689C;
	Wed, 25 Jun 2025 09:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842559; cv=none; b=pbrxX1j3NnMXzMF32QBf8PCITQslqAEsp8WO6lsfo+ivqKudPJE3o4PRt3aUmw1tVb4Te+yhqBd4G/fHQdlvKeODOdDRF3jC17kjcIELRzM39IbnU3zaYHrrBAhtNyBW7wFvwEYocRUZUMyZnYquiDM4YETm4ywdXM7ihC4+WRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842559; c=relaxed/simple;
	bh=5BsdWC9xczjMvTnwn2wUphK7xUMrIoc7oipvBOeF87k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uvOMs9yYV7ADBRG7b10Rlz8wK0IzdR13em6pTOOpIVTT6SgPfmblvUd6RfcKJDAc9XMqBY04Ob/KWeoyLX714oSF3zFd8qGR7AJoZt3uHdIWKibJi7m3AfJL6U6aKbppBP0kYS4Lyrzd7z8VvAe4JQ0tB9T17M9Hg0GKBJHg86E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBQh9TG1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBQh9TG1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DAFC4CEF3;
	Wed, 25 Jun 2025 09:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750842557;
	bh=5BsdWC9xczjMvTnwn2wUphK7xUMrIoc7oipvBOeF87k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TBQh9TG1aniBSi5f3cWQ+/x6rD/Vk+D1PG7qplE+6UkJCuEdZFweZcRD1mO6IrXyo
	 ujdDfrUbCRsachKdDg2NiHFOrdMhIvE14XBM5yToNNbcUctAPSl30Q6qdBwsdbHF1k
	 TUCjG/swZX6JI9awMc/xUBfv2WhHcKELVHflLx6lp+2LqQllmn4I35MorjMND9mL9l
	 OQMewdAtR/gf8MVxuvAkcIknwH7kYhOMUJJAlglP02fRmx5pApUN6J0mtC0s9iYpCI
	 rrcHRqCjclc3fvhT6q99TjyboXG3Y3iRW8+F2jCBX+RRRGurIrddcx/6F6QaT3hb6D
	 gQvwZ8wzLzgRw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, 
 Chris Morgan <macroalpha82@gmail.com>, 
 Vasily Khoruzhick <anarsoul@gmail.com>
In-Reply-To: <20250619173207.3367126-1-wens@kernel.org>
References: <20250619173207.3367126-1-wens@kernel.org>
Subject: Re: (subset) [PATCH] mfd: axp20x: Set explicit ID for AXP313
 regulator
Message-Id: <175084255601.4077397.7103143558285168372.b4-ty@kernel.org>
Date: Wed, 25 Jun 2025 10:09:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Fri, 20 Jun 2025 01:32:07 +0800, Chen-Yu Tsai wrote:
> On newer boards featuring the A523 SoC, the AXP323 (related to the
> AXP313) is paired with the AXP717 and serves as a secondary PMIC
> providing additional regulator outputs. However the mfd cells are all
> registered with PLATFORM_DEVID_NONE, which causes the regulator cells
> to conflict with each other.
> 
> Commit e37ec3218870 ("mfd: axp20x: Allow multiple regulators") attempted
> to fix this by switching to PLATFORM_DEVID_AUTO so that the device names
> would all be different, however that broke IIO channel mapping, which is
> also tied to the device names. As a result the change was later reverted.
> 
> [...]

Applied, thanks!

[1/1] mfd: axp20x: Set explicit ID for AXP313 regulator
      commit: 77f6b46f199b8a483e0cfa176b7a629f75a2c4c4

--
Lee Jones [李琼斯]

