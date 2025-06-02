Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39C433F7;
	Mon,  2 Jun 2025 19:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748891254; cv=none; b=AnX2SK5eWmVOm+YvWp0kmm2sK8LpFxRTCr1xJMq4iEpJdXT5WheVVK5YrqWHXCpdZkhoFKKLNR5XZrb3/b2cjNrR5bKcQlHo+8nFj8CGqjsaiXsD1ydRR3lljCmB9tZrLlRa4c7aUsouQIYR0XaxixqXFYJK5gwtztuGyJBBrGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748891254; c=relaxed/simple;
	bh=7az0m0nsyakWLCwwi+MCKHAsD3u974wVjJ18aoMopQQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ITqBXhD/7cjw/GIxjm49JOlhD7sDusBsSMeI8RyucD+2BUbkPGvOlXpiP15dr+Fpam0oG4ggN6fkOMAEHQTNkry9m7uCjGRv00dmQUc9N4UsBLzCFsY3n5baeTZO5WEFgqrR2ojF8qYjgiDlHVdwSB8P2fZ5JgOnHmwCwtLjgUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUrCKlRf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUrCKlRf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D20D1C4CEEB;
	Mon,  2 Jun 2025 19:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748891254;
	bh=7az0m0nsyakWLCwwi+MCKHAsD3u974wVjJ18aoMopQQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aUrCKlRfZ9YMpaymzaEY9TM4p88z4MMSfQfniuU95jWImlRTYO/WiaRviCfPyEn1p
	 i9YOX17y81Quo8SVzxq+MFeCwtfeXxHg1+K77Pqdf1JuVp/njf8hx/DYIYK3PmECWG
	 mLm/t7Ar00zUV+jav6oAqLjTPCmPOC4XDwIdWOm3S8E/HJp6GxZeOLjx0r571FEn+h
	 kEqz0nZ9qOeCMiESKhQJw4NHSYpqh383deckTz+TBLgy/BuK80H8WK2b5TClutCdsl
	 y/7HOMndBkgfDBrBYmaJipcjCd6Pv/wXBCk5vWeqQ3/6k96wBrBD53IwKkHd2CZP+s
	 pbf8VLAx82/9A==
Date: Mon, 02 Jun 2025 14:07:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev, 
 Srinivas Kandagatla <srini@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250602144422.944454-1-Frank.Li@nxp.com>
References: <20250602144422.944454-1-Frank.Li@nxp.com>
Message-Id: <174889125206.2528612.6417813590440449143.robh@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: nvmem: convert lpc1857-eeprom.txt to
 yaml format


On Mon, 02 Jun 2025 10:44:21 -0400, Frank Li wrote:
> Convert lpc1857-eeprom.txt to yaml format.
> 
> Additional changes:
> - remove label in example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/nvmem/lpc1857-eeprom.txt         | 28 ---------
>  .../bindings/nvmem/nxp,lpc1857-eeprom.yaml    | 58 +++++++++++++++++++
>  2 files changed, 58 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/nvmem/lpc1857-eeprom.txt
>  create mode 100644 Documentation/devicetree/bindings/nvmem/nxp,lpc1857-eeprom.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/nvmem/nxp,lpc1857-eeprom.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250602144422.944454-1-Frank.Li@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

