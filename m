Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D175F28BA83
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747919331; cv=none; b=tGBixvChxIRLo/8kLW1tpFALVQbsjTnAYEqVw4vyUdjlzaMLn9AjJpiUqwt+V5eAeNza9d/IJOn839zxXc6ZDTPwUnJiLqTaJ0+9syOMR8ZVstfRkzKo8yY4Ukj+j7UVdfDjMPcQOkPxwTsLlv5P/PilNBqNn9CZFZbKQ8tfDrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747919331; c=relaxed/simple;
	bh=uh7703YZKKPJekStfl+iVLIVx/3sOB1pDpzQ2JGOUJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pq+6pd8/0+DNellTR4K3+A86MvBmMlVuznfrQlB18axLh7hanpl5YeaUzLnUI11FdSM/Bjv+WljwXm8cwwaXCkw4TTzh1EC8h1GEHJ+51LJNKMF1cYS3iN5OLprDMsl1mWIcGg1HrzKlk2O4KCZH8034dKOOoZStKJGh1Q/SBm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TiXQUVad; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TiXQUVad"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M8O52e029233
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DJi7j+M1RBOvHbcBZkRqK8/G
	si/9/J2x7eD+sSVq2/k=; b=TiXQUVadb2f2+r49UHjnhJBHHT+Lo6XN1ohK8ss5
	on5d4nEuWOlPeLqIQuBj2lcbLXfsGpl2mUdrMSK6jur/gfJsTXkouYM9OSrSZjOO
	J7EFKWLNKlrgnv1R6s3p05pm149eIbNJ5nn/a6i0Agi3DbTKxZsCZYTIQArzF0Ai
	piZn3Lt9wwrxuOsruegQu9OymBxFbSCJr4nJXMeGxUAn8pu0Gur3ip9Wm9aKB8O3
	kyofoeiyXsxICiPd29HRkGMjORN0zh/5sdQaqzrOb5FQ5lQxfsxA0g9b7EYc5mEE
	xtg6A3n8pgIqm9oSBMp9bAiT1sf/i1x+C24+xL7PtsufTA==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb6a1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:08:48 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3dc78d55321so40780405ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747919327; x=1748524127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJi7j+M1RBOvHbcBZkRqK8/Gsi/9/J2x7eD+sSVq2/k=;
        b=ESKJ47STyaMl58lHV3+gSB1nKTiEUfp1uxxglsJ8u0vW8AOkrf/3A/74HmtA/3k2ap
         yXjg8kpVyQH6ukNzVFoWtHowblmh41in8ZF2GpV9xEKDucU75DopUtBuMwO0lJW1svXP
         8B11rM2jOQeiJtYnbs4mN1wDQkVOhpp8+T3wbr3ND8GArhAVtmKJlp3MJjzLdU2E7tHe
         8DEnEo+Tm9o1hBTECw48gu0xEGknXj9ehFAarxodS79EsaaQ1BBhFUy10hIb8hxL32vg
         YF/UBLKn8mTAm6zTEL80sqKlIG7umkYr/ULWHBGtn2y0RvSrab62JyNxKZ5JET6Sj2B1
         A4uw==
X-Forwarded-Encrypted: i=1; AJvYcCVi0rAXXq9oPJJ5kdnEv6b12RsFyxaXHzFhmazPzVB7tZd/Yx6RH2JtKvQkhSD2l3dJVayJgLDKouFC1Uo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlEk9hS4jZ1uuuwZwjS5gFibSBnNaXliLPPTz+QlYZb0qr1Fv3
	pSXX/TEG3s3bR1qonhGTbUA2ypetJFfU6Ll7ial+tJWL07m0jHn5bNGLoTBdLhFJZELUl0AMps6
	2hEqA3nAAzZWbAZqS71WA0aQkI0eL1kuM2L2Dl1XkevWEHqpNtOi4kU2JwdMWWLJIUbQ=
X-Gm-Gg: ASbGnctJCdmWH12wqwiwtnIdWTMfk7y6bTLTaLV3tBawlz9luzz+6H0muD3gI0qIFYY
	9LjoBHs9AcBQYfZQZQjPiuRa7x5eBUGMt06zF+QcWJxZZRk6N5RMA/2FX91ib05OdFYIKwXLUeF
	w9I/uYeXcRbBmw0iTovrQfqEXcBFUmXRfP2JMUTwkGttmlSBsBZkwJoScTV8sH59kr2AG6AKqH+
	kV18/KM9FmqOq7Cc2FTQVGeQsMucrUomXKWVP8ln2hzV11B2HLs8MDxs2Tl3LvnHKpTiNyg1fNa
	Ao0NkitmMm8+EkkE6J2+1RiljIn9iXFWF8n+60QahgUNww0rIPqtpJ4aUJd9yfv6yopjU/IMB8w
	=
X-Received: by 2002:a05:6e02:1489:b0:3d8:1d7c:e197 with SMTP id e9e14a558f8ab-3db842fe965mr263415075ab.7.1747919327120;
        Thu, 22 May 2025 06:08:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvfUBsJCzHaG0IdypGYuFRgNGAJw7D+1sU0Oukz6Zh13k7pm8Eh33CZDVeTRmPagkRvVHBEg==
X-Received: by 2002:a05:6e02:1489:b0:3d8:1d7c:e197 with SMTP id e9e14a558f8ab-3db842fe965mr263414675ab.7.1747919326670;
        Thu, 22 May 2025 06:08:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702d5besm3391285e87.187.2025.05.22.06.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 06:08:45 -0700 (PDT)
Date: Thu, 22 May 2025 16:08:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 02/22] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
Message-ID: <qkqyfksvimaks4wb4si72shewdc7ccy4n3srpkv3jf5snphepu@zpci2dquivhj>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-2-b8bc1f16d7aa@bootlin.com>
 <4yeqvg3wnlr2bhb54zutgqpkehrodat5w5x4rr5qjlrc2ts3pz@gr2iosycclpl>
 <20250512160201.7d0b21d8@booty>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512160201.7d0b21d8@booty>
X-Proofpoint-ORIG-GUID: geACeM0QAcw9mbkQpgOYQ0I4DWSbSCoL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEzMyBTYWx0ZWRfX3TaPqqDzuWPf
 lHzjx0urGOst54236xC69jn0Py8jikgbmQFC7azoEjlCdL1c9ONaWydduPYJpj/4rVWblJ6QnKi
 jHmXTj+NHHTn0dLw/xzl1n5M34e6EXyXLHncI9+KPGDWM1hzccH99U0lpULEG69xVxQZZMAWVaN
 3F0JKqA6x5WlBslwbb8XrDwete1msDoVIOLqd/yB9OsDA5FXObZq1hLTw94vzz460dJ5gM2/KzI
 BPyJo7qjqBb8EY7ri1Ch83RlZ6gUr/K8NHM1zKF6VbU27gTLHo2EKW9s+ICseO+GxOTG2gDLSrq
 hxQcrL4nKTAXQFqvbbpE5Qdx8cNfZ1X3gT7lJRsgbF58hzeByQQy3KXo6rJLV+klM6+R7Xep2c2
 TMtQgsxr0eMNMwl+8uW/Rx8U2y9mZNbKXkfHYLgoweGIJp4/eXSuKBmf8jPUkm2HHmxY2fDw
X-Proofpoint-GUID: geACeM0QAcw9mbkQpgOYQ0I4DWSbSCoL
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682f21e0 cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=e5mUnYsNAAAA:8
 a=mfs67VCVHBiljQDpEFYA:9 a=CjuIK1q_8ugA:10 a=j7KN7tcCHpQA:10
 a=Ti5FldxQo0BAkOmdeC3H:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220133

On Mon, May 12, 2025 at 04:02:01PM +0200, Luca Ceresoli wrote:
> Hi Maxime,
> 
> On Sat, 10 May 2025 10:43:04 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
> 
> > Acked-by: Maxime Ripard <mripard@kernel.org>
> 
> Thanks for looking at this series!
> 
> Unfortunately the exynos patch is still needing a decision. Quick recap
> of the story:
> 
>  1. patch was sent in v2, nobody acked/reviewed it [1]
>  2. was applied by mistake to drm-misc-next [2]
>  3. you pinged maintainers, no reply do far -> should be reverted [3]
>  4. Louis (fomys) asked on IRC how to handle it, no reply [4]
>  5. in this v3 I added a revert (patch 1), no acks/reviews on it [5]
> 
> [1] https://lore.kernel.org/lkml/20250424-drm-bridge-convert-to-alloc-api-v2-14-8f91a404d86b@bootlin.com/
> [2] https://lore.kernel.org/lkml/832a9db0-cf8a-4d35-8a98-08053fbd6723@bootlin.com/
> [3] https://lore.kernel.org/lkml/20250430-arrogant-marmoset-of-justice-92ced3@houat/
> [4] https://dri.freedesktop.org/~cbrill/dri-log/index.php?channel=dri-devel&highlight_names=&date=2025-05-07
> [5] https://lore.kernel.org/lkml/20250509-drm-bridge-convert-to-alloc-api-v3-1-b8bc1f16d7aa@bootlin.com/
> 
> What to do? Proposed plan:
> 
>  1. Louis immediately applies the revert (patch 1)

I can't help but notice that both Louis and you have bootlin.com email
addresses. Granted the lack of responses, can't you ping him internally?

>  2. I send v4 with the original patch to hopefully be reviewed/acked
> 
> Plan is OK?
> 
> I'm assuming Louis doesn't need an Acked/Reviewed-by for that, but I might
> be wrong, and we both would like to avoid further mess.
> 
> This annoying issue is taking much more effort to be fixed than it took
> to develop it. I'd like to get past it and think about the next steps
> in bridge lifetime management.
> 
> Thanks for your understanding.
> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry
