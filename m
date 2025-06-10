Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397011A3148
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593770; cv=none; b=FnxKKBE+LBzL6u2qeHUQZHR/V0nqjnqL/bsW4y9dDKW97fs940KntwUHzyWI2ikfSE4Ht5MW0Hop/+gh8XlXgUTHt84gKoB5GaoaMpHd+TMi2OgKI25xdPzUUr5ufh+lW8p/lvop5NpuY88s4xHzoFC+latN0zrJofwG7vGMxSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593770; c=relaxed/simple;
	bh=AdckpzHORZ04nz52khFJp8hY694kPNdQO93ZPbWS0Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jgVbIKf/axHEhqRHDahz4n3LpJ5M3eZXF87gyxzoKX0sSplX9tMV2m3DgWjs4Ith/UGBrqaL4gnSXcxEk1M2UpoirLJwiomgATpqk72q/HkfW7uuha7xKManouW439n5lS727ylN1YkGpX9ubAjwVaYf/WTAaa5XnGiHdhvP2hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOLrrqEK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOLrrqEK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPuod027438
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9pZN1HLKcnKZHer+eXfm+cc/
	DOSG+5TIvmhgIGDFcyE=; b=mOLrrqEK003d+TjbzN+MMJvU0R/CMQ3T+77usO0T
	p/2wQJsNA7kaxxfjlZGNU9A9muJ4KQfEEtlTsPKg3YA1HbnamQNXVaaguG72LL3B
	4VqroCwDQEUxDOHGdmNWwv/ww5iPkhAZecz4pTyEwBEFFn7JFnAf79ID/gN8fnlD
	D04bFikUpEdcKGrdNaJdYKTa639fEjQ09fFffsbIZ+nKZY9VY0scX6UtoSdN3ffP
	6vCEMsjHA4BfxOyzn8jgwwVbqFajm3XKptDvdbIOCM17H2EFNy8knTJRjGL4pO2p
	OhrsUtT2I0JOyaPQkU0cGjsV23WPxIl7CoyYeaKH1gvbQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mcknpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:16:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f876bfe0so1063063985a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593767; x=1750198567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pZN1HLKcnKZHer+eXfm+cc/DOSG+5TIvmhgIGDFcyE=;
        b=SmVGVtoR+2JZPJWF2I0pO3K8xkMjT80LCGHUOLo8egAb/KwvWe8IFZU2WE2wnqorpy
         sMR9OxMvXLEOPvmEhc+X9FUehNnt4BAoHom+F279lIuve3icVNVLbF7ngnxF1U74oQ4W
         gLfkGWCTybXFjowd7oKxyZKj0fAjmeW+xzDlh+E91DD7eaKmA4mxltVKvUeKtN+33NO/
         4Mb0qbZ1VfokH5KIczB5vlT8MMAUJZ7xbSHReyVdv/PSPyS3jkJTQVJDGP7Igb6I/2Ct
         4QB8Mr65PZXgTBDb2QlpqpZh38GDej47RKc61hf48Dsf46f6dr6s+DEBiS9qZzZZFTvw
         Q3cw==
X-Forwarded-Encrypted: i=1; AJvYcCXjztExqMiA1XJZdnvj0Vc154s6c5PQBv/8VDyngSfLVkR7j67qeUi6kn8mz9YfsqybG1mNwix+o0r70EU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrf2sj7qi8P89nOq5xpCqa02ZMs7vPkjo7n7FnhDUxi2cqZAmK
	vqUvSpGC2+b3nDf5rmhbt7uTJSsNLAEr+u/ULO7lJQ8vAfqy8bqo1ke2dOQPsJMItBX0UD4GZrh
	l9qiAi4F0EEfE5L1QdRvvvjuJSg6IXBfPhEJ7J08KQ/pj6tLylOpfrqOi6PoHpHa0jJ4=
X-Gm-Gg: ASbGncscjrdysR0tHTM/WDrVO3QCg+tgZtm192eOKtjedALXG6gZxV86hwxIHzZs6s6
	N/+oDLOJyslwMNeUn32LzPF4nC2r9gR/J6DfI1V5SyGXb63zTQ14JTR1qexZSsCnJxL2/p5WYJw
	EadrkdtN226+suUVFc9bt1Fk44oldBs0IpxLzgpOm9yREuq2O/J9RtbkubJI9g4lB1w9rMGmKba
	8SnYtUpWMbOi/MxoZr+hXMBqz1VgWjyEe5ZpgN6S1zqY2bsSXqEfZ6z1CyKdWQAaG8DQDM6djzc
	GBzLbXw8lIuwYZV2bzS5Neqs+gp+UiDddketmLdzYN2/ZuoDgmpDskoVQ4ENFEMceutMDr7hNV1
	1tgoWtYPUfFB0/jgT1468iAxO+L6DA3OdZ7Y=
X-Received: by 2002:a05:620a:440f:b0:7ce:ba1d:400a with SMTP id af79cd13be357-7d3a88e40bcmr167393685a.30.1749593767229;
        Tue, 10 Jun 2025 15:16:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/M0hvJvyIKxc0xXO1KKdRvRgsx+vq+O0zU4EI6ADE1ohAPsKxZG+F+D2prd/gjcYfYouQdA==
X-Received: by 2002:a05:620a:440f:b0:7ce:ba1d:400a with SMTP id af79cd13be357-7d3a88e40bcmr167391185a.30.1749593766930;
        Tue, 10 Jun 2025 15:16:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d765esm1718734e87.85.2025.06.10.15.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:16:04 -0700 (PDT)
Date: Wed, 11 Jun 2025 01:16:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Widjaja <kevin.widjaja21@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] ARM: dts: qcom: msm8974-sony-xperia-rhine: Enable
 USB charging
Message-ID: <kgbfmd6ql75nw37eocsdhoj2mrvibdhnv5hixxakv75uycgujc@6umcwrjo2d5o>
References: <20250610-togari-v2-0-10e7b53b87c1@lucaweiss.eu>
 <20250610-togari-v2-1-10e7b53b87c1@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-togari-v2-1-10e7b53b87c1@lucaweiss.eu>
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=6848aea8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=UvBUG8sCUGYd-mWNjhcA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: vdMiYRj41GpgvZCPOq7rP8enKP-uuPcY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE4MyBTYWx0ZWRfX5xjUoP2RckLA
 yJ8z4Zcn2/hAiII2zZyCz4tXV3LRsz2OG6oR5hjWY6B5KDAw9pZwmIFT0wZpnS9YMBScNtLceaE
 GHcp7D4soqJ61YgxRg199FrLVIkLK3rqKslBLcPUqqgYtWJ+7h+L9mOVWYye7/y9UTJ2XxVZZKV
 HTkaOL2IOn7Ko/j03HUze3KAMY6kgoQgRzxW1eUTo3/XL6Aucg51BNeUfAzYkXip7SJP+MWtdRZ
 BAgpVGS1JR1mUDOXLOocbGPDV8k5NLO9xEoSMDLwXx4yzdE7zEOmk3wwx6HJCSBZ+ucVhgBR8TL
 3ozG9QhRvb1Ew0cu08D4o0TYDSpWXf54MeJlOq/nqWZe94dKKph5ZQvS5ktixUSaLH8BtVm30Fs
 BLiqhUYSLfKjl2CGscfBRRixUxn9m+ywhj9QEFO7cz291Rb9+RC1wGRe3fT1L7toEprqHxkW
X-Proofpoint-GUID: vdMiYRj41GpgvZCPOq7rP8enKP-uuPcY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=620 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100183

On Tue, Jun 10, 2025 at 08:34:52PM +0200, Luca Weiss wrote:
> From: Kevin Widjaja <kevin.widjaja21@gmail.com>
> 
> Set usb-charge-current-limit to enable charging over USB for all
> sony-rhine devices.
> 
> Signed-off-by: Kevin Widjaja <kevin.widjaja21@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
