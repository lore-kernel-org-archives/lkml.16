Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A7521ADB5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 21:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751578308; cv=none; b=DisFF7aFyOqI4BaAJLQKgA7zcfIWHVMmE9UnAX5FmQ2sbT4ZxdoA4Owz96qweQ6ttrDfIeHq7LBJIaQRj8wjJGt+rnbJ60d6o9jRxhzbm/P89VvM3FsFwdLAWzFIYEJlsoZYsH+Bn+0ChMZAHFcq296auYgIbXGj7+im2wlQNmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751578308; c=relaxed/simple;
	bh=XM2gMkYwvCJKriutpNWovnXV+a8yvz+nzXNxfkbJvJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t82HDZZgauqR6/HGF+Fdx+2ShAaX7T4wfzWu3VUyBVAxeSf0V6PfpCZUT5sgaljJRzQVnNTclPA5xrHuaf/IPRh8Y13JLb2jDzBLTAc35awymp25pyPSX3SLX9vm1HoPEBr3jtSx6+c7RxoJJ4M2R2fGLoFgeLZC5hLxOmPYoZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6slRFrm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6slRFrm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563DoVr0010624
	for <linux-kernel@vger.kernel.org>; Thu, 3 Jul 2025 21:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qeInK+88yiPg5oGsfDRwuslx
	U4p/xFPqRciwFSrw54w=; b=C6slRFrmp486/69t38/WXUQBhyyUtn55rScxAmpB
	HVek+vhxGIUmjs32nmCJLlmzw/rE0ajM5VZizXG/6Z+HT5UU3aZ9n15U73IEu6SQ
	WvzOLB+KPoEAi8iWobgkthNld1syTGG8n0UCAq3a9rew5RttS9jpARCGi8rrmL+N
	XcKY+dkq9ns7+lZaePocugQfDtp/8yOeFgsakVFnsBNnLlOH43GTQ9uoYZlgTVcd
	8zy73G3E/GKHfod18SvP6Br7zheDKRQik62VqhhszCYfwru6fFRiaxeS4SI9GHwP
	GKJxhJUyd+R64OM6FNXN9JnlzMxjyMFfwh4JXNZedeaJgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw30etbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 21:31:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3f0958112so42207185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 14:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751578305; x=1752183105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qeInK+88yiPg5oGsfDRwuslxU4p/xFPqRciwFSrw54w=;
        b=qkYn1CWvQ8nDS+seTAkh3G69OIy9ehwtnH/KFthSSxSBrzWu406MHqcKKNNRcu/s1z
         OTyiydIOvkSfkWYoGiIpDCL/DLDW7iYdWMNrNUJldTIMJdxOW312GJynUsfJUWnbyY7S
         hB5+Z9yCzQ/waFWxQsdd/jUiRte5CEAKwrQW24lBbjM8sSONGI2GeBdToZLYPL13I/1C
         OdWFgz7Mvku6kL44+IR+psNXwYfQaEZanbEk5WEuvgIj+PyHOXDW9NM9as698BVRrROB
         4K36hBLfmjL+1rM1qT4bqZCnleOhfPk1/bD4SB8T5B2uuvfp231rPl7yvOxhj9JxTWog
         rEEw==
X-Forwarded-Encrypted: i=1; AJvYcCVMEsKa2NLgOZOpl77cwIk1AKo5nozdfDQ79aa4TIv5g10g6SLq9p7x9LBkPF5y1iuf/0gMWVntkHzceaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeWBGRfJXGyyZKFeNCpzkJZCzELUNChBykTKLKmA/rb7hVbrp+
	s2aP/xlFkcX6r81mHl38GeUg5LTfb4wh0lmJ7/l8b/glVIpple16gRcZKKzeKe+xLLYc+2fT3t6
	e9epr62jpMhsCWfz/3RGviH1fngqGv0o8ghOW5UUsFYTL4BZPOm7aL1JQSC6qZpKJMaU=
X-Gm-Gg: ASbGnctlQJcVJ31obOSdoePEIw/GPs/H8MI0rjTIM/LRjF4ErEl389TTTy5HGOJBkOY
	qZOKi74cJjuDzV9iyf5W7hpnG9MjNlhTdVykD/1n+f+rYNU1eONT7J5ibh8zCbEFlERhcj03OFJ
	zeJHqJXw0JmrHK/JBM/R45UKrL2vJwuH5CaQYP4nKymhVliXZP9rtqHa0zvifzyGQbQ/90Pq9xw
	TS696wTgIQGP/hS0mU2tjPP9fUuSQhSiOLSYp/HI13dP7biAAqvxLZqMzCesT+3866G/PsrQLKc
	VfiRSkhdoQ4JbChCl8X3K+jNybI/WAG3VM4pCsm69Neqj1grGV0MpsHwNFomWGkVBacpezabPqk
	QyIJ5WWPoeinCBnNCTzM08mT7iQ+ZNWiep0Q=
X-Received: by 2002:a05:620a:2802:b0:7d4:5802:6b64 with SMTP id af79cd13be357-7d5ddc74111mr124485a.38.1751578304745;
        Thu, 03 Jul 2025 14:31:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFogsVeAym0njpK2tirPNqqlhSFdvntj/qga6EclWKF6A4+sZsDc1wNhJYejevo4+457cOTyw==
X-Received: by 2002:a05:620a:2802:b0:7d4:5802:6b64 with SMTP id af79cd13be357-7d5ddc74111mr121485a.38.1751578304266;
        Thu, 03 Jul 2025 14:31:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494483sm74470e87.99.2025.07.03.14.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 14:31:43 -0700 (PDT)
Date: Fri, 4 Jul 2025 00:31:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        kernel@collabora.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/display: hdmi-cec-helper: Fix adapter unregistration
Message-ID: <ueibew6g6shgvu3gjwlvrbh2zlaqmablud74yzkwv3zsr55jw7@ydt27epp3miq>
References: <20250703-hdmi-cec-helper-unreg-fix-v1-1-7e7b0eb578bb@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-hdmi-cec-helper-unreg-fix-v1-1-7e7b0eb578bb@collabora.com>
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=6866f6c2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=9ZfakaW_u6aXBSxZSV4A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: cc1PBOjFKTcVtYOhlkPQMmDhtDIyk6eg
X-Proofpoint-GUID: cc1PBOjFKTcVtYOhlkPQMmDhtDIyk6eg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE3OCBTYWx0ZWRfXy6+KFPzvHS3i
 q9MYhlfTkzKZlt2z3sdRC4XKcQULjqLxu+1rB1GbVKPZagJ5a3KvKqiV+AnDXmre/l/tN+T9HkD
 KXZmG2kh665BWqfmAKxPfpbvnM7L0dwUfit3xnPVc/uZw/jlVZ2Rn5o8QkMNG12llELGqRYjCxY
 YLcHtKLYNyv9f1mO1piwolfdxRUXH3rIVjKaa5V3nFBTTnz7J3SmXm3hPX0aoxfCdrYFJcjOuze
 Zp4YkCsbe3TNyCyrX8aUmWslYGW5vMAD3NjBNVoY4VKlWxMdYTibDXfIt3mKaD6Pooxm9k18h4k
 dMKpKamESnG/BTZe8j28HHMqa+J6+3nkiDqIRPTN/lC8aTfZLsPH8ZbSo3q7V5m6bx1z6N7pKWd
 mgXczr/XOooEz8JASaAJCD642cdyp3VtN/IbxPpCMcX0iMBCppUCJEKuCDNME1q3zUyeFY3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030178

On Thu, Jul 03, 2025 at 11:05:45PM +0300, Cristian Ciocaltea wrote:
> Attempting to reload a kernel module of an HDMI driver making use of the
> new CEC helpers revealed a resource deallocation issue, i.e. the entries
> in /dev/cec* keep growing.
> 
> Moreover, after a couple of tries the kernel crashes and the whole
> system freezes:
> 
> [   47.515950] Unable to handle kernel paging request at virtual address 0020072007200778
> [...]
> [   47.521707] Internal error: Oops: 0000000096000004 [#1]  SMP
> [...]
> [   47.537597] Call trace:
> [   47.537815]  klist_next+0x20/0x1b8 (P)
> [   47.538152]  device_reorder_to_tail+0x74/0x120
> [   47.538548]  device_reorder_to_tail+0x6c/0x120
> [   47.538944]  device_pm_move_to_tail+0x78/0xd0
> [   47.539334]  deferred_probe_work_func+0x9c/0x110
> [   47.539747]  process_one_work+0x328/0x638
> [   47.540108]  worker_thread+0x264/0x390
> [   47.540445]  kthread+0x20c/0x230
> [   47.540735]  ret_from_fork+0x10/0x20
> 
> Do a proper cleanup by calling cec_unregister_adapter() instead of
> cec_delete_adapter() in the managed release action handler.
> 
> Fixes: 8b1a8f8b2002 ("drm/display: add CEC helpers code")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
