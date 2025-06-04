Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB54B1A725A;
	Wed,  4 Jun 2025 15:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749052177; cv=none; b=Rv+EkCAFLABXC5xiJcQX7uU1MB6dWvbKQuzOcqZS7i2GvHTqq7bdsnAcIAEP3+NMH94pnjkoXwSxVoWJU1rER7xodq2zXRC8fhJH098cMgIko0fEy2XcIDB3qN7b5SwHk5S/tRx4430XaFjqx2C2QDBqV3xsanuYbfJUOScDlls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749052177; c=relaxed/simple;
	bh=vhhKf47KqG9CLznJkMhmlMXu58zLzVz7VvXyLhONGz8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=EYzpKvpi2sfY0Nr549878U7WI3OIZAky8Pus1k7hwu2vQ7olZPvNB9nnsFssMs1hzOo/q1ErIDJRwBCPZZ+uk3nnL6LGpMcE+vjmDyc9l7kGdCxXoGjnudYxbNbhsvoP56EIitJnGcbLtOaJyj5Q7GeISB6xn6yEudU/D3RLy0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=wIzbmFq6; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="wIzbmFq6"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554D6Q50023428;
	Wed, 4 Jun 2025 11:49:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=gqvAslu0+W4zDZ/S9EiQb6vrEwe
	o7vsyczUj4kc+3Jc=; b=wIzbmFq6/iMbAe4IovKqZOBzFM7F3QxqRotxCc7+0Oa
	PttM+qVrSvBH92heJUSRnVxBIF00Sfa8ejvR3VPQ/yUcf2m+HyyxTPXB5AXI1zON
	3nsVDnD4fhaU/DgIozZZUb5xTOB9C3oWQ3tihiWG+D1uvyVU05SyW/RPBrXv5Cfm
	MOLMqPGZNlWjCTduh62bqAX0DIu3Gzsmba6nTVjKkSAAw0XTRF2Z1avWHlIK1IFR
	mwRWywEEnk1Gjozm9KRlseAV4Esy6v72GqSO0H7Um5vrinK28Aj4kf8+RPBgci7O
	/kxbjh24sbHCsT7MQzJ5M5Kwa5azp4L+UJYdHuCrxXA==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 472k2u1w5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 11:49:18 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 554FnH0u039301
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Jun 2025 11:49:17 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 4 Jun 2025 11:49:17 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 4 Jun 2025 11:49:17 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 4 Jun 2025 11:49:17 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.51])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 554Fn5K3003109;
	Wed, 4 Jun 2025 11:49:08 -0400
From: Jorge Marques <jorge.marques@analog.com>
Subject: [PATCH 0/2] Add ADI I3C Controller
Date: Wed, 4 Jun 2025 17:48:56 +0200
Message-ID: <20250604-adi-i3c-master-v1-0-0488e80dafcb@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOhqQGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMwMT3cSUTN1M42Td3MTiktQiXaNEU0MTi2RTi2QTcyWgpoKi1LTMCrC
 B0bG1tQBTDA5QYAAAAA==
X-Change-ID: 20250604-adi-i3c-master-2a5148c58c47
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jorge Marques <jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749052145; l=1126;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=vhhKf47KqG9CLznJkMhmlMXu58zLzVz7VvXyLhONGz8=;
 b=9P83OD6xgp4adz+K/0eFSLadmPKclk9TLhzw1VCYW49YrWsCt9ffojNeAw7M9hHSXFfXvRRdL
 H7bw+qbwuYBBZry/12hi6LiIf93nSTJd1hinZ2hzNLWWqcoQ2D4/9De
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 1dSFb5FUc3d1PfrHpKDBUqlFOBIORX27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDExOSBTYWx0ZWRfX2bpw6Qp8wjEN
 xoMePeKPZOXa2QaMqQ6uhklumG7/3GsKZu+SZZFG2ekP2zlbFHgF3p05Jl6nbw24qvAo8Eot/Fk
 i8U3S6iygMgLLiHHu2rLu3xeqya0q5Ssg81ansEOWXXedEBbTWdJJbG04pei26BqOBCdvawQykR
 UzBDfARYYi5HPC5Vq9llY9eibttMySoRdcYoZsnzko/43M4PGps4VWTc3luX1Uj3AVvQnnUAw73
 5AuAG20AB2ZURRtJkJHs9Bj0NN4mu7n8171AOFw0O9dQv+Qm9YNOwVw7LpeqzOX2IcEghD0jZpH
 1yxb/2PUEUh9BNiv0lnXTGc6qYTcdgiITrru+VuuRlhIafLLW024Ka94eve/hJ7uwa9/j8CuvCr
 n2IMYJv5reGcFQBt5CFmVwGU0HXqtzQtr0ng1KNlFQZV1/QFikm7pEjCBjqe+tod5QQUijV3
X-Proofpoint-ORIG-GUID: 1dSFb5FUc3d1PfrHpKDBUqlFOBIORX27
X-Authority-Analysis: v=2.4 cv=Fv4F/3rq c=1 sm=1 tr=0 ts=68406afe cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=wI1k2SEZAAAA:8 a=gAnH3GRIAAAA:8
 a=AbWnsF95IPDzd2HxxOMA:9 a=QEXdDO2ut3YA:10 a=6HWbV-4b7c7AdzY24d_u:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=820 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040119

I3C Controller is subset of the I3C-basic specification to interface
peripherals through I3C and I2C. The controller RTL is FPGA
synthesizable and documentation is provided at
https://analogdevicesinc.github.io/hdl/library/i3c_controller

The main target for the I3C Controller IP is low-cost FPGAs.
In this version the driver supports IBI (only the MDB), I3C and I2C
transfers.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
Jorge Marques (2):
      dt-bindings: i3c: Add adi-i3c-master
      i3c: master: Add driver for Analog Devices I3C Controller IP

 .../devicetree/bindings/i3c/adi,i3c-master.yaml    |   63 ++
 MAINTAINERS                                        |    6 +
 drivers/i3c/master/Kconfig                         |   11 +
 drivers/i3c/master/Makefile                        |    1 +
 drivers/i3c/master/adi-i3c-master.c                | 1063 ++++++++++++++++++++
 5 files changed, 1144 insertions(+)
---
base-commit: 00286d7d643d3c98e48d9cc3a9f471b37154f462
change-id: 20250604-adi-i3c-master-2a5148c58c47

Best regards,
-- 
Jorge Marques <jorge.marques@analog.com>

