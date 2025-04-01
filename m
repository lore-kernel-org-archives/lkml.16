Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2621DB13A;
	Tue,  1 Apr 2025 22:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743546112; cv=none; b=jOfkRQnJ7GBqtyrbLvKVeiBXVbB77Y0WHXasGzGgqP/i1EG8Ivcy506+R6IFT1Ign+4JsSp+GdFYg273YwutTguqNC3ekfSmlokmrl7KKYbzqShZml531w59aBKdglYDSDvljkkWdphFg5+nZ7REVLSRqCFCGzg1X6iu/mGeE2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743546112; c=relaxed/simple;
	bh=ENKysy1w5gXYqZNN3vEbRv1hbxW5lAmjngNmDqFJPAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mllxruPYpYETLbcCxlJes0jG9ZCB8lzd/8AC0MBDCew99vDLopVycfum/Qh5L8SRJs6D+dztwR8KU0CvxBA2o/IkhDjFofjAPSknaGu8LTwrHD8FRa8ytrZkdpP4FH3du4YtucNGx+haX7hl3/44CZmK+HPlRYdCYeLosZ7PvPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kn5LRtuj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kn5LRtuj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABEE9C4CEE4;
	Tue,  1 Apr 2025 22:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743546111;
	bh=ENKysy1w5gXYqZNN3vEbRv1hbxW5lAmjngNmDqFJPAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kn5LRtujRd0syaL524zkiotqAQiyuuNadY0yL/uSzkCntMS7DF33tHXFv3yNCtLyn
	 UqKwsy9MCLqTERNzOJ684np6ayYNooJTZ+j2OpR+9771xhjKs4sWL0iXVCUf8QNLX4
	 CvC5LLod5e/YOaYRitQTKgPK5Hx1yJveG6XSmRHxKw2d7BNHKYzl9KeG2qIMYJl5qq
	 K45xPbu7MDzv1JHlPhXSZ9l4IRKi2xyL86qr93p/dyE2CB6cJ+HXM8CGhVPUyrwplm
	 BiFMOb/H3FM2d8ruHW3JOc4cAAJyAlSSqxtRdWjtp7E3m7STV/zuL8PDqy7q/Y2lCm
	 q+kQw+kbvLAdQ==
Date: Tue, 1 Apr 2025 17:21:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 2/7] dt-bindings: firmware: Add i.MX95 SCMI LMM and
 CPU protocol
Message-ID: <174354610735.4103067.17720099043816826170.robh@kernel.org>
References: <20250303-imx-lmm-cpu-v3-0-7695f6f61cfc@nxp.com>
 <20250303-imx-lmm-cpu-v3-2-7695f6f61cfc@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-imx-lmm-cpu-v3-2-7695f6f61cfc@nxp.com>


On Mon, 03 Mar 2025 10:53:23 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX SCMI Extension protocols bindings for:
> - Logic Machine Management(LMM) Protocol
>   intended for boot, shutdown, and reset of other logical machines (LM).
>   It is usually used to allow one LM to manager another used as an offload
>   or accelerator engine..
> - CPU Protocol.
>   allows an agent to start or stop a CPU. It is used to manage auxiliary
>   CPUs in an LM (e.g. additional cores in an AP cluster).
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../bindings/firmware/nxp,imx95-scmi.yaml          | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

