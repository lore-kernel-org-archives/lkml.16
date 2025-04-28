Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1FE175D53;
	Mon, 28 Apr 2025 23:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745882815; cv=none; b=OeyiKohUcghtfh3qPIhT3pQSwwEbtaT85Y0K6U2pYTR3Fu+TQR7An7Wac90eF+qd4OCfCOigqG8uKiIdNcYOm8r986XyXG//0EkkAtrd5vyRZNd7UNw7OEyA0sXKBv6pROHENVKmZsHJHeC5X8fX5TkF+wcTvsIyN5n1FFnWrLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745882815; c=relaxed/simple;
	bh=tSupbkPLoEUjBl47ljsupVe+uF7srFMA2Qm7WgdsX50=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=tWJQaXNCVKEpMJuoFRvPFnaM6EO9f4ULCyg1M3tyOblW2b6ArC8rr0X4CwaRI6nj7ZcRH12Gu79/lDxaApMSbiKnjwl/cL5QzqOpN0+MCqtlv4dgrzffYXquId2dGg8/xLlCghxbAIz0KsFYephPAW3vDp9wsCzZoE/2rKrJdd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grWEeJHa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grWEeJHa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC14C4CEE4;
	Mon, 28 Apr 2025 23:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745882815;
	bh=tSupbkPLoEUjBl47ljsupVe+uF7srFMA2Qm7WgdsX50=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=grWEeJHaG7xbQAJy64KJvdm9x6W8lXK+MF76InLvLoiep/L1MU764zaPAu6IF583X
	 RhXUSEKoitBHoyF6rIRalO1s1yTSt1CBfI/sDy0to1tdOr2DjRsGg9k51ytaDBaJYQ
	 FcdpThd2xlOWeGJ3XQMvqEeU3xjy8KB+TJjQ/0jJMveowGndUKEj4u/8w1aLDxOTlp
	 nXzYD+wVTUsKpJ6I6pCBSLo0uKXOmA98XI/LJqGx07O2sRkYk9km7BMbFK+BY7caRu
	 uor6xaRpmBWOyzBe4wF75auE1q+91fVp5MhTPFmYCeFpRTqabK4bALpd1zolvbF8ij
	 F7pyaJtECGhDw==
Date: Mon, 28 Apr 2025 18:26:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Jean Delvare <jdelvare@suse.com>, Charles Hsu <ythsu0511@gmail.com>, 
 linux-hwmon@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Greg KH <gregkh@linuxfoundation.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>, Shen Lichuan <shenlichuan@vivo.com>
To: Pawel Dembicki <paweldembicki@gmail.com>
In-Reply-To: <20250428221420.2077697-6-paweldembicki@gmail.com>
References: <20250428221420.2077697-1-paweldembicki@gmail.com>
 <20250428221420.2077697-6-paweldembicki@gmail.com>
Message-Id: <174588281340.1841112.12342859635067816713.robh@kernel.org>
Subject: Re: [PATCH 5/5] dt-bindings: hwmon: Add bindings for mpq8785
 driver


On Tue, 29 Apr 2025 00:13:35 +0200, Pawel Dembicki wrote:
> Add device tree bindings for Monolithic Power Systems MPQ8785, MPM82504
> and MPM3695 PMBus-compliant voltage regulators.
> 
> These bindings also documents the optional "voltage-scale-loop" property.
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> ---
>  .../bindings/hwmon/pmbus/mps,mpq8785.yaml     | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Warning: Duplicate compatible "mps,mpq8785" found in schemas matching "$id":
	http://devicetree.org/schemas/hwmon/pmbus/mps,mpq8785.yaml#
	http://devicetree.org/schemas/trivial-devices.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.example.dtb: pmic@30 (mps,mpm82504): False schema does not allow {'compatible': ['mps,mpm82504'], 'reg': [[48]], 'voltage-scale-loop': 600, '$nodename': ['pmic@30']}
	from schema $id: http://devicetree.org/schemas/hwmon/pmbus/mps,mpq8785.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250428221420.2077697-6-paweldembicki@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

