Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925971EE7B6
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 15:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748102151; cv=none; b=NWt9MAWQWLgmsigN+GjepSeg5cfpITTgFMTBkhhjeYKtlvPaHmEi0gZ+3mCViEoflnKMJuQmpu89N7oqu7XjiTayzy/uR46Q1Kk+sWeuJQ3APSBsYotgZm2L6SoitCa+9fh/i3ltJWXcbl/NvoRN6h0C7Dl+BhsdMqbuTJyLkGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748102151; c=relaxed/simple;
	bh=ljssUhbJ/Dlo/98coDHxsN/uR+m1VrO4HU0Yd+OJvuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XIgvSQQSZpnYZ2Iq2ozcR4DjwJFOlqP1BFnvuNvNI3E0lJITcO2M6dW+p1xUifuIkRClGxHIenXCYftUujwPAVb7fJFXItr86MkD0n9X0l0pVqutC02SVBkjsz0Ibt+uasVSXF4qdxpCO/h5U8pRPMd9T1nbV4gnkGYiDCfYy/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LhcYwmwU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LhcYwmwU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54OCfmYf016506
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 15:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ENaXaAptX7hV0LnSeomxQb
	fTAaRBDEz7YM383T9ESwA=; b=LhcYwmwULS5KfUeqGBzXGcoruxONco/eBptlY/
	nM1vtfzRk5rUckwf11bl6c8rdzYN8frmxC8Az0cbDkZRSZK3FcSEJIrFqIrIyiEB
	MKTJw3/ehE7aHXwNeS/cIzqi0PW3nTF50HalXOvQC83Pf75UWiKOYzfigigLv38I
	weXKpwY8VkZgKz7K1OkE3kCAEWLBZN9O+mwSn19m14dhC92kGZN87opWCDpK2kWU
	lwtVj/mQITdmtbukbCtD87LgnriAef/AaZC44X5p5oW/+k+jmyLuXXTOzz52FGA3
	oPWHvbEtDf1YFGd5WTyFsjfjfzfhioH7+2ljeC37eOuffw5A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjgt3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 15:55:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22e7e097ef7so5076025ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 08:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748102147; x=1748706947;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENaXaAptX7hV0LnSeomxQbfTAaRBDEz7YM383T9ESwA=;
        b=NsVKOHhLMaX6zvCmdDUaEdzY36GsIceUB/Dwd6roAyyv8C8m1YcbmcWA3m9cHR6GaH
         G2X5AXKo1fbwAbiAr61baBDK+B3DzqZAfLvShOMmYcSo2OudNj4IOF6Ie2rA6ccqKDvB
         +xlfg0rL4DrV7h8Jg8sXWIda52vPoZLd3e5TO9tZ5bBUAJ/au95Pi8WIO4r54xZ4zpAd
         bZqjGLISwTZ8/S9Mgnzwy5PDrMjeqKG6k3SWe9hp84J6yXM3p9vaU3/WgmvTQIOotJs0
         iCwkOTdN1cJOhTElzFFFUW5r3JwjwsNBBovqGrb5l/uXO7nUZoWUgK1fNhC74C39u+ub
         ptNw==
X-Forwarded-Encrypted: i=1; AJvYcCUWHoce+M4IvO7gM0CHvco5JaqGfe7iZl1mxVqRnXTg62I3QZf7Ua9jkUNVskxOBVgFaYKW4vVl4re7pwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP55qG6g2OXwXbRGDhVP5tzFUDATPI9eiZrfse/nj7FEngekBH
	Wl+TJ8SXVjR2LmQU0UgD1BA3MRCEDV1AdfItTibt5WRgnDptjeTaw3XCN4/9SyERLZTnBUQy3UY
	0q7UokDJE7XfAeCEC+ATFh3cR4AC+zZHzD2LQqjoo0RaZNj+7iP/kIEZ48PuNMyx5/80=
X-Gm-Gg: ASbGncts0KSis+awSrfXCxOoUpAJxWaenEtpV5NbsKp3xQl1m4J3HuwLz5kZREV5g7L
	E9k9Zvm1xHJ4NY90FONgdBqW2L0P+6EdPxK4RScRImvLeMnfILCh+oLejKs5pcvfPDNXZYkZtHZ
	ZEnmBo6RPEVqARUGtEVVw4aGpDR3yhtdC0vhXlTirwSRNBqDm0KzlPjAC8iR70xkies5cRh9DVW
	6h09rJLN/dDLe+2fI4x0F08hjfZX1dVPoGKGjOkhA1KsNi0+lkEtF53WYWzu+yjbA5+gJ/h6XAp
	yiN3fTIZ+eoMx3ZaypplmPu50xf89kV54om01gzHwGn8fCsA3gM=
X-Received: by 2002:a17:902:e544:b0:22f:a4aa:b82b with SMTP id d9443c01a7336-23414f62af9mr58433795ad.21.1748102147396;
        Sat, 24 May 2025 08:55:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6qiynLRSJOmSDekV7ueADk6ZcUv9RFrAPGuFI8AxKbhuiTjsCzxUbRLDcJyHbQbuDV90JCQ==
X-Received: by 2002:a17:902:e544:b0:22f:a4aa:b82b with SMTP id d9443c01a7336-23414f62af9mr58433375ad.21.1748102146905;
        Sat, 24 May 2025 08:55:46 -0700 (PDT)
Received: from hu-vkraleti-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2341ccad6fcsm12090755ad.170.2025.05.24.08.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 08:55:46 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Date: Sat, 24 May 2025 21:25:37 +0530
Subject: [PATCH v2] drivers: gpu: drm: msm: registers: improve
 reproducibility
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPjrMWgC/2WMywrCMBQFf6XctSl5anDlf0gXMQ97wTZtokEp+
 Xdjt24OzGGYDbJP6DOcuw2SL5gxzg34oQM7mvnuCbrGwClXVHFBbjgnv5CgrWbBUCeYgyYvyQd
 876Hr0HjE/Izps3cL+71/icIII1YYKY+KaS1Pl5hzv77Mw8Zp6tvAUGv9ApwpD82jAAAA
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
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6831ec04 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=k2a8_r_j4jiI5Xvw-VoA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: wNzRh6CJsjuQVcLPsKdA7VPWI_gWodFq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDE0NSBTYWx0ZWRfX8by2gXZc4g/A
 RWFL5MozqRvpy44mnkkALUu7ROy4DzWLJhzL4kqx/u3q9OpQys1MVfIJl6MWlJiwdj6soZjjY+V
 46imxPrRDrCOL4rcI3ZdrbzFfjz6DYZe3sgnMOrS9Lb1adiLRar4Unx7oN9GXg1gOnp61N0ANSr
 0Kh9pfLPsYtCTOfKSkUEeUqx/xToJE0cfkUmZPB4SF7YP1B6o/lsTRaMFyJhorLXssNWG9Ob5hH
 KJnJa+VufmWGAXPd+1dkSLpz4tTzxj0EiuQqXK7kVvLGvR2MBIXYsQOV4F5GrTKOGXSolBZ8y1a
 4CynbZr0w0P3RVZA+1Kv9mzmW02T5RNaP69NWCB0TKFcZkFkjASkoBAH7c+bWNNf39jvUh4J/jo
 Ju/2wQUft+Djsy3E8xbMHFmog4/1XRMkT3SNdPpdHuIrEKphS+3E74qgsRLDIsyxvUrm3it7
X-Proofpoint-GUID: wNzRh6CJsjuQVcLPsKdA7VPWI_gWodFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=856 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505240145

From: Ryan Eatmon <reatmon@ti.com>

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

This change was originally submitted to the linux-yocto-dev kernel [1]
to address binary reproducibility QA errors. However, the fix is generic 
enough to be applicable to the mainline kernel and would benefit other 
distributions as well. So proposing it here for broader inclusion.

[1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=f36faf0f9f8d8f5b4c43a68e5c6bd83a62253140
---
Changes in v2:
- Corrected author id
- Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com
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

