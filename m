Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549998460;
	Tue, 15 Apr 2025 03:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744687854; cv=none; b=lZvQcF2L7+tk83EHMLYCIi338mk4Lo4fxgI398MSKEExodnlC2KN+27aQit0KV8+7729tPavZfbLkQt/7Em0y3y5dNfvMpap6FoOZ0enGRzZq+jWYnMSa3+P6YlrJgnOG8ytNXU1/ePTeGLqpKfDIt+adNfvvQgz2OtLyWDHjFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744687854; c=relaxed/simple;
	bh=oUQpqhzWVXdp7qUthWu4+FwVJs5T6FEKdE+LDL0Zth0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GQfnVmWfU0/BfjE45GdUwjlMzSl3evidDfCRGnjW+zQIyD3hhitkhKGAXeu24AQa+Nif8BCkbfD8CdoEX7n6kSQMujgQuwip+l1rKWdlZPKgv91JtCu1hCaOiPzfZ9kIoKcRZ07cgsgTAbb/5QuHJVbBpQTMjKvTNDv4r9U1fEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emoVDUEX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emoVDUEX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8659C4CEE2;
	Tue, 15 Apr 2025 03:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744687854;
	bh=oUQpqhzWVXdp7qUthWu4+FwVJs5T6FEKdE+LDL0Zth0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=emoVDUEXzCKPaf/UKFmsycT+RflvlzEn5RrTavLL+jTvjNDJFMPgpYI2ewq4hF6oS
	 FsM4qqMSKgHQoYRFHyhjjMFZH7DdM45qFnfQDKtO1KfmHl1s+uKdebTECOMrGNYbsR
	 Vaf3bENryMskS7yjbj0lD4CzF3tNu1VuyIG3y0stEHQUDgqA9opb/F5i/PYyiJiywa
	 kpPhIzN5PIdHt2EGP1oIIylGgf+FE/7NLlZ4QbuulMkowsJANMIOM6/l00xIB6uFtt
	 RhUX2OQDkHSTsRoKJxGDZxkeR9CLBLnkIyH6+6bibndxfhQdpbY1R/xBCpAnwz9Wzx
	 pYgFtYhDcnpJA==
Date: Mon, 14 Apr 2025 22:30:52 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexey Charkov <alchark@gmail.com>, linux-rockchip@lists.infradead.org, 
 Jianfeng Liu <liujianfeng1994@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 linux-arm-kernel@lists.infradead.org, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Jimmy Hon <honyuenkwun@gmail.com>, 
 Dragan Simic <dsimic@manjaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 FUKAUMI Naoki <naoki@radxa.com>
To: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <AD40AC968D12DF48+20250415015441.371214-2-kernel@airkyi.com>
References: <20250415015441.371214-1-kernel@airkyi.com>
 <AD40AC968D12DF48+20250415015441.371214-2-kernel@airkyi.com>
Message-Id: <174468785229.2606230.18106531706948394659.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add rk3588 evb2 board


On Tue, 15 Apr 2025 01:54:40 +0000, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Add devicetree binding for the rk3588 evb2 board.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/rockchip.yaml:1078:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/AD40AC968D12DF48+20250415015441.371214-2-kernel@airkyi.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

