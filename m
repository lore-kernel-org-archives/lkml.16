Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6681A265E
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 10:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750500357; cv=none; b=qs4sVh4leuau1WI4foVb0k6pcToLuGuQ5cyfB2YMzUeWNA0+8wcuV6F52V4ELQR9rStQ0DvDvPxpZpdlT5WOrU1PtYR9BSQiShg9Mc3uO6mxiaHpNaJeXVvdUxp+Uu7fkpxxEFTtE+m6kAF05/lg/ZNqU/lshNYoIgnyzOdKmL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750500357; c=relaxed/simple;
	bh=Hn9VgER12ug63dZ6l8eYWyg1/ICuNU+YVIfUpFrL9jQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aqc6ygbzxF2C/myIrnPvbcMGySZas8nGRghAV9KjqFzWkUsQ+/df1ysfxhr1SOzQDk5Nal5Q0yMZSqZVWxO/MqKAOnGPg2IC5QcS8fW9i8av0lik/lumWvxGl4xv2WYqFanA0v77a9HAani+ndoI9fwlXBQf7nxM9AGiLFXt22k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a3Q/DNuB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a3Q/DNuB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L9SdZm009842
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 10:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qfJxwg+l2c3JiL0XNVJZZ9SeKhv9FqmZAUKpxuPv/eU=; b=a3Q/DNuBe4NsTALU
	eHxGolCXqh/dU4eUoh4AwLwlidtt23wVf3Xd3BhkhJP+Wx8zWRZ3UhNBKkG2Rx75
	WFS5MSQ/vdllx4LP7MfVYWCA5VhCX+3OFHs9mG2Iw8/xNmgquykjidWqbmcHm3tN
	hPKEtXyFDuLnP116OrV7a/3UMz2wPz80rO7By/s4uqtlu0tTX83iL02ECjSUZTFf
	6q0Ci+IkQbpsMT2sObNnq2d1Gf8QUCpIDYe+Ek3So2EaNBC35yiZO8PVnRvbF9+p
	hu/CrQt4LfSzFnKRhO2GyXZBOdKz7aX8+nR5fsund8QNut/Fuw5F/JPjgQnk04Dt
	/xY1gg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ds7s03bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 10:05:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3ea727700so35986185a.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 03:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750500354; x=1751105154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qfJxwg+l2c3JiL0XNVJZZ9SeKhv9FqmZAUKpxuPv/eU=;
        b=LVLxG6xdlvvRarQIGlcUZ6vY3GhfLDrgkrQvwgioyndgXYMkgaaW0q35YUjEke3eGV
         obPqBcDvPosze2zSsVh0NcO/OnWbSI+GuLKRghSOXWBJTdDXUvcZgyVdzStcSXKa85By
         w1FT8ODU0GW3/Vsqa2Wx6zPjotUHzBB1eTzARLP+CeId0IhpgFT/upAaNaBYh5lFvg9J
         yWw8zs7ODaWR3UfenrTv7abVcZOmcwt1/7W3s7qvnaVbb9MOv4FGFze3XCSQkqmpU7cM
         XHX9gKfR+j1L0YDMfTboV03+DWwQdR8mk0hfsnNla73XuoyX+387KO7SDc95l8fdAVtE
         m2tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAPM9W+drxuf1Ptf2PMYxetYwSytUffTItL9D5A4NDJIapqCAXT8WBtB+noH8KGcQ7bsrrVsVuMrJGkmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsyL+9RtmjMAqSlO36n0f0ypmswLyRQC5XyWFt0prvaUL2fJzs
	r2k8j0wI22Izm0QAE3P4kyspnI3yUkL1TEYAmGVuU4fC9T3KA4saQyVeKZR/zxxhDHxSO0apUJN
	SBdHTWGokI6+kJFQI8Nxojqj9w/cGxYKNO9qqMIQrS524CQTZwYDaMGY7FP60hhgFfig=
X-Gm-Gg: ASbGncvSCzJ7r1vtj/Ul4sDKhLwwK25NWscZvnOEYAMJpO9aelnRUaHYkAZUBGhE4DV
	NjItEngMElyT3ysLDeZhidsMhQMF6nNG7odyFwADhrJSXVpJlhm16EJPeZvU92q94+Xy2C3bAj+
	0ZeVf6MuECpWSgjZCnc5MKRlyIokJBvSdkvhnTYumh+hXLF/qahVhGMjDyQel02Dtddvj8x74JL
	WB/y89A+vKqOy7y7Gj7Zrtx0tPWWx3UCFIfG7vXj03HVPUruj7/u2VqmzEUbsBWXk1o9+JgrPW3
	rqNDmMTkUuygX3BGJIxZMpMYjLfLfNb/DAOEzSKmWSd2fnyJ0vn54Kg7/pnV7L/ozMMJuXT/MPA
	gsJg=
X-Received: by 2002:ac8:58c4:0:b0:4a7:64d1:1f63 with SMTP id d75a77b69052e-4a77a241458mr32278671cf.13.1750500354348;
        Sat, 21 Jun 2025 03:05:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5pgyeeYbXGzNX2jYyLlrGsQtTqE6d4IrhZZQuJtWfMycA7fDBUtRHDWtlBfsYFyqCgifoZw==
X-Received: by 2002:ac8:58c4:0:b0:4a7:64d1:1f63 with SMTP id d75a77b69052e-4a77a241458mr32278541cf.13.1750500353965;
        Sat, 21 Jun 2025 03:05:53 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6894sm334915966b.111.2025.06.21.03.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 03:05:53 -0700 (PDT)
Message-ID: <6e39f8a0-c4fd-42d4-91e9-48ca1d154c6c@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 12:05:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: qcom: msm8974-samsung-hlte: Add touchkey
 support
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Adam Honse <calcprogrammer1@gmail.com>
References: <20250618-hlte-touchkey-v2-1-2cf188b57e31@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250618-hlte-touchkey-v2-1-2cf188b57e31@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IC875usbPCf07_jbbRwgINVtMVrzuL5j
X-Authority-Analysis: v=2.4 cv=cIPgskeN c=1 sm=1 tr=0 ts=68568403 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=dlmhaOwlAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=wwgquuRBh95SaqRAEc8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: IC875usbPCf07_jbbRwgINVtMVrzuL5j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA1OSBTYWx0ZWRfXzqIdJflQ92pV
 v/kvH5F5mJX8ykbPl2LU3RWiefQh8of6/MiyTjATHnB+DWiIGxXX3vOfH097ePsiwQ7iGq9kpQq
 zATvPhPh1tTQPE08dhtJ8yL5LylrRnYT6Yp+C+qllW9PKypPGeQKERxijd++OlXKm1Is7Rc/Bjw
 XNYz9b57kx5drhp7JY+6V9OtFgrqHzCSzJFvFaQmU1EqkiNcPq5xnc7VJgnKxAdFyrqgfPtj4dY
 j01qRLAwd7yWKKq3juDSHC4tTJmQIG7g/fFzvNdYeP8FmTM+A2gA626dMA7xFCtJsndBpvoaBCk
 1tAeruwYrLcXnxjR3r+kmJAljgP/dj/KtahHJp6w6WgR3QdMho8TK9inN0lGcAbFuSt3Y/ry/47
 eDYty+Cf3EsQWcLQtPPx+PO2UHAPlh99i6uUrqnTdltyBPsIqTYDpI8sCl+UKQt9ENDoU7Xd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210059

On 6/18/25 11:45 PM, Luca Weiss wrote:
> From: Adam Honse <calcprogrammer1@gmail.com>
> 
> Add support for the touchkeys on the Samsung Galaxy Note 3 (hlte).
> 
> Signed-off-by: Adam Honse <calcprogrammer1@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> Changes in v2:
> - Fix schema validation failure, adjust i2c-gpio node name
> - Fix misplaced S-o-b (hopefully)
> - Link to v1: https://lore.kernel.org/r/20250419-hlte-touchkey-v1-1-9d93c3e2b31f@lucaweiss.eu
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
