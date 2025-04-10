Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3C320C49C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275226; cv=none; b=aZViiz2BFAPMHt+gcsdo4XPaPoAOzAvxiu/OSJfOd38mgIDDi4TCRObwtiPCEFIhUwbtJDPlaiLdK381m1K7HPXWBBbonWrz5/KSMuM6DbNFIKxZVmKd45BcCcEA2Co/Xw1UnkpeEEK2TPvnnouDktzEg6y1S4D8IHvhkN3nImU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275226; c=relaxed/simple;
	bh=xm5a12pFhLIMry5y++hjuy83iJYSl+3cpW2pF+KSb0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IpIeoydhlWl12Vw5sV7HL6vhWvS9meT49LQ+DbtcnWnreon4DCFW8I1iKI1zxmpgiemANGSk3mYqgD9GBv0jXY9g0LOfk7o54BcQV/t27lsLFrFCoq1s4A1t6kvTLAOn21pVm6boNcCPV5z3u84MmXPYJiIzNCujspKzmnqZdn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=LMOo6+IC; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="LMOo6+IC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ZXCoP5L2J4BtwaEH2n2GCfyW7YWDh/4SAhqwGfBIa/Q=; b=LMOo6+ICnSo9wd/0x+KdGHWkKq
	UgRoQTSd6ftNQ2A3885oQ20jGkdFObG4rxEVQtA2/ql8+vxJsCjYsuq5C7VsleaICi/CHRrTgvz0o
	F/J8eT0tGLFZa/REVQbL/ko/0ScVNyQi7eCydsEc29zJBUGjBuFu/Ou5NN8A2OxEY8/7iwe7oTCP1
	PwLUH/PUkw/EcOskWbW83yCVv4iGmroK9jbUrFJwquqoY0WXHbWxrNyhDewufFLhy2kuI3C9WXO3a
	minoMr0ucy2l9tO62kueLB8Yvq82UiDojWW+zajgua6aqtDGaGwPjPCrOX+lqK9+aYc1uCbJBuL0r
	4YmpVI5A==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2nfH-00036h-1n; Thu, 10 Apr 2025 10:53:39 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	cristian.ciocaltea@collabora.com,
	hjc@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v2] drm/rockchip: dw_hdmi_qp: Fix io init for dw_hdmi_qp_rockchip_resume
Date: Thu, 10 Apr 2025 10:53:28 +0200
Message-ID: <174427520238.842175.9547277934386341429.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317102757.565679-1-andyshrk@163.com>
References: <20250317102757.565679-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 17 Mar 2025 18:27:53 +0800, Andy Yan wrote:
> Use cfg->ctrl_ops->io_init callback make it work for all platform.
> And it's also gets rid of code duplication
> 
> 

Applied, thanks!

[1/1] drm/rockchip: dw_hdmi_qp: Fix io init for dw_hdmi_qp_rockchip_resume
      commit: 1d34597a1e23004c7dd0ab5f58ba1ef95fd9ded5

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
