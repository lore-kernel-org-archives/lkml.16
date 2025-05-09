Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0DE225A50;
	Fri,  9 May 2025 14:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746801674; cv=none; b=grKbKeeK52J7ll7AboNUbeI9octgYLclee7DRERopF3QcpTIWrSRa0Oi+YcpmSWowwG7HjHdAeJf750msnZy5nBMjYpY5JRhjy0OyK2NFdfTrtmHAaASBvJ5PF2S84gzFWGt46B1u76nnbl0fCP0LK9LOeJfPYwrBVNT5bpku9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746801674; c=relaxed/simple;
	bh=1Bb8xF5ZUtAqzAYX+MCnhk8JufnOu8YhLs1oNq47D4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HAaSZEzwvIix1G7iy+VoH3kfDRNdf1HetFy/GUBfgX9s9cgUgsUyIpDTx5o5RSnwgKtYgJETfn/e3XrNWo7GSBCXp/oaFLtkC/kCUX0lDEv4ydO+DpjQ5lm3KZ8ZBqA6UtUMeVdeXE0lNQC64UYlfv8hOxukWuJBK4EcBA3WXdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=cfr8GOgm; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="cfr8GOgm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yUwQFda+RlFIMXKiIF4g+n1LDysyAUbuSGkjmJu59Ic=;
	b=cfr8GOgmFsA2xfLB7tC4cs6pXs2TEJkPJLkAcTW6VwZd4EUlbSUtIe7stkK96p
	WSOCOj7j5rsObTdgRkl2E0mHplt13wrUI+YDKamzENgs/WjV/0lloc4rrf+mVtP2
	ZiaorTCC6rhl39ewTp7s9FnCZGHgAR/iJ3jYhol/d4NHI=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDn7xPQEx5oH32oAA--.41579S3;
	Fri, 09 May 2025 22:40:18 +0800 (CST)
Date: Fri, 9 May 2025 22:40:16 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: imx93-tqma9352-mba91xxca: disable Open
 Drain for MDIO
Message-ID: <aB4T0Jaz2VJk07hF@dragon>
References: <20250430081849.1827688-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430081849.1827688-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:M88vCgDn7xPQEx5oH32oAA--.41579S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU8mhFUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCR5IZWgd36zXkwABs5

On Wed, Apr 30, 2025 at 10:18:48AM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> Using the MDIO pins with Open Drain causes spec violations of the
> signals. Revert the changes.
> This is similar to commit 14e66e4b13221 ("Revert "arm64: dts:
> imx93-tqma9352-mba93xxca: enable Open Drain for MDIO"")
> 
> Fixes: e5bc07026f94 ("arm64: add initial device tree for TQMa93xx/MBa91xxCA")
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

