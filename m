Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F17A17A30A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 17:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751649691; cv=none; b=DhmefQnh/mpuVK2ZyOwmf5nxYkxIvtjUlBGAP4MD0sdBAjRBAvkdKfVc8Kvct0pZr2ZQwIxIG/W8SKK+W3Gt/f5lyn/7YokHO7H4r9DHht1EkP+I+LtlxU2zqOM9SnnoqMIQ5CqXUi0jpVjNZiv8ZjfeIG749qvMncF3BBb8WUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751649691; c=relaxed/simple;
	bh=Q0uBPIsCwgQkS2rC47v+2moqu0wd8x5l/Azb8wYoj4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVEbR5gwo7U5aT6nst8HCAeAMgUXVmHrrAUMyjOPtFDZY0IGKq6vhAyLGNUxXDeKHZkmHRijZUswf5rQ6/L3b+rfqp84Dv7V8yZzv9g3jEJpKsN3razklPPCt7BkFewxgwSdMfqoooAiHs3Oxms8sEOP4jDYxzfoeG82Ym9s8sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7ukLfzE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7ukLfzE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564EKLqE007218
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 17:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DYd1Y/aOqrQmhXBusd+shb/Z
	pX/EE96WqbgSK3mRMUQ=; b=H7ukLfzEoG0pXiV5Q1DEnsuRB4aJ+wt8FqnWDcJu
	huGLhlMNlWi8HWvbovEsWZDplRGs/MCp1gGcy+Ev5wqKwzQXtnmT5AKjGY7v42k/
	HT9T/udHQWYW649HtPaSKRKaaURhlaUUO3GfOMZQ4qEuwcurYPHM4z3Ts1+re746
	43mvxnXr4doxv/0z+m3JArYiBu6bt9a29SWWm3LICfAfEnJpiENt5fjMYCVi92G1
	M5T2KwKeBcY2tVRkgtFcUaBJGd61nYebtr9W/zHHHR9lSRnApOZuB8mtR7uh/5KE
	ATk0rq8KqkgzoNP9KsAqldhjwsPnB5MlskJkMD/f7dUIrA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5js4ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 17:21:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d15c975968so184966785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 10:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751649682; x=1752254482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYd1Y/aOqrQmhXBusd+shb/ZpX/EE96WqbgSK3mRMUQ=;
        b=cN8rlJUyZL4C3NpZ3PKzMKH9somyzK8AbpfdSD+NX12QK2eCu7vpsKUFY/1EleyW0K
         VHm/b3hEQVgCC2e0K2vGuTX7Gc2kxQaWzFbtqF7fstE8gIV/4OTiiZMWRulW8v+EvXTn
         6Hz4miCJODYV1x7fuuhs2pPOgPNt96gb7gqtIDWuFrelnQ/pqZfFKnNSIxxz3OMGa2jk
         kihPNQ3w3SHg1cktDte8hl6hBEdt9FLZuvOFWyR2iyNbYbVNRS7cSvdXfNRhU8tqlxXj
         Z1xYIVURTI8OCTKTLUeuUqK9PEWRdAc4gWnSyhpqegefio5+hM9sL2fXD6cD1drKkwpi
         RbnA==
X-Forwarded-Encrypted: i=1; AJvYcCWWojuEsCF8OlRO/g0JuKzWcf9Mqf5iIUl2/RcTyu6XYPVJRmhBi1PEnlrSois7wKOu3Qxuf2VJBJiJJIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYWjS6bwsGKQcIQKmXJuFqhGoVqsJki66YPn/A12h2VZOam0RY
	J/fXfiaB7QI6gjI0LT6THa8GCqkQ8H3M183DXKetKkUKBhoL5b5hbaGj+h1E32dkE6lI7bjzwBo
	XMimVG5E8tlgH1TWF0zgdMo+gDO+9xilb+AARaBNjigU/e5lp7J09OG9V0O5M4v/JAnE=
X-Gm-Gg: ASbGncsXHBMZW2KiLPwbp4BE8ICZBt32ECSy/cgn6+pnC01ZKWC3LQtgs7OvDZagTen
	i5ZR28vKvCaJok5b3UyczfZ8ezr4Gsh6YeezOUOiX+Ya0PtaBd+lVXwzewHlGabtCadcQsUC21o
	REIYXoh9oKFAn+8VXttPwzFyWp0ClCdTTqe31sh93p6Vws97JmXTE8FTp/UCt2WX6Itj8Bss0Cu
	AlIV4gCLCLtWrb9UdbFmXL4wKAYAT8gZTESyVmtbx42XtkEowQxvM2yoRDC83VIFClvXdxOAHTy
	HLR97NCoOIArku5Abbs3BF3ReDoEFKdhe+WxLzA2C+1EhXpKy6/gA1hNwv9aQtHFWIqC4qFYgp+
	Fbkfd/24WT8p6lgoXR6ZQui605Rt6lC5e1HY=
X-Received: by 2002:a05:620a:1aa1:b0:7d0:69ff:385a with SMTP id af79cd13be357-7d5df181d6cmr340761985a.58.1751649682235;
        Fri, 04 Jul 2025 10:21:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpSHb1K1F6j7rtF41U6JYdzqqPCY5hlVllAFAv6HMtb8MQE1920mSMFj6b/sYXv0mfka0yuw==
X-Received: by 2002:a05:620a:1aa1:b0:7d0:69ff:385a with SMTP id af79cd13be357-7d5df181d6cmr340757685a.58.1751649681648;
        Fri, 04 Jul 2025 10:21:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384952e9sm301641e87.103.2025.07.04.10.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 10:21:20 -0700 (PDT)
Date: Fri, 4 Jul 2025 20:21:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
Message-ID: <s5fknuvs6w2bgyr65y7ajiyfk2ph5un6vofcxpcz4js6wcybbl@ab5vz4frdigi>
References: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
 <20250702-qcs615-mm-v10-clock-controllers-v11-1-9c216e1615ab@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-qcs615-mm-v10-clock-controllers-v11-1-9c216e1615ab@quicinc.com>
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=68680d93 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=0A9y-nFg0dDz6qeF-BMA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5kNiqNyP-CcYEvWP7epIUasYyRAL9Pwc
X-Proofpoint-GUID: 5kNiqNyP-CcYEvWP7epIUasYyRAL9Pwc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEzMSBTYWx0ZWRfX/aQzAJcZ1X0u
 Dbl38AsTr8xCBwAw+LTTmn33Rbz4a9TrT4YFGjttn0pTw63T3cFZ+BDTMvGxXzmPvBtbUTDM9VQ
 80d3ujw+CWlx1pKdENbctQyAfl7+sG0KOImXugiR0ZICRFIUPAWpzpnJqNTT1a+B/GbVNDI3zxu
 aWP2urOlZ2oUCNHp5W8CaAiswuqbjjVSLHZM+hmQPDR7exl8sv20Nof8kfZw5bkVgnuh43lQe7Y
 6K+4znKxjRj7ABxxW/sFVtcEMi3qxvJgwmXs2K9Rup+1B8zBj65IEEQSgvPBo2LROLM3EDE+wL/
 c0QOZjgpZhHdyh+d63OtnEIWtO6nM5+WrdGwzLu8htaQrVzocw1HYA7iTEBwW7QAQvtlRB8SFNf
 8wGs7gj8db3UzuLa1xmKOZ2QukipUVN33Ndexo6qC1n0CXDxRnbmNhMHPXb1GnMbRhatqgvw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040131

On Wed, Jul 02, 2025 at 02:34:21PM +0530, Taniya Das wrote:
> The alpha PLLs which slew to a new frequency at runtime would require
> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
> which can support the slewing of the PLL to a new frequency.
> 
> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 192 +++++++++++++++++++++++++++++++++++----
>  drivers/clk/qcom/clk-alpha-pll.h |   1 +
>  2 files changed, 175 insertions(+), 18 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
