Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE99719CD1D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 19:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751742404; cv=none; b=GenqIEUx3Gj5YLSQ3//riY2g1yQHnu4unDp7cMN5cKzmn4qeFK7ORVY1Gt6aNlsGEIGlCmIPscsuQMu3VyWdbWK+DSeccYR8x53uPTfcamh420MUrHVMR0OV37T16/h/pQd801hi4K8EOVP3VNdG9qd9kzgwUjvVC5IgsxNZ004=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751742404; c=relaxed/simple;
	bh=X7dC+NOnBLlWtaFIwYeWVJ3WUwYs3XkkIwe5fqyKajw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Fo8m3mLW8uPmTdBjhOBW6oilcJdEVY3fkFI+m8XZhkXEXD/LG76sRQmAD9HwQb/cD0wSuhEcLilx/HoRzldntyCQQ2ftzWh7poRjSItelUhzyzqfjV03q22tmo4Vh1YTy7MN2WTCZFIbho12lrj9JGfPhuTnIO+wq3Q0O8h4Q1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGTqI4I6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGTqI4I6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565IQx8L023584
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 19:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cvLOsbSuo6uvQ6cL1qSzqtB/pEVF/AJJTfRB1OmWrtI=; b=eGTqI4I6KeNNkR5p
	JPh3nAqWifmon5wVKoy9wQBrSMh/azaLlVVyp/ka/i4qjYeLVUIBX9d3AVIL2TbG
	iVvTDh5XG3dAzWhaav0oRhqy2/QIm32rkJ3dHIxH+DEAFYKWtHryYN8NZouKB71p
	rxfo+YwY4btKx0mhJRuBXpTSjv87dkrMyFl8kE9IBWx0mXefWzcr3voeIvzclPI0
	cSBhW6ItbTLTEkkfSgtaewl+cDQjr1SseW4M83aZm2waprl0YdppeRkSL8IScLk/
	FqhbIz804ML+8ByklArF2iYxwW9wB3/dMzeXDy2ULL8R6fyOjjeXEmr5j9rfK0Zf
	Ui+W/A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pveesscv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 19:06:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5cd0f8961so358252585a.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 12:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751742401; x=1752347201;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvLOsbSuo6uvQ6cL1qSzqtB/pEVF/AJJTfRB1OmWrtI=;
        b=J/AWdw56/FEbzwiAphMYsBAtu7x0Rye7ZM5p1AdDROW45UcIFhQl9ucPRgt7nxKfVl
         YmNUspZnjwNNT8wPVpFzQXPHN430QwUpMTW6A4JGlj6V/nBWV0HAQSOHwgzCIGt48lv/
         hDNCxgJyNdIdSOaykS+Cz9KArMwWVwhuJOnl3LivbFv+2+eJMaArlXQ2KKmFWneGS8Uo
         Xp1CsxpW31hLflW7rz6iy/NsAaBZ7HFr+qO0fZL5UbspOdDUWwAE/HmEPrdYea/6GUvs
         7ur7Ap4pnAX5oxVg4bsRpXfVQhlBIbvsHSilz8jbUmSRW7xmHUdsM1IPNWcjaCpUkmoO
         koBg==
X-Forwarded-Encrypted: i=1; AJvYcCURa3/WOE6RuZy1tes6cmxXJSlT4B4jA46tFGm7qrA7pQTKqBQJiAt3TWKEUh2VDb23kQg5WIxT5OGc6hM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/J1r6a5FIiSR3mH3vE+BQSETZJ5TVoDHmM6NSJqFMWIHkyTYi
	5Buy+t2vWoPOGVMGPuQGaynyxKhirRjueG3CNOyPAcad5cS088LOyIjRVsQhngULwSerJCwwARm
	x9yXTnKKyrZV9BNqkkfS/NWBx4AuTs8cG1f8agjD2lerz6Q5Oq86zQJF5guLY8KBd4ns=
X-Gm-Gg: ASbGnctMrp6fBBnbHnr9AOQ2ij5mSR00ncaurmIOL0wtetA1ESL2x07SCsM72Htx7e5
	AK4FwzY9KP1RRW0SVFVd4u+PSKWIlzcwFqBwsaWX/xTsqJ8zf658++50+v5+QAW+z1z2EtCF+yF
	Hmzc0wYc4jXmRb5VjY8eumqKgG8hzGcQoOURA/78I4wjZGvO3OX0gNzck3R+QYUSbgebZdgAsXq
	yT3G2854y001uN+Tk9/C7q5fRmt0ebnOjW1yTZ2KwaU3r4k0pvpzSh1Ic85u8jry0nc67/lwC6/
	FmDvj+LlK/GY20lf2e/ILBoFA4tQ7FRNBxwppNyloMSrrloqdZeHmD+29Af8+8yviZCGzf5a2c/
	7ZTOwKpX3rRE27p3wNif6wOZ1NK4HBXV0EUU=
X-Received: by 2002:a05:620a:2a08:b0:7d5:c7dd:9582 with SMTP id af79cd13be357-7d5df13c47emr1024929785a.36.1751742400642;
        Sat, 05 Jul 2025 12:06:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4p9Xquc9XnyhZpWG0dFh+/1C6iIFppdl5Nd3QUa6Y2/gtQoYWBQp/CmhE8Zy+5ZPjaZx8hA==
X-Received: by 2002:a05:620a:2a08:b0:7d5:c7dd:9582 with SMTP id af79cd13be357-7d5df13c47emr1024926085a.36.1751742400280;
        Sat, 05 Jul 2025 12:06:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384a8fdbsm662261e87.169.2025.07.05.12.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 12:06:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250704-drm-bridge-kdoc-fix-v1-1-b08c67212851@collabora.com>
References: <20250704-drm-bridge-kdoc-fix-v1-1-b08c67212851@collabora.com>
Subject: Re: [PATCH] drm/bridge: Fix kdoc comment for
 DRM_BRIDGE_OP_HDMI_CEC_ADAPTER
Message-Id: <175174239915.1825705.12007643724816710087.b4-ty@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 22:06:39 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEyNiBTYWx0ZWRfX8ueiDjX+UUhD
 TjKZTjXxRT4mI2Tj21NqqXaWnZPa7ZxZiCLpFxOkLcvycvBL+jJ/P8NvzTm7zeOD46D+R6ZiUF+
 f6+ZkHF2wAWsVNoyAfdd0KzOYCT/oZta+a5JZmT1LMfNP1j8daM+y8XyNXXmG5T+aTij/SB4Qlc
 2u9le9OAlHPQd4vcvWdM9pRo8ofRKfyXgbPZPa3U1E8znhp1yz3hZcmSDnzWsw0DZQNtZGo6jt7
 pkWsP+UK/iKgq/FMe4M5DRzvzz5d+zeCW68aYti1le9xQyOuaE3g2RoFk4f70KWDcsc803Ncfbb
 /iq9gNeNa5OqmhVEk1SX6EcgQEPbN3Fy4yK4QkweK/6YaEIzcCDmYon5FmIRhQxpeo/FuYq8D+d
 G2CNzRRgeh11x/pMT3yxRNun8o/bsINbeIMPbThWGgUka3np03rQCEYSCJ2LIUjQ0UPX981Z
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686977c1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=wdqdDu6gfy1NOTDC_OcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 4B7z5jTdKEm3E9rI8r84G7In2MfSVHNP
X-Proofpoint-ORIG-GUID: 4B7z5jTdKEm3E9rI8r84G7In2MfSVHNP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=935 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050126

On Fri, 04 Jul 2025 15:10:45 +0300, Cristian Ciocaltea wrote:
> Correct the kernel-doc comment for DRM_BRIDGE_OP_HDMI_CEC_ADAPTER member
> of enum drm_bridge_ops.  This seems to be just a copy-paste artifact
> from DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER above.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/bridge: Fix kdoc comment for DRM_BRIDGE_OP_HDMI_CEC_ADAPTER
      commit: b78287c54bd87924ee328d51336b44a74304d7cc

Best regards,
-- 
With best wishes
Dmitry


