Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA4B12CD8B;
	Fri, 25 Apr 2025 12:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745585303; cv=none; b=J9hjAOT4Yg4NNCx18W1/tMC1ROlYPQ9cJl7AwmTDhqGXdJTApr9dyBv5Sg/IBkrvWeXU2LZ/0M6rY+tr6jbizZUWzE59IqxkRHvNkXL/dTsPE2h0Zs2Em7bS9nvj9K4WiqPzQxWaLRuln5iLy+W5KHBxnjfyY6C5WuRuRmDcyZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745585303; c=relaxed/simple;
	bh=xzBjYAL+Cmoi5JamH+7OnbMsijJECpaV2Fpa2Q7B9rE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FvuNjWSTpv2YJvfCi5onETHwCgQFZhL28hHNvnIpUHj9dGVd1U49omYJH8uN2xzrz2S2gfDId9RN9XoeM0mOeTVQj1ISaipdt/I3Ir0Y5Q1TAZKzdARLSxq7S+4ZF5HQP67tXxxs+jx1pgCfA+sRO0bLmVNTEDP/lTV8oN4Uxak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xbgUOApZ; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xbgUOApZ"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PClq6t2936010
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 07:47:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745585272;
	bh=j/Hj3c7jY39j+fuwEWeM6PzZhE4vdZHJduAlcVZNHWc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xbgUOApZeNS+Twt91FD+Q0Si9gTyC2kHi3t3nUoIAz3B9AHn6CXcy420dXm3ShO7C
	 7F5l6UkiZg+46msZ4y7J16BuqM1W/iYat2TId52JQ2OL8FsAlIhLa7U3sPLXN/bgSs
	 1WFAse/xkjOgSKjHm+jXtDb1z5u/WpAJ6e+FHIMc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PClqKx069718
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 07:47:52 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 07:47:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 07:47:52 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PClmD4042038;
	Fri, 25 Apr 2025 07:47:49 -0500
Message-ID: <865e0c92-296f-4fe4-971b-38ebfa90b8b5@ti.com>
Date: Fri, 25 Apr 2025 18:17:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-common-proc-board-infotainment:
 Fix nodes for dtbs warnings
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <devarsht@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <u-kumar1@ti.com>
References: <20250424080328.57671-1-j-choudhary@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250424080328.57671-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 4/24/2025 1:33 PM, Jayesh Choudhary wrote:
> Fix hdmi-connector and tfp bridge node as per the bindings,
> - remove 'digital' property which is required for DVI connector not HDMI
> - Add 'ti,deskew' property which is a required property
> - Fix ports property for tfp410 bridge
> - Change node names appropriately
>
> Redefine the ports for dss and for k3-j721e-common-proc-board.dts,
> add reg property for the port (@0) to get rid of dtbs_warnings in
> infotainment overlay when ports for dss are re-defined.
>
> Fixes: 9c0fa304fa56 ("arm64: dts: ti: k3-j721e: Add overlay for J721E Infotainment Expansion Board")
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>   ...-j721e-common-proc-board-infotainment.dtso | 57 +++++++++++--------
>   .../dts/ti/k3-j721e-common-proc-board.dts     |  6 +-
>   2 files changed, 38 insertions(+), 25 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtso b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtso
> index 65a7e54f0884..e4e5f941f20b 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtso
> @@ -15,12 +15,11 @@
>   #include "k3-pinctrl.h"
>   
>   &{/} {
> -	hdmi-connector {
> +	connector-hdmi {
>   		compatible = "hdmi-connector";
>   		label = "hdmi";
>   		type = "a";
>   		ddc-i2c-bus = <&main_i2c1>;
> -		digital;
>   		/* P12 - HDMI_HPD */
>   		hpd-gpios = <&exp6 10 GPIO_ACTIVE_HIGH>;
>   
> @@ -31,28 +30,32 @@ hdmi_connector_in: endpoint {
>   		};
>   	};
>   
> -	dvi-bridge {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> +	bridge-dvi {
>   		compatible = "ti,tfp410";
>   		/* P10 - HDMI_PDn */
>   		powerdown-gpios = <&exp6 8 GPIO_ACTIVE_LOW>;
> +		ti,deskew = <0>;
>   
> -		port@0 {
> -			reg = <0>;
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   
> -			tfp410_in: endpoint {
> -				remote-endpoint = <&dpi_out0>;
> -				pclk-sample = <1>;
> [..]
