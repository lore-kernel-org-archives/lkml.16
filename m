Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36F33C01;
	Fri, 27 Jun 2025 02:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750992099; cv=none; b=e2eQE7Al8xw7MFiDG0Cdg++ImOHHzdB5PxqD1VEp6ky+lwFKi4u849VvqV85A/YASHiex7mgdZT8d/ilxaHnjBvR7sBKdpTlhtyhWXlFOqJmRvkl6vaa6qDQ263OGElkNRuUY7zdHkAlZLmX+eSn+LZI5OhpQLdTwtcLloJM+bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750992099; c=relaxed/simple;
	bh=bjSC1GOvCkB3dcQCEkA48aQBF8HgMA07pqD3eC+Cjm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXuDVjDOqAKjO1KL9Azq1IKLwZW80iNelQolPjsb7ZchiAu8xE5BYz+TfgKDJER7pBV8ZAmX8DaVx+bXYn0eEdZzqpSbqs03uzYtYK2FdE+2uf3CqYoxNIJ7UXUj7kbQp/Nz3hf/FywGqdenwBIcPtIeRgxlctgYpy4X6Tmjy5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bgDrLief; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bgDrLief"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5433AC4CEEB;
	Fri, 27 Jun 2025 02:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750992096;
	bh=bjSC1GOvCkB3dcQCEkA48aQBF8HgMA07pqD3eC+Cjm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgDrLiefS/HPpb+VmjhqWsF1t3ouj5zOZkjYUHLP+B8J2HUb/gBySwAzVAc42xaKw
	 YyYUfVbsiQREy9qluLwAfs/5IbNOKQFCw9OiG/mRW3V6ixjSPvS+ARDiYfxUlHAxd5
	 AyE5/GuwZ9VvD+2/OfNjWd8gezTvHMvNSDYlw+MK8WcCq7C8+VRI3qaIeH84gqX/pW
	 /wTIa7k/khFtDOVEBoBxMaMRZ4FLtj6wIt+Er7yPQmvzx0MX9qYRsC8rdl0hlaPajX
	 vh93FlroEXR6hjnJrR9Z12SRUzeRIWAS+1mr30IB99Ap1tdnpN0DQx2fbhfskjebJU
	 nz/XvJyHxj2rA==
Date: Thu, 26 Jun 2025 21:41:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	git@amd.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
	miquel.raynal@bootlin.com, krzk+dt@kernel.org, richard@nod.at,
	amitrkcian2002@gmail.com, vigneshr@ti.com
Subject: Re: [PATCH v14 1/3] dt-bindings: mtd: Describe MTD partitions
 concatenation
Message-ID: <175099209513.1650937.6817719319563715561.robh@kernel.org>
References: <20250623105445.2394825-1-amit.kumar-mahapatra@amd.com>
 <20250623105445.2394825-2-amit.kumar-mahapatra@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623105445.2394825-2-amit.kumar-mahapatra@amd.com>


On Mon, 23 Jun 2025 16:24:43 +0530, Amit Kumar Mahapatra wrote:
> The AMD QSPI controller supports an advanced connection modes called
> Stacked mode which allow the controller to treat two different flashes
> as one storage.
> 
> In Stacked connection mode flashes share the same SPI bus, but different CS
> line, controller driver asserts the CS of the flash to which it needs to
> communicate. Stacked mode is a software abstraction rather than a
> controller feature or capability. At any given time, the controller
> communicates with one of the two connected flash devices, as determined by
> the requested address and data length. If an operation starts on one flash
> and ends on the other, the mtd layer needs to split it into two separate
> operations and adjust the data length accordingly. For more information on
> the modes please feel free to go through the controller flash interface
> below [1].
> 
> To support stacked mode, the existing MTD concat driver has been extended
> to be more generic, enabling multiple sets of MTD partitions to be
> virtually concatenated, with each set forming a distinct logical MTD
> device.
> 
> A new Device Tree property is introduced to facilitate this, containing
> phandles of the partitions to be concatenated with the one where the
> property is defined. This approach supports multiple sets of concatenated
> partitions.
> 
> [1] https://docs.amd.com/r/en-US/am011-versal-acap-trm/QSPI-Flash-Device-Interface
> 
> Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>  .../bindings/mtd/partitions/partition.yaml    | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

