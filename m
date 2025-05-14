Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961223C465;
	Wed, 14 May 2025 01:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747185618; cv=none; b=jDTb6sr8bSVR9cRrBfOZa5n1kJ/SJUsbhsPg4HQNVgarRJMU8RsI0RHzuhRjEz6jxKnprlRh8J2YzMKzvON3K08RzjZSkupX6+nFvpriq0pgFsrVJkiSAXh2UFipTJoUAD9ItKU0sOHncEmRPHM1DMVpDECf2RMZ0Srv+lhWrys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747185618; c=relaxed/simple;
	bh=KdGOJpWhkG5aCZovyVjlPOMdNid9TydX7NrAFCJGDjA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=MsHY4h0b4ZklZvUO2Z4R5rptfNVHyKrZZQKopEndbaHf3Qxrn1us/ws1YEuZI8yRt0gSPUqW3zsV2VlSewMdOiwlAHwb/BHCz1lwMmr9l7EvgBq+V3AQ+SYIxxP0d+Zr1pSg1rdIXvCTdJMPb+7tiZg5FFak5FNhfYOFaV60ipI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVnbcZ6I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVnbcZ6I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5AAC4CEE4;
	Wed, 14 May 2025 01:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747185616;
	bh=KdGOJpWhkG5aCZovyVjlPOMdNid9TydX7NrAFCJGDjA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=LVnbcZ6IbRsHUSEP7DCi6RcHJn+aTvvSA/QNWMkyu/yQljQafO0gJg06ArLlE3uXf
	 vr7pH3yiSTi+MBX4S6NhkmnwjjDGMAVMY0ik5RckJDjuhP6cw0BLhqXzjklQf54lZW
	 ZU4b/3URTI4BLp9WNhqDJrUKWxg0Sz27IdmTCCBgvaO6pmvnynHHDbjZYoWfxgl5X8
	 U9FYlt1eyFgZF/T0rwdffNVbrX4W06dYnVB4xpbRGv7SiAgU3s9ED/sVnPorqoOYTH
	 zDPI2bsOFyqL0bs1MhDknacjGPQnq0315sQ1Lzt8nFd/Pc/bZX3/ykNAF9ZLyM6aEX
	 oU91Dk1w4e7RA==
Date: Tue, 13 May 2025 20:20:14 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linmin@eswincomputing.com, krzk+dt@kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 mturquette@baylibre.com, sboyd@kernel.org, ningyu@eswincomputing.com, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 huangyifeng@eswincomputing.com
To: dongxuyang@eswincomputing.com
In-Reply-To: <20250514002516.290-1-dongxuyang@eswincomputing.com>
References: <20250514002233.187-1-dongxuyang@eswincomputing.com>
 <20250514002516.290-1-dongxuyang@eswincomputing.com>
Message-Id: <174718561404.161129.10398945158829194944.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: eswin: Documentation for
 eic7700 SoC


On Wed, 14 May 2025 08:25:16 +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> Add device tree binding documentation and header file for
> the ESWIN EIC7700 clock controller module.
> 
> Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---
>  .../bindings/clock/eswin,eic7700-clock.yaml   |  43 ++
>  .../dt-bindings/clock/eswin,eic7700-clock.h   | 588 ++++++++++++++++++
>  2 files changed, 641 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
>  create mode 100644 include/dt-bindings/clock/eswin,eic7700-clock.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/eswin,eic7700-clock.example.dtb: sys-crg@51828000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/eswin,eic7700-clock.example.dtb: sys-crg@51828000 (syscon): reg: [[0, 1367506944], [0, 524288]] is too long
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250514002516.290-1-dongxuyang@eswincomputing.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

