Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184774A00;
	Tue,  4 Feb 2025 23:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738712065; cv=none; b=g+SGmO8IduCCCblZpfLaRNHtq3oBtK3T6SRzl5Z0SSgnPthhJbq2figSUPzXNs6muWuBrkl/uhw9CE5qAOw9zpvAA1Ut8u1x2FlVSSKOo0SKDGSeEQsXOgjnXZxepa2Jjs+Xw/bbzGa7yJJ7PQzQmVzcTd+S77W7imbaknWWp9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738712065; c=relaxed/simple;
	bh=qNaI7mNVAo+bdKqZapwX6kc95OmNBA7rEBpHbdHOK7g=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mdHO71tcWZ6vaZ228G7FD6oziuk2fEpbmWg8wm0JzIZkcSGjq2CsJfUCvueyxaeqyaW8IGeGpEtKOcgb70v+RRPc5yuE8CV6OV2Eo/nC9EMaM6ZqLpsELBd15NfoIZ0eeo2Zza78CpWnzqS40QRuc+Usu6OA2gc7qRVDDBFE6oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Modprg3I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Modprg3I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43AA6C4CEDF;
	Tue,  4 Feb 2025 23:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738712064;
	bh=qNaI7mNVAo+bdKqZapwX6kc95OmNBA7rEBpHbdHOK7g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Modprg3I1Pt9JxZwG9n+ZL6HnMhQjCmgAf/ZQ1Sz/6Qdl5vxSrc+trOzbXxQXRbI7
	 igjNpulSW6a87KMhsCsnTPq1gz+7S9FLj558NH2P3sZF+A1ob3gZrx7HjoVVQgQgWc
	 UXfRV7VKdfVLa2NFeprP4JviIKHmGHwoo5Gu9ocDiMgA/rdG0Mb79EUMBb6R4EDUxk
	 l4il7djUEVYE8o52djqbpJhkwo7yWmG3agRSjBnjT5BPAiAqSXNzXk82gcTOcDmPEo
	 +S+QMHz2KW71aDkCL7P6Vk4kG5Y0bPCLfPUh9tg1L37vQ7+d0ag6ltMnM0pJ3QZEZM
	 PozE63dz4OqCQ==
Date: Tue, 04 Feb 2025 17:34:23 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 broonie@kernel.org, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Jean Delvare <jdelvare@suse.com>
To: Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <20250204180306.2755444-1-naresh.solanki@9elements.com>
References: <20250204180306.2755444-1-naresh.solanki@9elements.com>
Message-Id: <173871195460.3830123.16015645611283640170.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: ir38060: Move & update dt
 binding


On Tue, 04 Feb 2025 23:33:03 +0530, Naresh Solanki wrote:
> Move dt binding under hwmon/pmbus & align accordingly.
> 
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> ---
>  .../hwmon/pmbus/infineon,ir38060.yaml         | 61 +++++++++++++++++++
>  .../bindings/regulator/infineon,ir38060.yaml  | 45 --------------
>  2 files changed, 61 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.yaml
>  delete mode 100644 Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20250204180306.2755444-1-naresh.solanki@9elements.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']





