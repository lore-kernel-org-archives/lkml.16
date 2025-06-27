Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAF82C3257
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751027081; cv=none; b=Hstr9L+laRa+gJVJnuSRPt5P4WSBIB1XDRlimjtjPsityRHT/B/iMqH1Wzqn0z3TAwar6finAMFfP0Nmd5ceB2c4jLxqA0OYvDPsUUDOI6qR67blUlk5vfGhRuuJRKlFePVjqFMEnV5tcMdBy2FPtUdvuvS8DKmFXBQ/7Va8JfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751027081; c=relaxed/simple;
	bh=s2JsTubzkGX+c2plqsd64lsgphIlEiCTvMimy+JuzV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s1x8TDjni7lYp/AynU8rcAnWsUjD0hs9hnQwxfOMn2CkisrMYolwsdXuhVJwnz69jgx0UvhsWKK8LPE0kElvGUGCq4z+eJHLiQ47tJ+yHVL1YvAY8sxbCKRhl0d0mnWMrNMoLQu2o/IJUChT/jM94cjpiVDWrybbtxMANFUVJLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJ+fTgri; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJ+fTgri"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCCcjN009844
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s359VO2c+0FspQeUv43Wc4q+xg59EC18GooK4d2/yKI=; b=JJ+fTgriwz0VWkD4
	TGhjLeT5Fj0T/hdUlqKJxpqS93Kdt55rHzNGtr1voxPIiE+NS/2Jk+ucHeKGkAP0
	jJtSB/OHtE5OoGPDcmPMaE0s+htPTehJNfUutP4vX36IXg4j+fN5Sp1j55bm5ZTy
	hiRkGkaRVkst5tCRpHlTtAr2jQ9P0GlL/XePwNrMohPpxYiJ47bFUD/p19Vf472l
	kv9u5u/ZRnLl0wfeH5W7BxsWO3O/3S38jmVUWbQn0k2p36dq/50+/BXHyBj5OSOo
	Rw8+vMrIqEbYO1skNEx0pso9FKTsKWrTLvnN5EjFzllpKzBjgw4L9kJgUON//uQb
	xOTWCw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fgh97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:24:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a5ae436badso4247311cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751027075; x=1751631875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s359VO2c+0FspQeUv43Wc4q+xg59EC18GooK4d2/yKI=;
        b=g07w/wrMedT5CbAouYtEmaDqh/YQrIPoE9i1tPy6s6SX7dqa+0lFovS1wxU7ftNqk1
         NAZFJwbCPX1OCGhSYaoEwU7CFonWdF31SN/LSMAqU3f5E8kCFiZ/UXtAGkx/86xAr50m
         rI6xgB8nK+bwLaOybdk36/+u8+2FtcS4NYXNlVkVTdVeu+v5GdIuqcFB6xhGU8agfXLz
         nHkpLwZyaNXYoNqkhrrTGYM4BpQ6eXvKVbCDCA2TIDuJ1rXyKZaPufkdHd/igVUdTL3N
         PdM+BhFaSQvjPa5OuHxRysPvSekuaPUpS0HLugxUGKW+J+9JT+hxj8fQnqzVMXQ3Oszn
         uK+w==
X-Forwarded-Encrypted: i=1; AJvYcCVQOBYSZ4+ArFfKj4gZwb8bG21bdFTxWJalJAm0frruXjMSVW2K05Mdqg2qTYrkDWaZxcOLv6m170v+XR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTgbb3+4YDcA91e/5YZOrqyZLMtZPNM3cQrD25ZjcI1O82iEKp
	sN06Tqo5ughADqqx4vbRUT037dJQhRQOYDgBzRNvP07Y2AtymzHkORe1jMr+kdiO3LocLwkveLp
	1snjbtj/rNrm1I0uHH0xh/9CM6h7MksHudJih6tcS+1WhHpeFhV0aSQW2WKXMochbiKg=
X-Gm-Gg: ASbGncujVcDCT8y/1nxtyTi4eBAJ9rFdh1HbW4npvIaLxMbwGdGgFNYI4Wb67CKe7vP
	GGL9XOG17pEFJMPPlYwBHJU4tB0lB58yMS8sAQU1EwRaNuJch2Cqv5FLClOqDIYglwFXzM0Dnzs
	gb3TtTEsB6ua4iGnmgOYG/OvB+gG1ot43TKdqitjudUebns4h0/Xw/5YKX1Orz4zszq6I5BkWWb
	Icn1C3ijwv4/FK6cqlGKUVl3y0AOSvV7tdM4F4bLO7gQzZnWZOyEm1fExOBpza76EWWeFqUB0+X
	XNVk1zfCYw/vi/n/gJ4bgyPUekE30fztLC9sYWphCuryz1jN22MJ1Ktg3DBb/6NEw3CCrnclrGr
	1efs=
X-Received: by 2002:a05:620a:4246:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7d44390b20emr177134885a.6.1751027075600;
        Fri, 27 Jun 2025 05:24:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsSUCqkTzzrlWtIzSdcUw7WLmyPY4ovmdYHMj3uG1ti1i0AkcXeiJFafPFnHDPYcpyfxkN5g==
X-Received: by 2002:a05:620a:4246:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7d44390b20emr177132285a.6.1751027074979;
        Fri, 27 Jun 2025 05:24:34 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bfa4sm114300466b.139.2025.06.27.05.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:24:34 -0700 (PDT)
Message-ID: <b67baa5a-dab5-4fd4-b789-b1294abcf4bf@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 14:24:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] misc: fastrpc: add support for gdsp remoteproc
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
 <20250627103319.2883613-5-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627103319.2883613-5-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwMiBTYWx0ZWRfXwQD0GGJF59sr
 L4aiffHqwQLFlWJf8ZMbh2inx+clJMt4JoV4p5lIy72uQMaDR1DYjf4MqfSIPqLloecbyV6OQr5
 45bPUCsjRuGLldyqBajnkAV64vXZOCDk8yQZXrqEMeXrCWxWPVMjt1buE+Vu2f/5H4yObBOy7Th
 AjyHKTXngF28LPYD6K0rAjPj2q82fmPmrRHAGMs7Wr4L9OPKqBdnfa/asd36WIC20qTu+TqwsX8
 +3T3H09xAA1dLwvMBR5jhcB5I58+A4547JoQh7AQ8ehJwhx41gYRpkud4XqMrIjAkqrLxgA6Z4h
 i4KWZocE6P5eeGNreLsS5XnkfUdtuAAXCGkBdLT8iXmGBcMGwtKc7s7miDLYOpLykB2MdhBG8mi
 5H3u3+woMbGe+suximpO2G238VzCFkcpegjFFf5OckyfKca+r3BM6ua6PkXffHYsVPoR+gp6
X-Proofpoint-ORIG-GUID: ICt4vFsRqhxU5KR62YjQCL2BHwNq3ygN
X-Proofpoint-GUID: ICt4vFsRqhxU5KR62YjQCL2BHwNq3ygN
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685e8d84 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=z5t9ctGjsfNMbOfKQ0kA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270102

On 6/27/25 12:33 PM, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GDSP remoteprocs. GDSP is General Purpose
> DSP where tasks can be offloaded. This patch extends the driver to
> support GDSP remoteprocs.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 5 ++++-
>  include/uapi/misc/fastrpc.h | 3 ++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index cb9f4be286af..d3d9b9fdbf4c 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2245,6 +2245,8 @@ static int fastrpc_get_domain_id(const char *domain)
>  		return MDSP_DOMAIN_ID;
>  	else if (!strncmp(domain, "sdsp", 4))
>  		return SDSP_DOMAIN_ID;
> +	else if (!strncmp(domain, "gdsp", 4))
> +		return GDSP_DOMAIN_ID;
>  
>  	return -EINVAL;
>  }
> @@ -2319,13 +2321,14 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	case ADSP_DOMAIN_ID:
>  	case MDSP_DOMAIN_ID:
>  	case SDSP_DOMAIN_ID:
> -		/* Unsigned PD offloading is only supported on CDSP*/
> +		/* Unsigned PD offloading is only supported on CDSP and GDSP*/

missing space ^

Konrad
