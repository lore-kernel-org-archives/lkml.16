Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F398227EA4
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750731789; cv=none; b=eQt+5ECmmAewcP4ctUpwHzHEQDI9KORttSADvdkDlakVGXTwDR/Zttd2RH9US34P5MVH4tF0OPQKsQb9sbWpXUU515KMP8omj53jVs9mDHEds5MgvtcVJMMFderBkeERNqdV0o91uKwr5YYL7OKRFW8bgtzbCfxgoIZMd49QDDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750731789; c=relaxed/simple;
	bh=QYoCyqAmLLMb5Rq1x6IEWblU/9cQxXc178wCyGoQFJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzJBJACbk9MKlNTXnP5fNWIRyopauyz9ixF+eBBf8nrFwABLRkAwHPDHp/rCnjJU9DTOQR+GN2UtF2fVma2JdkBy4mUIZ+D05t9Q0NLWaHstdQZ94EDYiunjnYlHo2rgk0og35kUbowROUdBo15tzxxc6eHSoLfDpz0RtNsEjdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RjxEtyAJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RjxEtyAJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NIXRgf011924
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6rU5RVHRmopMQn44WoHUeWY0
	jhRfCw1+v2AKpZBxabM=; b=RjxEtyAJuamwhozVhZJ7cHBTKRyPDdnahjjITDyr
	OYcLXMNYITJxicgmJQKq0mxIT1FVWjh/td6iV4I086xdyuqSIIxAVBmSkKIfagZr
	gwARejgQl9eTUMYoRvmAEZDt6b9bhMu0RuMU7UnXoHeg/MR2P/d62G7nShZr2NVE
	eAPRGT6vBhIWBgJO/BQlGEAzhorQGYy6TJvcQflokzPaMayE+0enft9jNm4OGktR
	HxUJiT02+gSPg2f2ZPlf4kdcz4htr19I3aCgKy8DLvf4LSdHMt070tQ0Ntpcqwwc
	e3i6C1+GJOm3RxCjECJe1jdqb2eMYKYPNF7Mmsx3doefmw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec264r5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:23:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2872e57so746725985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750731785; x=1751336585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rU5RVHRmopMQn44WoHUeWY0jhRfCw1+v2AKpZBxabM=;
        b=QM9E9Xc7EWuCJLhEm6pvs4T0fqy2L55gFoQXrsIKbqjmXwe4zudUQnDw6cGsPzZ8HE
         WXeX/LY2DfhZVxJ3rsd/SOpPMq3skv5tTGitZ9A7rGM0pUn76Vts5qAFD0fuDz6WO3he
         1nz2oCOplVtwsCdREELcH3782VMUC2Q3aVqhpzD8ZjaXMQAvsEb5sedXnqgtO1pnavrp
         A432IlryKLyo1BRa1xsOHTQnR0kp6Jx2p9J9+K/huySYb/cHCLjXJbgU5IBVLFPikwU0
         lPFlg72NtySz3AnfzJs4nhCVPPuZyR28pmlrhm4D1qhAE+wfRKyBSCQoxw3/C2D1s4a/
         Qv9w==
X-Forwarded-Encrypted: i=1; AJvYcCW1LwfQV7LaFYMyTdbyud56f2uIriP5HKeC0Y2vyjkJ0xWpWFc2c4Ex0YWpuv64y4oKWbus1dO5Sk6NlVg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1yei6psRH/uD6NNqlIXhG2zJRXk9C5QJPNSwhAjQ2AWQbMAmV
	w8C30Hf0DhO4qoPqAQgjuQ0PMoBLG1TQoa8x9gSdgSHQaDwXK4MkVr+4/IZrZ4PWEl69SsSMzGk
	Ujgy6/Y04rwl4c5jG09BZtN7THvsluNofVpJbGlTvKQxzSs8ixA4iFd92QEqEJEwuBsY=
X-Gm-Gg: ASbGnctSjfMCMUfUF9GUDglr6cNA5Th2UcXZLlPrduqwBWR3Rs+BTU714K99suGvXQW
	Mi49oMdP2NZNTJSLrwbawOOc0Fl5BeNKmgp0KJowCnWg534h51cu058Rd5EwJE097CP9rxbEd65
	ugN+fRp49Hi525AaYjAhdHPhkVWwgFyWfIBrP/Qiu1dVmcKTdc7JwdQntY559DmIng1fntDBmTY
	jkVUL3XzHr6WX5l9lPW4wcVfertX5R7nO38Ixj0ipdDJNXAlP0Q1fx9vlbBjUNirf2Eoezk+rMk
	nw3R/0SVLTdUTx/umGF/lj2TaHe6Tu2T2MZpIOOof6J6rgYQm84UvbNRl3pPVEA2Ult5rOvYV1p
	1Ngq+tAIDvSo/HHAlpuPxKyA3n2cNpEX6DWg=
X-Received: by 2002:a05:620a:448c:b0:7d0:a16a:4c7c with SMTP id af79cd13be357-7d3f995269amr1959054085a.46.1750731785051;
        Mon, 23 Jun 2025 19:23:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvirql2XLDma9IdoxjWUc2Yo9Oo5zM03/72H1GEWUIWTzmVc//QLdRiK/ccO0WeTWvWYjxhg==
X-Received: by 2002:a05:620a:448c:b0:7d0:a16a:4c7c with SMTP id af79cd13be357-7d3f995269amr1959052585a.46.1750731784655;
        Mon, 23 Jun 2025 19:23:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bbc36sm1621583e87.94.2025.06.23.19.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 19:23:03 -0700 (PDT)
Date: Tue, 24 Jun 2025 05:23:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: x1-asus-zenbook: fixup GPU nodes
Message-ID: <zzcog42hu5fnxbhbxoe4tyyawg3fn6uhk2x3nrnvy5ujvfpaqr@x6kapd7v6vpt>
References: <20250623113709.21184-1-alex.vinarskis@gmail.com>
 <20250623113709.21184-2-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623113709.21184-2-alex.vinarskis@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAxOCBTYWx0ZWRfX1SGRg64z2vTW
 TOm7rRY4CgZfdiJVaoWvjc4VMQ0WOgC2iyabRhLS0qwmCfjjVCtEHzM+Wf0O0hJ3zhBqrD6KH6b
 e7xJR8eiG8sMib5t0SqR8yQUGm49+raq9Iseoiv/1LDI/z8OqbT2/xs3BAK2RfTinRQMul018R8
 odooclVXLyXLcGj5kYNKUvQ86/7LfY5Gl+NOYw5GgAoBSMbrZf3toS6r1FPwapGt4cuMPCMVfFE
 77RCaW3xagVDQX/Lr2fO8Dl6Ix4kjf3zkj7uex2mWucbYNWnkJF8qV/D28xt/hmoETe8rno1MIm
 8/2G5c0ZB3Yi+QtMO6PCaLI4ysl65zUumq3c2hwTO1d9aJn/Vifhqnn2gKfgFaMmm/J5nhItSHG
 QUbRZn+csU9SWcyM39s0xVajPYHokHv4SwpXx5zfg0ANKnA5krVK3eO7B914AqayLXGg+BuT
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685a0c0b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=kxFBVqErRWOHaCLb2-MA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: tPurVpLRoYWrEeotMPUYYpj4-FxWYwcw
X-Proofpoint-ORIG-GUID: tPurVpLRoYWrEeotMPUYYpj4-FxWYwcw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240018

On Mon, Jun 23, 2025 at 01:36:13PM +0200, Aleksandrs Vinarskis wrote:
> It appears not the latest version of the patch was merged. Align with
> latest upstreamed version by correcting GPU enable location and typo
> in GPU firmware path for x1p42100 variant.
> 
> Fixes: 6516961352a1 ("arm64: dts: qcom: Add support for X1-based Asus Zenbook A14")
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi      | 4 ----
>  arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts | 4 ++++
>  arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts | 6 +++++-
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
