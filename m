Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC8B27FD7A;
	Tue,  3 Jun 2025 09:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748943754; cv=none; b=ur3dMR1hJpjqLYWebqRE7uMxzNYA5dnewdrAYQ43VY9owb43V1fXySmp8ixhafAUjlfVUe2nU70+x4j/M6e4Hy8i+JHwdgP4iwBKPTx/ZMZQk3kI94ocBFaTN7AH1vGQRE8TEYoHV+Fr92YPjDFCDvHxrpLcoArpF+miUq9c1Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748943754; c=relaxed/simple;
	bh=dbV/utlJZsAmXKza9Scy8Pvl3ynRvyPanNSPnq6zrJg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=kyTHITm1aCM+nr6bp5FL1bpXQfNh6rqVr/VhgVQTLWELmctmE1UhVWsWB/TXpMo7+M4+rz2A1smga7Unsg9jY7VlacafDUmu3qpINdJTDWtVNrKpVNUH3jklz5Jm4yRtoq570f7NtNtdi3mfv/Kz/G6dhQtrtXUft78lQxZJ4U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hkite6jM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hkite6jM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DCF6C4CEED;
	Tue,  3 Jun 2025 09:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748943754;
	bh=dbV/utlJZsAmXKza9Scy8Pvl3ynRvyPanNSPnq6zrJg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Hkite6jMMxAGOm50Ea2u62+Aep6JFDMPsX1jjU94Oe8lbTEiQTz9l5H137JrOLWBa
	 5fYPC67RSKTfte0X06ogcsaKBQ4iPotQCQMbY14IOv87Tp69e0Hgp7ecAlVZR77qEO
	 XOne9yF+muIfRfuHG/LxGd+GiBC221jT6MHtyf9CwOFd6ju9pbeVGL5xRWrK4SmzE4
	 Dm9pifWH9JD6cg7H9y3xl/zZcGvHalV/hWiuo6M3MjjPEF8E1p3HdIjAHHuMSGtSPG
	 tP98ZDF1uXOaaIS928Q+u+Gvym9V1Z1Stdb7anXKpHMM9t/mBSkH4OMGTjoXwBGB0u
	 fxlFJ4rNI0TDg==
Date: Tue, 03 Jun 2025 04:42:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 joel@jms.id.au, linux-kernel@vger.kernel.org, jassisinghbrar@gmail.com, 
 conor+dt@kernel.org, andrew@codeconstruct.com.au
To: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <20250603075450.133604-2-jammy_huang@aspeedtech.com>
References: <20250603075450.133604-1-jammy_huang@aspeedtech.com>
 <20250603075450.133604-2-jammy_huang@aspeedtech.com>
Message-Id: <174894375223.360822.13996455735829436919.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: mailbox: Add ASPEED AST2700 series
 SoC


On Tue, 03 Jun 2025 15:54:49 +0800, Jammy Huang wrote:
> Introduce the mailbox module for AST27XX series SoC, which is responsible
> for interchanging messages between asymmetric processors.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  .../mailbox/aspeed,ast2700-mailbox.yaml       | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.example.dts:29.27-28 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1519: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250603075450.133604-2-jammy_huang@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

