Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6835C29614B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744365517; cv=none; b=VxMHgf/3HEs+RDHeHDdl+o4PCrU59wq6aXqYD6Xtg4BNkYxuw+n2V+a59cKR64kdlZQF+HrF9rpZZL9WpfUNBHmSpOQlCd2b5c4g0BWmcD+d2cYG11eVV6molj+J6kbUkDeDF10Wv884etEnNaMOX0vlGW4Bvhc75vC/dqQ71kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744365517; c=relaxed/simple;
	bh=oDLmUE9vnB/mpLL/NFWoIXPhhWKqT3SckQc7mw5nmm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aBm1M9UsXTDfBGdc2GQe8EtMxP1iwvDE88pnEspdNH+lBkIDhYImfaAbjiAbqGE7aeJcDH4rUM1RPYHA9g3qxHRM6U0wPjvRz6c0bWJU816ddz7OQ+hy/ZLyJmoUAXnOnWWlQEjPx05VK8gN6YDhUDFbHg60OlWMEIE6MSZz/+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wy2CUYdm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wy2CUYdm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5RcQ7019670
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l6UL+0Wn7aO1X0HRtw4EPKkl
	ISshVQkpFC8ihWRKdgQ=; b=Wy2CUYdmChXXIyow9bMe9xGBz6PUxdiQ2mHm0BmH
	Ll5FMuM+Zot50Xp11PXy1R8eeZyHbc+zjy+svKuFGTnPD+nzs9eeQxYcC9jeeV9R
	ZSyUUe54eImsBo7r7OtcC/UHYOfc5os6YLDklUasz5MPs0J6Ur8kbGABTr/Us8R+
	QiMyIMrhcp3zQ/HCUp3mNXj9fz2SLzH6+MLw95MGZmW6J1lSpnig/Xci2JDCMh9M
	YqCeXgzEHD2mYmh8jTkqqlN8GJW12IntZb5qj6bL2ulrFLlMHy2XgtqZHbxe73nC
	T3FrCZwz5kTnGUHfCtWBY+FUP5UbRrbu/MIN6mAGN8onIw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrt51h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:58:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30828f9af10so434529a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744365514; x=1744970314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6UL+0Wn7aO1X0HRtw4EPKklISshVQkpFC8ihWRKdgQ=;
        b=RDMKI/GTrISt+kBv/P9356qps4VBr1O0wFhFOqwP3VH4FPIPnfI925UTgzC1ngTl3X
         8E/+9HjZboAdGzsFugUonyM88WTwm3ZKAHJsR80QNA8iXqlOFc9uN97T83uHXgjXS3nz
         gW8yTVeTcCeq/5cgtBNg4JszFyzd/k6y8nG8LSQj6yWGDhDmqqNPy9qDxPQ/Zp5DGYFz
         GKXTAsRRbRdocQedRU5L/GjOZkpmOwnZcdZ1HN4DUScLs3+UVFvGfnnu0CORREZMe7aj
         oW93zXJxAeHTOpph/gOSH/ZaRk5oIQX860f1n8v+6ODwfqpCw05i6XI2f4RvVZoOD1me
         K1NA==
X-Forwarded-Encrypted: i=1; AJvYcCW9o5/Z/qXrjhuvzAq2Fw1QMKpCOGCW3nifcxEB73zsaV5ViNhCj+r34pEGwdU8PBHm9+lB1xECYPdLjqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBab0ALr9seuTRGJKsQbhmtZ9eaV59VflQI5kBLls3n00KcVmZ
	G8/sFMVjzK2WBfRq+/9F3A0EfGp49jP0DpDnWXBLEve2QyWFf70ID0czr9wzkTutsnBQbxj0QxB
	ePC1wxJt+K2R2jiS1xOjntmWCpXVLSBK9WIXYhxIoa59rd1nyNBuW01Rua7pu3sB6+k1x/cYlDN
	xbsborVwlXuAnMBSeJRJxBUqBlTn/XN10FGxqW0A==
X-Gm-Gg: ASbGncuinDnYHtzLniSnc9V+2bK9lfIvakUM5P9UIOUv5QkUHPtLBAbaklmcrLkD6ej
	Z6lmgQ5Rsh+qgW84ak9Mhh2d0DekcXphsxzdgkPugv+w64j0beh1rq9MXB3jkCf1Pm0ya
X-Received: by 2002:a17:90b:520a:b0:2ee:9b2c:3253 with SMTP id 98e67ed59e1d1-30823784559mr3506442a91.30.1744365513672;
        Fri, 11 Apr 2025 02:58:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6sJSVzfqjm6LHCdN+XCA922f5sJBxUz7MfgfUbTg612+3CbLuyLzFE8TzIIa/iJZJwYcC7RAiXF9ZM3HIXkQ=
X-Received: by 2002:a17:90b:520a:b0:2ee:9b2c:3253 with SMTP id
 98e67ed59e1d1-30823784559mr3506413a91.30.1744365513284; Fri, 11 Apr 2025
 02:58:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409061543.311184-1-vignesh.raman@collabora.com>
 <20250409061543.311184-2-vignesh.raman@collabora.com> <hs7tgbl6f6a5ksuijoxhbmkxtjwr4phedzhlsjycf6kw3fa3wg@27ep6rsq7ok5>
 <6adbfd63-46ff-4120-b315-1669216d0516@collabora.com>
In-Reply-To: <6adbfd63-46ff-4120-b315-1669216d0516@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 12:58:22 +0300
X-Gm-Features: ATxdqUFB7OAThTSXIV_KL9pBaqatyH2xYwq2f5QLgdtEPY83ZXJy2HTSd4EU7cc
Message-ID: <CAO9ioeV+RVmqPcAy0BofrZcVknEfKFg+uqhdV2hH97tPsch4wQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/ci: Add jobs to validate devicetrees
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        daniel@fooishbar.org, helen.fornazier@gmail.com, airlied@gmail.com,
        simona.vetter@ffwll.ch, robdclark@gmail.com,
        guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
        valentine.burley@collabora.com, lumag@kernel.org,
        quic_abhinavk@quicinc.com, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: N05BxzJGyEKpzchl7Sqbm0ZlwKUYMrEL
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f8e7cb cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QX4gbG5DAAAA:8 a=VoHzyVz3eI8A9jJUxmkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: N05BxzJGyEKpzchl7Sqbm0ZlwKUYMrEL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=568 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110062

On Fri, 11 Apr 2025 at 11:32, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>
> Hi Dmitry,
>
> On 11/04/25 01:02, Dmitry Baryshkov wrote:
> > On Wed, Apr 09, 2025 at 11:45:38AM +0530, Vignesh Raman wrote:
> >> Add jobs to run dt_binding_check and dtbs_check. If warnings are seen,
> >> exit with a non-zero error code while configuring them as warning in
> >> the GitLab CI pipeline.
> >>
> >> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> >> ---
> >>
> >> v2:
> >>    - Use LLVM to build.
> >
> > Why?
>
> We are using LLVM/Clang instead of GCC to avoid architecture-specific
> toolchain for cross compiling. This is done to make the script generic
> and run only kunit tests. I will update this section.

Ack




-- 
With best wishes
Dmitry
