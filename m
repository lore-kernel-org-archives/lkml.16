Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB38319C55E;
	Sun, 13 Apr 2025 10:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744540943; cv=none; b=KPGzM0rIWxl+M41DJuffP7dcuCJxNJYxgYUllE47XX2bjYby1s0lmigiMjHOX+ilO4h4vFJh7HvgzzW8Lq+wEl9/BLqUVSy+DYHdPlO0QaCZlZ4lUwGP457f3OXJg0cAKGX53Ern0BPQUjfPbNksugWFQmR7yZMBlO1grgiJpyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744540943; c=relaxed/simple;
	bh=+rVcpgNtIzq+wNAjUzyP7ADEcJbJHlPGwgRaSM2PZYs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=EhUtLxhZ+VAdrmJC0BuhFNAcfBU5PXlAxJBp3wlB76Z23NRrhg6kKAQjk873NLj8w7l+JB+1Dt78erv3x53UV/xJo3BoQoamDpvc8D8m30sipWP6yjdjWeXYbJXregeE/sv1mfW+F96U3rDu4B+XfdGTp2GUC4MUXTAFTG+qmYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwiUZdXN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwiUZdXN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B2CFC4CEDD;
	Sun, 13 Apr 2025 10:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744540942;
	bh=+rVcpgNtIzq+wNAjUzyP7ADEcJbJHlPGwgRaSM2PZYs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JwiUZdXNvgCm5rC9KB0QbwTvs1csueUgHMAU+OTSyb3HbnXDC/yBC2ZrTgu614nBc
	 Fg5EGg65YnsSq8WQFz3lxh/duqGl9vpR/wCTIdXunTVgKum8GvlgGCMMjhjXB07t+/
	 FkyKwFwCnoguoWCT1Rn1bTDs9aGkV1zCoMXGh72qvoxCgx/hgqwcZBRDSUQuENCoO7
	 6VQXyWp1wuXRbGyrkW8H3dwmCwmFt2n2e0ofmT8xS5/CnoU9HhVdH01ozAe0nsXKhq
	 gGW42B/OcYDVhbbEp9ACCARXTDumXS4ssYApO/ffmI7rYZsZ0C767tkNnPhy4UPzRr
	 EIakemrI9smIQ==
Date: Sun, 13 Apr 2025 05:42:20 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Daniel Golle <daniel@makrotopia.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-phy@lists.infradead.org, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 MandyJH Liu <mandyjh.liu@mediatek.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Frank Wunderlich <frank-w@public-files.de>, 
 Sam Shih <sam.shih@mediatek.com>
To: Frank Wunderlich <linux@fw-web.de>
In-Reply-To: <20250413085806.8544-4-linux@fw-web.de>
References: <20250413085806.8544-1-linux@fw-web.de>
 <20250413085806.8544-4-linux@fw-web.de>
Message-Id: <174454094043.2074029.12190125666379219189.robh@kernel.org>
Subject: Re: [RFC 3/5] dt-bindings: power: Add binding for MediaTek MT7988
 topmisc power controller


On Sun, 13 Apr 2025 10:58:03 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Topmisc is a systemcontroller used for xs-phy and ethernet on  mt7988.
> Add binding for it.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../power/mediatek,power-controller.yaml      | 35 +++++++++++++------
>  1 file changed, 24 insertions(+), 11 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:27:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:28:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
./Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:39:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:40:11: [warning] wrong indentation: expected 12 but found 10 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250413085806.8544-4-linux@fw-web.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

