Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EF4296167
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796671; cv=none; b=ZCMGG6nGJHQdaZSpamBKdZrF+XZ1j3RRSlwq8c7Q99IGrjcAT9DN9/evdiwBuruwjRrrlB3qSb3jCvVykqqvrOiEHM3l6SVy1tp+Nrd9/7eQKvQ5LdCFMXdc/kmftExct2DBRz4Oz2yPazIVGJxwSGUHsAVwTCqrcIW0rUkN9BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796671; c=relaxed/simple;
	bh=26bgPGM+XWHNh3zKWLPJuWSdDtdYX/ImWKydHaNQSZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rP42WuAIrgtD0PJTGZwRyfQMu7OxAFGTG5hE7UMDSanJhLagSjNXi7O/MjCSF7etFHMM2AUrZ3/WlEp8BssIuOpyV8+IaBJxLx3UC7feRWKz3pbUCocmehVQtNxLJDi+sHSB0ccQbIDrM09kZl+xsDczMaXzILnAKrZ/JQPqw+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWHmYOaD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWHmYOaD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549Ahkxe025418
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 13:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKPwnoZ4z7Zq1QPdVARuUad4atOXjNSus5NyMxTgizU=; b=lWHmYOaDVOS64iQx
	gAimpzphqGRZjeVZBWY4fj/6W2tWL3efI9HtoYbq1lVhmARYW/pB1HLANoqVpYnn
	AtCEvEQnViELvI1v7t3y/astKCB2e+3OO6fSjgs8SDIrHx3S+yVC4iJGLWMp9Uuw
	647S1BnuCRvVuBAHlb3Wo5ElUmdxM5xvOsFxt4HcJhTnHN6OhK3OR2vBFfH5ZlAt
	nun+a2aOBAhFd05k3wvSNsq/u9ylOrkC0bm8ck/Rswd6sucP7oojzFG6XsXInOhq
	BdTM+3SzEf3u4sn6q3slL0T8a3Ly2czqt5C8ZPj5JE0CK6UNJlnBgGoLigmUQw/S
	EZ+Jew==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp14ua1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 13:17:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476783cbdb8so5454681cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796667; x=1747401467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SKPwnoZ4z7Zq1QPdVARuUad4atOXjNSus5NyMxTgizU=;
        b=PNSG4yM1OZFvjsw3h3yH3DRJgKlL9xFG3c6kvflC8CgODCuMpbzCpW3PrW4N7MIt4B
         QV1+zBSq5JdKSUlRDK4effZzmIL9ejcQTGA8M2ib/4BgnmMwSmIFbKMuXS/nwDvugrSm
         PAir1qzuo/OHyhfOVVRNPMF7FAMzCEL1dLPLWp5/JE2pmin68SR6hfzKG9oGrQlCH2Wq
         eGQK86UjQpkjbudm49CPEt6BVso8uzFND3Oe8n8epvlgQpM32H9XsJXAxqChSQUBONI5
         y5KWQIW1F3GItf8mgY2eLsETYf8oYBmB4oBqb0mEX+388lhNkKN6+IRePTIH3crZzEji
         XnfA==
X-Forwarded-Encrypted: i=1; AJvYcCV+XAzFwRizBWQyJ35Syvom8Dqq2U2kwelWPxDGuxbaRbJSiz5kGIUHbqO+AYMEqNDVK6C+vvuEkTt7Sv4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAIcEQgONiEksGmdqNtdrShj+QPsDAj8P2PDXlfu/Oo+rCkDlE
	6oaGcQGw+HK4ShrKeKdN5oU2hYERU4Vk9suDoz79eVsxSe8+qZfridh+ZhiBBnG5Ipb6zqMXQgC
	NlQq/OwnOzUtPZDbAb0fZZ73oUga335O/4vVKl9+N52MqQ+qSr4GoYWYaQ1pjnnM=
X-Gm-Gg: ASbGncv5GlakOhD9FrmOTDHD/kAkkNf7dXFntLO1VLny0xnR922UlAQGtPs5/9zPdo8
	lta7+53nmchy0+nFg6GHmdrDkVeGByR7qLTdZKvjxWB7obP+dPG9odnrdW0ITOhc2EkYTs5mhjh
	OlQCTdv7QkwR9n5CuQyl907Lz6ezhBEvatcAgTI+hmY13d5a0sHYpiKc6mKt4uS/QonH0w8X/N6
	SyKgVJ7bu6zk/SyF8wQEZPMgzQax1o83FbfkAAdRFiYjNRtxxQm2RUV4ihCuzoozIou3IvkHKO3
	d9Uzqc81j6Xj5pwQrpB61bJedGU3jOkiCxEChhhAUKY/QxqQ4SrSNL/nJefMC2Ma5y0=
X-Received: by 2002:a05:620a:40cf:b0:7c7:a574:c0ac with SMTP id af79cd13be357-7cd010d4ea3mr193943685a.3.1746796667400;
        Fri, 09 May 2025 06:17:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+qsfdtZ6DmZdlZShEv27vJFf9u9wNMnx8fyO0XHAbQLPHn8efyDQhYxt7i9+0FpxG4WsvJA==
X-Received: by 2002:a05:620a:40cf:b0:7c7:a574:c0ac with SMTP id af79cd13be357-7cd010d4ea3mr193940885a.3.1746796666870;
        Fri, 09 May 2025 06:17:46 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cbe4c83sm1414304a12.8.2025.05.09.06.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 06:17:46 -0700 (PDT)
Message-ID: <5f5e512c-ae0e-43aa-856f-06820ac4b147@oss.qualcomm.com>
Date: Fri, 9 May 2025 15:17:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 13/14] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
To: Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-13-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7E9yU-cygZxBqVypP7aFkXJCNTfXA2uqdvU84mi9T51Xg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7E9yU-cygZxBqVypP7aFkXJCNTfXA2uqdvU84mi9T51Xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEzMCBTYWx0ZWRfX+EJNIOW6sd7m
 axzHN/KslT2Jytp3ttp3aJh8jpzeXXrks4DtME30fP0UWkbxqH5s4kde2U/yf0+mh4nhOivRHom
 Tsl1QvYE1GWduKf6ttVbj+H5jEnvOLn+GSELs0ZLjYf2yAkpygzt5NFf2Z8W3UEjbzBoDeXjU/1
 3EGS1wH9JdJ4r4i6HRzwBrwbyd/knayP2kUyiBSfHn8pXAb/9k8pWwFCsQiY1ErA2cLViKirCKN
 rbCgo7X9Fs0RF4eOUI/k8C6U6M4PfDBNXL8KXpT86xqStLkPdVMW05Ervmf1NWcPNEu7a5G7gjw
 hMSEJ1JxkWTKWSHBJijWc8+D1BbEwW0x/tWkFoI/U1DCm0FWf4IhPkbBQjns5kykRUNUDBPRCVf
 KpPSqvliO6rMUofhT22d/SwIkU16o/r50DjlnssWZUaVzdUFMLIRYkl+L2rFpBQ88KYGvRa5
X-Proofpoint-GUID: rNi1clQF0eReMbX4XS3TnPzaTaMghArz
X-Proofpoint-ORIG-GUID: rNi1clQF0eReMbX4XS3TnPzaTaMghArz
X-Authority-Analysis: v=2.4 cv=W4o4VQWk c=1 sm=1 tr=0 ts=681e007c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Olu6NZbg64VfH8RIhVIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=902 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090130

On 5/8/25 9:26 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> On A663 (SA8775P) the value matches exactly.
>>
>> On A610, the value matches on SM6115, but is different on SM6125. That
>> turns out not to be a problem, as the bits that differ aren't even
>> interpreted.
> 
> This is definitely going to break userspace, because the kernel
> doesn't expose the UBWC version, instead exposing just the swizzle and
> userspace expects that it sets the right value for older UBWC versions
> before it became configurable (0x7 for UBWC 1.0 and 0x6 for 2.0-3.0).
> It looks like the data for SM6125 is just wrong.

Oh that's sad.. I'll drop this commit

Konrad
