Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C27A3D6F
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 03:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751254015; cv=none; b=icr6KrnV+FAu1DO6zuilpLikUi93Dbvu4J5hXZPY5xDx0QNm/DbLP48dP7FRdBiRR6fw9kmgzb3E2RBQjcklLNEr0J0q0INsI22lnUk+rGg+mYz3rELQxPXLhLPo6K/wWil4MymOCZcWBSzbhlERNDwt3edcGxDJx1GpXjlZqww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751254015; c=relaxed/simple;
	bh=Dh2yE1z46RolPA7MbJbXtq85VmKVOADezty709H/p3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhaVHPJsJ75dGhyA9QeJuqRPSg8DoUNc66udUlMSwsv0fo/FodVZ4QWODNXBGamTuvneUohxNLkPecQBatHiiQA+/WRLrb/ZzrpnZ2ctSDQwbRic34+Ev0qEwrIwNiFgW3/rNdGI4OefRfoqIlbpcdZpqPN68EsruCajNoDOQEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=BG8Ue+lJ; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="BG8Ue+lJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=S56l5YgbFni9hTKvZE0TP502vTxV83x72Q+y/UQjQbg=;
	b=BG8Ue+lJLgjcvcB595Zv5YFfQBJ9gecUI7cUOsNWGwmo+9NyeH0VIEtrZX07GD
	rtcalaLiXDNJR77EQsBuRxYC+y47Jwn6W3wxIwzjo7Hf+wzOa4xKWTwHcEyaBngI
	KiPcbWZTv3XhdoiHjXYttcCR6hEb4TF5clwTB6vbTEoXM=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDX_2nXA2Jof_klAA--.52781S3;
	Mon, 30 Jun 2025 11:26:17 +0800 (CST)
Date: Mon, 30 Jun 2025 11:26:15 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev
Subject: Re: [PATCH] MAINTAINERS: add NXP S32G RTC driver
Message-ID: <aGID171pJ6TYykwr@dragon>
References: <20250526163259.2470550-1-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526163259.2470550-1-ciprianmarian.costea@oss.nxp.com>
X-CM-TRANSID:Mc8vCgDX_2nXA2Jof_klAA--.52781S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RACzuDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIBmpD2hiA9mxgQAA3-

On Mon, May 26, 2025 at 07:32:59PM +0300, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add the NXP S32G RTC driver as maintained so further patches on this
> driver can be reviewed under this architecture.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Applied, thanks!

