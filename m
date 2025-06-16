Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEF222F76C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750071137; cv=none; b=arlhuEhXHZGxJiOFEfVqotan1Stbv2A2qVANTnFD63ZgCQHWz3QZkRrlGTKh/IwvDS6CdL0bbRJZ4WZ0lh7eFNET9VxljwtzfQm7Ec3Uw2QDRDausVWZRgYl9weaCs5698SQfCDdPTkOpEcX/btNC+QkNhsJ0isQXYcVZDIAkSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750071137; c=relaxed/simple;
	bh=Xd5HQxch8DJ8T7mxwkyj8OYWsC/SVmBYJYSpYWhAnqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JO2Ox4ZaqwiSOosa05O0Atdnsqfjr3mIgb5aBJ/AqBoTOzlHArNTq1K0BOLWkNKOgY6QfiOQ8we4+mXMPOIDD4eIykxHwy/oQ+FV7fb5HFEz1Wa6raXuZC0cWQMbaMZ9yeE5RCzqaBh7y2QT9f8z/EkyFUNSJHMrxIwa03XzkJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqNOazR6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqNOazR6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8T02Z014411
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VUJEcgadRGVVdACDvLFJMjAg
	G3Ukslnrtn2VKYsQ5ic=; b=CqNOazR6EFXiLhiQXTxle3BZjNvSVwwrYcBO7n6J
	/V3alRKwFaJToxGdzCVZtH1dIhnevENrocahehzNH4Jp4P7y/EmCLjXxOFHAASbA
	WpFKmYF/XTXDh33wq26LSrU+vO01HjaomSPg9ITbVKqaYE1yNbZ/YV+uK59oYQj1
	oNdS0MBTV+f3Vh5VWB6eRYv+Fen/t6QkbD8CSpgEFkoK4VXnmEkQi066Q2bICyX8
	RaFDubkVFwfKwMp/3H+kvavxXbXp34rC+9ycm1VsYEF1yDOpnXYn+9tYh/DwHWTl
	tQvTsDbKLRv8YQG9V8zkVQAY+ZsJkgYswQtFBY74fo+CwA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crm5c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:52:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d38f565974so942593285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 03:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750071134; x=1750675934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUJEcgadRGVVdACDvLFJMjAgG3Ukslnrtn2VKYsQ5ic=;
        b=FA7h9NndlFAzYfC/UJjx96kypc6L2m1+4UA8s3J4a476BPsg7JR75j8Gu2IGgdeJKZ
         aQaAQClgFSsGnhBklyxmWrlcTKn1fm9156DJJCDc4WTLC46ww/VFu2NhWYlune16PRxv
         zxEfK6LYbsDOUaPQhX8FQFZqQYeBUiMj7Q9M1L2XREomVPZmjNVn3A/eDYiwEAN54Det
         dTw8SghvAbNp82mxWlz75G34WoXdfEg1uiIyZ1lCbuBpp+Jm0P3m6zzxXWSI+WPw4yX7
         LUhdlAYEsM4uKQKw9b7oZtg03DRmcVwX9miLSQhzXDAYH5Y3T3oraRD6UHF1+88ImJwO
         tqjA==
X-Forwarded-Encrypted: i=1; AJvYcCXA1aHu4SB2pShcguEBnyH/JDOfYsqri0PhNdvSox0G3VWWI3QrmGAI0EuJowX/JrcEqjdsyv1sE6ydj8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH+VXp2hDpGnHbjqCQRuCwUz5hUb9sWC1Q2V1rtjW1a34m7vXE
	135LnignY45rIK3+9z5ukO8CEo3rKb129V0Fvmx2LiKHmKIFcLUUpFp9cyjvtunj+ZetRoQs2jK
	glXlNnk2NX3ggaxbZ+BomZJf1qGJk6ah5xK/CDap/iqztZvhlsHVF9j2UeU6h992zPVhRW0PROq
	12hg==
X-Gm-Gg: ASbGncvp89tZinzSucrVQu0gu30Ww9mK5yol7K56i6MW6yQw85SraVBuGPfNihAlyCq
	PCQnmxCCGaG/6yYDijPv78w4wT0w3951yDwtrFUZLNn4TUkrV4jQIFxKxyC3j3L+/Sme7OCLnll
	OKa5tuoDnq2KdX3DI6Gh20edBoJBABvV4nH+OBopDgQDodPAJCyLUBAAe5o4W9XnqcbcAAFwcLB
	k67Pwx6wQvcY6DZH6KZu1ekqxWsVZYwq5RJMUA9wIdMbJnCa5rBKZPzieIgO/LyXJXI/wGXK0sg
	4Y1ehoqnAJEf5yvU/+kt9Sbmqw93jlGJOjcvz8Fa2T7D8Xli1maIX7zS2rAPt2gq9ANfFOaqTc0
	CKgUrrV4f+5rdCb7T8wTrpOHpod6KPWX5aWk=
X-Received: by 2002:a05:620a:319c:b0:7d3:89c7:684d with SMTP id af79cd13be357-7d3c68548b7mr1118616685a.20.1750071133740;
        Mon, 16 Jun 2025 03:52:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEepDi1ZYDSTtYKF0mLtAVvx1xpIfGtgjgZd2J70oP7izfYqJxqwXkDfhP4ZfXaSTlD+UbJKw==
X-Received: by 2002:a05:620a:319c:b0:7d3:89c7:684d with SMTP id af79cd13be357-7d3c68548b7mr1118613585a.20.1750071133304;
        Mon, 16 Jun 2025 03:52:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1ab3e7sm1517482e87.111.2025.06.16.03.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 03:52:12 -0700 (PDT)
Date: Mon, 16 Jun 2025 13:52:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: qmp-combo: Add missing PLL (VCO)
 configuration on SM8750
Message-ID: <azx5zo4rbhw434vyyunpjswtjfyr5notjd7glm2hvg3yertvzq@wcbrrmhstvlc>
References: <20250616062541.7167-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616062541.7167-2-krzysztof.kozlowski@linaro.org>
X-Proofpoint-ORIG-GUID: pYsspvtYX0d5iV7t1Wa0XfbpoZzMSyMQ
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=684ff75e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=v-rge3Vw8ZcHLs8CdegA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pYsspvtYX0d5iV7t1Wa0XfbpoZzMSyMQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA2NyBTYWx0ZWRfXzcG/uhLxeeBz
 cG7xYwxEQFWWriQzj2MwGPgKYVXWWkWR48nKi6HLSWcQTF3B1Dr9OuSLO/mgDfGZw3PXVcDygPa
 UM3jgfNLVGLV72YUyfmTLuInrWjDbEyedpTPhMvLlgQ18Wmgjrj/znQmaaQi/f2xkOlIcIDmygS
 ddshLgmGbgrkvY9ZGIK375Lf/5ZozVhLyQcjNPOQbctXNCzfLSG5XUE4sncnBnDPZZPKOg5gg2j
 6gGDNQEffazK7dWTInKRqF41nShrXqLRjrVZR97v9RKnzuCIhn7ZDe3jVFGx5R/OMSw4wXalq2r
 af7kljSoMk5m74SpKxQjRXitAp57h/I+5HLbU+fFjMQ+aYdgF1YmCRj//mSN+YhGhX7o696Lipj
 DehambKEz5Ie1umNpvj4euBd1Rr34XcNwa11nRwn3aPYtLd69biqdiE7nefdUP01M1pFe9vY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160067

On Mon, Jun 16, 2025 at 08:25:42AM +0200, Krzysztof Kozlowski wrote:
> Add missing DP PHY status and VCO clock configuration registers to fix
> configuring the VCO rate on SM8750.  Without proper VCO rate setting, it
> works on after-reset half of rate which is not enough for DP over USB to
> work as seen on logs:
> 
>   [drm:msm_dp_ctrl_link_train_1_2] *ERROR* max v_level reached
>   [drm:msm_dp_ctrl_link_train_1_2] *ERROR* link training #1 on phy 0 failed. ret=-11
> 
> Fixes: c4364048baf4 ("phy: qcom: qmp-combo: Add new PHY sequences for SM8750")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
