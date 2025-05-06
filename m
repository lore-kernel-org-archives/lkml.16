Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372F728001E
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535614; cv=none; b=LsTjfSBZZjDQ5R3OuZ6Pyg2Xqb7YhP3u9VVA1NHGv7IN/djPIdjZUBcj3icm5z39MCSEGzap6bwQv1F28dcyCU6RXoJbFmrX+E+9q6WJSdBXLjp3mGB/E+4zfCRrB73r1f+h2lMlxyOHhudluPP70l5cJrhyD0I1PVJAmvfYSoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535614; c=relaxed/simple;
	bh=Ubg3pm0aLhZbf4HzZ2NSGWxjDGIhYaIAS2X5T0oE8P8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c18iAVbchNEdw3CgEpM+x/ALnenW6ivtJVFRzRFAbE3xbNkBNAl63+zLyk2o7h4R42wMLzIXEsKB2sdwV+Naz1z4JO4mqL0kMfqDcmzN+rvuQoUpzvoFdvE00WvdZUiQo4NT9i3ipRBr08AFibiTHF+GsjHzXgROgioMVZ9JIBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fla+2EY+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fla+2EY+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5467taHe017779
	for <linux-kernel@vger.kernel.org>; Tue, 6 May 2025 12:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s8LAgxKHfIowCHbl7fHsltHs
	WVZDZpIwWU6cSSmyqww=; b=Fla+2EY+PqNbfYLWCRaDp2Vvig6v/swcKhM/0j+Z
	HUkVAAxEy3W6RkZYMqbhKad4VYwjYeJng0Mwr4kp/NR8CAKRQZhd4NgigNSN71/G
	n9ev0anIsNBm38sUl0d5zJuybwAhZPyc94mlRN9ppWe75bjzWAoyunDVoy1B9j2i
	7k82wYLkYjd9u9tiusZaeta7TIaM+eoV6Xq0L+hGBwsqSgbODOzK6mFy/Kn8gqVj
	LTYNL3FTTNJE3GgAkTnihJ403S5/GoSRdgHd3unEmGBVuczUEHAk1cJHqejOUyYd
	RxtKqjWFErn9sezC4Q+3/BwXvDY0ZSYdTcphXQOJHBBA3g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xsx4ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 12:46:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5cd0f8961so1216667285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 05:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746535609; x=1747140409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8LAgxKHfIowCHbl7fHsltHsWVZDZpIwWU6cSSmyqww=;
        b=SYETDkwVOipRHbGAhjUhosO1Ue2HQj1M1pmfj5VrShRZdESOvVagQYAVHPFOehnkEJ
         vhIjI0u+kJep4wyLm8WoUlTQwp32JuaTT3aaWf+Ux2/aCjpc4PzZPQwm1qV4fUPdhLQo
         YPffKVZwFPNQ86Hk+lifamVOtc6+J5IDl9PFeO6a9/ofKWsDDk7LaMeFlXEaernFCmSa
         F8iWDZaUI/8+qMF0jmVOpYGS0n2up1Do5+LJ4QF3REqKetyDCEfD2Gny1ge5+AIXiSG6
         nv+wVdVne/Z2wytBXx50wuZXj9BnokRruhsrgxe48qKPISz48O6WLHYABVMMAU+hu3wj
         gCzw==
X-Forwarded-Encrypted: i=1; AJvYcCXQlkk5lfASSOl936tvPGlRDd3W6Npy95V9I5Li+uzqI7HHzVGH+CgPcQ+LoAXxMrEugQ1nesSkVaQwyx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOj3wQj4ICSlDmACQnDmI/jDiXnDB7kEq5mc/H3nXWhkBsuSa8
	Ng0z7G0I1ZpgWH7M4NMjN/2cjAA1uh+9DoGPX+02nkH389vYAF5tXNJi9217isce+ti2kateeJ+
	zwRB/oqNC/8FsuZ42foLVVNijfVeov4dap+Tp8r5pH9WEjTDLVvNmLLjlEr8uYXc=
X-Gm-Gg: ASbGncv1O/O90gT12PHiUDedurmpnLgN6YbblpKu1Fs0902uH4UI8vyMJBnJLVTXud0
	nQkLPrDZGFJMpgt+jwsXUQcHDecbXAwNirZm3Us9pzjJfMtYN1CvL6DSGx1xkwG0Kmxbt1A9gyQ
	qcSDfgpj4nF0CVHCpj2vcZ47PuoCT89iBElvzTI74ZybCDVNBazuds69MWER/rp6iuTrGcidd/s
	6y5yXLI+w4rEevcn+Yee0BJ/LCwkxOjz2sj+rMF6w9uoSmp6QryUgCQJnW6IXVxg/SBBIgpmuUW
	6l1FdNKYOinwOVEUkDEiK6oZS4c/UMudDhed4dgvT8bOd1bjEdoM11BO84vDZRUcSMDmrtxUHWE
	=
X-Received: by 2002:a05:620a:4711:b0:7c5:5768:40b9 with SMTP id af79cd13be357-7cae3af02b7mr1660806885a.43.1746535608885;
        Tue, 06 May 2025 05:46:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyWxuua5BKalkEEhM5qbCvvqozj2lmbbu0fVhfw2+KWRFUTmuT0ZnbNYEno4TVgRYgad0fwQ==
X-Received: by 2002:a05:620a:4711:b0:7c5:5768:40b9 with SMTP id af79cd13be357-7cae3af02b7mr1660801785a.43.1746535608440;
        Tue, 06 May 2025 05:46:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202a89ef28sm20222291fa.76.2025.05.06.05.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:46:47 -0700 (PDT)
Date: Tue, 6 May 2025 15:46:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/33] drm/msm/dpu: rework HW block feature handling
Message-ID: <fqozl3yxbq4lxdhdadsuhdbibj4qudungmgu6za37qfkwq7yti@lhfm4gz6r4cs>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
 <342326dd-3739-4a8f-b83d-fe21bb67b46b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <342326dd-3739-4a8f-b83d-fe21bb67b46b@quicinc.com>
X-Proofpoint-GUID: wRAZPFafVxvdoG8sP4C8h9hVEGyCb_sW
X-Proofpoint-ORIG-GUID: wRAZPFafVxvdoG8sP4C8h9hVEGyCb_sW
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=681a04b9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=sMkIdjRUvVsnaBxMjLAA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEyMiBTYWx0ZWRfX8u4k6TRDrVcq
 ogJ/PcPXKn9hOCiG4uydDgRLa3m76bTFfvVZB7pmTMYI3iwUZYNmJjssPobZRHmPmcPzUWhsBH0
 nQyDzN31/GYiu2CfDCjf2kui4iH72TGwAieUn5FMg+DE2xk7KellfBjvuecSqOuFKsS1YzMDLqb
 R5OQl+uK47deiZ5oMCIiTBoykcV5NWp/Dy8wyHAjXvbxmyhZUlO7aKcpYYcapMMtRAGJJ1/rN66
 BO23cn4eXrv953qiZz1oRbd9xNIBZmDi+78ezBN9jz15tNM/MYmQ9DPxcZNynhpUly0dihkrgdi
 fR9rpPYjIa+vZDVzr1tUwWWDIqJz6SYbAKDAyQtUi6Mr29o99Tv4+9W5LrBGsoN04mJi0PskcPm
 up2f01KhVCY3q+2Blo4+kT7Uar6KaPyURiYedD7aAbIlMBSTerNl0IJ1IkNfa0bhaPByx3HX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060122

On Mon, May 05, 2025 at 04:28:17PM -0700, Jessica Zhang wrote:
> 
> 
> On 4/24/2025 2:30 AM, Dmitry Baryshkov wrote:
> > Some time ago we started the process of converting HW blocks to use
> > revision-based checks instead of having feature bits (which are easy to
> > miss or to set incorrectly). Then the process of such a conversion was
> > postponed. (Mostly) finish the conversion. The only blocks which still
> > have feature bits are SSPP, WB and VBIF. In the rare cases where
> > behaviour actually differs from platform to platform (or from block to
> > block) use unsigned long bitfields, they have simpler syntax to be
> > checked and don't involve test_bit() invocation.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Hi Dmitry,
> 
> I agree that some features like *_HAS_LAYER_EXT4 and INTF_INPUT_CTRL can be
> replaced with a general version check.

Great

> However, for other features (such as DPU_MIXER_SOURCESPLIT -->
> dpu_lm_cfg::sourcesplit), it seems to me, you've just replaced the feature
> bit with an equivalent catalog field.

Let me drop it too then :-)

> So while some features can be dropped from the feature flag list, it seems
> that we would still need feature flags (in some form) for others.

Do you have any other examples?

> Overall though, I think that dropping the feature bits makes it less clear
> exactly what features are supported for which chipsets and makes it harder
> to relegate features to specific chipsets.
> 
> So while I do see where you're coming from here, I'm a bit hesitant of the
> overall move to drop feature flags for the reasons above.

The problem is that we currently have two ways to define features - via
the MDSS version and via feature bits. I'd like to get rid of that
duplication, especially for those features that are really tied to the
MDSS / DPU generation.

As you can see, after the refactoring we had only three feature bits
which require special handling: DPU_MIXER_SOURCESPLIT,
DPU_DSC_NATIVE_42x_EN and DPU_CTL_SPLIT_DISPLAY. With the Active CTL
being merged, I can easily rework the DPU_CTL_SPLIT_DISPLAY. I think
DPU_MIXER_SOURCESPLIT can also easily go away. I think we are left with
only one feature bit - DPU_DSC_NATIVE_42x_EN.

I think I can live with that.

> 
> Thanks,
> 
> Jessica Zhang
> 
> > ---
> > Changes in v3:
> > - Repost, fixing email/author issues caused by b4 / mailmap interaction
> > - Link to v2: https://lore.kernel.org/r/20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com
> > 
> > Changes in v2:
> > - Rebased on top of the current msm-next
> > - Link to v1: https://lore.kernel.org/r/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org
> > 
> > ---
> > Dmitry Baryshkov (33):
> >        drm/msm/dpu: stop passing mdss_ver to setup_timing_gen()
> >        drm/msm/dpu: drop INTF_SC7280_MASK
> >        drm/msm/dpu: inline _setup_ctl_ops()
> >        drm/msm/dpu: inline _setup_dsc_ops()
> >        drm/msm/dpu: inline _setup_dspp_ops()
> >        drm/msm/dpu: inline _setup_mixer_ops()
> >        drm/msm/dpu: remove DSPP_SC7180_MASK
> >        drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4
> >        drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
> >        drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
> >        drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
> >        drm/msm/dpu: get rid of DPU_CTL_VM_CFG
> >        drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
> >        drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
> >        drm/msm/dpu: get rid of DPU_INTF_INPUT_CTRL
> >        drm/msm/dpu: get rid of DPU_PINGPONG_DSC
> >        drm/msm/dpu: get rid of DPU_PINGPONG_DITHER
> >        drm/msm/dpu: get rid of DPU_MDP_VSYNC_SEL
> >        drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
> >        drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
> >        drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
> >        drm/msm/dpu: get rid of DPU_DIM_LAYER
> >        drm/msm/dpu: get rid of DPU_DSC_HW_REV_1_2
> >        drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
> >        drm/msm/dpu: get rid of DPU_WB_INPUT_CTRL
> >        drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
> >        drm/msm/dpu: drop unused MDP TOP features
> >        drm/msm/dpu: drop ununused PINGPONG features
> >        drm/msm/dpu: drop ununused MIXER features
> >        drm/msm/dpu: get rid of DPU_MIXER_SOURCESPLIT
> >        drm/msm/dpu: get rid of DPU_DSC_NATIVE_42x_EN
> >        drm/msm/dpu: get rid of DPU_CTL_SPLIT_DISPLAY
> >        drm/msm/dpu: move features out of the DPU_HW_BLK_INFO
> > 
> >   .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  53 +++-----
> >   .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |   4 -
> >   .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |   3 -
> >   .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |   4 -
> >   .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  15 +--
> >   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  19 +--
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  19 +--
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  12 +-
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  21 +---
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |  11 +-
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  43 ++-----
> >   .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  45 ++-----
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  31 ++---
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  19 +--
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  16 +--
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  42 ++-----
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  14 +--
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   5 -
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  16 +--
> >   .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   5 -
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |   6 -
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  44 ++-----
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  22 +---
> >   .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  50 ++------
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  47 ++------
> >   .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  53 ++------
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  47 ++------
> >   .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  52 ++------
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   2 +-
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   3 +-
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   7 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  51 +-------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     | 134 ++-------------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 108 ++++++++---------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   4 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  21 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   3 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     |   7 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |  10 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  14 +--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   5 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  28 ++---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   3 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |   5 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   4 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   5 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   2 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |  11 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   4 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  17 ++-
> >   51 files changed, 304 insertions(+), 864 deletions(-)
> > ---
> > base-commit: a4efc119e8149503e5fe9e9f7828b79af2fe77c6
> > change-id: 20241213-dpu-drop-features-7603dc3ee189
> > 
> > Best regards,
> 

-- 
With best wishes
Dmitry
