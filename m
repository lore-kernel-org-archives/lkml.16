Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDAEB644;
	Sat, 19 Apr 2025 14:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745073321; cv=none; b=J7jioDNPfjkcxlahPhKES3PSGdONq08k05u1Pryb3FqCPXBqfsWUCioQ/07+Sx4cZlhPK+HFz7DxJKbORrlEYgMu8btL7vX+w11zlc6KF1x50jED+lb2Sozmy24qV+WRuS/BQeIQX3f1x5J7fGIpx6G5KvOXpJ8ZqRlKtnymngk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745073321; c=relaxed/simple;
	bh=y9XLP+Yl5+ScAX5m5mSWHiv5yZ6uUHlz1nh9iVtMtRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YL6SMSdmbidFEIKJgGdTJiokrMvlahShNBD85oP4smLeWvISTg7TgWjklEKBbAqi8J39DoDqdppZnnE7jwGIYxsS3kw/LLT/g8KhhDxUJ3PjcaJzC+6JuAwsdN93JdFMZKG4acD66OHlUKSVthXUf7mvW4qexl63fBL7/E4oD+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NixDSI+I; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NixDSI+I"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53JEZBZw1215283
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 09:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745073311;
	bh=lQ+pjMXC2Zmf+k3azV2wTZbnYLfzVS0FL+k8+g+kpUo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NixDSI+I+2n56yXHoyjD8dWB6M4CpFTB37/qCm5o8pcAuSf3iAqlBug9dNYFAqLNl
	 vXh4ZW135cr52A7o5049pjMgvfec7VEuhh0DhB7J1bX9b2FtLKxyQm3DK1G6ALgXCH
	 JOf48wcyNtA9LXqdDCTS7mYwkGi5SRXzn3VEOD+I=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53JEZB4V006564
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 09:35:11 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 09:35:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 09:35:11 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53JEZ6T4116797;
	Sat, 19 Apr 2025 09:35:07 -0500
Message-ID: <a6e16f44-884c-4b36-aa87-306a764829d5@ti.com>
Date: Sat, 19 Apr 2025 20:05:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am67a-beagley-ai: Add bootph for
 main_gpio1
To: Nishanth Menon <nm@ti.com>, Jared McArthur <j-mcarthur@ti.com>,
        Robert
 Nelson <robertcnelson@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
CC: Roger Quadros <rogerq@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <kristo@kernel.org>, <u-kumar1@ti.com>
References: <20250411203950.2859356-1-nm@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250411203950.2859356-1-nm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 4/12/2025 2:09 AM, Nishanth Menon wrote:
> main_gpio1 controls the voltage for the SDcard from 3.3v to 1.8v.
> This is required for proper operation of SDcard through various boot
> stages.
>
> Fixes: c5e615963bbe ("arm64: dts: ti: Add k3-am67a-beagley-ai")
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> index 9be6bba28c26..bf9b23df1da2 100644
> --- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> @@ -309,6 +309,7 @@ &cpsw_port1 {
>   };
>   
>   &main_gpio1 {
> +	bootph-all;
>   	status = "okay";

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   };
>   
