Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149B2FBF0;
	Wed, 18 Jun 2025 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236041; cv=none; b=g3YaMfS7ABdOcHel8pStZoiwW3aXKU0dJmyJGXpnCfpTYUuqB2OG678AFeLxeiyUkdHYafYogtduZiXUrITG4R63Cr7oWs3nERImXOQXiUf8eS8ZVhE9q67i00faKZXjyllwoRlinrRwCBv9rbpb2oNVGN20QNlCM0iiQ+ywALE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236041; c=relaxed/simple;
	bh=1xFjpqsiK1UQYwyyiXC7mYzP6CcNQH5rmkYvgPQmtGg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=fEqTkJft6789qxaIGlpPKfFoBpA+kPkMJtOlrgILnPVs5gdj34ChWD9hcmedA3Y9GxyV3EoqL6c7cdc7BuB721YKY/gY1eXXhijSLWI8umHogyZmlw5PAKPvlopt4upIk5f02GT/eXNdbfSA5lmn5Vkif2fZDmtywIAYqvcYDb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GVuwr0Kj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVuwr0Kj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585CDC4CEEF;
	Wed, 18 Jun 2025 08:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750236040;
	bh=1xFjpqsiK1UQYwyyiXC7mYzP6CcNQH5rmkYvgPQmtGg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=GVuwr0KjCRZ1NH1xzWexV2R1TcXuvv24Ddgi5wlPOmSPEAaqYSrbsAqZ2laqO95f4
	 nhmBwJ+74tD8AyWVhNTsTdRXNgD9qu3zaNvrW04HR8UCbycQ5m7X/IHI+Jr579yBo1
	 ZdyJuwnLP20+a0fw2i9sJCnP5sOnLG3vhnkxXRdMfFy0epeQsXPitLbUBR/0k8B75P
	 y7L5LDEr+lqHMqMyA/ydsYt7dTWlmXz7+A6FZVwm+WMkp7tZ41cFOFP14owhTIsgjM
	 lYBM1QlYX5ZTaDrbRDm79b3i24TOJ6KfvrFihAsOnJ16VFYCtyefwLz160Fs77kiiy
	 KyWb8Eg3xYOeA==
Date: Wed, 18 Jun 2025 03:40:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, gastmaier@gmail.com, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Jorge Marques <jorge.marques@analog.com>
In-Reply-To: <20250618-adi-i3c-master-v3-1-e66170a6cb95@analog.com>
References: <20250618-adi-i3c-master-v3-0-e66170a6cb95@analog.com>
 <20250618-adi-i3c-master-v3-1-e66170a6cb95@analog.com>
Message-Id: <175023603936.750172.15809343122614690485.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: i3c: Add adi-i3c-master


On Wed, 18 Jun 2025 09:16:43 +0200, Jorge Marques wrote:
> Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> core that implements the MIPI I3C Basic controller specification.
> 
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  .../devicetree/bindings/i3c/adi,i3c-master.yaml    | 63 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 68 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i3c/adi,i3c-master.example.dtb: /example-0/i3c@44a00000: failed to match any schema with compatible: ['adi,i3c-master']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250618-adi-i3c-master-v3-1-e66170a6cb95@analog.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

