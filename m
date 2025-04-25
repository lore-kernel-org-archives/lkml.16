Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A95218AA2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745606982; cv=none; b=UtvKfKk3mMM1oPuWwkabnHSMh3cWiipccxm+jlqRHyvlgCHBJwzjpUpdneUBozqcsVspA1tUxX7HikRHDv/0mrd6WMuwReh8rRgWewMWLsskxyLqf7jOlnkJkZi0+nAndU5Kv7MCmNs/AOAskK64iW44KSst1gwqpXMyh3qWe0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745606982; c=relaxed/simple;
	bh=RneatS8jBZNd3NEWX3fEjnR61uPY8UIAAgxyzxoZsMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fmCvvYUCuOJHzatlyxCPjj2RRz/Yy7hAaMh1Wj5H7/6wn1f8Yu3+axjZL2ADOJKHuqZG8vBel79+1OU6l5uOvUhdz2REoQQ19PRohm0fivEoQsyOVNPIX1xA7/jyyEWII9grRuLwFifT7tRSvv5kwFfky8mrGdSQ4tKp2Yi+5V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxhYNBXn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxhYNBXn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK11c021888
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x1Wut12kvCNJz+De9wNvp9Hw
	b3L5Js19Bom/bF2EeKY=; b=lxhYNBXnlKsP/l8aCYiQmV6P5tw7E2BocR7YKujm
	oTDtmGQoPf4boqnnvUX8YT1cZkFvPsalIjfvb4jLU5iWvzgWc9UACXUukBDJcMnR
	y6qP+0soiw3rWxn86VlnOyZ+gShpaSvIw0wv2UoWeyX8cz5KJs8i5cl5Ka0SIWaa
	iy64rfVKv3wO8IBZnQSCfcsMvmpol6rntsKOsSuDNhfn0vkwq6qahyBc+1TEhKg0
	k9TX3iuUCdo1/LJJIUbjnC+NnPg70PZggYljCBuZL5f5V8Ku3aFRqOi6VAN4xeRE
	a66WcX85YToo93+jSlRchsqDG5faBFAm/xpVLoUFFpcsDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5j2ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:49:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c77aff78so725104885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745606977; x=1746211777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1Wut12kvCNJz+De9wNvp9Hwb3L5Js19Bom/bF2EeKY=;
        b=lYnyOQkpHJ+XEqCPlP/BxLPLqwSrGwBXlQ1XpVVBMDNRMSsD3fzbhjL+1PT8dxi/2e
         MdyH4/ZMHu7yFlWJ2uFnjPdrWvkKsKs+d+T2pbLSjU+h4LdREniYDKubLBb88CTvYSVJ
         Xj/de8lAue/zRMZK0ObY20iS3QssKAgkHkCye7RpjXN7bjsv0WLT5Qx/Yo2RPo2d1qNB
         Thu7cKrwIz4O5YaG7mldPsSsCNHnH2RpuZsaZEPnXqCFtsy4gxcv3ecVQ4JtutLsaCCM
         a6Sgb2Eusx9pN+GM/k2DtyLf4sbIfOwtF2tdC0Bkq3OEieF+ERqiLKGR+4Y96N/Fd7iv
         jB5g==
X-Forwarded-Encrypted: i=1; AJvYcCXDf+wRNCowOqsSW3eiH9K/3QA1d1IfawdkdfiCKj0ruRW1FZ0rSKJ1Dtr24PE0VFW3B+GY3vSN9+THPX0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo2H5PRw0S3LA1IWEbl06UqXMLw6kZNwULkPAAALjKolay/iGN
	4Q9xhiDTIK108ZnSMi1seF6i0MW0mL68B9jm4pkU3fNcKBkWaMF8U1JyZH0HpseqF6y4kNuHP5r
	/BDk9SJLQ5b768R0umuE8WY2JTRVslLFz5l+PLGrjL7nqxE6MFVHiWfv8CRRg4Xg=
X-Gm-Gg: ASbGncuMeeB57H0qUSw3FfamObc3eu73Vv9vEa42T24wWbBFs7MAon70w4O5ANw7W2G
	wDXFPQpjWtEfHeI9jCp5MiVRownn3bhQGAPSxUOVLSCzL9txkKaLRpK7GMcaM4X3YTRGz/CxU77
	iTo4k8EcyU04dM78xsn0fYcy/OopNbQKbYm91ENXU75FqSR/3u+vD+gSWa07YDbdl4TJPsB6tTM
	7bKNvyT0tuRojYn/b7Why3jg1sUIKs2ninLZHu06EZAavJHdaRWSs7fiqu7eQGtWPw5a2Y9yD7d
	iGAu4En4Na3+Gm8WZ0OwKgiJQKDEfi0K8nZ/UvbXFU3IGE0mErofP6Sd6InWE1LZq3LuSki1XXI
	=
X-Received: by 2002:a05:620a:4628:b0:7c5:4de8:bf65 with SMTP id af79cd13be357-7c9668bfda3mr136847385a.36.1745606976783;
        Fri, 25 Apr 2025 11:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFixpTIh9UohupnTvYjAkyQD8NuRNclkRjUtv4PU0Loqn4qq6wPUiPcvzkwrjCCdxtuuH0pgw==
X-Received: by 2002:a05:620a:4628:b0:7c5:4de8:bf65 with SMTP id af79cd13be357-7c9668bfda3mr136843885a.36.1745606976430;
        Fri, 25 Apr 2025 11:49:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca8677sm687754e87.175.2025.04.25.11.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:49:35 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:49:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/11] arm64: dts: qcom: qrb5165-rb5: Use q6asm defines
 for reg
Message-ID: <e3s3jlwayij4uxtdcekvs6ei6cfkynbolvp4tmkac7elehosih@76m5wond2dyx>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-5-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-5-28308e2ce7d4@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzMyBTYWx0ZWRfX9Vl5lIL0Zs+1 rEMopgJfHohN3rHqE7MZ0J1RVYXqbxqb7uAC4Q6h/NLLCXm6HdNZZIjJE1kBsfmfqmbfDhu7lzl UXLsQL+tOx/I8K+Jn3k0phufiY0r4hSuDqwHibnNlxdHKLmvUERri9aMf9uoaB29Bo/FzimSlyd
 J1OyKqUPrvg31PiuOJKi9O4ecxKIt7Y3DGPtfVBinIoKLmamdWzXN2gecknOdWdtVUw5XPhnuKE jk0fFFyyiJwTR8KkkQu1BU1y9xpiPdvK4l76nY8pcyEu10aDh7QiE9GOXGwyjBhyBWW2Op/9tYl T0EFDxibSxL86SP5H4eD75xYZUP7SRGG1bMqYNDuXgEwWvRtP6u8UQhnGJktOQ5E8MmrWnVSa0+
 YbUyz3GX52gIYP0xx3GN09Vr2i0b4LZLe0ioyTtrQtBAGNnV08Jc1ja7rEr9j96JiWr+V5x6
X-Proofpoint-GUID: 1fpInB-fZnadZ7Qgp8FiPQr9XrxYQRhQ
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680bd943 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 1fpInB-fZnadZ7Qgp8FiPQr9XrxYQRhQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=624
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250133

On Fri, Apr 25, 2025 at 01:53:44PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
