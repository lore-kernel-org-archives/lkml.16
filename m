Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25E722CBC6
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 19:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747854183; cv=none; b=mI9IUxic4CgZeMJc/I/9gVVfK/ZfxHvnWRSiIxZX74/nTyMcPHQR71xYYE/P7QIDUpsCG/8efarGoqXjBMmfH3Adea7J0Jw6PVDp1ZYNOZSmGzZWlO1rDhEoXeVEIheX7i0VnKU6aiWjThLaWRyW6RA7jEGFZZLFEVrS1I+4gpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747854183; c=relaxed/simple;
	bh=8twrfZ+IWMuXm8fHTJgrikxj0BAx38DiOL17BbqoCBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aURXMJKtXKKQj50FF+f3EzHPAd4OEmCKf7JdyK0n72yvzYj69wT8XCjVYVZx7ZCtOvgu8PufcIixrh+Ylc9ubwsZ7t4RBatB5WZEJcBlfrvSHLmkcIWvzYZSKUIqzGHpFwQcT26IHmdqOlfpIdcGumfgvCpNbZ+1JYLKCk8BmOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CxL19PIw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CxL19PIw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LHsKAu031715
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 19:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hZvwU6rcn1pU3SuVgKIwUOa5mEmteb7nXnsZfgaC3Wk=; b=CxL19PIwSFTBU8oj
	l6VLwLrdcSv/c0377U3U+DmxCKS/7QWlBdDIZXNM576sGs1HLErBOb6zL/Qe/udJ
	PqsYaLiY2p4oNUclbqV10iQggH7XM8VnUxhV5KArprwx+EETwpRGXXHFSkSsy2w2
	m9LCYv3TPI7wPkZ8BQOQDEcDW1NE/QUyoK/NkD42hr1GN4BPGeoVMcDrd//h0hz2
	3kNSZMp5VkkTpnj7NnvnaqnmJennMCyEc7AWFgw370w9rI9VY3gmqTGJn8kMYj+Z
	A2wMz26elrq3/blKPd1u+hvrDXPwQtdYZxFCtDAQ9uZrwHvKZAcmmI9jEehrzHeS
	BB/ugw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c22h9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 19:03:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5af539464so199924485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747854179; x=1748458979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZvwU6rcn1pU3SuVgKIwUOa5mEmteb7nXnsZfgaC3Wk=;
        b=lPEBfh54/7ghDto6szmAA2Kyb/yYlxKdvjCcI7xxxmAbWRcQNE4liQvmYaYPEiK3pc
         kOIMOvVS9gksDYtorBbvReA55ku85R0rL5x1ZFyfPYy7EHzDuUQ5NUnYaiEB2coSY9zb
         SpDoz//8vy1v+k6EJvYaAOFHF1BUJughzST+PsmDdTdbtRmcyQRzkuBkWHfeiPM2BSKW
         hxqK3npIep7bBxmT22NZ87v3IuzxO8tn/e+7kPf9RRYOsWpPh3M6+L4W3pTwFOKLFesg
         naG6ibmf1PEfXmcX5r15XmIAMzk74s5xUx9HtTJ8uPZOkCy11gDt67gvK8ziJalEFs5D
         XG9g==
X-Forwarded-Encrypted: i=1; AJvYcCXpQiv9QPvqqXlsc5fvpMZrKySnB4jfRAxHta4WrlFQ6hX9J7LnoKtOlnFpRRgi/T9e0vg45enilx8xwRU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/G9mBB9ssuwd40fDgoDvdCsVZKS1xN+Yr1mWaUt7vzZUZsRik
	UyUWtd/7Mc6Yes1LzXk4BfV+P1qrLJLbVCzNKhNqihAbrDo94mopd9lKo3ILPB0ge9BLKzi6SKo
	FG1EcHc7DFlNvjKC4sc+UZQB6LSBV8B2+rUMC2j67JQcR1ETmCwZXHSGRXaxjs3PUwtA=
X-Gm-Gg: ASbGnctEojLgxh8nL71Bbd+fl2sZgt7GsLcenSNnWvCDcCxvcVaHRnT+JLhltpgYvmV
	Ka620L0sQdlKMsVx3idEBgg1rqsd2mpucIJt1rWBPqi/vYw3beC31GR991JFzRkQ/QsNvLX7Tts
	t5E49TRpvedCPuisMSqZhvshkXDgxUjWhvZZ+xWbdgajCW6SIn/hfc64NahQtM9quz2+u1f1ZYD
	liycPzfd2a0MuoLrCQRxKY4qOWovYd2G03cqR+ChSd7xH55Ml0gr8dcpMupxwqW8s0Lj2+uxFBS
	i6jnAgAJO5R2C/3/K68VRTJ/qI7jbdpUM3X4y2J9OrzbWgKAtw3UVSJ4/3oqIHnjZA==
X-Received: by 2002:a05:620a:6504:b0:7ca:e39b:946f with SMTP id af79cd13be357-7cd467db69bmr1311535885a.13.1747854179430;
        Wed, 21 May 2025 12:02:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJthzcnQRjBSEzhEyNWSkKkY3ARkGqwf4+As8NUm1pnKzoZ9brBaKeWvyPRtoJC9YLjjiNQw==
X-Received: by 2002:a05:620a:6504:b0:7ca:e39b:946f with SMTP id af79cd13be357-7cd467db69bmr1311534285a.13.1747854178861;
        Wed, 21 May 2025 12:02:58 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047c30sm937346166b.6.2025.05.21.12.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 12:02:58 -0700 (PDT)
Message-ID: <575212e6-5f43-4e41-8bfe-8774f07d78df@oss.qualcomm.com>
Date: Wed, 21 May 2025 21:02:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
        bryan.odonoghue@linaro.org, todor.too@gmail.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE4OSBTYWx0ZWRfXzNPQyCSPlz9K
 dGY1xW9+l7ERuGkTPNGfMp0AlH1QAmDBKFwqzwrL0IazF/fpPRDcky4HgdZwJl2W5KoaEA4t/ao
 s9Lu8LGttYg84ig/kFgkxMIFDQUpvojw+0Ad+dRdEq4iXb11gRjxnFC19+AyB3QFjQOrmxO4Omd
 KjysOA5d2QWXhBS11QnnzIqtd+K5obJ0X6j4dGS2fFZkVNANLaqKyC8J2eVCOWUOcVLG7stE65z
 1C6o7lO7mlMogrzwM4h8/sZLUP4b97wj18+g70jl41McvPCy5KjAVGF70Xh9lfrC1ScemXUMnta
 0NSP2WNlbTovqRKpdO4un9KFasfUvHpCkV+mbowfeOMtWr9XmfsSwv5vBzRv1S1IkHcB6sSwE1m
 +hAGjhiAQxIDC7i8OAhqeZzGIm6bPm2aFwQvn3d2LMgelFcOgjqcMuBB/NMEFfiRg8gcjAGO
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682e2364 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=lBa7_Vnelazs750aZ08A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8711GLjmIKLviTyViwVGV4KMypFV0Qgo
X-Proofpoint-GUID: 8711GLjmIKLviTyViwVGV4KMypFV0Qgo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=878 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210189

On 5/16/25 9:27 AM, Wenmeng Liu wrote:
> Add support for the camera subsystem on the SM8550 Qualcomm SoC. This
> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
> 
> SM8550 provides
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 8 x CSI PHY
> 
> Co-developed-by: Depeng Shao <quic_depengs@quicinc.com>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
