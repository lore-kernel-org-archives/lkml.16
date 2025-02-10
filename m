Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C209324F5AD;
	Mon, 10 Feb 2025 16:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204567; cv=none; b=mFt9SlfYgSbAFNRu9NwFYCcKTv4huYTa9B7CYQQjIDcOGBaxlDqNfOtlMs2LbS3KdcCphgpqkUOD56pwyxqcsMTN9yaSonT+Fq2cTwuxrJbDk+msoRA9cfONO3nrPOQHH9kBkd5XDd7E9K3bB743NYtvdqgG3ySYdNpy2GOYk7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204567; c=relaxed/simple;
	bh=RFxvxcK/bzZqs3JATGrcjxdRDeI3+RT3KUeYcBmhG+o=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Tz9YJPcAi//EeU9N2+xuNiF6REFCvg/KehOp+tmXXDgDZ76WcIiqUPmVKYvqc7IasDjqtkc1OQYCIkbkCNBj9oDkdRJwEf3jkn+EI99hd+uVMuLaRTa3EJ5NGMUtiH9NUX3mycc6MYKWzkwGRIUwLMSC/neHcWNdjv9VPXFJGSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Se1+wX7b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Se1+wX7b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1132FC4CEE6;
	Mon, 10 Feb 2025 16:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739204567;
	bh=RFxvxcK/bzZqs3JATGrcjxdRDeI3+RT3KUeYcBmhG+o=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Se1+wX7bZq1dD2sAg3ZZqXd0nUauHnWdAGH3nGikit7a5xbBi0t3MPDkv7jVlwmTu
	 dmi6KiiAv9mfFFAG3QFrPkN91IyDfZQDy6Osq5S1SLP9OKniQkZ2JJveJhXxhxdIay
	 kPEONsfBnbFODu+RR5onpzD3hw0r0Va+xfKJFGwFFN0QSShH0yg/8/4LYLWOOsPGST
	 kWZxx/0bwQyW+zlOL9rWQllhai0yR1TI9Fj+QsMm1vsgkvy4s8h7z1/HkqYbaGVdGg
	 y00vgE6qxn+k/XgcBYk7cax2nqBd0WoXlPEzCEj/OHnWpYmElB1iz9wcx762+VgfUb
	 hjCXQBnaUL3dg==
Date: Mon, 10 Feb 2025 10:22:45 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 nirav.rabara@altera.com
To: niravkumar.l.rabara@intel.com
In-Reply-To: <20250210074604.2410783-1-niravkumar.l.rabara@intel.com>
References: <20250210074604.2410783-1-niravkumar.l.rabara@intel.com>
Message-Id: <173920412142.477451.9950583431294395280.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] arm64: dts: socfpga: agilex5: add NAND daughter
 board


On Mon, 10 Feb 2025 15:46:02 +0800, niravkumar.l.rabara@intel.com wrote:
> From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> 
> Agilex5 SoCFPGA devkit supports a separate NAND daughter board.
> Document NAND daughter board compatible string and add board file.
> 
> Changes in v3:
>   * Document Agilex5 NAND daughter board and use that compatible
>     in the device tree.
> 
> link to v2:
>  - https://lore.kernel.org/all/20250205101318.1778757-1-niravkumar.l.rabara@intel.com/
> 
> Changes in v2:
>  * Use nand flash node name according to dt bindings to fix dt build warnings.
>  * Arrange node in sequence.
> 
> link to v1:
>  - https://lore.kernel.org/all/20250107084831.2750035-1-niravkumar.l.rabara@intel.com/
> 
> Niravkumar L Rabara (2):
>   dt-bindings: intel: document Agilex5 NAND daughter board
>   arm64: dts: socfpga: agilex5: add NAND daughter board
> 
>  .../bindings/arm/intel,socfpga.yaml           |  1 +
>  arch/arm64/boot/dts/intel/Makefile            |  1 +
>  .../dts/intel/socfpga_agilex5_socdk_nand.dts  | 89 +++++++++++++++++++
>  3 files changed, 91 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
> 
> --
> 2.25.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/intel/' for 20250210074604.2410783-1-niravkumar.l.rabara@intel.com:

arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: clock-controller@ffd10000: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/clock/intel,easic-n5x.yaml#





