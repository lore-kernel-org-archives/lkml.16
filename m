Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2700B660;
	Wed,  4 Jun 2025 20:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749069027; cv=none; b=g6V5r98dXjQ2NzEdTpy8p84peaEmbHZR5JrtxO1HVhhnw/wh/z6R3hzAXmIuOZqEk3xQ/w9rciEUyQgwqas5JGzquowZprqsohqi425VGUUNhWazlD5UzRTciS308I02MYzCKGX7sYZMJnwSYr6M736l6wPRbpPRJK2GKmKZzzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749069027; c=relaxed/simple;
	bh=LhtwtfigN8JEw9i0rxsCWNRKRm3pIR9KXYnKVRzhQDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXD4LqhIuFRmxiff0RG9d50r1M2SOVFZ6ZB9M9WKM4BQGD67NAJYrCZT6gG1oreDj14g0gzsDgxxvGA/YfAqTGfYYc8pQBglhcCbfa0Evw3OwNfnt6k9YG276o+B6sWicPraWVXHgI9tKCHcJ8kO/QTvtz35M0oJErANFsuvXJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3NK2ujC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3NK2ujC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC073C4CEE4;
	Wed,  4 Jun 2025 20:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749069026;
	bh=LhtwtfigN8JEw9i0rxsCWNRKRm3pIR9KXYnKVRzhQDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3NK2ujC+1GVDKiRZ6teN8gSNhF8tO2TRhppHrdlfRlSfiNeuu9jI5VyUgF38Nba3
	 b0KddAlFf2U4HeU1Cs/izzo7cg8WVQ5vP3vT7aE6l6ip/ENGRjcofXz4RJEynYcq8F
	 nvonBhGL//OVTO6q678bagJ1WIRJR50ruQacSK/28yNKuua86DdsKkEoFV6swLqqjY
	 Ulb87MbBpm0SLBI3A78+zfMkuhfdR0OPdsDxwfhdj1LRSStXhvaQm3jBAS+A30V6fJ
	 CIHhYo4HVXiFEgO6gXi8H1M8pww/PATd+7VAlLPHdPgg/8WHnhZVzhlTTWWvr81HHM
	 ZR1lZushcOTmQ==
Date: Wed, 4 Jun 2025 15:30:22 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au, 
	linux-phy@lists.infradead.org, krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com, 
	quic_mrana@quicinc.com, quic_cang@quicinc.com, qiang.yu@oss.qualcomm.com
Subject: Re: [PATCH v4 1/5] arm64: Kconfig: enable PCI Power Control Slot
 driver for QCOM
Message-ID: <46r6cdcugwvyuvkjqbi3tq4f7ddkrgy4jut5fwqjsfwbsfoke4@upmtzhcmc7ni>
References: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
 <20250604080237.494014-2-quic_wenbyao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604080237.494014-2-quic_wenbyao@quicinc.com>

On Wed, Jun 04, 2025 at 04:02:33PM +0800, Wenbin Yao wrote:
> From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> Enable the pwrctrl driver, which is utilized to manage the power supplies
> of the devices connected to the PCI slots. This ensures that the voltage
> rails of the standard PCI slots on some platforms eg. X1E80100-QCP can be
> correctly turned on/off if they are described under PCIe port device tree
> node.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index a541bb029..0ffd65e36 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -270,6 +270,7 @@ config ARCH_QCOM
>  	select GPIOLIB
>  	select PINCTRL
>  	select HAVE_PWRCTRL if PCI
> +	select PCI_PWRCTRL_SLOT if PCI

PWRCTL isn't a fundamental feature of ARCH_QCOM, so why do we select it
here?

Regards,
Bjorn

>  	help
>  	  This enables support for the ARMv8 based Qualcomm chipsets.
>  
> -- 
> 2.34.1
> 
