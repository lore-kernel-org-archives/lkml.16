Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51393272E50;
	Thu,  5 Jun 2025 13:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749131254; cv=none; b=HcGjHh6kh5cLPiPOpn/WN+ekjY+qGiJnTFkDbCZpThAWTsO/i/hPWn8sf8z0E21d4h3gUVYI8jUNb0FNmvzRB1ZWBC7pGt7VxkCepC2h25DncTW9fxtsULyU8+3rbBVKV0XLNa4KX31APTv+/JDgvPMMHHllxTdIPW0MVn1ST5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749131254; c=relaxed/simple;
	bh=E9UAI5/sHcwgTTNJ9bwD0qg+BJ3oUIA5vyBcIyxvHu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHyvDxvyQ/IQz/WvOWpaTzBDrWX3l5NP3U/RppNDmmHR9hmIocc/7XehXcjsCklankFTpt6ryyTd0hQyIRwjy88A117FeuDROU2kjazSqowzqeGGNAqRI66nD2ThiweAwtZVOKvHFMrPnDwHPTt0+umFoOqdTkAL7scW+FWa/7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jmdri2IO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jmdri2IO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8273CC4CEE7;
	Thu,  5 Jun 2025 13:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749131253;
	bh=E9UAI5/sHcwgTTNJ9bwD0qg+BJ3oUIA5vyBcIyxvHu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jmdri2IOjk0732jc3DNoUQJM1nSm0hqSQxNSfR7rTBu0IR80Ay9p7es5CDUc/rHIo
	 /jsyD999SdJ6cTBNSVNtugt6XJAYCSsN6UePi/DwO3KhYURdgfh9rmmv+SEcLVsaKp
	 LzZJFu9Q3enHClb52Mym9E2s9XFt4h0mtkep0UXbcj+0a0FqYgrob1C0C0aFbSCCVn
	 xHhSFFw4EQLTEwk3wLJ7cbnVUH5gcHsc7kjexXR0wTiOiqApf4HpluPasKqX2d0biZ
	 CiZse0KDGIT22zvfKGG02pv2SYoc87hMmIzk0M2HMHXnWUqeMysT2l8902Uw6X2S4l
	 /YukcNQY7FqFg==
Date: Thu, 5 Jun 2025 08:47:31 -0500
From: Rob Herring <robh@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com, amitrkcian2002@gmail.com
Subject: Re: [PATCH v13 1/3] dt-bindings: mtd: Describe MTD partitions
 concatenation
Message-ID: <20250605134731.GA2439158-robh@kernel.org>
References: <20250603194209.1341374-1-amit.kumar-mahapatra@amd.com>
 <20250603194209.1341374-2-amit.kumar-mahapatra@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603194209.1341374-2-amit.kumar-mahapatra@amd.com>

On Wed, Jun 04, 2025 at 01:12:07AM +0530, Amit Kumar Mahapatra wrote:
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
>  .../bindings/mtd/partitions/partition.yaml     | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
> index 80d0452a2a33..2ef4bde02cd9 100644
> --- a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
> +++ b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
> @@ -57,6 +57,13 @@ properties:
>        user space from
>      type: boolean
>  
> +  part-concat-next:
> +    description: List of phandles to MTD partitions that need be concatenated
> +      with the current partition.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 16

Add:

       items:
         maxItems: 1

Because phandle-array is really a matrix.

> +
>    align:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      minimum: 2
> @@ -138,4 +145,15 @@ examples:
>              reg = <0x200000 0x100000>;
>              align = <0x4000>;
>          };
> +
> +        part0: partition@400000 {
> +            part-concat-next = <&part1>;
> +            label = "part0_0";
> +            reg = <0x400000 0x100000>;
> +        };
> +
> +        part1: partition@800000 {
> +            label = "part0_1";
> +            reg = <0x800000 0x800000>;
> +        };
>      };
> -- 
> 2.34.1
> 
