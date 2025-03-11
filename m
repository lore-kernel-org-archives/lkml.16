Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D921E0E13;
	Tue, 11 Mar 2025 03:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741662331; cv=none; b=n7PIwQIw9YOl5yb4ctk74T9V+n6iPXwYVrQ13nql1vcHqsWt7nS+z/rPoWHZczqgxKWV6WeUIXTZUMh/CEB3CBv+8tYNAMco14FNGhkrrdS4PuCl14KalE9718PwxlWVusxxqYl02cfKv6hTqe39qR40mXLStLRj/G955tfwxAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741662331; c=relaxed/simple;
	bh=k1AM/tx5i9UVNsWJPGpBjxY9scccDHDit2MUSg4JkBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MB23XoBRMa26tvydmRmJ/O0DmhWG4fj7N9XIJGv6eRbltV4v71zKssGDs9wAphTgstSZiHZDZjzj9iUsuxb0PveF12AFaOIRdEqY9jwdryi6LshQ3QnrUkzarSep1bcaHURgRO/Fjc5HUb/09urqhHlISwjwnsZcEnKCMdiEB+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=IrsYn4zp; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="IrsYn4zp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=2ZDiTxBYo3ZyyWN3X3Z5hKEwsvfLP5Vn1/SvMYumTaw=;
	b=IrsYn4zp4+0mw7TVf43NqjNeiXSYfSlzXTAZxDMTVojxnHx0wegJnZiffevyeF
	GxK/zyytQELZ6IaimHsY7JVaNUA4PL7X+FCUJO73Y++QD66ZBsBJ+U8MRDoSXn9D
	G1QOal4WXjxdT8bevHNxZ20xqDsfhwalUPQyiz5LeYgMs=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBXVUJVqM9nUs60AA--.48820S3;
	Tue, 11 Mar 2025 11:04:55 +0800 (CST)
Date: Tue, 11 Mar 2025 11:04:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Adam Ford <aford173@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT
 freq. to 800MHz
Message-ID: <Z8+oVEFcKCS8n6em@dragon>
References: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
 <20250226164513.33822-5-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226164513.33822-5-laurentiumihalcea111@gmail.com>
X-CM-TRANSID:Ms8vCgBXVUJVqM9nUs60AA--.48820S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrXryxGF1rJFy8uw17Aw18Xwb_yoWxGwcE9r
	4UtFyYkws8Wa1UCr1kAr18Xay09ayjyFWSqrnYqrsxAF95tw1DJwn5uFWkJr4kWF1xZw1r
	u3sxKF4DKr13KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU08hLUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNRcNcmfPqFf+BwAA3z

On Wed, Feb 26, 2025 at 11:45:13AM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> AUDIO_AXI_CLK_ROOT can't run at currently requested 600MHz w/ its parent
> SYS_PLL1 configured at 800MHz. Configure it to run at 800MHz as some
> applications running on the DSP expect the core to run at this frequency
> anyways. This change also affects the AUDIOMIX NoC.
> 
> Fixes: b739681b3f8b ("arm64: dts: imx8mp: Fix SDMA2/3 clocks")
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Applied, thanks!

