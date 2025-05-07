Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30FB291860;
	Wed,  7 May 2025 23:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746659232; cv=none; b=ewEzAXbtLcxkfX6V6x56tTURJutvd1hx/VYWu8TEwjfy6q2ZYYtXU0p4lzKoLRv5gCv0SFq1O9+i63P6w128HFAveeAcQeWyypmsJT2je1TiSQVbNuRFwkQ45nZ3hBqTYZnKNrDzZtah6buc+hwXhAdiFfALeFznC1gMNdV/l0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746659232; c=relaxed/simple;
	bh=t1gjac8ZPVlmoGA9780a3d1MWtDrwkvDAD9J9rjOIjQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=n1k34NI44N0jovA9IYaxOvt3Q60qNLs6FLECwt1dbiA0cmSqyYnjg0MWqSoNnAjlcAylz0RGs3icD/mb0blHjxFYBj2nHcdTBa/K+hy0wUTye6nOxWkAvfPFcjgeSIPm8FpxrGPpgtWOOQeVvPG1+00XpxU+1BW5MK9r3F1foto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZdZGur8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZdZGur8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A39C4CEF0;
	Wed,  7 May 2025 23:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746659232;
	bh=t1gjac8ZPVlmoGA9780a3d1MWtDrwkvDAD9J9rjOIjQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jZdZGur8jMCeo3Gy5nWM9p50FLf8+cXaD0nnyDZkGf5EU3mowxUonqS6tCmMMJq+I
	 V7bSjeM9g3R94xB1jkUCUPVA8Ybr/jshgR0tRaf97DHot/gwiR9tfxzrGWBRa9fQsF
	 9aQpCmzq9BB9uyPYb2MZxUffcCAdpBucSCnY9WNfgKUDjKmz+agQjHAmzw0qg2yx2w
	 C/tJamtdiXTapqT6eLwnuhgNxRgmjSprF5BOL46k5lorRNcLSvWtgbftaBzdUEkPJA
	 FhlW0eSS2oA7hyPBIhObHmWFbEstCHvUon0AwYnp7EkMfgIMtmyj5DlHF/ZycOHzOc
	 417nRVAdGYCpg==
Date: Wed, 07 May 2025 18:07:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20250507215903.2748698-1-robh@kernel.org>
References: <20250507215903.2748698-1-robh@kernel.org>
Message-Id: <174665922811.2893796.9617092031140706801.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: soc: fsl,ls1028a-reset: Drop extra "/" in
 $id


On Wed, 07 May 2025 16:59:02 -0500, Rob Herring (Arm) wrote:
> The $id value has a double "//". Drop it.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250507215903.2748698-1-robh@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

