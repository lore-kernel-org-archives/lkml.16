Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24EB215F72
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745608097; cv=none; b=NHadT7caAWciayd9p3L8iHh7Qqbs7aCWJU35HfAIBJNd3WhamvAm93Sei0439PooPVg5dFOpCEcit1++lLYZ4P0Wc5pUeLqGdaqjKfMjOaE84yZmk89AJjmkvq9shL0wooa3QQiXNZ/f7yCvBJ3jMfQwG5rwlNf+Gblui2jR2k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745608097; c=relaxed/simple;
	bh=L1uhPKJqM4uJoNb/FduIwtRIQp44jmuA62BWQ2acaOo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RT315Utg1flkoI7AjiGsdAQYqlZFa6gKfCxW0BeWHsd0ov/qE5/VHsdItITXL0LyAaGvdrBvhMGs6uCTR679ON5puSF4LrrGuvi959tAfcu/ngalr9XwVWD7wCP6h4gZzu1SQVpRkgZJg5kPy4nd5tbvN/nPMXMD8h5W6mVU8KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=IdUl5Bn/; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IdUl5Bn/"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PJ831l2862529
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 14:08:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745608083;
	bh=v/ZY+DevxDSqruvVl+CgKBTK5F/u+6alzZsc87GdoMM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=IdUl5Bn/1LxfG2ntRSMkFtRblGw973o2F5myBC04i6/IIRdf0TfwI64JZfJrBMAeN
	 SbCTTtkevggALf+BSF29lAoEqm2a6pDKm/qsgipZv7bHCTj8KRfbRdnbVIvR0EWQh0
	 NqA/GHPB+6XnaYwXUA1ysfjJjWd+wvYxvmA1o6eQ=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PJ838E001635
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 14:08:03 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 14:08:03 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 14:08:03 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PJ83Cu089924;
	Fri, 25 Apr 2025 14:08:03 -0500
Date: Fri, 25 Apr 2025 14:08:03 -0500
From: Nishanth Menon <nm@ti.com>
To: Kendall Willis <k-willis@ti.com>
CC: <kristo@kernel.org>, <ssantosh@kernel.org>, <d-gole@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: ti_sci: Convert CPU latency constraint from us
 to ms
Message-ID: <20250425190803.s7bag5fop7hsxcxe@sliced>
References: <20250425153754.2141984-1-k-willis@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250425153754.2141984-1-k-willis@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 10:37-20250425, Kendall Willis wrote:
> Fix CPU resume latency constraint units sent to TI SCI firmware.
> CPU latency constraints are set using the PM QoS framework. The PM QoS
> framework uses usecs as the units for latency whereas the device manager
> uses msecs, so a conversion is needed before passing to device manager.
> 

If this is a bug fix (sounds like it), follow the stable kernel rules.

Also please do not expect reviewers in the community know what this
means, I think you intent to point folks to the url
https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#tisci-msg-lpm-set-latency-constraint

If so, add the reference to your commit message.


> Signed-off-by: Kendall Willis <k-willis@ti.com>
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> ---
> Test log [1] shows entry to MCU Only low power mode by sending a CPU
> resume latency constraint of 100000 us using PM QoS. MCU Only is shown
> to be entered by 0x1 as the printed mode.
> 
> [1] https://gist.github.com/kwillis01/059a2ca38232387b414bc6f4b87c7475
> ---
>  drivers/firmware/ti_sci.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index 806a975fff22..bc138a837430 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -3670,6 +3670,7 @@ static int __maybe_unused ti_sci_suspend(struct device *dev)
>  	struct ti_sci_info *info = dev_get_drvdata(dev);
>  	struct device *cpu_dev, *cpu_dev_max = NULL;
>  	s32 val, cpu_lat = 0;
> +	u16 cpu_lat_ms;
>  	int i, ret;
>  
>  	if (info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED) {
> @@ -3682,9 +3683,13 @@ static int __maybe_unused ti_sci_suspend(struct device *dev)
>  			}
>  		}
>  		if (cpu_dev_max) {
> -			dev_dbg(cpu_dev_max, "%s: sending max CPU latency=%u\n", __func__, cpu_lat);
> +			/* PM QoS latency unit is usecs, TI SCI uses msecs */
> +			cpu_lat_ms = cpu_lat / USEC_PER_MSEC;

round_down or a round_up? I assume you intent round_down, please
document that in the comments.

> +			dev_dbg(cpu_dev_max, "%s: sending max CPU latency=%u ms\n", __func__,
> +				cpu_lat_ms);
>  			ret = ti_sci_cmd_set_latency_constraint(&info->handle,
> -								cpu_lat, TISCI_MSG_CONSTRAINT_SET);
> +								cpu_lat_ms,
> +								TISCI_MSG_CONSTRAINT_SET);
>  			if (ret)
>  				return ret;
>  		}
> 
> base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
