Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1936A143748
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 04:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749098668; cv=none; b=aqNAb2IV/v5kDEMrYFWDHVHwjZ9LGz6hgO6U52qRMbr04wNHrGDhedALJ5E8/nAOfeqjed+zGg72/daWD90Mea00Oz8BLNSR6ypyPYwEpZMMmjHOfgOFUyU9Z62Uc7GdV+Ch06kLxuVJ6b3YHm/QZkVz+V7OsIZxnVFq5Z0YOI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749098668; c=relaxed/simple;
	bh=RhvWrjSWo6T0I7Dy3t5SLtp9vTk57trWxV/jPe9QL4g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QzqWHWwfGFT5/PMu+FG6k/Dw788BNp3uUf3No8pygwAnLw9mGkCz8M3l6Y72RMi6H50sGeFhd2wZkrqHnHTu5AFzeRL56ZHeHW2qsS2EC5EW8JYLwBDbH2JfAsYl02NQPKgoiNNV51LFTuUWkVT+O3mzGzBWuSwzInnbz+j0HeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dRdpQcMu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dRdpQcMu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554NJZF5031915;
	Thu, 5 Jun 2025 04:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qcI9oLneDHpSrp750wTWGm
	UjFEtYOdFUi0EQGXqymtk=; b=dRdpQcMucISS/dxjKjK0IIVBpjGgpy2RM0+ZK9
	ZnEf1OTWnEg5lJOjyVbNsPwBfbS+rc2Dnj1ul5eXUVAdPxpfJnQp11p0/25f30Ue
	auQaf3COUjB5IuYTWRexgj86g432x5OQePZ6oGZzzdxIoUO4b+gFuwYueMOXoRaj
	o3ulg5wwivQmtYEOpNDCA0f+k46EXHF+SAAwCq1WfkKCiHfA5Zaf+NzEXuj3XAdK
	oJ5bcng2dYcS2pfaXu1ho32PxmtFVlgOM7tKpvmHaIqRCith23tX2YHIGtqEtgOz
	iB3hlOBARPayqAcRN2GEpEKfcBmhZ6k3GIXHHxUKfIkmk4Fg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be83tr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jun 2025 04:44:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5554iJ07027588
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Jun 2025 04:44:19 GMT
Received: from ap-cloud-sh02-lnx.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Jun 2025 21:44:17 -0700
From: Songwei Chai <quic_songchai@quicinc.com>
To: Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix
	<nicolas.palix@imag.fr>, <cocci@inria.fr>
CC: <linux-kernel@vger.kernel.org>, <quic_songchai@quicinc.com>,
        <quic_tingweiz@quicinc.com>, <quic_jinlmao@quicinc.com>
Subject: [PATCH v1] scripts: coccicheck: filter *.cocci files by MODE
Date: Thu, 5 Jun 2025 12:44:05 +0800
Message-ID: <20250605044405.2057511-1-quic_songchai@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=684120a3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=WKtsJadjgsE31bDWsHgA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3_CYi77ldzOnVAZ6IEeDIwtbgC_UuWzx
X-Proofpoint-ORIG-GUID: 3_CYi77ldzOnVAZ6IEeDIwtbgC_UuWzx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDAzOSBTYWx0ZWRfXxA/a02RBR5CP
 Lzu4bhFSZc9nc9x7/hfLQe1S+O4vq2DVuZaM0Z/P/h0ZPMNlJUdTv9qw4DFxO4R6mROkqEcQMKK
 ugitV5ZVn2rGsPBjRd7oHYKlx7LBllrQIVVtEdViX1CRFYWYsXJD2+1K2I1KzWvGO9zBbxkadBC
 sXOep+KEGZ9WUJr9jjklwB+T5oEe5HRsSZ2GS0mwQdsPVGARDal1eNGLjeXikWIyffljr6Eq2ed
 Q4Le/I2F884dBYWWfctbY9P7+NNP35Rpi3eOjdOYAzp+6IfjTmBv3ERSq6VS/9UME8UD6IVxsin
 UHV10UxUgw3yLaLj0nxKcMmvBBv58y/VJcvJmNTFw6HTKlrdRZvfQVhy+BjCyIE3L0pICOYdV2c
 Z6bVxWumHpfIH7r+QkTcjTFmt5zrD3QNUpSzcGc//YHih9Qa73g0K8mCnkQBBfpwE3kaq3eA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1011
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050039

Enhance the coccicheck script to filter *.cocci files based on the
specified MODE (e.g., report, patch). This ensures that only compatible
semantic patch files are executed, preventing errors such as:

    "virtual rule report not supported"

This error occurs when a .cocci file does not define a 'virtual <MODE>'
rule, yet is executed in that mode.

For example:

    make coccicheck M=drivers/hwtracing/coresight/ MODE=report

In this case, running "secs_to_jiffies.cocci" would trigger the error
because it lacks support for 'report' mode. With this change, such files
are skipped automatically, improving robustness and developer experience.

Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
---
 scripts/coccicheck | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/coccicheck b/scripts/coccicheck
index 0e6bc5a10320..18a69edcea66 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -270,7 +270,9 @@ fi
 
 if [ "$COCCI" = "" ] ; then
     for f in `find $srctree/scripts/coccinelle/ -name '*.cocci' -type f | sort`; do
-	coccinelle $f
+        if grep -q "virtual[[:space:]]\+$MODE" "$f"; then
+	        coccinelle $f
+        fi
     done
 else
     coccinelle $COCCI

