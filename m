Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A6018871F
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738317166; cv=none; b=KXKgXBkX8q5MubcRnBjLlPOe0TLS2cb9jYaHKc8u2k7FpGDEs8u68yOiGbaT98fd+OrCpYGbygErKH86o1zeLVXrPun5beAuwCiEFJ1/3Ifs435dQbHgFq2HpRtZfhAehZ/H+wt/RnzsNDfjxFff8AVZvRq5h5gx77j/BogqauE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738317166; c=relaxed/simple;
	bh=H+IlFfMfsD9g1qejv8TSC7mY3PZmOkwq9GIvivm50sA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=M8s8LHhd8AgFYQNXe7vUL9RlAx9ovTpx5RjVAOgSdB33zXT8f8xkXUdXAYapbUmZZMGkpatfW6NmFulktBT8lYaJl34i7YPjnJu7lSLUUMW1Rx3wA9J4TZdhMlim/Mt4HJmKI5bG/HQjsH3cxeJ1eigQFcggOszO4v0sbdHSStk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJizKJwY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJizKJwY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5EAC4CED1;
	Fri, 31 Jan 2025 09:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738317165;
	bh=H+IlFfMfsD9g1qejv8TSC7mY3PZmOkwq9GIvivm50sA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CJizKJwYL5Bm0XraUmEKjV6TXmxBB9kp0MsEkpu+QvtqRovckEyFvj1Z7SDdm9TIJ
	 UmIp4ojsLbE8Uj+Xf3cGcHPlfsYXjnmygk0+EbvAcDpbkZ2HY2LABRcJVVTBlODCqe
	 kwTSxyMJrib9sZVethhjvUAd1iHdT0ejZFVi8bkPlcni3wJWz4bggSWz5YJ3Ard9sk
	 jNxg8CuMfs2Ydf/u6+3GEiyn8eZZCMHBa4rJJz6S1A2sbXsjwd7jabsFjzZCZpj+dd
	 J0gdHbxwfyGqSXlP3CZqDtZzMRU5kQPtcFWxhNLJs6SHvVC9Pu4oMvAyIWo3CF6cu0
	 USwmF2iLw0WTA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250122065249.1390081-1-arnd@kernel.org>
References: <20250122065249.1390081-1-arnd@kernel.org>
Subject: Re: [PATCH] phy: rockchip: fix Kconfig dependency more
Message-Id: <173831716159.670164.8181803651884997358.b4-ty@kernel.org>
Date: Fri, 31 Jan 2025 15:22:41 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 22 Jan 2025 07:52:44 +0100, Arnd Bergmann wrote:
> A previous patch ensured that USB Type C connector support is enabled,
> but it is still possible to build the phy driver without enabling
> CONFIG_USB (host support) or CONFIG_USB_GADGET (device support), and
> in that case the common helper functions are unavailable:
> 
> aarch64-linux-ld: drivers/phy/rockchip/phy-rockchip-usbdp.o: in function `rk_udphy_probe':
> phy-rockchip-usbdp.c:(.text+0xe74): undefined reference to `usb_get_maximum_speed'
> 
> [...]

Applied, thanks!

[1/1] phy: rockchip: fix Kconfig dependency more
      commit: ca996321d32a732ee12e7af8ccd0c84bf885fd6f

Best regards,
-- 
~Vinod


