Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D96B221564
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487373; cv=none; b=H2VT/dDHGSMifoqoMqGwMb3IcQC8Fm71+RViboS4UozvmFc8EbTmHVCvViAS+59Uscq/cv10POOlHm7/fhVkz9kGCLoJRiK37LJFMgoTDeBr49vOtYZKcLkhL8YorrJ4xRiqX3unsXYruI5BMEFo0QfZlGufE7hUJaFfgxJhCLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487373; c=relaxed/simple;
	bh=oD/+NuKhlsyZZ5I1Sx7aCzJ6/bahEhBp9YFkWTPs/G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jz9qkoCnsXCWo5ypNJ4yWo52lRtjOZq4oSUDfTxUSxIDq+9qzqvgGWhRMjNe6yTIkKAFX5M2/YfKbQmr8mU9uvonN1gUuzLpIQ8Z6guKuzS39uam89FRKgC7pm6pxUsh862jlSYaSeH2VqzFmpqYbfsGjCb+aB8Uld9/skgyOvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZoW2u4ci; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZoW2u4ci"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F7wL010253
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ki0WMJZKSmFmQy9e7rjeB45X
	grpCTsnp8UNMzxotgak=; b=ZoW2u4ciuCgGFbFUggKAC4FR9QHdfrqdT7adpV0H
	oQ3a7gUMOG5EvWREIOcQ+B/1LpXMwIw97yuw6lqFdE2BQPs6z+fagMsRGn1T7jjB
	6nAccwXImbAz/kgD1xdqjAlkzM++ojkAyY1el+WIt13tL0d50x4nSuxsj97/8CLV
	i3deGLaAnaHo8m0HCrvG2cjqgz12urviY+Kp1t9Te1P4CR0r7zcDefn/+QoMbEXR
	DpQQmkvBXnQXuWq1DI3LLVQHW35DFtBhHrWEXMgJks7nSO3vVuXrqOqtBaPzOYzq
	bJZ6u3+vqjOsoLJTK3zt8TS4zF6oBcsqRVhtQMF3ODcmAQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3n0bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:36:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0c1025adbso170416985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487370; x=1746092170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ki0WMJZKSmFmQy9e7rjeB45XgrpCTsnp8UNMzxotgak=;
        b=r+AIIiZqQG1m73y1MRZHE6KrUgn9SVxwXSpUkL9+UCcs7fuOzt3iu2/sUJp8i4JMKA
         2mcdOVz88rZnO01MhzJuz1p6h20Lgo9jid45270eMokJXmLLykpQegCHgNtWm8TSo/uV
         HKmCexXJKdpaoBK1MZww/aL3XvZAJedVUHWk3eNQgKSGnebR7yqWIoBbkmB2xh0broKW
         UwmKrs3h+Y7fRVlfGiX6cJiCqbgh/DmbIM5j1J5khra9wT8lvYd6xDz9Njh3we/68fy8
         dWQiJENvHhZBJkpDaPTW0K/IoUegsv4nhMlXnH/ntBm1FuG1hlBI/A5BDAcDgtAyIpIo
         2w4A==
X-Forwarded-Encrypted: i=1; AJvYcCXpiwrJNx6Spmt3Z1RO8uV7uZnmJqznYN1cz5PgbM64SccAmsG7k2Is03xy1iJRlqSBHGI5hzBxd2egLHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWBUklkjFUSaCMCG+OQSC4ZvSHHyqRIWlrdtAxoiZ+lVw++Jae
	DRy9kTIIs361D04dmBlDN31w86NysFmZv8qslHDgv1j4toV0Pmujt7GBqfnu9gCG5Wpi+E9fi7T
	yjT7tc6LtrXcQdh0MPhiRBxKcZv2jj+U0o7UMXsJLLQiT38i65UbsT2T3zrebfUM=
X-Gm-Gg: ASbGncsSeE1xHzQ8Hml962S6st2HzGU/Xrv8vmEvJmVQj6BXYRtYfERkGeS/h7O+ScW
	M9KLL/FKMr48hTI3CcDMXAbMF/v4oXVIOb4Mb2ukO8bwJNZKf/oUU3Ehy0vfvzamy4CQrqBbMpH
	zRJaILppmNfnVzZyRE9toWxhH6hJT5iGU6WSAeintJPKkaRlhzmAin7wmeYvXKR0V+AMm1s9Dlc
	olVe3g+Qme+V8xvZs3V73WNQI7q84W9xpjOQ8/s2cP9/0Spw9+QwfHgoQG4etLim4dzk8yyoOm4
	YFvcSpMuJN/Iu3arAqE70jRCPjMnF0owoMZgo3Sh53NlK9MoPJyErGlWyFo114xBsQ2YxlX+yuI
	=
X-Received: by 2002:a05:620a:268c:b0:7c5:4463:29a8 with SMTP id af79cd13be357-7c956e8ee8emr286191485a.11.1745487370261;
        Thu, 24 Apr 2025 02:36:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQ3XpknWBRjJVyY9U395kjM4TMXYtQ89RY/LCEXTfiRyw5qhDQDDxCNr+1yx1C+oNIUZPNCw==
X-Received: by 2002:a05:620a:268c:b0:7c5:4463:29a8 with SMTP id af79cd13be357-7c956e8ee8emr286188885a.11.1745487369953;
        Thu, 24 Apr 2025 02:36:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb8387sm164282e87.244.2025.04.24.02.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:36:09 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:36:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 00/10] phy: qcom: Introduce USB support for SM8750
Message-ID: <kpub5pyyqb36aajcu2qchcjq7ypqvx4zywxusuvvlq7e7hr32k@ytbygrzwlfqs>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: jvU-9oSaxgXe0-I_3TeYrzrfhDvgS-0a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX3ZsXRS4N4z3D Zld8nlKSUNIxHZUEBnzViTBYxO6eOv7Kvurzs3sn0kTivB57+nUFC5R6xn5WhAFamtN6e1ZJHBE 458hO1qUk5eDsE/3QX9HG1oDwq6UwvBsbPgS91Be98rTw8ecTuravCwXkEoOw0TnWteRdf2phWR
 2j5kYJ9VsMuLBUMjbWKaUpXncG7nDT0Kaz2O0OSOpZ68mCQgLHQFZSrXgTGaTELjM0Xh3oXcQfR 6PpOVQkJnu4hX5b4knzTBmQb0+VUYheQeF0T4p+CBTwf/6hsTTeheQbdKtMmkX1ntqNItt3YMYq E5WGTSWlWFNw4BqxXDfxTltlHkRlsZ9iRYs0JRafY/hDap6slGlUiv6fFl85MKqGbAjagQCsffh
 d3NJ+AjX0ROSBAgNZcdXcI9JFzNjj7ZJ3xOnplNTnOL4CBpIyuZZEOqz5umSIMmv43qxoj5m
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a060b cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=spWr5J_MtH7HAiET_ysA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jvU-9oSaxgXe0-I_3TeYrzrfhDvgS-0a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=595 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

On Mon, Apr 21, 2025 at 03:00:07PM -0700, Melody Olvera wrote:
> Add support for the PHYs and controllers used for USB on SM8750 SoCs.
> 
> ---
> Changes in v5:
> - Removed refclk_src from the QMP PHY driver as that is no longer used.
> - The decision to move the TCSR clkref property from controller --> phy
> node was made in v4, and the refclk_src was a lingering change that was
> meant to be removed.  CXO is the parent clock for TCSR clkref, so CXO
> clk will be voted for as well.
> - Relocate the SM8750 compatible within the qcom,dwc3 bindings.  This is
> to take into account the change in clock list.
> - Link to v4: https://lore.kernel.org/r/20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com
> 
> Changes in v4:
> - Made some fixups to the M31 eUSB2 driver

Which fixups?

> - Moved TCSR refclk_en to the QMP PHY DT node
> - Link to v3: https://lore.kernel.org/r/20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com
> 

-- 
With best wishes
Dmitry
