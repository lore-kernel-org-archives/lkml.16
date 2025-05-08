Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F2A2222C0;
	Thu,  8 May 2025 07:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746688201; cv=none; b=JrA/0JHfzTzBLeU2PALTBCKZs/gtMXH0iPC19i5Il05JaaPsi0CgzNo8yRlI6/g+jZdFy5I1dti+z7Tm5sOskx98ZJDs4dfc9rNNOzWhBErP80Jv/zLluelWSUcSZ1esJNlk0xEdwynHxTEnljVQGvsyc2cwbyZOXHlukcKLb68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746688201; c=relaxed/simple;
	bh=SPCMfBae4c32mBCIvKXGGN6phuuMewMdj5VLCcFNbi4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=PWrQPIfqwTIDPC34us2QH+3q/YOgJJ++6BMWs1GAlZOl5o+lH/bbHsohENMyaCEi9J1aGLMbxP3FBiY0ZCs+gskIYLSD4KN691Dprtp8jYbTdGkzaiAKFw2iJz8+NRD4hF/sogMHfAzYBXXI1On4iBF2i3GNAi07v5RW/KeOI90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QRKbXzjb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QRKbXzjb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962B0C4CEED;
	Thu,  8 May 2025 07:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746688200;
	bh=SPCMfBae4c32mBCIvKXGGN6phuuMewMdj5VLCcFNbi4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=QRKbXzjb991/iETG77YEP2lCudXojwnfdPEM9H3CydmQrg0SKEwzNOYWErlKNbNbs
	 UP/KeHE+DpSJjASyg6Aj/q+bpOMWQczFM/QxeOp5rUMW8t2xou/VoSQfEUW9Cxn8Km
	 FeAFbMH4CKCfukpBD4RxTzu+v+NvAJgosv0poH0k192XYNbPbcOY560JYpSVrl9Bv7
	 H2YpQOsjuwwUwBXslhdSCHUNHwzEHDjOKfk2HkLCs4VTAg9wOo2PgKoFd/KoR4GGZw
	 eD8UCuU4GR0FTW/YuFL6LuuZhTnFHCZYQtr1PSVcBSw3Axo8RCb8Za9UQ278YSMf37
	 44hCQRV8In2oQ==
Date: Thu, 08 May 2025 02:09:59 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>, 
 Dragan Simic <dsimic@manjaro.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <20250508064304.670-3-kernel@airkyi.com>
References: <20250508064304.670-1-kernel@airkyi.com>
 <20250508064304.670-3-kernel@airkyi.com>
Message-Id: <174668819101.3553983.10022669758074843982.robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml


On Thu, 08 May 2025 14:43:04 +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Convert cdn-dp-rockchip.txt to yaml.
> 
> Tested with:
> 
> 1. make ARCH=arm64 dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml
> 
> 2. make ARCH=arm64 dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  .../display/rockchip/cdn-dp-rockchip.txt      |  74 ---------
>  .../display/rockchip/rockchip,cdn-dp.yaml     | 148 ++++++++++++++++++
>  2 files changed, 148 insertions(+), 74 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250508064304.670-3-kernel@airkyi.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

