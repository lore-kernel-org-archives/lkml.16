Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E188029AAF8;
	Mon, 14 Apr 2025 12:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744635421; cv=pass; b=DyQy+vaSfGCw75n1m7QPFCm3NgFf3aBwwL/xCfJTnd5mG2ZMYrP2Jow8/dNR+EtCPnwCHjLt9tTiWGbYEG2bsrLmLPVf33dAc2I2ucyQgALM+QL2fYNA6UyneD++NyOlkqYxz/k2Gh33td3JNx7r29/NE4n0j66vOTbfGrYh2Bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744635421; c=relaxed/simple;
	bh=VUOkR5sUA0G3NJTjmivVhKube3A6Xr80jMqBw3M0FqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GwE1keLDJ/3HS9+2ohFRMOUTdsc4SkcTDifo8BwlDABJuMqQQ8uW9z0Yag34TJ/NTOTuFRtpRpHgn20oK08YXBXnOgWLZ5OTGPM96NmCLpyJqoZgG3sBSBX7+brzB2te/uMFHrDXbI030FqtRiEtBze3SVelccD/g81wg9v9cQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=iikD1J/q; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="iikD1J/q"
ARC-Seal: i=1; a=rsa-sha256; t=1744635360; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UI597fmXtOSb+2G6X3WD0BJck4aQlhdbIYlvgYtlZXCezM1758SpojGW84WEpgvuX0ojC/xbsq4CNRdQtzJGH6QkKu4RQboLOzMGuSDa2/lK7SoLUtnld06ZZwyjMhBcr8eMIc22i1JK6xAXGPyIFRd8QmLmyh2IKidXJWLkQJY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744635360; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2SFcmr+j/cQ+KV0XcTEr8Yx/IrB/lqPJKyq9x9rOqDM=; 
	b=NFvJoVPLpyIq5+IsxJBnqaqAnd3hYw1FHYQeT4/QPQU2i1y8BCKnbs5CGony7cQ3dbq7EfNLPu9yEE/CdCO/fWuAXtyRvraV+q0cweE9UHMRghwqUOmDTSnHpWPJ/j3pkp/dJLmOsqmqXS2EJXatQEMVpHdM1xL22iWD3pz331o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744635360;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2SFcmr+j/cQ+KV0XcTEr8Yx/IrB/lqPJKyq9x9rOqDM=;
	b=iikD1J/q/Qu4ulEKf6I2r8Lj+AlDwh0chOcNmvs50KLpDXFa38L159aDIAsTmmwg
	82JkPYeLw5jHKGcFzjDJSvvULJseuD/PsTPYgGDe6J0B1LxSimhdHeoVhEf7R9gT6eD
	kBUyloZGekInPd0NQdehOA7dy+AR43MEdgB4AtAM=
Received: by mx.zohomail.com with SMTPS id 1744635356934791.9442392785247;
	Mon, 14 Apr 2025 05:55:56 -0700 (PDT)
Message-ID: <956d76b0-4f82-4f95-8f70-70896d488bd3@collabora.com>
Date: Mon, 14 Apr 2025 09:55:45 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] riscv: dts: eswin: add HiFive Premier P550 board
 device tree
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Min Lin <linmin@eswincomputing.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>, Yangyu Chen
 <cyy@cyyself.name>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Yu Chien Peter Lin <peterlin@andestech.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Kanak Shilledar <kanakshilledar@gmail.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>, rafal@milecki.pl,
 Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
 <20250410152519.1358964-11-pinkesh.vaghela@einfochips.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250410152519.1358964-11-pinkesh.vaghela@einfochips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Pinkesh,

On 4/10/25 12:25 PM, Pinkesh Vaghela wrote:
> From: Min Lin <linmin@eswincomputing.com>
> 
> Add initial board data for HiFive Premier P550 Development board
> 
> Currently the data populated in this DT file describes the board
> DRAM configuration, UART and GPIO.
> 
> Signed-off-by: Min Lin <linmin@eswincomputing.com>
> Co-developed-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Tested-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>   arch/riscv/boot/dts/Makefile                  |  1 +
>   arch/riscv/boot/dts/eswin/Makefile            |  2 ++
>   .../dts/eswin/eic7700-hifive-premier-p550.dts | 29 +++++++++++++++++++
>   3 files changed, 32 insertions(+)
>   create mode 100644 arch/riscv/boot/dts/eswin/Makefile
>   create mode 100644 arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index 64a898da9aee..29a97a663ea2 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -1,6 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0
>   subdir-y += allwinner
>   subdir-y += canaan
> +subdir-y += eswin
>   subdir-y += microchip
>   subdir-y += renesas
>   subdir-y += sifive
> diff --git a/arch/riscv/boot/dts/eswin/Makefile b/arch/riscv/boot/dts/eswin/Makefile
> new file mode 100644
> index 000000000000..224101ae471e
> --- /dev/null
> +++ b/arch/riscv/boot/dts/eswin/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_ESWIN) += eic7700-hifive-premier-p550.dtb
> diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> new file mode 100644
> index 000000000000..131ed1fc6b2e
> --- /dev/null
> +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2024, Beijing ESWIN Computing Technology Co., Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "eic7700.dtsi"
> +
> +/ {
> +	compatible = "sifive,hifive-premier-p550", "eswin,eic7700";
> +	model = "SiFive HiFive Premier P550";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};

Although commit log says that this includes DRAM configuration, looks 
like it's missing? In order to test this patchset, had to add this 
following memory definition (picked from vendor kernel repository):

     L50: memory@80000000 {
             compatible = "sifive,axi4-mem-port", "sifive,axi4-port", 
"sifive,mem-port";
             device_type = "memory";
             reg = <0x0 0x80000000 0x7f 0x80000000>;
             sifive,port-width-bytes = <32>;
     };

Regards,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

