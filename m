Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E351F150F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486454; cv=none; b=p5foOnTXN3MC9iqv5zFeehC7H08zcJXEdejjz/UZAK6LvNf06V8S68D2nCYSXHvOw5q6XlWxulmZKw0FRNCWhtyZfy8ejLb+A2esZ4yCQxeLEsa7/quyd9m6rauX8DuKXikV6WhhoiN3uzD/6WN32mVfzp2Xfc9MincS7qaclfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486454; c=relaxed/simple;
	bh=CF/aYD+Nsr3nocmtFfWpxD7GOTbvRFE+GGinm++Bd+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TXChJZlELwd+T1WT6PDP9FRJrWuFkNvXnRGZhzUZ0Oujz/d7lkr8JvJ3RquoJxUG1MaVM8SsYsoFDhSHNQM/s2u0//jMvCJo9QpNhfz4A46VPUONaRbk2xCKqLhRO5MWiUpLa7v0oBjs4RiM0o48OjjqJIh6N6TeB5tuooYzkJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIyaouIP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIyaouIP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F6Fu010222
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pDjRpH+J6CGnlh13kx8+R3WX
	Es3y+59jkGLHtd1EBuM=; b=eIyaouIPCacxeLfjR4f2BcE+tC5Uyc4i13ntg/T2
	3SLbX3AphGht1EkW9xna1jbWAYTl0Kh1+8q9Or5bsZIiy+LzKsb2dLfkN1WDxL4J
	dAYiXMLeWN0fEpyxIJC2946xzWKvSpWDg18VNPDDjCKK6367A3/Q85rKetPVGWhZ
	HWK3pfu3M/e6EOM7ACryW9dZxqpMBQ+kTbPewwJs0RM0OEY042dlGMvLRLFlT07d
	PxGwZbQrqB46wvqGybo+k718ZlFXijJZL+l59ZFf+2LMRDBCDlw8PNHHY35OgSfM
	DauWW1SKhgrSavyxOhBX0zn5kIIDGemu/s0Q4J5ThtYxyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3mxkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:20:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c955be751aso127529785a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745486450; x=1746091250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDjRpH+J6CGnlh13kx8+R3WXEs3y+59jkGLHtd1EBuM=;
        b=xHDowZVRBoomqxLeuO2x8HYWLxOykRkipgmTPHDS9wibC+2J64dP5yCwY+4P8GoVc8
         AQkUXR2No++c9vP8CppeVxjHOZFsTtaaQm5G5dmjcjIZRGLC+tzhfW/jVTRz+JoKR8LZ
         SjCfCy9JVrCjQPlhU4EGqtdrrGW3PeySNTExS3dgOW9Ywim7XxDy2WcadKdMenu8hymw
         t7h/SHs6wdmIzOZ+pfvn8jqFHlN6BqBbJyCkoNlPs0dOOk0J6xQYrarmao0wbOgYF3WX
         BU0qIBrnv5zI9rxFICQrhykFdq/DegdzJTfNpcAt3ACtz36mv+wnAEQB0Z6rtIQoFrKl
         R6ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH4UY0jn7dj1lTydN8Gq5clXyM20Rw2ZTu2OgvMISwhaCp07yLFHt297vEf4+dE4IjrZWD/UVj5wMuTGo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5bRv8wawUjHMBbY/y4vUcRcGs0nrlJxR/8nKCwY5YHv3Py2jE
	k8Q4oeKm+oABtQ4wz8gdWgJq1md6CWJm0tgopELe18YEVmPa8QWC3P52Hqm04fkF+QyGQ54OZOE
	I+o2Pe1cQHUeI1yM5MKLUbe0aGnF/wfYX98ljSBPHsrtIkUIPU/u1ovbI1oks9i4=
X-Gm-Gg: ASbGncsM63T5MSt7+RCEcaLCxxhjlG8awMy7aqqbw86pRxCD4mgE9+DrB+YJIilTbdo
	zgduIG2TpuY8NKJh9PMvfNOa9KXxPKqpvyL39LIA9fNJghcJcM78+19kSEpJ8kYr+Uxv0siqNtt
	G56vJEl7W75hnSnDxYiwY63FTWiuMjSjruDj8uCsFAY3AzdKFmxX7sLHlgP3qzBUsEVKaO+SmfH
	nTrZ1QsIUW80x18fA9O+9TlrRlYbtxiATykYgUVtX0XxyUT19V0ea5NWtpip/QgWdlxEGWReNTq
	0+cIvmYdUbL32vmkIgHZBrPzoUf2h4TgVdSAMkrBh4ZgUemSujrWb/cx9ALGmGDL5bYCEwZgqTk
	=
X-Received: by 2002:a05:620a:4054:b0:7c5:4b6a:d862 with SMTP id af79cd13be357-7c956ee938amr279922885a.33.1745486450686;
        Thu, 24 Apr 2025 02:20:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXeic/MNkIklWTVv8k/JVRx/CtwZ1JpYeAnulapKYrZSdZyMll2kb0qr3b+jhkqOfvLBmVww==
X-Received: by 2002:a05:620a:4054:b0:7c5:4b6a:d862 with SMTP id af79cd13be357-7c956ee938amr279920485a.33.1745486450385;
        Thu, 24 Apr 2025 02:20:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb88dcsm162385e87.253.2025.04.24.02.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:20:49 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:20:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: Align wifi node name with bindings
Message-ID: <nsbzaqjloqm4jnwiauabgmokhodtxgbkri4lqhk23f3vcawymy@i2vigckhuvql>
References: <20250424084713.105080-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424084713.105080-1-krzysztof.kozlowski@linaro.org>
X-Proofpoint-ORIG-GUID: T_5WyArh9XQctHBgQ6cJdHYtgSD_mvVK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MiBTYWx0ZWRfX7V9c1dQQgGG9 4UqhKMzkiH0FZFrjRvAhzAZK74plPf3YYKCy6vicX6AGD0Zl82vFOArmq1zxH5SV/urkWbqtmRt wCaApqgNqzcbSURoWqlCf7n4imxkeeXJYLP4iC1IZq9KPGe06y7Q11fBUnspXdb8sRYOIdoUThi
 8LLh1JaIul8bA/paHzYKKWd2X+H+DkNX2Dva/9BO8i1VE0Sxs9+vwR9gONdVTK+DgXBuqwnVaqZ tK5tLveEkbNw0dZe2xqng+Bcf3uPUUnWMySgkqKyd8lbd1tu7kSZdgar3Rt6X1U5vY1BnTwyiZK Q5sP6Zf7cOqhLbbBoCgvJ/DUN5J6gkPHskKcTD+SRr2Opv4q4MO1sSIc2pBr/+Wm64yHCf/+huB
 JUIeJzegWhIS6kFxfX2awNrgdfHDVzRZJOB1IxMr/PcHZ3dvfcDRPtJy6vaL+XiWazBC34/F
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a0273 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=IEkoaye7scGfjVXCoRQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: T_5WyArh9XQctHBgQ6cJdHYtgSD_mvVK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=615 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240062

On Thu, Apr 24, 2025 at 10:47:13AM +0200, Krzysztof Kozlowski wrote:
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
> 
>   qcom-msm8974-lge-nexus5-hammerhead.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
