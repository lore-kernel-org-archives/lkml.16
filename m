Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3CC33DF
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324708; cv=none; b=VLkwOIGC7PAD7D/0zg6qsKkchxp2jJG0xeoQuU5Dgz2jlpRXBrD97jp/qps9J+FV6Ekx1XrbH8bnCTt5iu3CqnmxofbmkkuurOG8HtonOZhHSEiV1Xznlx/l97Q03Uvof2IoaQHVuAgxEE0DOcTu37nzDWmDkgaOxfNQ2XRY99c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324708; c=relaxed/simple;
	bh=exMlTQDf4RFiKIrwMeObZiiPO086hHB7Q5aZrXd0N24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DNYnM5nY7e6aRC+v0dQfG0EDaIaG5tt+YtqzQdUib0JcSg0XvNW/iWzPyFiEZ/n1GlC9q9JUW6Owl0IfaW1Eu1pVlJ7EbUlECztXnniy/oMcS/OlAjj7OHGiwsDM5BDWokq3pMpj9hQKSNV8TklU+C5LFWo2Gs5LOypQ0qxLoQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=FXIKnxBn; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="FXIKnxBn"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FCg4ne002178;
	Thu, 15 May 2025 15:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=P7Ukf0SpztiKCIQuQ/Rf5Gjf58clWg8hNr2QqBBgX
	GE=; b=FXIKnxBnpUbMXTfhwzrISjz5mqlDN/ky5pc4n+7dfd3cw52QO2PvJV+XR
	0E2kXFh2LW/A1Bh/myTRVDcdaSgcpx9hSMOqkul3rj+ayShSMk06pQXJe9JY7dKf
	JtEtrP/jXtQ8wVPTiEMeXU+y8g33pBzhQOd4Tlz45lp59hIk3fMI8fLfn0n/6y1t
	33hBW2pnHrlWaowCl6V0nFz0H9K8KIhvD2iQ9dODdRS6/zjBegqqURU+gHobDMtG
	VItq73fSHB1M61/t5drZkpTt79KCoAdzq5JLQ/x4yUMq0aTwfH7QtAZeL/5VxkAl
	TiOw69MOJyXAhr2hdRJiW/x6AvdJA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46n0v6nfv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 15:58:22 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54FE87KP026911;
	Thu, 15 May 2025 15:58:21 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46mbfpk2nn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 15:58:21 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54FFwH4n20513180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 15:58:17 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9303F20071;
	Thu, 15 May 2025 15:58:17 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4F412006A;
	Thu, 15 May 2025 15:58:16 +0000 (GMT)
Received: from heavy.ibm.com (unknown [9.111.40.6])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 May 2025 15:58:16 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 0/3] scripts/gdb/symbols: determine KASLR offset on s390 during early boot
Date: Thu, 15 May 2025 17:52:10 +0200
Message-ID: <20250515155811.114392-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=IqAecK/g c=1 sm=1 tr=0 ts=68260f1e cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=dt9VzEwgFbYA:10 a=CljUL56kBcwxVqJzvYQA:9
X-Proofpoint-ORIG-GUID: ZXYUdZx0lIv4Ll6WpMYUtlOdftN_QIeu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NSBTYWx0ZWRfXzllPhZ4/k9H1 Esv/gf/cLon6z444rj3x/VFhhAas3ioPphtDeGd6+QcQ2/Tb2ccLS16dSahZt/ehor33K4GD8U1 7WNUGzfmd41wBSlFvDkWwXI0GU19WZvd3R7HkLcb51i+MD70m0d4Ip28L+t01AwVW3ymIv2pYpi
 BCeYGiVUN1DuIfysktY5gmaiC2MDHTw2cSAb+TwMcoDECLcxb6r/FldP6OyTyd3frG9UhziwKPZ cQ7geg/GUDmBc7ZDfbjFIepIbOIEwavsGMb+ew0VJdWk7aRzbeUm+OXVMBahoATM3YgIRjaqZzm ps78y6Dhv9UTc/QqJeNSp8nO5BB8E4Al09HcWu0XauUnEFoM/oNWAQQWG5wsjiAqif1bRbxplHg
 QnOl3jyjOejdJsnmQWpauV4OCQdFpfmisTrGcwUIRxH8FhHIJsDGqhZZcdRaL7gzA7tnIGTE
X-Proofpoint-GUID: ZXYUdZx0lIv4Ll6WpMYUtlOdftN_QIeu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1011 spamscore=0 mlxlogscore=764 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150155

Hi,

I noticed that debugging s390 early boot using the support I introduced
in commit 28939c3e9925 ("scripts/gdb/symbols: determine KASLR offset on
s390") does not work.

The reason is that decompressor does not provide the vmcoreinfo note,
so KASLR offset needs to be extracted in a different way, which this
series implements. Patches 1-2 are trivial refactorings, and patch 3 is
the implementation.

Best regards,
Ilya

Ilya Leoshkevich (3):
  scripts/gdb/symbols: factor out get_vmlinux()
  scripts/gdb/symbols: factor out pagination_off()
  scripts/gdb/symbols: determine KASLR offset on s390 during early boot

 scripts/gdb/linux/symbols.py | 38 +++++++++++++++++++-----------------
 scripts/gdb/linux/utils.py   | 20 +++++++++++++++++++
 2 files changed, 40 insertions(+), 18 deletions(-)

-- 
2.49.0

