Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12285FDA7;
	Sat, 19 Apr 2025 15:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745074851; cv=none; b=bHgaI/ActC7jspqvMyameZu4UeU544OXNmZrxlASNN75q21Ldl5LGG6YG5itkVIj/Q6l8TPw77tR035AJg/hc1zZDaLuX4bjLH2xPm1NqSPWoLyCwO54oa/JHYXgZsSHsn9x7NlVmjE+eKxiD1Qfu/o1cU0EMjkKuR/a/4TkYlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745074851; c=relaxed/simple;
	bh=hlsPtJVnuPKLLkT6rG3niyQxESPITc3W7OLPOqOZ0gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rfh6jmmt1Tj5G10CxAXnXRjA9yoml7AbUvcPHOfm43Vszlsa6MqmpVb89JLfIof65FcuvJYXa61hz60oDfHF0eAo3rAedmcxp5ABudqMucv4sioVuViT5Kyxqa1AP7kqep93LP9lyW74WZYusrTjLwuqWlBGCl0TAMNnHTnl+Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EAQRyIKS; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EAQRyIKS"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53JF0hPB513772
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 10:00:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745074843;
	bh=PpvR0IMuxPw5kJWlGO1BLJ0osU8LqFro9Urc9PQGvVg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EAQRyIKSsaMabiLJCmwqQnB8iDfG6UitSt5j0jXC88IPe13DYlDKECLEZN0UoSJuJ
	 ycfDo/3Ykl8qJVW1d+VP3JYgq2X07kslg0Gt2wHtQFDCGT/DKKKECOnHkouuUKSCVJ
	 IezQfQR6gKiOm/tvb63kcwYU8g4sgeuPV/dM/5Gs=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53JF0hWU013292
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 10:00:43 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 10:00:43 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 10:00:43 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53JF0dG0012676;
	Sat, 19 Apr 2025 10:00:40 -0500
Message-ID: <8f9aad2c-8e51-409e-be90-21230a53a4cf@ti.com>
Date: Sat, 19 Apr 2025 20:30:39 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm64: dts: ti: k3-am6*: Set eMMC clock parents to
 default
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>,
        <u-kumar1@ti.com>
References: <20250417233040.3658761-1-jm@ti.com>
 <20250417233040.3658761-2-jm@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250417233040.3658761-2-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 4/18/2025 5:00 AM, Judith Mendez wrote:
> Set eMMC clock parents to the defaults which is MAIN_PLL0_HSDIV5_CLKOUT
> for eMMC. This change is necessary since DM is not implementing the
> correct procedure to switch PLL clock source for eMMC and we have a
> non-glich-free mux. To remove any potential issues, lets switch back to
> the defaults.

IMO, we need to fix DM  if not then documentation [0] .

Then only this patch is ok because as per document [0]

removed clock by this patch is valid parent for eMMC.

[0] https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j722s/clocks.html

Thanks

Udit

>
> Fixes: c37c58fdeb8a ("arm64: dts: ti: k3-am62: Add more peripheral nodes")
> Fixes: d3ae4e8d8b6a ("arm64: dts: ti: k3-am62a-main: Add sdhci0 instance")
> Fixes: b5080c7c1f7e ("arm64: dts: ti: k3-am62p: Add nodes for more IPs")
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 --
>   arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 2 --
>   arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 --
>   3 files changed, 6 deletions(-)
>
> [..]
