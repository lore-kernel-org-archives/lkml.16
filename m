Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7D41A0731;
	Tue, 22 Apr 2025 02:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745289385; cv=none; b=onPO3KYTpn0B3Mtp1qIou9nANZIiTkT2NIMSX4O72vguAdwQy5BYZTXdjeErBHC4lUtPPdLDk5fx0wWhCBlYyPwqF90ACWfCBSzSd5oVyh9R0tEcfbmSxZaXDrJdVBwglCbPdagFzEnWxlCgXJwYmPpAcABjkjOQAqfTR8dGZKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745289385; c=relaxed/simple;
	bh=sy8nvk+QMiViOJVzrlQUtLzfbrfwKTxt9ooWUhfWmjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwPLMr2RR9K60NJPrkqdl2XYSAMHAtpzKMOe0YjtquX7xnwrtQ2g/uDsruICXw2A4O3B+Nauj3lcxvfXCBmPjaUg5gXmNWt5FbRIcGq+oocKKpi8z2idShLxAHPel8N4jsnqWljS9N1pG04+u/x0nhL6mGPY8ZXmRziDnkaPZnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=hLFzrcJG; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="hLFzrcJG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ogTeyXmoSTch7ya0UA4kCFgEAyEUHB4VR6ZsyBwApbw=;
	b=hLFzrcJG/rzJJsH0xEpswY7/MqSL5zPrsEGhsBPRw6X8KrUza5SLenNi3OQONt
	wUz55311x2ssR7OUqYuXd6zqCeDYUVXxMV+ApH8Vj836JSGvwilbIE6nABYZZGam
	D5ub2n8RZ0oU01NYuedeJZaHCMK45YzVLU9DwuRvAn+gc=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCnT_qBAAdoUeSqAw--.61882S3;
	Tue, 22 Apr 2025 10:35:46 +0800 (CST)
Date: Tue, 22 Apr 2025 10:35:44 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, frank.li@nxp.com, s.hauer@pengutronix.de,
	festevam@gmail.com, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx95: Correct the range of PCIe app-reg
 region
Message-ID: <aAcAgIwdlCGIRzcB@dragon>
References: <20250314060104.390065-1-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314060104.390065-1-hongxing.zhu@nxp.com>
X-CM-TRANSID:Mc8vCgCnT_qBAAdoUeSqAw--.61882S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUa0tCUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERs3ZWgG8sFBngAAsa

On Fri, Mar 14, 2025 at 02:01:04PM +0800, Richard Zhu wrote:
> Correct the range of PCIe app-reg region from 0x2000 to 0x4000 refer to
> SerDes_SS memory map of i.MX95 Rerference Manual.
> 
> Fixes: 3b1d5deb29ff ("arm64: dts: imx95: add pcie[0,1] and pcie-ep[0,1] support")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Applied, thanks!

