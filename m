Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888951D6AA
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751208327; cv=none; b=upIgTI9FAD6c73RDsvDImRZrAaGCSc7vBa1TfqVZ6VhP8aaWvO97tD43OigsYl+uuoHcUja6bIpKXs/ig5WoUMtwQEoWx81axWRoS0VdWic+4HhBMcWFlAgRVTMMNk/CvYeqP5cdDxpbOqOgJfFHFxal0h7aMn8uTEoKf8un8CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751208327; c=relaxed/simple;
	bh=50naptVv5s/TjZg67luS1eqO7P3Zc5AAOWnLTHPerZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KprGB9xdHnD0Rzl9BTSDR+ZRSkq0CK/2GcoZSdV9DgzLT/kDYqTK43Hb4qiZ9JNHB8lKonLffWMDVp/IlpP+GJqfvzH6Xmvygejd6Fpu9s2BPeWMld75CBdNIlNBQDTywXVkUfeTQOf9JyPykeoD77uIqwcyLluUEEFLeJZyB3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oECh7iqW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oECh7iqW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDqiak025707
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U75yw7BMC/S6igk0SQ7PlAp8
	c+8TFboIWS9Vq7PTNB4=; b=oECh7iqWHwXVcfgXCPhAZwgrgIRSNp1O4g18tRPQ
	G+cquXTpg7+KbIZ4Bcle76waU/2UcVfVOpAYetxIiGcxg05xJoJptjI1n8+qfQkO
	crMlx/koLGQ6Nzsym5ASCe4ikNAhAp6YQkjnBAR6rvHGoSGnHqRWrn8jh202q/vK
	VVF+5OFC1mgxwRNBjQKH0uEeGPRnaQRZRrkhPDkQypXmPSNIFl7A1j6deZbC5Bek
	ydDRgJ2sYEmcY4gx8V1u57Ea0OKUOJMsM0kiLN2KmtwwXejR81YXUr6f1ayfHRG4
	Wz/h/Y91x3I/O1pDMB+1+VDZpjeDnanG/84dJY3teCxCog==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95ht7wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:45:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d38c5c3130so245816885a.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751208319; x=1751813119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U75yw7BMC/S6igk0SQ7PlAp8c+8TFboIWS9Vq7PTNB4=;
        b=Oo6bj+/npbmFttk8w1Rt/84KcDuri7U3/+Ui1iaoObUSb1dixGXSpxq51WWpV9ZW9x
         JPQhE+LLHWbTvbUZ+tw6+/1WFucN2Kl3JaU6DOpk+vLjNHjijzVEKIGtzjDKzbGn/rgj
         V0n8GXNZDJ6ul1aeQKFYUis1CEqbkhJUITOJ8NMVdjHVGNxhuWqRHKROUCcWWUZKniXF
         2KXRCNiHqPd2855Z6J5+4kyL/n9TQADwEJSujLpf8HcxgC7cRc2xB5lYVwDBaxyTncFo
         /szPSqOMmUIAY1P0xDMNDTWPsMB87aPJs/7u0Mvh1eKAFbjG2HrE6lxSWRV/fJCWXJ4P
         lEfw==
X-Forwarded-Encrypted: i=1; AJvYcCWhg5QNi4aTtXHKR2qvXeaEuKSi3UG+i+vO+0vVCIfOpzagbieJ46goNRjmnrNzWaVNR7Th3a5GMIeB41I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8263Kd+hGBbdU1Bxlnr0vHjGxMHBaR9HZx1v42gTkPqc6dHua
	7TmniD8UF1mqkLnj85CNiCRmlYQH9QZlogTCpkFR7k71LqhU8iTLKBHMKzUhzU0EC+1jXTbKNUH
	fKRd7vrliYfFaIZk1UcgTEHU6vUWhVyUnGV5V4IIo7xf/Go3f1vAkFp103xu2ymA9oJM=
X-Gm-Gg: ASbGncupycxfxpDzIZsQsoC8mgW0FziG3u3Ym4Q+dK2i0iSX9k/v9Fb3vlWxqn2Four
	wodT9QAo6OTHOzQtLPKwUd7e0NUt31nRj5JUWCg0VnMHIo6hLlE6b3FWvCV0MVWP79gjPt2MO69
	s+M1nzP6Er376612P1zGtqApLiEpti6nVRImU+Su4mdJqvNqAw+cWx8qaFSJwkZNc+02GS7sEut
	euBkn1HwHUujATuUIr+3nqqQLo1KEw9na7ia4d6a2C53xgSnyNONgdbOsG07Gfl0oQgZfcEhZjR
	DMP/kdjG5tA16yAngOo6WJllsY7OL3OWiAPx1abDLyfJLo7zeZLXrTt1LqmkIpb/P12yNSTeNRe
	Ir8hkhCcvkhVTlTDR1wV5VPOiqsuhgG5R2pI=
X-Received: by 2002:a05:620a:400c:b0:7c5:5670:bd6f with SMTP id af79cd13be357-7d4439b9679mr1537818385a.53.1751208318650;
        Sun, 29 Jun 2025 07:45:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCYpAnwJ1rYQ1S233FYjwYu4oJCVh/e3dqa7Xz6LlKsV9YCedkRP+JE+l1W66OWbNHR1zgWw==
X-Received: by 2002:a05:620a:400c:b0:7c5:5670:bd6f with SMTP id af79cd13be357-7d4439b9679mr1537812885a.53.1751208318157;
        Sun, 29 Jun 2025 07:45:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2cd99esm1137184e87.158.2025.06.29.07.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:45:17 -0700 (PDT)
Date: Sun, 29 Jun 2025 17:45:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
Message-ID: <nij26lzoinzr3cbfmvwzigtxpsjibaudect3i772swbnmyuz5w@2jny5ie3oqw3>
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDEyNCBTYWx0ZWRfX5sJpb7tCaak0
 e2EdeQAGichs0JqQO+BHDA6tQdfA0lpa7x3nPC2tGDSggBHZj5DKD6/QbFoLHnBdkyjq/M2osvv
 SgzZWc7UEwOR2Pdb5H8rVXMAIsIDmiVrAx3x9p91EtQoJmFy7Kk4qif+gfWh+g7k+rmue36hFHT
 zp2IEIFajRQWgHU63JgNeXP1KkLg1FKCWZC7GyjEgZGXLkthKo0F74GdyaDlTmGH6FZS/HftyCE
 K4HYrOF0FnoU2gv4KKpMTkJE+6+D4gxx6ioAakRzR/f3UMC2FqVwdwS1m8WFXx6colUJIi1hK1A
 kUNxlC9snvwi2CzphawUugqU7hmDtbgVO4cwIOI49/7iUlTB1yg5aueNcRz1D74idTQauxktHXn
 7KmH0Nb22jlf0TD1rXfayAHW8/Ci7W53k0ibWaZGFuBcZN0GCGCk64dF/RSWO/EcwNd9X78A
X-Proofpoint-ORIG-GUID: 2_-BYmsZPa-dBhxxyZJWAbmnEgg1B8_q
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=68615180 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=zVdBlVQdkfp4bBuhmU0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 2_-BYmsZPa-dBhxxyZJWAbmnEgg1B8_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=825 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290124

On Sun, Jun 29, 2025 at 06:58:41AM -0700, Rob Clark wrote:
> These runners are no more.  So remove the jobs.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/ci/build.sh                   |  17 -
>  drivers/gpu/drm/ci/test.yml                   |  14 -
>  .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |  29 --
>  .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   | 139 -------
>  .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    | 350 ------------------
>  5 files changed, 549 deletions(-)
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
