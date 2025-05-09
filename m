Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243FF2609D6
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 21:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746827308; cv=none; b=aNIaWXu6kcdp8XSoR24+R571yVnsM7/dGzvZP+PS1k6B3k5ZuNSqVL2sSg8f29n2BmfLZEL9wVksoSPGnzLmoZIxJUGM1Sf5oLbJR5CQZ8MGDz3S97GPPiR76qfwmcZZPxEz/q0+QpCQoWX8J52d7c0XpuTNz21z7PY1OXZ9/Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746827308; c=relaxed/simple;
	bh=jMiO8dfIWqztSqyBC/M/E5+POfZySH8C5EjWZ1zmoKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pslfYmmMAX+V3CWZrXn4k6BYW/Uutbxmj+G/qINTi5KOaxFKInVs5UUNrmDWdT1dCH8vREfgqZlL4jsLBB6ILtxLJtu2hGvIxdsakzFC0af547SWOcAaMrXs3J4Hu1vuCdSb2kdZKTD3bL/EJPbDyS4b5fut0TtKadrS//TI9fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEBfc6CA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEBfc6CA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BwbvD002550
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 21:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkn3x/u1u+KSHGaXD2ujk6gLEDw1t6RvipnTJM9byJU=; b=aEBfc6CAEW/1P5VD
	rf8YMFtCf/5+TPYoyKd1Od1YS51NRKX6BgS+KKDzeoO9dusIJLged2z5xf5xV5cK
	AQ/ogyrCkhUEdF3/+5uaw6CKeAyo6mejDWfZ+k+dV1ZsZIh8sU7efEGnfOm3DKlA
	DF2BQg5bi4Vj5nRIjuGH3c4CQU0uesd7esPtIQwEPY12H8rp06qv3jcNJOS4rJaN
	gimSPQltAo04eIc3ECexxUkScmRLR5C/Kvn3ViPZXmGYWTyYtKt8v1iJ3yQCpqgj
	a82tG9Qw0p6o5d46Hi16fnmFDuHSpkjDWnBMWu5HEN3otQQPsPuNom2nATaBoAcL
	TYO1FA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5dv8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 21:48:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f541067fa4so5751156d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 14:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746827305; x=1747432105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkn3x/u1u+KSHGaXD2ujk6gLEDw1t6RvipnTJM9byJU=;
        b=BLgliuXXNG9tnaJziL0DKK5KppvH8YCyrqO/6NDmBEdz8aCjYUo/NBpsKHS3yhJyW1
         BksZB7EE05Mh3o208qgTVKJr4LtnEMKeAK95sQuAZiYq9SRxC1T/Vap39TmzB3RZYgtQ
         MdA5zT/jMnlz8V0id/dDJEOfT2jF5dBv/eUgInGFY5Um7WzWtf+vK8vcnEAQYc8xFTMT
         93+m+lu5XSk3KtpKqMGcfcEoa1f82sbr5jGCro7vr6q/8KCnLBC/ctnTIVKbIQoJHmn2
         ZHbJNzvolZGZzTwE+0Dm/RElQt1xRVYHgGObIsQd126tZfadPoLrC8VxofF6Rx+x20Cz
         /xOA==
X-Forwarded-Encrypted: i=1; AJvYcCXABxX5t0kAtD4+ykHHVvwzK1GJ5Bm7FZ9DIUIsLxu5cw82TLSZyUmYtlIqMAqx2hD6uZjaGFcQkoV48FU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVMmYGDjzRLM2CrGZvQOzVBjaD4N1cH95dxym6VUDh8aDUnJc1
	iyV55uOHbXCvYp+Awq15+IyApCqkOd5mE01/4JIWq8YYNdKgONSXZkiHSh7N3jd8lyqadaRcyjp
	gxbRhrmQLTqBxTBK7z3Zla++xxYmX3NsUhHOQEeuU18KzGhuRzY+J3Xw+HPRDkXQ=
X-Gm-Gg: ASbGncuPrvZ4l3+AHTLnk3c86AEYvh0D39HfhBn0hBLv7VFwEd9HF3Jizj9cXeMJ5lN
	C2PmN7ejfipULAFd2fo0za30mtm52cJc50nixYvCKrPus+Yn6efuOpmaEqjY0hnUY7NNQVObKc7
	52Evdkqg1X5poDHBvTkOaqmqIK9F8Wn+0wThD5S3KmyDjJ5sbA5TWcjOS5VL5FUw+u0m+E/TWe1
	vL4htSs2SkCScT5urvKpiDwV35lN6JWL9BaWtmaJtchguM471kxEvlEVsAtXnoHJZHuXxmfh0Qm
	Sa6qMjFaodDqKMka6uquQR0x8nxz6aCJpIgeARDuA3GczbiC0DyYKaSwk7gPS5/olKc=
X-Received: by 2002:ad4:5e85:0:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6f6e47bea88mr29484046d6.2.1746827305428;
        Fri, 09 May 2025 14:48:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSGc2XgNJYZeKKzikhTNArCWy0JPoDUUmmdsKTNg1QXI9xsFUIewBL4B3CBOAqNpYYGbz9XQ==
X-Received: by 2002:ad4:5e85:0:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6f6e47bea88mr29483826d6.2.1746827305088;
        Fri, 09 May 2025 14:48:25 -0700 (PDT)
Received: from [192.168.65.158] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cbe496asm1899058a12.6.2025.05.09.14.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 14:48:23 -0700 (PDT)
Message-ID: <43dbdfaf-fc02-49f4-b2e6-5c08b1998d17@oss.qualcomm.com>
Date: Fri, 9 May 2025 23:48:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: clock: qcom: ipq5018: remove bindings
 for XO clock
To: george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com>
 <20250506-ipq5018-cmn-pll-v2-2-c0a9fcced114@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250506-ipq5018-cmn-pll-v2-2-c0a9fcced114@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681e782a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=1mxAAckyurNBcPisKkgA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: R278U8SXHelpHKjtdolHINII9zw2weWq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDIxOSBTYWx0ZWRfX5hqrQlhC5vLR
 8tCjn0pYGDmSi3mjJ2bX0n2GaDpXHei/E9XBCJQsayEjMHDruLrg+q3AmAdbfVPiltZC6q7Letl
 K0Z9nKkNRWsYknc0Q3YufzbRx9/EYDVy/CaSHkcDtTypclbrNTaTCJFW8qWjo7skREUDFqoS2lo
 3Pje4ODHWWPC8CewwlQYSv7e74lK3PUARENGx38piNd+1cPt8tVTaxAj6etFVDr8jWFkAI5s4ZM
 4lcWS0vhkVczMGjS1+mHp6rmbm8P5euQfyp+SBbuZjF2NbCoAc9H3QI7FJIKesrtN5PVCVLSbGz
 YGnaKgbxsSDDSqPWgX8NEiHwJOMJcaz/L6Cj0lCLzNZ1KvJmmSc8kK/cLRhrbuCUjEUbOj+GF93
 MHgP913Y2lei15rMCfPc69ye7ZqWTfgTfCRP74YZw1ko3Rsp5S7EEK+Fs1mDUu6jD98Ak5LC
X-Proofpoint-ORIG-GUID: R278U8SXHelpHKjtdolHINII9zw2weWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_08,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=947 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090219

On 5/6/25 7:43 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The XO and its source clock must be always-on and is enabled in the GCC
> during probe. As such, remove the bindings for them.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  include/dt-bindings/clock/qcom,gcc-ipq5018.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/qcom,gcc-ipq5018.h b/include/dt-bindings/clock/qcom,gcc-ipq5018.h
> index f3de2fdfeea11f4b8832b75a05e424ca347b3634..d4de5eaffee7b4cb81e0ff2dcbf9e6669c3da8f8 100644
> --- a/include/dt-bindings/clock/qcom,gcc-ipq5018.h
> +++ b/include/dt-bindings/clock/qcom,gcc-ipq5018.h
> @@ -140,8 +140,6 @@
>  #define GCC_WCSS_DBG_IFC_NTS_BDG_CLK			131
>  #define GCC_WCSS_DBG_IFC_NTS_CLK			132
>  #define GCC_WCSS_ECAHB_CLK				133
> -#define GCC_XO_CLK					134
> -#define GCC_XO_CLK_SRC					135
>  #define GMAC0_RX_CLK_SRC				136
>  #define GMAC0_TX_CLK_SRC				137
>  #define GMAC1_RX_CLK_SRC				138

Let's skip this patch - when we add dt-bindings, we promise these values
will be an ABI, leaving them in there, even if unused, will help
introducing spurious entries
