Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF63218AAB
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607006; cv=none; b=MtaZFC0wqw2jjSCDOsHYzdftWzxJaHaZ+yK4lvovr6AMdjDrccCQ3FZn45Yfjmx81X+IrMmu6LIoppdNdJcfmTc6DtHPaY6vNmr9JwGnxN/6BmE3IxQc7TXSCq/WZIhKkfhCyRPq++e+gClu0YN/rgM1gNlxwckjKRSuaSKuv0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607006; c=relaxed/simple;
	bh=XoX+wEa5HhC3hR5v5Q5gpL5U4kgU7elVA8+JOzu30iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=golYBNEkXil93539XYTM97d6zMJa+bfz2eGBfWzedrr2HDYWOd8wRZfyAm4e1PhHqAAVxXymLRdjlIW7/k2P3j/9cBR1WSkBw93AT0xBRkoN6efAJKd4Zud+EaBfUx2OkU58mTf/yLkK3bQX6oqb6QfV9/L9oRpcIwPKyvDE3mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouUzIaty; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouUzIaty"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqDD031953
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5UZacNDBLmuE/Heewz5Xsv2C
	HRXYOHYVhtQqphnjYro=; b=ouUzIatypmp0mRtlrGmCYrQ8qyI9f6n75zu2bnPr
	khZraYBacLCAhE6QCJM0u74MEGkz0jO0Q7an2a0sbYb1DaP39NVU0ppg7FjUGx+J
	m5yOxqlhja3PzeQkM1cS/00MdWVZBLFE3M8Y4mXLRSVQB36c1alTfeUvFrsw9IX9
	Zv5+ndF7FNIyqJAcbzh6iH9iNFYDtB6a3BHlBeAHCneYUpGZp2i1yezrp61UlMFB
	w/0G5XLcAGMd1wh08/951vOSYDOZfK1poXmnMD+e/XVd5bWLEQLklqgfg3UIRPwL
	RVUmc2meY4NxYoHM9dnTf3vld6NBLKFljAqy60BIxEXwZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgya0j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:50:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2872e57so444426985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607002; x=1746211802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UZacNDBLmuE/Heewz5Xsv2CHRXYOHYVhtQqphnjYro=;
        b=cb4hnHGIO5cgGfYhlny5yGoqeVg3JANmMIZntr2e82UerpCHVX2tL+d9E9rC8aMf+R
         sI9sVqnUhjPhqeyZxqDETgQaWKyWFvz4uCcpGcSVL51eVsZgas/beH5ZQVBJt5e+rqdu
         4Y1Acyjxw+e7E/vO5koRLZbsaDBYzfnEBk02bNNddqh1IVBh/WRKKWxX6MjagUFWsydJ
         ll1L7dAD3OIF16Aa5nSLnL5neMbB2d7MA3cTkn+hLcHqCkr6wWPujzvXglUDqabr8liq
         c6FR+ey9cX5F2QWC28s6TzMQdAjBJ3cJZ8xY79t1pm7n+2VBvsgejgXHb9+p/YXUdTju
         a1OA==
X-Forwarded-Encrypted: i=1; AJvYcCWLMwmXjPjgh+qMn/a1BhWCMAvoku8vxsSlS/rnWvYbHf5Pd+1KNgOR9JFpliJD+oAKQgg1OV+P6TJYKVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrZKDl7vHJFAlwpBStgp0syAmWx+QpkWrubfKft6opP5wpxx7R
	zfYnpY7TKXOQ1ySxYJ4uO6QGOfPYkOwwasS58TCG2KrnE2Dbl7BI4TYkJjCDwD9WzuQQpcMEY10
	J2471WdD/aJ6bYO8R+oU5zfKbJZynEekis/3stQfkNPiy7kd7JlUNZ5+2WX8pE4k=
X-Gm-Gg: ASbGncslGv+HmD7vmHUvqvqj1wzYTxLiYJSW2hWd3qog/grZHmXt+PpoyCHKgspMGff
	XSs7fB29qGLUuIahzJJHOhsFhv55Xj0mPPz7w4n/EVkRwS+VCa9X1XOh/5uTCBq+W/Mp85XbJ/m
	UWwrIaXvB/jplIPjYeI6Xs0DNu7julQsX1Q5FOrY1B9FOhyXvYAUxJNfMxKrIYgBYiAOSJtQhGV
	6Yf81SYdZ4C69l0ThQUjrh3czrHldJdEhO84rz00CG/LuK64sYDH3ycjzg93sJI5nnefu91LDEm
	+lfdyQKp3nr1QVHw2X6L36Ywx1VhKfIgQz62iMebVPOkuMLkyNmXVk7gEfjIlPLTVcEDX/3l9J4
	=
X-Received: by 2002:a05:620a:1722:b0:7c5:a435:7867 with SMTP id af79cd13be357-7c96079406cmr478379485a.45.1745607002341;
        Fri, 25 Apr 2025 11:50:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKGFKhgTNVIChoyaUoWx/RSIrv5FxjCevn0K+xqfxGKoAvvW3lf0EQM4tiPmcCVL9Ey+Vj2A==
X-Received: by 2002:a05:620a:1722:b0:7c5:a435:7867 with SMTP id af79cd13be357-7c96079406cmr478376285a.45.1745607002037;
        Fri, 25 Apr 2025 11:50:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d0019716sm8540161fa.48.2025.04.25.11.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:50:01 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:49:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/11] arm64: dts: qcom: sc7280: Use q6asm defines for reg
Message-ID: <c6brmbdqfp4kr4unp2vici4klzocwnpawxdl2m6g3farzgdlvf@2w6kd43oa7sh>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-7-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-7-28308e2ce7d4@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzMyBTYWx0ZWRfX28Mq7ZcwlLbt 0+pr0IS6V2UjZ+dgbyLhXz662MWcGUQWupFssVzWBhKWRDEEoTIyvh5aJVqdm8guq5oX5HdFu8Y /vHWnWF75GarlP9dcxIyz3Zg4m/GwbKbeBrWLyiDzhDVfZYW568lJLAlt+Yzt6fQH9f/lnxB+lU
 6HcUPSLZ8pirb2qsi9KJaPoSGz66JJuZRfYgTs4yU7old/XDTXFNOEI8SnknyR3poxpsQe+1Cac 9C0tHcMMsOy9H8o7J6AOAsnGgfXZ4rLs/RzPc6uMhf/7wQlCjqlydAuVPo1Lj0T6tvif4bRWUZ3 ys6lXD5/woiyJZtd/aOyOlAlg6P+HGREIJNfZ1fVyTvrN5XwwjQkVnuW+utDWldL3KvyPZUn82i
 5+WcHMVISgm6jJJNonw/AeqrRGuloxEooXgp+77kba96omIP4QQJGSIasD5fNAhMuTKHc42Q
X-Proofpoint-GUID: 89HhGBR3zrAKTfaQgBcM9Uh0BuRTOEhh
X-Proofpoint-ORIG-GUID: 89HhGBR3zrAKTfaQgBcM9Uh0BuRTOEhh
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680bd95b cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=624 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250133

On Fri, Apr 25, 2025 at 01:53:46PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
