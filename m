Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2897A1B6556
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236561; cv=none; b=d6cNxjgFR/Ll0s1u1tF3hMeC44marbnXJnnBfPqnBpApz9m32Wd40IF56/JVpn54bYgSj32WMOOq9sE+w73QDbthaSzH4TEcT+P6JweWypS4RvE3nfn0O1Uj0HI7fV43FZxaKYgqc65ZPKW26JwEhgyjMJNSQRNHbTllyfkIjC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236561; c=relaxed/simple;
	bh=B38HNpBTKqQ0yjLO+CP8uG90979PDm8VB9963MAwEfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=suFgQ0rLuiP45B/kzSkCclbL463B9agIqoH3AsoFmWyFwAnFQG0bxcgN+dfxbpptAODjJ2FVxs/2LdMRAa6/HNSLO8ehBwpW1jAd8GVywX0rIP0Wr0px8jwacv3FrBtNBw/xS0Pt0r5K7OBUbNqABwfLMcVrqG9T67L1jzHPoyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cObmxX+q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cObmxX+q"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAunNe013144
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nNhh7tTrtVppZOM44aoAsiuIMid4rGaB2UXO4+XqS44=; b=cObmxX+qdKmoqnIf
	/P5Fz2EOvQc307k51BOfKNbJqQRFr8In46r+li2xDOwM++FM8ldWhn2gttYUzXbG
	Ao4tS3BT1G5hW8Xze9wQT0L2k7vxCCeEB/45IdwlWeGRUJCGa0c+OrXtsVAy8QtI
	H+f72fFpWjjqUxhdRIQMQoD/pUD9GczksELu7ZiObXJCHUybDon8DQhi/Pt88KCN
	bM7jwDQp7EqJV7hVFJtLgs5TXgjbVoF07ZsffoX8+/4RbMLkPGz+HuDy/b5K+656
	09vG6Ul71ENjWpFrqWdUnb2KaSzWaOusrzhiGzElUCCrrMeH0QpO8H4Kn7a6qRvf
	erzDSg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmk6pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:29:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5841ae28eso178157985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747236558; x=1747841358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNhh7tTrtVppZOM44aoAsiuIMid4rGaB2UXO4+XqS44=;
        b=UtXWHIrEbAe2yqPtqbs/Rgj4g5JZaXgik8KqxQbMY2c36AzlyGTWaDmgyvzDndLg0v
         MQsS1nHqdW6mcFPX49NwoZE0MA7FBxv7KpS5cDqtYsAFsKiGBTmxUP9zN2mpILuamcw1
         NMH6/XZfzyX4HWrsQN1U1IStvP25UGSH15ItRrVEZiyo1bzlnanW6hlNxiWTDd7pIrgV
         GYnbNb6/w63tIb19Ztg9JFyTtGyBxoFRiIxT3YrViAlLqs9iW2wrTX7HO8BZ7CMHgu++
         htzmnTOjtczXYsze6YZz7gO+SWXVE91GQpC79sDZ0CCFwe+qvMkKhKoWv/vdKD3skAvJ
         zyfA==
X-Forwarded-Encrypted: i=1; AJvYcCVQNlTzpx/XWhzTscSjXs+MQFGtNAr/BT/3ehuAP8IY2/VtpxgcKwt4UkZPZcm+al9jZhqzLo4CZ7ql3zc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw22vLS4PnYnMr67naaRNCXMo/6w4XTZpOkHHDsBgUuXm3ywjZY
	IL0FS1uRYw+uXMLj6syH4XYGxN9I1ECgQacZRksMGRONM3N+7Y/UCjXXlqW3XjdUx6lAjwkn/Sy
	hYHloQqYbefnnkP0jbExUuvCuj1p5C2uGu0H+4BftM1YkbQf0FOKpu9YJ47Y0IOg=
X-Gm-Gg: ASbGncsOCSjxCFI/vCYN8PC2K67HW5QZzffkrNTzhrCFIH/YYmrsyxaSbtQKP5lxbez
	iw37KT1C3hGlGd/GA0/brAdNHCTjnZsIR2J8b7ilh685MaOWLw78NSCxsUJGPJ7cjF1oCd/24/4
	jFeEdRjRfoYgpXFvXWrZr+vX2quO/KSx2A4GZUK4fXikh0FvKN8lIPul8TR++ZLVWUXgubJ/zHL
	J5Cs/kUbMx7LpKAHUHxNzM/09f8ZK1UjK2VNNWaemiEV8NII/eVGSR7NRjyy2RcQ+fLChXdZ7BH
	x4YIWda7O71QkGwq+/6lWXa1NLctWW3e2VZPEIP5Y9pbkJNiSHwmeMjp/tAPPsqtpw==
X-Received: by 2002:a05:620a:8391:b0:7c5:75ad:5c3a with SMTP id af79cd13be357-7cd287fddf3mr234613085a.8.1747236557702;
        Wed, 14 May 2025 08:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESSnbZfR1OlTiIaVYJwWyGGbrD8XQ6bq4lkNbvhbCIEFOfDySQCqDpAoZMS7HgH50fPKy8fQ==
X-Received: by 2002:a05:620a:8391:b0:7c5:75ad:5c3a with SMTP id af79cd13be357-7cd287fddf3mr234610685a.8.1747236557345;
        Wed, 14 May 2025 08:29:17 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad505564d46sm72730266b.121.2025.05.14.08.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 08:29:16 -0700 (PDT)
Message-ID: <0e1e112e-e9ff-4d02-9779-6e1bfaea6195@oss.qualcomm.com>
Date: Wed, 14 May 2025 17:29:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 01/15] soc: qcom: Add UBWC config provider
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-1-09ecbc0a05ce@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250514-topic-ubwc_central-v2-1-09ecbc0a05ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEzOCBTYWx0ZWRfX2druGh9eDQCe
 HiOHzObSm1JJ1GGvgqCVaAB0lYIgu9TAsnXLu5QwJNRvtj/FMaeu+yadkhswNU4cYA4tNHztkZj
 4bGagDNiTJiZxQStGmJbt/tnErtp9Y4wpj+IvpZQE1cn1A56Iu+A4U+P4lEIrpFpM9TIZQnGtsi
 pB+9g2qp9rO27nORSF4rEL0UOeob4h0qY+a9FQuCbtLPzQcG3hYu+CDh1kZ0TstGTY0cHk6YchK
 JM0gfcXV6gGl27NqG3mdNu0NBJ8xXgroa1/HALsQP9dNR+Nt64h2vo/vg73XtiAjwh4KAWZwHU/
 ViTP469DzeTXv6slT48LBefXtGWILf16k5A0Or0JpRHN3akX+NisqsBCN4713Wg03gI6vbFYaYq
 qlC+SgBzyyDRfTND6GR+qFbky5uTvrk9b+YXQKz8j3mwiM049JWqedGOMRLI+piuRstsfp+1
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=6824b6cf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=TDUkdBfym2ZfKPuXuAoA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: aY7nlLQtjknhNaLDeSJMwP_WP6PISuQM
X-Proofpoint-ORIG-GUID: aY7nlLQtjknhNaLDeSJMwP_WP6PISuQM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140138

On 5/14/25 5:10 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add a file that will serve as a single source of truth for UBWC
> configuration data for various multimedia blocks.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

> +static const struct qcom_ubwc_cfg_data sar2130p_data = {

So I failed to add a user for this below.. 

---
{ .compatible = "qcom,sar2130p", .data = &sar2130p_data },
---

Konrad
