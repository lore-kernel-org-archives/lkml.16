Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6807228EA6A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744313412; cv=none; b=ewYVM1gE64uqIQdeodTk0fHDyVsm846MiJkG8Fmx5iyx4R9T+TOnhgTATGINOEHmiNf/1bY9Hofmm1vOdKxj0/82mc+wUpskOeZbYxPc8TABxEIhcF7OIzY0VOy5VEZiCV0DKC0CVwDmLCMvUTLcVSmKQh9MPBxqokKzSSX0PHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744313412; c=relaxed/simple;
	bh=xRVQ4DyBJEj/EvwEdhh7WeX+e/QsEGh7neBOmh6+fgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7MrWJlTQAduW++psWSWzCn1f5Y9yBJfFV+JNqO2Bzcd2W6PTyBasiQQ9GUk35TrUpe4kcGssR0pFYas/4nfgZvS+AJM5VKUicyPzeJ2WOijJtw+7lCzRiYZkoaYJ/hPZxYOtuhfFRJe0ZdjI2K1YuCsiMCR/2sEJtC5kiF5HXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cj01MTYw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cj01MTYw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFZ3BX028819
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xmOqzP4u+pl/ZdWWXRUlQS2t
	mT+CqYg1/8FByj9msJk=; b=cj01MTYwnP3NPdggXBrPcXP1VnXQKb/vyNjuywjL
	wTMg//l2o72exuPycgQv4sOAPc7Khu45IALyEkqzFpia38QgoGYqqCR6sT7/RJUo
	gfaAEbD9o2uS4muFO49oqZGagCushbqlY8UIxzF0b5JcaLNJV/ebMwtsxZTxsj+1
	gos6JwTM27v83nRgTyr+cU5X5sIW6+jiR7X+pfRMSNOqYI1Fofy5y4nY+2a80z8d
	I6rPv+9gc4juB+lPs2PpsL9TrBMRa0kF2f9y5XXFuokLUMPqGGsuLpfejkz3LsSL
	hJ6+zNlGZhiaHG+9w7f48oZJFLrswxn/rlggoCtvZ+aU8A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbur53p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:30:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54767e507so199813885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744313408; x=1744918208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmOqzP4u+pl/ZdWWXRUlQS2tmT+CqYg1/8FByj9msJk=;
        b=VgQ/8hRKKtSxebLVuVwc6TO6LyAcp2Vu178yv9zpAGEpBcu8I361Mbu8fRS11wGDtu
         ZwcmrUeMDjQ1qaVR75FvU5bTqNMDc18RUddfrG5ctwx//5BNBWn7000/xyHm/wuo0ctd
         U9ioJd0dE2nN8dVbs/uORQODZrF4ETLWcP2Ylv6WsNLdfREQdMmcd8IiyG2z3f/qqOT+
         srOnJCg5f8s3HTxGR7JaUhMqXvI7KAFYothD9RXAVpcXRmXNg5YUKr7iO/bij5dgoRce
         b1zpFMyMpk8+iBu3BufkmV+fc83GfpswwF7jMgbIXP/76RijXxlCcwkgpa6Prv5WiTa7
         amOA==
X-Forwarded-Encrypted: i=1; AJvYcCXkwVMdF7bDSrtbhB9IPZnmNjYzBIVqZMljp88jNx6b3uxG+CYzVtx8oMFHzsxFcxbr3R+Y8iBulz99zQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU6dVXo8AUc0qr5XdJpikgIMUB2M16E1z8Arw30wsBHWjuBsoB
	deq46iZwPaxULtNgm9af7G18hxYWa55jWV97l3YhrJkhjtua0t4xaOGCFfrGVPdZNdKXI4lynE1
	iXbv+QlizdIup6EomzZgEncntqMUjek6Yqgv/XpoW6bptkH1IwZ8KhAXO8S5xd2k=
X-Gm-Gg: ASbGncsq5JDY4SWdUgSvW/9Wp0Um5tusct64oS1ufIXqk6HVjtQibyHzy2a9/VIMh6k
	Nv4gGef8SAOYJVDuanuopBnKzd3Hs7vOyrQBxGSO8dpj8iiHpDDiVK74ZuNCXXdPYt0X9z0ETXB
	D2EcHoiEvYDcXoBOo8PlpzGZHIJtlvE1djpSA2ovsIX9rbFI+KFCsZXJi2/HpAh2cgIFPVLN2bR
	KsXBByNcuZtsEz7LORaxAzGgYFX0pNQsZwCf/9jYSViiPJb/hfEpwIFG+Xom2q4cjliR/oGJGw/
	z5DvnlvtQrqf1hkT8Y+upVeaDqcoCMO2J2SL2EESTUQkdnd/vZaMwtJ6R8fwEvM1pyUyWKDSnPA
	=
X-Received: by 2002:a05:620a:248c:b0:7c5:4348:183e with SMTP id af79cd13be357-7c7af0d400amr26914485a.20.1744313408115;
        Thu, 10 Apr 2025 12:30:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEy0Yv3SFaPPo6VgdBieIMea7BQKaDgcTkqEdmLGwfF3jij9ifdIj6Lgirjn6F8+UXSuYGWow==
X-Received: by 2002:a05:620a:248c:b0:7c5:4348:183e with SMTP id af79cd13be357-7c7af0d400amr26909285a.20.1744313407804;
        Thu, 10 Apr 2025 12:30:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d239f48sm228966e87.97.2025.04.10.12.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 12:30:06 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:30:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jani Nikula <jani.nikula@intel.com>, Imre Deak <imre.deak@intel.com>,
        Lyude Paul <lyude@redhat.com>,
        Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
        Suraj Kandpal <suraj.kandpal@intel.com>,
        Andy Yan <andy.yan@rock-chips.com>, Abel Vesa <abel.vesa@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/display: dp: delete some dead code
Message-ID: <qdzrybtfgfhrlru7xhv4a3nejnt2owhexpkpbhcxtojjjvyaz3@45vejwh5ffjl>
References: <de03fbc6-ca8d-4d3d-b80f-d1235b2b346f@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de03fbc6-ca8d-4d3d-b80f-d1235b2b346f@stanley.mountain>
X-Proofpoint-GUID: tfZh4Nn0euTUZu4TPxfPIND8oPy7sRla
X-Proofpoint-ORIG-GUID: tfZh4Nn0euTUZu4TPxfPIND8oPy7sRla
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f81c41 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=fLjeHktqZpDZhfEeQlAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=826 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100140

On Thu, Apr 10, 2025 at 07:25:14PM +0300, Dan Carpenter wrote:
> We re-worked this code a bit in commit af67978ee37e ("drm/display: dp:
> use new DCPD access helpers") but there was a little bit of stray
> dead code left over.  Clean it up.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)


Fixes: af67978ee37e ("drm/display: dp: use new DCPD access helpers")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
