Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF5A19FA93;
	Thu, 15 May 2025 23:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747351364; cv=none; b=ZivG1iwc5nyfKhms8/0ehTdfamJz6N0DAlHicesSEOLVPeK7qNu7n3Av3PlGO5BFo+FtQxWW4TTndugSQz7cP+DtQmIioaNPIG0r/UP1EUSTmxAPaaCmavyAiQ37vf097G8tEbbZD8R0PbvHmeukumjTkcdzg/kyypv4s0joxno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747351364; c=relaxed/simple;
	bh=IS/K3Ek8GRgku52/v3bNvTifZFxoGH2TCxkymOy+OR8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Ij3kLWR0WcN3t4e7hUCkMna0Wh/5D4meYmGUzeLWJHkugQE+zDtHSsAoOJF4DoiIhFcMA6EC0G3wfroSOMQnHvQlPMkW7Z20+sbu9ShSAVAYX4A19o40LxNzTcvdfHL/QhdaSOUJWNNluotNlxxm9//LqPfSu3d2sZbObiOggDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vtw+7Epz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vtw+7Epz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19929C4CEE7;
	Thu, 15 May 2025 23:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747351363;
	bh=IS/K3Ek8GRgku52/v3bNvTifZFxoGH2TCxkymOy+OR8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Vtw+7EpzeULlJQMaVC3D74Msn/WNPF17N+9OmDHmN+6//Y++vF8enTvkoz2Gtx/EK
	 xPdOpxS/KYHghnQ9OEUmGnKjQqmKbwjJ1eDtBe1z9wxLhws3UeTzL/YXCSCblXPae7
	 iB7Z3E3R9xzO9Pv5m8gz0RmfVs6LmsmJAgMOCA6zWx/V53mtq/L2QR0H1NtK6Vh3WD
	 cRORGzU9UkUH4/dkQpMplBfeIUOvKW4U1Nj5wUNn5V6M5m2luEt8Ks1w/cb6Mo1e9k
	 9grWpfncWsRjQGqRQEKTSHbyEdPwPsrrBMiVwYesq9pOEF3qd7i6Eq+RIfQ05sxT5U
	 d9qLgJyEY02PQ==
Date: Thu, 15 May 2025 18:22:41 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Steve deRosier <derosier@cal-sierra.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20250515220034.393303-1-joseph.kogut@gmail.com>
References: <20250515220034.393303-1-joseph.kogut@gmail.com>
Message-Id: <174735136138.1544989.11909422896170025756.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Radxa CM5 IO
 board


On Thu, 15 May 2025 15:00:33 -0700, Joseph Kogut wrote:
> Add device tree binding for the Radxa CM5 IO board.
> 
> This board is based on the rk3588s.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/rockchip.yaml:846:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250515220034.393303-1-joseph.kogut@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

