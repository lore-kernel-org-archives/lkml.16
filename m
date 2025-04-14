Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA9C29AB18;
	Mon, 14 Apr 2025 12:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744632701; cv=none; b=edFaKJsS8sy+y1o0qGNnP2jBtQAigYtiZs4dZLGCe/jwFUm+G3pPqdwX80QliA0FaKcZVOpIOkt+OII7GhZweCCitcW2/q9GySaqCWqtRKVdwNmgcJjxSQ7JTi08dEH2Zf65WmG4MvLc9GyIuSJJpqmx2g756lHTUGYs/Te4BXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744632701; c=relaxed/simple;
	bh=0M3qRoyPJwBJF72GEzdV/WEuh/2ElnDu876t8GQlNEM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=AIy/AQXt9GGDcaTPrL6RKz18HBVo1xhz/bOPpnmgi/fW7Z4jsWO06P9ncUV46gAVtoXr/V4inLKId/hP64b/WznQR+g8Hc3/1k4nhuvo0ztVYmbP1T5+7AI5wyhO72Bf9R2CNRcgHNIu4xgBS7YoG9RtiV0fo+GraRupvMnhPDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgNn8jNt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cgNn8jNt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDAB0C4CEE2;
	Mon, 14 Apr 2025 12:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744632700;
	bh=0M3qRoyPJwBJF72GEzdV/WEuh/2ElnDu876t8GQlNEM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=cgNn8jNtfy2oO8wAUQLMgWIpNQLRz1lZOb382FKfW3unhP3t8UUssZqahm/xiXKwf
	 jvyQf+qft3aRwiGecrB/XqIfK0O+SX/mAb2RmLslRAOXgFB/6nqsW6+I+FjIM03Gwo
	 /EFjaFhaZ32i62Fb4I8xdkb4+WN0Ifx2KFb7g+PXGqXc6huLQYxmxvU2OHcQFVqmuT
	 62u5U6JnCQlCCrDSJGWczsNcPf2HgdRgFVd+aKt1hzI8Dr37fap4hTJdAbVdUn9X60
	 S8CHLCpQ7lRxl+D9uudlcFW/YRXFu3QtbtHGqECqssGHGGzqjFqtd/fQnoJK7Ig8MZ
	 i9XZOUlB/TygQ==
Date: Mon, 14 Apr 2025 07:11:38 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
To: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250414-clk-measure-v2-2-65077690053a@amlogic.com>
References: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
 <20250414-clk-measure-v2-2-65077690053a@amlogic.com>
Message-Id: <174463269823.14040.7362554560667126238.robh@kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: amlogic: C3 supports
 clk-measure


On Mon, 14 Apr 2025 18:12:29 +0800, Chuan Liu wrote:
> C3 adds support for clk-measure.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml: maintainers:0: 'Frank Li' does not match '@'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

doc reference errors (make refcheckdocs):
Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
Warning: Documentation/arch/powerpc/cxl.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-cxl
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
Documentation/arch/powerpc/cxl.rst: Documentation/ABI/testing/sysfs-class-cxl
MAINTAINERS: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
lib/Kconfig.debug: Documentation/dev-tools/fault-injection/fault-injection.rst

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250414-clk-measure-v2-2-65077690053a@amlogic.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

