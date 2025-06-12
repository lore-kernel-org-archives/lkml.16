Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E90C23D280
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734276; cv=none; b=US8vgLBomXJ0RzGpMoxrp1ifLWxDup3WPWTb4kVr0k5GS7y2Gfeo5gqrMwjnQvT6ZUg5CejMWDs+/4aqjXSk2nNwqd5f156uSo39nKcGLVOepudfoY0omiPaGQmASajjzbOG2ituBeJ2goffWiRCB8367BtYJ1LMcLxyabvShJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734276; c=relaxed/simple;
	bh=VabmgeLdDt1I8mhmTB5n9mUn+CV3HPyXX8NyFbEoGN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdvrtOysdoTwG8N6JcQVbm3Wq83NTyi/1x5Zt+cjQQsNKcrKoaeC+IGIOUqNDW8EdJXwPyKpm33/j5f8JJK6PtaZ+W5eSGP3VphNbViPjiku1loatXzym8Nkt9tQJRTT1zuuX4uZSd67Av842uQozFifJBVB+etUUm2LGRTnSLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uPhoJ-0003C8-Ji; Thu, 12 Jun 2025 15:17:39 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uPhoJ-00389N-0z;
	Thu, 12 Jun 2025 15:17:39 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uPhoJ-008vXx-0a;
	Thu, 12 Jun 2025 15:17:39 +0200
Date: Thu, 12 Jun 2025 15:17:39 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 3/4] arm64: dts: imx8mp-nominal: Explicitly configure
 nominal VPU clocks
Message-ID: <20250612131739.w2u3olqliiipxzl6@pengutronix.de>
References: <20250612003924.178251-1-aford173@gmail.com>
 <20250612003924.178251-4-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612003924.178251-4-aford173@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On 25-06-11, Adam Ford wrote:
> In preparation for increasing the default VPU clocks to overdrive,
> configure the nominal values first to avoid running the nominal
> devices out of spec when imx8mp.dtsi is changed.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
