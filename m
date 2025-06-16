Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC6D647
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750032681; cv=none; b=AbH0myHTcnxaLSNuB2KrnbAmpfp7UQTkzVOEM0s9Ak9T+LtX/cK8Y7012cEdZlEGM1epV1T11bdiv7GRaUr+Px0DXF1Dr1NPXycYXtOy1LqjndIH2WW8FOSJR41qQ2wodd+1GhDdSvv8N9H4spusrFJX7Xno9RwaxS5s+3L248A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750032681; c=relaxed/simple;
	bh=mbkkVgFYRVW7IBPbu1Cg2y20fCsMjcz3upWXASAHUPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjxHflOHmHsUI/97B5iJElNEVuSAkX7zSNYNVogztyhTYps79b6Zxvt0hINyJ6tP444rVPK7u4bDqQmbt0D1v1bSZyJfkPCdiBNepfY7nXUh+NRdPR9/gqYFqcvtKuyMaChtI/UKKSZWxNk8wLkBrV8G84+37+ob6LnQttVGn9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOwC9Y4Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOwC9Y4Q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FNiigj006520
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QGemQSnd+YjmPoLsIXiSnMUG
	hACJiUpHSlGPF4aQmUA=; b=QOwC9Y4QgzPoAIrn0bA4HgO6mxvb90gK25lWV7gV
	G0D7OncQoXfJMZeX/nN2ZXtYjRUNPu5hahwvSVsZPZ3Y/rPOo7qd+gpV2eVQpQXD
	k7FPM/dHX1XS1QGsR9YCsxVnqW/Vqs0QKiWSJ/OK5SjyoqEsETZu+Z6Q0eBldU7a
	wv54188WyiWoSvR3uEsh8WLrW6IIhEkAae3f432SbqJatUbovgtMVnBt6cUWnwrP
	NuDNIHWxpy7dvrtXMoV2lu7ZiiYNVtDCBCdz6vl58XfRVQOdNh0so0g/WblFkqyZ
	MFONlRKu3+SAwXyym+3gJf/wZN0/cxQGbsrKOwiWLKWXPA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928magyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:11:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c7c30d8986so1397116585a.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 17:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750032671; x=1750637471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGemQSnd+YjmPoLsIXiSnMUGhACJiUpHSlGPF4aQmUA=;
        b=fddi30/V8LeOB6BIU5KN53mLcilgEC8qZRXVk35ZN8X4jllDr9KC+w8ocqecNyLjBR
         73IUUz08DAPykXvxFpm9eAaAN5md0HbJCOjaNiGJ+ucDAcitQlneNc/tf6lGc/4D+D2z
         cQ4Y14aWoxabTpT+wuCvVMZgbcwah4ARXFX6+hIY+CypCdN0OVPbDpMRvpwC9yD8fGeG
         JfiPFDIIGdDH/Fl2hNdN/LJOn14wlagL+CjcVwoItwRu35iAZobAG34R8c3b/MdSPyyS
         +SVZMVLOpQonVc+AgEEJEQgN0qRQuMUzXvQrX06u/Fd3zabyiKIyp4hWaIFa79DxJc5B
         153g==
X-Forwarded-Encrypted: i=1; AJvYcCWPS4mDzpG0JK3Iv1Zmv80ajxsytaUvAfMyfs15lzobL24DjWbYY8/gzhCFAaAA/ubn2tHtGe2+75V8GJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ2Reu2UuS9CexkkumaP1V0VTx37l2Pbr9TIJAWEEgdIpOvC2c
	8x5+26veYyhC701f6k8lBVF/KJzeWtuEdpx25tLL5dw50bIGKy/ftdZbVJiw8v3VR84Z8d6T+Wg
	MH1YU2+YJGHw5qvRkOJlWTPX68bYAkFYoIrBm096/Ny1af30NtX4gBjMtx7L49CPR9wI=
X-Gm-Gg: ASbGncvQOKjyJMH2gOuTRdkRA7sH5V3pYN/RbPqJN+lLHsLtN7FWJ5E5Dp/D8qEyryb
	uIxFsgdq72AvvxKrpXUNI5NI43cpEjhsUl+VEXiZYE/hLC1X47bi3Gdr77RZdRrBIdwnPL0NEgp
	cB5SWyiAfC7T8+G4wEXskHYItLdDtvXrJhAT0DDDQhUQDbNscDKG7CNBFUwDl1BRMp5JRgmnIEF
	z40iZZjsyPj4OrcQMHmSLIc4JxDhBoztUcSWVOY3EPlRvkr9vg4NgqE4z1wZuukuA+TfFariucf
	U8Qq24nPstLdI5fKXAbb6EGthsf4lV50wzWQP9eUdBdXThPaQ+TZ96UPjt0+uu82LW/4hkn+QJM
	sAWyVTFqMdUUy5cULL5HMYtqPTJ9YVMGJOpY=
X-Received: by 2002:a05:620a:1a05:b0:7ce:bc1a:4902 with SMTP id af79cd13be357-7d3c6c16d6dmr1294939985a.13.1750032671265;
        Sun, 15 Jun 2025 17:11:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbSkDjTNs/Dr3Bi6RCwQRdoGGC3GS5fEbglwoZQ8FxFoTXhFx7VD+QofnLhJtsly5onZKa8Q==
X-Received: by 2002:a05:620a:1a05:b0:7ce:bc1a:4902 with SMTP id af79cd13be357-7d3c6c16d6dmr1294936985a.13.1750032670871;
        Sun, 15 Jun 2025 17:11:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b378371e9sm13076831fa.46.2025.06.15.17.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 17:11:08 -0700 (PDT)
Date: Mon, 16 Jun 2025 03:11:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        linux-arm-msm@vger.kernel.org, joro@8bytes.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, andersson@kernel.org
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Add SM6115 MDSS compatible
Message-ID: <bodnhg576oaludi2icuodo5ycjrplkjxpci3yh6sj62bbfj7ry@z2hm4cg7dclb>
References: <20250613173238.15061-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613173238.15061-1-alexey.klimov@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDE4MCBTYWx0ZWRfXz3aMj+X4XZVq
 wDwIPZ95Z78i8Bu1Kg8JTdO8BQ5U2YGNotnJ9/S2XktNidXskfiuZyV8oPmzgzZUuM76RGOXFd9
 wuMOsN5lML5do4VSIdVT1QRsP/hUp6xEyU8xAZ8ieVHEntlfYH1zRWnhn3LXrRl1eYcaFB15eCC
 /SKkA3HCPIoCofwcYARU41Q6NzRNQfV/3gpFdadum4bJ/Gw1+dgOvU2y+CIh9Mz7uqji+8Oiha/
 E14A31s3p2RT0WD1KYlgbHvqTEPTMSzzLqd+sCNmRLgENjZwOLqvPaA5kODS0y8rFD2Uwz39MtI
 MVBK1MZdppKOMbX39xld0TFg0jHQ9Obr4YnF5gVUmhMWN1qlHtUskO1roZJO6NXjBd9e/tD/wjF
 7U0lusB2jnzwQai7QKK+W8gFxUaJ/LTJ0/dpKILRQ/U45bcDptxuKUoJlpBnoIKYBNE5x0PZ
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=684f6120 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=7TFj5ihdlhLXfTPaXogA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 6ABQKwX8Yf74VmeUts6495RqZrze7WF-
X-Proofpoint-ORIG-GUID: 6ABQKwX8Yf74VmeUts6495RqZrze7WF-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_10,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=558 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506150180

On Fri, Jun 13, 2025 at 06:32:38PM +0100, Alexey Klimov wrote:
> Add the SM6115 MDSS compatible to clients compatible list, as it also
> needs that workaround.
> Without this workaround, for example, QRB4210 RB2 which is based on
> SM4250/SM6115 generates a lot of smmu unhandled context faults during
> boot:
> 
> arm_smmu_context_fault: 116854 callbacks suppressed
> arm-smmu c600000.iommu: Unhandled context fault: fsr=0x402,
> iova=0x5c0ec600, fsynr=0x320021, cbfrsynra=0x420, cb=5
> arm-smmu c600000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x420
> arm-smmu c600000.iommu: FSYNR0 = 00320021 [S1CBNDX=50 PNU PLVL=1]
> arm-smmu c600000.iommu: Unhandled context fault: fsr=0x402,
> iova=0x5c0d7800, fsynr=0x320021, cbfrsynra=0x420, cb=5
> arm-smmu c600000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x420
> 
> and also failed initialisation of lontium lt9611uxc, gpu and dpu is
> observed:
> (binding MDSS components triggered by lt9611uxc have failed)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
