Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FAD3B7A8
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 02:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751076136; cv=none; b=FDkl+0cyWYLmgcd7tg6Px7x/ZFreNa/96NoNUpYp3+H4NNFjVJthqNekquqb48mfuFm1Lx046O/ilrw9s17GxeJ4mhGqb+2KJ3aAXfsw9JlXqOg4d421gXOiqtixQBu//pm5G0dI7riQE4Kdzmk7kwEwKa2j0/dMbsR5/RNv+QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751076136; c=relaxed/simple;
	bh=sNp9pe+T/QSoanxRAXrWpirOPqJeTwmcsYRvUmHMWrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZ+tDXz86Iv1tSq6v1qH0ZErtt/bhPBdDdT1qstw7hRBDJFAaKMP9WH9RJOxEakmghlAN6pzj2gNl3aWDRxyFrX895EJwj6yDt9+O6NUp/hie1hCyId3W+CQmWagit7AiaRjTkrncxwBQ7GB1qHoXU4VzNOIdUIFZk7itwpCxbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=co8Fj+sB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="co8Fj+sB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0FRl9003997
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 02:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w6cFaqnSskENYcVsGiQcJv3y
	zw/fX5DNOuINgCjQrrA=; b=co8Fj+sBfGcMwktx6wTkh5muUp1Fw7f34NtoYTW7
	bQckDEa43cN933Q7h/1jkGS+1VzMysn7cyH/MqIDx3hsV4QEfEfNNr/2AL7QV/Gb
	E+AQj2jsjIP6JkHPyyNrYhiuTyoGoW6e392BjBn1oGeDRs/bv0XuyE7ywc490FcN
	aZVVlMnvfWvBcP9ojaNBB4A0Rmb60wsF2+L7hdqkclVJsYX1gK7aYjlwJzQmF4hx
	cSimVv8zwaTNv6eQXMxoD8gPoxIE6EA920k3h6xFYyrQjXKn2zBfyCnsxL9o7g/3
	7dm3ZZJq7Yo8WhbZxi0AuVtr77pYLYKxFNQrRWt+jcFykw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fj3mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 02:02:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d22790afd2so53384685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751076133; x=1751680933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6cFaqnSskENYcVsGiQcJv3yzw/fX5DNOuINgCjQrrA=;
        b=pZMaEU7gz8F12yVVEiJW+XUtGwBZs53CG3SV42lFWbiXkMTlnAqL6XOFJuEis7m70p
         75xijdpnMoEO4dT67VWrhhA/xlDb0kjW+kwqynh7K3y9AVRRCIQ/vUhhBEzkBqSdNBTM
         fOyfF1zufchJUAA6GXhLmP5fQY5Q/QHN90ZX9xlKVEk7XlZ4/J5lsOPgmdaMM6O41rPa
         YV53AX3GZSifOut+LOUaDng/bMOulL5wImIPeADpPXAIO913wjYZ4kgzK8kFVPAvfw63
         +QjksQ0LtiRqZ8GBl9wsTA4NxO7GxAFatG+QZri+74KyVsTt7ORCTMyOTI7qVSz6YbJX
         bxAg==
X-Forwarded-Encrypted: i=1; AJvYcCUhIH3h8QWzfBeNmUwsOQdoBVuUmw4Z/Bi8J9O2YTow9U2BfDxnBQ9BteQARS4P6Bv6FSvcoCqgTJ6lLWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZcxaPaUzhnDq6zQUo9vaUZ2p1FTpXU+ycI77IqDsxF0b3wNIm
	ixDcnal/tdg0IGzRirhAEOyrDp9GfNCGt68MoKil6EFWuscZcY6ZzrFq6WevC3EkRClrmQhFXeD
	w5psA9DlM/HQuwdEdQvWArWkj9ISv7b90mbxCltshtJwnt/Wgoh1b55ewcMGunmb2wss=
X-Gm-Gg: ASbGnctlHQfDdYKjlir6XL6LbNwnjocPnh0kSw/OV+nhj1Fy8m4ssVYW7toOmYv8y23
	QShx+C6mJdHUf3b+BGOAR96KE0KsYpXZ2FWE4xItqPlt2j5kDjV2jCLja5y5QgaVVPtwWrfDLZH
	RvF0klRZchYxnUue7wsPl6KAg9njVC4b6OknY5+/Sl3kVGDOrp2kELCH8xud+T8QVlrrujAAw9o
	vtp5X+ztmiziAYwegrEyPz3Z33ZjISS3pqr3xLz9nVRnFvWiVEtIO7rFuMzfdax0EpEfPX0Z+l7
	P+geqm6X2E41N8ncVwRaAZqkxbqFxieYR9aj5l7Ucv85EsRaLWIGvXahX24jltmTdp5A77hJBtH
	P/DWOVVb5LkItyty/ZMkxDXCUotqPzY3cDPw=
X-Received: by 2002:a05:620a:aa17:b0:7d3:90ab:800 with SMTP id af79cd13be357-7d44392359emr700974885a.4.1751076132886;
        Fri, 27 Jun 2025 19:02:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF12VuS84LoNNAk+G2kfyBlFl+od3zmjm4qe4Mm6a14+ByrTTticLF4T4ykVkcNtc/sQk9zmw==
X-Received: by 2002:a05:620a:aa17:b0:7d3:90ab:800 with SMTP id af79cd13be357-7d44392359emr700970985a.4.1751076132462;
        Fri, 27 Jun 2025 19:02:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2403fasm649184e87.37.2025.06.27.19.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 19:02:10 -0700 (PDT)
Date: Sat, 28 Jun 2025 05:02:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: vkoul@kernel.org, broonie@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, krzysztof.kozlowski@linaro.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/4] soundwire: bus: add of_sdw_find_device_by_node helper
Message-ID: <cy5cpzoidygeptqwxvnnjilads4npayv2zvu7hfff74defmygv@zglnb7ur4rw2>
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250627155103.441547-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627155103.441547-2-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxNCBTYWx0ZWRfXwgmtH+uVLkWp
 ibwdsRtGYAh6lwTBG5kjVijnM20QcDkq6iKw7Jrb1L1U7VJYuRdpLBqEedgo3aouc5bvA6SCWvG
 0kPcPOH4bhuFkJHkehZ0DLpQcOqkHFLC67RLKeyxkbovTQcSjp3osmmkArBxpn4fu7DSc7Ws1mx
 BOgpHFWoxNA1P3t3BZNxJDKSGUlBFwn24Wk6dGVpoWUrQOUN2QSPan44weRsIl2m5zCQctWALUh
 PK8UJ+j+KUppQv5ZNfaMAjxFo33X/cdPGcTx6gj+8uyaGhFdIKJRSsBVg5fab6dLAV2uso+pX9t
 yY3NL5xoDc7MspvQvoR8uvXhgfHmVQ9oWqpLSStoqV57yLmqs2qAPFnRJDhr8BSUfu2A4GEY/Yu
 S+2PG7SUBWhBGsPqpG7y78UgL1rMNMqU/O08b6BUfmR/hxZPlpNkO0AKEQf/VI7H7UIGQ8Zt
X-Proofpoint-ORIG-GUID: VQgOj66VAMoeSjp75NeaNUdymqfwV8PZ
X-Proofpoint-GUID: VQgOj66VAMoeSjp75NeaNUdymqfwV8PZ
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685f4d25 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wpCz0eZ45CY81w7ywFIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=682
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280014

On Fri, Jun 27, 2025 at 04:51:00PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> There has been more than 3 instances of this helper in multiple codec
> drivers, it does not make sense to keep duplicating this part of code.
> 
> Lets add a helper of_sdw_find_device_by_node for codec drivers to use it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/soundwire/slave.c     | 6 ++++++
>  include/linux/soundwire/sdw.h | 9 +++++++++
>  2 files changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
