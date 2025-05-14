Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1331DFF7;
	Wed, 14 May 2025 01:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747186524; cv=none; b=bbofwORvwdDyAl267SQtRZoESHd0aA4IQdGdQc1H6QVF8kjdE+Wct9dOMIZ5OBZMWKnpbFyQlXq+lvYWi82bgvfcng1ydDtyhdwezk+Go5ya0bbfBuHLfDl6/ZlchS5NaBAfel6todMIU+nyCM+p0qvvx8ErYbx09J2ZoyDP3m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747186524; c=relaxed/simple;
	bh=Im7N0oKWDU/sVPmXcPmyEfKbD0S7NlMA6kBuG2IflwM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=DCbwOWGRws9aTg5fBy2+PeEhuofaHeqP7WPJ2w2ToecaIEpg7x8Bf2jetGkZNkCLzJEEvzviTeluqyghtk41HpBpqZCdn9gI4pvdQ7vVd3Plgy+yI4uU0T4V51dFUu6hKbWVVg/PYEBwHmqBJuZ62OFBUARhOuPi3WDQrq0npvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FdnemOgK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FdnemOgK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D1AC4CEED;
	Wed, 14 May 2025 01:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747186523;
	bh=Im7N0oKWDU/sVPmXcPmyEfKbD0S7NlMA6kBuG2IflwM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FdnemOgK87ktFsdK4vpGVK27n1qyCGaFCflx8j1ynsUIdzmLcJZ8Zve7+PP/Y/YRb
	 GAaF3dLuzZw8wxKEnp5nx17q72ELJ6MVXCCNBzyG4P585sl0N4wcXUZcYhVdUwQ4jZ
	 utWUMucYu6fHtE6IxoV989HfWf+2dX+FPXRLU7zKHJQoX7OSEMOiCI6A6KRYMvS+OK
	 VhfV1Qs9gsLb/0OiEwxNhqi1N6ZSmbZ9/T5ueNVEHDA/NO47OUvFpivgmTStTDNOGF
	 6QrkDEJAsq9Y90M63wgX4/yNTT8Er/8Sfnf9f1/t0ZwdKDeTtNdgGLpRcPGvR0syIz
	 V5mjoR+gtIrfg==
Date: Tue, 13 May 2025 20:35:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, huangyifeng@eswincomputing.com, 
 p.zabel@pengutronix.de, ningyu@eswincomputing.com, 
 devicetree@vger.kernel.org, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org, linmin@eswincomputing.com
To: dongxuyang@eswincomputing.com
In-Reply-To: <20250514003121.473-1-dongxuyang@eswincomputing.com>
References: <20250514002945.415-1-dongxuyang@eswincomputing.com>
 <20250514003121.473-1-dongxuyang@eswincomputing.com>
Message-Id: <174718652184.181383.530303771736709791.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: reset: eswin: Documentation for
 eic7700 SoC


On Wed, 14 May 2025 08:31:21 +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> Add device tree binding documentation and header file for the ESWIN
> eic7700 reset controller module.
> 
> Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---
>  .../bindings/reset/eswin,eic7700-reset.yaml   |  47 +++
>  .../dt-bindings/reset/eswin,eic7700-reset.h   | 460 ++++++++++++++++++
>  2 files changed, 517 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/eswin,eic7700-reset.yaml
>  create mode 100644 include/dt-bindings/reset/eswin,eic7700-reset.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/reset/eswin,eic7700-reset.example.dtb: sys-crg@51828000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/reset/eswin,eic7700-reset.example.dtb: sys-crg@51828000 (syscon): reg: [[0, 1367506944], [0, 524288]] is too long
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250514003121.473-1-dongxuyang@eswincomputing.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

