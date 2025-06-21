Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308C226A0AB
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750532904; cv=none; b=R3cZ5wmsLDPUZ9AU8vjkmEIa58amuB+f2II9ZE/RqstjRMlNc0+SbC4RU2bn0LSVwU7U2QK5zCM9TJgCeBu1ohKXqxYmL5g/LwpAeCBEg5bw8j06wYAY+IncUQptU7vd8QSJTZnXF8l9HukLoVdcmj+Sy8Q1fnSxjmCpsJY/Qhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750532904; c=relaxed/simple;
	bh=zQ4h/2CUrdyVRUmQfOnPCsgvBxmz0Y5FpfeZM6wC5HY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kHBUzxPIMUNGfep9Ous//XLK0AS21Ddc5Yy65XlfkhLFmSUXLgeLT1hR5UrdLYeWhOgIge2zz6NMT4Bf1p4cxD27UD8dZJ6+a2LdwO9fTKQVEaUBe6Lse1cvTIE9YB6QXJir2BWTQ0UNPqogSbncMS1WDWFBB38jj9VKPmrg52A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFkJt8BA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFkJt8BA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LItVW9005424
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9s7v/LrcaoIdV8Tbqub5MaDn8owWZKJzdHit4BdNhz0=; b=oFkJt8BAiuuUjci7
	xHONVfFwTZfGkZ3lv+jjQKwDvYNmN210KKxA1HEMfreMM9wuykyuaWtmfgJ8Mk60
	HmTN1Y0MX9kyIRIhISRXIswkE/3/pm/TmR3Wceoz8J6ytE4fFCL5Hklfj6ifdOSq
	FL5+EEJn0PdJPXLCYWg4j9mFnNKOUIgtY/0Mks4oCJ8rRmGrOr2Bitd3cPc9hDam
	VkLwugYK3AohhgJDtpVs0k9Lyjcx/JDnMCaYbMMse9uJmxNCG/ApeASjv24MUYZA
	2H3SpPSzrvaAZL7j3NR0O/Tm2eIs2I81ddJLRoj2zZKtgUXb/0AbxckXliLBpuge
	uj/1Mg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47e1qgr20u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:08:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a6f59d5ac6so6232131cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 12:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750532901; x=1751137701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9s7v/LrcaoIdV8Tbqub5MaDn8owWZKJzdHit4BdNhz0=;
        b=UyAyrIK2HmiKrjHDjEgWLOlMirBI7RiCPMANUhKcZqzoKcTtlrPnJfFy3kFdDnxNGb
         EO3pzE8PAPHzvqrhlkwV18x1cKshyPkkvQ36LS6mqIvzzG/+19JL6+TOHSAkWRnUpR1L
         TwrK/Oy9s9p8H5yScbxegZnbQ9euu3XwAEzZW3aVjjVtd8Mz6KXQddX/ls5UZ8uGAsQm
         WGFuo4OPt8BIcpd0wP8VPL4HWC1qNdOqVu/mDlJXLgp5tIIti4EbCVbUJsO3QpoMmv2V
         K3+VQgF61/8i9LdMf7PQJ9epq/RfRCWDlV7rBQ9g9PqVXzMv15fiyC65xawbOhyA410k
         KEBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTNuDhdvKX5mejL49EYQ6lHlRVzcGvy8KohLmuJajHTC+DrFbo3K7cBMXv2CImqOXHjMgH5x2gul2uB7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNdhx2K7VAqU//1wSg/9QgBOJuCMmOccuR4KxDkNdewS/KwUZB
	O3MbXBde8bH/nmnYeoymbAeiXuxI7LwasBhhXzorqkgt1DodUQrucKEJqD8ZO5c4uoPGDovnRiC
	YxdA2STey6bHbK4kQ2h3TD1dsKP/jRa0AJwJwKoUzDF6RoBee9iguLewnXTti205fVze5CskeId
	w=
X-Gm-Gg: ASbGnctpZv7X/2sOmXPZsuarTiiMPi0hYrt0QQxWBqt7vXCV9OWEGFsk5sU0eNjMsii
	MF8AG+qOc8Su6U6wKaJ1Col/OjHYmiO9z+EjDhVcBNmqjRip+8UzHGsZkLpMjo90waV5VLZK/tL
	17xL+gtaYu1Uj0/1EpO3JSb+78TDW4PEFA8CjaPb055jZ9jOXoxF1l/wnC3P0imnp9ctQzwfZLt
	Z8pjqNyouwFo26yKw5T4yyC7WeDOJviyhsiJiw5ll/nnpwuQJ/GFtRVIWxBENZEF/oxV/6cLt3X
	2upahr5fspSjr99FTFDB7uANVKKYBPrWmrqE6/z1FQTzsOcJv4MRRlMXERioxPAGS/jy1QGR6A2
	PlOo=
X-Received: by 2002:a05:620a:608a:b0:7d0:aafe:dd6 with SMTP id af79cd13be357-7d3f98b45efmr425049785a.1.1750532901106;
        Sat, 21 Jun 2025 12:08:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1X0z6K87eoLcHUl7ueBVsPuL3jHZlly7fdeELxmtw/OkNiKa7Lq3QXyKe4d205IAWvseYuQ==
X-Received: by 2002:a05:620a:608a:b0:7d0:aafe:dd6 with SMTP id af79cd13be357-7d3f98b45efmr425046985a.1.1750532900689;
        Sat, 21 Jun 2025 12:08:20 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cc09b5sm3538337a12.61.2025.06.21.12.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 12:08:20 -0700 (PDT)
Message-ID: <8583223b-0318-4857-85eb-8e464ae6711c@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:08:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: rename DisplayPort labels
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250621-sdm845-dp-rename-v1-1-6f7f13443b43@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250621-sdm845-dp-rename-v1-1-6f7f13443b43@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Fqv5NMoqaIUHXfS6_BcJW05Lh3BQCKFD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDEyMSBTYWx0ZWRfX1lSiGPMyQNiK
 ZQ196y+kmpQ+k8qQQTwP3p4ZxwmJyXHmY8YWCXqLNVGmn/FwlqC7sn5X6Dv7KyyVsiqA0aDlg5E
 drjyQTqUcXeVsuhszcJgdnRpei9O2r1LI8Snxm6EbZ0mWek8Aqv6rpXoZxG/4ceJ7SWgrU3HqFD
 GDnX7xsRPOgNiOGpQGfYqytBSoHEGm3L0gb19oPlY1lHKf7NzOI4jCRh2xRLtaK4DS91BuIqeLq
 MT27YiwALDkTHMZGnKYs1yiLNYMXqB8XMolqk1FAzAjEXVPUwAizYKhrL6b+Ypt9WyjLmqYSiaL
 1hR1N3TXFDMaCgDwH7JM4c5cYkYQPXwMOO8rGN2aEMF1s8jEL3Ey9Dc/7WzOdteL0eZAClbm5lW
 0EEF0j88ahNEclCd2B9j13lBknGxTioG5T1hFvfuV7vy7IAM52xOvdUIUDg93LF58Dl8aomn
X-Authority-Analysis: v=2.4 cv=UetRSLSN c=1 sm=1 tr=0 ts=68570326 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=2zXEEYr95b8OIz_QTQwA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Fqv5NMoqaIUHXfS6_BcJW05Lh3BQCKFD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=745 spamscore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210121

On 6/21/25 8:20 PM, Dmitry Baryshkov wrote:
> Rename DP labels to have mdss_ prefix, so that corresponding device
> nodes are grouped together.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
