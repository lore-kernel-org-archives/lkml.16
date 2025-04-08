Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE6B1AAA32;
	Tue,  8 Apr 2025 12:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115214; cv=none; b=dUJvEInvSLbGjAc1EKzEekWzf9PAvUeQlzoJs9TU3w/nOFFRlWZ76ZgNB2BUfaY9k5AP/qflwf6Q6jX6iVJspn/FfFrsW4e3947pVH6VYTsThVXAQXggdj2T9CWUebR1fJxGN90IfO8cKUXrogJuf2LqWWaCCSKpqQNgfhADJ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115214; c=relaxed/simple;
	bh=F1wj3qpVgo1qr1BveM6Zq/QNOkaTsdEvxE8GsgIH80g=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=kM4gZVNyT5VuXB1uKh3z1d6B/msQrM+e/vLItHq8WGScOOg7DZOkv6KDja6xrzG08IMMaq3HoKb660OVJUkXdqWfkeX2rLv/6xI3DpGB5/s/+LCenX7JJB6xEOyOXQZsaU53l8NSsnW9f3twflggBDOa3abc9rlHr/JHDfEkRLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/gJTstg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/gJTstg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC91C4CEE5;
	Tue,  8 Apr 2025 12:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744115214;
	bh=F1wj3qpVgo1qr1BveM6Zq/QNOkaTsdEvxE8GsgIH80g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=m/gJTstgQA1my9A3PxtSag5ErhPe+ieuCHFi+wlAw/Jpczvrzw12lI+xmMQpfEMST
	 7BjqvM0rhlJ8QlBD4fVh41Gz6+00Go3c7jLSjASzAqoS1WU4vTf1DFtdeEyPh2dil5
	 zwrZzxuwQwqZt775I4uU9MTU0L/bac5d8QL6O5fj/ZwsGXR4JIoCo8pBNRzfVveZkc
	 tLTmrdfbsK936NHN8dFk6o8QqHDWmUVGw3R4imaWpPw4jF0bi/G4zYwbhEppdgtyW/
	 AnwqWFfvEK5vK8bCcEEWQBpr/F2JmmQwbpWXMmelLSJKSLrPEJfx31AOgyCSKRc9HT
	 Tp0VWYCg+vhYg==
Date: Tue, 08 Apr 2025 07:26:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
In-Reply-To: <20250408-gicv5-host-v1-1-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-1-1f26db465f8d@kernel.org>
Message-Id: <174411521311.1639476.6777663294037851144.robh@kernel.org>
Subject: Re: [PATCH 01/24] Documentation: devicetree: bindings: Add GICv5
 DT bindings


On Tue, 08 Apr 2025 12:50:00 +0200, Lorenzo Pieralisi wrote:
> The GICv5 interrupt controller architecture is composed of:
> 
> - one or more Interrupt Routing Service (IRS)
> - zero or more Interrupt Translation Service (ITS)
> - zero or more Interrupt Wire Bridge (IWB)
> 
> Describe a GICv5 implementation by specifying a top level node
> corresponding to the GICv5 system component.
> 
> IRS nodes are added as GICv5 system component children.
> 
> An ITS is associated with an IRS so ITS nodes are described
> as IRS children - use the hierarchy explicitly in the device
> tree to define the association.
> 
> IWB nodes are described as GICv5 system component children - to make it
> explicit that are part of the GICv5 system component; an IWB is
> connected to a single ITS but the connection is made explicit through
> the msi-parent property and therefore is not required to be explicit
> through a parent-child relationship in the device tree.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
>  .../bindings/interrupt-controller/arm,gic-v5.yaml  | 268 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 275 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.example.dts:43.27-28 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1522: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250408-gicv5-host-v1-1-1f26db465f8d@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

