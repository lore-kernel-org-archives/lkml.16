Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD4A288523;
	Tue, 27 May 2025 19:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748374003; cv=none; b=lX0yAVf8wSQOIBQ1gZTNM4Vl1AxNzac+44zT+kl7d7Cs79PCBxDPbMxo3A3A97DRwbwHl9ldvUgYvQ1fUZfwXiI7JTAm2DaplbcTxMxnl0LZ+Z0QHVlPf1MxRrEy6eAY+qAIw/SwcDYseJdWFvC8otLYa3G23c/6+JZvDDqNPlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748374003; c=relaxed/simple;
	bh=H6haHA7oSNBrFCJ0OSt8DikUNfMFd/tbzmvR4IC+64E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohOBvaMWJz8OLuYBzzTbbStIYX5pJ7Zc9JByxxNvxkHsa3fFTp2f5sZvsrE/HMlS+02JhUMQ2bNxL43ifuncDQUtGsfnsbGf994hcIyoZutU8QW3MmZVFumaJmA4VENt0u+fpC9nAdjioZzLtDiqhs5GsyW//M/Luj4zgZMALpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=trX4qoiF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="trX4qoiF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B6EC4CEE9;
	Tue, 27 May 2025 19:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748374003;
	bh=H6haHA7oSNBrFCJ0OSt8DikUNfMFd/tbzmvR4IC+64E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=trX4qoiF9C8t5p/j4u4YcLYkYnL27yW/TI0AqPQ9GaRcP+aNjqsPLtFuMgaYRmdv6
	 nfwl9k/ej8PF2kVo6WsC1ftd9fSmVE9tyrdCCfXxROGYqaZ1YtWQnR0QKpTxNOfjfP
	 fdI46iWQ/IKyJG8MkJpujd5I/UF5L4W61SsCKXZQSn+p2MziyIimuKiOfvMzOeaF/M
	 ygCjYrXzs7etE1yZEU1KFO70Bwe1Sjq5WmRGU7yGTPTx/XQrTYeIR5qbhBOI/zv0LI
	 1bdDPZl+CI5mEfgMByClEPxBtSGdCi+yg8f84hYt1Jrv7E2sNF9arDpcT+O55gURNZ
	 EWAxLLxvFaO6A==
Date: Tue, 27 May 2025 14:26:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	michal.simek@amd.com, git@amd.com,
	linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
	gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: usb: dwc3-xilinx: allow dma-coherent
Message-ID: <174837399989.1087595.10398541718787330529.robh@kernel.org>
References: <1747401516-286356-1-git-send-email-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1747401516-286356-1-git-send-email-radhey.shyam.pandey@amd.com>


On Fri, 16 May 2025 18:48:36 +0530, Radhey Shyam Pandey wrote:
> On Versal Gen 2 SoC the LPD USB DMA controller is coherent with the CPU
> so allow specifying the information.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!

