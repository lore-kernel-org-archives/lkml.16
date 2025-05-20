Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EB3258CF7;
	Tue, 20 May 2025 19:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747768203; cv=none; b=TAM0MmZcEgdCpO48WXvpQE7IPjqZyXBuCzu/0rStdE3KoflQLI1UlsBLDNZw7Hl8xmzXWISHcoSuZdnYJDlL0SsvoVoni8n1CgQlrLAR7qpBtNn6XWinLpuVbOJTjecqU4NceJw0xfmLl+fPryTVfTtzqFKbzN2tkBDuGXxBwyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747768203; c=relaxed/simple;
	bh=itgr7fnckoBmBJ3x1w+6tg5JJCcYpIZKSUgHI+zi/gU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SFAoEj330Rk/fCr33xEuG3TMHBuiWBjnM+tW6o7Kt1VVrg15j8hivRM0Yn5G/RG/q8evm9f1ExEyjiC470PjXKgH/dGaX+OBf20f0sVP0+LBGnpEqYJreVs1/fciGz3LmT2LcYMHxXTSBRojQ8EddIkuqpzilsHO68d19TCGDKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=HSiHYHx4; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="HSiHYHx4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=/O2GEQZPczO3qpUD8v8+5WOVBoh1pvPM9twx2k6GZy0=; b=HSiHYHx4r9iqZJiOo8GxDZREQT
	TMsOuR+9VyrdruhHYd7Eu7xfCyTEPiWYoxlsT9hVqNDl8nGLNC1soUGu1xcbOQvM79RXRQrEYrTUt
	fm/PTTYCj//iE42lpPCBOPTDeQQ4cPUTpd7RBi4i4FXOm7Z8mu5wd4sAnx0pUx+j6kvQqk2jTZEFR
	5R8zLTDtSVLkAlmR7GGK6wwbgBD/XvV0g7vUUlUhPvTDcFokb6KBVsuVsfSCfDCTjTYXAUeaineAn
	oxwM4Zet8vevjVBuhYHAn5Y0YQ7t1jn7HRfx04i0SfsaxcLFfB0Xwzd1bslVQH9kIKODEz7k3j3MN
	etJvbvWg==;
Received: from [61.8.146.112] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uHSLc-0004fK-K7; Tue, 20 May 2025 21:09:56 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Drop assigned-clock* from cpu nodes on rk3588
Date: Tue, 20 May 2025 21:09:44 +0200
Message-ID: <174776817931.2879626.2353360288998148542.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519101909.62754-1-didi.debian@cknow.org>
References: <20250519101909.62754-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 19 May 2025 12:18:28 +0200, Diederik de Haas wrote:
> The assigned-clocks and assigned-clock-rates properties were moved from
> the scmi_clk node onto cpu nodes in commit
> 87810bda8a84 ("arm64: dts: rockchip: Fix SCMI assigned clocks on rk3588s")
> 
> During review of v1 of that patch set, the following comment was made:
> 
>   why aren't you using OPP tables to define CPU frequencies.
>   Assigned-clocks looks like a temporary hack because you haven't
>   done proper OPP tables.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Drop assigned-clock* from cpu nodes on rk3588
      commit: 6e0f32da68fac556327666f8f81dfae7405d1c25

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
