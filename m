Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A9A1EF372
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 16:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375228; cv=none; b=obBVlfcot7Tn7qHK95sJVKVVmlCA1whdNzjZ5CKwwoyJ4kiuHtEoZ3KlvzBIXhFSu0jnqv0JZsE7Q9YWymwUANX0Uql81H4epd/sgi6aP0ZmEGjesRaEf8goax0rht39IHrd6Gk7jgyq0APhovlOVFthqu3rScGrcHbG4J1OFNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375228; c=relaxed/simple;
	bh=ZCNOXoTXOG1O0zfWSUHeh8dN/NL3V1HIw6cRpzkclyI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YovmbWCpKfqoiuGDQjHL7ZFCnqga/lVLukGlqtZpX0OSOJO+8VlerajFcUZmLJmDDosG7hp2+RVVwzUlgHlIJdXMe188CG3dKIulm6NlddvykrjX4i9pir/QJSyW7a6VS1yBbExzq94MhZP+59Z6SE0ct7Fau1n1S2vojl5LlGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTA9X857; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTA9X857"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Cv4nG003096
	for <linux-kernel@vger.kernel.org>; Sun, 4 May 2025 16:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oCrre7kyL+DtRhPaevA50uxzh9J+o0WUmDy9isEPb9c=; b=kTA9X857O4qZsmJA
	6y2rNIy9JrJ8GrF81eNoH58AnwJNaWPIBB1Q3dMByyCJNeOL5Sma4DJ9GG+g1Gnr
	cBIl1ZyZVs1j1guQmlWPODmhrfUmF+vYHk4rUkSWGFPa4FtPciVsHmRztZrAs1iq
	nMdNbqpxt0qbZLJ4SCwHx0YOOPeuIw7pgrcGgRhZy8GZAb2jRJGiomKmUNxmZWsi
	jLH0R20DZ/Zt+t/mAooQzIZ1I99RlVqfdYmhhT0Dy3IPcC8kaSBg8vkQSBs8VbvX
	4Ap1lb/kMycBkqrAZrI8WDIVxHFqaSltHWRdennRthYKtBrNwHW19tYiXPT8SGYh
	OhLqLA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg26sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 16:13:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47ae87b5182so77289091cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 09:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375225; x=1746980025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCrre7kyL+DtRhPaevA50uxzh9J+o0WUmDy9isEPb9c=;
        b=ajH9fCR9vhe85BR93m4wV9MVe+9nsw4SPlMYS6/q28MNgXcWBv8jfF2b/DW9b9Y1nt
         1Je/LP/gYbIcA2KT3ucu9+5Y4bNi8RpCtCxeB3A1UKXBx9ovVztDKB422AHeGfG1M3q5
         /eb07M0gia5wxSpWx48/UqRjBQxKseZ2GrRd7jEfNbJM+HHoNC1fQfwFKNB2UIvIcZ26
         d1/56eWNZgY/jZ8oMruG2yDu0pptelS481qhB7HjnpfPEgTDqTxhML4q+nShzhRJmkeK
         3NlaCMCkRv5L2sP6co1AM4QFZhtiz4TD3PdWb7wJxaCqsZ00Q6+tgHmSUdiYvNRfFF8y
         D0Tw==
X-Forwarded-Encrypted: i=1; AJvYcCX6ZVEiIB2lb73h2nanlnVYqibdWiFCwD6hiEkcnsiTldbuWdHcw7GXd9TGOA1Mj0D36MaAIv6GGy4H+Lk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfE7duBKMjzsyHJ1dgZu6KUVysE+8vQ/5Si/jzZ9DwpbE6azxz
	h9oIMDYw4ShbLpMPGUTUSqarSfQHQIiPGlaVCZGBnLP+p4gHO9SJkEMXCStxDoN4y4DDwBGDzci
	AwfmY54GGilU4CvTO/iUajRiEGgYTUi/fTfjAIx+zVj+VOfRH3ciyQG6MPjGTjHk=
X-Gm-Gg: ASbGncvhKmt1or+LlcVwSEod4I3szA4UziS80aqiXRnS8ei1X2IW3Vtpl4zyZlpC3gS
	3HjrXwYw/xpAco4dQFnKOB7/tJ7GUWnYBsQpFwkV2hLx1D3bQ5y2uRz7htp06Q8z4Z4j6cdUDYT
	1dUcN+tiE6tPf4cfcbe2v8980UPggT4p4ZYmYzEkL+iXElPIoZeuQv6dVpamxvhxMtNL2D0Tcwu
	WfqjIozkJY0yTR/MQQ8ihomkeGj/idVomnyJtYzafvWIRyePk/HluoZpb1EYDCjvFnZHEKLFeNp
	ozMb8A5Y5QuQRo8U24sS6l2D53Fq6/4MIMCEtLlQ4rHznDUjf23ry+JeqGQ311E4EraWQIoYeSC
	6kcGPQrVGTggQm/TazEsjB/lT
X-Received: by 2002:a05:622a:1b8b:b0:47a:eade:95d3 with SMTP id d75a77b69052e-48e0115d91amr64684011cf.33.1746375225662;
        Sun, 04 May 2025 09:13:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEodRLHLfsZWcNzptQvg9NDQY4Nk8aia4aLV5WiHHWopfrsacCXqFhOTDBmUdTbnXE8qdnXrw==
X-Received: by 2002:a05:622a:1b8b:b0:47a:eade:95d3 with SMTP id d75a77b69052e-48e0115d91amr64683641cf.33.1746375225283;
        Sun, 04 May 2025 09:13:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v7] drm/msm/dpu: allow sharing SSPP between planes
Date: Sun,  4 May 2025 19:13:26 +0300
Message-Id: <174637445761.1385605.4846218535199859363.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250426-dpu-share-sspp-v7-1-6f4c719e373c@oss.qualcomm.com>
References: <20250426-dpu-share-sspp-v7-1-6f4c719e373c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5SIHYrP1V__8fMPeHv1w373aox8Jwg-b
X-Proofpoint-ORIG-GUID: 5SIHYrP1V__8fMPeHv1w373aox8Jwg-b
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=6817923a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=-ylb_1dp-gWGt-a8D6MA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX7+LmwbE0pr5q
 HAAVtIPe7ES8uS3cexH4l+16hTjRNIjGS1PJ9nOgsO45g3vQKpcJK4ZV2STMl51QfQnisAzQ0l1
 CUMT2IcLWNKCvsAH/kylXy+aNb0wLFVJW4gBq++OBYi+Yyw/xKo+MHj+OxrSiAgi++uuwgD6C0W
 5iNeWIGGfTvOKo9vF6rgJE1YpVUyo2qgVBcohmRfRXR5VSaVVESKNVzt8hGDnTGAcmSVBrVIosN
 DyogzVeOTItgfZvQ/V8+bnA+0pBFKMN2m7rxZM+IrQlWzp+e8vZ+/WZIDtpDJgq1jgDSIz2FApZ
 iFznGpiatpFBuY1WGUeOms7rpWSgizCJ9agXMqCRh0CBNiOmmy7d+hNvDAOQ0Szc33LzU7esCdN
 jXMVvZrwmq6i4fvqzbABfxr4ZF2Xtvp354fEloeq+iDkyL2zT1tsTDDdUdZ2Y8V7ogsNh4s+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=585 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152


On Sat, 26 Apr 2025 07:51:17 +0300, Dmitry Baryshkov wrote:
> Since SmartDMA planes provide two rectangles, it is possible to use them
> to drive two different DRM planes, first plane getting the rect_0,
> another one using rect_1 of the same SSPP. The sharing algorithm is
> pretty simple, it requires that each of the planes can be driven by the
> single rectangle and only consecutive planes are considered.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: allow sharing SSPP between planes
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3ed12a3664b3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
