Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E7C79F5
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748005587; cv=none; b=tu6j+XpR4Z6kKe/uyZgazCG+ym3XiBLeYJPcZCoxvE3U7OBwtl0W82g4o3ZMhUgRqmVNyYtAdEYBcvdVWWu2zXBmPJ3sV6uGXNlY1WaQyN4KsAclA5259wU9VjGeahdMJgQ8eOKnSfnrVD47dAyMYRfyAlDj4on5Iw5934rCkbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748005587; c=relaxed/simple;
	bh=NqsQKoyH5XwgFnrjy2QDwdy0aFDN0jlWu+yux8ynH4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pMKG2dmlLgeBW6GnzpNSVD//Od3vVPliMI6iGhuHWACbHySRFtuQTHIdaYE0qh+LzLhhRBD7eUnEEDybOdOo43Jpwn0qqaY83KtGzhmDCey62mDB4AVGA/Y4XygEkIrPSbgIj0mzOD+bKQnccq4LRXsmRMmKJTdW/+gZD3OmjPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pshbatds; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pshbatds"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCwmJY024983
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=D2ZwAv3+/k8jq5bB/r8jN+
	Yh3nUziGncMv3EzvPlvAA=; b=PshbatdsvJ3uQjQ8BnuYeX81N/+IFW0dRTLdX4
	w5g6Dxn4NWdF4XqWbnxdlc/VHyirTbr/S3oyOIz7ywde21qp/YyPkzAYVdJHqj4+
	+mjHQlYodHPgljgsECGsNEvV3+9qrl/rQsAv2gH+SNpE0a+HYzxsKHMqJkPPk7WB
	0HMewcrb0W34cLzNsqLgNW/tdCkexABUbSnZvJB71XlMy7WqTZ2JRiqBEWspd8bq
	cIwngnleKUIwVcKBvQnlQrPOcitClg9xSjoUS9tqaOYyrFKVR0i3EAizIhHToE3B
	jUrvmuF7e4NNatwboAXN6J4ZE4p+ITESac/WQ8S5xDbyS/GQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf520ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:06:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-310f8615a3eso247478a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748005583; x=1748610383;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D2ZwAv3+/k8jq5bB/r8jN+Yh3nUziGncMv3EzvPlvAA=;
        b=UPiIBj3pBuZEQkiIlfTV6yRnVlqqE9pAFpOdHih2H//0D6Vv8n+JBFeXhXvyDlscRe
         IozgKqHEbBcpJq2D0X4RgQCu8qC3FOffkleVdB1GxY0qRBZUWy/VqTxta3TQclvQPqw5
         xSzhmdDBXs8+mBsPU/a1slZC9AwZ2WIXQ04cU7Ti74eaTrel6Pe61O3jQlM94QDrpreR
         EXJtHmMGc1RzNaPp/njvPkG7Xw1CULZerBzrOCacySvPF1wHw9h47mqD4UZGXzn1asEl
         yGoALqWtCJJd+xs5TD4j4LvyrkAh5R0l2wE3Z0jFJpusXagUQBURLW54Fb+kJFPxg0ws
         Q0kg==
X-Forwarded-Encrypted: i=1; AJvYcCWU3h5MJYWe639JFVXkg8xoWr33v1Qyqw1VAC4BbZ6wFZxGObVkUWg1I54clpv8oLhbw3XqWviMjX6GOa8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWg8+zqfWLI0Y8ZVjOFDJ4SXkEBpaiPl2XqoF3V0Z1im/QqPnS
	HYDsuM8wTpSbk6Q57jufzXg6f7LSSHkaQrC5woLnSUtCyk0oh1HB0bWqClyFw1kyxKPkRdfIg38
	nWd5WZUw0afTfUFyEmLxSCBKTWwaBT0O1bPga9PqYV/REO+ydtL7MM+26Y8PS0cW76kk=
X-Gm-Gg: ASbGncvAZr/xZna+InrQUNwYCJ5R+my6rPANpHo7rmvl+768HK0LHZFtfdSibH/XL3p
	IJB1LAfof8UVWURmQmcahpyeXMTxWsVkI51BrPu9TIgOTNvwJ7EQbdKVlP41GXFXaGmFQQlnxr8
	9s7KkPARoiQgxFE6Zs405iaBLgRbBWUYJsT0TDASiv0Tf2FE6mRsZ9a+pBVvDzrkeB4TmERlbgV
	e/tUbEBvHhlZMqalEkXFuHntM0DJ4GZlJ/ELeKoQO+h+1cPrNavxcSoMcvsuMk229zh80ODlwME
	kCu2uzKv7pJkBYvjcIcyf3vumz4Y3tYVgPNsdLv4YTflrga6nNc=
X-Received: by 2002:a17:90b:1b03:b0:2ff:58e1:2bb4 with SMTP id 98e67ed59e1d1-310e972afd0mr4224639a91.22.1748005583127;
        Fri, 23 May 2025 06:06:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdJsIyMKqkXweP/UYp5yhqH8qznBRczsJ+cQdN4PhNXmYJdgeETzFaBLjNJrPAKxxcvN1ZUQ==
X-Received: by 2002:a17:90b:1b03:b0:2ff:58e1:2bb4 with SMTP id 98e67ed59e1d1-310e972afd0mr4224601a91.22.1748005582662;
        Fri, 23 May 2025 06:06:22 -0700 (PDT)
Received: from hu-vkraleti-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-310f1544d30sm816165a91.15.2025.05.23.06.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:06:22 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Date: Fri, 23 May 2025 18:36:16 +0530
Subject: [PATCH] drivers: gpu: drm: msm: registers: improve reproducibility
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMdyMGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNj3aTMvKLUAt00i2QLw7REgxRjwxQloOKCotS0zAqwQdGxtbUAkV5
 3W1gAAAA=
X-Change-ID: 20250523-binrep-f8c81fa0d31d
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ryan Eatmon <reatmon@ti.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: EoewesVbJZAsA0DSR6EBUBij9fwyo9q1
X-Proofpoint-ORIG-GUID: EoewesVbJZAsA0DSR6EBUBij9fwyo9q1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDExNiBTYWx0ZWRfX0lyL/9zt2ozD
 Z2rmkqELWHVqveYBmiL2/ZmBzMuubsmhbjwCo4hDk4oSNTk1ORLwXfvmO5vSnYEUwBHPIMp7eZE
 Xt1J1NFWlgWOs9Lz/JnPdKEFJiP49e1KK0RHK+7rj5YxmtULym//+1bBO0jvZV1DiAh+E2UZGgh
 bQfOXcpMEHAeAHVgb2+eSsMzH0kt971DSh50Z3HwtRc9UiP4JbykejgNB7B4RzeKqe5K3Tkxus1
 fzKDH8sA0TWSTlUssoANEDJyu2uUjXH2Jejo3xr7R931xXbuV7eh0fYxaHsmZJzELN1+vfZEC8I
 B3ArSdlKq6lo1bbfOM0qVPbQJk+5hUawkllOj6EEHc8Lfbrc+iyBDEtt1NRpy1pMY+gfv/PuyMH
 jOMTaoIKT/A+wtwK+kIACU/OL4k+OZ64vHopa6zQL3lVjcUlWcSPL9DcGzwRz0Be6eSfjZiT
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=683072d0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=k2a8_r_j4jiI5Xvw-VoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 mlxlogscore=691 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230116

The files generated by gen_header.py capture the source path to the
input files and the date.  While that can be informative, it varies
based on where and when the kernel was built as the full path is
captured.

Since all of the files that this tool is run on is under the drivers
directory, this modifies the application to strip all of the path before
drivers.  Additionally it prints <stripped> instead of the date.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
The files generated by gen_header.py include the source path to the
input files and the build date. While this information can be useful,
it inadvertently exposes build system configuration details in the
binaries. This hinders binary reproducibility, as the output will
vary if the build environment changes.
---
 drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index 3926485bb197b0992232447cb71bf1c1ebd0968c..a409404627c7180d5b0626f0ce6255d7d0df5113 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -11,6 +11,7 @@ import collections
 import argparse
 import time
 import datetime
+import re
 
 class Error(Exception):
 	def __init__(self, message):
@@ -877,13 +878,14 @@ The rules-ng-ng source files this header was generated from are:
 """)
 	maxlen = 0
 	for filepath in p.xml_files:
-		maxlen = max(maxlen, len(filepath))
+		new_filepath = re.sub("^.+drivers","drivers",filepath)
+		maxlen = max(maxlen, len(new_filepath))
 	for filepath in p.xml_files:
-		pad = " " * (maxlen - len(filepath))
+		pad = " " * (maxlen - len(new_filepath))
 		filesize = str(os.path.getsize(filepath))
 		filesize = " " * (7 - len(filesize)) + filesize
 		filetime = time.ctime(os.path.getmtime(filepath))
-		print("- " + filepath + pad + " (" + filesize + " bytes, from " + filetime + ")")
+		print("- " + new_filepath + pad + " (" + filesize + " bytes, from <stripped>)")
 	if p.copyright_year:
 		current_year = str(datetime.date.today().year)
 		print()

---
base-commit: fc5c669c902c3039aa41731b6c58c0960d0b1bbf
change-id: 20250523-binrep-f8c81fa0d31d

Best regards,
-- 
Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>

