Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2509D7E110
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815141; cv=none; b=HnpuUy/iNdukTxRyoWdrI1yBpbEzNSs/Bb6Ovl+GRaDqNzmT55hTD+eHWQ5FotOA9rWG1wzBqldekvSHWeyY8tdX1NlwVhd0et8QV0am+9Ic1/MAFejlQqPxxIVnT4WRkmF3PjI8tXjvRpfdKL+MldlD4F63CnrNeeQFBx9MVOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815141; c=relaxed/simple;
	bh=KWLqCb9MMCaNjOfYMU+358ah6KhC4kqVvCHp2nDpQjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L4QLuLIx1bf6cqcaGrybZK7ffgm547d7TwNyHst8NJW87HObCQqjFLdyudw1nrVpTcTBZQtTA9j62dA7mOvzoy7EOWXwdJdEV6WQqeGC75gC/jd9MJkyfiZ95Ppgu457S/fBqoRSB7+tXzdQtSbEXAavZ8O3khTC0KNdCVVxiG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mF9LfbGD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mF9LfbGD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mB99003388
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4eXLekD7nIt9cu4Q3k7mAjKbk2MkbDMCeLet6DrgZGA=; b=mF9LfbGDRAudEF4+
	2etGITAkPk5cYASo9RoNiRFp+tF3IB44E6plOLZB8a+8hKDnQbSzJ8G8EjYgZ5ff
	eXblU9sMShi6WkEE46Iyu+Z68VHn3cyL8QJ5lm7E4Z1kxgpjW0o0uy7jezs+Xk96
	uWsLj6MaEdOxHnNukvZX4m2GVKqlTzCxqM5qXgLsdLaoV9kTzB54nVvYGr2Y+veo
	FIVI3566yGQSMYyK0iZMxr29/DL9d9xcy1ToLqWdZOxbzzAaWvHlZ2F5YwXvsj0X
	In5yQjec8ONXOM+NECNRe4ijY59HqLprCOH7rSRmle/EYoBVm3dayQjA5nxDMW8R
	dA45zw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rv93hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:52:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5ad42d6bcso143102085a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744815137; x=1745419937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4eXLekD7nIt9cu4Q3k7mAjKbk2MkbDMCeLet6DrgZGA=;
        b=m+GFNe7Tp/fW+HvZRnDd+RsbiQ9Cc78pTOdVEVsotu2TytVnOI/h/kYriEha5KbMbh
         Tqd1qAQ2ncjrXi7sa+8njFzDo94tSTWCeQTRDqo598EoSxzrLZgnMvo+/9J+uZaRAwIO
         ItqoURnow5tUhrc84X57h4X4TiQjA3NwJjzOAx3EC1e2wrpXIMVA/+vnR3wn4VuNuLf4
         lINq4wcg+gM1bIxMw1tnbPHgKIfgjBT5gn+gUy/ONP2VlXNYGZjAtKxd/6d8XvX+tbfl
         SNswlKNoYxr+N4M1jr0/M5W6Ejhv1ZkHnkng6lX+fNt3VTeK3FJXwxCfhi6mn4qkuA4F
         ec/w==
X-Forwarded-Encrypted: i=1; AJvYcCVPjAwhtDfZzH46wkl//YTph761Tm5L0gFn9oklnJgvyinXDbHNhjYYrqy7p0br9C5TtiVL1mIbVdgI5V8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMfp1tvfK9gAppbQnkWlgrc0VIpIXCf6TEusE3UDgXoQ/xQsyi
	M02brNzcZgCXG7oDhiQQ+DmGuMlOHK9kTEwktSAkFZXJnee+A0xXFE7coya8UI8pUyXGoOTaihl
	KM8Z8XJkrgha+bXqPsEvISgUxPkdoXoolenuXVid+6SrfKWMZx73lzx2+6g1RH7c=
X-Gm-Gg: ASbGncvHuoHS3uLxCqHOMg11ei3ucu+fBy83+6xIBJAv0IdfOiA5/HpXGyJSPMlYFhA
	/v7DgXeyhGxCljf1J8eye8SK6qkZFkEpSznyzIaXyq26NFSBgagVoT/uaqoUlqEr10Q38CYFiYZ
	CM94CL1tiktQkFsSNOTHwEUtZUN74QkKy4KlUIb3KCVG8JPMX2A5n7LrcZslpbdA2ueLV38Uuxv
	JW772c+4RvvTZh/X1p9nCBggxsL4HqLwhb3LiUeN4W+5lc0HRtz1G4eEkJp6HI78+j5RqARxbUW
	WLKWArYqmlMa/saaC6jAjh9gnk7HuFwgX2qMBUXRIZJNUYR245dYAKnDzdCpXx/oYt4=
X-Received: by 2002:a05:620a:2706:b0:7c7:9d87:9e2 with SMTP id af79cd13be357-7c919061cf6mr98641385a.12.1744815136551;
        Wed, 16 Apr 2025 07:52:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ6Qw/xZedYgX9uVB2FjDWt0hQK95/ZLeo+Xo+Gzu93v8ZobxUVcWEwyW9p71lE1sPHvlb8Q==
X-Received: by 2002:a05:620a:2706:b0:7c7:9d87:9e2 with SMTP id af79cd13be357-7c919061cf6mr98639685a.12.1744815136153;
        Wed, 16 Apr 2025 07:52:16 -0700 (PDT)
Received: from [192.168.65.178] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f45bc75b4fsm3875259a12.18.2025.04.16.07.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 07:52:15 -0700 (PDT)
Message-ID: <4410c711-fa56-4cba-87b8-3a561a0fbab2@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 16:52:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: ipq5424: Add the IMEM node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
 <20250416-wdt_reset_reason-v2-2-c65bba312914@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250416-wdt_reset_reason-v2-2-c65bba312914@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hbDvK4k28oN72f7cSQcJwk6F5MZw1Rc6
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=67ffc422 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=owAxAYLDMf__z6yt7SIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: hbDvK4k28oN72f7cSQcJwk6F5MZw1Rc6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=708
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160122

On 4/16/25 10:29 AM, Kathiravan Thirumoorthy wrote:
> Add the IMEM node to the device tree to extract debugging information
> like system restart reason, which is populated via IMEM. Define the
> IMEM region to enable this functionality.
> 
> As described, overall IMEM region is 112KB but only initial 4KB is
> accessible by all masters in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
