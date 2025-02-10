Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF249130499;
	Mon, 10 Feb 2025 03:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739158206; cv=none; b=PfXNsiBUbWiKbYS9MCUzU02CuCs1nxTfZKmD3hbx/aAKkOq5QrZrbYqrRZnxrYEpg+5ThWkmmjJdXtdAoCBWFbxXppSyJznYLG2WDsfzoCMAjvD8ZXUI6VuDf+06ZT9VfUg5MkQh4XhpTxTNnJ+Pw184el0U8VJS7hNXQWegAdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739158206; c=relaxed/simple;
	bh=WvSnkgc3UFBlOP4JhkPR7G4pWZRnwRjTEjQID1u7LFk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=YSa2U9zAkPWMQdef1LJ9DFxjkSrb7/qk6GrFj58OUMhK7cUsoFHPV7774rW/y9OFYB1Q1P4QHgsAPqFF5W4PqFxuVEvypq9WPEbSiP5ioMOpBoYrAGkt3RolZOOeZkHPs2XM7GEWFMmfiQScqf99myTG1Et0sjQzBgLv+O6zuFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nM1eRtH0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nM1eRtH0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC88C4CEDD;
	Mon, 10 Feb 2025 03:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739158205;
	bh=WvSnkgc3UFBlOP4JhkPR7G4pWZRnwRjTEjQID1u7LFk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=nM1eRtH0XFWBaqzduU3ZpdO8HOaKouA3EQXBika9driszA2Ww8jr9k1xCtnXMHZsd
	 fmPAHeR5DbQ1CMbajE6dfKPsLEM1Anws/D5JSnXvY6kmYx0He8qSt5GyUrFIAhI6Vd
	 X5MqC7exfnf5X4q+dzuALsEgiJbN8UeaTcKtKjIcjwZGZI6zmkZuwQUnCthxfObtTC
	 6CCMfxvZVwSLEz1GU6jI9/+rKjfLtPwV6uAOnNcgin0j3fw5NEUhQnvHv0IzwDp4YZ
	 UBpzszXTGJ1wxwe3JY5ta3w8axv/5qmEUyK6RmdioNRnom/rbe0otBTVVA07yydiq9
	 IF97G4je+onsA==
Date: Sun, 09 Feb 2025 21:30:03 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
To: "Celine Joy A. Capua" <celinejoy.capua@analog.com>
In-Reply-To: <20250210-staging-ltc7871-v1-2-c593ad86aab2@analog.com>
References: <20250210-staging-ltc7871-v1-0-c593ad86aab2@analog.com>
 <20250210-staging-ltc7871-v1-2-c593ad86aab2@analog.com>
Message-Id: <173915820365.2694296.5430421986343256189.robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: regulator: Document the ltc7871
 regulator


On Mon, 10 Feb 2025 10:30:53 +0800, Celine Joy A. Capua wrote:
> The LTC7871 is a bidirectional buck or boost
> switching regulator controller that operates in
> either buck or boost mode on demand. Add
> corresponding DT bindings.
> 
> Signed-off-by: Celine Joy A. Capua <celinejoy.capua@analog.com>
> ---
>  .../bindings/regulator/adi,ltc7871-regulator.yaml  | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/adi,ltc7871-regulator.example.dtb: regulator@0: Unevaluated properties are not allowed ('adi,ra-external-ohm', 'adi,rb-external-ohm', 'adi,rc-external-ohm', 'adi,rd-external-ohm' were unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/adi,ltc7871-regulator.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250210-staging-ltc7871-v1-2-c593ad86aab2@analog.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

