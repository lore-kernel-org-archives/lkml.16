Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63D61E520F;
	Sat, 31 May 2025 09:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748683542; cv=none; b=cm4A25x1ecIIIPC9ObTKJKLPxQ0rfLpz5QyzdBVSyfyiWH0/Zilj4itvsk3HZ7tjHZhMCH1RZqAffoLMLsTa9YKdRz3+zXkgJulLZPZ0D9lattSC3Z8KtTpFcw0C+ijYCgm863KQ6/OahDI92aiOlGm7sbyLLq9PzMClZxmu3eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748683542; c=relaxed/simple;
	bh=gh1SR7miY5UdrONx8owoLj2CLoe9Kbv/kgJkX7nLA/I=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=fNDdIwKigc8dtbPNd3k13Bgmt3bY3gPCdXaHHVWWEqrP9wWs/eLRN0JUOT1XxG6AUpG5dUxD+vtZkIQ6Qlzwe0uApSk9tRkDC26zJ7W04iR/n8huoGPeQ4pDbRCciMaVx+1G9UyYAxpcIdeqTxt3UiSmgbexsq4wiS2GjOFKjmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fz1VZYlx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fz1VZYlx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6782C4CEE3;
	Sat, 31 May 2025 09:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748683542;
	bh=gh1SR7miY5UdrONx8owoLj2CLoe9Kbv/kgJkX7nLA/I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Fz1VZYlx0Intc+r890Ozgzaf+qe1xVhR5INS1LhDlYFJlulrWq6rlJHLwDnGeh4Bo
	 f2nOal6mWiMg/KEhhya/lJDPVWhLVOyWgW871COuLwHds/n1aSTF2BdtBTsU+5sO8D
	 teSlvChbpHfPwQjv60yx0aF0bvW3bhMFa7eFWNrUkwv4UN5dH/vej7nBuObWw6/Lt1
	 ceh/RHguDJeRDXmTdtiDFfw/VoQmdDIp3N0Geqtrydn7toPcinJwQ2vP47IMDNenSJ
	 iEqiagaD8b3BNvC9zAFciOHyfzxSQndYbHeTeSOGs7cu+l0TLec/7YRrDSdJyY41a0
	 +ov8tOVJGxNQg==
Date: Sat, 31 May 2025 04:25:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
In-Reply-To: <20250531081159.2007319-2-abd.masalkhi@gmail.com>
References: <20250531081159.2007319-1-abd.masalkhi@gmail.com>
 <20250531081159.2007319-2-abd.masalkhi@gmail.com>
Message-Id: <174868353988.72600.7039743404673669325.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: misc: Add binding for ST M24LR
 control interface


On Sat, 31 May 2025 08:11:57 +0000, Abd-Alrhman Masalkhi wrote:
> Add a Device Tree binding for the STMicroelectronics M24LR series
> RFID/NFC EEPROM chips (e.g., M24LR04E-R), which support a separate
> I2C interface for control and configuration.
> 
> This binding documents the control interface that is managed by
> a dedicated driver exposing sysfs attributes. The EEPROM memory
> interface is handled by the standard 'at24' driver and is
> represented as a child node in the Device Tree.
> 
> Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> ---
>  .../devicetree/bindings/misc/st,m24lr.yaml    | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/st,m24lr.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/misc/st,m24lr.yaml:25:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/misc/st,m24lr.yaml:30:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
./Documentation/devicetree/bindings/misc/st,m24lr.yaml:70:4: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/st,m24lr.yaml: maintainers:0: {'name': 'Abd-Alrhman Masalkhi', 'email': 'abd.masalkhi@gmail.com'} is not of type 'string'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/st,m24lr.yaml:
	Error in referenced schema matching $id: http://devicetree.org/schemas/misc/i2c-mux.yaml
	Tried these paths (check schema $id if path is wrong):
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/i2c-mux.yaml
	/usr/local/lib/python3.11/dist-packages/dtschema/schemas/misc/i2c-mux.yaml
Documentation/devicetree/bindings/misc/st,m24lr.example.dts:21.13-26: Warning (reg_format): /example-0/i2c/m24lr@57:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/misc/st,m24lr.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/misc/st,m24lr.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/misc/st,m24lr.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/misc/st,m24lr.example.dts:18.13-35.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #address-cells for I2C bus
Documentation/devicetree/bindings/misc/st,m24lr.example.dts:18.13-35.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #size-cells for I2C bus
Documentation/devicetree/bindings/misc/st,m24lr.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/misc/st,m24lr.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'i2c_bus_bridge'
Documentation/devicetree/bindings/misc/st,m24lr.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/misc/st,m24lr.example.dts:19.20-34.13: Warning (avoid_default_addr_size): /example-0/i2c/m24lr@57: Relying on default #address-cells value
Documentation/devicetree/bindings/misc/st,m24lr.example.dts:19.20-34.13: Warning (avoid_default_addr_size): /example-0/i2c/m24lr@57: Relying on default #size-cells value
Documentation/devicetree/bindings/misc/st,m24lr.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/st,m24lr.example.dtb: m24lr@57 (st,m24lr04e-r): 'i2c-gate' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/misc/st,m24lr.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/st,m24lr.example.dtb: m24lr@57 (st,m24lr04e-r): {'compatible': ['st,m24lr04e-r'], 'reg': [[87]], 'i2c-gate': {'#address-cells': 1, '#size-cells': 0, 'm24lr_eeprom@53': {'compatible': ['atmel,24c04'], 'reg': [[83]], 'address-width': 16, 'pagesize': 4}}, '$nodename': ['m24lr@57']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/misc/i2c-mux.yaml#"}
	from schema $id: http://devicetree.org/schemas/misc/st,m24lr.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/st,m24lr.example.dtb: m24lr_eeprom@53 (atmel,24c04): $nodename:0: 'm24lr_eeprom@53' does not match '^eeprom@[0-9a-f]{1,2}$'
	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/st,m24lr.example.dtb: m24lr_eeprom@53 (atmel,24c04): pagesize: 4 is not one of [1, 8, 16, 32, 64, 128, 256]
	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/st,m24lr.example.dtb: m24lr_eeprom@53 (atmel,24c04): Unevaluated properties are not allowed ('$nodename', 'pagesize' were unexpected)
	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250531081159.2007319-2-abd.masalkhi@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

