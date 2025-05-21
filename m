Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D802E264A95
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832451; cv=none; b=YW4vT1Lmqrqhc7ZoVcEu8SPkJcj+kS+QR69lx7GA/71V1xaieLFqmptaZZdTwdtQOUCZCsAzJ9APyZNsxUMW9+ZPzaRlHQtdghguwRCoS6EZyq6R2eE+2IXPxyS+uj63KFWxJh3ZArXPfgnaIXhhcNkjSvcM5BuSq/lf9vYaQJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832451; c=relaxed/simple;
	bh=lYzq7FnKukIi50yWRCJdbpDI7oekzUVqld5ufIZMPro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnnAO85tBMT69PEDj2CO7Y25a5oxwITW9NCgSauOOszWKSSrLmdFRAbnZYEH9aoygCvpM1UUXnf23fh2Le2j7bYOj67etw7T6SHfDPht6nwRkmyMd3nQDGL0eJv1BRbH8tmWIhWrzNPqw4ZWuLd4Kw9HFX+KXtsUiDpu9awoeIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bxWJOdko; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bxWJOdko"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9Xmig016872
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yns8J8yDIbLcf0BsCQyO2F82
	y37jhFFOk2oNKiqIfAc=; b=bxWJOdkoC1gAaaHmK+d9NwpVqkp4DDu7jdw+LyEq
	lWXmq49tw8TF9IZsk2bS5abm8AClZa5zbNH9H82tOOC0deLKxyg+zhKvHeNDaIGs
	sWLhW4XIBCv/KcnoHt4OP2wt3ltV8cmHoxFyPqhrJJLv8hlPJ7lVEz0vst/y8uA0
	wV9JiZ2hWxyY2XjFPxEG1bSCNiGhpA1GAfXCI9OFp+FhyWBPwo4ciI5O9nwTcT6h
	1zQmqTwq/oIvGAzhm7iaH0WihntDXhYbznHKZLyBee3+yhXrRFhDJPOHAPqf1nrM
	38ZCUhrSe3vAV4uEnAeUAZMVUh+977njzitVyOlX9cGNHg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9u0vb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:00:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so112152436d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832447; x=1748437247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yns8J8yDIbLcf0BsCQyO2F82y37jhFFOk2oNKiqIfAc=;
        b=AvAi0Q0iZEG4PNvMdGIiMJQe2KF5MIUcienh4UYaS7TTBBYq2iqXyomMVsQkc3eutR
         9sXw194WfTriX8UIS+5gB7BeFc84ydjU5+4KQg312Ymnu6cJWbshJOIQ0mo+O+usK8v1
         Tg7HMihJ5qf7lxEcy0jirJcEJkNfbe5VIMRs+DEKef7FdF8xhPidy3IGfwfgw3XT6p2O
         YOPpiW17PM9bFQqB4QnwxcS78HhoVnIy20wV0IrvjkAlL8jGSEVYtrjxmKEum0H9yQSp
         VjV3syBsH88/gzw4I3T46snP7tBTtPnJqgVpgG9rbaifFi8I6DTJ0XWhK7wPpbAQzADK
         NFUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH0iB7yUxeQY+7lA9bgiQ8qGtlzofxOL/BoQt0by1WJE6yLJaTcRWZUREz0M9IULt2g8AjYLXXtgdUfGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCh/gDQtE0EDi76yvg7WGgpO2Gb2dxviocdMLyIKjaNrpqGVPN
	gYKLI6nI4MnzoW5W93wzEM5piuAjLK3+/7y9TMe/wSjEaO2pVkHCGGfcdwChHl1ogdE0mzNTFCf
	20USF4zjYOSOd1ZaCk4h6+RT0+Yd/TFYnUrpwOdvte9q8d+Ioonz9mzDtfJw+8GJxBq9r6nC/62
	k2WA==
X-Gm-Gg: ASbGnct1f3FBt3ZhTyIk8pySyS/nnvXyPtbuusQQ2ffG3zymfuXlSgiO8PAaaF0eChk
	pD0r9jrUdHToJamVAlLybu9XSLK60hHGNehByyE/eOCwTjsE3jIDHiha79OnO67+lzrz4yq6ARM
	QBChDZAzQpucNjCFLaTpXl+GwyCkuKMAucgfBi7N1HzBGC1LJt3bdK9sen4zPRKoMEWiqLzIjEo
	tTzwRh9a1BpIBf67asX5mZFzswF/0zYrBaJkKH4b+MMlK/GvZJPA0+4WbZ1fRMT8wTQ7e7QIPc+
	fLPGyo37t4U+5p70DqrSDSejDoDV1771RRrog/uMkTS3mKU+YVM79Fq37268t7+OX3nClh6uEwY
	=
X-Received: by 2002:ad4:5cca:0:b0:6e8:f940:50af with SMTP id 6a1803df08f44-6f8b08f3c7amr305253146d6.44.1747832441422;
        Wed, 21 May 2025 06:00:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYl5pptmjhlEarjw0/xJJoxQp/LNVGwVPm9hkPN2JKLgqOynQ02b10fOufgyOCowuR//KNMQ==
X-Received: by 2002:a05:620a:390e:b0:7cd:1f0f:f61d with SMTP id af79cd13be357-7cd467aada1mr3619274285a.54.1747832427545;
        Wed, 21 May 2025 06:00:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550ed3e3b84sm2577007e87.192.2025.05.21.06.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:00:26 -0700 (PDT)
Date: Wed, 21 May 2025 16:00:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, bryan.odonoghue@linaro.org,
        todor.too@gmail.com, rfoss@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs615: Enable camss for
 qcs615-adp-air
Message-ID: <6mlnju3b5ecynlmlsmqot2i2y5fkeg7zl7nbzklmq3gcbp24dy@74sht2d4w2uo>
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
 <748f96f7-d690-4823-845f-67642db97a06@linaro.org>
 <dabed183-6907-4483-8c79-616aafaf2851@quicinc.com>
 <76052af9-96c2-46d6-85c6-65998c389554@linaro.org>
 <9babbddc-5c45-4ef4-8fbc-0da64ce99a42@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9babbddc-5c45-4ef4-8fbc-0da64ce99a42@kernel.org>
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682dce80 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=gFR2S-RVxxBBcq25oecA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 7Bro0FpAKZLV2NvyAZQsbOCrSsv4Y-lE
X-Proofpoint-GUID: 7Bro0FpAKZLV2NvyAZQsbOCrSsv4Y-lE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyNiBTYWx0ZWRfXyB8ljPU4Q1Pq
 F+4Vk+HXj2XT9g3fSyuXbYGu4nDjYpGE9WfsA7bwKdyUpyJU2Af38dAN5GappJM1n8U22lSZ0Ho
 BueY9LX6zUp/JDfQDy7N3C6cX1b9ZxA1e8xFvZqEWDN3AGiGV4maSxkGxvr8k0nw8AIiQw/x3b9
 2/FmuWQOZM0yeXoxS36i3MKeAKnTeaT+6jZQ43vYa/HgL6dvaIp0LrjWpuRlPw1G+9YpOwNgp3A
 HbPtveBPrfqBRXZfrTFum91OBSUNXL84KRWYn8quLm18neke1qUgL1sIfAv6W7fWC1UFBN1ZCLH
 LmniSv7MdkFyOjRiUPxkNmzV2samdVHdaqZfOnmyPuGIstxfZhu9xIpOOR8HwuHuCfFErgQxQ7z
 2bdkOd/AEtqTyh3s2V05pPM2CBAmMOhla0ysnn3NzJoM1ABaSvaJ2drmOQvBfVjEt1KDCI98
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=767 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210126

On Wed, May 21, 2025 at 08:04:10AM +0200, Krzysztof Kozlowski wrote:
> On 21/05/2025 07:52, Vladimir Zapolskiy wrote:
> >> We can perform validation through the CSID TPG(Test Pattern Generator),
> >> so I enabled CAMSS.
> >>
> > 
> > Since this is just a test of CAMSS without any sensors/CSIPHY, then
> > 
> > 1. camss-csiphy-3ph-1-0.c changes from the series have never been tested
> >     and added as dead code, it shall be removed from the series,
> > 2. adding voltage regulators to the board dts is void and shall be removed.
> > 
> > Not to substitute but in addition to the above it's still doubtful, if just
> > a hardware/driver test configuration deserves to be added into the dts.
> No, it does not deserve to be added. It's useless code in upstream. They
> just want to push whatever they had downstream and drop their patch count.

I doubt that they had camss downstream.

-- 
With best wishes
Dmitry
