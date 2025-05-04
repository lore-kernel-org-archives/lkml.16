Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BDB1A8F60;
	Sun,  4 May 2025 11:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746356402; cv=none; b=hZ/3ialwYGCA+9yh6DyYAMr+nzuPXHJ0wdcE1wztgq0QXA8H4SGgFZkXJ6IvtNpAblFQFSZyU129ktcg/rTe6wL8JOaP7H1maWS18F6zc6f/spQZCLrXdAGBaxyjJ7C1YYt0oNYvxuXtU9nJSl6TuE63zi9BmQJW2rF1yNd8pZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746356402; c=relaxed/simple;
	bh=k+wbSPxmHbsz+gWZZT77cinp09GKnwS5LD3mLK37ktU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T322Ua2L41v7rm/aq1XxEPX4zXAKSBQcZkwpd3bqHZ3qIyEmnE9LCGU3BCoCA2QbcWXuBFjKMpIVNWbFScSwdj9OAVxmlVqTGr/BOVv1AavyEBM6VvTNDIXK3kCDGZ9TZdFe4v9sw5uTt6UBYlmmFOeMQuum5DwtlLZTIib3ceM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=cExt7QZ9; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="cExt7QZ9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=VjW/S1wj+bsZEprtcW0AfkkvqS+OgAoSKYgQyE7SjV4=; b=cExt7QZ9//sJx6sNHJx3b66viV
	JeCAQajhqriJs2/S2c1ru6cIX5GEke8nF5FjkwJ8Rpyx01+75MPOGtKDQRxkm7JmaY7EEd3tfCuAG
	6M/OazxmoCR8pLCspg4HoSBrjDg64J5EaRcornEsIZSGTUqmzvfqina+ranhIWl+dX3V6AnqBZ9t/
	Ia3B9QTk3B4G9hKrIP6xrT4ldPW24pdNmdwPD7O57RLcMO9MJNeZX9C4FwYMU7FToEq0f43brcftj
	RwT3qu/3lMCR2CQ+TqD0RZeU8EsZdxXzyQTJQDzAKBXvbwF1SUZOYVUVnmi5ipjIBAf/uJK83h9jW
	EvaIunVA==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBX4X-0001M5-Nx; Sun, 04 May 2025 12:59:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	hjc@rock-chips.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	knaerzche@gmail.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v4 0/7] Convert inno hdmi to drm bridge
Date: Sun,  4 May 2025 12:59:39 +0200
Message-ID: <174635636712.1068615.12087879387464324976.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250422070455.432666-1-andyshrk@163.com>
References: <20250422070455.432666-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 22 Apr 2025 15:04:39 +0800, Andy Yan wrote:
> When preparing to convert the current inno hdmi driver into a
> bridge driver, I found that there are several issues currently
> existing with it:
> 
> 1. When the system starts up, the first time it reads the EDID, it
>    will fail. This is because RK3036 HDMI DDC bus requires it's PHY's
>    reference clock to be enabled first before normal DDC communication
>    can be carried out.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: display: rockchip,inno-hdmi: Fix Document of RK3036 compatible
      commit: c0673bb356557136954b6725bf5fe327b94c6233
[2/7] dt-bindings: display: rockchip,inno-hdmi: Document GRF for RK3036 HDMI
      commit: e0c93980d293b6e6eb7483fd5d665f84e725b518
[3/7] drm/rockchip: inno-hdmi: Simplify error handler with dev_err_probe
      commit: 31b4403c6c523a710205eadb9ca75c6cfe1478ab
[4/7] drm/rockchip: inno-hdmi: Fix video timing HSYNC/VSYNC polarity setting for rk3036
      commit: ad10b82c2bcac7f87ac6eaecfca33378b43425ee

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
