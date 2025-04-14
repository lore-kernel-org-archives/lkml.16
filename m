Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E9D1DFCB;
	Mon, 14 Apr 2025 12:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634029; cv=none; b=WFoFWmc2S0uh2douVJPpZKIuPFfX4QhUsv1ULsApevVqM1YshYpVZqk0vAXhy78zuX0KA2rp5XoOG+a3rzlQzRmouiZzTWlwJOsKWGYY7zufD7gU0f21VfOPip2449qNC2JfscAj63GmkXiYFnCYHQk/hGCEO/LchKdsGUOna6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634029; c=relaxed/simple;
	bh=t1toO7w3jtiuM0z/5E1BAN7M3f4Zd+MamGderKQMHzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4Hn/bEhhCwLRJlQ6YwyuepxioUFGoB+6VUWd4Pv+arRoI8uwOXR71Dl3uoFPO/hFUE7qzvcx/667uRWeWZwbB1vSNe+bt7wOfrSCQFEUhi4Kl4szn3iDsjSdIvBg6FxThPeXyT4ihhm54uAJH0CLg9HmduaMxEDD5EMmqPoSpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqAOEOU5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqAOEOU5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C29C4CEE2;
	Mon, 14 Apr 2025 12:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744634028;
	bh=t1toO7w3jtiuM0z/5E1BAN7M3f4Zd+MamGderKQMHzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EqAOEOU5Ih2l7qouIuhnxB9hV7Y69NDFwpQEF6kwT7giPfHPw7SGHoFF7xOZOYB2n
	 +eKi9YsDDnp1BaKR4FYNiGkITE+WfTM4ThI0NqaNQJsftC1y8vYnkKfFbcZQJ0CO5o
	 uMqA+g69thaaR7ReCAF/FO1cQ6ZkehQxhPHm9iukWSMX6tdx0S26dqdA+I6uvAlLBF
	 WDaiPY7luZ2XkkFxhtA49ma6RoiNLzT+xBuL5W//4SapxL2tuo7qwIeEU4v5oUa5CU
	 7WcMd9SQvxpDu/sTZSbQcFcT8svQm+fI/SnAHROhfnF1sGtXeBbB6JBYcz0eZD++Dd
	 LZY/naVHEnqjg==
Date: Mon, 14 Apr 2025 07:33:46 -0500
From: Rob Herring <robh@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: amlogic: C3 supports clk-measure
Message-ID: <20250414123346.GA135245-robh@kernel.org>
References: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
 <20250414-clk-measure-v2-2-65077690053a@amlogic.com>
 <174463269823.14040.7362554560667126238.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174463269823.14040.7362554560667126238.robh@kernel.org>

On Mon, Apr 14, 2025 at 07:11:38AM -0500, Rob Herring (Arm) wrote:
> 
> On Mon, 14 Apr 2025 18:12:29 +0800, Chuan Liu wrote:
> > C3 adds support for clk-measure.
> > 
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> > ---
> >  .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml    | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml: maintainers:0: 'Frank Li' does not match '@'
> 	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
> 
> doc reference errors (make refcheckdocs):
> Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
> Warning: Documentation/arch/powerpc/cxl.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-cxl
> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
> Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
> Documentation/arch/powerpc/cxl.rst: Documentation/ABI/testing/sysfs-class-cxl
> MAINTAINERS: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> lib/Kconfig.debug: Documentation/dev-tools/fault-injection/fault-injection.rst


This report can be ignored.

Rob
