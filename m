Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7701CDA3F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 19:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743362803; cv=none; b=JV0X/IjLQfEU6pEWg8FOn+dlwnwrB5AWcMPeUpsc4fzDeWYhjjtruMGz0cQdOZFr7iFCq3TgZ5wvPVWHGOisP6g4PQSMlWdjhvT0y07lhV5mftWPqPH9pYTFN4Zd6e9l4O5fXBV4qOifWfn58YdO1OEMrBh0+kv9hIYSsRYaUiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743362803; c=relaxed/simple;
	bh=QQjWPiOzm4rZs44Nz9sCrKcrc/xE+dRevyZXJgsSyOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h31f8W5tVWJ1MoTP+4OMs5SCbAlvoKWxwhclZUPK8kUcWLS4WlHaV2ZGJttb96HfJqqZ8IK6nDU/no2QHp3vGyQQmYLrRQrhZlm9JNWMO9UwrEAHceVsRARu9aHkV1NGyHWF6TQeo60jPraWxqtCmQxBLYmsgSD87MbltbNf4Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ki1PSypQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ki1PSypQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UELEGR023474
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 19:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pAHgTy/CACDJNBcxbiqcZgMo
	cw/wyMoGwl1/5JsSoqg=; b=ki1PSypQdYxX22g6f4x0HgB9VJNCi0zLqJxdUL97
	SacGa2FmMl1rO4yXCwd3SsJpWoDgDlR+UB0le2RVqZ7PliEKDVeun5MqqH34kTnc
	3wjlqOi5TGUGFHWL5QaBOZC6NVTn8YnSz0n0q2/FYCMAVfX3SwR1J9xQDm+Yqxc2
	10V9ZNi5ACoB1N1sdbQjyhRQgH05XfPm77nRg9JDEl9aTVt9MmPfvi7slyVTqsvB
	fO0at1J7RajacBB4xNqwP7HEcL+vgaffLzOwdMcPnOisB/s5G+MYNzdVwxPgKhXc
	rFANVRK3vLdKKY2prnv2rsZEWucFTnGyU5Nf5Bq3nvUsWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p86kjrgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 19:26:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5d608e703so701543585a.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 12:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743362799; x=1743967599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAHgTy/CACDJNBcxbiqcZgMocw/wyMoGwl1/5JsSoqg=;
        b=MOSbF7TSNr2wupqgJ2IiSay8EukpVAlMx4Kb0s1gF/aAaM42rCUhonWaLerA80SweF
         X1F3dWfcWZp1S/3nW6B61vAHiLf9hvF9e2MgQTp6gR6cL4Pl1HApOrDB1KQI3a3c8/Tf
         ACFYvRsP/ryI+omrM5LgHJsoG1fUo20efIp1p/iAAPiWfXt2tCuUalvzmijXAFiBZ7jx
         WSCd675qNAaSC4MzVVRr8sgBYPeR5tEEybo1a6xye30bvrHhbUGaYzfcVTdOTXqOmQWl
         IrCUdU6GoddC3Mr8LPYmAIohCI7QqusKmzUsLUGLlKZWmdUTJ71fIdzTyw+9nLF51rli
         JZPg==
X-Forwarded-Encrypted: i=1; AJvYcCUzERzJwTnWQTe3biFKUxa/2s3nRX8pWH3buTUBE/pySlHb8rjYZmgCHZ7Gi9IlOVH0/jkEsjKP+HiiGAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNpBACV6IZywP1RLF6kAUY/CvxOQyZGXFrS+49K2EKY4MCC4U1
	HVbX63iRQzNNniVKP6PBb67z8GsKIfhNYOlpZtvL3xN3WndtvEYRVxcNv0LSgwzPJkvDmPSJsxL
	6IIGgDPfvjPULKdKIASK1rP9/zNXe1KArD5WqgZAcT+O1J65YduSGW4GtpXF8i+g=
X-Gm-Gg: ASbGncvT21MvcBL31S91dVo+RgbLkdZu/8louORHohSxN0zEVQmhJaRRU5xCb6JN6dc
	MqdixAENhOgwERvLfmuhtaTSd1La2e1D8QPDF4NOlcDZ8N/30khY5+N0ochPnyf8n8B56yhwSHg
	bh3c2JpdwDFK6k+AOHtmOueAKHqusBJsPMackkcgf5zbhnDvYbmt/EZVs8UQwHMkOxdcWQYqN5O
	UfQ9/kElrnXE7tD0T4FcmmCt/bhBJNP75/PEdnRgOl+JtcvMTLZdfcRn/zxEyJbOJE6VFv8Sx5d
	fMViVUnrrSOQEa1JbtnDi/VB/JucRdq6jhWZUOIsW2ue3yKjvoq3IYJKF3wXCVx60C2JHpqTyOv
	vL2k=
X-Received: by 2002:a05:620a:1aa1:b0:7c5:5fa0:4617 with SMTP id af79cd13be357-7c69087cc6cmr977665985a.40.1743362799743;
        Sun, 30 Mar 2025 12:26:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuzwPAeNbLcInRyGKSU3ltKyTKZ5JZ5WGJJjb7Pq+vWyVd70VYxdrssavMwtCrSJhB7YhpgA==
X-Received: by 2002:a05:620a:1aa1:b0:7c5:5fa0:4617 with SMTP id af79cd13be357-7c69087cc6cmr977663785a.40.1743362799399;
        Sun, 30 Mar 2025 12:26:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0959f429sm949528e87.212.2025.03.30.12.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 12:26:37 -0700 (PDT)
Date: Sun, 30 Mar 2025 22:26:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org,
        mperttunen@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, dmitry.baryshkov@linaro.org, mripard@kernel.org
Subject: Re: [PATCH v2] ASoC: hdmi-codec: wire up the .prepare callback also
 for SPDIF DAI ops
Message-ID: <yyxqg6odzlac2434kmzvjccguf6cehhotat2m6r4at7o2ldiuh@rl7y2vv4hetj>
References: <20250329191433.873237-1-martin.blumenstingl@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250329191433.873237-1-martin.blumenstingl@googlemail.com>
X-Authority-Analysis: v=2.4 cv=W8g4VQWk c=1 sm=1 tr=0 ts=67e99af0 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=mK_AVkanAAAA:8 a=EUspDBNiAAAA:8 a=rfKdTcLzpojuHggjPigA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-GUID: hSu4-l0eGVjwPWaoNdGe1-4JLfwPp0CC
X-Proofpoint-ORIG-GUID: hSu4-l0eGVjwPWaoNdGe1-4JLfwPp0CC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=787 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300136

On Sat, Mar 29, 2025 at 08:14:33PM +0100, Martin Blumenstingl wrote:
> Commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare hook") added a
> prepare implementation. Back then the new callback was only integrated
> with hdmi_codec_i2s_dai_ops (which is used by the I2S input code-path).
> It was not added to hdmi_codec_spdif_dai_ops (which is used by the SPDIF
> input code-path).
> 
> With commit baf616647fe6 ("drm/connector: implement generic HDMI audio
> helpers") the DRM subsystem has gained a helper framework which can be
> used by HDMI controller drivers. HDMI controller drivers are often
> tightly coupled with the hdmi-codec because of the so-called HDMI audio
> infoframe (which is often managed by the display controller).
> 
> To allow the new DRM HDMI audio framework to work with the hdmi-codec
> driver for SPDIF inputs we also need to hook up the prepare callback to
> hdmi_codec_spdif_dai_ops. Just hooking into the hw_params callback would
> not be enough as hw_params (is called too early and) doesn't have access
> to the HDMI audio infoframe contents.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Changes since v1 at [0]:
> - re-sending since there was no feedback


Almost forgot:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
