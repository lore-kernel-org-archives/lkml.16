Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71795275105
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652338; cv=none; b=CXBG1Y+U1FnrhvJa/FPHSS/yCjT9M/ZPzH+YV2bRGqL1FjUjosML6Nw+FkG2qjGNq2dMRGmSbtPrnnq0dm2OwIrE0wcddTelIcQDgPFMIvNB6OCpRAT7wyyvspclkHevgX64QFR6F9+USeqPFi8aNPVYx8j/IBhKwEqjPDem84g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652338; c=relaxed/simple;
	bh=k+dXzlqMIg75u0mEM2Z8oVwbF0JGO6yHXhkMZsH6N+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rs/V93eBZ0zuFqy7ZXEJtkA2ZlnAs106ZlvLcN7lRYfX5VO1XO2dNmeWc+CYilmzUe8iR9GYcjVSMi7+bOZqGcz7zUe1ySQWRPh8yIf44vTUX7O0Fq8Nb1c8LM02SIWm2Y4ZJCpSsOfcZpk7T5JkGNfStlgikU6xJS6hHRcdxfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SHd7AOVs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SHd7AOVs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J4FdMi014725
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	86cBgxAbBj1uawgk6dKg3/xrbG+UFcgr07uuksYBAN8=; b=SHd7AOVs/dj+b+CH
	C0DqMZTpuZePwmK8MfQxgGgSX62LuWE60uRxDKBJXXvPecR3Ouc9yzNv2R4TaL0T
	yycGhVWuYVoitxHTUEZ3vGsGRjSQMekr6lXAtrTC+qIPAcy2307UcnuOEBm5+X3L
	RbqlZMGaH7Y0DJ0tvTygIvDw/o65/Qf0egGyymBhuegpGq2hXUljiNYr5+YC6q8m
	qgWXBxAjsPDDWC5JvcEmoLpYA25AhBOKoA//7A3tPt7AiVftM9kOcu5eqvdU69B0
	igmNlV2HsNiP7goxxfQ0yhsu3Yr3xPmJSeCiqVPwE/FoZE+c0X3585kMF5jsMbfD
	tm1gSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qwenh5at-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c7c30d8986so1403809585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652328; x=1748257128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86cBgxAbBj1uawgk6dKg3/xrbG+UFcgr07uuksYBAN8=;
        b=sZKSsVeSVKTNtiIOhAlfCY7g3MaVPHsSDKlrwSDQ56bBK6i5SmydVgDT9xjeyenuUQ
         NJjV8CBeUsfDmuqzqzvivZihhUpl5bwXDBWrjrXhE6Tky9DTXbvdQH9RiFkWLR1Rgyck
         GqOz6vDP24g1KdcgWhDElHtAiH2NWMcqUsGO55BWY6CEi3YiOrHO2i5Fjxpmuwcum1sS
         v0WS/PvtrCVKy/TBSeOPcSS7mjbnjzjfW3Y5VYn/of5lbqUizGkkWBQ/Cvs2VJrPJW1L
         Oh2jFZz4i7VJcbGjGDH0njClzAorzZAH/2tOz4VwcoK+hxxgxxB+3pqE6EOmg4xY+5Fe
         POrA==
X-Forwarded-Encrypted: i=1; AJvYcCWV9uXWMEegRGAqVEi4hdAf3ZDLPHL8FvbiHmaBWUENG6kmPBJ4DiQrZLoii/ydzmlli8g2C9f/ScdiGG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsQ2Ye6YnkOXGsMc7DZ+3pbSh0TSSVDqfbWqhRHaFUOl+XtlqH
	a+ewbTkNnAOQSUXDO8bTBUi/3ZOZzSwn/O9rJfTUmFU62DM184ceDNjIr+MQt1t18p6/Mu1SMRe
	NlnsJ0TEcLgU0pHpRcq7y4DoXa6Y76q0tmR0Ko+zrRtgfHhk4F3fW6Yi9gRM/PvU/rLU=
X-Gm-Gg: ASbGncusOMyEQ6yPAhRZ71s6hkqxdsyz/z2HBAMHmbfUcbUaoN9o0UlMYiDeqK+RFJ/
	e1VMDwlfuR9AqJPow9uz+tV1D+b97Qsk/9iorCqGWaimdWViBE6f+6r7Cwfh/gL3FbubD/tA0Ju
	m7Fmh3gacnszysVzfYLudgc6lHvt2M/ylCu+ghRu13Klw2yCiuWV1AK6T/JdUJZKKqhBHK6o5yW
	lpoTv20Vb7ug0YozDcUzhcUMhTGeZIoufHLP4inkMgD8DeYRK+0wIW8WPP2O4Y1Dz6G+EkehQN7
	NpTPZf37bt6fH5WvYTR/DjRD/OljZXLyyh7UBNFUqWJgDYTp0zX0gS0mb7OE+HUxaWvwz6qZIWX
	8bnu5QcuL8i/kSpW1VKtty8Pb
X-Received: by 2002:a05:620a:248c:b0:7c5:562d:ccf4 with SMTP id af79cd13be357-7cd47f0004amr1688584685a.4.1747652327984;
        Mon, 19 May 2025 03:58:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC0Dkz5uT81kjybYAt3wNQ4m8l4BP7fLJQGKLKFt5m0JWT/MZxJVQhBDzIpWZrb3G3Vyxmbw==
X-Received: by 2002:a05:620a:248c:b0:7c5:562d:ccf4 with SMTP id af79cd13be357-7cd47f0004amr1688580085a.4.1747652327658;
        Mon, 19 May 2025 03:58:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/7] drm/msm/mdp4: rework LVDS/LCDC panel support
Date: Mon, 19 May 2025 13:58:33 +0300
Message-ID: <174637445761.1385605.15776598312432418446.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: plnceyaUQ56XHCy8SZJDFwId_E4Jqqgc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX5nugZP0IddA0
 6LBodZQ89anPARZp3VbPF0Bc3OI/omXZSCVsdsaF7Fi/o363qwHo1vJM8O8kYIjDFzqxn6PkmDf
 CCdPmujE3AOpElrOazvKOJ77JD2Lz+Z1X98vKhPfPNGvWIpmG+BAu0ykIzf7oHvsKCpW5G6XDs3
 60E+erkfSK2Xv9DU163O8+As3CBz4j5BJr5uy1GLTpOJaWWvvKjH+7RQbUrMoI1EhARAmcBmFHr
 b51X1krCuctAEi38z+1O0eE1pGcwgksLcApZyp9RZx+hD6HMFttMXMRV1V3EgKptA4CNd8s8Kip
 jrpKLqp0vi1qr+vSBwXWdzaxPXbBm2MVWPfUINo6tuySfOLRIa0kVkhlJLJK/9GIyF38E2fvp/y
 aI4d3Rs4m7wSXSsuVNWK8kfn8/SRXrivhjCpLo6oNWwNsm24kZtknKaju/Tp6Rll3MhMah8P
X-Authority-Analysis: v=2.4 cv=Wd8Ma1hX c=1 sm=1 tr=0 ts=682b0eee cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=JuEGTYreKb10gHM5aT0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: plnceyaUQ56XHCy8SZJDFwId_E4Jqqgc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190104
Message-ID: <20250519105833.DxuHVyq_cGppRS97WaKb2tsDkk8Lzyg_Cz_JEYngD1c@z>


On Fri, 25 Apr 2025 12:51:50 +0300, Dmitry Baryshkov wrote:
> The LCDC controller uses pixel clock provided by the multimedia clock
> controller (mmcc) instead of using LVDS PHY clock directly. Link LVDS
> clocks properly, taking MMCC into account.
> 
> MDP4 uses custom code to handle LVDS panel. It predates handling
> EPROBE_DEFER, it tries to work when the panel device is not available,
> etc. Switch MDP4 LCDC code to use drm_panel_bridge/drm_bridge_connector
> to follow contemporary DRM practices.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: display: msm: mdp4: add LCDC clock and PLL source
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2f1d131147aa
[2/7] drm/msm/mdp4: drop mpd4_lvds_pll_init stub
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f6720d64d8eb
[3/7] drm/msm/mdp4: register the LVDS PLL as a clock provider
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9c2f63da6a70
[4/7] drm/msm/mdp4: use parent_data for LVDS PLL
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b641bf534cf4
[5/7] drm/msm/mdp4: move move_valid callback to lcdc_encoder
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f26b80359bc7
[6/7] drm/msm/mdp4: switch LVDS to use drm_bridge/_connector
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9b565edc44b6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
