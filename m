Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA6E289E06;
	Mon,  7 Jul 2025 08:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751878134; cv=none; b=QhrMqnRQF/Hgzo80SPj5OLpJ+LxkjQTGS6uugb9sIbNL0juzG2X8mOFnb/eqnNM5IpCcOsWuXJMEDgHFMroU+s+nxrXL3/il8aWACDoBevhQo8NHav3BJdazkXxg7DBZWf/b0lLUiNJKBkwbk/q+I1JrJ4qlmrS+145Ur0CvjL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751878134; c=relaxed/simple;
	bh=8GOuvJHlpfF2H93tp0/GnEbJbLEophOgCwLRLkTuA9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imQJyJI0ALzhMoK0/ZiFtUgtOMzM6WQ2wY4LUbXWBW8q6fVNj1H3tHTKWrjJE+t0orK+AcBQu30iMm3ECHyFuxKyTGpWdZS9HFaRefUhnGvJYURiYbaEOVcbQvDVj8IFQ6mqyHM0aTVjooBmPstTwKXcfN+NJ35soRxx/hJwvjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=o/ebLf8s; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="o/ebLf8s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=TsPbG2sxHkzvuTHXqj1JiQI2+sOYq53q88gbM13lipQ=;
	b=o/ebLf8suS5RR8N+OU7tt48i8ubjqk2zS2pmotDdF/YH07Er7E+V3M1vpvEiQq
	vGeRiHF1Oa2tQBxO/7+X5fbkNwd9yZjpACpVNZpMd2HLFHL+w1kph5whvPLxAA/g
	OgiBBbAInh5K2agkFVed3uUGzkYdb9PqwNZR6knTSvO+A=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3n_XOiWtooSc9AA--.39027S3;
	Mon, 07 Jul 2025 16:48:15 +0800 (CST)
Date: Mon, 7 Jul 2025 16:48:14 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: fsl-ls1043a: Add missing DMA entries for
 I2C & LPUART
Message-ID: <aGuJzj1BZ5P-P-mE@dragon>
References: <20250701062157.514969-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701062157.514969-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgD3n_XOiWtooSc9AA--.39027S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU5nmiDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwCDZWhrVSm7qgAAsD

On Tue, Jul 01, 2025 at 08:21:54AM +0200, Alexander Stein wrote:
> Only i2c0 had it's DMA channels configured. Add the missing one.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!

