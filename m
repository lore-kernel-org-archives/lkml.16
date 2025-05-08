Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8860D202C5C;
	Thu,  8 May 2025 06:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746684564; cv=none; b=qeDTaDW3b/tImhEKDDJmhuSCd/Mo+O+XIo0TFS3rtKB0Cmg8V+eBU46qroHPRsPcVwof1DJ/QGztKrT2NlgQSVbAuCgXxv6JrUhTPqWxsoU05vMcV10VV0W317WjPmIHRDuP6li2hnvC1yepmOD56JMvDgcEUZir2rfDPpbRq4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746684564; c=relaxed/simple;
	bh=vdzcGzInBDOdEhA5i4T5CvvF61LwUqRe54QNxKAiupk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=sngMh8z1nuYH4liAd0Q1qJabhFoE2jEkm7GmiCCRD0d5ED27IsAkUpJ2boYX6NBMjB1RYoXh9czOaOYnYl/m3nwnfcS6UG5mq4y56JQmcISp/n7r0TvmSI2RwlRSNVwS2nzkkH2GRt2SvTHbQU3s/FqjxiAiiHvZysViMlSYDHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ClkpjYlH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ClkpjYlH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD110C4CEEE;
	Thu,  8 May 2025 06:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746684564;
	bh=vdzcGzInBDOdEhA5i4T5CvvF61LwUqRe54QNxKAiupk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ClkpjYlHj7FHHOznnrYJskuMCST6rbF/Mkh+sz+Uvgf9Y+9loiz8tIAIk5WeO5p0e
	 cLpuqEv7JThCGIroNadUvgMGs2MA8uu9YuH1XYB2qmoAu3UuqmxB/h+EDXLXZFuXhJ
	 f+YeJ/eijymplOtximmC72sHlYn1B+c20KeTSDd41MNeZkkjg5yi5+JSPrU4rxdFsA
	 Rdvknzsq4j8ef2HTQ2EDvbMjEwlmiKIlu54O/+p6OX/f2BVchIIHiWR9lO34PqV1eG
	 rkhUHL2s7aftRa6lgFElmGHZHseZWB7O0B9i1U9EQqlMYVUQAUMBcf+A6PwRKLc5n2
	 Qz68QUm3zCeSg==
Date: Thu, 08 May 2025 01:09:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
 conor+dt@kernel.org, vikash.bansal@nxp.com, shashank.rebbapragada@nxp.com, 
 krzk+dt@kernel.org, Frank.Li@nxp.com, linux-i3c@lists.infradead.org, 
 devicetree@vger.kernel.org, priyanka.jain@nxp.com
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
In-Reply-To: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>
References: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>
Message-Id: <174668456098.3462718.13659996753700192660.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub
 support


On Thu, 08 May 2025 07:57:10 +0300, Aman Kumar Pandey wrote:
> Add bindings for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> multiport I3C hub family. These devices connect to a host via
> I3C/I2C/SMBus and allow communication with multiple downstream
> peripherals.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> ---
> V1 -> V2: Cleaned up coding style and addressed review comments
> ---
>  .../bindings/i3c/p3h2840-i3c-hub.yaml         | 332 ++++++++++++++++++
>  MAINTAINERS                                   |   8 +
>  2 files changed, 340 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/p3h2840-i3c-hub.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i3c/p3h2x4x_i3c_hub.yaml
MAINTAINERS: Documentation/devicetree/bindings/i3c/p3h2x4x_i3c_hub.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250508045711.2810207-1-aman.kumarpandey@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

