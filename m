Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68215634;
	Tue, 15 Apr 2025 04:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744691473; cv=none; b=jETU+WGk1fTLjFAH7QrE3SOP+yXAlJSA0Zznt/SOWmqNvo7Zq4daPK7epJGTGBTTQFZgFS4kMg1atn5yIl7F8A0eZkZsRUb1L8MmRVW68xLippxSgkWKmlOUt6tbHOaRXowprXhS2Z9zjTGpX4e8q11BcLXShBykbUX2MhJPyy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744691473; c=relaxed/simple;
	bh=QPgVVKuU1xj//lpxR3vKuQSHeE3ZGj5RVnWlnXSdGpM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=crLXzLm4mhttz+SmVEwKmg+G5XtiNl5W7INxxvN1K+Paq/l0REapf1HXx5W0a6VwUkV0OBieXcDybZuHGkCA5TeJ/9mz2durTUf31mLj8jWsv/b8vJDCmcnSBcd410Eo4sJwA3YyPfkT42+XYCA6wMH1RREz9gmVWooAvh1EYmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Frp36u5+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Frp36u5+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9C5C4CEDD;
	Tue, 15 Apr 2025 04:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744691472;
	bh=QPgVVKuU1xj//lpxR3vKuQSHeE3ZGj5RVnWlnXSdGpM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Frp36u5+K94T2+XAXJtNTV0SuENecU+W9JPeS0AqcLevLFtMEFhZ3nL//VYEPV2AM
	 TMph+9J3LseE8S/djkN2cVjPZPJ2M1dQJ3C+p8AgzS88F4/sJJi/ArOqaS056dVnQ9
	 JsrYvfgzetQ0IgFJKA7vwstnzf5xfMULKjFgeWxFGj0FQ7u77qTqQBh8Pwo9cdGEnR
	 Hsuq7wlbwiEDZNVjtzuKcpUNY9WhPEP7mxeyD688pOViQRom4ROlzcJ3+ptHere9kS
	 i4IEKO5aYEEe8A2vzMOkjfUa5BERhpkGfgjBXKDGKfGkLJ2H9biPfCfYsDz32Dv02S
	 8CllWWqY9PuRQ==
Date: Mon, 14 Apr 2025 23:31:11 -0500
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
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250415-clk-measure-v3-2-9b8551dd33b4@amlogic.com>
References: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
 <20250415-clk-measure-v3-2-9b8551dd33b4@amlogic.com>
Message-Id: <174469147098.2812651.9702380390890809479.robh@kernel.org>
Subject: Re: [PATCH v3 2/7] dt-bindings: soc: amlogic: C3 supports
 clk-measure


On Tue, 15 Apr 2025 10:45:25 +0800, Chuan Liu wrote:
> C3 adds support for clk-measure.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml: maintainers:0: 'Frank Li' does not match '@'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

doc reference errors (make refcheckdocs):
Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
Warning: Documentation/arch/powerpc/cxl.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-cxl
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
Documentation/arch/powerpc/cxl.rst: Documentation/ABI/testing/sysfs-class-cxl
MAINTAINERS: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
lib/Kconfig.debug: Documentation/dev-tools/fault-injection/fault-injection.rst

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250415-clk-measure-v3-2-9b8551dd33b4@amlogic.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

