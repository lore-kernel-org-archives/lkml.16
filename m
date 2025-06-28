Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DF8D517
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751125774; cv=none; b=QIVYB6oEPg74MkSxFlM4gL7YgCBEJJ5eytSx/d3spIOO8owquZnZMW/a6hMMvunqT3gk97D1OzC1K/p7Dnyr9zM05gq9yMhTc5Em9+E3733+RTFp6YcTYqvNo3zEmaIqJMP4Apf9QVAwCiXdoeqY6JGL8kbQatSRze2M2i3Le/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751125774; c=relaxed/simple;
	bh=WL6yGFxdYVn/A2aBxBxpKdgI+CtpIum5MIW6TKC+oDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bzmtc8dt/kwaeELjraDlqfGbe/8XUx+ine0Xkplz1KfzsGkrWxdxJ/7Y7pOS154l4g7MeQITMhhKMwE4yQ8B74n5lu68dLeOyhDkyjCo8IOWlDaZG0U4X0LSeWriwfyheRP2yML1U4bxS5FZJH+pguKj3uuQtYxBWpwF0JcyVLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZPdaOyUd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZPdaOyUd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SAXbc9003290
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 15:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bFYlRX1M4QgR0o+DfBbhVTZP
	AQPHZI02U/IaC0TWvGY=; b=ZPdaOyUd2qIF8lQKby/XWSDokyByHPqdM0n0twUH
	XlhP4QTe2E4bT5GjNFLGrTTBBY7VB6OxnYiYlmdzsIifZFFRYNf+DwX29A2nMxcV
	Ema+j6ppDZmXOoOZX5GLUoDIHcJmwx5S7ccvraD2X+0dCc1J8m+VQCD4O8KyGN8w
	uYWB87tbdOnrcs9nr1X74HrIhAuFzMnsIpFgGC1kYkhHJVcjHFOhUAxBF6CCOEI/
	BfkvG2P7dgrXMKVIjkEvItiFBAeYy6mcl13kp2ret9L8EKvZgJ2Fk4N10Y7yJ72X
	/ZFiePikev+RfwL+5INtyRSCkc1IEbX8/Y3smBIuciVEpQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq11xa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 15:49:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3e90c3a81so77501685a.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 08:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751125771; x=1751730571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFYlRX1M4QgR0o+DfBbhVTZPAQPHZI02U/IaC0TWvGY=;
        b=CBiaURYOL3bPLtbF2Nb9sOyAiqP48rla2gsJIWGGhSZQOOcQGxLJXoZ/WF1z0UO2Ua
         wzkggqL1OBfRDxplq5Li01Cuw+kaOKVStqF6QZjWn5hD4x3s7BGnqiXbCcrVIX/v2nx6
         gukBL0QwPqrfJqL0lDXKBX6jS4NBul/RnpRQg1TaJV47hUOSGJkXxwPygtvyAA4o9Gv8
         /Kj1u41o4xMnybVAGtSYnJes6gdtt5SSdLDUCJ8FZEc1x1swao99woUChwEbPVvin2rw
         Dr00mEhKJUCa5GYUFuu4Iq+DK+TqwpuHfavnBKBkOQe/iAoeSPJdjpkn++3611ne98CX
         HQeA==
X-Forwarded-Encrypted: i=1; AJvYcCX7uEjYjugUIQ9SOxGvgCS2bUo3EQtUOouPtS0QK06KGsAIiC5x4CZkmfqtsW8kfzavpI7Nh88+rMRsdvI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2iQmYFO5wwSALLFn25nsju/qqYPxIbh56XGS/Iejk24UCI3V+
	1mncfx24bQ0WHDfUSX5B4MmvDxytbfWZTEnhHL1c68uUqjcBnONodpHrGp7CIeAhbfisymLpWdu
	ihrpIAlWW/4i7hOdRGbLS5em/0BeKjazp2hc6zgdiGP4muTpFlFcc5U4YUs0MqIwdnSg=
X-Gm-Gg: ASbGnctEJ51z7mdfBJ29Lq6GzGUXIbQvaTDMQm5VlOMoCv3bCuutFhBljOWYpcR201f
	FoE0hQ9gQrO9XXdAmw/lcn+NFistrPKzrAnA8PUOgtXaRqUf1Qz64pUnNMVbEW7X7Ccs+zmJ5zy
	auU5G/IOLlVoNiBrBqh/wSB90nyg20GgeYONwklMZhWuRBjZjhS/C6HrTOAf1qSNkq3ILD5S/NC
	oIb28TeVtd9/ZeHgF6kghAc8sPsTdn5K2yFKVPL/SZSQJms6pfAzv07Wh15ZALueYFW1wokto8M
	KvMNVwGppYgSV81GrBHp4jvURlgBWsvu4EtJiS+y3CEvg13lpvS7SZ90E/wLcl6BKZNMI66qpSa
	IbI3Q9rIo/VHRhI/hGoL50QiWP6uRsMparnk=
X-Received: by 2002:a05:620a:4403:b0:7d0:9ed4:d269 with SMTP id af79cd13be357-7d44397de4emr1022353985a.2.1751125770920;
        Sat, 28 Jun 2025 08:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTc1GHFIXHHTe6OywkmfcHC6MJabIV0A+xXqmDPIh6fhNsR5dR6VvXgAtiOkV5DRj7Dqn9VA==
X-Received: by 2002:a05:620a:4403:b0:7d0:9ed4:d269 with SMTP id af79cd13be357-7d44397de4emr1022351085a.2.1751125770470;
        Sat, 28 Jun 2025 08:49:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2dcbaasm838063e87.224.2025.06.28.08.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 08:49:28 -0700 (PDT)
Date: Sat, 28 Jun 2025 18:49:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/3] soc: qcom: socinfo: Add SoC IDs for SM7635 family
Message-ID: <woo5nauppiy2i4xe4ewbsapuk6ixdn2davyrlmugwcqagjgdke@akj2ehtetlmh>
References: <20250625-sm7635-socinfo-v1-0-be09d5c697b8@fairphone.com>
 <20250625-sm7635-socinfo-v1-2-be09d5c697b8@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-socinfo-v1-2-be09d5c697b8@fairphone.com>
X-Proofpoint-ORIG-GUID: 4drPhBq4_ed9HFhfNkPVNiElR9_Fm1xb
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=68600f0b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=CBhOcW6rsiGSrLAFeggA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 4drPhBq4_ed9HFhfNkPVNiElR9_Fm1xb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDEzMiBTYWx0ZWRfX1ovr6MKg/XWu
 5QZgR6YVSoJiicHqkfcKr2Wya66NEfmcNd1pBaWzwAPkpI7jaTKgyDQ4dHT5BPpcH0R9m2qEe8H
 P95BK4i2pB2y0gab6pdZpAWtdtOnTlwn2C8F5yKfM1ZyYSL5Tx1QttxhlkLaZvKIDJLe6/xVEn+
 FGmHWYv8jpp+H0hQJMKw3w2QtQe9qV+Gt+pZqZu40FL5nPw5vXP3W8pd1JwjfxbniuajcPfVJvq
 isSk2mkz48UUj0MH/XLKH1OzHSAErmwmrVX0yrUrm6GhdjQ+kdv+S9E+vuHE3ZrIDsspvImj4fo
 7ENxmoSMe71l3mZ3Nqep7amRAxZdwuCyBgNrtuwHSfIXz9BBZfiYPo4x3HfkRleC7F9GsMSR+4E
 nKmHmGNe406vyLe6yUaVTVEWIRl//95O+z7CrWPxB8aa4d0ZiLdSXpL+ivUWZvY/e5JNdKqL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=919 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280132

On Wed, Jun 25, 2025 at 11:11:45AM +0200, Luca Weiss wrote:
> Add the entries for the 'volcano' family, namely SM7635, SM6650,
> SM6650P, QCM6690 and QCS6690.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/soc/qcom/socinfo.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
