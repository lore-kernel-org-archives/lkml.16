Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9E421B9CE
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 03:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751079766; cv=none; b=OrQzoAUWgswh9egxo7iq/g4RTby9e1avzBwPJ5Yt5mj2MIyFJMrcK0HgV+Kmn6lx0XOR4JOIlcJ5v8IQIz+WCgW2MiMoLId85HwL27VU2xs633e7ZMNr+QC34SEhPgBX2RKnjeTdvssj2cPg8m1gyvuTvzZPH9gSVyyJ/LBIKj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751079766; c=relaxed/simple;
	bh=BZ/L0vXDMrjRpmDOemaXJyxUSi1dw0SrlQJrslusto0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Febj/pKo4O9KoCt3VmkmcJWj3eLYIuUZJbAj+SvauJ6FjZV4d5K42c0CqB9dDSG37Lkox3o8JFRiQMKpe5T+hjZ0PLK35S/HI/CH/aZnpoNzgiOMz5lOFcsRyWJmPIKzzUYdaAUQgOJtc5WL/g5468jNGBOlEd9F6yLR21unKrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YlOI21Vg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YlOI21Vg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S29Jam027450
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 03:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WyIF8ET/8reT+adwEBoFNJ3JczrXUqQ34OWiVHWVjBk=; b=YlOI21VgADrGsTFa
	UQceUSCXb09Z5rHxdw057aZg7rpgbAclrkCBzuv0NMhNpAoXi1Jhfs46USFLgKfa
	YuYoCNxuzD/QsWdjp0Er6euYGErF3aXjImPBX6QErHRpIM4qdAgLylXH8Wv4YO79
	Z4NfJEG9PInTTrNXUIrA32KcK09JwLzMa40Vn8y9jVXB6abl81H11jf8+jfFjVBz
	Zl2oIIZYlUCoBxnZTgW+TSz0q6AYtKNabqGa7+0yXedm4RPc2gTvZ2WTFkz0HFlD
	4vnQMpe6ub/6z3gnHG/G2srTyDQW289zuwsXsTk9rDkjQiMh6Ql3B4Kuu+Yp/nLT
	zZ9Fzw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvg1s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 03:02:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d097fd7b32so118373185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751079763; x=1751684563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WyIF8ET/8reT+adwEBoFNJ3JczrXUqQ34OWiVHWVjBk=;
        b=oaL//H2uf9aNHbzYKdwSjrn7iNQB19dFRfuQfu78cCOyrYZPyZR0prrhVlmry7CCqg
         lRpSG4HSyKhNek8Z99HC+yg07uyZqX/3MdK/1V5YvLxYmEoekTdYr7tLSDS5Z6tRYt87
         +Jy1Lf1DqWZzn4JzfTt0A5ct30Sa+Fpc79sT3liGhxkHxOI6hxB6Qy4H/3qvyu1Hb40r
         6jOxa6bKQV83cN/M6fDTNBuIE2fdoGdk0VKISTsGOLbeSIIdO8HYL5UDmyv1epULuXy4
         JU0NlNHk1HXqoBCuZUbY/neW8z+D3pbYDtYiOpKjZbWiKdGBv+awC96UOu9yjF45W9RM
         sbjA==
X-Forwarded-Encrypted: i=1; AJvYcCWVirYo/BrXDvBbfdgHHkhSATaXOIlyZbORwB1u69W9d3aPWjmuUi5FXznYRGoShTxoYdWzcJE7zn6XvMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYPxC7yRGBlsLWt64/zVH/Vi28472jd3MMJ02PG8TOvwrrOapo
	URBG4i3ADSWmAdK+ekWPmjcX1pwjHJof1BUd9yI1rCkLuPo80HFUYPOFYmw4OBIwPH3Wnri012N
	ZSUzRoPWpdVzuU+cH913Laafy/dNKiETNJhVy6kdRCQ6PavFL5pPsUoTsvt0jF3KeuRw=
X-Gm-Gg: ASbGncuYVhkYlFnKTcsmOBRTrBt9HytRRm0ZT/rLq0XpS2bU1YOxISsOHSLXFiy2/uN
	1fLPrghoNkTnN1RdTq2XllVF5KKxEDKJ/kLrCyBaS6leX7TDUZ+KLjeH6DFmeEIGpBbCHNrVZY6
	5voC/OpQ+auNiw54JgZZzZAyZq7l5J5XY3vQ90BlGgGdQkGC0ZC1tHFuiDQLbGsf6HBDMwbPzNw
	n7RknvJ2gMDcxUqeU/WrC2IlIdSkB14pndS8NetZzxQ4TUvpOkg+MD89mewLEeZYWdqLN+3s3Xw
	6ws0j8+P+AZ4G324kyKBq6/eZzf+eNZCqeNrR1Cm5gjJup/Y8NnQmxNhK2JXHL3Y4IHhDSXGIrm
	siu0R7qt2nPzJ2ehw7EhKuco/j3cZtEXQZzc=
X-Received: by 2002:a05:620a:27c6:b0:7d4:3a17:bafd with SMTP id af79cd13be357-7d4439016admr843511785a.6.1751079763185;
        Fri, 27 Jun 2025 20:02:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1qompkvIDrvMFsstdR6uF3g3AklhHt6dKY3yvNkV1TMIXIkwbGM2mjIkNgstKjIzZU8UGnQ==
X-Received: by 2002:a05:620a:27c6:b0:7d4:3a17:bafd with SMTP id af79cd13be357-7d4439016admr843508285a.6.1751079762704;
        Fri, 27 Jun 2025 20:02:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2cec36sm652162e87.180.2025.06.27.20.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 20:02:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 06:02:36 +0300
Subject: [PATCH 2/3] dt-bindings: display/msm/gpu: describe alwayson clock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-rework-msm-gpu-schema-v1-2-89f818c51b6a@oss.qualcomm.com>
References: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
In-Reply-To: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=942;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BZ/L0vXDMrjRpmDOemaXJyxUSi1dw0SrlQJrslusto0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoX1tMwu76TUVuS3VM0TJPzwdp55YvaGMGur1Jc
 BNDlSOT86+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaF9bTAAKCRCLPIo+Aiko
 1RXkB/sE4FvobjpToVj9wMIBigfVTv34gUAtGw/ot9XYLMvZp1DZYU0PyP+dOJrfdXA2gvEnwCF
 UsqS3CHNrJ1rY4Ejl0oYihYMHWWU4BmL01lbt0HtM7Jb319esifd2QV0LHKpH4RUcgPnagxdcUJ
 qQb4DoqHxgDj8rQF5BsRKjflH6lwLFrtfeBzZ5rn2YKCjO4qR3oC547sOcDii9623oU/ZLqTUcD
 pjDYFw9jqhUG0CB/f/f5bEmgPc1+wbZMVqQ16yB+9o42OKGYFtFOpj9QzVv/3r0zKK9KiRgALfA
 CZCsttBn4GEOoGKTYOiQI9L5CeTOYcqfMJLQZ7WvggixMg44
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Ucl7zb6ycxz018tB93DmbuW7unvBNDgf
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=685f5b54 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=LRArfFjgsGaU937PEt0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Ucl7zb6ycxz018tB93DmbuW7unvBNDgf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAyMyBTYWx0ZWRfX6MKGOcQOx4EB
 CGmgH8rAX33ckeMBovw661AFKvnZalCYMHE9+qnptAHCeyESe4SbxqOBgOlRMFlwDXp9ngV17Xq
 8IBBMD8tOQqnt+JbQMd4gQ5Wcp52eOrw52xwvthrqwWLiznu9UtP1roRf4xDtWoA00EBkv6eBJb
 S/6VdfWD5S3EZGxY2ogLkfQwRZl51kb/9h7KMLr/LbAKG834hCp3zdUpxctR9ZKiJdSjkEXfMZp
 ZLry8/MLiU9Fc+5ncb1m1m7/rkqcwiQJqbXFmrSlsz7yrOSiwG08TJiERkfSL53oWRaYL1pkX29
 bicVWhDlzS/5vs5afCblaVy1oZutwoVeVDpUZ28Nc3+VaO861zJMZ8zOU7rIU7sB9OEQ56QSN26
 JC0+ubjOvE1F1CURL4Z9IkyQmICNOszoOTP0OETm+wtZcODM8rjHBrJkGj6zYDUh89SyCv98
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=912 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280023

Adreno A506 and A510 have one extra clock, alwayson. Describe it in the
schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 97254f90926030c4a4f72ae5e963af1845f0dbbd..af43527188cefda0c127c4674d4667203972f583 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -173,6 +173,8 @@ allOf:
                 description: GPU RBBM Timer for Adreno 5xx series
               - const: rbcpr
                 description: GPU RB Core Power Reduction clock
+              - const: alwayson
+                description: GPU AON clock
           minItems: 2
           maxItems: 7
 

-- 
2.39.5

