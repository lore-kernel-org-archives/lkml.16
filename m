Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F309636D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 06:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749190201; cv=none; b=eOBW8IPHUs30UgSasg2soTWpUkr90gXDRn0WmBKY2QWRg8c/CmDKOGBc4P1H/2Hx7icsS9FmmeCKj8XHYHx61q0xrS2y7ojL9QauY5DOZAVWGnkDShjXNO7OeZ+7q5g/Ig88FYjLI90XhbSpTcxZAU+c6euTxkOu9RjGXdYwa/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749190201; c=relaxed/simple;
	bh=qaUqF3/QAu64Pum262fgN9tSQ7zkCMj9kyvPHgv2xX8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JzlaBNCLM88kYD9Am5WcyuO6wP9uTYwxCFxYGmeUilsvMtx1ycorRMNxs5UUo+A3xhCxubeM9qiywXodI0ZjleLoB4ZmoIFDZjTTNuq7B6cGCWRrTfW8nQ5ew7Ef2eI+L3liV6ZuLGWQmu9Ss0GWDOArUSEVvUOP9D/+ofAzpuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V0L3yz18; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V0L3yz18"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55668UXv006331;
	Fri, 6 Jun 2025 06:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tjyvyQ1mXTTTbZ8kgAoG4n
	nP/hfkSCuB9uDs9aoaiN4=; b=V0L3yz18051jdmKl472jBXLpi+1UX12CG041Hg
	VGq4gIn4sUGsKQ5u39JUkduq45BduKRg7mq/7k+CXvw/BkC4MIe3BRUdQJkY6yH+
	us/G0KMicbTc6aEoI7LAdCLjkr+dCW1+wAu9gvS/gXLY9dTEPXktDzHehW1IEKdG
	cI1dDUjXsmJFNwpP3t2BW3PLF24X4oFOj9hWfE3fahN2NJb3ugQ63zWtDlK1BmWt
	Dr7QaoEuHTkGxTJK9zevUzJo5LBfsr2/D+SL6ciQTTAdL1AvWVKBqVTVaG9I0fAe
	B18AYgvJ1e3cfQxvrMS6Whh2mV3Je0qiqKQQSpFBW+wUDGng==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t3mfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 06:09:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55669pFl027944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 06:09:51 GMT
Received: from ap-cloud-sh02-lnx.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Jun 2025 23:09:49 -0700
From: Songwei Chai <quic_songchai@quicinc.com>
To: Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix
	<nicolas.palix@imag.fr>, <cocci@inria.fr>
CC: <linux-kernel@vger.kernel.org>, <quic_songchai@quicinc.com>,
        <quic_tingweiz@quicinc.com>, <quic_jinlmao@quicinc.com>
Subject: [PATCH v2] scripts: coccicheck: filter *.cocci files by MODE
Date: Fri, 6 Jun 2025 14:09:36 +0800
Message-ID: <20250606060936.2756980-1-quic_songchai@quicinc.com>
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
X-Proofpoint-ORIG-GUID: pe1-CCddG-EOEHm5nG4CyrrbjxEZpSUW
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=6842862f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=WKtsJadjgsE31bDWsHgA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pe1-CCddG-EOEHm5nG4CyrrbjxEZpSUW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA1NSBTYWx0ZWRfXyQ2bj+zXMdTP
 mwW1RqXPSq8vD67TDLQxX2rcxaIjZZT+rPxP67aIYEzdfZIGWUifUiDTe3R6wbJcLkz2zLgCf9i
 8a5LcWPszqBIrcBvNbwboFhZhLlTjSrBkX7/15lCCgHm0nPB9PlaQmdvDLWiUHZzZb/qXUDlbe/
 gzY4mdZ4Zjvjl6NlOuQxXiU/chwNQIEuyl6XTI8Mr7rug6Kd0Hv1slya8hGNZnpVhf9lQ4Bo7JV
 4zso1xzCnTBl8NdNv2lF/xodHL2ZfLFrkuQXTXekI1JRv9R/licMXIBs9+PAXaX2M7WvBo0OQ9F
 5VCkFB1vcU2/aJ7jWrqazxSoLTo4sOU0U1wQLoIBna/x2uu0BYOaLDL+hxelNeAXYuHjDbZRzyh
 uoaI2TPlp1p3mTWzhpKwDwy88eowF/11bLCYLkUAe3aVDD2N+Wx+NkQYPAFrNE7Imow94rg5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060055

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
are skipped automatically, improving robustness and developer
experience.

Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
---
 scripts/coccicheck | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/coccicheck b/scripts/coccicheck
index 0e6bc5a10320..89d591af5f3e 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -270,7 +270,11 @@ fi
 
 if [ "$COCCI" = "" ] ; then
     for f in `find $srctree/scripts/coccinelle/ -name '*.cocci' -type f | sort`; do
-	coccinelle $f
+        if grep -q "virtual[[:space:]]\+$MODE" "$f"; then
+                coccinelle $f
+        else
+                echo "warning: Skipping $f as it does not match mode '$MODE'"
+        fi
     done
 else
     coccinelle $COCCI

