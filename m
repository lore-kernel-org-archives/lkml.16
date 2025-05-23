Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361B22F32
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989282; cv=none; b=hEwmkq25z6E5Cgr8qw6LFa819nTCZSFTtdnHelCAoL9B20olbn403yt/hKPaeSwxUaM/iVsLXU1Mimu3H5lVwZBfNFcX1hOd/psLtz3eW50QYfDrUDVYPFCKnk5I7DBz6nkkGAt1FSCDoNSoGNBgjb8sgSVNhcQ7WI3TjCjIfFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989282; c=relaxed/simple;
	bh=GkeVqE5xrNQ5PYvPUXgaz9WUDBXI2PXjIG49+cZiB40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nloOp9J4o9hQl9wRxcKMf3c1cT1iQvccVcn/5J8fEDY1fCmGsrDmvoxeDek88M+hLHJSMh859IsHg6JylvN0+NXJYhXmudODAP5/A+/RGyj9/fVr/JO0GwwFzQSKF7ktODoXfP8psXgRIndICCv+VDGlHcWly0ayhLKUliIpPtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXzNWuYk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXzNWuYk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N62KLN011346
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q/JqXQ3k+iOoGEfHZZbYkqqZ
	YyL4H7ssJb7anin1ELA=; b=QXzNWuYkmafUhN1ijaI2NJILqglBzcqgVsvu0UB/
	+pRISu0Bq1htJmQTTM/9MGpLvgSQyIz4QnaJrDqqt+1c36EM37L1TGXJjWUYJPsN
	BPYa4/MMwiRZRBkBejVc8Sq+tDA0WiXJhhbD86ucm7NKWeWgIS/pXi6LcU7X2OXe
	vStAFtIULrnVpxJDuTNHzKc6BHOXI0BlQUnv5/zDkErvooh3itimhTi/RAb00uAc
	wbZPzZ3nNPQ8AX2TyCc/uPBfmxoHTRAvAcYSlEEfv9JEtKFf21yySTzL7R129mQM
	IM/s3RT2dpTzyF2I+snfPDYF/OSy2xy3t/9UZ/vi1cfIcg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb979e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:34:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8c2ad9cf2so118145556d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747989279; x=1748594079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/JqXQ3k+iOoGEfHZZbYkqqZYyL4H7ssJb7anin1ELA=;
        b=nkZpVRZTiwqsm20GhddJpkBSjI3XeW3MvKp0weJoH3tcaJHSRoUlAiT16aM4E4952E
         1AZHWpp+N+MzXkTStLunqirjdv98vNaviH4BO490ELRALt/gPMV02edoXDQaxyJeKhQa
         1QdrFdSqnEdnEdNawXOjhiZ1rvEgoDuYWbDjuVLJtrRsA1tUtOQj04GVMCWHbVITGD6d
         uaST/3/w23JXBUQNVHfWBSfiGeI//REd/fG/xW9lD2TaeM1eCJ2/taj1y7fF54OVhTLJ
         Lh9FZuffi3XivtyjZZNHK31k9+S1qEZrVuqEfAjnMlXirWMY4CJXIVeRwkfFVXbfEjpl
         /wjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcwQzffqE38c5f+YWS87BYZK6/KI3Nes0CU00k3cSslThQY3rCbi3MG4IxLj7p5BMcLpuU93ht9eNcqlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrQgJYTawykkBYZYip07m6PLf7MPiKkk6tV5eZ5/kgsQAm2/d4
	UemU0D+usykVLc93oOvoexSCraTmwNnprmzluKKKhKRr6oHIc3TeZq10J+9Tri137yyu2LdjUZX
	o0lpXeYDU3JiFZqh4Xfg+1YSr44uJAn+bqxjb+p447pSCx0uQirSdYySgtG2wEOECCX5jjeC7ti
	4=
X-Gm-Gg: ASbGncv9G4lqd6fIvZqdRn0Gai4v6V8OPlmENw06L1xriTV25yN+qOHH+5ICT4PuOTe
	4SFy6FFgSMs+mp+Ah7VZ4ddOAC+hhrtNeVkmNUWQJcL/LJ1mOtC7u30W//0TLi25DgK5dmk6V4U
	uDYyobIjZZ+/Daqs9UglYWq4CXxejdVZEYyLRlMLOGDxBCI8tngw0vu86jTtZhztiLcsETIW+wR
	W5/SqrWBSHCkrov5isr55s7gk8NWcZ+fPFq13xSXtJDbXn4xf7Vb9t/uoR8dM9qiScpE4+i2EFt
	ECzCpqCG2nkxmLaNqC6cgo/iRsbooaVnRgDjkRiDORFF8shsQ0c8Ow3jbf1LGWm8wWw2qMEroJs
	=
X-Received: by 2002:a05:6214:2608:b0:6e8:f672:ace9 with SMTP id 6a1803df08f44-6f8b2d82abfmr463556226d6.29.1747989279152;
        Fri, 23 May 2025 01:34:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl+nirAQyfXpUmmHc6gc71gYjJiIDPdeKPVcxpTFySxgOFcYO8ObkMAa7+zHI/t6WGMQAbyQ==
X-Received: by 2002:a05:6214:2608:b0:6e8:f672:ace9 with SMTP id 6a1803df08f44-6f8b2d82abfmr463556096d6.29.1747989278821;
        Fri, 23 May 2025 01:34:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084c8c91sm36375031fa.25.2025.05.23.01.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:34:38 -0700 (PDT)
Date: Fri, 23 May 2025 11:34:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] soc: qcom: QMI encoding/decoding for big endian
Message-ID: <pwckzifghmpxgu7qto7jryjlovznpnkfysbq3aidxnl3wp2vve@q4zr3m2svsv6>
References: <20250522143530.3623809-1-alexander.wilhelm@westermo.com>
 <20250522143530.3623809-2-alexander.wilhelm@westermo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522143530.3623809-2-alexander.wilhelm@westermo.com>
X-Proofpoint-ORIG-GUID: -JeSVvfS9v6bNi0A-I7NR32CMLEJjF7h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA3NyBTYWx0ZWRfXyuyW1Hxl0Ctf
 mGWEN8qGUlh+VHsopNAM0WZOhveiXQ60d8DMGue9ceJu4hQ7N4RafVL1Pxlotdl6KhJ8oreJ59z
 wYpmIYOL3XlLGLkYeOPpxZWBMLr4Kaco/AIqyRBivMvh+icn8Y6Ka9cZ2x5FiBa2JZcoRx/0t5t
 xMioTWSgfie/zelvZaHfb/lBy2SQd8VDZFqhIBjxgyuMVAOlC0nqQ+J3htPDnKiJuMs2ca7J6iM
 Vcz4Tmr9lWBZvtGlBVR57IFZmRmQ2scDXe2gc2N+yMEK/5Lcufn8Eae7D4cZtiVt4nN0m/j/GM4
 hwYlvj5PiR+dG9Rk8Z3zd9uzTmupEVRcYcXUKvgFoY0dqQA5W5a/i3EHryS3Jtp5QdtkL7bxrwy
 zKMV9xeXG+m2UUhRn82+PiWVX5BYks8wXpVfAeTg4wAwzuGH5mxMYvuEZh+62c7wMGwZV9Iz
X-Proofpoint-GUID: -JeSVvfS9v6bNi0A-I7NR32CMLEJjF7h
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=68303320 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8 a=XW_CCpt8tLB4Xc_L39sA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230077

On Thu, May 22, 2025 at 04:35:29PM +0200, Alexander Wilhelm wrote:
> The QMI_DATA_LEN type may have different sizes. Taking the element's
> address of that type and interpret it as a smaller sized ones works fine
> for little endian platforms but not for big endian ones. Instead use
> temporary variables of smaller sized types and cast them correctly to
> support big endian platforms.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> ---
>  drivers/soc/qcom/qmi_encdec.c | 46 +++++++++++++++++++++++++++++------
>  1 file changed, 38 insertions(+), 8 deletions(-)


Fixes: 9b8a11e82615 ("soc: qcom: Introduce QMI encoder/decoder")


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
