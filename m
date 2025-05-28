Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65A421858A
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748430197; cv=none; b=DbN/r7Rz23/Pq/23rlXipVHpgrNAXXRIs2Be9TaQv614uug6UFxLaP+X3DIXSOodG4jnsDXCwY3WkOY9ulAxpFtdmRuFPKPIVEmGH4dRX9o+qm6NBL3itFZecOY6dtvWsYQ08OVPWTDgduSqaUwfU/AShiXyjJx/7QZkoOclNHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748430197; c=relaxed/simple;
	bh=/RJIvErotRj3to0d6kOm5wmObFlOfph76zWlBJ4Q9Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttGN43QcUucmFM9URQXtnWtSTect81joGlu2QEmoaiX8mXIkoRaQsjRJfkCrYqc8kaodLbAj236swC0XJEoveP8lzUp5Z1/zcDS56wM+ZEYRUPJ0jufOkMJ38E599B/O9P/sq5zzuK0/V7T0FhQ8i+KnKWz335qU30BNngnspK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p3umwhj/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p3umwhj/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S78Bip001576
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ELgwTpMyunvmM7oXC9JYUZ5V
	y2pFyIIsfyTDjxB9GAY=; b=p3umwhj/5BExpQj33huf2Oh+q3NmW1Ns5ZP8BmwF
	cPOg7fHjAtrFgcPC+UAIlxGuN007wmXrmOpbd/IN6OPq+GA+t7B/hveMWLYmyKkF
	DAYwI9iG6APAwESFbdskCqOSu48HEIwfld/+JdIrQBK3QXqQE8gJi0q31DXR3RVO
	GtSrEGfoQA51ic/+QL+/xMbvVuEuRGW3ohflgv6JmO4An4cgKO99ql0aNd0LnmD+
	C7MoQN5TkP304S0idmf+4INg+3jaAxW06ftV1dvgLyDmzt4ki6GvXY3sEKZaFWPy
	Gt1q9YUO4XCyJxJbPE3/seQq/KvvUmsbxu3b7568WzGWDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkurqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:03:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f3b94827so682134385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748430193; x=1749034993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELgwTpMyunvmM7oXC9JYUZ5Vy2pFyIIsfyTDjxB9GAY=;
        b=ZruH7K+Kp9yoKYzvHo+B76deNlYyyJxNft9jgSYyej6ALoq8PsKJB+IUSfumiqiha8
         ClBC5sLWOawbHuA0PGxK8wAuEn1ytGsP5dUJuQN44Pr2LB2uVhuK5S51FqJlueTkvUYM
         L74qvVuf7A6PC2rZPJ0OQEpJQzHFUcBGVM9ndX24YMvWuI2yENY8HQRxl+FyQrkaS/EA
         gizD7f0k2gy92lqs4ARsTMYduS3QHQgFGABjplBQPqFpAneQxX2zDsW20fiZWKkOiaBd
         i64PSqUn3jKQ0dUZAeL7xS4/V9L49GusuDq4mRABqH3JAgB3amkCD/6NCQIn9lzz3uJu
         t2Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXmGHS+qE1z0kx0xPxcGjU6MeDh9pg4noCnjDucWai5Tt24I8tf5C9F+9y+K3/ZioyMWmlVRoTwPqM2r6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJIIeukCMya4v2HAi4YlKd9bva63m+UsW3oGSbnRdW/jCFG+xh
	4NOgaC2c2ABopE5Zf9/hBWzTDXFFGDlCZYLwCkMTfF+aCTm7HH1tvCNzgkMH42BQkkALZ5yyiJt
	UIVTKYTJRkXrn9Qm1wmVbk6CZGTUXyrJ4lQhMvdhwQpmYwQMlE49bR5NeLSkjuV7Pdh0=
X-Gm-Gg: ASbGnct+zeNDbP9/EI5Hozg3hgkJZcglhx65hclnv0vr9vThmfhiB8gfTzK7VUfHuvq
	KwygRsSMxZXU47nHmPC+RrLi4Ss7FL+is7NyZT7DWyAcNN4i5JVKHXFl4Pp+yebozNzX5r0fT6u
	ewvw3XIRuVX7TsJ4SMELhYyDTukxJqsktMUeduwkc8pM2Cdp3dR0sBfNn0Yx1uM+NXHF2QapY1s
	3RvLD2RLBoLoMmh9bcMNvwsyS5tP3R3n3woSseXmW12gvndwMLfS5lxHTniPXEoJ0qhfScS6VQu
	B8buksKjzDRcLuO5u6LmPNuUGRwGDncrHt2W8Obvdy25tSu7h3kzPrP8ruE21Zvbn3CgFwxv61w
	=
X-Received: by 2002:a05:620a:372b:b0:7c5:5585:6c8b with SMTP id af79cd13be357-7cfd19dbd92mr228985085a.50.1748430193417;
        Wed, 28 May 2025 04:03:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGnv4Xt58Punjx8otwKBoHUwlys2VKyZhjUmL0mq9X43VaGyy/glqWWnkmJnsvnpqUXlWpEA==
X-Received: by 2002:a05:620a:372b:b0:7c5:5585:6c8b with SMTP id af79cd13be357-7cfd19dbd92mr228978885a.50.1748430192892;
        Wed, 28 May 2025 04:03:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79f69878sm1973641fa.89.2025.05.28.04.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 04:03:11 -0700 (PDT)
Date: Wed, 28 May 2025 14:03:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 1/3] soc: qcom: qcom_stats: Add support to read DDR
 statistic
Message-ID: <d4sb62vm3nfeqaipl4cw7wwbrg3b4xzqhtjkr26ephfmygnnub@aaqoyzfnw5y6>
References: <20250528-ddr_stats_-v4-0-b4b7dae072dc@oss.qualcomm.com>
 <20250528-ddr_stats_-v4-1-b4b7dae072dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528-ddr_stats_-v4-1-b4b7dae072dc@oss.qualcomm.com>
X-Proofpoint-GUID: MJgJU_4NoZ7TbhfAKFAyk2uV5Gw80X5D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA5NiBTYWx0ZWRfX66lqhepaL9ld
 uoudve75xMNNqsj7EMjSngHwXuTl+FYOJH2RFmx8fPry+DdLOm+suxjvX62Zb3rgCn7rrb3YKYi
 7j7Xaqef+R8uh+EeZY620tLbE7C4A+SdGpqnH9gkzhw4gs0HFRH9blRwzMF2EiVdDQIYGez0Xx8
 G4jLie5Fm2U7glF54kfnQFbhbIviWm5NBVFvf56DmFW85plGi0ldJQdaHYVaX7IUsPF8yqrH3Nn
 iOTmJbO/JEssMn9AF95jDRCxWt3/O78XE/1PxNJj0FUbHpO5PNR4kXmxoPNpNznpr6Lq+H677UN
 brM+R8XJN21SwiEAUwkTs643GGLR+N8snsSv9CkJJEYiCnAZOczNtbNBQIBBxIG+j+x5jZJCwTY
 yhzgm/8eAQ8binNdVPSxU22anOVlcHd8lkjvXnKCJsMTMOANnNskHhSXFQZEOPnjQNlhTQN/
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6836ed72 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=ahjRXFyu6kw89l6o8aEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: MJgJU_4NoZ7TbhfAKFAyk2uV5Gw80X5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=833 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280096

On Wed, May 28, 2025 at 02:51:31PM +0530, Maulik Shah wrote:
> DDR statistic provide different DDR LPM and DDR frequency statistic.
> Add support to read from MSGRAM and display via debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_stats.c | 99 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
