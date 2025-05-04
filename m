Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7161F4606
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 16:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375239; cv=none; b=RZxzaIyWIXSN/stwtukLww7n10wtSIL85g5YDq/hRFJrUiTAHsZ/UR0GifoXiEAuYvGPgeDf3Ke2Vxdqh5N8SlsxtyQg8mH/1sMKAEbW+ZxOwoAGyHK+QXSNCPcJZv0ny8EO915bUixiGVSVF01NgyLYwowh9ApfQM2jQ/9j+vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375239; c=relaxed/simple;
	bh=GoymrrvT+xbHk1nFXIyGwohvSJZVfRO2gKNmW6FLqjE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ChrWQwy5B4PA7iMuf4W2sEOg+oPdNMCtOVlSrd8XZL8QtMF0ZQsGAHvbwxJ9RD1i+ligZAYwLJRrbQ4KOIr/wNLMRK4ZDPamSsvr47ac2T4zbrB/HTYAMPceJCAZsFNyURWJJvXg6fxjW8OUND9l+r2j2nARUdHS58gvXi4F/Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HnA4f4aq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HnA4f4aq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544DtZFJ017822
	for <linux-kernel@vger.kernel.org>; Sun, 4 May 2025 16:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cfdsQNjtgTXSpICV+XJjH/jK4YQyRmRdmbdXbvMbr6I=; b=HnA4f4aqSTGjwKOb
	Dm7vLbj/46k2CAS2BXIF3QnAySBj1MkUoq9Ke52uq3Djd6NYKVmKZ7UYy04UFyb/
	wnIYMx3iMQBCVUk0AuiEQoZkDDtiROZEbyH5xE0sdCFXouASd+UtRVlwto8PY5er
	w8lBtFCDM9B4YvW1NrZWPsIL6RcJy0JfmlC1J96JqF4+8vFsG9l4aVxwK/qm9lLf
	qZuBiP+fQfa2l34JmPWLUI38drmgh5FWAMtZKB2/OZPKbFB9uBIjyqYcUCLzWW6/
	acMx69grj90RVvygiKE4BgKTa94LveXtrYIu2+L7EwZUzMLhbazoLLdoKN285IJy
	Up1cIg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakj346-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 16:13:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c77aff78so337554185a.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 09:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375236; x=1746980036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfdsQNjtgTXSpICV+XJjH/jK4YQyRmRdmbdXbvMbr6I=;
        b=w22wYVXKG4ur75HjdPOHMHlZobTEisN86avLRK4Bdc0VXArPNlKdf3ay12sY6Kp/lA
         2+fFOltDSeFdEXIahXKka9UBxhytAnNSyI81CxBBu4BA0qN6ofGWcZbjTz2A7UbwzAyJ
         WK2BBzhrPiGpFbnew50QVaUa7xilWeO+7y0ZYhvPbhSpMQFzlzuc09/yl4zFz1wUPZJa
         ITCpUUHS3OgWoiRSAobb86gq2Ic3GpbpCszc2q/XEM/UjZBkf48xkZBCKZLnPGYwnHKD
         q3K/85RHX278XKJ4cEwlP1FFS8E7LQPKsj1u8V/odNUPjO9mjEXeF1Ke3VrHwhEIbanS
         kE2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfG7Ud9vPvX09tfGpNMnv3m/VeMRbEu9ulHswa9M0mh4eEUiS1rvqminJ3eU1Nug2M593g/1eMoQQIH9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRWqohLwtKXjvfAliC+XE70n4ryIY4mvdF+IHP5p84JXreUs9e
	sDW1RsEzoQUXvLfxaRCwdWh90V2qvTBpHLm83T+TS8WR9W2Hf52bBSW8pILSNZvwQyIJuLTn5UD
	Z+KCrCSZyodpedPdqAjYsrSfo1SH4KXnaEOqV36rN+WRSL2pisz6ibt1eXQe3eWc=
X-Gm-Gg: ASbGnctVEGaJRVoW97AerKV0QTTG69zx5dvyZ3FyTFt5O3xrmT/ii8LGeFkRDqZNWS2
	HXqWq1mODeqYet4Evl/lLDIQ+PKmRdctoZ3otOB0uJu0V1lUDzohKuqakR0gYtY1x9a5pE3poYh
	dyW8mylOnxaPBPC/rI68qDd3vKqV7ILbNPumYvyT4YknEa3TM5ynVX/uHg3ivKIYTTOrlBzCOjF
	LTGikhtbQBrITSg6IYGQFU0mhNUF4s1tv8xLl9+h3kbldqssZMFGaE30iVSpV3d1K3/ZYZ1UqZ2
	GvZmFJ2m03Uq1lKBl9GdqPsEFtnRTzFFIfjmFTsWrJj+V2DTRHjZPkgTJvY73IkmhQx0CYxmyFN
	N8mlXaPTHtDvTdsFLgq9rJfHO
X-Received: by 2002:a05:620a:3949:b0:7c5:6140:734f with SMTP id af79cd13be357-7cae3a926c1mr607135885a.18.1746375236080;
        Sun, 04 May 2025 09:13:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESd4V/tl84ujiy+ueBS1wdjRHJiBAwRJzy9189FWkkAARUTf7JATItoLt9gDMWQyef3WGC8Q==
X-Received: by 2002:a05:620a:3949:b0:7c5:6140:734f with SMTP id af79cd13be357-7cae3a926c1mr607133085a.18.1746375235745;
        Sun, 04 May 2025 09:13:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:54 -0700 (PDT)
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
Date: Sun,  4 May 2025 19:13:31 +0300
Message-Id: <174637445757.1385605.6744814496349716759.b4-ty@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX4lxFiHrf8WmG
 HBYo/mXSDtnfM0wR1CCxaw2UW3SV1Hh4h5stA6NZDCR1KZur3BKpoTxj+0hCvWBDngctbXJG17c
 gbwdeZfOf11YeeohqMBkjmsYVc8QH7q+yAUQ9te+ySndl3NxKSOSZLoiM2iReiqVBNAUuA1Zf6Y
 zDoEgLPthjJm+BTlGVJDN/bws5n4Q7xB3SH40unnxWmyTTUlAMvZgcVb+psctSTZatr2p2yQX2n
 +Jz+zO/FZ2OkhkjNoTTN+s96J8LlYSHbh+rAM79CPUQ6CE5Ypz5YGnW2jlJ427xCoBfpKdAZMOW
 R3KjIf8AHorY0rlV0IkNQz9i2xZImjcssMf00U0/ankHtkvJZpbJhjadbXATKdhMGG60usCWWw3
 OzD8Zon5VPwJVpS7XVaL+/+Ihp+k7XnacXTLhT66AAVE6I3BhpDWu92go9lhQJ+ymfbhTpF8
X-Proofpoint-ORIG-GUID: HM3mVOIfpNj23PNiMz52XKRMKweW7UF5
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=68179245 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=rcLBrfNTdlfi3Zk1C0sA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: HM3mVOIfpNj23PNiMz52XKRMKweW7UF5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=889 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152


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
