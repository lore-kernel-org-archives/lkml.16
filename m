Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA6E22F01
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746455188; cv=none; b=Zyvbjo4weeGBm1tyrC5nLAFUqu/kf/Fu+fSQSM4CxWu7yhK0vuB1s+jIeo2ZOyDCxA0Y7y/lxwd3ZbFU4Hv+zqGLc7+w/2Q01CtUzli5u4HAjerv/EXJScBAiSmSck8Dfgrot/muIxfTSkiZKpYfRzRyZzqJ6Jlj1F+w9qu/lOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746455188; c=relaxed/simple;
	bh=QJs5+k/qrBs5cgN7eO/MR/BelasA36UFUZz1dEKH+bU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q4oFEFo9ULYnnakyGZci2PoCHauQ8neZx8LBE9QlPmy2Vjgvh5hKOp2o9k5L8HHQPF7kwIxmgbH+fSdwfAD7LFOaSJsqxFTIK0XL1lwnsReySG4jcriWbNFYNOWmvwTWt85+Usi3DCilhasf0Z7tmU1kyM3M2OZ/03tPko3qML0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UR96SL6e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UR96SL6e"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545CTl8v006487
	for <linux-kernel@vger.kernel.org>; Mon, 5 May 2025 14:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUuUX8bIcyPlPuoPDbT04z3jokr92aiRh0rQ0I5EFxU=; b=UR96SL6e5gPFzkXA
	odKlmcPqeKK41JVxUf82jk//dsmtkYSa5HknVSNgzHAOjwsMkfXcZLC87mqYYI7b
	fKFwJhpAWdHtpEWLgBXi+6uSOYndtTRgIvYSR/MNzvDmUYhC6EZkhWjchi4GXnul
	azXI2GoGYe8SpUEE3e1T8tuCeZahsR/vzglHnO+TcoJxQpax8BPjaQUkCO07zZsQ
	OQ3cdGKI1orl3EqwA+Mw9+a4nR+ZQhZ0vpspTeWdR5+CGl444OKWsaZQQS7LVpNS
	FRGFUJft8cqpRT2YQrGA1iDA9E2hGvBVjhPxJ3yJ4F+wp9kICXpUQJ1tsKyT3OuX
	0XSOIw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da55vavd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 14:26:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c53e316734so783645485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 07:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746455185; x=1747059985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUuUX8bIcyPlPuoPDbT04z3jokr92aiRh0rQ0I5EFxU=;
        b=SG8TsSy/40/m8VKxGwcHRVQzUbCetCGfTxkNiEuIUQopxlqe0Pzb3KFHHksRwWume+
         0xtebKG/UaL7jsxTaeIWF4Ie6Ugi/y1sXac5S5asQ8k9jiDvHe+3RNwTg+9gpldxiExb
         Zr/pMnAC/arIdLYgdocrSmoJ8irw3jepfJz2UK7G80PmEQlxRTBl32rqWMCnhzlJmM8X
         idc+01Sa+bCaHFJfEqinf26ERCByFEXARM/9EwyOQlSyOFezZBoq4h3gvPSuAutUgPH8
         plLUo/oqUxRSCFXZSvx4PLcuhDm1TuKcrq4ncUouz7/sk/yRL9Pg3T7TXoQRf0BtoxGq
         IYLA==
X-Forwarded-Encrypted: i=1; AJvYcCX6/NIkHlQfBDiXxGt/i7hWxQY5Zoh411B0VglgO+1nHlFdfsPwD9OKy85YU8lSGpoi+rZM5Ax7BuGlqPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgjnnxwWk0eMfFPsDPwFRNJgvnmwea2JWXVV3+PssXRsQC1y7E
	BJgWWtS4K5bHzyPp7reaR3Vw0TO+1OXJMIq0LwIFYEJSF7KvHdBF1rmlCpxnKg/Hod/92CFC8jM
	yRJK3p7WoYS9O96Vy41xxTmOSy1iv+vJWvqzLtdpIlEhUJbnUJtqUQZvlrd8f9so=
X-Gm-Gg: ASbGnctg05E2sln3MTOqoUmWLff0v/9qmbFsxoKk7PAN+Ur9+VgKjttmoUE0CibZXiC
	8iOcWnwnmsOxaZjgt/Bis/6+s8O9s9EFPEs0a7QyygLhc7fg0dLWofu72TwjRqLGjq7n0najavT
	B+UyW8tvBVFTN5ys2a/MrpMDhnjt5pQ9mqx/MNydM6Tvc+NGAgpFXE8pkR4iNr+BVXkmg41Vz+3
	kW/4YjJhHth206qmwchwjQ3C9SdaMRlwiBjyuhpj77jW309B2V4bz3s/hX3ibrpa7QNzhSZn91/
	ldF4uui9O5Ji0jrrwfY58x05sCCH4iMwdW05tKWaXAX5puwfA2Qi8VbcEfv02CanwDnqctX+bHH
	Nwylaqg5o0rBHsAhX4FQaEwvd
X-Received: by 2002:a05:620a:4711:b0:7c5:5768:40b9 with SMTP id af79cd13be357-7cae3af02b7mr1068083985a.43.1746455185104;
        Mon, 05 May 2025 07:26:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH96RuYp8rf3yGAy4C3TKAyGKugvGUg3+4xADJwkHYt/kyUMmED6s/qSvsMF10QY2xjxR0J+g==
X-Received: by 2002:a05:620a:4711:b0:7c5:5768:40b9 with SMTP id af79cd13be357-7cae3af02b7mr1068079385a.43.1746455184728;
        Mon, 05 May 2025 07:26:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f17fbsm1726765e87.170.2025.05.05.07.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 07:26:24 -0700 (PDT)
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
Subject: Re: (subset) [PATCH v6 00/11] Add DSI display support for SA8775P target
Date: Mon,  5 May 2025 17:26:23 +0300
Message-Id: <174645517266.1455227.14417676448478997955.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
References: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzOCBTYWx0ZWRfX++eDjxlR0nru
 nKmqNWAIf0jeBOEsFw7SXNZd+882pvp1C8mjSuAWRjXrpbLhbcmb83PCGox6wPV8tKH+lyJ1vEX
 02WVHhqmgYBH/hGRhDTEDRWBEPIx/21wMaZrquYRI++EupLh6f64r0qzfkuEsZTky5TUTQaew5k
 sy8UoVtt2GeL5bT+z+5OLZtAlcDXo5/QNawdMrR4gnI+nVEGl1FHU+3KqKv1ao59lDTsW7UtUTY
 PBPRN6B5x1m/N54OvYEBIxsYURulHLZoy8dA/iYDn0jGOEfrRoagkrxLg6QZi8l7OZj4i+293b3
 gvuDxf7szDB7ioqTJhDL9XHiWmzRQVfGclYwpgHH+rvB6/pVfX7gqybGmpGnuFQ8xsir7f0jtaY
 BOdTtfEf2daJU1PF3gHqy8YjwieNqabVb/Pdnkm/rJAMawRFW8HWQSiXT1ej9i4zV5RftF6G
X-Authority-Analysis: v=2.4 cv=M9RNKzws c=1 sm=1 tr=0 ts=6818ca91 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=-3-qUcdfqlWSZcId2SUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: zPxbz3sHMrXildmeP9yOJtRJaH7Hm8hH
X-Proofpoint-ORIG-GUID: zPxbz3sHMrXildmeP9yOJtRJaH7Hm8hH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050138


On Mon, 05 May 2025 15:12:39 +0530, Ayushi Makhija wrote:
> This series enables the support for DSI to DP bridge ports
> (labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.
> 
> SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
> The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.
> 

Applied, thanks!

[08/11] drm/bridge: anx7625: enable HPD interrupts
        commit: ca8a78cdceb48ad3b753f836068611265840ef22
[09/11] drm/bridge: anx7625: fix drm_bridge ops flags to support hot-plugging
        commit: 71867e8d88fc7f94c2e47b3cfd676710c120cbe3
[10/11] drm/bridge: anx7625: fix anx7625_sink_detect() to return correct hpd status
        commit: 366ca0bcc953a4a8a9c9ce2133e6843730210049
[11/11] drm/bridge: anx7625: change the gpiod_set_value API
        commit: 50935044e58e563cdcfd556d62f27bc8744dd64e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
