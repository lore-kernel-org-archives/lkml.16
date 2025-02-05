Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256651FCD07
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738784891; cv=none; b=SVpbZF8Wns7/PkVhxEgHhY+x8OIZdA7HPDpUpLIf8DJtU9bYogTriF2ZrjVeLge+nyzHi1FTqOjCNygPQ847NY5ewKuZjFo4XwFpE3g7lTjIqwkNSVcmWGXJeF3apwYJRXCX4Xlm+F0kgGpnOMClrWQgZqRQlHGcDC8TlHbhPhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738784891; c=relaxed/simple;
	bh=gH1ON1ZNHtwJJ6Ur2JyeMnZCyAdxviAjrbNG1n8f0Js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pk0wGQg9cbZNLClvU+hyjaLXBV4HQajeGAJ/aUtkGrpFB4oYX+zbJWCQFMUQ/WpSFXCcy244wJOkfUIrROle6iqz5y+qcUTksPNnZ2G6TSLFxgPTQC2n3+X58uoVm9U94yb3TVXX+0vVXCgxVmM87tX9RlxxBuc/YCwWkjck6EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=AeUc6gFG; arc=none smtp.client-ip=44.202.169.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="AeUc6gFG"
Received: from eig-obgw-5006a.ext.cloudfilter.net ([10.0.29.179])
	by cmsmtp with ESMTPS
	id fkpatBybxiuzSflNUtOf06; Wed, 05 Feb 2025 19:48:04 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id flNTtgPFI5pd3flNUtwgua; Wed, 05 Feb 2025 19:48:04 +0000
X-Authority-Analysis: v=2.4 cv=Ab23HWXG c=1 sm=1 tr=0 ts=67a3c074
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=7vwVE5O1G3EA:10 a=DfNHnWVPAAAA:8
 a=HaFmDPmJAAAA:8 a=eXBiEjBhb-fYyGQ4tMMA:9 a=QEXdDO2ut3YA:10
 a=rjTVMONInIDnV1a_A2c_:22 a=nmWuMzfKamIsx3l42hEX:22 a=hTR6fmoedSdf3N0JiVF8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8j1K6FAoEkl2PfNcREOsthr+nw54d02avdm2huO3uYM=; b=AeUc6gFGydkfFWzsttzHYnc0Rv
	e24aVJmCxwJJKYXojO2e2nJ5WmzbqdGJeKuKdyJh65HofoXmYEkniZZzM6Q+Uws8N2ERAhmP+hWqC
	xtPNDSeKs091bxu55NO0t5Ng57mOj7AnWNM6l/KeGrsttYQoxVQ8cm2dMxB0lk1IUqVuYlSLs0WSJ
	Bwm2G25h6pLH8MqHdSgOW328XtfzVa/kXcMJonOhk89N93OWHtW+B0bV+ihUI54eLhj/KWplpJ6H2
	PzM5f4nd/G7jbGFjfEGmioyPhBjZq6ZhA+iHHqkCXCdfPVxn9JrK2GH/gVIRp32dQP9CBc1RrmLg5
	0g1unjBA==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:44952 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <re@w6rz.net>)
	id 1tflNT-000v4b-0A;
	Wed, 05 Feb 2025 12:48:03 -0700
Message-ID: <9b6b27f2-f1c0-4d60-8535-86d057e51c6a@w6rz.net>
Date: Wed, 5 Feb 2025 11:47:59 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] riscv: Use of_property_present() to test for
 non-boolean properties
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-riscv@lists.infradead.org
Cc: Steffen Persvold <spersvold@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 Jeremy Linton <jeremy.linton@arm.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Yunhui Cui <cuiyunhui@bytedance.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 =?UTF-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
References: <20250205143903.413959-1-emil.renner.berthing@canonical.com>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250205143903.413959-1-emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.223.253.157
X-Source-L: No
X-Exim-ID: 1tflNT-000v4b-0A
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:44952
X-Source-Auth: re@w6rz.net
X-Email-Count: 7
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNch5sBaR4UkPLm/GuAbg8eVY/8DPr5esIbNd7N0c4/pU+U5SK3yicklYkyoGBE6UhtFP5Cmc9wgJb4TxebIpgMCTqaH20HBJh7xdql7dMHm/+EokOH1
 /rYFvTapW4Ky00hOh0DPaCnJLD0x47w+t5AqxG2VshnnupB3yj/fmiPFpuxBfx6aPq2ao8P84/81nOSfD1g6L99QUwTjHe9XOhA=

On 2/5/25 06:39, Emil Renner Berthing wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated and since
>
> commit c141ecc3cecd ("of: Warn when of_property_read_bool() is used on non-boolean properties")
>
> a warning is displayed when used incorrectly. Fix it by switching to
> of_property_present() as recommended in the same commit.
>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>   arch/riscv/kernel/cacheinfo.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 2d40736fc37c..26b085dbdd07 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -108,11 +108,11 @@ int populate_cache_leaves(unsigned int cpu)
>   	if (!np)
>   		return -ENOENT;
>   
> -	if (of_property_read_bool(np, "cache-size"))
> +	if (of_property_present(np, "cache-size"))
>   		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> -	if (of_property_read_bool(np, "i-cache-size"))
> +	if (of_property_present(np, "i-cache-size"))
>   		ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> -	if (of_property_read_bool(np, "d-cache-size"))
> +	if (of_property_present(np, "d-cache-size"))
>   		ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
>   
>   	prev = np;
> @@ -125,11 +125,11 @@ int populate_cache_leaves(unsigned int cpu)
>   			break;
>   		if (level <= levels)
>   			break;
> -		if (of_property_read_bool(np, "cache-size"))
> +		if (of_property_present(np, "cache-size"))
>   			ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> -		if (of_property_read_bool(np, "i-cache-size"))
> +		if (of_property_present(np, "i-cache-size"))
>   			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> -		if (of_property_read_bool(np, "d-cache-size"))
> +		if (of_property_present(np, "d-cache-size"))
>   			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
>   		levels = level;
>   	}

Works good on VisionFive 2 and Unmatched.

Tested-by: Ron Economos <re@w6rz.net>

