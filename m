Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCED2C031D;
	Tue, 17 Jun 2025 13:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165967; cv=none; b=UOX3gzwvWXkCRLH9kcCHMYOLcJ/X6cvv2nnORtzUFIYTYrHkOHKhILRTWoUJMJ72mMji5eNYpbTnt5uu9+HPJm+Pcrqz5O8YY7EGNDRFOQcmEFDeACq4jBjF/kN5FSfYsEBu5McXjJgHwGl8ZY0uSqP6jB0D6E/r1S87y7RZh40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165967; c=relaxed/simple;
	bh=QDtaQLsmnu/VyAKGKSXvf8sIHBRd+mWxtBwWEhfm1PU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=OfhW5lTBRwFJaifdRivKpc/ADhKwltmT/Kjhxr30QgumNGhwQL5D7F6HS2W4U+mk/HEr0UQR7AmenTXSI7augO0/QuF3WqiK+SVDdKgQkTSBufAB4p9p3z8wAMXt5vvS/Rwoyi45CLN1Dx5A5W5ozT5rf1hzSsQTK5ad6sepRCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=booYi7ia; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="booYi7ia"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0265FC4CEE3;
	Tue, 17 Jun 2025 13:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750165967;
	bh=QDtaQLsmnu/VyAKGKSXvf8sIHBRd+mWxtBwWEhfm1PU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=booYi7iaE75ULoYnaOkSj+Sco2TT5VcyKnijhY3tzCTNXZE20Skxp4Du+o3EUcRbQ
	 s2ofawWcsni39UpVClAIK07GBTqObBCg7C5koKhrRePE6NXtpCpn/RVX7Fmu3DWvHm
	 p0L63lA5XbrBHRTthiJ7hKmpuSj8pwrAuO93EhmK1BmrppttCtzLJOcrBhE8dyFlfi
	 k/a+oKIbST/T9zbFsQ9sAj5PTxTdOPHr+e/jfQc+82DamA5axYwEK9bcsP/6R+EK8t
	 lWaPgCdECV0qLSxShgCLaFF822d+dSZIdB3e3MFzAIK+Ekq9tzB1ucjUJGM7VznYtI
	 D62v0xCWFDVLg==
Date: Tue, 17 Jun 2025 08:12:46 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, ping.bai@nxp.com, imx@lists.linux.dev, 
 broonie@kernel.org, lgirdwood@gmail.com, aisheng.dong@nxp.com, 
 ye.li@nxp.com, frank.li@nxp.com, krzk+dt@kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To: Joy Zou <joy.zou@nxp.com>
In-Reply-To: <20250617102025.3455544-2-joy.zou@nxp.com>
References: <20250617102025.3455544-1-joy.zou@nxp.com>
 <20250617102025.3455544-2-joy.zou@nxp.com>
Message-Id: <175016596600.1706958.16046350914927298265.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: regulator: add PF0900 regulator
 yaml


On Tue, 17 Jun 2025 18:20:24 +0800, Joy Zou wrote:
> Add device binding doc for PF0900 PMIC driver.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
>  .../regulator/nxp,pf0900-regulator.yaml       | 179 ++++++++++++++++++
>  1 file changed, 179 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:34:8: [warning] wrong indentation: expected 8 but found 7 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250617102025.3455544-2-joy.zou@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

