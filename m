Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036831B87EB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809481; cv=none; b=rGIq8jNVozIp9q5l143aj5fdyl48h23cm86b3RCUX5t8jOI9DrhsPhs3wODaPdOjWpOTVO2uYpSK5L0UsUNvjCzrsCCM2UafPu7CDsrsT9tzEqgVj8Q8XVsqVNWBiMxMPQWNQIqTWYm3UjQk4G+J0cQVfI/DW/F0hNNn5YzQjjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809481; c=relaxed/simple;
	bh=aFAtQDMdKOikD1UGQh4h9BE/J3y6nJXrDhPAPPTVsl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KiOVAGzeg1S8N8wBVlMopYTafHLS8djT2YbyHionYd4eMbUJeVZmg/xUudNPXfTrbNYU+UBPCzugugf2s+d12vgP+zdqgwikaJQNuNai2Tu345/+GLNdEG33sSqvgW6LaePnVATaFlh2PyS8VDdbwrp01R9zyuQfKlX3L0uTBwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UaxMwz9G; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UaxMwz9G"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3913b539aabso4116556f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744809477; x=1745414277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=46a+XT4LlZh49KZsvWCANOFf2+GNfWM0ezZQVWjpcJY=;
        b=UaxMwz9GYl+LQN4nm8aXy1tIx+oXlc9SYulc278XGyiYiOsm68SP1/J5B3dDAaLhLA
         bX0UiqPVWv+V3JAumVY6yII01zMNSJB1kr8d3A4+QewH1/rdw5wCgo7RHwajGIwwM8OC
         DQHZ9f7e9EMrdNlMU1gDOOU51qjikz2NMydty7EqdDLDUoK4lXyJwDjRWcfamWZxUMwc
         twSZDjJ4dfX62PICjzqJKIb6JJmozToUkEuw4viUkTm3cYrcJEULIkQqplSPhVMcDYXF
         +MRwqZeFrZC+8W5unQC7FC5ILTL35icxGvcDpaQuZtad6hH+4FDdMOIB2X6MNx1h83rS
         EoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744809477; x=1745414277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46a+XT4LlZh49KZsvWCANOFf2+GNfWM0ezZQVWjpcJY=;
        b=V/spxYuuA4Wv1NxIKO+llrGYSZu8eb51l/wFXGZCI121SoUG4N0+nAZt2HldG2+1Vb
         ZRft2Q3HTmRGHlvlX5zpYfA2yFdXzBGKQ0aBYzJsbbU+HsVnD13/5ovjyj9naAMbXMpu
         EEMYPMZFV1ajm5eDz9A96rBj9RFxWJ/8NwM87u7w3OaRLjU32Wmbe2OoDwJF4Uvkx2xT
         uMG20l9T8NdeMh9H7/CinD7ZJavv7HgrSmaumVI3ytTBL2zHlInZk+Ww1RtvTPQH0TSM
         TjVgMNC9bPG4eAJ60IznNsOsOT9UAxm3ApkN5a+2Nt71IFEHK0em+QwEZxANiWQMoKmk
         zlBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxJUCljkDZkD3aE3syEKt5vpsnQe3KJ0sbYQB1dJWodB2wIrjks2Pr6B9yCIW6bvoRz01/a6r4JxlhSBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAXK8PSok3nA38XhflRgL3emlp9MsOfnkNTXVzmP5W47Oa72xb
	ZBGPUcqlnAVag1nscyWpJW//OJv8pt4t8aghIihXZo/RaKbPzVt6opBrUQrTgEg=
X-Gm-Gg: ASbGnctPaRi4LUq8Lyq4TFohmnDu7+X2RPkRgBAR8Vo7JM5CRDL+LyyV0/VGW9C/l14
	7HCclJt9NfJahhIrZIRlX03fGEZNEMoWbwNNxRYukBWa+riR6a4dRLv2Y8H7fOnqL9seMfS8KtQ
	xbouROpURoMJVUyq5VeDA6S9hWVS1HBfyvm+pJYDzjCKvloyyVBijqCgj5ozeCS8YaBdPa7c/iQ
	gnAP2VyWabDEYYVdd5v3xG7uRac1C+Yqh0xh3DJLraLIiGMLluwKdpN+CeLqe+KlJasPIWlddNV
	lbiS06c7LKNcjSRugr71MnC0xpKoa7fklPbW+7CsuEU=
X-Google-Smtp-Source: AGHT+IFfA/y60+Qyx4QJBP//tImcsbz6z+qp0LqGXxzVb6DTawzSBBFFyqN9V0zXFcgzKyvS4y0j8g==
X-Received: by 2002:a05:6000:144e:b0:391:4873:7943 with SMTP id ffacd0b85a97d-39ee5b35c98mr1734898f8f.32.1744809477128;
        Wed, 16 Apr 2025 06:17:57 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9797aasm17258400f8f.56.2025.04.16.06.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 06:17:56 -0700 (PDT)
Message-ID: <9f562c23-f790-4d82-b51e-79e63d04890a@linaro.org>
Date: Wed, 16 Apr 2025 14:17:55 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] perf vendor events arm64: Fill up Desc field for Hisi
 hip08 hha pmu
To: Junhao He <hejunhao3@huawei.com>
Cc: linuxarm@huawei.com, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 leo.yan@arm.com, john.g.garry@oracle.com, will@kernel.org,
 mike.leach@linaro.org, yangyicong@hisilicon.com, jonathan.cameron@huawei.com
References: <20250416020216.3377959-1-hejunhao3@huawei.com>
 <20250416020216.3377959-2-hejunhao3@huawei.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250416020216.3377959-2-hejunhao3@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/04/2025 3:02 am, Junhao He wrote:
> In the same PMU, when some JSON events have the "BriefDescription" field
> populated while others do not, the cmp_sevent() function will split these
> two types of events into separate groups. As a result, when using perf
> list to display events, the two types of events cannot be grouped together
> in the output.
> 

Hi Junhao,

I think just the first patch here [1] might have helped for this issue. 
It would result in them being grouped together, although one would still 
be missing the description so your change is ok either way.

[1]: 
https://lore.kernel.org/lkml/20250304-james-perf-hybrid-list-v1-1-a363ffac283c@linaro.org/

> before patch:
>   $ perf list
>   ...
>   uncore hha:
>     hisi_sccl1_hha2/sdir-hit/
>     hisi_sccl1_hha2/sdir-lookup/
>   ...
>   uncore hha:
>     edir-hit
>        [Count of The number of HHA E-Dir hit operations. Unit: hisi_sccl,hha]
> 
> after patch:
>   $ perf list
>   ...
>   uncore hha:
>     edir-hit
>        [Count of The number of HHA E-Dir hit operations. Unit: hisi_sccl,hha]
>     sdir-hit
>        [Count of The number of HHA S-Dir hit operations. Unit: hisi_sccl,hha]
>     sdir-lookup
>        [Count of the number of HHA S-Dir lookup operations. Unit: hisi_sccl,hha]
> 
> Signed-off-by: Junhao He <hejunhao3@huawei.com>
> ---
>   .../arm64/hisilicon/hip08/uncore-hha.json     | 32 +++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/tools/perf/pmu-events/arch/arm64/hisilicon/hip08/uncore-hha.json b/tools/perf/pmu-events/arch/arm64/hisilicon/hip08/uncore-hha.json
> index 9a7ec7af2060..5ac8f919b498 100644
> --- a/tools/perf/pmu-events/arch/arm64/hisilicon/hip08/uncore-hha.json
> +++ b/tools/perf/pmu-events/arch/arm64/hisilicon/hip08/uncore-hha.json
> @@ -30,15 +30,21 @@
>      {
>   	    "ConfigCode": "0x4",
>   	    "EventName": "rx_wbi",
> +	    "BriefDescription": "Count of the number of WriteBackI operations that HHA has received",
> +	    "PublicDescription": "Count of the number of WriteBackI operations that HHA has received",

You only need BriefDescription if both are going to be the same. It will 
be used for both short and long form output.

With that:

Reviewed-by: James Clark <james.clark@linaro.org>

>   	    "Unit": "hisi_sccl,hha"
>      },
>      {
>   	    "ConfigCode": "0x5",
>   	    "EventName": "rx_wbip",
> +	    "BriefDescription": "Count of the number of WriteBackIPtl operations that HHA has received",
> +	    "PublicDescription": "Count of the number of WriteBackIPtl operations that HHA has received",
>   	    "Unit": "hisi_sccl,hha"
>      },
>      {
>   	    "ConfigCode": "0x11",
> +	    "BriefDescription": "Count of the number of WriteThruIStash operations that HHA has received",
> +	    "PublicDescription": "Count of the number of WriteThruIStash operations that HHA has received",
>   	    "EventName": "rx_wtistash",
>   	    "Unit": "hisi_sccl,hha"
>      },
> @@ -87,66 +93,92 @@
>      {
>   	    "ConfigCode": "0x23",
>   	    "EventName": "bi_num",
> +	    "BriefDescription": "Count of the number of HHA BackInvalid operations",
> +	    "PublicDescription": "Count of the number of HHA BackInvalid operations",
>   	    "Unit": "hisi_sccl,hha"
>      },
>      {
>   	    "ConfigCode": "0x32",
>   	    "EventName": "mediated_num",
> +	    "BriefDescription": "Count of the number of Mediated operations that the HHA has forwarded",
> +	    "PublicDescription": "Count of the number of Mediated operations that the HHA has forwarded",
>   	    "Unit": "hisi_sccl,hha"
>      },
>      {
>   	    "ConfigCode": "0x33",
>   	    "EventName": "tx_snp_num",
> +	    "BriefDescription": "Count of the number of Snoop operations that the HHA has sent",
> +	    "PublicDescription": "Count of the number of Snoop operations that the HHA has sent",
>   	    "Unit": "hisi_sccl,hha"
>      },
>      {
>   	    "ConfigCode": "0x34",
>   	    "EventName": "tx_snp_outer",
> +	    "BriefDescription": "Count of the number of Snoop operations that the HHA has sent to another socket",
> +	    "PublicDescription": "Count of the number of Snoop operations that the HHA has sent to another socket",
>   	    "Unit": "hisi_sccl,hha"
>      },
>      {
>   	    "ConfigCode": "0x35",
>   	    "EventName": "tx_snp_ccix",
> +	    "BriefDescription": "Count of the number of Snoop operations that the HHA has sent to CCIX",
> +	    "PublicDescription": "Count of the number of Snoop operations that the HHA has sent to CCIX",
>   	    "Unit": "hisi_sccl,hha"
>      },
>      {
>   	    "ConfigCode": "0x38",
>   	    "EventName": "rx_snprspdata",
> +	    "BriefDescription": "Count of the number of SnprspData flit operations that HHA has received",
> +	    "PublicDescription": "Count of the number of SnprspData flit operations that HHA has received",
>   	    "Unit": "hisi_sccl,hha"
>      },
>      {
>   	    "ConfigCode": "0x3c",
>   	    "EventName": "rx_snprsp_outer",
> +	    "BriefDescription": "Count of the number of SnprspData operations that HHA has received from another socket",
> +	    "PublicDescription": "Count of the number of SnprspData operations that HHA has received from another socket",
>   	    "Unit": "hisi_sccl,hha"
>      },
>      {
>   	    "ConfigCode": "0x40",
>   	    "EventName": "sdir-lookup",
> +	    "BriefDescription": "Count of the number of HHA S-Dir lookup operations",
> +	    "PublicDescription": "Count of the number of HHA S-Dir lookup operations",
>   	    "Unit": "hisi_sccl,hha"
>      },
>      {
>   	    "ConfigCode": "0x41",
>   	    "EventName": "edir-lookup",
> +	    "BriefDescription": "Count of the number of HHA E-Dir lookup operations",
> +	    "PublicDescription": "Count of the number of HHA E-Dir lookup operations",
>   	    "Unit": "hisi_sccl,hha"
>      },
>      {
>   	    "ConfigCode": "0x42",
>   	    "EventName": "sdir-hit",
> +	    "BriefDescription": "Count of the number of HHA S-Dir hit operations",
> +	    "PublicDescription": "Count of the number of HHA S-Dir hit operations",
>   	    "Unit": "hisi_sccl,hha"
>      },
>      {
>   	    "ConfigCode": "0x43",
>   	    "EventName": "edir-hit",
> +	    "BriefDescription": "Count of the number of HHA E-Dir hit operations",
> +	    "PublicDescription": "Count of the number of HHA E-Dir hit operations",
>   	    "Unit": "hisi_sccl,hha"
>      },
>      {
>   	    "ConfigCode": "0x4c",
>   	    "EventName": "sdir-home-migrate",
> +	    "BriefDescription": "Count of the number of HHA S-Dir read home migrate operations",
> +	    "PublicDescription": "Count of the number of HHA S-Dir read home migrate operations",
>   	    "Unit": "hisi_sccl,hha"
>      },
>      {
>   	    "ConfigCode": "0x4d",
>   	    "EventName": "edir-home-migrate",
> +	    "BriefDescription": "Count of the number of HHA E-Dir read home migrate operations",
> +	    "PublicDescription": "Count of the number of HHA E-Dir read home migrate operations",
>   	    "Unit": "hisi_sccl,hha"
>      }
>   ]

