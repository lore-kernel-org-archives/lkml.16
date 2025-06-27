Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEB32EA72A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041794; cv=none; b=Fe+KqXNmgtEHMqnpuWVd+jSTkJalSvSjz/jmXYgyjfEedD/nCv0GmZzoeW+I8RCRNQFNf+QvA0SREf10rXDhrBStYJrHakZh/tlvkEEms1xNMu3u7l7YOwsyiL9hyHK+fnCpNHd0GdP+QMuvapWYDT7xjVLzlAc0b8Ap94jJIUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041794; c=relaxed/simple;
	bh=NrGK48K7TQeU1xseYcuZfl/9SljGlDumg0v1gAvyRpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCDAtqDO6vKNdJ6eE7A0Rzr3Zz/dza63oQRC/FTXJGW+BD0NhJAgPUYceTp6tUS7JsTSJnPV6v6WS+GJf/blE43F6tpnKOT5A2Hv/gpReC7PodLLABdI5AkuU55mK9B9mfG8w0sBuceQrbCAeppcwogu+gt0VXtSzKMlC4AvcLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eK0B0BLs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eK0B0BLs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBoKnl028952
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	shUYCckqGDoPHtxcGMdfXcvC7MVgYdxUw3VFoF/9ZMM=; b=eK0B0BLsvANOWBLf
	r/vOxgOREIkIBPzBFZUhFxEJ4Qo6a6bYSpDwgKvKbA5vBk8orFvplOfypQ+yoLlp
	y9RSkeQkKY0qP7KNBPg7KFpEJfQyic1BkxFxYb5mGEQbB/7L0RSGzD/Zd8ayyngx
	CyM0xn5VH8rNtATrXg4iGMDWIR29SIyZ1oM9NzqcRWPJJK8E4Nw404N8q71QQKsC
	j4OV8a4pVyjCKWjQpomm7PbjOnJ1SOnm3g+tgG1CRhPeS6ZKFtOGXoyIdmgIueV7
	UkIaoZvqzKJLvy0nO1WH2TuHaz+/1Dy4duYKaaLgTOqGqGGwsEzqFIy6dAC/JpC1
	OTGd2Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47hkpbj532-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:29:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a43924a1bcso4231911cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:29:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041791; x=1751646591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shUYCckqGDoPHtxcGMdfXcvC7MVgYdxUw3VFoF/9ZMM=;
        b=DRl7E5HujixgzJa3ouOvoOBPM1VIqgn1we0I6r+a3LbUkRKA8r5jxrizrag3MccbTx
         6DnsQx9AFNUT2oJIL1EFZ0COB3bU6uxVHesDXZ0FePZpKWcX4Zan/51hfORKgilCt4GT
         XE5H8nnMH3ViF/BaYmROjVIevUZ7mvBNC6hgJZCxKx54lml3QAQgO4HCGs+Dmv0NcKHO
         XrvqBSu4nh2WP83q3eE2HPVni98L8V/5bDPdZn3hXy6PTcgCmkrBLFEG1SkPXudzekat
         rnZ/0+vJp4gpLKiCgztW1p7YMfR7TXZKhpmmZl5LpG8C2jfLl6RV1JimrPouM5tNJDBC
         hJ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgdOelJQsM/YYr5x0OjFfgzd8VCp6yet9/MOHyr0he9d+jnSqO6nVemA65EapuB7JxsAhtim7DsrOuo+I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2vsiFHh+yn4awk+g9Owvlz8Idybv9Clylv6dvTCeEODtnoQgc
	uV6t6vDhtN7WKqQ4y3WiJs+e3u8mTnXKL5+PftAc/BjzORQIw5t9BnjDz6YeT/FjinWJPG/sCnm
	fV4E/oBV7NFnpqYYDdXQjan0hzBM3Scma3vVx6ULVrWkKU6Dg/lvrU8SyLAuWZb2zz8g=
X-Gm-Gg: ASbGncsHc7weJIKynu2/bBSliVDZDuRgUn5AbIRAHcg9PdtOf13I4rQsc1WG9yJso2A
	jVOcQhfQD8I5XQICXiB/cSZRlAeOcB0bf9yV+z+4cBwuXNfXiInS98f8sZb96Sax8hBewn3Fg27
	9Xh0IapTwVpsIJK7yd/kv736l4SbaiUFCyePzI7b5l53OjWOXLluL0SqtT/INCQSNTuiZKnBw/B
	9fi1hxjaBKR429Adw/y0i8bKNr+kqYgcq2802lAyRD2eiWVqlV23AmetteBlFmesRc+sjdzgl0w
	9mWxZqWnzIJuWD5fIvWOPcc6NuIK8FJnNYmt0e2tQT+ERoHDn1oXily5KPBRkaWy68ikn64tS6L
	w24s=
X-Received: by 2002:a05:620a:8c3:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d44392c133mr190526885a.6.1751041790727;
        Fri, 27 Jun 2025 09:29:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBijy/RXNIZA5o3Zj+gilVydMuaF00wJeZLo0nI0AAKKzcmDXHmPcvX9CZJiPxPp/SwW8UkA==
X-Received: by 2002:a05:620a:8c3:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d44392c133mr190524285a.6.1751041790172;
        Fri, 27 Jun 2025 09:29:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c0160asm147363566b.89.2025.06.27.09.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 09:29:49 -0700 (PDT)
Message-ID: <e1fe370c-6435-4a84-b7d7-1ce4db4dbfea@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 18:29:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] soundwire: bus: add of_sdw_find_device_by_node helper
To: srinivas.kandagatla@oss.qualcomm.com, vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250627155103.441547-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627155103.441547-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzMyBTYWx0ZWRfX3cC1CaZ2l/zv
 zQoGHLejV0IqiOxFe+pzc5OppgfjAcvh4SjVvRMBrflXs36HTbnBNf+ZX9JL8GwzJLyPbkVhYfu
 lHAbSlmiMJQS38iZYLwj26udkYSrOWNffinMVbEolmnau6v7pS2Kp5XqBGOM+DC369wxkRWy0Hu
 2QSnaUsdFKuUDUHNgC8U/BFxubTI1Ba4KkaVoPoJIxKOOdKM8kU7r8TzgsR/ek/6vO5Il2xgcwE
 BBQxjngsGW5qxyQDW4op7uDVJxEau/NvTofTFZmahMAIAasA6fAFom5NPu4XF5/fMz9oCN8/wVx
 2PwyBCMjbmtlA9/WuB5RkILVRNcJ0/41yfu2xw1Ilauw9XiC3RTFJsxSmPmskTsFcBtXvxBNMvQ
 SifMJyJlyZ7kC3nlfgl2Pyq70GMaO0ElaPr5NsJF9dp94jK1QMMFl2O82S9pOxvj8FpKzkFW
X-Proofpoint-GUID: CuAVw1gvr7FMq8KJHjuG6D5Rg2grLNab
X-Authority-Analysis: v=2.4 cv=AY2xH2XG c=1 sm=1 tr=0 ts=685ec6ff cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wpCz0eZ45CY81w7ywFIA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: CuAVw1gvr7FMq8KJHjuG6D5Rg2grLNab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=652 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270133

On 6/27/25 5:51 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> There has been more than 3 instances of this helper in multiple codec
> drivers, it does not make sense to keep duplicating this part of code.
> 
> Lets add a helper of_sdw_find_device_by_node for codec drivers to use it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

I think we can do the same with e.g.

sound/soc/sdw_utils/soc_sdw_rt_amp.c
281:            sdw_dev1 = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[0].name);
292:            sdw_dev2 = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[1].name);


and make sdw_bus_type private again

Konrad
