Received: from mail-8140.vip.163.com (mail-8140.vip.163.com [60.191.81.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99574288A8;
	Thu, 19 Jun 2025 03:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.191.81.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305107; cv=none; b=ID4xMTP66cqa7nRWrU8DAoZ1fnqwX+AKDUjZiSpNaHwureAU58iEMAqWYmzPiZrtah7pGMy3y57cSC4GuXvZK6xix38bS2mA7NIcNJkauAoi7stUmp/P0BPnWjnl5qklPo98d8LVgKN/zBPB1F2u+cpHhvfLWbXfcYgq6QRZ5K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305107; c=relaxed/simple;
	bh=UOXZ/9Qqhg7zAYs2EA1v1QQ+eg4qXw0ZMcpcblOZGhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCE3+q3zr1yEsZU3Fs7aj0bEXP7M+gSu729HtcxRFfKR/87l0B+HP4bifNPcUdEDOK+JgUGdXJqVBJIK54DMt6kQ88HEuBH62H/wc/AoEyR+oF3cvx49bZWhbN6lOlc0BTbcgkyah41QwFt+5EDr28bSysXYaDIno/K/wOIVVJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=qZYWEZg6; arc=none smtp.client-ip=60.191.81.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="qZYWEZg6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=QrU1Qp/eZd7ALHelvjCOtCIA18zLzIZINJNIAtGn/KQ=;
	b=qZYWEZg6XxqmoHJM63m7/I/H/0S+PJmR900cv7AEWqOh2POm/c41bgYYtAF2Tj
	0JfNxbkfsUkgk0+ocZDzn4/sUXD5yT53HNek3YD6rQeHkJmx+1cVrltPVrHLNQg+
	rvwMxtA0xNMCElpMViQYrUmC9no1pzDq1iiWeFnVn7RXQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgB3d86ThlNoRUT8AA--.41655S3;
	Thu, 19 Jun 2025 11:40:05 +0800 (CST)
Date: Thu, 19 Jun 2025 11:40:03 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 1/1] arm64: dts: tqma8mpql-mba8mpxl-lvds: Rename overlay
 to include display name
Message-ID: <aFOGk8V6PkuEg8Xl@dragon>
References: <20250408140856.1143290-1-alexander.stein@ew.tq-group.com>
 <2788842.mvXUDI8C0e@steina-w>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2788842.mvXUDI8C0e@steina-w>
X-CM-TRANSID:Ms8vCgB3d86ThlNoRUT8AA--.41655S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwmiiUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIRW1G2hThpWGgwAA33

On Mon, Jun 16, 2025 at 03:01:06PM +0200, Alexander Stein wrote:
...
> any other feedback on this patch?

It doesn't apply for me.  Could you rebase?

Applying: arm64: dts: tqma8mpql-mba8mpxl-lvds: Rename overlay to include display name
error: sha1 information is lacking or useless (arch/arm64/boot/dts/freescale/Makefile).
error: could not build fake ancestor
Patch failed at 0001 arm64: dts: tqma8mpql-mba8mpxl-lvds: Rename overlay to include display name

Shawn

