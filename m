Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8612BB04
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749653281; cv=none; b=bDE6bfZONVturRG2nNC+ELvujuISuoMFmMHzXW++QoENnatyubkCLziSJytL34YbP932NR8zT2s1ZAS6b5sUAf2mj4eEgCxbfXwF1cTBG+cSEUgwpsF9cdbG5E5MXdT9jMYRdJUgzmijP4I6mEAXP6ymw5/y9YPbtd7IQj5I2tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749653281; c=relaxed/simple;
	bh=iz+OizN7XVthD9Q/2d9PTKzd9HNgXPy6LGiuaQnhNTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CRYCPMv1m/zBQfwx/FEsIQIUtt9jl2YjkRTPBojqi6QSPtNO47y3e2plFHW9AInJGqIEU4m7NXB925GI7dhyTPcrRTpxCoSAjJWg47vrqkIGSuz42FH7hJMeLX6uLCy9h6zYWEYmW1xgjPukNiFLiBQzkz9yrBFmSKjK3halbYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCdoJZ6Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCdoJZ6Q"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DD8u023918
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+MCsGgV4BA2JmOczR66eafPa7KFX2QbYF7q1cbtZlPw=; b=kCdoJZ6Qc9UbAJMs
	Gj8z79UTWrl3G05GkPEjVssNaashOFdweXr9KBdio7xSiOSdx5tJ+hBvNwwiMuO1
	GvP/XKMeKOMhUXP/2fMCRlY5+oECde+ijpInOyUkB93wGEKPMgOhFa3SJ8bQh++T
	swobWxtermoLQA7xmvUSJlhOp/988JZdYSVNw+VFRT76jRbsF3bxumrFBswwvMlg
	B/O9i/j7dd6XfsDsJ6zb9bqITVAP5yBHuu0/Jj4Edg79PsljOxn9hOmSdVLANx9S
	J38Yd5/YOWNraMj52pR9Kt6p7EW3WoTVejDuec6chHRcx3C+rvCCSDHwgh9TlZh9
	W1Psyw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2tfyrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:47:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a6f59d5ac6so1173541cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749653278; x=1750258078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+MCsGgV4BA2JmOczR66eafPa7KFX2QbYF7q1cbtZlPw=;
        b=bIUHQBMDjg2vw4eWiihSTKvRvp3tS9GDWokoVVy/yeRu0TC1u4eSOzukhEkL9ipOZQ
         t/Hf6S/+PHX8ansto2hbUgyzYS0F0684gnYItp8xOMCsNAjM0aAa2JjRmXsUgiXW/G8l
         1lAFeFyPfYrNAl5qaQbgRaeC8uG9j+P4nptS34P+Vrqq5iFbI2wRRpu8v1EztdGGTPGD
         /9FlNwSdPTcA4zaWwGn9Pl72wBy95Hhq6ss/qjEleM/HtXIsZF2p3BEKGkpjvd15zLPy
         c/w1tK/+aRooZQYGTtlzKifJ+jPp+gWhJcOumhVUmt/Wf2w/0dM+o8IrU2xotsx1mS3D
         pSwg==
X-Forwarded-Encrypted: i=1; AJvYcCWkia6Gn675dLPlnLmiBeGVmqRT68xAVyyHUyTBQk2n+HNn+RqHtfSEKHGH844S9JY8yiVtB5YllKr3QH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YygRtU7lbS32zXXTkd3hQKR8ZSytJGVFbM8kHJAhT+DXhMtyBPj
	Ob3s3WcHaSIW8v4ubvH4eSoty31sFWCh7Msf8w3EtvK/P0QQY7e7cYltuIpQl30qNkXb7/F8arQ
	Kj7Lg4Ag2IYN9PK30pfOavK0HDxqVb7Jwhvb1vhvdwon4C8APYl137SuLAcs6s9ovLPc=
X-Gm-Gg: ASbGncsAitIBcIQleGLtpnh5We7aDena5IXrN4cmjMCTAVTnrZT+fb1Zh8vw4mXP4k5
	+vZ+fOIIWNrlwSxdp4OfacOtoxDTnIf3yQvabdNgCYRI0tx7bxu+2ckpUWUtR/TBTeHu/HUg6j7
	ljRPh7ZORiNGiX8x5lRksTo8vRvyYN9w3f3nCwByc/BEb42yYNDTXSu4ZPZHmWvDuX7kWRCUdhu
	6W/q+P00XN7U6yLMmJJQp9E7RU+EsU1g7XU9U1IHkIz1Fcn6fRJYY+LEeVLBjaVeFrI6qcfWfaK
	+xoJNIVBmcG++Ffwsuof31WVxh5gIisNNmj60/GX0oJObovrwog8RQL/6oQobHqbupHbMzBkZDF
	3Lvk=
X-Received: by 2002:a05:622a:11d3:b0:494:b869:ac06 with SMTP id d75a77b69052e-4a713bb11cfmr21318931cf.6.1749653278339;
        Wed, 11 Jun 2025 07:47:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEanE3mTJ72DEP0t2zfEf2C9EcYW5djouOXP46mq+RKNfmpPdg/k6AyZH23Z6+cCZkAPNaJDw==
X-Received: by 2002:a05:622a:11d3:b0:494:b869:ac06 with SMTP id d75a77b69052e-4a713bb11cfmr21318761cf.6.1749653277863;
        Wed, 11 Jun 2025 07:47:57 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783c051dsm7772513a12.41.2025.06.11.07.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 07:47:57 -0700 (PDT)
Message-ID: <4a8df547-e625-4dbf-9c6e-44a3f793e602@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 16:47:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615: Enable TSENS support for
 QCS615 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, amitk@kernel.org,
        daniel.lezcano@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
References: <cover.1744955863.git.gkohli@qti.qualcomm.com>
 <1758b5c2d839d40a9cb1dd17c734f36c279ac81c.1744955863.git.gkohli@qti.qualcomm.com>
 <74b017c2-7144-4446-969c-8502fb2cb74b@oss.qualcomm.com>
 <x2avlatyjo7sgcjubefexsfk6gerdbhx5dcug2kszk2hukcusm@srs5dwuc2m22>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <x2avlatyjo7sgcjubefexsfk6gerdbhx5dcug2kszk2hukcusm@srs5dwuc2m22>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l0pU6O9IqiMcVijefDXbah4MsTs4Ipf6
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=6849971f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=btjPz7YbEsIzDNlJI7MA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: l0pU6O9IqiMcVijefDXbah4MsTs4Ipf6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEyMyBTYWx0ZWRfXxSlUqRSSPs0z
 sfzDYzPiIfweujisHe6h9Y87hmagsrPrKKHnxFwKEt2TfzqpzpIiiGhxU3WkGVmmeDyoiZup2tN
 pGOoeruVIoKWpRSjPLNPFpQogi/Vgr3JhYq2kpWMDPJgICoeP2WEVCgHq4LXk2K/HsBXSR8BKGw
 RfUzBM5pq4flLvlNmQvfbrBKwQuSFa1xDtQngQ7AWD6mbFK8J2NlK2DCSCutKWDV6DICavMvnOc
 WyfEAf8VUE2lguDTKxRclJvlKoDIYBWKxl+AmUGu16ommtELB4qlnTP143oLsJGwzF46536ZQVC
 OA3wFGJyKFLq36shKqCT3exFhVaHbpI9tYXsOV5VfNo0hIFQuUWIgOn6o3bhVJU0vy6EoArvb+j
 c1gKTa+HylWru83nbsAafUYFwMMglJ+CjdOsLYIJ+2A5Wk3eYlPkJAZ+Rg6kTtF0SLXZ8lfK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=746 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110123

On 6/11/25 4:19 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 11, 2025 at 04:08:57PM +0200, Konrad Dybcio wrote:
>> On 6/11/25 8:37 AM, Gaurav Kohli wrote:
>>> Add TSENS and thermal devicetree node for QCS615 SoC.
>>>
>>> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +	thermal-zones {
>>> +		aoss-thermal {
>>> +			thermal-sensors = <&tsens0 0>;
>>> +
>>> +			trips {
>>> +				trip-point0 {
>>> +					temperature = <110000>;
>>> +					hysteresis = <5000>;
>>> +					type = "passive";
>>
>> All of the passive trip points you added that aren't bound to any
>> cooling devices should be critical instead (otherwise they're not
>> doing anything)
>>
>> otherwise, looks good
> 
> Don't we need cooling-maps for CPU thermal zones?

no, we have lmh

Konrad
