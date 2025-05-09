Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DFB28F52F
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793403; cv=none; b=TIUu9husRqbWCkkSVaiXW42HA9+nlonsoGVZkRdKRmLilSy/ovtm4iec2nN/Ajyre9tYOrEYYFGxzfZKAm6giew9gdBuEJhLbaoL1miskfSjlFwtQy8dzIMuJBXEszoHvfWr/SobE7zioyQZLWZ3ahj7OruWtLbZ8dS3QNPVNH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793403; c=relaxed/simple;
	bh=BPTqbhqBNKF7eXF603y1EFlEzMSdfVj/K5RsaXM8QAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qbdydWyy+WBalIQgkMNEucvxmUwDE45GAKP4uDMuTVoDqzKjanfW6nF7gzcjvAkIg1e202QH+MYm9Jb7esx230TlyRDKxRKcxIsxuYoFNkragea8lymkzCwEwqkSxjBtWWSgW85DtZS3H/gEHFsj4KzlKBfmL7H4o0J03LB8ybk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+PZEqEd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+PZEqEd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5493VEeu009212
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 12:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1f/JYxetqb8RgZlUy4cv59FbC1e8F5GR8Vi4igmQdNk=; b=J+PZEqEd9BepWbVD
	iex2vj5XBGALhIf/4pMYKcDfLKs+p4pNKeZ9JDUxf5DFigiVGR1+E4jh4qRg6nCf
	HGjI11DGa0llDaZesu2jl7sHJaPzvYqyT+8NjYbclu2MQ80pVRQoI4yWp6tLq+rz
	n5+MeI4ipNvNsSuBf/KJnqb5qPcVOgEenfYOtWS8055VIz5hPju1xBtJBPknQueT
	t9uMcYjLm7lLgR9CdFEFt3HY2OQV+EWE31Tb1Uy7hGIacvDmmZ/vVKGOBXlSR9U5
	sW5ax9HCPx7tY+scTHuA8QU/H1A6qC2xwiabR9og9cW25U2F7Fwd/0vl4qr5Zran
	aCPG2g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpevh76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 12:23:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476695e930bso4503721cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 05:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746793400; x=1747398200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1f/JYxetqb8RgZlUy4cv59FbC1e8F5GR8Vi4igmQdNk=;
        b=jW/pgbtfei4Dv8VWZMMoPehauhYloG73qyD8XdBiimqIX9e/i5i650IepTdoUHR2ZD
         7HRYAC2ojMluggvyrC/KNCwtHN6IML2cN6f2Kr1TWpOYAka/hDggG/PDawblwRLO1RC4
         TYcWG4sBbV2m8ZzVtsMQ6gp061RHmKi/9TCsZxYt240mE58Ohd09Jdw+yPky85fqoJsE
         GpctN1Va24eHmweUS+CYuA9vg6FNAlpksa/yrvissBXqNYKfALY7M3aSuUQsXvhwmuvT
         tKtLSi/6DCZblixmuVwuztcLqf/zXAqlk9Zpwt0qfX2UcYVTdWOaYgcQhJUmzQjPYwqv
         ED/w==
X-Forwarded-Encrypted: i=1; AJvYcCVpeufgPFzACpB/5L6TEmqc9hr/p0eCOI9aWDGOVgkT+C7AO5SsLpLWSFmazDvKw25noHJqkhmDB98RHns=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYFdM9MowlKRGtojnmOJHPCgbimO0iPb67hiV4LizYyE+GZjuf
	CddmTbqNzKG3VbOu5Td9erV9oaW1+0m9lhf8j6LaUmhwLLskO8K1i37FSnWhTS2He/3OcPDasm+
	QPkqPa0gRfE3PiJbWZGrFcUu5MmXBgaMzV0/siItwAvxm5UZTFFsToOSoPB9FfjM=
X-Gm-Gg: ASbGncvGbCpoZ+kmFR13jDypaepZdlBGQrX45KNtFqabXP+jkRuHxW95TvhzQipT/Yg
	4dgdigbMEWwkqHyGdb74wqmHW52c/PibFkSWRfIIynLn23OKM82kVOQ0hd6UakEZlFhkMnbKW4H
	VUShdyKRvh8yH9GMliizWSxVHpV1HcsVvPEUTNjyYHM91h64kqSfo8sTM/Pwcyqq//8DJOpWrrK
	nkDInlgCYpzYfnA4lvt84Y/0wSRJc7TorCWgRaNA9zNF2vK1sN7o/95Cg1DliRnVcAawhF+Um+X
	buWatLFq7EKhFPpHADbhsZd/VSZMGhv0jp8sX5eMPdFARtuSYRPdtv67jBLNnhHMOD4=
X-Received: by 2002:a05:6214:5197:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6f6e47bc895mr17154236d6.5.1746793399922;
        Fri, 09 May 2025 05:23:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb7jn/fkRrS+0pNmBt25lIF4IJKWPlbMbX3OP46mB2qIDzck4hs/EEPTKkaXlUd5qrFgS1nA==
X-Received: by 2002:a05:6214:5197:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6f6e47bc895mr17154106d6.5.1746793399605;
        Fri, 09 May 2025 05:23:19 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d700579sm1336922a12.51.2025.05.09.05.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:23:19 -0700 (PDT)
Message-ID: <0ebf9eb5-6906-47af-a4f2-99a4587150be@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:23:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-*: Drop useless DP3
 compatible override
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
        Sebastian Reichel
 <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <quic_kdybcio@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250509-x1e80100-dts-drop-useless-dp-compatible-override-v2-1-126db05cb70a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250509-x1e80100-dts-drop-useless-dp-compatible-override-v2-1-126db05cb70a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMCBTYWx0ZWRfXz15dKchBWaKZ
 Wu4yN2Podlah+cIPZFuK5zL3PJ/bJIr+ZPPLCggd6yzjyZGCBfK7yx4J38blwAWd2Azs9Pq0etU
 Xb4EAVI6Nx0nCv/FLgJzNsdtS3kS0mci1tG6Nl4XPqadUT3tknNjOOSNhAzlMSbWzQqiiSontHH
 G/n4Cz+0RbevV6e2g/Ruu32TZ3izADk06ChxCAk1NSiyW75FvFiS73Ltru22+fVApFMMr3cnYkZ
 5NuW06FkdDPOB4mI70LhKWFVKfm76jEKavp72PzW0y3ieLH3OW+l0DCDlWwygNbgXtLF/XXTobX
 UU+FU4RYEx9nhMhdkBC6o6d2hGXENMXRVHWkgcxD9DQLgsMIkYYDFWrj0KA+eZRY5u6FSqFqZns
 WtNYoKUjJExo5rvf7bBHAhTcWzM3+LhwGiYnzoOY491YAapjjbpzNbJwqLW+s2tlyIykwSqz
X-Proofpoint-ORIG-GUID: wJMKEwvm0AK0p-NfbPYOjPL0wJPzcJKv
X-Proofpoint-GUID: wJMKEwvm0AK0p-NfbPYOjPL0wJPzcJKv
X-Authority-Analysis: v=2.4 cv=Yt4PR5YX c=1 sm=1 tr=0 ts=681df3b8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=oFAjQAwgCFvTbsaC9pkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=818 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090120

On 5/9/25 9:08 AM, Abel Vesa wrote:
> Back when display support was added initially to CRD, and we used to have
> two separate compatibles for eDP and DP, it was supposed to override the
> DP compatible with the eDP one in the board specific devicetree. Since
> then, the DP driver has been reworked to figure out the eDP/DP at runtime
> while only DP compatible remained in the end.
> 
> Even though the override does nothing basically, drop it to avoid
> further confusion. Drop it from all X Elite based platforms.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
