Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866B86BFCE;
	Sat, 12 Apr 2025 17:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744477766; cv=none; b=sJr4vNdW7RL4HY3Sh0HWY3gE9t5dsWcOZ5I5lLOnLjAIc9en4XcGHbWGGaIhNxvQCdPl1FHVNphBzjFHjreK75S3+bnM18s9mT/vznNSTmc3Qc9HXZVzANxYw0BjmACx4DeMxe2+QnkICwij2eqTFpeLeYO7AIvwMt1lAWXBFZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744477766; c=relaxed/simple;
	bh=0AfTfcTDNqBJUpHIEtVuw3wm5u8+gYscdgy87EVwLo0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=JSCTCIQapIJmlgh91LSgNTcNQozZGtx1T4BgWf+a8HQezdJwSCDdp1kuepFwEgMBqjJm5UWySSRIvv9AtKx0R5vx5+qcXYPCj3uaAmOk/WH2KNaOP0d8Ku2oOJIcoJegVYTcIhJRTuBnQf7RfTDdF8rKRqYXs4lNYxtHSWo44VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTNCdUzm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTNCdUzm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E59C4CEE3;
	Sat, 12 Apr 2025 17:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744477766;
	bh=0AfTfcTDNqBJUpHIEtVuw3wm5u8+gYscdgy87EVwLo0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bTNCdUzmxxvUvgUTxZPk91QJEYLOn/6SYDZA9YhmnJhMv4FSdUDSPpTFN7KyqzTTc
	 lichVb7RzvhfUwCqZShO4DuvMaJbvuzq5hxcAXoWu4WhPeQpPW3mKn7yC1Qc9sB392
	 WMmGErm8sgwlelWXei+FtQU2iMzvRpOaNdq2xHpJ8Y83faSsBjLjoYXE4ELDBx/2Ml
	 XjM9zb+AIf3Y2hr4n/Hp3+0o3Py5qkqON3sRBBfl9+WIFlMeWAFd0raBvxKGEneTUW
	 r/YtAesh6pIhSOHH6kshLyB/KikFGLxmFxsH/MgYtMgXKitRXYdh4gZ+jvfXzlWt4Q
	 FnLIxTMjpo2zg==
Date: Sat, 12 Apr 2025 12:09:24 -0500
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
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Naveen N Rao <naveen@kernel.org>, 
 devicetree@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
 Crystal Wood <oss@buserror.net>, Madhavan Srinivasan <maddy@linux.ibm.com>
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20250412-fslpmc-yaml-v2-1-98c0948a2921@posteo.net>
References: <20250412-fslpmc-yaml-v2-1-98c0948a2921@posteo.net>
Message-Id: <174447776411.1354506.14019622197188509443.robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: powerpc: Convert fsl/pmc.txt to YAML


On Sat, 12 Apr 2025 14:49:38 +0200, J. Neuschäfer wrote:
> This patch rewrites pmc.txt into YAML format. Descriptive texts are
> expanded or shortened in a few places to better fit today's conventions.
> 
> The list of compatible strings (and combinations of them) is based on
> existing device trees in arch/powerpc as well as compatible strings
> already mentioned in the plain-text version of the binding.
> 
> One thing I didn't handle are soc-clk@... nodes as seen in
> Documentation/devicetree/bindings/powerpc/fsl/pmc.yaml.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> Changes in v2:
> - Rebase on v6.15-rc1
> - Link to v1: https://lore.kernel.org/r/20250315-fslpmc-yaml-v1-1-10ba354a85c2@posteo.net
> ---
> 
> Note: The examples include a consumer (sata@19000), to demonstrate how
> sleep specifiers work. I've heard that "unrelated" nodes in examples are
> generally discouraged, but I'm not sure if it's better to keep it or to
> drop it in this example.
> ---
>  .../devicetree/bindings/powerpc/fsl/pmc.txt        |  63 --------
>  .../devicetree/bindings/powerpc/fsl/pmc.yaml       | 159 +++++++++++++++++++++
>  2 files changed, 159 insertions(+), 63 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/fsl/pmc.example.dtb: sata@19000 (fsl,mpc8377-sata): 'sleep' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/fsl/pmc.example.dtb: sata@19000 (fsl,mpc8377-sata): 'cell-index' is a required property
	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250412-fslpmc-yaml-v2-1-98c0948a2921@posteo.net

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

