Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA722278168
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652342; cv=none; b=qEtc3fCB4V802PT4SRzGL9uCJnDBcA4uMlAMWI4nMQE3dagmzhk4XmI++RqEUjI8OAr/tbGFrHlR5XtvWImixXhrHoifsRnbYTQDQoKSQZx+JaLZUxAPrNPl4Gk9xeTGUkHnjDXfhKjGNTd/GC/BzBxoh5tg7s2p0hzJzwwJKw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652342; c=relaxed/simple;
	bh=/ICdIgsZCLiFOWiy0bHvTki2ux4cADLvJoe0Rkr+3xQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vs/xGskul45iYPPVRARUcLaC7MnjwdzXAqgmCtiqOOOhFXKdaagcM8gbAEG1FfxFHEgtHiwRKjkY9Yfpu71lWL6CGYHojZSOuu7wHgZJnPGybTcSReDM05MOl8IEryKoc1ANMXrk/EvY46Xxmkk2ALv0LjXurh9tGveipYZjcD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BAbFS1rh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BAbFS1rh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9wKDb030233
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	omTmMTjzao8r/tsXZJssyYTmJfhC+uEyAhGGLwohksw=; b=BAbFS1rhNBHKavJV
	qSL8Xi0XQedgmHLHnjQrAA2mpxyN+8g7vZjXqbAyTUQVko1fCGAwMRQUMGT2x5zE
	h3QJhpKHYYVE505gslaJSZ75Yrm+Rr4o260q/lhhut4d7tjdX9K+J7SyAZc3tz+R
	9D5ludfSKKSxvQ3fOT9tNFAVJYvh4cLu+ElW95pVo5WAZtBuzWjSVFbL5g+IyvXi
	IEYaBr6jkSYf/aWoKx79L0tJjpJ4YINTa0xxqrqilhYmdBksto4j7a/Qi2xHuSiF
	SeiMFoCkzONe6ic+gM0S1MJwNQ6DIUBm2lSZc65ynOUYQlPFQdzuBA+YxNU828Xd
	QUiUXQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4m24x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8d3f48f35so21492336d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652338; x=1748257138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omTmMTjzao8r/tsXZJssyYTmJfhC+uEyAhGGLwohksw=;
        b=il9WE5XzsYODJLRBm+l2cpGBiELgQ1b2EkwN4QZA4WURUC5Gpakd6ATKNFQ77eU+3e
         n6nHt1QSaSEJ5BmOpQakjIwtq+ovmL8ruxc72y5eZCYhoqk3uLoG8xBJQQgt/2xuQPmY
         NWgy1yBaN5X1OVdj2bv7tgW1Okmxb81nlMhJwoUbPJNM5oNvrizp1BYuGgCbQ4xqq13e
         i7aVtYCM6OK83WzMjgy3VlowwI4My0M16WL/EbLIJ9dogiE1rc+mEo5FTizFQPeniWA1
         aUgl1wfipmca1PwzX0A9nsnMAymXldImgQFlMG0+C2rVVevV8qtaRAVwXJe92Z3GeAun
         Waxw==
X-Forwarded-Encrypted: i=1; AJvYcCWu0Jj+JzjXMHPdwDkOLlFp99ccMLSs7+T0QYQY7PccsOxkhF0qKgiuXCxSm9n6rKXWfVoBrgYai1JmEOY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1srSpJfpYFw45dwJ5kwDse0EGN5qpVOdr2VqKThYcfrfy+9A+
	gO8DLY8b7NqdUDMxtorfHYxy7WImJMd/KKM5hVK/SBbrTz2v1Tqxb/AjUPvWQMiIkGqaHQBDEvn
	5IR8aRJhA/q809MFZwcZsdjkxEj158SyuIc3XkiaTMpq56wwg1G1DMXgetL42jjypdDE=
X-Gm-Gg: ASbGnctJTxalqTHEehvd+bdyqElEMhysfu2EjvJEvwYMn87haA6kMw1e6DaSenL2iB8
	/ffH55pVinkqL+n67fMuQo95RMKBYR2I9xA5XiAGIDFq17sDV9H6XwokGtDTZPH9n8whbyzjmri
	FcFoVtHihXm0SzPd73UHpzGJB5FVzNpE4CFAmqMbwidjK3oaM8bbOmrpyS7Lf4Vppd0kw8nz5Oc
	fogvdQhjteLA+sa/spco21DfebvLbE0flGWOrf5LcRs7hJbcuyDRNUDmnSDR7OOsE1KRlTwmS5V
	0BgYJEMAoJpIT68ZexrC4vwPp97L4P34QxxpjIPQ/GWYmDtZaOP0CBk1wU7cgd23UnrcUP1siSo
	mEnnpoxCt1SeSa3Duxkp21pe0
X-Received: by 2002:a05:6214:2403:b0:6f5:421b:623c with SMTP id 6a1803df08f44-6f8b08c007amr242240506d6.25.1747652337408;
        Mon, 19 May 2025 03:58:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5bupC0i5Ur09/y0jWLEVLMby3ucut88EMhL3xZ/vKxRnjyojUQBjAnzwYO5Ao3ovyMv0MKQ==
X-Received: by 2002:a05:6214:2403:b0:6f5:421b:623c with SMTP id 6a1803df08f44-6f8b08c007amr242240186d6.25.1747652336691;
        Mon, 19 May 2025 03:58:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/8] drm/msm/dpu: improve CTL handling on DPU >= 5.0 platforms
Date: Mon, 19 May 2025 13:58:39 +0300
Message-ID: <174637445763.1385605.3424290525961139531.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nSGyj5wt_3bm-SI6deMlv-8HrLfkTwl2
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682b0ef2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=eF9K9vx12itGwMwpEy0A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: nSGyj5wt_3bm-SI6deMlv-8HrLfkTwl2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX7lA1IcvOjRcb
 q/yX5J9SeKq6OsJWpVruVk4z/DC/JEFPVtE1Z4w7JAZmIYsLKVsw9Jqaye1F+mhLeyPAYfksTaH
 gyxfryMqOZ8SKfU4OlDgYZJTIJYwyjP+PSoFMNuXouf1umiXRTRAvnl8EQtYKO4z3gi6FeBQIQd
 7wp93kAfvRJVSZ01ggoXhQyewKFOh0SBfUC7vlcgT2Uy4PfgIGcYhIl9fWuoBfsB8Zpw1tl4M4b
 3XSxST0X+pFoM8vWvjdpWl/4J/60GMTeU4JMUTgoDxhPRuNIVos4GTR3/OBJZ5JX1clSLeEjdAz
 q1NUwJAAqcgfOrSRnHA10t0FVBdKvRp8tS41Jdhkny5vcgXgKHbPWFF+/Kh+/rgwGxnywbBm2ie
 3mXbEnt1vBsCX58TcO6GFZl7/TIw3rB2U3PuH2ZC830i62YQslV9X4k1jPvfvgogjPucxh7m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=788 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104
Message-ID: <20250519105839.G31mZdyMiMUSQU19ps3B-K9mdJjRlI2pQepRt6BqS74@z>


On Fri, 07 Mar 2025 08:24:48 +0200, Dmitry Baryshkov wrote:
> Since version 5.0 the DPU got an improved way of handling multi-output
> configurations. It is now possible to program all pending changes
> through a single CTL and flush everything at the same time.
> 
> Implement corresponding changes in the DPU driver.
> 
> 
> [...]

Applied, thanks!

[1/8] drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE register
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ef595c04e843
[2/8] drm/msm/dpu: program master INTF value
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6a013b60cf44
[3/8] drm/msm/dpu: pass master interface to CTL configuration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/696707d3d22c
[4/8] drm/msm/dpu: use single CTL if it is the only CTL returned by RM
      https://gitlab.freedesktop.org/lumag/msm/-/commit/df99bdfcb2d5
[5/8] drm/msm/dpu: don't select single flush for active CTL blocks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e93eee524bb7
[6/8] drm/msm/dpu: allocate single CTL for DPU >= 5.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c1824a7992da
[7/8] drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a2649952f66e
[8/8] drm/msm/dpu: drop now-unused condition for has_legacy_ctls
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1fb28a8a984e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
