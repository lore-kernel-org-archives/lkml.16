Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841CC22F17B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557149; cv=none; b=J7jgzVkzHL2QWpxtaJ0Jri5hui4D3Y+AxNHfPTaJai8HcLwwX1lMmvGfY1+q4kgwloDyK52i4sxd5tMYsmkRL4Xeq1Px/C1dtVI3Tdkk+O1QXSLemCUNB4SRXQ2M+JnNevbQ4g8jtimT60up6KL4YCLCJRCi0PIFl5mfQaIWxpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557149; c=relaxed/simple;
	bh=pFACJJo3+bqCi+jn8eJR36xw0uNvwWRpVBqS3TPNyPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ner0RphSU5GYqO1DwdZPkXMuuorws3Ek8PEIIFycRwiw+Pld3c0/she5yk2M+JdltVVPBz3e3erKGnhm5XEArCWtWG8r/hzTO/21Jh4vOyS2b9BgZ/eMjreZ9n3tYw1pNLsggPHQx3mCUTzGC4/ubFVibH3JegH/NJIkj5XQJgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+xFVZv4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+xFVZv4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6e2RJ020216
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h6vlCxhSQUvr82OIu6Fr1YYqY2ncYKV9HsLI2TKQjvA=; b=O+xFVZv4445XtnWy
	J+lVZ9O34FPA0XJVcZ11LUaUbsEPFvdYx7ianc2oPlQuCGwtmCY8BusCljtkalfF
	NVWP4JZbGRiwshmTnVHV0Op+WFJx6nyR3zBloNDJ47S/COpvvw3WyTo/2rHzlL2K
	COVLXIGiR2vHhi1HsmVPfphHtmfab0bXxrUbxCZDzvLUAerdbw9MAxLHtp6Qd/2G
	LODITej0WCU3gl6yT95aDB9W5oNNyn3uA/Z9F8l09LyU4eoLE2lsFWc+HkOUOJpo
	KC8oWvN3bpoStzyaXRmt30qM80N5AFAvp98+2v9wg3WLsVwKWsL42NXE46hoS67D
	VWIHoQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmn8xfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:05:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a6f59d5ac6so8172681cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557146; x=1750161946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h6vlCxhSQUvr82OIu6Fr1YYqY2ncYKV9HsLI2TKQjvA=;
        b=TJmpu+7Pfons5gl43Juo4Bd6x5dguix3ptT3vNKTOKvWtH+Evh1K79w5FyRUjze3pC
         IBGqtX0+nY/nkYZmXAS1icelFeqlo368Dz0Yd7o4rGsICbIMjepMogQSOOv2Wp+BDTyK
         olI0ALPQ1KJ/Q+n0f/1BHoGt/b3SeuiokLPdv1pZSjPZSrOYLQW7SDPqc93aIuyO+/Dg
         EOA5vz22EmU/grFznwNfIRwPttNDaDsG1UG9KJjRBT2JH5K7Elu/kQpZC+hEuFrRo6z/
         ISQzOmrkhjX9jowrCI1noszdr9YizlfaXf2ou96IJF5HMaaMhiUAj73Yuv8naGF6/3dl
         5kDg==
X-Forwarded-Encrypted: i=1; AJvYcCVaZuh5mj40hUBcQ7Rg9cnLPdrz/J28Akvgw5Jy3NsYa79DfnL9LM/nmxopPkZG/jJMWWIBoCWDWPIMVpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzToudDY7dpckLjb9FO5zcvUo/sYp8o6SeA5DWh5Tw9Wcr5jjyD
	8SIPjpWEKZWWcQ8zZD+s2hGhiYP4X5LIjWZGNY0PRfwWXn+joiJeBOwK5ADxftgPQAnyWgD7fu5
	MVM8VL/LT83bVa/iz07F5KIdc4Erl24+CLr55n3gVJaElm1pn9JO2z8Omh8BsjLQiMdo=
X-Gm-Gg: ASbGncscmPP4+LsAuT8OKX8rnlpmgvyffBF89r2aMJGr7pIcK0ujuO6YRDCCCcdWJCb
	zAvsy7js972HwgZ540naq2xpKDpQeGYX86dDtCePbEFAQT1nBgVx9LUIbeFeA51hRmHGGQpZbPo
	b0btA5VVGutbuTHQ2Npm/GyU+bX1PylpQ5727pY9Uc4vdk8Du3gYwUddCZme4P0YZ9+5f+1jHju
	ResRRZSU6XCDoin1U84cD55nnJNwYd29pKRlrJVLGJWR/0dZTURKwLKcDOdAjyjmP32tuaeGS9p
	Ufbqp98ir3PwTkZNgRwHDW3lae8CGmipkjsLFK7he9YvJF46g1vJDWcwux/B10fRWYCZvtUqws+
	1
X-Received: by 2002:a05:620a:4496:b0:7c0:bc63:7b73 with SMTP id af79cd13be357-7d33df22c1emr912842285a.13.1749557146341;
        Tue, 10 Jun 2025 05:05:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHy7jnQNdMKK3VoKnfpEBwRY1V91000OKDc59hXFCGtzyBYzwQtBOpr+Q1wE5lNHQT7AGzK+w==
X-Received: by 2002:a05:620a:4496:b0:7c0:bc63:7b73 with SMTP id af79cd13be357-7d33df22c1emr912839585a.13.1749557145775;
        Tue, 10 Jun 2025 05:05:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d5f9b37sm710722766b.0.2025.06.10.05.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 05:05:45 -0700 (PDT)
Message-ID: <829d79af-cd66-4124-98af-7819d9476840@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 14:05:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/msm/adreno: Pass device_node to find_chipid()
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-3-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250609182439.28432-3-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NKSL0mHljwezFnkoPuNcfe0JgwBNtr5O
X-Proofpoint-GUID: NKSL0mHljwezFnkoPuNcfe0JgwBNtr5O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA5NCBTYWx0ZWRfX3G8HRi+FBFUM
 jmsgkLZJiSxzIBcXE772MVEjK5PH1RzL6LsYd8B8bAdjhctF5F50dD/MfN7rHnk5LQwm+Es+i8y
 i2BxsvCewI4Yk/a1jzncXlqoDDgfLXaMkjN2LFq/SkO08lBWfCiVsIiEnD9PgRJ3iMTehTbLIkf
 dt8BYbLLRU5wCGjAa42q/ruNz1uUwu6OLOCyjEKN6YyT8gqK2fmyzU+91MnHCBKdCThU+YuRl95
 il8teCRur7z0wVd8oyf/ekesP6IA4Y5DOdqXv+4jgXjdgvUyoBrGfgQv3xuZTy5GaqYPsb52wvK
 vtQ2unpS7wBM/yzbRpa52ZNiA8HZeJIJ1DNacalhW9QwO6of1m+Ve4yP7c+FosAVUu3/4NjhYom
 Rx9k1h9QPUd03UasILTTtOotPz4fjXpPnUaEgI53uF9JLj5+gRwlAlcN4kUhph3zVU9kL1Zz
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=68481f9b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=9tEP0OE30YQ_IqY-BwIA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=776 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100094

On 6/9/25 8:24 PM, Rob Clark wrote:
> We are going to want to re-use this before the component is bound, when
> we don't yet have the device pointer (but we do have the of node).
> 
> v2: use %pOF
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
