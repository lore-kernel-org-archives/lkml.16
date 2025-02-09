Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C631E3790
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 21:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739135919; cv=none; b=jpx+dtCuxqZoKyq7+ny9AGnwRctRoM/dVUz/HGkPhZx8keJGju1KWKxRPD9V2stpS0LZaXbWlmUe1/dh1bK8MPxml9F29AL411X+LlF96YjP9ZsNCGiyQviVA81rnM1DCmIyXy00/ZuGH01iGU1GcSehs5IVTUlRv9LEKuVUWcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739135919; c=relaxed/simple;
	bh=pwe5GaqV8BMCpevTILER8nRZu5l6kBeyADz6gC3ilcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TcCcyEQBABV67wk5nmJdywobVmRU+iqWEXFg4smRFv34sRIeyrLXdY31okyGQVute+BQWVPTWrtI3c1GOcBe60jGD9OUFSsHo5lcwd18P7rgtfjq6S8lK1ADL9g+aLWHXDhwTxFSXmr8r5q4e5uBCilGOmT54wCp4bh/gvo9xdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=dHDOw7t6; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="dHDOw7t6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oYAwdX72PHmdy4J6udOJ/5daIBDy5Wdsh0FcYAuEvbM=; b=dHDOw7t6wStxmGXkfKq3k6bh6b
	5EvY9TAb5c+yoX/0bLBOJbGkqm2Ynd/a8Saxi/z0Xxa2PJc1IeuvPKXeTuZ/71sDdEwhzL/NvLYCN
	dsPGhQFPuk58HJDljQtuZR0LoVI6LKTeHv1a6LWSWBL785AaoSPCJBenGTDQueredU0Jr6I9M5Q4k
	OjJ9f9T1/jQDei5SafJjtfBY6VOv4pC3/glnr294BCLAKG53SxUX2+N2k1U4iYiqjCqo6rlgsU+qY
	O9Edo3WV3m62UZyS1WqbWQJTae41eDIMZx3Q3gI/mBSF+UnCJH1YkQY6w4/nYOrxOBFw5IKMFL7DE
	lDkbqcpw==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thEhD-0002GS-1G; Sun, 09 Feb 2025 22:18:31 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: vkoul@kernel.org, kishon@kernel.org
Cc: cristian.ciocaltea@collabora.com, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, quentin.schulz@cherry.de
Subject: Re: [PATCH 0/2] phy: phy-rockchip-samsung-hdptx: don't use of-alias
Date: Sun, 09 Feb 2025 22:18:30 +0100
Message-ID: <3969871.5fSG56mABF@diego>
In-Reply-To: <20241206103401.1780416-1-heiko@sntech.de>
References: <20241206103401.1780416-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi phy-maintainers,

Am Freitag, 6. Dezember 2024, 11:33:59 MEZ schrieb Heiko Stuebner:
> One nice comment addition and removal of of_alias usage for core
> device functionality.
> 
> Heiko Stuebner (2):
>   phy: phy-rockchip-samsung-hdptx: annotate regmap register-callback
>   phy: phy-rockchip-samsung-hdptx: Don't use dt aliases to determine
>     phy-id

any thoughts on these 2 patches?

Thanks a lot
Heiko


