Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF1F1DE8B2;
	Mon, 28 Apr 2025 15:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745854039; cv=none; b=tKUGDGTZ1pCfPS2w+MTcEQYkz8VWxzcAhTEhv+9abUT4ZaVLIThooa0rgeHgm6ax4AH8qd9N+nOQyC+DmiADj2AS2ctfLVkcvtQfY7mH/6BooV9mF8M/CYTYtkhEZkcHccTZ/igSShHrb0Pr9lsWUXhX/TeIacv+8uY1ZbHC6To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745854039; c=relaxed/simple;
	bh=xe+PC4Ilgkqhp0Kq/uE50DZsnYhsTMuf5xemFibbnIs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=aySAYkLg1qxoyspfvPk2e2j4/mzvsRJJuy1maY4sg0gIcl7VeGhW1Ig4YhhDE0bTis4oYps9pNdSmKz386vRYsNkBIOwvn5xw8hDZIjZ16uiz47OG1WGe8Otgy/qBdJ1G3M5xYB2xpT7l8gTALp0WInNJw9FomDWQEC2AFoBSII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODFSBNgl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODFSBNgl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6917C4CEEE;
	Mon, 28 Apr 2025 15:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745854039;
	bh=xe+PC4Ilgkqhp0Kq/uE50DZsnYhsTMuf5xemFibbnIs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ODFSBNglrrH69kLsEZ4zqQ6PmWjGUrG2PziyFNd4uoF9tOTKcZStJ+KI7qdh2tGye
	 h4i8rcd77w1BBkGNH7cAmosi/GWDb+BCn+nV2hFj5BzmIOg/JvTuSG4EtXCnQpVQAs
	 ib7xKLiWucIsM190d7dmJYcVfV05UiXz6v0dfsGl/Wo+bl38y5brvby+VnVzIoH1nW
	 pUmWOKDGA9xu1fx/hlhON/8UKowByzAZ5rsdT/Gb0mW0JVCitrt/7da4Rr/zlWovQb
	 w76u9kzpa4u8PB1d32X8L297AXQqSs7C/a7gIF74SY7o5VZmoWMROXZ+5xrYskq53K
	 CLCTrwFzu2Rfw==
Date: Mon, 28 Apr 2025 10:27:17 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <20250428-b4-k1-dwc3-v2-v1-1-7cb061abd619@whut.edu.cn>
References: <20250428-b4-k1-dwc3-v2-v1-0-7cb061abd619@whut.edu.cn>
 <20250428-b4-k1-dwc3-v2-v1-1-7cb061abd619@whut.edu.cn>
Message-Id: <174585403717.1072738.12141605070029196613.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: dwc3: add support for SpacemiT
 K1


On Mon, 28 Apr 2025 15:38:11 +0800, Ze Huang wrote:
> Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
> in
> the SpacemiT K1 SoC. The controller is based on the Synopsys DesignWare
> Core USB 3 (DWC3) IP, supporting both Host and Device modes for USB 3.0
> and USB 2.0 standards.
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>  .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 95 ++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.example.dtb: usb@c0a00000 (spacemit,k1-dwc3): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250428-b4-k1-dwc3-v2-v1-1-7cb061abd619@whut.edu.cn

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

