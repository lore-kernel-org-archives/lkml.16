Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6371F1E5206
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744313500; cv=none; b=Qbg/+wd6ZhZsnJ7WoMzBwYHq8h853bxoWToZB+HeDNcI0z2598fHQExOYM39lw6styVmrwjNFqsCPaf/5ORx+unwDECwypm/W9iAwg6hlrkHxIKOIkkFslopjzmaJvmu0MHhzqxMKjuXg1pQu+YVkRsviWTYZVXbhwJ3kYTadoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744313500; c=relaxed/simple;
	bh=nvk3AfBlAGN872ZRTShvqoou5aanO8EBPXmNKMB9Veo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUrCe3Dkxsji8iMwFYnzAty1LTFVAOJqKxgdaO2XcqzxdhoZsbazyAaogtbttuoPcSRZAvD/moJakdSyuRDh9DMQJ35pHNKYQAP2bQec6odf1ILnYHt7/H4fU6OFucgCk2CaEFuW8ZN3+RNrDjzYNsDnjUI5jd8OOzc6JaOgM98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJPX7vmi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJPX7vmi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AD2ia2006861
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ds9TtaCY5KQ6iV/Yaj6mG8zs
	RfUBvQFElU18gYT4+UY=; b=gJPX7vmiC/oS5ak4DBfWZE9ixd9+ysY8osoaEgj7
	61edvL7XVE34WQiPGOVw+HlwLzPZqN6Ovu/+GgcvyuIN5Fou8pCocDn5TO2+FidD
	Wz7LXd8COtugpdgTP6aan5mqKNwcaw6Eaf0GjmzDVgUxfoe+yUUEubsrKbMfhYqk
	clzFgiIVJUr3IQAmlTsx1vUQb+nmnE3+Z1hwaqRorXlUl16NxUFATWerVOK25eip
	ptaCjZPDZISJHQ3BhWQxySQSOkRyV0ikTUYkHsCESJy+dyEnlfFiSozQDZaSREcy
	dRWjFRFSY60uxcOGQ30oHZ8nfQ0U31bSL2qbKsBirUC5Dg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3h5b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:31:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2a31f75so351109185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744313496; x=1744918296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ds9TtaCY5KQ6iV/Yaj6mG8zsRfUBvQFElU18gYT4+UY=;
        b=T8+OrDCob5+MRDNM9oaIgOjY3bKIm8AmFOVpgv6s7+YKn7NI27VIwr9Fl6cUXohG5v
         hfGvnTJ/MZWtoLpPDS/Wh087aus1fW8Eqt3IfabMpcG+2VnQPN0FJERrle1ZYn5VW4WW
         IiUF3DdwcDuLKcOUvtIwsILr2L7TwIeSGysVFAVV7VKHSJN6x2XTux1dpIFPikwx5D+P
         YmtyQnXclCiEXbADRrq1nTA6tl/XLS0h3png8DcwVZ/ooRhvoOj/ybOSS0vrlm0CGi7X
         NNN44jUl+UaFbk5LKzE6SJ54/aLqExY0AnfVrDSgPpM2k5hEoGbsTnIjEPTo1J5LAXWa
         ycxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG/VGjcvLeIQI8qJRqjJ0q0EoT4DJEpGSEAhae+u30+qBLZr8deRNeCFu/jBXzWTPFaz2UZLLcDL+36Ow=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXzuNdbmEFL46j0A4mDiXJpZM6EMN5YAO6f81C4boYZKQ1IUcX
	a7jhCvzKmzsMk1A3cWb4PsSxGVevCRccNWHbVb2Lmyd8C6k5eIcmVThpsln/izvc6QSBexDqppC
	V9Wd6GduLgC2IAVQLAAHfLqODimr/GRKeW1z0RMLEXE4BdL29RhEtUeFm7mBCsiE=
X-Gm-Gg: ASbGncuOUqN+QuvfXBycfFRkk+qNQmJ2sxXn7ZMo8DK8e79gi9KMatv0tDmF33dCs2N
	bFnYxEcKGONq5rtaGddGiYKYASfeDhVka4fe4W/gOGMMQw89pRLT8ec3JdwnQtpmTLqpYvZpU1T
	7kmOXF6d99XFM57PqvlF9I7IBwHu0grn0wO6oHl6ovHmKIrenmUCyV1EZ+T93Hfst7WOvVlhRNE
	TjAUha1oiERFZPoTjLIc1agL112nzuCrJ4pO+0yUI5LGVm98nVsDHp0lqKghf+YAkaFq+1G+Ez8
	EIYvy9b9wngq3C/twz/XJuGmcdlvByYyHEJbr9OzxcyKxvTj7KbAPJ8chhGgen5c5QkvcHzyBH8
	=
X-Received: by 2002:a05:620a:439c:b0:7c5:5e69:4450 with SMTP id af79cd13be357-7c7af0d6384mr32378485a.17.1744313496259;
        Thu, 10 Apr 2025 12:31:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqctDDvkKrw5rP7GZctwMAOW52noXSrb/QQM/7LagYwEhTOr3WvKjQ5q57zE/X4Pbf9fAxcQ==
X-Received: by 2002:a05:620a:439c:b0:7c5:5e69:4450 with SMTP id af79cd13be357-7c7af0d6384mr32373885a.17.1744313495965;
        Thu, 10 Apr 2025 12:31:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123d84sm228105e87.23.2025.04.10.12.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 12:31:35 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:31:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anthony Ruhier <aruhier@mailbox.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/7] Support for GPU ACD feature on Adreno X1-85
Message-ID: <zns3xlyeajvxxpubzzsls5tnr7tnp4ws2dwfx4s7klzn4nslte@gpgdfjzm2s7p>
References: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
 <dj256lrkc4s5ylqkqdrak6a6p3v62ckkd3orsg7ykz2w6ugllg@rbfkojacklvx>
 <0d1aaba8-7736-497e-8424-84489c637914@oss.qualcomm.com>
 <dmzoooujjb4zojjlgovjt6lccxilnnc3yr4j24vj4hwpzf5ouf@e6qkdlekcsnm>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dmzoooujjb4zojjlgovjt6lccxilnnc3yr4j24vj4hwpzf5ouf@e6qkdlekcsnm>
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f81c98 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=ZR51km1V383oZAxlFiMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: jQs37RfrdV2pOiK3lxAeWOL7zbtaD2Vu
X-Proofpoint-ORIG-GUID: jQs37RfrdV2pOiK3lxAeWOL7zbtaD2Vu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100141

On Thu, Apr 10, 2025 at 05:51:38PM +0200, Anthony Ruhier wrote:
> Hi,
> 
> Sorry I should have gave an update on this: I don't think the lockups are
> related to this patch series, the same problem happens without applying these
> patches. It seems to increase by a lot the chances that a GPU lockup happens at
> start, however, so I could use that to debug the real problem.
> 
> > What firmware files are you using? ZAP surely comes from the Windows
> > package, but what about GMU and SQE? Linux-firmware?
> >
> > Specifically, please provide the GMU version which is printed to dmesg
> > on first GPU open
> 
> I'm using the firmwares imported from Windows, the Yoga Slim 7x is not in
> linux-firmware. I understood that the firmware files used by the Slim 7x are
> quite old, maybe it could be the problem.

Recently firmware for Yoga Slim 7x was merged to linux-firmware. Could
you please check if this helps or not?

> 
> The GMU version:
> 
> > [drm] Loaded GMU firmware v4.3.17
> 
> Thanks
> 
> --
> Anthony Ruhier

-- 
With best wishes
Dmitry
