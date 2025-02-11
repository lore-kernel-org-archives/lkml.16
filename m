Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D825433D1;
	Tue, 11 Feb 2025 08:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263900; cv=none; b=aRXUunIo5eXN/TPdpKZ9uhelnMOD+VoWMBgFWKGNZz4NiMPwkU7GGww6lyI9GfeV2LE5yB8JAjQ9sNHatjpVaXSGbN+3v4QBoq0BWnr8pvSguLuo/Uijp+lswBIvE42ruJyT8HQ3RxFIBtMb/0FjjV6lpRwYMNt102BocifcP48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263900; c=relaxed/simple;
	bh=eOPO83AAnK7qaxbWGuJmVjYl1Y7P9lyrHi7c4QOLoRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GANUHwvSRYXMv8AptZoIpoxYgL7NcDTQcov/QjzkC3nqXqf+5s2delwXyFEuRH0/rAj22nkpOyKd8oUcTKT8MQZE1CKiu2+PChIiAbrdHM1mow+rbTTSsFcNFLvXmtRUadppyTCsIFg5Zjjk95H4wUN6s/2Ucz95QAlg+JB0u5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=juabvy6C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="juabvy6C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E44BC4CEE7;
	Tue, 11 Feb 2025 08:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739263900;
	bh=eOPO83AAnK7qaxbWGuJmVjYl1Y7P9lyrHi7c4QOLoRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=juabvy6CxdtKFyMAz8/MpNcdmC+fRvUUuNhdKqY85o+4tw+7BCB+07bjAx/TQmWcq
	 zguONRFF4qopqCi5OvDSthYbS9Bo7hvFBfsxIKawTw6JmsxE7tp0ff0vGDUR9kDMzB
	 c1t6fhw/7eCmCqxXVkqJN0B5eFebQ4e7sR4vj1UweGFDFEvSa7armSUaf9DNqtsX8t
	 g+LixgVRFlwvbFydKpkwSs+YFVV/esCvLvstfk5P2YEQNMwLd9xyp4KEDbZkS8yQwL
	 4KnGpyH1uEQsreGCSMH2Jj7GUacuu0X8CGlHpZc6eugeDEhe9ToSaZZynp+5ewQOCT
	 FMYdyRzFSuCrQ==
Date: Tue, 11 Feb 2025 09:51:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: niravkumar.l.rabara@intel.com
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, nirav.rabara@altera.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: socfpga: agilex5: add NAND daughter
 board
Message-ID: <20250211-poised-rugged-chicken-b2b995@krzk-bin>
References: <20250210074604.2410783-1-niravkumar.l.rabara@intel.com>
 <20250210074604.2410783-3-niravkumar.l.rabara@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210074604.2410783-3-niravkumar.l.rabara@intel.com>

On Mon, Feb 10, 2025 at 03:46:04PM +0800, niravkumar.l.rabara@intel.com wrote:
> From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> 
> The Agilex5 devkit supports a separate NAND daughter card.
> The NAND daughter card replaces the SDMMC slot that is on the default
> daughter card thus requires a separate board dts file.
> 
> Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> ---
>  arch/arm64/boot/dts/intel/Makefile            |  1 +
>  .../dts/intel/socfpga_agilex5_socdk_nand.dts  | 89 +++++++++++++++++++
>  2 files changed, 90 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
>

Reported warning comes from existing DTSI, I think, so:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

