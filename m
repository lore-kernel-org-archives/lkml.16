Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F811293464;
	Fri,  9 May 2025 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746798331; cv=none; b=aSvuXxYYxCBtff4Ov74vicAjV5yAgCUBXPBaNw4LhbSI6/k0vtYoRmK7ElKw0zZzWPMXyACnccvs/XQEvv3B/PpHvJH2UVv+ywz6Euye+wzCPwZdhoYN+c5hIQ4CEaGX0ZhKy+xalYHE23LGWtLho/5j0APBbI4a+nC6uVTdIt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746798331; c=relaxed/simple;
	bh=v5Uak0RcmfjhTO5Ysk+NhysPrBjg5pgA9cE1Hgd2gfE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=oP8WXgJtf1Z7WD2vQN1DGymTt9bMlboqXqZN0jD58nx9DmugQT6cJPghq10u00ZtoR6KEhhUGfB4FCuxj8aW7IXiVH+wOp/SgH+IcAYjtrvAjbXsHP381THv3uoquiXS8wnMg1+tFcf+xUwZgT6b/8rqg3v4KGlwf3QqTHZnU8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHMEwdP2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHMEwdP2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DC6C4CEEF;
	Fri,  9 May 2025 13:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746798331;
	bh=v5Uak0RcmfjhTO5Ysk+NhysPrBjg5pgA9cE1Hgd2gfE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=iHMEwdP23ywmij2dIw06QIo1o6RyOrSI+/zsCUo5nDKnUyppRzFrGEvOZ5PXwhj/F
	 HMaL5F7Jd+nsTV2PeECplWgyg998OJc2hYhu0RYzRRzdUi39Hr7hZ+dEE96nl4KanE
	 Mf7qKeRNhFFHkUHpkgMbdpEu8el4vEHEb8cjcLbIVIQgBjPQyzPpQ+gRJkfsrexTkk
	 TJUd/vwH+S6QEvA2mxVyMV4q4QIXAlQYHgAU8eek2BOkuGqMFdCL1Cu4Im9S4Y4Asy
	 X5ALlmXBPwdgyXhNwqVPVZRU5vJaVnqW2yv3ewUpZm1hFQqcPjfwNokpZNt6FarIvL
	 nAxP6/23PbmFg==
Date: Fri, 09 May 2025 08:45:29 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sandy Huang <hjc@rock-chips.com>, linux-arm-kernel@lists.infradead.org, 
 Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <20250509070247.868-3-kernel@airkyi.com>
References: <20250509070247.868-1-kernel@airkyi.com>
 <20250509070247.868-3-kernel@airkyi.com>
Message-Id: <174679832782.3268212.14187145716217204354.robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml


On Fri, 09 May 2025 15:02:47 +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Convert cdn-dp-rockchip.txt to yaml.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v2:
> - Rename binding file name to match compatible
> - Add more description about grf/phy/extcon
> - Fix coding style
> 
> 
>  .../display/rockchip/cdn-dp-rockchip.txt      |  74 --------
>  .../rockchip/rockchip,rk3399-cdn-dp.yaml      | 158 ++++++++++++++++++
>  2 files changed, 158 insertions(+), 74 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/display/rockchip/rockchip,cdn-dp.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250509070247.868-3-kernel@airkyi.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

