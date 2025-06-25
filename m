Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC442DECC8
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877912; cv=none; b=EPtC5hBMiqtwsv8/uQVIznMUYvoQOUgSm99/lmWAtjUaVJLeHaAiKMWgI9dWUwV2J60BhjzKvI0p4FmvHM7WfLydeplDrvDmJwZPCzUiE6JqGqSbNSJUCeqdsS6IBcECInI1ggz432ZOuvzXWGA0QKGIFLWYyzNdzo+EWCxhEr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877912; c=relaxed/simple;
	bh=GrGA6aQZ+A819VWvU0l5WrQm1ewySWpRFv6nLaO7aCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cNW37ioSk5jhzOX/2XIG5JbRwZMV8WNZxFa+Q1JNqWTrx1JN9xqYz3aC/C6oHvtPYG+zLKFuINWYbujeSHYRjkNhbKA0gMiU9QbJvV/WPIToJDP8GotEQfrkQWPQ2GOzwQkM2CH1OLPa1YLHZlrPwABByo0Uf1B1mn7UhYqBwlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pFPAYJxO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFPAYJxO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCtfrV004238
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aJRux9Mmt7D
	uLoNeHMGnLL0gFwmGFL0eGNY7k6BguSQ=; b=pFPAYJxODp7VLqvoCbvH+1VyFoR
	TVVh8aSjTtlmlxdCSvt3gkbQFZA5EiJz+tz0zl2LIqflivHZYPF+St2WOkPcCHdT
	5G7cWuDWjzBDv4gGMEAtA65z0/XlHKoGGajfs0u/EjgkGiKYnISbAJUh+GsYoBj+
	wfz5JwZrZAd94KBVHajZQ3FQHvHiL1KPe+JAR7JJbwP9PzdhOWqEasP2ezVf9L4d
	dYC5FmQM04XuMxffPpu0rh79jaKEjWeVsw5XNkJKAHJtcqN2YWh5vRDkoGac5VoL
	/y5jyaLj02fxQsDabfjeGOC9A2NO2jjyY4tWqAqeFI5xfB2R+t9Kep2ttAg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4t5cg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:30 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2eeff19115so204971a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877909; x=1751482709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJRux9Mmt7DuLoNeHMGnLL0gFwmGFL0eGNY7k6BguSQ=;
        b=SyQI0wtOOHvi1fpV06A4RF3/CRlif93ek7tCiGxX+RDh142cb17o6t+KJhsFAoo6u7
         1doJks5/PrPCpSYqx9RwlsbPvG89djvQv1yT25UQKWoKVBsZYX++8TwOjiDfPbavm1sk
         MlaEsKMKuJCUZ6he5grMp65lQOwJp40htcNtJhrHos7zht0kwMkt6EbSCXWjEk65Y62r
         r8/0ynoXeSSMyukVgvdybCkW2mvgZxbeEpF/nte/sKoPTuT9J9ZO1XCMnMqBQIo7C9wF
         bhAQhupCn3mk6ch7AkwgnTYBJ+H4UE9vL88xqKA3cjzYZVX4WWYNL0K9PV1pehewZakg
         KnLw==
X-Forwarded-Encrypted: i=1; AJvYcCW0647H4q8vCojEMSnVsiDW2PDAwgGjkgu0QT2GnZ63IA9O2qxoMZoNxS0XZUJZSPKd4V3J7nue4FmJcMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFSkuOMvRkNG2Re4CDSqpwIegUV3myLtgIE3jV+I6dKkij/dwU
	uegBNN7GhXUbwpKD6sdtc+OHN5fvs+0VHx3L53ZICTkTXJfRYZczrTeL7tnplOqnuc7T4gIagNI
	a4Ead1i3lCIVMrIGTcLtSXzvcFKXY0io0rXF7/ra0ElNVgYCL8UsxRtv3pcwEWkvvYmY=
X-Gm-Gg: ASbGnctVrLYCd8YGCV9RtdSyGQNbWWI58UmG5Nsgies0qtWtYOjzi+6EgAUSd1ZR5xk
	gZ5VqQwK/ZE6qDCf2ZWHbbf1t2wnVk9ml7Ym0PoOsTNBu6YeZeiuzJ/ctVXkY8NZgvtuGcO49xW
	YCWP+hkZAwlBRCaIk4XTg3eT9nl2Uvu3RT8bqiCCVM0K9x25T1lbtVgz02I4RT84HBJmTfqnyzO
	dTowBJvuYmbQ+F/mjdW3GvNzHeFlZrvOMQs0dbQZHKU3cVwGawiKhidDuaF5Xw74LoBf80RK1FD
	7iXIQqabvhqjAHpshnp75NPFd4ysequ2
X-Received: by 2002:a05:6a20:2588:b0:1f5:717b:46dc with SMTP id adf61e73a8af0-2207f25dd7amr6659473637.27.1750877909328;
        Wed, 25 Jun 2025 11:58:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC270RcmL94Y5v5YXXUNIT0L43Aj7rmknkarCokDfRAAcbW7dfFvu+z2RftyoP2ixS2WyXNQ==
X-Received: by 2002:a05:6a20:2588:b0:1f5:717b:46dc with SMTP id adf61e73a8af0-2207f25dd7amr6659442637.27.1750877908935;
        Wed, 25 Jun 2025 11:58:28 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c882cc78sm4909730b3a.87.2025.06.25.11.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:28 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 10/42] drm/msm: Don't close VMAs on purge
Date: Wed, 25 Jun 2025 11:47:03 -0700
Message-ID: <20250625184918.124608-11-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685c46d6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pCKbN_IlIROpsMws84IA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: fKIP_ehVlezaQoG3rZNioc8I42CeGv2-
X-Proofpoint-ORIG-GUID: fKIP_ehVlezaQoG3rZNioc8I42CeGv2-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXyGQyJEGr42ew
 ollr1FVbRWiRzmAIurwmBDduRjg5VTZ39cJg+t+lFaLJBOmLQc9gBeOkhPAbaK8NtASeK6yT+zL
 BQg7Z6SeOhRXaNdUpr/q1/YRA1SiIFUmkeeBx6S0nnKg2IJX9r/UXtF/POdAf/h8WjxScmatj3Q
 5D/Hw+8vA4oTCDf81BOElkwSw2+eMRrmbpDoLf+KAZmQ8aoiSrAYKBtDLMjGltm4OVGNuLwiy8r
 /xLfYTKp2No7WdmvDeGK1bSE4S8ap92WTSfnAJQU6PWjliME58s6mU9vilrlFsuPtHeVJFp2TB3
 PZSLNpvkfKECQ2smkOmMdyHziYxo4NoEpGsJMHfO6zz7Tv51xCC4blR7UNFPF5VniOOgj23dpO0
 WgQLAM41ky4p7r5UmIUHuhQvegmQbUyY06VtOgiQ+sUBd4Hy/Tv0uxcdlxfnkwyaIeZnwPIa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

Previously we'd also tear down the VMA, making the address space
available again.  But with drm_gpuvm conversion, this would require
holding the locks of all VMs the GEM object is mapped in.  Which is
problematic for the shrinker.

Instead just let the VMA hang around until the GEM object is freed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 4c10eca404e0..50b866dcf439 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -763,7 +763,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, true);
+	put_iova_spaces(obj, false);
 
 	msm_gem_vunmap(obj);
 
-- 
2.49.0

