Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009B32D46D0;
	Thu,  3 Jul 2025 10:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537973; cv=none; b=ZMezxbURErTM/rvG7qTDaW8NVAwNVygRlUpzH0bM1PjfWAVsfDDs07emlsx87Wz9DvzZw0Q5lQpyaHmSGi4l66gKSHAl3TazaUP5wKEXzN+D+pPAxGXPL5HVaQjLKjrGU11oSO3Eg5bZ1bCMFed5YMieuDxD5y25Aj6KV1Uh9Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537973; c=relaxed/simple;
	bh=6r+LqpL6KA2efSJCVmUCNNxEdOtaWMQouGC4z+YYw4E=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=BM/Sa6dlhNrQVjCCVwMXVvBZai7MzASvQfCwiO3Us8bWUOWO/FjpF3c1FnG9UBmSJZ7R54ov976a1NdAoRXWzPr8bK4XC2Q+TjK/REp7nzF2Ad1wmKYLAgYq5ciNxqo9CV2Cus0UJlQzMs+SfiBKfVf7Zl6wcmes3uR3xZP0n4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNFLo32U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNFLo32U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C5F3C4CEE3;
	Thu,  3 Jul 2025 10:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751537972;
	bh=6r+LqpL6KA2efSJCVmUCNNxEdOtaWMQouGC4z+YYw4E=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YNFLo32UcazxUvoPjazKAKec3zRIhjcZjy9aZW5xIpR7iyYaXGfJEgFQ4qSKLj9s7
	 Hh33md7sT92kyDqWEutMGiywsTixGcMRLcYIshnSFZ+6pdD/FT2+y5mJQIziwtEVCL
	 ztnxPL+RQza6KXSwqUCAyEDm5djhFVYJS9Fsv3wXIRkzE/vC/pkDnApbju1QnsHXyv
	 VWDIVzggWvxBRs7JfRi/aV0SSfbWbjujR0kYoFv+N5rgQBu+ypzm51e4xjfVqte15f
	 xH6pBYioIQQGFtNQfjnCtLy+x51KBUezJ6vrnUOwZHT+XAiNhbm9aczLaLqfohTfNM
	 UD32VD/x8dD4w==
Date: Thu, 03 Jul 2025 05:19:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 linux-kernel@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Jaroslav Kysela <perex@perex.cz>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, sound-open-firmware@alsa-project.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: "hailong.fan" <hailong.fan@mediatek.com>
In-Reply-To: <20250703075632.20758-2-hailong.fan@mediatek.com>
References: <20250703075632.20758-1-hailong.fan@mediatek.com>
 <20250703075632.20758-2-hailong.fan@mediatek.com>
Message-Id: <175153797140.484478.11959606684592113866.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: dsp: mediatek: add mt8196 dsp
 document


On Thu, 03 Jul 2025 15:56:23 +0800, hailong.fan wrote:
> From: Hailong Fan <hailong.fan@mediatek.com>
> 
> This patch adds mt8196 dsp document. The dsp is used for Sound Open
> Firmware driver node. It includes registers,  clocks, memory regions,
> and mailbox for dsp.
> 
> Signed-off-by: Hailong Fan <hailong.fan@mediatek.com>
> ---
>  .../bindings/sound/mediatek,mt8196-dsp.yaml   | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-dsp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/mediatek,mt8196-dsp.example.dts:18:18: fatal error: dt-bindings/clock/mt8196-clk.h: No such file or directory
   18 |         #include <dt-bindings/clock/mt8196-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/sound/mediatek,mt8196-dsp.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1525: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250703075632.20758-2-hailong.fan@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

