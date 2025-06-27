Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48192E541D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751035428; cv=none; b=oWg/CjJLwFWyj27Jzv+jQmW0LDKX67jfZWON26KMbto5HfguBMv+F5PD1kchUNkPrVqCWTcQcbj1OGFyEza00ZKO96FhW0UcT0H7kDWIGLd0xz0dhJjeri0deBS73CXgKIKphT5iEikMeGa9Ok2hTchERwG3+VP+A2+UKGLs5ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751035428; c=relaxed/simple;
	bh=/ul3doB1+dwnoIoS5D9P2nsTkt/84FYhTR/P0YnMwqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L/B/gTjEch8K0ivOyddMu1Yrb+virGooPuxmsB0nMnw3eQRXQ4VfYooa7LlUkFqAJ4Uxg+gXwqndv0+r/1sjhfX71orlspAofhXgYcMcs4DODTnlWoG7Vcj4wBaAS8kazme+jjSKZQe3ZiyWj0NuwJvwQo4uSXnXOVKpI/LeJSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jEtnbiV5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jEtnbiV5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCCrxc014512
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mnEz7OZ9bC64orY85fIGEKGnIosfekYwIKnmm/3NWO0=; b=jEtnbiV5A3meDkam
	hKYJte3pUhZG4A0IfGtqwYhk39+9W8wFsYU3o4fi8/WIKQbEE+Gd6+KG64qG68Wh
	1ui17ANu0+yYqRrm0UssyjkBVdM06abMpgjwtUcNoWCnR73CVahZR1XfYNOowmEy
	EelGvNJh3KVArgI5LhkWjpfGLn0930uaJaSkG8X0VAfjLfT6ZyUjn8o48HNUSUu4
	xCeVs567p3WxlpPFVM/s4YECDTwbrKVWQGPaH/8x6bpz6hlIYIi8/f8kPYtoxt5V
	VMoaMN2Wjn/nPkYl6pbDdpY1XGLSjOpDAZuGXUwlD/8U+sd8fbu0czb5x9H9nvaq
	r/ZvhQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm25rva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:43:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7398d70abbfso3208653b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035424; x=1751640224;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnEz7OZ9bC64orY85fIGEKGnIosfekYwIKnmm/3NWO0=;
        b=qSeF0G1nnbK5TijKo9PyaQK4nAoAev9x28U7FH0bTARqWCiKwOThGu8t7U4neSjOCJ
         +6FCd86XiPtJ2cZFjn6bQQPWm8ss4p6GqpH832obd6ypBCARy4EQ1YrX7HmOLGUGHqNK
         yhtyVXJthumosPK0QYiN9bLWwmtvd5Xz6h+jhT6vFK4du4kwz83hRmrDWXbnxGXQEjne
         kz3Qfx1c8o5HAkuapJmOXm/q8ZBqJzoFb1ZRmU4lFcscQzQypkTLbvpbkiZy/r3LuV6Q
         UIG191s6ff4uEaVoYQ745rq1G1BMA+7r1SpIeh4R4ADbD9KhZKxIAudqQkKAV1idQPlZ
         /cxA==
X-Forwarded-Encrypted: i=1; AJvYcCVabgsRQv+ooZqkIpAQPK3qUXywy6bZJ1ngJ2nXknpopw2elq/eay1bJEbF6jZTh+zLwuUWmCURnql4rJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUux6796TKLAlqMQxcyJf7DXJQxG6b76xvmnsioXEktcFUsdsd
	JK+KubwXOHJRYlxIx3xTL19BO7uv78FLqndvKtx1cCtdVFMf6HAw1YrnOlK68t/tWeY3+ibAA44
	oLYhUHUEZWWSL1JBY7pZfHdm/Nbvw74O95vDcF+BvmFCZOrNah9J+PFa62LrQApqcYak=
X-Gm-Gg: ASbGncu2uxeOT0UWOw759Rvxs99fqaLdNoRV3vfwm6DpWH5HNlOqRzc3QC8N6/ZMaZg
	3oGtGPa2jFluUfpFg2M+2Ql0ZJ6hmMvXshcp5R4rcWZCOoCrurnV/uaU/uRNKtk3H8F+9wlHXg3
	3X3lW4lR5SJBk/9O4vzrkvnGgS42T6hZeUkc+JgRaIoSCRFlNFoVwXUyIVIWGZITlOjDMY94Jci
	SK0i72WKzx8BpyuECZqph0/cL/iHUV+1CVyj1DL9rpTwK5bXTjlN2xQWgvDv7djtmxdi4Ky/0dD
	R9WlRI36OhyMApeiqEckaYa3hF4ZnI6i2AaVVc0jRxrrrduBARcYnKVHX40=
X-Received: by 2002:a05:6a00:4b16:b0:748:f1ba:9aff with SMTP id d2e1a72fcca58-74af6e6350cmr4661276b3a.5.1751035424204;
        Fri, 27 Jun 2025 07:43:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXUXASWkVGqAD6hPre0AnkWX72+JTqkej8+ilFSGk66OQwdS0ApjjhTz7IQTLD/IwpMwL9oA==
X-Received: by 2002:a05:6a00:4b16:b0:748:f1ba:9aff with SMTP id d2e1a72fcca58-74af6e6350cmr4661251b3a.5.1751035423831;
        Fri, 27 Jun 2025 07:43:43 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ef4ccsm2458956b3a.156.2025.06.27.07.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:43:43 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Sumanth Gavini <sumanth.gavini@yahoo.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250521055411.288724-1-sumanth.gavini@yahoo.com>
References: <20250521055411.288724-1-sumanth.gavini.ref@yahoo.com>
 <20250521055411.288724-1-sumanth.gavini@yahoo.com>
Subject: Re: [PATCH] wifi: ath10k: Fix Spelling
Message-Id: <175103542317.3295854.2266295711938072392.b4-ty@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 07:43:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685eae21 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: CPbs7O-cGvnpaCWYHfOlMOUKughJcbav
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyMCBTYWx0ZWRfX808Bcd5HJH4F
 +tIk9PUjJ1IrC9ntj73HHCLfbDlytXZyV0i8shUmUMDuAl9toFG1o++q+lElO/v07TqHpq2YzXd
 3VuRrIZehS2VhLfBO3so77miCWOIwcVBhlnCGdPLKluEM733sjEpjJ2PrU1rHg803zuaFe8Y9yp
 4+xlI/YKWPCq/xU4u3n9xr5ld4guSWqGLAihA1Hon9cKoUV3xhh0pu0HBft8yLBYgN2cXefB/se
 Q6r9reagmV/feSPnQ9pSy8TElDn/juPftehAe8wz+wkRxxz05APoZfPqRC0+R1SySp2tNRikOxW
 z1KBkMv8/tth2GhqApEu7UHKjEqAVsEZiFZmiOvWynGNLDx5rHnHgoaHsZsPpzix5KRlxmnjH7s
 pNqMdolzS4efzHa5UboYIfA2HSHKK7GT0ImOjlfCIGg2JP+xgiqRKeH/jn2C98ly+C0DIva6
X-Proofpoint-ORIG-GUID: CPbs7O-cGvnpaCWYHfOlMOUKughJcbav
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=788
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270120


On Tue, 20 May 2025 22:54:09 -0700, Sumanth Gavini wrote:
> Fix "trasmitting" to "transmitting"
> 
> 

Applied, thanks!

[1/1] wifi: ath10k: Fix Spelling
      commit: 20870fb0a3001fa99f2684dafb200c2ae6b8aae7

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

