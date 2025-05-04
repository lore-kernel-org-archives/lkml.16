Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA8E1714B2
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 10:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746356400; cv=none; b=eCMjrqgJQl0MpCNwHQajxJeSxmBLWf4OWwzox5eNUd1DdOekelebquzve6QHgvyjgvm/GTSsWg6DhWE1E7mxOVixhQ4jhFWRGt0BEYXe+KlGNEAXcc8vjIE30WUjfzxc3IwTTOQJ19L4xU31yjzZDjDtryygEPXbzKzsyfHTN3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746356400; c=relaxed/simple;
	bh=x31lcEfp0IJsJ3F/EK623QRfpU6IDaVlCDAYr/kCBL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hbxK4VdUwHGYWko+90d7e77pwRf6Emzgs6F3AohOFTgaq64jubY3QcfxISPf8eFbCVR1y+rMD8deGdye/CJFAj5JMoCbs4wVbH/eeFOZXQ+bPASWWZD1XQj/kHSor70wz3cr5RPY9VhDVE1+2tK4vFM/noZn48UwpL3ZjzByYWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=PLfJmqnp; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="PLfJmqnp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=64co1eXVWvwVQ0SXBQRdrG1hF0s6ABk2TT7nEdEkzcQ=; b=PLfJmqnpH7GgOAYizSRYexRD6q
	7CTvTq02aWc+kWA0UNK0pYYcQC6uxpUEk9sPjKR/Zq4useSWVkpoYUC/bpMK5sMia9EPCmSytFlaL
	TXpUDaYPjQyv6OZ/j0BzLD9kptZOrvc9S8JkeMp/zSJsJfy4gqJKvumM5Rx/1o56TsJomqA0daL7B
	/dmnsknbeBYytwGz/ahGFaJjEipR8uFXzh/JM/T+ZD+LVC2oShnfE/xgC7ePr7TTbpUGYZ5XpZTwi
	hHXAwGpsyotPRTh6rbixgvycQEWTYgl8ouGom8hZKFLNd3QmTXkbBj5dCsE5kkSt8ae2Ls1d4wIsG
	BsObRYgg==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBX4X-0001M5-39; Sun, 04 May 2025 12:59:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	mripard@kernel.org,
	hjc@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: rk3066_hdmi: switch to drm bridge
Date: Sun,  4 May 2025 12:59:38 +0200
Message-ID: <174635636711.1068615.11742267656925492318.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250428102309.1501986-1-andyshrk@163.com>
References: <20250428102309.1501986-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 28 Apr 2025 18:23:07 +0800, Andy Yan wrote:
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
> 
> Note: I don't have the hardware to test this driver, so for now
> I can only do the compilation test.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: rk3066_hdmi: switch to drm bridge
      commit: 57d6811e8a6d179aeadb7f102369d1ddefe5aae0

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
