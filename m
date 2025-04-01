Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F2220DD47
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525641; cv=none; b=KTzHg58Rh6vWSWH0lE23DgZPHIu89WE5gp5C2t04THqFZxVYY/V1eyh/6SYhUBvGH5aksfLWdWS0M7hd/9/4M4G5PeVYjdOT1bB1GzuI4B0MBUEtF6wS5Lc85zsdceIrRn47HLKdGouVPQuJ3pBp765hYbzhhqvVykALL8uGvSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525641; c=relaxed/simple;
	bh=UHpWWs+DyipNZHEV2Nkr4YRS5WpwRh+UNqWpXhbSsXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=reX8jTjNgn2hkCKqwC9TqdYj0P6FEbBtmheIyy6Op7CAb+kC9V9CQK/sUllWO7LY42AbBh8oZ9Sm+Eu+2ZGjHvi1w0p3Fc80l53h7W/z8YPzLWvwSXNDCOlGa4Pt8bJZ5daNRmRWK3TxCK9cUcIW07M2Aa6s+ID2d+FvKiMEpYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a70nKcpy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a70nKcpy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531DeG3o007206
	for <linux-kernel@vger.kernel.org>; Tue, 1 Apr 2025 16:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/379CuoW3tzmnDJsyDy/0ujjjwBPjP0Zru4t6cZwrYI=; b=a70nKcpyHh8Ft3MK
	dAD1X5izfpBIhtoGopYSOCahmi0n/Sq6Nkx0hsZlFYduFuTaETSouFmSZjc1AZRl
	V8xXi1mMY+bsO86eCY+XYoKBOwdmMXaWGW7XRGrDRAZV8ud2Sfemshdks444K2vo
	TpKaeqxWM5f1Yuo49+LWgWJr/MbdgaSYD9UCDNGB2y5GQlFel6gOn3skxSyAvo60
	ruOzjxomi9pBdxTKhTpduCIXfzjl7FsG1KjkjeZ93YqL0QF+1d8umK/JpQSLrHIE
	6k7uwa3BW7PJyaWjbJ62qeWSvkfjx2cLZTkh57ej9u+8lWJw6urK+hHaUyy5SUs7
	4R52yA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rh7ygh03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 16:40:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8ff8c9dcfso11123176d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743525632; x=1744130432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/379CuoW3tzmnDJsyDy/0ujjjwBPjP0Zru4t6cZwrYI=;
        b=JsSQaT5Op96zNu7pI4c2lKs7Xq4qpcvFcpjiDpSk5mbSZNYKdnPys5iZswRj4uRmfV
         LrjJ+iegOhN2hEnkFML7smRIETMh6TSrFXYY7U0c5Y4SLswR3/sRoZpSTwL/gmL1Hinr
         WlHQVJBg9et+zjw62D39gRzehGMYC73HHqm1L9Env01DtYrsD9E5JZuqPwHjpiQq3/EJ
         4q58Ssx22dY2d5afb0Tu4Cvcof/UZi9CTRp9f4Z+zG+xxS+eopof+JefGX5szGvYJDKf
         nxsX//CZ1tiHH641oIPrIInTIoZMXGi0FiHQCrpVzxHYON53+bceRJ4Wt7QCQBtHbwMX
         3SOg==
X-Forwarded-Encrypted: i=1; AJvYcCWhUncmYq6S8/2dgp/U8kZtAjQSF1vpU0IYW83xhJAhgKid1t++8ZfY9lqdtm4KDsLcw7UrTsN2og59OsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUFd10ZtdM7HR/9clHT0rUOr7SxjdaznUS5MmTddFL3Re4xJYU
	J+oNsnHtLrWFwJ3rmtEo+tdRpjiaEATQN5vARpE6l7jeejlMULfSAL7YVKaHXhgBm0uT9f8eWNp
	/hEeD2sBowc5Ip6Flk4QZOqiJsPLAzwP1XNVy4FmYVVxDBc91IdA4q4a/SzIBgfk=
X-Gm-Gg: ASbGncsCA5Q7/pdRTZPZq+eFp94LCs0NJUhMyZmNc/7I9TvKJBi7UedBEmH2Vidmvuv
	IB1FtXkGUuzzLTW2Jt2Phhk84JebKDy9Q4soxvaAn9d55CLWI+bukFsIgv3flQyQ0rdqnlsqmLH
	KwZt0ZEafGASo/d4Oy4b6a6WZEjuukoEOJgG4aXxZIKa8c8QqHmjh2ioQ1KXiU+nKoRn/2u7KkF
	H1e6eaTe7Uwc4alHnTcZqfalnLrxEQ6z0ricJbf0wBYWBxG1B1zo806tGSXz9PUqNGc0d4owWoh
	F2O7+oEjawg31rjYMxiwzvgI3XTA7RKpy7b8vrOiYhgBWsjtAdaSqSaMJQRNQB8OI5XQ8A==
X-Received: by 2002:a05:620a:2806:b0:7c5:8f40:3316 with SMTP id af79cd13be357-7c75c904636mr166846385a.6.1743525632708;
        Tue, 01 Apr 2025 09:40:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKdu3svWPD4gijx0TLoynI97bgyGfAj18omhMqo9yqcZrBylhTXjcw7OpbvttjPcNFzPQb6Q==
X-Received: by 2002:a05:620a:2806:b0:7c5:8f40:3316 with SMTP id af79cd13be357-7c75c904636mr166844285a.6.1743525632324;
        Tue, 01 Apr 2025 09:40:32 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7192ea05fsm784381966b.86.2025.04.01.09.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 09:40:31 -0700 (PDT)
Message-ID: <25bd3c63-5231-437d-8e81-9e2198dfa0d3@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 18:40:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615: add QCrypto nodes
To: Abhinaba Rakshit <quic_arakshit@quicinc.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250318-enable-qce-for-qcs615-v2-0-c5e05fe22572@quicinc.com>
 <20250318-enable-qce-for-qcs615-v2-2-c5e05fe22572@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250318-enable-qce-for-qcs615-v2-2-c5e05fe22572@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IYWHWXqa c=1 sm=1 tr=0 ts=67ec1706 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=rugxzkDQvrqM6iDmQMkA:9 a=QEXdDO2ut3YA:10
 a=cf2_AmsjeD8A:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ug5KUFHD2qSWPcOu9nF227wKyP9Yl-7A
X-Proofpoint-ORIG-GUID: ug5KUFHD2qSWPcOu9nF227wKyP9Yl-7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_06,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=722
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010103

On 3/18/25 10:43 AM, Abhinaba Rakshit wrote:
> Add the QCE and Crypto BAM DMA nodes.
> 
> Signed-off-by: Abhinaba Rakshit <quic_arakshit@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
