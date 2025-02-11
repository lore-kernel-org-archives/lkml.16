Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EBD1F03E6;
	Tue, 11 Feb 2025 09:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266174; cv=none; b=YiefJp1dWb52qhrvnHKJcuTiiG8bfe9JULH+YvCx2tFVV2OPXcoWu4i/NQalRdgjUes9GfdZZ2z1GWde71cUd+W3AJIjtE7EnCF/4POYxx2qgV7e2l8okSDvmUluU31cDnrle9AyyTSLzSlYj21R2lIHlIAKHIuLq+FjbtoLYmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266174; c=relaxed/simple;
	bh=JZPLb4A3nkXiV6t/2IIP7XFbjxtiycoxSDUHf93QE7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bhSlyjNg3g40dgBIMz/pj+DHpE8ULmqiTtNhGR7TxBri5SL+LNeewWMZ41vhu+K2Uz9MpeNV8XFQyZqiWvK1lA2xaWJxkd26Qj5W0XDbsuj2VQAQB7eOCYoCGe6r23JZDyTWkYAz/MGfVyGJZrnVHPA0rv7kTOQ6b19IYMxcRWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=khD+fbl6; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="khD+fbl6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mKxU1H0bH4jOjCpR1iDA2kn4hJyozUlGpPk9T5FA/N4=; b=khD+fbl6rFjDcBbbVPzRaalweS
	coRFMUULM4kw5PMl6IonM8XSYGxIZX5by/0liY/PQq2/ngdVU43/BHV8aJMZ2gP6Yp+BgLXdB+lt9
	/dDS8qOgHNbsINo5D3WlB6+WkryLtDwItBu9HEJWBDRqRGdRsNBKmPN5d9zz662XOybMSSb4CfwuH
	BhfYvNtIYJllmFhPM7XJjWnh12RQHn25081YBx0ZJfOTZBEDS4VB0coFZiptRtN7mZdUuxmH9/P9B
	dG/dk5YnHdUuov+4K+qn6oLrTBCFR5Vzop17VOJAUF8MUwUz8cHTyVMpJNd2J1nrW1zx7cU8iEo4h
	ysGtCfhQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thmZj-0005mx-GW; Tue, 11 Feb 2025 10:29:03 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Alexandre ARNOUD <aarnoud@me.com>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/4] Add support for HDMI1 output on RK3588 SoC
Date: Tue, 11 Feb 2025 10:28:51 +0100
Message-ID: <173926612575.1219038.14455377173250297870.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
References: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 11 Dec 2024 01:06:13 +0200, Cristian Ciocaltea wrote:
> The patches provide the basic support to handle the second HDMI output
> port found on Rockchip RK3588 SoC.
> 
> For now I enabled it on Radxa ROCK 5B only, the board I've been using to
> validate this.
> 
> ** IMPORTANT **
> 
> [...]

Applied, thanks!

[2/4] arm64: dts: rockchip: Add PHY node for HDMI1 TX port on RK3588
      commit: ea97212a0f66b7bd71c23c12f781f1770dd6fcff
[3/4] arm64: dts: rockchip: Add HDMI1 node on RK3588
      commit: bed6964e779b5853de042da14320edf9f79506fe
[4/4] arm64: dts: rockchip: Enable HDMI1 on rock-5b
      commit: 77cea7ca13680e14119a3b9635c7ef16cd7ee44e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
