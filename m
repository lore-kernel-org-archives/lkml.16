Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1554274FD4
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652336; cv=none; b=VU/dXEXx5qr1j/yOOr7xLefgj9yrdCps02hYwzvTCznXjVheJRu5md0FYU0dBPeAOA+t7VSlEZCnyNc0Nk5soBlJeUgMF+HpitEBxxxuSXE09eB4+uQYhSlH5W+IQmzGVmSlK4fodIS3xrcZ7SrS4NCbWqxOKjCCUr//y/4Yda4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652336; c=relaxed/simple;
	bh=ZCNOXoTXOG1O0zfWSUHeh8dN/NL3V1HIw6cRpzkclyI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DNb5+Ng1InROMsCijPMQAHQaAjwj3SAAqlxzhG973AecSzZ+uz6jCtJmnqUWTP6/EX7s+1DLlf+qO2t3/KMK9y/AqdXzSrluPXmftmzgL5z8F0NN+gtEBbpaQ+xi5uHhm0gcwGBYK9nBE/AEVgygMOfcVAHwXko0TxBquz/FsbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOnMGi7A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOnMGi7A"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J7GgvT023276
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oCrre7kyL+DtRhPaevA50uxzh9J+o0WUmDy9isEPb9c=; b=LOnMGi7AgMhX36cD
	0gSRiO2PXSIcgAPfk7iWbavD7juGF26n5lAygIki2uGCpAuLp/2LM+b4GXjvQuan
	f07iPfqbhI6AC4yPL2qPlw+ttfXFrhDL6lHsdEVBeRRyVmPF/8bAad4RP+2anlJl
	aSwCfw5MTZNyImYcLxRYJ3YSuAOd6Vb/smc7A8leVjMASOFtycegWclgVOIE1xlp
	bgQBCAbq2EWgQ9WfYIHiHwTub1zUaf/VdyQagJkEO9QDs5JOi2yY6ItiAq5chsGT
	SY1V7VsRn/ANaVC2zdZjyD2vsN6gjSUk726J0it9hhn3Pq4KFAF1CEE/HmOcC2r8
	vqfwcQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041rn4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8df8d4585so5274936d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652332; x=1748257132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCrre7kyL+DtRhPaevA50uxzh9J+o0WUmDy9isEPb9c=;
        b=mWtZ0i8+yi8j+TxGXCTfqb8vxqISHvG9kiWbfvTWLT8CiiyqYFDJDAEvlY5NgSHWil
         VsXOmoQ6ZI577TgICzDFwvtVUl1FpAvILQDPoVWKYkX7AoevM5EJgusJ+j46Gt7f40rS
         J7JLLJTu1atLRsR4tIhHpQjZZHLaMGxR2vaC+nEXufqzrCV8+1Ys4zE5yflJpY7/YED9
         vc+FJ48dZBQaHiH9J1H9n/uF2mLM86G/wXrZ3d2/PVfj9fJ2E2AHRZrzgPBG78cdaKpA
         enWK7sWZFsbzseLNW80LdelwhM9br795CqvwqRQ73jqPBFrxi0ZKv0r0EKmJ4vN6yBSZ
         XlhQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3HQuplGnCBZQDp2cfgrNkse4VxMK3WWB6F1z/IsckPkll4XXSe2XZV3oKnGUSUA/yqLWMG+HG4P2cOg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT7TOKYzu+OUj/hUbQzPmxvfjMuWkvAlymNCxH1/46s/R+y5E3
	NTtnXelYs9ba/5lNDE6l37F9t3NlvRpOdiwR52nir0fkwREtTbp3VlEoQiso0CqInmeIAbqlr0Y
	oDUwYvzjXFq1ka4Ibplj/EkitNnSh9h06qt0XJvPoeei/2aGRIi+uUkCzeWJCJHTjw+w=
X-Gm-Gg: ASbGncutW5eGbvQdLQpTOJdxhV0mMuEz0BiJ/YVV7IQiCuB9O0kcIe65fr9nrkde/XZ
	5HE5MxmG0/zEGVRdWyKRncwf0XQmkLfoYVSVGTC8FiwGHXMePAiGi9LvuZ1v4hjlEk1kIyOWIF4
	ivcPmpy4PMatMUCEx1XRaek8HPPiVho6hBlOD0GGEyxlHr17zQlGLb436+ze2+NC9Pi1BEEEkW3
	+OojxD7Omx8WoUQhSAhIdaTJLvTanVhSdmJNVifvSJcYNXpYvk2QSVApZYD9/X7xitCFx2AiMzs
	uDj4vc0tF847Ql/msR8vy0CqHNlbqkyBrpw3N2+gD+Z/Cth9b9XjE69mz+N5/IrOd9yxYqpEm6T
	vR3DwyMeHLZKJ+h+IkiMpJp6f
X-Received: by 2002:ad4:5e8f:0:b0:6f4:c15a:62d2 with SMTP id 6a1803df08f44-6f8b0877c06mr210711436d6.20.1747652332480;
        Mon, 19 May 2025 03:58:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrSoFENNThQFwHFQnIjtZ3G2QfxB92xA08zp06I/ajWbkOSz2fGe+TRkoQyETd6W9zuDBS9g==
X-Received: by 2002:ad4:5e8f:0:b0:6f4:c15a:62d2 with SMTP id 6a1803df08f44-6f8b0877c06mr210711186d6.20.1747652332123;
        Mon, 19 May 2025 03:58:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v7] drm/msm/dpu: allow sharing SSPP between planes
Date: Mon, 19 May 2025 13:58:36 +0300
Message-ID: <174637445761.1385605.4846218535199859363.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250426-dpu-share-sspp-v7-1-6f4c719e373c@oss.qualcomm.com>
References: <20250426-dpu-share-sspp-v7-1-6f4c719e373c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMyBTYWx0ZWRfX0yCnsL8uH4ym
 wJoiBYsEImMK0xbtI2MkTmsHrozJpoqJvFGM2BQ16hfJUBXZcFroLcZZ8b/7wj99zOcKU3Ey5/o
 HWEGewwC9u8IhB2YnK+Uez0AvIiUtk8GklVaB2Uh5RTfsUd5yWop15CKjUO+Xxnc0a6bSZZl3lr
 8kog8OvjW08Cz0YiNorE4R3Y7qtxE3nO/QOJClTnoQ9XGy63sHmDmYklP76QKEoDjUFIspp7Une
 ewj1F1GLmpThGrI32GVNpzucDUqxlheIvIcj/l27PSrOJGjXDTZyj2rCsLxCykqt1oeCv86dhIb
 dFy1fWfyeYmRfNrWLzg3Uq+SXzAVuBdepuobudDLmPzk31BkQvtuH1QJwVO5OlSj/PKRZDwr4SJ
 FZm4FD1nXit/hzP3KJaZdqqyOc7/zOhy1PDtmq3KVsF6jmOFdultfCu4M/KJC66rNaf8khCv
X-Proofpoint-ORIG-GUID: sQtqnoItoCEhH_E26ejW0xHZU1sWpGA6
X-Proofpoint-GUID: sQtqnoItoCEhH_E26ejW0xHZU1sWpGA6
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682b0eed cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=-ylb_1dp-gWGt-a8D6MA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=599 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190103
Message-ID: <20250519105836.KoREbnyAfrpQIuxisGoXiDuNJMVNI7BVS-NyNpUH0ww@z>


On Sat, 26 Apr 2025 07:51:17 +0300, Dmitry Baryshkov wrote:
> Since SmartDMA planes provide two rectangles, it is possible to use them
> to drive two different DRM planes, first plane getting the rect_0,
> another one using rect_1 of the same SSPP. The sharing algorithm is
> pretty simple, it requires that each of the planes can be driven by the
> single rectangle and only consecutive planes are considered.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: allow sharing SSPP between planes
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3ed12a3664b3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
