Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037828479;
	Tue, 13 May 2025 18:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747161981; cv=none; b=qJP6kHe90CVaiwyH2iZ3mDpVfBDYpVt1UHYwMOMgqFSiTJ57apeUgGlI27fZElv8x901gApzaEGaAHepDd9Pe2Xmcpcv9y6JdN7+KgwtP7nShdUvOzng9IevcrMs29Be+COjG5Qdknuc+G0mpWP+2uaO2TLfcb1lDkrVJ4UltM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747161981; c=relaxed/simple;
	bh=2yWKwaFYkXoFwGGoFkX57qGwXUQQNhB9ut9pZrqY8A0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aG4oeHHyMYgfEiN8aMDaAQ2FZhuaOf9Bck3k405xgMBMOtHC759F07GsNyqBY+Zi1UfeadYsXHeGOTG1cpHKG+LGM852SGdOI86Z53SK5e4Kok2uWBJFNtGrTj4j7OBRcgwZyRRwk2qfa6qi/8YZjpwYeEKdsca8vV75FJyKKtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=2K8xhFrK; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="2K8xhFrK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=b28ksCTnjIRFAquS7/o+nZoz6YrnaKx7+hVVFMSGgZs=; b=2K8xhFrKIG7G61WMA7IwY53FJX
	Kd0ZCKmr5K6pEDm7R0x+h9KIVbp/TxbbEiIpnF5xG0kf0ts2pqsw7yyw10oRnelJtufY4zrMs+94G
	DoSNWiuDTff7Jd3sVgYpJRoLzhC5Dq5blgiCp64MDYXSVo8mgQGAxv/ZFiV4wuM8XAxpgo+IVz4hF
	ObU0LRf33J0QYJxF+pSXLNC1Yo2NNUNx7BfAij4rN7WxEefhmpdj0mfS+3oj03p27iR9INTnbtXO3
	mEtogGUnFsmkjPH+A97amtyt15qeyDyw+mvV6PAs1HAuFHJO8RJF2GnJLTO01VcwkpMv3oF1oUgp0
	yjM6vxLg==;
Received: from [61.8.147.169] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uEudr-0003up-6M; Tue, 13 May 2025 20:46:15 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nicolas.frattaroli@collabora.com
Subject: Re: [PATCH 0/2] Some minor cleanup in the Rockchip clock driver
Date: Tue, 13 May 2025 20:46:04 +0200
Message-ID: <174716195452.2345121.6991370045549832048.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508182752.1925313-1-heiko@sntech.de>
References: <20250508182752.1925313-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 08 May 2025 20:27:50 +0200, Heiko Stuebner wrote:
> One fixup for the new grf-gate and bringing the grf-mux branch naming
> in line with the oher newly added grf clock-types.
> 
> Heiko Stuebner (2):
>   clk: rockchip: rename branch_muxgrf to branch_grf_mux
>   clk: rockchip: rename gate-grf clk file
> 
> [...]

Applied, thanks!

[1/2] clk: rockchip: rename branch_muxgrf to branch_grf_mux
      commit: e37fe0b9bf762dca9f16e0461d14038ec3898f8d
[2/2] clk: rockchip: rename gate-grf clk file
      commit: 553f648dbd9472ea55a6835446fe57f48491b355

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
