Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C345A20C47B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745231318; cv=none; b=PnFbL+kkzCZsqC6DT4dA0dDqIaq6C/b40PDv0yZnkRWj6P+GO8eBEBxS/zhGDLWlP++OhGkPalRipkAIJ+YWrTUfNPB5QvN87pmTJU98CszTs5AWP3S9kiLNvT2bjPA64j+bRbkhqpbENEsEENflFta4RsxLunPhcw0WgG5RZ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745231318; c=relaxed/simple;
	bh=MIR3zJ8K4JM5ppQyK+GG2eAZ8hXu/nerf9x/e/B7KDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZliYRId88dDZ8VGm9HZEncbVSaz2bs0OJQg0/+pI5dkMbLEYBrCwlgMH4WPoNYj0/0OiRoeO8nkVsAX9a8+XjUkT/Cm7DIaITNni1T0q3G1jl2Mzd7GYptbn+VbjJ+JcG/iU6fLgYowzMottvgR4XlTPVkFRhzTQX6kHzTgTmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuoMcr+g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuoMcr+g"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LA6oM6014645
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gQ3EnfKvB1bXOmMl+IM4Gmig
	QacysHvzHf3MwtWQ87Y=; b=GuoMcr+g8SJaaTxcZ26/MMvhQnz83kZSAs0ZOJSq
	GTLw4s/VABwEttPJhM4BEV04euW2wD3oabKsrDunol2oQtOwiQvVcEk9KpvWId1/
	xZbNG+i24rOQkCntzKiK0I39zwivewb4Y+DLwjgtoo8MmLOvRYh40qFeUdPTOR3R
	DpUGhumGhHqlHslb+vh9zBdkE16S1zIjF8Oz6FTqxHTgmRT60OEwLJUKP6frn3YZ
	Fz1NHIvnLZuDlCYJF2OFo3zcUpIX0TYqoDgvChWQhL2Mlo8FByWrjH8GTz/mE1gI
	Qfza2jxqDN7OAS4w97CXCakOAQxZ909h/W2LY9lRL0UjPQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435jbx1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:28:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eeffdba0e2so89444776d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745231314; x=1745836114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQ3EnfKvB1bXOmMl+IM4GmigQacysHvzHf3MwtWQ87Y=;
        b=j//ztyvaLFnFJiWoxJp5tCLu7BPrIUT1aBkZw6ffCP0VSmTFWdetXyw5Mb8hH8T+mi
         alN7PmGGYwAcQLlm9Im7UONVmCZrjz23RE340ZanQXlboo0gH1KwlXgswPkyPRrha8mq
         44Pt3FaQTl8d2CYVbAOerWwOmMLBltjueJzkm/jwStnjiWYAbDvhxA9W9sTVzRwxiFbv
         dYFjUMoPexCidPBC7uvmEYrr5y+Kr1prI3HqqD+QAgWIuROKyW3EfytdJs1j+YU0U2HW
         XS902E54JWgqcybG8QRB8TNpofQgP4Lo58pPcHmBHTJ9fx+9xFFTA+R7RpAZG8SslyIx
         CbZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIpJyvH26MSqyoLuxBFc3nEYLTmTd4loS5orc0hTJr9BG1qfDTRXQV14yxYuuJSNy1INIkzrtafdyUf3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1K1GOrVcqgNGTFkJkiiUAbG8WQpTfANbXSVAt8u8uVkJ3Dv4A
	cFvi366RIg+RsVBzjc28kuz2RThq/IB2dWNN7jllWweK2XQ567X577WnI8op6l09GQ7F3yc8lPO
	DaBvtsujTDLVQOCZif/14GHTrFLS2JiKY2+saJ6X28ivgaGaTyMqe9Ga5A3ItpoQ=
X-Gm-Gg: ASbGnctc7RAUxrH5LWDJMp6+xCZsanWT2XDL0vwhYZ/S6M2tGFQOEDZw5xipTZO+wM7
	F0fhNbMa2/jkuftV0Sk5TeP2VB0/Dlq7f6Dq2GtZTedvRJmLhJJRbzP+lUwUp6MXRUYpVSV5bqy
	RDZnZ4YlsuU2c9LpolrQJ1PGbkW/eqKx9luP3qD3X+okTV1VbmMYuCvn0hYSiMAfbbilHafwJcG
	ykx2+wcF/33uM5Gf49Dvb7P9l3IS1OdJJxY9fqWtO/oP2NbOrUxZFlrMQ8vs+VOhtrFOq8L/r28
	J2vKAraGxM604qGXdmC/WpraUWOfkZ1O05M0xq99Rqy69eL53E3Y856wNYtqZVbcxRNodZiyW/U
	=
X-Received: by 2002:ad4:5dcb:0:b0:6e6:5efa:4e01 with SMTP id 6a1803df08f44-6f2c4576630mr189519166d6.20.1745231314623;
        Mon, 21 Apr 2025 03:28:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7WvYG+3gGlebDeY/PXmCn+u+i/rphjghjKBf1LwPFqI0CDk0+ZqK4KIlCkaCs5hgBC9FOqQ==
X-Received: by 2002:ad4:5dcb:0:b0:6e6:5efa:4e01 with SMTP id 6a1803df08f44-6f2c4576630mr189518906d6.20.1745231314170;
        Mon, 21 Apr 2025 03:28:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310907a77c1sm11039341fa.57.2025.04.21.03.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:28:33 -0700 (PDT)
Date: Mon, 21 Apr 2025 13:28:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: dianders@chromium.org, neil.armstrong@linaro.org,
        quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel-edp: Add support for several panels
Message-ID: <fpk5nwwqfxinmzb6itjvh4ueao3pukga7dandvyfks365zjcip@mbbl3ekw6xei>
References: <20250421094438.4199-1-xiazhengqiao@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421094438.4199-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=68061dd3 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=1XWaLZrsAAAA:8 a=D33p2VstQxahVk34y60A:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: dB0Gp20G8A5lioTYJ5YYgqOx8hgA0vsA
X-Proofpoint-ORIG-GUID: dB0Gp20G8A5lioTYJ5YYgqOx8hgA0vsA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210081

On Mon, Apr 21, 2025 at 05:44:38PM +0800, Zhengqiao Xia wrote:
> AUO B140QAN08.H
> BOE NE140WUM-N6S
> CSW MNE007QS3-8

Please add EDID dumps for these panels. See git log for the file.
You might want to split the commit to add one panel per commit for
simplicity.

> 
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

-- 
With best wishes
Dmitry
