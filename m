Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED76C278E44
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652343; cv=none; b=r5DgQs1olMq6EQVR9K0W1IRDW4XfKKXkTwoBQYWoHE1CQTPumkbBom6Hpmd83jzOwnTjblKrsO0N3hyyiQlc3SNZjnvXM8gpQpgj7R/KWPFLDeFLfm3MDR4S51kmL2m5s1uNxyYGwL8j9C6lSu7fCgSSYYZhXG/XAkJLRQw4K+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652343; c=relaxed/simple;
	bh=GoymrrvT+xbHk1nFXIyGwohvSJZVfRO2gKNmW6FLqjE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tCZnYTObG2nOThH+mIrs1ET3ywluRODhcE/jWJYiJSvo1Lc/4cP5To0PeTY164bdaljqdavG24V4KcloTBFl6Dg0r/Oh82xsWNkPQomvdIFDxN3yedgrv8Jr0Z/LnIGMCd4nIYW/XRVrTW8chV1EiC+oKyjsPk/cMZElgGoG8Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZM0tL4dc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZM0tL4dc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9sclb026191
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cfdsQNjtgTXSpICV+XJjH/jK4YQyRmRdmbdXbvMbr6I=; b=ZM0tL4dceR9ZCazG
	sqyUNVptegjhUqnFXtVaK7AwTemiMq+jJw+hd/XdGG0puVGEWs1zMuzPD3ev6BEx
	rNhnRh2j2Fo2r2aLqlVHHU3jsC2WNTDQeJUh9m2RKioDejVLpC7UKoZHKtA9N7SS
	KLRt1qH30eHLUloaKE+FbvolX6Wd508DVmPkjqWveb+Cxf5ocZGat0B4lM8imiav
	1mJ+L9tdn7qbaZcnvsyaR9dMOFSH+y5dpjTpJh6fofFzyLdyvCEw428UfabjSBUU
	KQ+gwoSwxDMQCNjP12/IJP2f7KpF7QLYuFMEBJAzfsj6VnJ2TBRYffQZVdRBvjYw
	xfkTQw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsv29w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:59:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8bdbd9174so102711816d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652340; x=1748257140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfdsQNjtgTXSpICV+XJjH/jK4YQyRmRdmbdXbvMbr6I=;
        b=YLxD9eBQlMCmsoigYkSCNC91F2D0KOKOPs23KaYpTKOIMiMkYJw1+Ws0xOj8nL67Al
         T8T3UELbX/T6rsGKaQfqj3ekFmOdx5WVohmmd1EesIyqTKX3lHx1tsoPZyNAHRxhydJn
         lRUUKzZj7q4U+MhRXU4dYYpsdLj2/w7bUyKenH+3bHjuM9yw09tqVfM9OkOCFvIPlPlD
         i0YB5OMYgWU5icPSFBhY4wj1d518sn5FMBrzqi2CqoM8QfmIcyxoBvLU8kKF+GPPh6Lw
         dG4YrH6jY/bTLJmGgTSh3PrOj9lWTDBTWoGLsQGD5WihGc2nbemmLZpy1IDhdrrZjtm3
         4Seg==
X-Forwarded-Encrypted: i=1; AJvYcCUcuQ+dLZp7mPwIsEts3n+QuL8qtTZ9N/sRFStCp170inAmgMRR9FXplMJleqmrCefxqhtQ9RdtR48fk2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAB2oghkcgInKLULKALcfvslpI3HeQEJCpuqXuz1ZoPOwWdR5h
	BWweC5Ya4MQBSU2xx4fwKe5wELvenV+36+3z9ZYSBi3ITtcOtfWijWJ4UIxnskrw2eEul6oY+ui
	C0cIQzcr9Gy7Tb3eagaxpTGjWvtLmh7zAGzQtaFiDsV4Z0MGWhZ75z6yLQn9rANyHXX0=
X-Gm-Gg: ASbGnctMwHeHFC+Vxa0/TJqO2E1BSN6l9HzpfnGShW1J74bCeBNMvcsOcZl4ZJEBF3l
	TZXurDJEaw/pdnJkjOktT9xYPujwHc6YzM/JVYJ0B0zQSnw49yjVCpF+/rmMZShdriumF12dM1R
	1IJ4mD70ip418F752D+zVwfRt55U74RxzmCmvF2/YbvTBgfZ82pFwzJ4Fjzh8GaJpFPqvIhzprd
	IjM8h4szIC8EOIA1BmumESixedEpzwKzUEuejFIFD0U5CMLjvOXoNJzvpnVXMt0XgyDt4t6AcHU
	dq5OpgmB7e1uNnneP+hdfwvOjFEdDdhXVxcHlbAnngQA7Mc4wtV32WP/ipomqoKBV5OtbtjYUM0
	NG2+RvsZjllhFl2h/zcZGXzvW
X-Received: by 2002:a05:6214:230c:b0:6f4:c8cd:abcc with SMTP id 6a1803df08f44-6f8b2b4c46fmr199871466d6.0.1747652340165;
        Mon, 19 May 2025 03:59:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHk/hpb7Fq8p+Ry8/zX3FWlj3myX25sykGI8jSsQ75/MuBj4A+SB9ODTHYvgX68XGn+AB8INA==
X-Received: by 2002:a05:6214:230c:b0:6f4:c8cd:abcc with SMTP id 6a1803df08f44-6f8b2b4c46fmr199871226d6.0.1747652339748;
        Mon, 19 May 2025 03:58:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: Re: [PATCH v5 00/11] Add DSI display support for SA8775P target
Date: Mon, 19 May 2025 13:58:41 +0300
Message-ID: <174637445757.1385605.6744814496349716759.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
References: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: irB1c5vsxR9IvmD2JTioAZRMHKZKsV1e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfXzKFswzcotsTr
 L2hxOSCq7NaFBh3xLTL+/IZWFVjybruEgRAshDQYk4/RfaHTJVRtTKwjibf/rVx2s6wK6bOQmJm
 LsOOSOH67/LJKIqtlEBkqQ4nWQV0JB+wUAusIeeeUhJSVYa67Zy5m3angfxcQbJscOfK4oT5Wrz
 19C6oxurMC3qWub3rtaDnIBpC7f1FhuCoRQz4EP4u9e5NqQ5lbUX8hvJajVS7UvEsLgZsRYE2ne
 6LFya6QNw+rKzKPqhub9EqGhaOG6r18QMrSC04F7OJFcr7FE0bzIyLTX9Vy9bIrXw2qBEMW8TiV
 lIsIk2oS71FCCKzH0tpTjGTb6dHtCbnaZqWzVnnfeVfUIes2F3V93AbxYCg4iv65zTyNzrDprlI
 MWGOYVHKvD7Q5x3BFy6lEKxdcVFsSMaL07lF05wtBLXtP0LTVLtAMJRYgdgqE16caphZaYwy
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682b0ef4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=rcLBrfNTdlfi3Zk1C0sA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: irB1c5vsxR9IvmD2JTioAZRMHKZKsV1e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=901 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190104
Message-ID: <20250519105841.bBKnzaBuVJmvYroMSuDyaUlfSlVKqbTn-ouOtlvox5Y@z>


On Thu, 24 Apr 2025 11:54:20 +0530, Ayushi Makhija wrote:
> This series enables the support for DSI to DP bridge ports
> (labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.
> 
> SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
> The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.
> 

Applied, thanks!

[01/11] dt-bindings: display: msm-dsi-phy-7nm: document the SA8775P DSI PHY
        https://gitlab.freedesktop.org/lumag/msm/-/commit/850e13b65e3c
[02/11] dt-bindings: msm: dsi-controller-main: document the SA8775P DSI CTRL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2a0195b94cbc
[03/11] dt-bindings: display: msm: document DSI controller and phy on SA8775P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a6f2524f4d5e
[04/11] drm/msm/dsi: add DSI PHY configuration on SA8775P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d3979192fac5
[05/11] drm/msm/dsi: add DSI support for SA8775P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/249a965c3759

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
