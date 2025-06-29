Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA017265289
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228240; cv=none; b=kfHGX4rMABzVvPtQZ/K9NOltqsdR/tYHwZlU26AOiRaE3WKA2zz2zRNjJ2yAJkQT5eL4w5HtHmAZ2/f/QUiSzF78bolRuCME+XF8UJl9ZRyiRaqerCX/6uYOBcfIE+cTAY46U0bZoRB9PM88LGJugIU55cEJCCovb0VvCFW/dUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228240; c=relaxed/simple;
	bh=ayKPNIzMHytJlMgLXTS3H2whkdxFm6qzz5vdQc2N/d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fALHEIvwHbILkvxWzsvj3dZNvGhrPBoLjE6Z7fON3OhQQAdtXZBBtA3fr5Kgn81epm8UquQ2Rgnoz2erUBZG98t+HJ3F8Wgl+Ot9EQgf2s+e98i65gfQS+W4oUrP4z8DbeDolA7Xyjgjy1pjFpTcZAW6dFaEHtfpfVrJ19XYmKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNA26lun; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNA26lun"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDRoWi010344
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k07yEnAyEzE
	a9/0q+Hpj8bv2+DIU1Tpq9KBSOGFREQM=; b=bNA26lunYr+ved4vKFT73ZKdg2I
	1epYMrVwBa5j/JKPC2aiwLSRVeTHlFzUqGPzH9kJRn6I6XHUb9gFL5gykmv2XTPY
	T378+Q/PSN/M5lQd2E9+cG6t3QPOCwuD/WItaZ0EoKAXcWZdm1fDswM1p1aEu5te
	Y0hZYHkh6pP7maHNBCGxtP/76DvHQTvrBoZB80TmrBQ2A4bCK6e38lzpatLP62Tw
	CJIgGvNHn3FmQ22nhz9RboXrNsMYUrA5gEhaxmiZA+ZrHhAvIy9yuvIzIGI4qsGu
	GthzmjiWBVeW2XHXyH2ODcKcHzBBybaTX6U/oQ3WyIxxjBGSvcdlskP0TpA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9ak1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235eefe6a8fso25697525ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228236; x=1751833036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k07yEnAyEzEa9/0q+Hpj8bv2+DIU1Tpq9KBSOGFREQM=;
        b=kasDEIRXPB0/XMOqDgkl0XXqJ85ncOyT0wlrGZLT7SSmLPynbyjfrWUrjMicF52r5Y
         s488/qx69VosfPREBBJSXZyhAAhQaWvaCrrQKP7Rvko7eYRSVrk02E/OHLIb8U97xTXX
         0eWdmJfTydUUjtU4+FuzuRvITvgEIE0ymgpQaKfmoRCysqozJ5gsMDpph/UZKqe7Wz2C
         dpdWoAmCH/OPnyneM6Sc6u2HPKX9Z+xdNG08xWkgS1sqRdiGoDubVseTCvSAePacFFk2
         WZck5Yz257+LW/N8TBoAn84RkvdGK/nHXGNRvvaIUzg8cIBnZFd/ZXWqaAVLyCktN7hh
         /Dyw==
X-Forwarded-Encrypted: i=1; AJvYcCWn4gN2X3IPkn7czkm7LLp4xl3xaUG3fyiU2XrjwcGt8cD8TTb03XEVHlXQz8FuDe2ybm181UU6oFXbwHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVMxdPgyxL4Y5BBFHvvpCd/oxwe6zWGJaFFVk5R1o4jpuztrp+
	nTi2sJs30IkK6WERkNiHQrXunaUifuGIxmhxKvz/IQhJHXLmnTznRNmEbdfnJriO8PWr8M6FJ2O
	KMYEuXp5169x/SNoTLtNkgsYYulCq6wrCZCF1ZKKhjujATbSOfT5CHfZwwhmWOlrlhQI=
X-Gm-Gg: ASbGncsDV/faGmm4SYsy06JSSkT/S8+Xt18yOz5NYMLnQ6Tu4d24xSnWGDQnj3s8SLy
	l2NDTrwQexqiNxM1WmQHLai+gD13X+N+bkp08W6xj7x7IlshW7a+IgvjIWa6R2h2M4XqojTriFo
	TCQZ0rC0dqddNms9dkbMcX0npmN5bnUi4p4evUnDotM8vZT2aa9dUGoZMOebhzLtUCNFwPU6Ie0
	aEh070n6sIXM2AQdYXB2C2UgRdbdWuskOdQt/0QJornxdD9xauoqFMwT0+uHtI9wHDlEdNap4P3
	599GfEWInkF2CMwzjtVfDaTtmW9FgFgTpw==
X-Received: by 2002:a17:903:3d0d:b0:235:ea0d:ae21 with SMTP id d9443c01a7336-23ac487c9b4mr181492855ad.35.1751228236514;
        Sun, 29 Jun 2025 13:17:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbqKK4XP+eBPgJHXyazG13c3Qw9Vds2B4hlk1UpKPfkqCJy6P8j6VSj/+TGEYyxHjNQNNVqw==
X-Received: by 2002:a17:903:3d0d:b0:235:ea0d:ae21 with SMTP id d9443c01a7336-23ac487c9b4mr181492615ad.35.1751228236130;
        Sun, 29 Jun 2025 13:17:16 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e3013d7csm6301398a12.11.2025.06.29.13.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:17:15 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 40/42] drm/msm: Bump UAPI version
Date: Sun, 29 Jun 2025 13:13:23 -0700
Message-ID: <20250629201530.25775-41-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68619f4d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KgEaFMypzpKrXJt10QQA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: n3dHngJk5DAY35Dw5jQ1EPFn62gAczJb
X-Proofpoint-GUID: n3dHngJk5DAY35Dw5jQ1EPFn62gAczJb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX9RJ99WR7rmXF
 +hsLQk6l4SJDy/wJ7gh5RQSTW5UF+SrLikuozIyeyaU/66D7wbRHvuWngal/B4krauqMOwvJnwG
 +iUMJNDfRw6wFA6u9QAfsvR9dP0LkwUCmOWtoJ3Cu8r/nGHZv4g/TMGkxysDBIHs5YFBWww/ToV
 8RhOOyKe2XwG5UxklslpQOkCyRAniMOo8f9OFEkWwrdiH9Dkw8BxxB4BhfOQwcaK9vteofCfpbx
 xBYtPKUNsdsIv3FOqgUQtzdYCSH2wkUbyUJ+5gZ80+EtLtZctVYkVaXWLmt1dULARYYNbjQuZhb
 5GdhdUPGyxpf67MoJHlHWZLSRf+OQh3EF61I8RH7JkvL3STlaLdeWgQkMfFqJDprDd8CN+kXfy+
 Tr01xP+48fGIByXFP+UXhVxYXWHIXWy9mgSyo4zHrtUS9jiSvMp6b0rS8pyz27ycsEwF0GqA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

Bump version to signal to userspace that VM_BIND is supported.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7881afa3a75a..9b1f1c1a41d4 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -41,9 +41,10 @@
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
  * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
+ * - 1.13.0 - Add VM_BIND
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	12
+#define MSM_VERSION_MINOR	13
 #define MSM_VERSION_PATCHLEVEL	0
 
 bool dumpstate;
-- 
2.50.0

