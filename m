Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AC254673
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 15:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751730336; cv=none; b=E66vfmrFiOey0jt/khmYGvhEVN95EnxQ3+6u0A6ilxC7n2iuMlvp+Vio624M6ZeIwfCliYpW6TF6uca9lgrMqrIfYvGyn+2feaSug6Aa6vqgPuQYpnMvLxP8OT/tNC5kUYJEPrkeSZyDEIrKRO5Iae8kDkLBmYXzN1dN1azYhFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751730336; c=relaxed/simple;
	bh=yWWPchJDOEJzNKI7PhnMnFOZ0GZ0ne8vIao2wtvARc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNu/WswI0Gp2Vz/3aYY4JfgY9gf+y+pNZjN92uqyGicZ/mop/hBmlPaGEpIxZz9nvRx577qYdys2KwN0yY8A/+ldRko+eM5Fsjb3fEP52pQPctFdf8rsJSbuPc02qgR1C3jweAMID82NKtoBHaFs2cSYsrLCzFS7uNxEkteF3+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddY1/DNz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddY1/DNz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565FjJKB004263
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 15:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RqPSWAF8btgqGQx2RmoN6IKt
	lOrg2Ps03GpJ9+btV+k=; b=ddY1/DNzQl+wCtYQrNwLVGwgZKGibGWLuLHgpgUg
	vAviCZV+Kl4Nnl73SxPBrU6VXauvAQkVXiCAWAZa16BdkWOuWTKjUOSVESTeSOBc
	8/68GsYyq5LD5aXe8fVCZLq1Y9A7fdV17Wfss1Jr5ZdsW/SFEE2M8gRSs9BqT/Ai
	jhoy0eAwc/W3kkXpo2hqf0NXuHa4MTMbX7s1EEIdC/jUD+8NY+GfGiV8fraupkFX
	IWP3sDVQ3M9ar7ebLaZ7MuVH6Y40xf2zRNemdVs8YlMw0FsNjCJHrZeau03UUngr
	8tWrkDCQi0BqvKzTIhtDGRFi9X678el1ZbDFDZUYoHhTzQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0vsey4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 15:45:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb5f70b93bso26303206d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 08:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751730333; x=1752335133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqPSWAF8btgqGQx2RmoN6IKtlOrg2Ps03GpJ9+btV+k=;
        b=YqL8WCiWFussOBvSTD31PJkRW2UUbq8wRFY8Y0Y3HTrsTQN7Y2GldoOvtbi2hb/lh1
         Zil2yE9Uk4iKsZIb0fpA6mI2BzMmhFQQOCLre3kVNhM6NQmDscGbBnCLdCsz60HEEyDt
         IoQ94YPL+uPUrSyoMwGsweA6BhWA4bDwoZVGdSiwiRu5mpag9r9gNEJVEf7RBdUAnET9
         3iinoeWdOMvVVf+dLS42qrP0Qj9WwS3deCvsesE4ykitGP4MgOY3lmlDRmNbVXDzJI/3
         Y42ivosuN5HMKTgwdGIcwvY2nzzJ6wh1++OdmQCPTWbVcdFU4HP4p+8AfBucqT8qgJ/g
         3EUg==
X-Forwarded-Encrypted: i=1; AJvYcCWFrnNKBU0FUNUAPJ5q0IE8Q+/SImS/jUgRxYwvtro3lnSdtxMsVudj5PKVouVJaaiBJViEtoEgyvK5bcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzsOSSoSt1hCELifmh5TMUCQztVaQHkf6E0teM9RAB96REAi44
	GE4JIef2rxvmbuHIK5WpTexzJE8sMOqK1CaRq8jCwhvC70eXInn64qB/CTc9ukstkRMQOkObxHT
	GjHblOCTSFB7xkpObfb6TQ0vJ95jGOVeKS/yGfWNFS8Y/+DpQdWrojv0EIQ4DxATPylMfwJ5s0V
	bXZg==
X-Gm-Gg: ASbGncvYKxBaP7DEQ/NstUEO3SBlMpxvC7k+LGxad9CzGjnAjT6FzYNIDRYGmw3nJpn
	KTaG/1bFt1tJkazPBwyvx8SGSznkz48uc1MywrfOzLliK5aTWQInipAnlsmtEd37WYys3LIK4yc
	vqzCoB/yBNzGKSJp5cs+X3bGNo3CyMZYBGHYg+lr6MxTiurKvlDQahDp3nrKX5BJCX2WgO0rOqy
	YbJIMQHHiZqjr8clqXoy43bWpuW2iLmafshGGEPNT/1Q3E4cicgv2RMfK+NndMwqIz/9wIPRjrT
	JiJ0NVYUkxbBx7uxj+CRjLrzKmG5Mp82pJI4BPIZniqSgn4KBXYSrzUWcEJ+BmqFcl9VROthB1j
	bIU62UoEklraAGQK5tZ4viuthI7eTNJvH5xA=
X-Received: by 2002:a05:620a:4150:b0:7d3:f3e1:b8db with SMTP id af79cd13be357-7d5f10fa23amr305357485a.31.1751730332833;
        Sat, 05 Jul 2025 08:45:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdQQO9z80uLLq2RxC8dU/JD4SNPSo1XPiRPBeKRm/HHhGqxbe1NBor478/kV8KQ2/9nkaUcA==
X-Received: by 2002:a05:620a:4150:b0:7d3:f3e1:b8db with SMTP id af79cd13be357-7d5f10fa23amr305352485a.31.1751730332313;
        Sat, 05 Jul 2025 08:45:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494f06sm609028e87.121.2025.07.05.08.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 08:45:31 -0700 (PDT)
Date: Sat, 5 Jul 2025 18:45:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/msm: Take the ioctls away from the KMS-only
 driver
Message-ID: <g7vusfodm52goeid27twl7ocspyf6zfl3zsxfo3jolhjgh4nng@oz5m3xmlj3pp>
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
 <20250705145242.781821-3-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705145242.781821-3-robin.clark@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: DADuwvreoYuFZimEFW5DDRsQqS8uTito
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEwNCBTYWx0ZWRfX6hoClnLbeKsZ
 ICWNwxGH83O6GOFktmuxmSpWw3nM0WxAF04RRP/1P4uI7dMPwJ55mdovD6SRpSQoYuBvMPy59Cn
 LfZgjBf7mNuQjmc9oxF3Xpnpm7rx2no0VOWLl9ED7Z730dG3/k4ZkcIS4ySHq6nKWJl3Jfp3i38
 umNPSfufiLVba8EtjStYTx4dI04AHOmq8y4tZQ0JearcoZYav9l/0oc5HsyLc/fWMaA1uQTqxoK
 nNI75+i173E+N2LKt7/3Lz374VFDYDke/hu4QHCNWnynxKuXtvekeGGLoT5PZOEUDpE5wc+Pzqk
 dPHxg1pkGKITgrZyXk/TtI0tc+p6FIY1JFSr22SnlHIeCyYDz5VNg1HWeMwLBnnjZQjTYJHDVML
 /9TbvlebOEayHO/AInWBc6jedSdiSDy1gOmAUBLbccYRp+M2oLsqzENcLMMycZ4/f0C5a+6n
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=6869489e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Ff70caK0HrvyZWHSuAMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: DADuwvreoYuFZimEFW5DDRsQqS8uTito
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=687 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050104

On Sat, Jul 05, 2025 at 07:52:41AM -0700, Rob Clark wrote:
> KMS-only drivers should only allocate dumb buffers.  The driver custom
> ioctls are only meant for the usermode gpu driver (mesa), and not for
> general consumption, so they don't make sense for standalone KMS
> drivers.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 2 --
>  1 file changed, 2 deletions(-)
> 

If we need GEM IOCTLs for the KMS node, we can think about it later.
Let's remove them for now.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
