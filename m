Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE82217F33;
	Thu, 19 Jun 2025 07:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750319141; cv=none; b=nljMnhcmyR7GwQYxyyn0o3QfthYCtLN2COD93CxzBcaQcBnWXZg2ypZgiwu5R7duLKxMC9OEVSojwSyObeuiyvtxrH61RlFwlk0NqgnatpvLUs9QNOQtlx7i5g0Xcj2TrjxoRMqgwvzJVYMFOgg/Q/avBUptN1IKY/BXlsZ6sY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750319141; c=relaxed/simple;
	bh=TVnLssqvnRI6IN5ZQHYm4xd4Z7Fj2fRXQg/Mq/rwciI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9HRUp32CD0EEfIOQzmW+1rE9ZJC/7EdTlebvYNGNeXuyhEqhC++oZk+zMM3xCxQjQ8WbqbvIg/4Hk9FHRB+eL/C+bSPlxSVt2wEy2s+j7tAQ9dr8yLrPs0d/Mr+RLqtWDgZ3Pc3H0kmzuifblLlSFE75CpkgQG1Uf4bCzJxr0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Eqdgg8Q8; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Eqdgg8Q8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=lP+gDKbQezxIlLFIgSMniGFSlc9jyFMOUqLPioyqDrc=;
	b=Eqdgg8Q817fHZeYYBrEIlLTPQeVYz4/zCZenXNr4OoOP8qvZs3jFdXqIuV5NAs
	K86cQh/nHFIggB1eF68Do1jGdeNFFKU4X1L+KWVkN3PhBxmt9r+ACDStxy+YDL/Q
	quqNDvrtzgXw6Di/Lr9Qg/UUvdR6LylxufJUuqJaV5HGk=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3R+v0v1No6CEAAQ--.2185S3;
	Thu, 19 Jun 2025 15:44:53 +0800 (CST)
Date: Thu, 19 Jun 2025 15:44:51 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:ARM/FREESCALE VYBRID ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/6] ARM: dts: vf: remove reg property for arm pmu
Message-ID: <aFO/84lEFST8s1PZ@dragon>
References: <20250523161726.548682-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523161726.548682-1-Frank.Li@nxp.com>
X-CM-TRANSID:Ms8vCgD3R+v0v1No6CEAAQ--.2185S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzOzVUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARZxZWhTmlaLjgAAsx

On Fri, May 23, 2025 at 12:17:20PM -0400, Frank Li wrote:
> Remove reg property for arm pmu to align binding doc and move it under root
> node to fix below CHECK_DTB warning:
> 
> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: pmu@40089000 (arm,cortex-a5-pmu): 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied all, thanks!

