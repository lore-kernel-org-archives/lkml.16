Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118E2205E26
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 23:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751239834; cv=none; b=IPoRw69lPXCAxDntEqp/4FpU4EbmZFt6WFfbOV/+ySRdJMv1Y3s4alDitMoOB7UXzF8J7MMt3M2tjP0zf/ORAv9P19RTZVDG+TPMLC6UCyJwjD24oDCw2+2rVLBBS/NkZq3mcmyNxoANfyjfJTEuNE7xDrsSjGNeH/AHZyoWRNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751239834; c=relaxed/simple;
	bh=3AFvXCR+bLX+Z8GgWNplffmabN7kiO9ZobmutwiK+bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFX0UdQ+lM2XdltWzvMVOrpYubWgidSmrS+7VWI2cmLED7ZM0om7EmQIBTaeV1faKST0pp40aPfeiYn66WtbHzz2cuoX+CprwdzcoVBWlq7Uws1Lkvteu4ZxXx0L8kefY7XJ+3NT1u64euFfgHfSn9Ogl7kUxFXkxnTrVE2uqlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCgiDsJT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCgiDsJT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAsCG8012874
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 23:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S2DTLYpxIRhT/nA6PB8/tp+3
	viSuwHeW5OhO23oo2lE=; b=eCgiDsJTEoNxBfqEo08mj8Z3xu+cN5h7tBDr2b7N
	GAfLLdTEIrwoWEOKSVxRyKmaPPg6Bg5wYMdLdMBnLqwlCNdUylL4WXTclVvRASzT
	HBT2ej0w30v3OjB7K5ETY4cdib2qw25vC4doGeC27MTV6rVRS5EZX7VDyM1XySHY
	Y1TDFEtG3Eob/cTpW9A5XE77tVf2RlxZQuW88rT7GWS+ewc6JUltl2quo4vDayea
	HM5bd/VegdC64DyKAtuAVZ2h9HnluhKHULQ2e1GxfcgxAlAHIKS9xvwcQ4koxuE1
	q7bFkZwk0u/0V0peYimRBLpjOH9nC/82j640OWh6Zhxc/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcjryw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 23:30:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d45e0dbee2so32867885a.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 16:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751239831; x=1751844631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2DTLYpxIRhT/nA6PB8/tp+3viSuwHeW5OhO23oo2lE=;
        b=n9a8ZmZe0A0zbBSPOIl86tvIxy+BMrN9a8xuV6OCRE0ZPDjKnC+goSXPyBsYfwVcMq
         WNO31VrFo5IzTAdG+nh+tXelh/yVrLovrv6DshyGQoUY1udtm1DaYu5cgeDgQuLCqMJU
         R0ZRYJZxx9kq1nFsAPMFs5GZ9Gzkztj6m2tKfLc7ncFvol5HsStSacK4LYutWwhln9cd
         q1PFtg4WZBS9SYqO/KE+KmCRg3m3+E2YuXg7EPCaElY2UlT4jqZ2YK4AgNx/N38vL7Z9
         c/Pk/hdFBfczMXMnKCRayirQ1Yf2zR1Icp5hvYXvOzuQNeTxLd2nrbiuI5nSuh09Uvhe
         oGiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfTLnxR//KHKu7i0DvAC5zXSwLubRZ6ALYN4gAocxCJ5mFde1djbg8YAa0SWV4cywuVNQaEmTvrTDhwyU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsiibiyi3tYYwaRmvPf0v2bea6Yjs6X/7ip3IjOGOra0s7bL54
	KaFv0g+W47K+JiyoQl8x7wvhU+SV3xji8XPi51WsG+n8wVTrnvhHZ2ZTwfzzFRm35cPi7+8qgMw
	qXJrIIVUW5i6ylKWu9ju4Ukz1OPTWUryGjWnT5BkE3WOzjzTS4Aqfdl907hmdBHsVO4g=
X-Gm-Gg: ASbGncuUzO2qIGWHSdPvFNb2+jdSiOELCOMIcmy5ubY2R/TbxuEf/cZ9jqiORyI4ynn
	QRjoMyEYabyOmlRALMK76OvFijDaVGBpEucW7oIVqwFCJxtMFjsBVcjx4SSe2upuOjPZxZcmV5/
	XQHHqCEH+PUOkYmdNo1ZHI3yaIWKTimsoltQ2fGpLp0fseZepdNBQF02LbWVBol35bYiyDVp8w1
	5YcUk6aE4Co3fZi+BTyQK9WmfSMzL4O7iqlrdlumuCLbQvIo0OYyDMzqR7QWwP6/UF65UwB8wrJ
	vlhGRt5Pp/Cl1lu7MoskPZv3Vk3YSMi607Ul0ifyk18HN2OMUAlaXyLZlls8FQdmTQ0OIU07J5U
	uBQJmXPhHzPSzf8aFH89vFaTSmqggUWMioAQ=
X-Received: by 2002:a05:620a:1d04:b0:7d3:c501:63da with SMTP id af79cd13be357-7d443985d4dmr1744006385a.48.1751239830840;
        Sun, 29 Jun 2025 16:30:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsLLpB2ln2NTNuxE8oAZN1AOX2vanByzGZqG9Al2zbL1LihsHxYQPgaiL9CfBNyLjW9EH3XA==
X-Received: by 2002:a05:620a:1d04:b0:7d3:c501:63da with SMTP id af79cd13be357-7d443985d4dmr1744003285a.48.1751239830424;
        Sun, 29 Jun 2025 16:30:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2407b4sm1245026e87.23.2025.06.29.16.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 16:30:29 -0700 (PDT)
Date: Mon, 30 Jun 2025 02:30:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/2] pmdomain: qcom: rpmhpd: Add SM7635 power domains
Message-ID: <strdf7m7tjnktyzwcm3iq4bkhabzibxopeal77cnetga2yp5wy@amwkv63uoogv>
References: <20250625-sm7635-rpmhpd-v1-0-92d3cb32dd7e@fairphone.com>
 <20250625-sm7635-rpmhpd-v1-2-92d3cb32dd7e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-rpmhpd-v1-2-92d3cb32dd7e@fairphone.com>
X-Proofpoint-GUID: QYxitRhcSPULK4AYpC_5GYUa2J_0Kr0a
X-Proofpoint-ORIG-GUID: QYxitRhcSPULK4AYpC_5GYUa2J_0Kr0a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE5OSBTYWx0ZWRfX+sHaFoFRwI3j
 asf8PqT4vTC2W1qN1z60Sd8K7MH56e8jGGwTKiwLQhjbvhCzhYH4kWF1X3o/YBDo5QXHu5n/JsJ
 Tjnc43LhBR/pSqZJt+Mmms4nja/vDao+Ybrod/mnZiRCQOUmnPhSXdoP1elqU1gJDI2KNkRhqqu
 rzDmyd1Dzc9OAdzX6qqWsOaqpR+WevSiUJXj++DnmjE/Ie3tgmVNta9s1g22YpmKc2a+6YttVla
 fh9cyrXnvevX55NT+uReiK7EnSa0r+cg1NePkNBXDsFW1a5bf5s6p938TeRIml6C3vng048y8U9
 tLj+o59DxUqUnx8I2vXgyRHyjFRFZFalSZhdDm8k2cG4bPxDjCDYKHn6YQ7ICG/FjI8y4GkA1s1
 Avowr9dymkk+3SO9wYMK2Atw3oWsCoavGAlQloEWVsY8ReP82CFLDEbE7wfwGtjSpXHywVtE
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=6861cc98 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=3owI59sVmJdHpXqbcb4A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=935 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290199

On Wed, Jun 25, 2025 at 11:13:24AM +0200, Luca Weiss wrote:
> Add the power domains exposed by RPMH in the Qualcomm SM7635 platform.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
If there are no renamings involved:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
