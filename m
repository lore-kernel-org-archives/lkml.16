Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B583C0C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 02:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745633217; cv=none; b=NDDzJ9eAcCEF6tYFirYx4eZOIsb8rzGzr8Dt11j/xLP8DE6gwTCQZ7G74IVYyoACXixj+NIgSSsVJ1eMqt0LEVQ3ZdxjoDNm0pp0jriMAcZ03ReCd6zjOF6aVc3jIrezLtdp4EZXMoFaFI5aazNzPlubJK92a8T6Cicei/Uj28c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745633217; c=relaxed/simple;
	bh=vKddt/shVIWbSOkTrcpAoYFqlwmCIAab9WEJ+OCpY4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FktFXPaYi9WY4NG9HClbvy8cgguv3wTGo2HeO1yPqIm0xowq66sMkQc9Fq8yx3r4U+kfPxlCXgX790plUiKPg9C0TCEhdi+G3kyDBGNW8/0DoobmYTmU21Fs/svOXaNinVmggYDSRiLzRQ5lHzrhb0Bs8n3vKDr/kdC1sEEqOAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVP6Bnra; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVP6Bnra"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJt8I007897
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 02:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hVfsLsmSAu4FPUjKiv9wh0y2
	VuLXMaFjQQMfN0b6AAQ=; b=SVP6BnraL/aN7XzJbJwh/h1hbwgfAQOU5e1BKV8u
	MzrLGiNl4rVNgwWz5osi21AB4fVMxDtxzEAZ5hCvNepmiAv4XKbycK2OPvOPDSrX
	lvIfFHt4cQ0aMyVl5G3cpAvAwwYtGoHWhYX7F47kvvvt2s6yk11MkFgzRmU8rPRW
	7M0E0mmnmZCOclUZgxXxfBlde5yNA5oCZYhRUransiflieLwMSFDJBJMSjbfn4hK
	yLjBpfQZ5cufjfgFEQcijXaqHzBF2bxZs9vSWlhcx0oPZeOCHwn2Tv2ibXzWMJph
	hGoEx74f966Om4lvBicTHtpDHRDXIz+6Jbg63FBnebzqKQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2jsu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 02:06:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2a31f75so892013985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745633213; x=1746238013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVfsLsmSAu4FPUjKiv9wh0y2VuLXMaFjQQMfN0b6AAQ=;
        b=g1WgAkspDpkEOUnT0cDw1aFR0nOYioi54sF/ARII4Ib2mS3U90a22rTgjfKIjS8DHr
         5VhDHe/qhTuu99r3buQi+ydbC1xauE7uhrE63VAqu0CCcAgadt5n8JXJx448152p9BgG
         cShUFevNfl9+eS/myEo8TvH+vYMmXW57CqreyumnZJ6nopZLfUlp08AmGKKupQJaGqlv
         6sCCbI3DbGUJN6dkL07eLS43s2cmqsTtTzdVQ3HBvYKyW/38pczLfL00bhKKTI/re0b7
         z0xttHCMWZv6qEW6Nk5uAsZaKqkEAEIm4cICgaOxh32ZHVZzxrS3sIpAJi/s7U1DIFYx
         C7zg==
X-Forwarded-Encrypted: i=1; AJvYcCWvB8Dts1nDpgKDm77CIObjKWgLsiNqJW7gWmJnFkAhFsj+8w4ljbgbdvtEll8SMaVdUsRgr6agFsbxx40=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw97mt6PxFkJXKqZLR8+q7CJ9OVa7GjPWPFC8UengG794SiRYi3
	Ya1JlJW8D1Y6d4zd/bQtgW6yJ3uo03Nosf/gF3sl5sINwLp1J7PY6jFHZl7cIZZj4WljQQpmqGy
	fxqOapjgwLaQAmPwL+yaoVOc+6m1jIWIoHIFBByktE/u4qycwHjR4sVzshFHq7OTCCVIW6/M=
X-Gm-Gg: ASbGnctqABLc5ZEh6/wXvKcJ9vdjbFocEwHMS2fC7cip4tN45OIGE68ZBjm2J0TX9Ar
	mJN2XEyEK4QZXp4XEe/p8NokQ0viFK04REu7tyTPRJODb3HVEMrNZdZFtfPEFP5cL662m3YPcy1
	MnhaOCjbYqSETwI1iDoxExYdsF3OrPuWcNXcDzbiglQl2kHUJ29djF/4uhr/9CBh3C0CNjCtZFy
	fSsxwRJORea2GTfnoXHmdnAHeiyi4EEjY9PT9tg12OdqBKce4p9uz1nAurT2Mu/LrMzp/6fvo9a
	ju3Mxdyymm58O4gqtQLOYWU6jNZnq1NDekHXj/Go4jLtkqde1DLqEBGrwpH/U+9E4J4CiVZnoXg
	=
X-Received: by 2002:a05:620a:1905:b0:7c3:d5a4:3df3 with SMTP id af79cd13be357-7c96687d640mr321885185a.34.1745633213169;
        Fri, 25 Apr 2025 19:06:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4SMUT4h6GsDQGdEqaKfY00ULbElXli4PoIut0Y6O7SlBmj8y5hZZQ1GnqVySpZeyf1n/gHA==
X-Received: by 2002:a05:620a:1905:b0:7c3:d5a4:3df3 with SMTP id af79cd13be357-7c96687d640mr321883285a.34.1745633212842;
        Fri, 25 Apr 2025 19:06:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b96e80sm9809931fa.103.2025.04.25.19.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 19:06:51 -0700 (PDT)
Date: Sat, 26 Apr 2025 05:06:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/23] drm/tests: hdmi: Replace '[_]MHz' with 'mhz'
Message-ID: <t76t7yilgl4bwzwgtnjwl6f2zjpgftbk6g5gdqu5yzqq7xa4jk@cyan56ziptk5>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-7-5e55e2aaa3fa@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-hdmi-conn-yuv-v4-7-5e55e2aaa3fa@collabora.com>
X-Proofpoint-GUID: l3wdzTwFzfFDSzMrv6lCwxZnX9VBvqKe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAxNCBTYWx0ZWRfX1wC0f7DGe6dQ f0z6/iIcVFpueywZPMoAob/C+V2zIA7LTjG5d4ls3c6/QTp3sHrMyzPdUaLlaIwXwiPQAQbEX24 C1svlEXv1UfcT4e0Qlr6NZs7pWeYy9Fb27GTx0zMmb1/gx3Tbs0eaDHSPGIL7il4kjCEc5/q+0H
 5F1I3RNUCraGkgkNYq5Q2P+6RnHmxjGlXvsbAHszQ5X1itqFpJ9hkezpPW8YEPZlT3cekIp95fm /bD64IeI1XELZFrfOwhMD4L2IvuyeaUfenkl7rJDHdopsY5rBn77FcOQ7w/l8yE3+yZrpUS7MtF bgkPUhu+ORogyBCJmNjAhA6bprwdWouyPKtLjRlu/Pm/dtjYxr4jxqKexb1Ks8u1Pwck5JDjuoP
 hEHHgnlyVFHnhBLyzdcnQk0Xk+BFYPP6c7sCXOKoeinhvgKHXg89T8UCHHZ92nBFodlXIPd2
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680c3fbe cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=UTU-KeHaearOzU57cusA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: l3wdzTwFzfFDSzMrv6lCwxZnX9VBvqKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=827 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260014

On Fri, Apr 25, 2025 at 01:26:58PM +0300, Cristian Ciocaltea wrote:
> Improve consistency throughout drm_hdmi_state_helper_test.c by replacing
> the two occurrences of '[_]MHz' substring with 'mhz'.
> 
> As a bonus, this also helps getting rid of checkpatch.pl complaint:
> 
>   CHECK: Avoid CamelCase: <reject_100_MHz_connector_hdmi_funcs>
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
