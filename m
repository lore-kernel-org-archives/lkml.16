Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C595521518F;
	Fri,  2 May 2025 23:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746228433; cv=none; b=F+EK0rSlDkGRP5WdtwgsJp0B5pPUPxVcJ4bbfXqr/OEb3OJeasUvdeRao4pG28gE4Tkr4I9ED5icZxrtmff/Me8hnYHW0YDV/jpxAdx0c+fa5+vPz3xjRLTcvrTPQaETJZFS9BtUnSuNvOoUKwTmSFRrrW2XgUwlsBxlf1mUu6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746228433; c=relaxed/simple;
	bh=Hnnqy6HQL4YnWgXmdwGS2nXyeFF+0Q2siOEdENo0eRE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=XUDgAgLEdmNkZvB2P3G1KBRv/4HsW25gDvTtQw6dznw8HBU+o7iymhU8aGh25/CMQOb5GebNxbOEfa/JjEOi0CJ8rIWxCpJ0nZibd6bsPWVHSDX+Rjzj4OLLPY4ne6WlPyt3mqSmXwdfU2wHXZjrHcj8RsHB5tnQ+Eeku8JGlwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5/hYGlw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5/hYGlw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F84C4CEE4;
	Fri,  2 May 2025 23:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746228433;
	bh=Hnnqy6HQL4YnWgXmdwGS2nXyeFF+0Q2siOEdENo0eRE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=O5/hYGlwnpYBhK7zltWWNWHhyUeP4nWKOb1C/zslmwVclYQGqN7i9vRYueYPJhR6Z
	 ehCV4KMCIeOFP9Mo/bg+rsW9biuZRwxeCKWW2S+jOU4w5sVLk/V7DfVi5EAWo8qvCw
	 jqy/lMlsXljitEhZE1/VFuopq8tvskoO36k761OqopeQ6swptHOaIEvHuc71cLajiO
	 QgQDkzJkFlJ7lv7YuQInJnfbN7VA3AkKMupfDwWfL8x0vAoZHqsSd1/M9lIQgSzrpA
	 qgyDmokeEB7X1UqUOvlIIdZxbezW/WLVEd2bpe4b5R8g3UpWrzm5xWCwdER7zRUBp2
	 RRpGSX7AlHVuQ==
Date: Fri, 02 May 2025 18:27:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org
To: Alexey Charkov <alchark@gmail.com>
In-Reply-To: <20250503-wmt-soc-driver-v2-1-8c774ad84d47@gmail.com>
References: <20250503-wmt-soc-driver-v2-0-8c774ad84d47@gmail.com>
 <20250503-wmt-soc-driver-v2-1-8c774ad84d47@gmail.com>
Message-Id: <174622843145.3029685.15692022572710133575.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: Add VIA/WonderMedia SoC
 identification


On Sat, 03 May 2025 02:04:23 +0400, Alexey Charkov wrote:
> VIA/WonderMedia SoC's have a chip ID register inside their system
> configuration controller space, which can be used to identify
> appropriate hardware quirks at runtime. Add binding for it.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../bindings/hwinfo/via,vt8500-scc-id.yaml         | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/soc/vt8500/via,vt8500-scc-id.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250503-wmt-soc-driver-v2-1-8c774ad84d47@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

