Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24CCC134BD;
	Tue, 22 Apr 2025 01:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745285782; cv=none; b=qOxAKMLjsMMigJg+vQ4nuz/S35gieIXa5iY19H5ll3VPSFzS3epA6nAa4W6SNuqgMFDoTq+VniVggA6G/MMGgP/V+3bzSkbLl8MXJWD7kKECqBLwk97E69sk1c3h0ZqeHg9NfGNsuxdRStGG8TJhbhoeHpTNXlC2XkJsOwmxt4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745285782; c=relaxed/simple;
	bh=UK16GNtJjRoAnRpT2SiUt6xwvtv6lMuhrmao9m8+gSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgaxPGqJ2fpdXo0u4h/hcwq7aNDDbBYyKNfcyLsKaIq1jWcRqYkfOxf2PZr569PWN43m2H6ExbBfoXX0RkA3RhCrp/enDgEaiJkxHspZHrYlNXVbgHZn4PXhpym2weKlJNXKWCBq6uxYaMVkdQhlpom4ydD5qZfsL/ymQJifwr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ccggECoI; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ccggECoI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=sgqQbcC4Ac0v2YdyZ7o/7PpW2o0/Jn3QFWS121gTOFM=;
	b=ccggECoIV5cjU/T7WXevp9cZmZ2ebAt/jWpnx2F7PCBHiz0MlPgvTLRPf+JRMj
	e2nQVZFfsvKxaG4mYNBWi5c5rSU1jjqptuZ/UbgjinMSXg5qKGSczsBVgmgfkrdt
	gWdYZlVA9U2i4iedmoBpO9qjSvak3/kuD7TtP5oJO6zUM=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgB3b06h7wZoBuypAw--.471S3;
	Tue, 22 Apr 2025 09:23:48 +0800 (CST)
Date: Tue, 22 Apr 2025 09:23:45 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Andrej Picej <andrej.picej@norik.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, marex@denx.de,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
Subject: Re: [PATCH v7 3/3] arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set
 lvds-vod-swing
Message-ID: <aAbvobSqxSLt+uFC@dragon>
References: <20241216085410.1968634-1-andrej.picej@norik.com>
 <20241216085410.1968634-4-andrej.picej@norik.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216085410.1968634-4-andrej.picej@norik.com>
X-CM-TRANSID:Mc8vCgB3b06h7wZoBuypAw--.471S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcTmhUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRI3ZWgGsHT8JwAAs4

On Mon, Dec 16, 2024 at 09:54:10AM +0100, Andrej Picej wrote:
> Set custom differential output voltage for LVDS, to fulfill requirements
> of the connected display. LVDS differential voltage for data-lanes and
> clock output has to be between 200 mV and 600 mV.
> Driver sets 200 Ohm near-end termination by default.
> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>

Applied, thanks!

