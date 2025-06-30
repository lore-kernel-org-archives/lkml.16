Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9231DF974
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751274712; cv=none; b=o2ZIGn5e3tMr+cvJHD9tb+IRSzfHfj65Rtdxl6xlK+9Y45fpt+5vTEcq8nZ2wu+OuLwzgfjYVfLtHOsfiaQLZoxuE8SIHtdVu5x7zMevJPUCrSC0RHeiA72946TCVnhDwP6T6dTKxidmF9SXLPo/M0jhhPDDDHV0rl592vMHnv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751274712; c=relaxed/simple;
	bh=mndaaFPNNnPPSOC1sqHnrGFivdorGU6L8Ai+AxQ0wgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LKbl7J+IZFfUaH6sefAo5gYap727pEkOR/Ro1SpWDWnGyBVFpaXanmDRKRoJcUXaDnyAjK1PQrXr5z0Vo+LjW4+1P2ahFIn+BEFewJ9tHkYQaTJcTp5DMSgReiDsG0LNTjAbpGaPJr03jqP1/0CnW80odcICKId/M4GAxwWmN/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=oyEKrvAb; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="oyEKrvAb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=q7EVViU5ruLGH5y+Ku78Ia3QlHNz6cQZo821Bht4t8k=; b=oyEKrvAbL4XsxleMXXHgIEiAuo
	sGyr2iOv/ml1ZRiPg1o638aSG+wdmbWmVf0JSy/0ESpbbgGzUj88ACT9q2iC6+4wKsUP/FQrWY/mC
	xq/JXDC15aA5i1hH3oCpXTZqn0efgKIW2lzNAvA1sX0ymOiUYGLdBAzJ3Zm8rnMWWRwwCYPJI9Xhg
	UFBqbRlJBozGPakQAovaBD13l/hhE2Thx0ww5fjuZnrMb3GxPIT4wlxzHFBk0PGEZFuwmADVg3etp
	2BWRg7Ies5BsDMlh7ArgxgIRjZpeuJvmH1orZ9WbDTIz52skuwlVpCQDvJ1LG8xuxjj3lpEI2359u
	vIw7uudQ==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWAY6-00065C-4U; Mon, 30 Jun 2025 11:11:38 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: Re: [PATCH v2] arm64: defconfig: enable further Rockchip platform drivers
Date: Mon, 30 Jun 2025 11:11:26 +0200
Message-ID: <175127468080.130313.8060207058865143134.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250626-rk3588-defconfig-v2-1-ae6720964b01@collabora.com>
References: <20250626-rk3588-defconfig-v2-1-ae6720964b01@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 26 Jun 2025 22:41:18 +0200, Nicolas Frattaroli wrote:
> Enable the rockchip-dfi driver as a module, which is used on RK3588 as
> well as RK3568 and RK3399 to measure memory bandwidth. For this, we also
> enable PM_DEVFREQ_EVENT, which is a requirement for this driver.
> 
> Also enable the rockchip-rga driver as a module, which is used on
> various Rockchip SoCs, including RK3588 and RK3399, to provide 2d
> accelerated image transformations through a V4L2 interface.
> 
> [...]

Applied, thanks!

[1/1] arm64: defconfig: enable further Rockchip platform drivers
      commit: edc4a9d1dc1669e42a35b2bd1b711a5da0e83699

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
