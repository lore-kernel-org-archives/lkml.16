Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A11221544;
	Wed, 23 Apr 2025 09:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745400266; cv=none; b=dP9t8xfX/UNK56SjEVWAXxzYI6IhzvBfHid6YghiW7kLg21hZLfroiUFfiUvvcJH2w3rBQpaHplOCCqSPZTSdjzd9Ef8Qq4+REiDhkt4bLA5jYbqhy2Y2LHJGvVL9QVckDL2FZ4ebTPGQf0R1MyOIIH0GK3M8JE3aDzVKCPiid0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745400266; c=relaxed/simple;
	bh=/TK6dYohnxPVOCX5XOy1ctV17fkwSd4+QVYkCJob5BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CN1JQv3/OiT3NN/DTyElpDk5MyiUc/+3iCp/o4N2Y21Sa1d9Q16pToQ3btm/mrT7i82AzlN+s9lQlLSuC+7ZHHbztaOQVxF+TJVIj2ZU1wkCe8NZRaoy8k48taC2b/CyYvZaxmSIQf5szP9CNKZY0/8rjBh4k0ZADoWOUxil+A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=BziGxj42; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="BziGxj42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=mk6+yO5lZuVxi5Kmo5/UufFhj1K1prW5eaKtcGD0tz8=;
	b=BziGxj4275mC1kdFACZMSlMJN2yTcVxUFQc0xfXdT0H/hnZWWGUbD2U8CNzghE
	FiW8sfnjS9mslu0kK2GbQvg3vDvlkJnv20nFv5LfzomkdJd77eyZjKrt3hHlXs3p
	zFIpKUbb0sCNZ5DCXf8Z3Vasjzps+BR9MFIBKYAtuoKUQ=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnNYyFsQhowhu5Aw--.10561S3;
	Wed, 23 Apr 2025 17:23:19 +0800 (CST)
Date: Wed, 23 Apr 2025 17:23:17 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hongxing.zhu@nxp.com
Subject: Re: [PATCH 0/8] arm64: dts: imx8: create common imx-pcie[0,1]-ep
 overlay file
Message-ID: <aAixhV/TS/eZNHKr@dragon>
References: <20250331-imx8_pcie_ep_dts-v1-0-270ef0868ac9@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331-imx8_pcie_ep_dts-v1-0-270ef0868ac9@nxp.com>
X-CM-TRANSID:M88vCgAnNYyFsQhowhu5Aw--.10561S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrWDJFWrZFy5KFyrKw4Durg_yoWfuFX_Cr
	45W3W8X34UGw4fJ345Aan8uFy2g345Z3y3WryrWw4vga4xXFWavr4kJr1rWr18Cry3Grs8
	CFn0qw1fX3WrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8P73PUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQw4ZWgIdnnrUwAAsP

On Mon, Mar 31, 2025 at 03:02:38PM -0400, Frank Li wrote:
> Frank Li (8):
>       arm64: dts: imx8: create unified pcie0 and pcie0_ep label for all chips
>       arm64: dts: imx8dxl-ss-hsio: correct irq number for imx8dxl
>       arm64: dts: imx8dxl-evk: Add pcie0-ep node and use unified pcie0 label
>       arm64: dts: imx8: use common imx-pcie0-ep.dtso to enable PCI ep function
>       arm64: dts: imx95: add pcie1 ep overlay file and create pcie-ep dtb files

Applying: arm64: dts: imx95: add pcie1 ep overlay file and create pcie-ep dtb files
error: sha1 information is lacking or useless (arch/arm64/boot/dts/freescale/Makefile).
error: could not build fake ancestor
Patch failed at 0005 arm64: dts: imx95: add pcie1 ep overlay file and create pcie-ep dtb files

Could you rebase?

Shawn

>       arm64: dts: imx8mm-evk: add pcie0-ep node and apply pcie0-ep overlay file
>       arm64: dts: imx8mq: add pcie0-ep node
>       arm64: dts: imx8mq-evk: add pcie[0,1]-ep nodes

