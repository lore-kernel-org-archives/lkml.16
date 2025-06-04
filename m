Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9805A2900B7;
	Wed,  4 Jun 2025 14:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047752; cv=none; b=DK1UZ/VyTALGS248AqqqL1JRrQOPm/dR8A0Xyw4jHSRnFmrnpjxX0mFlSeYXEgPNZRZac4REuGMk6/bugzJ1sURaDeNezdCtbmVqTbGb1CuNodvA213CecDsmts716CdtnPheS7AUETrimi9vtpBEWRfFRNIr2XkXXin+UP73PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047752; c=relaxed/simple;
	bh=5t5I2NI/JMw2bEnJTqzhPKY9bh0Wo+3tCVbzxMva+CQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=aTq61p5kqUYb5+DS65EdAT0MQ9ytztl3IDZ/TVUwaFp8KCNoKudI4EnbO0bMmGU3oQDxgxSiZD6Js9fZZIcI9SiFjUnPhDbNUHVpBf3QDV6Ec/UDdk7AWgCC14Rockaux1Mu7/hvXGIxQAAPEd1Q+d6XlKMKI9c2Q2hcJ4e43Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H23h20oS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H23h20oS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA53C4CEE4;
	Wed,  4 Jun 2025 14:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749047752;
	bh=5t5I2NI/JMw2bEnJTqzhPKY9bh0Wo+3tCVbzxMva+CQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=H23h20oSkr5wnFXM8TFWBPGBAlo37cL9WeSh/3XpfRiqO85sbEluXHlyKDm6X+t4c
	 QxYRJ3LVtLul3FRNiRQzBU33RJVk/E2DSICZKHACGdrVOiF0pwy7YNX/utROFlN0xO
	 hkh/cOB0+K4gsRhr9bQV1KcPc3R+vMucXPoCviDd9Rz11hGxrmIj3xgQMPN3Gq0XXD
	 ydSmYx9TTcSovNlXaONNOmh7clCqKil33EG5EoalAZWs4zpkpwGdPjU8Em9EZe46Nn
	 ywAnKMrukcXgt2qVw3z+13ID6t4yYshD2Wy7cImNWDX/CVuTRNOUQPq88FigswQ5op
	 ybAzCNkTM9Ehg==
Date: Wed, 04 Jun 2025 09:35:49 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, 
 jassisinghbrar@gmail.com, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, joel@jms.id.au, linux-kernel@vger.kernel.org, 
 andrew@codeconstruct.com.au
To: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <20250604125558.1614523-2-jammy_huang@aspeedtech.com>
References: <20250604125558.1614523-1-jammy_huang@aspeedtech.com>
 <20250604125558.1614523-2-jammy_huang@aspeedtech.com>
Message-Id: <174904774987.4021667.10220150728052993146.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: mailbox: Add ASPEED AST2700 series
 SoC


On Wed, 04 Jun 2025 20:55:57 +0800, Jammy Huang wrote:
> Introduce the mailbox module for AST27XX series SoC, which is responsible
> for interchanging messages between asymmetric processors.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  .../mailbox/aspeed,ast2700-mailbox.yaml       | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.example.dtb: mailbox@12c1c200 (aspeed,ast2700-mailbox): reg: [[0, 314688000], [0, 512]] is too long
	from schema $id: http://devicetree.org/schemas/mailbox/aspeed,ast2700-mailbox.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250604125558.1614523-2-jammy_huang@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

