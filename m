Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D8728DF09
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557280; cv=none; b=DgZd84RIrQS2ev0WDNrL4S98murNTp21yv/U/jAWtEvcg+47BVIQkqHx8uEZ4umvfNSFq1TpfX7t5e+c6iOWQsPfWdU6c9BV8WbbZz7P/eIm8gmzo1BK7jx/gCwkAGMIDDLTxg3X3Pq6FWyytBMU/RTHSvoLs+CSZNqBDi9sJXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557280; c=relaxed/simple;
	bh=vUJLUg5RBTPmEgB4pJpmvymOJoL5TBc9mgwnVnBaz0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jC5ue+Yaahp+uKb59+NIV8wRqKRE2Bxm8WxyK8UbSQfP7aPC05UfvpzeA0uf9zaE6jzgkC5+Wi6heoWAopAfs+LDNTZYN/vH+QXgvzZ6PzmZIiZYWqo0KHeMv2UGZzSZUt9Tr2HK1TW9eIlobRSS/SbFBVCdsblxw47rPO8KPLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=amO1V1gH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="amO1V1gH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A82pSa011063
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fat5e0IB0SoYGIG/MkkVnFLpug9hfHZGf2qLnhATUsk=; b=amO1V1gH7PFHuoCg
	PIy261N1nNVAI06xgD6lL904AfXn2z8t98itSVilp3ZUAcLgd+4U8iBsvUWUWTRw
	vFrrq7Xs8k/p35IInSLr95jGmMqV8tLhlsy1pc9s+QlxlkoEU8R1TJyDyoypjKys
	N4WkjSoRjTEY1x939wiq7MmqoRTL1dd6Oq7vHLHmtt/N/rAy7vz+Tnp9CghF/sdI
	EAnLr+NYis2DZRmUTF8/vIWX70DYgdeO3YCv7R23Xr0ztmpXhXGDCEcrnDieeqlP
	LFzyqaigIeJMVVl/A+LCO/Onz4YieDZQp+fXgWSjnsCz91e0AbGd9JdtVTRwaDPc
	NM5Xxw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxsmff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:07:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5ad42d6bcso107138585a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557277; x=1750162077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fat5e0IB0SoYGIG/MkkVnFLpug9hfHZGf2qLnhATUsk=;
        b=sFImT34sJQvw7KwwkO+F9eBUg+dT9pjThomptS2Cjjcg3DhDwVdMpsh+lqkXL8VZtZ
         r8OQ3w2XQOfdavOvVzrdgSWWzT/CU5DXuDPWVR2+HNypJVsvqkUNaydww0Jv6HVzi4FN
         7JD7VZSz8xRZiG6+6w69Cb6g2+6OEKnAME6d8yc9iktc2PABFRdj4YRGX8ZDBqmWaPzP
         ar3+Mlh1wd7aoBGMwXTpFa0iWlmyMQZctCoL3CjC3MDb8qWlre0xYnv/MTR/u01TVaG7
         uFOY78uLEtMaT48jrWorftJ93I6mLJ0aOoUzugaNXlSxk8BH5PE20Y2T5ProNyK5zDZ/
         THxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqBd/XgswpwVxDRgyElODr0SozAXagsRBYRZQ0fjcQ6ZtluR2Gufdmood3T1r24aRRdxHA5qr65qiHHhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQFMZww7n7Hhf8OVplDeJ5o6YRfC8uY5T3+asekYZKAJ2QWmwf
	S6ppx2jzkdS8jhF55+anji6k8ivg6HQnIp3appj7DBVTjVGBj06MvFVrc+vqiRCauYl/YJoLYub
	uGAOWIK/BqQRNXdeBLCHHILARhfzLarjHAdRq4wMNzzG+81cE6P/4JEb3yYCItSpIW6U=
X-Gm-Gg: ASbGncuTzfaUorZUnzoKQCMwT4n6YCueHTr6ppTc12DosHyyUsaDJENw/8W75pVEjlR
	sQutIHrYQ9w4Y6kGkJ3+eccLK+0nw4AD54CG9DOUUDqz/8umVmZmmFunZzTFor85cpCFeOD2XeM
	QmZJJ7DPLup+J3UvvggwkKNmf/sgmxtNflOcxo5gddb91Dn6wiPTNhcYTWwSk/lNKVctEVSEpvK
	Xea82jKsWErBa2t6ERxV1CPDYC5sS7IwZTSv9q0nFTc/I8jBHlvaGvOUkizww/GKmev5RjhUFS5
	KC1WC09bw344VgHxqra3/3QdqeRW/EAZAljKT6hWiRp3Hv7XgtWoq7TLGKeSVN4aCOzyIe/4ojJ
	1
X-Received: by 2002:a05:620a:27c6:b0:7c7:9d87:9e2 with SMTP id af79cd13be357-7d2299a7832mr858807185a.12.1749557276907;
        Tue, 10 Jun 2025 05:07:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj+6dwkCJ6DlfdzxdyTh4b2DegATq5bsF0PNFjB/y/RVLucqtJq25z1WxISrL3LqrFBiMsyA==
X-Received: by 2002:a05:620a:27c6:b0:7c7:9d87:9e2 with SMTP id af79cd13be357-7d2299a7832mr858805285a.12.1749557276405;
        Tue, 10 Jun 2025 05:07:56 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55ccdsm704778066b.44.2025.06.10.05.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 05:07:55 -0700 (PDT)
Message-ID: <c404b9e7-c942-4e3f-8dc6-f834f84b3160@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 14:07:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/msm/adreno: Check for recognized GPU before
 bind
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
 <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9bhNNpDVsJmnUg4K5DFg8ZYDSRQ3nHVa
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6848201d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=X8FaSnKV0AetLU2DVmwA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 9bhNNpDVsJmnUg4K5DFg8ZYDSRQ3nHVa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA5NCBTYWx0ZWRfX7gZ9TRGYUA97
 EXf5qi+2Zk325FgbrIy9uyslveGiYWAktAq155QZI0rErKSyDIQJ83I4vDxwQgsBg3DmhSdRa1n
 IV7fgUIOYlXc6ccpGMxseHpvrDx3IFWw2QYA6xxlvqPNshlGps7gxb1RDlaiyM7ZlEMGTqMVBA7
 FWmrTdEcETeFLmNogVnjGgFI5KwpA7hoJsWL1q3D2JMgP4OsbpBQU7aUcHAtPkOqF7nBWrPqERn
 7MQv0nldRamxfJ40VIl98ZT9VEF2YZp59F9CbZUBYIyU69JkNiGGSHe5KnNWELaRwz4wvbneUux
 v721NOfKL4+Dr65+rWVofSrzoS7eLTChZuA/Vj4c2fzRekVoA4+/Zxw//SlYcfzqarxqKoTnmE3
 mQ04WzhjqKZGSccvwzciK6JQn2xDppzHAnZSHYTyoPesZfrz7i85NqjYOisG5maT+BiDm2i3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=776 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100094

On 6/9/25 8:24 PM, Rob Clark wrote:
> If we have a newer dtb than kernel, we could end up in a situation where
> the GPU device is present in the dtb, but not in the drivers device
> table.  We don't want this to prevent the display from probing.  So
> check that we recognize the GPU before adding the GPU component.
> 
> v2: use %pOF
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
