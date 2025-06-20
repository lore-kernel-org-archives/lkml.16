Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28591DF25C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443243; cv=none; b=ZmuonE04F8nNSOp2C7rTkeBuNJKvwIWLwPr5LHwfLzCiid0qW4XzAXjJjFf+Z19MCdXgTVeZMucyKaK8VQXHtb6IZt10tV4QGJgoo+LaWAUkLAnQfB7YG4l1a8ZIFgR9Zz5ZI0mCzIbK876XNr4e7UsUixl0AKPdyZ+hBP1eIvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443243; c=relaxed/simple;
	bh=O9rMUb8dJS90DJ6roaFWV08HwXxZs4iuT9JWlNh1E80=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FvL6mUlqHFU6Ztp4uiT5cQgtdLGRhn2BEkI81vpBmJZlPYWlrlmc0oU0SigC2q0JtbdE3VYQPbUI06uzWxlz5P0N7uMA4RgNKfvEMNfkfsL8xK7zBSWV+H9KgQnN1PJBgvtHuPllNY695ayTREugT1llsoxb4l8S+Okn75cM0eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UkdN/irB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UkdN/irB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KHUod0007280
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jG+tT6iYc7a6QUyEAhUjHjnsvAkz1ye2EdBIx/ExqFk=; b=UkdN/irB8eMnJ2NO
	0jKqzAQYkjVmkjPwzGLnd2yjmhC6ai+LAD0gYtUrCOK8BEwRvqqoZR/ugLxYiVuX
	9k9jLWr44aC3OHxETeTlhAm5+i8CiiOz8ZilzWSUj7Q4JnCemiVtWuStq45Huipk
	A2+GSGi0whhqnkJ4UEP5TzN7Q/5w/1yuxrrFt/OdGIICQ5+CmHrvfC6J0/KF+aSS
	0YloyFiwf30ppri10MrRtHrzhqKNyO8yu9zt9UQBThQGIkh4AnV5NWIsl3e7YfQ9
	MsdHh5fl5Yox+G5VF2uNNL4og0XshRfyaWglpdIwx/PjnaavMahQY9VnybmUaRgI
	ERE2Ng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dc40r4ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:14:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d097fd7b32so425395385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443240; x=1751048040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jG+tT6iYc7a6QUyEAhUjHjnsvAkz1ye2EdBIx/ExqFk=;
        b=A8OBsu+7g00CrdNhVCrsnHkJFQKnDeK5A7a3B4VLBUADSZV1G9rEZKd+egu2247AL6
         Lu4YdxOvbxIghGEI4INfSnW3Ef6kY2JDepLCNOcwa1tDdQ+1pVc0HGMTqEt27X/TbijR
         tx+JZep6cHc//FK+0idgfuvm1n0HHxatMtNemVrkEXrCLOooSLPprxWxc1644MgHSddc
         NsKfmA8ZMFnKndd/eZC5mLBhVJFLHxa2n7GVoBZqS+cpEio3T1ckGcjPmqQGg2ov62/T
         dcZTpAkq7F7H0cohc1xX82XkHtoYY2ORTphH+vtRioX13NtDItlM6hudo3jzNGKKqUng
         97LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxmkQSnacxgCRvj1Eod2j73ZS9ea+/cwj4j2h21tq+HIhxcycRjmdE8TuwqIwBHC7vlopMs47ZB4MjDlg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfhUklXlWjeUD6x2oc9gOjH0bJ2AvlVrEr/ZsATRqpQhC7EQTi
	h6T8zUJBkr4W+OARYdCPsYCu+P61UElUQ/8CjTYvpgNnA8ETWDbML5A2DUiKakRoiIQz9BkF4az
	ECrfMABhn8kyEFawi44O6Mnjp+6G581OPbL1lPzExNJ5Q2N1Z+NUOtKGTNY4V+dFOnU4=
X-Gm-Gg: ASbGnculfbREs5z2IDkSfuKdDUnIsM+1W8kQg7EmTgVugyO3N9UvuWqOmOAIZMeIQuH
	JxWpaYzExdcQaaNBVUL4vvdXamFI8MHWOYdbpzNUrf5HTJMtd5TqGXO3anET/akjfmyNWSe++Yk
	7Ggu01RUW8Ixl47ayvhVRfWZLQtZI5yhoKQgByHBwdDz4MoN2Q1I51NExd5EAEIaNp9MKgFPKZt
	CSI6xhOge3aqU2KAg2vd15GNn6pggQFITPzdEHJCFJkKcXDXwaMwNz/6U4Qxh5VqWZm6v8BqTxJ
	nB88ZuIjnFpN63R1E6P+Zfkg+c+cHB2TLUcy4p7zpdj+N6MSwGenBzUoG3ETSaubfOrxLHT+5ol
	N3nzl9BC6h30FZOEVNdDNKJS/Clb9nYI4LWs=
X-Received: by 2002:a05:620a:f12:b0:7d0:a25b:d04c with SMTP id af79cd13be357-7d3f98c5721mr607832785a.9.1750443239578;
        Fri, 20 Jun 2025 11:13:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrRvs8vYgSxtHBNL8Gik6EafDnQeb6cUhaJFFn4yZST6SpGSMyqxM73JI0IZzDqbtPeAIlXg==
X-Received: by 2002:a05:620a:f12:b0:7d0:a25b:d04c with SMTP id af79cd13be357-7d3f98c5721mr607826485a.9.1750443238988;
        Fri, 20 Jun 2025 11:13:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e4144306sm363384e87.18.2025.06.20.11.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 11:13:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 00/30] drm/msm/dpu: rework HW block feature handling
Date: Fri, 20 Jun 2025 21:13:51 +0300
Message-Id: <175044313810.2014621.9717827153141285782.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SVRCNXxTg6bYzQS5qZP2ZnvPRa8x7ag_
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6855a4e8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=KLh1uqfzAhr9BImysYoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: SVRCNXxTg6bYzQS5qZP2ZnvPRa8x7ag_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyNyBTYWx0ZWRfXxxydw/IvSiiI
 jW1LbJJ0Jm5j9Hp4t+X2eTJIOkBUSIQK3+Se70PQzAYOndM9cD88irCMZLFEnaJ6I6Z9ucHCLqv
 r7xWt4dyfak6mrlTUIEvzD92w1HfVZ1FkVF3lkKeE5qd+kY1tUWuunokVxCnc7+BbXTK0FZ1BmZ
 CbHQ+cvGU7DlMRbzhapXtTxAPmdRGXZDT9rjRmcFyhnJig1+1fGlA/xYEqLjmQDTnspwzcWDc1f
 6aWpQe2Mj6dl1NnZiyTOvJpoXBE0PGuAHgB6+pjnmjZlSkTUkD/GwdXBGGJwVI9lqF015rzdiCd
 sFxFcr8vCZ48X62pxSQMhkJBkxlnXTA15JwcJNfaAnb+sJeyyW49HAFxXo9KGSeY2tSCDP1alKJ
 j2anXsXNsYetqVkdIl+IkiRkyFBTu5qR4FPS2pEvXdRy6JbQXCcfJkHWWYmMCYWJum4vEhJL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 mlxlogscore=825 adultscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200127


On Thu, 22 May 2025 22:03:19 +0300, Dmitry Baryshkov wrote:
> Some time ago we started the process of converting HW blocks to use
> revision-based checks instead of having feature bits (which are easy to
> miss or to set incorrectly). Then the process of such a conversion was
> postponed. (Mostly) finish the conversion. The only blocks which still
> have feature bits are SSPP, WB and VBIF. In the rare cases where
> behaviour actually differs from platform to platform (or from block to
> block) use unsigned long bitfields, they have simpler syntax to be
> checked and don't involve test_bit() invocation.
> 
> [...]

Applied, thanks!

[01/30] drm/msm/dpu: stop passing mdss_ver to setup_timing_gen()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5d25efaaa327
[02/30] drm/msm/dpu: drop INTF_SC7280_MASK
        https://gitlab.freedesktop.org/lumag/msm/-/commit/768d87108f24
[03/30] drm/msm/dpu: inline _setup_ctl_ops()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cc34e7f8d8a3
[04/30] drm/msm/dpu: inline _setup_dsc_ops()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/155e4d05136b
[05/30] drm/msm/dpu: inline _setup_dspp_ops()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cfc1dbe27f63
[06/30] drm/msm/dpu: inline _setup_mixer_ops()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d01d027a6ae1
[07/30] drm/msm/dpu: remove DSPP_SC7180_MASK
        https://gitlab.freedesktop.org/lumag/msm/-/commit/64558d6ec1dc
[08/30] drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4
        https://gitlab.freedesktop.org/lumag/msm/-/commit/40b7aa8fb641
[09/30] drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a1c5eafeab9b
[10/30] drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a22c33cb4ccc
[11/30] drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
        https://gitlab.freedesktop.org/lumag/msm/-/commit/91003d9f8fb6
[12/30] drm/msm/dpu: get rid of DPU_CTL_VM_CFG
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e479fb02dc72
[13/30] drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
        https://gitlab.freedesktop.org/lumag/msm/-/commit/39890da06970
[14/30] drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e7da245a3402
[15/30] drm/msm/dpu: get rid of DPU_INTF_INPUT_CTRL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9db68425f24c
[16/30] drm/msm/dpu: get rid of DPU_PINGPONG_DSC
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d521c4200c94
[17/30] drm/msm/dpu: get rid of DPU_PINGPONG_DITHER
        https://gitlab.freedesktop.org/lumag/msm/-/commit/bbd131f1e095
[18/30] drm/msm/dpu: get rid of DPU_MDP_VSYNC_SEL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5094aa5474a2
[19/30] drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
        https://gitlab.freedesktop.org/lumag/msm/-/commit/820405f6e2e6
[20/30] drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b14f7c55b079
[21/30] drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5b14c003781b
[22/30] drm/msm/dpu: get rid of DPU_DIM_LAYER
        https://gitlab.freedesktop.org/lumag/msm/-/commit/36beee41c4c3
[23/30] drm/msm/dpu: get rid of DPU_DSC_HW_REV_1_2
        https://gitlab.freedesktop.org/lumag/msm/-/commit/27b1a01fcdb8
[24/30] drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a88c80ecb442
[25/30] drm/msm/dpu: get rid of DPU_WB_INPUT_CTRL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/fa811f768713
[26/30] drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0709ec21abcf
[27/30] drm/msm/dpu: drop unused MDP TOP features
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0ea9f990c352
[28/30] drm/msm/dpu: drop ununused PINGPONG features
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a1e42a921dee
[29/30] drm/msm/dpu: drop ununused MIXER features
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1f783bf4f8f9
[30/30] drm/msm/dpu: move features out of the DPU_HW_BLK_INFO
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c70c860fb00c

Best regards,
-- 
With best wishes
Dmitry

