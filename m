Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946E22DCC01;
	Sun,  1 Jun 2025 16:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748795601; cv=none; b=Yei1vfHF0nsaqbOnR/TBnoYBq8O/TvwPzkPtz9NI6BWw1xftD+dot0XrRkZW3e3k/x7I7zcA6wuA0arnNbtz8RIC6fYZHwNpTiwGfasUn/JsXpyGq++funfTnhUsOEmIe7P+AHjvNUqscsfPpZVupNoCIj12Bod55qN01NuddGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748795601; c=relaxed/simple;
	bh=xSmHgAGZ7sO7lCniEOnA8Fn1fFrbUT/yauBSSc903sM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=fHIqJiEOASND+8SpGT4yUKtLR310kI/9e0GqPrbwidB4LjSIgA63U2HEwqC1ou10O1/sM8dHhvs1PXx2UWR3b5WHzPOk8Qvf4FVqXxY1T3GIuDWYhcCDhiezRYYd5c9Oa9pyahKbfxr6aICZ5xlJiMyd2Qpecbxp21gslb67K2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=coVpVsad; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="coVpVsad"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EF5C4CEE7;
	Sun,  1 Jun 2025 16:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748795601;
	bh=xSmHgAGZ7sO7lCniEOnA8Fn1fFrbUT/yauBSSc903sM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=coVpVsadMvAf4p0RHZYzaU/GBsx7PeqDtEhAztvB3uFLpRUpoIbOFkrzOKVBnY3w0
	 w9AVXr1KsM6k2Dif+wSUfmujSdLEZ5ZO1zjr/l1NcgNTWvXWM3rW0j0K2C1BkRLHhP
	 jO82EgAhYTow7KqGIKFGwVSc2lDRWs7Z2cvkadBJUK2aYCPGAOktePoFcHRWHR4vKt
	 +vRHBqlxsduMGsMeAG5Qf5lOQi4uxllWeSRj17I3vTZD+lCf6tKqRUDDRDeh4AM/Xg
	 ErBpzD/jxtjcSjD2/f26HxYAMisXmyz+Ckt+J+DuO+fuol98XCUb7nBT28wWRsV9Dq
	 99Sr6X8yLNZog==
Date: Sun, 01 Jun 2025 11:33:19 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 krzk+dt@kernel.org, gregkh@linuxfoundation.org, conor+dt@kernel.org, 
 arnd@arndb.de
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
In-Reply-To: <20250601153022.2027919-2-abd.masalkhi@gmail.com>
References: <20250601153022.2027919-1-abd.masalkhi@gmail.com>
 <20250601153022.2027919-2-abd.masalkhi@gmail.com>
Message-Id: <174879559905.2719478.15392001971491179573.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: eeprom: Add ST M24LR control
 interface


On Sun, 01 Jun 2025 15:30:19 +0000, Abd-Alrhman Masalkhi wrote:
> Add support for the control interface of STMicroelectronics M24LR
> RFID/NFC EEPROM chips.
> 
> Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> ---
>  .../devicetree/bindings/eeprom/st,m24lr.yaml  | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/eeprom/st,m24lr.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/eeprom/st,m24lr.example.dtb: eeprom@53 (atmel,24c04): pagesize: 4 is not one of [1, 8, 16, 32, 64, 128, 256]
	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/eeprom/st,m24lr.example.dtb: eeprom@53 (atmel,24c04): Unevaluated properties are not allowed ('pagesize' was unexpected)
	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250601153022.2027919-2-abd.masalkhi@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

