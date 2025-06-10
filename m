Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497F8219FC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749523161; cv=none; b=KP+5wulqJIuOphBRS6oWTQzwewtyLumEnKDq+L5MBU6D8Vj62hNXLvt8GPaeCqOEnKagitMJchuTq4aQnVZppX/sVHGV9yT6zqsL0DcAhNbMyYUlxTnBhwnAxUwy7S7FI2gZGO9ePjYnJfAivOViRPneegq5GUyw5FJA2AuF9gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749523161; c=relaxed/simple;
	bh=isEtOQq99WyropsCoa5Ocs+eFCym4GSZBnR/FA/aS4U=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=n7x+Nm91+xBxRqsnPS3az4PtuLvogiRf6WGsSbcxidFj3aoWe9PbuA20LtSyUhH1WEhREGkwkmXKDC9zbpIG62ZNMH6mJMBbhEXyEZ9kq857PAT0JdZKHPhG++Wb7kHvkARqOxuKTREUP67dJL+56Ti6AfNmV8oiekLdRR2uqoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=OT4C18od; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="OT4C18od"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559KmcNk015375;
	Tue, 10 Jun 2025 02:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=hRFjUx+dw3W9iLAWoYr0yzysCeYt
	A/KvlD5jwetnsSA=; b=OT4C18odtNmECT6z4nnpVen4M75QjLAowBJZJ9JKHpUD
	kAQyLxrkVPc7/M/5xBQTWirQc0vK1aJJ9QnJKnr7oqVq4vfOakGbZx8pe1JVXg3K
	NS/Ingklp3zsdQ++tfDkrJn8xlmAYwMqzIaxyCS/9HyaA/fnM8SuypNufxjEr/+U
	faje3+g+KamthBqbM2vBBKs9YhYcFaN2rQ+FBmmV6vHEigCnrL2VKg5pI5B5lBE3
	Nwp17BMKxlsbp+Mj+MytFdpHD87YJTajDHqQgGEdUGx1wcqmOoplxNp7WyJKmKWV
	9xxeEgOPb1ChkNsFynBdB0aQKdniLyxR8H0txZ/qoA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474hguaux1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 02:39:14 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55A2bCJP004406;
	Tue, 10 Jun 2025 02:39:14 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474hguauwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 02:39:14 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55A0H4YH028110;
	Tue, 10 Jun 2025 02:39:13 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47518m8aqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 02:39:13 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55A2dCro24969956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 02:39:12 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5322E58056;
	Tue, 10 Jun 2025 02:39:12 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BAB9758050;
	Tue, 10 Jun 2025 02:39:08 +0000 (GMT)
Received: from [9.43.59.164] (unknown [9.43.59.164])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Jun 2025 02:39:08 +0000 (GMT)
Message-ID: <be959fb5-0cab-4a7a-890a-0ef4e9fc4d2a@linux.ibm.com>
Date: Tue, 10 Jun 2025 08:09:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: haren@linux.ibm.com, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, ritesh.list@gmail.com,
        =?UTF-8?B?15nXldeg16rXnyDXkteo15nXoNeY15w=?= <yonatan02greental@gmail.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.16-2 tag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Pfr/hjhd c=1 sm=1 tr=0 ts=68479ad2 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=4KhVPFJXfovPVW0G7AQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: sqnQJ-oIpfqIOy9GH8XZnQUJm4A0Usbz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDAxNiBTYWx0ZWRfXzjdeFGWgPXN2 u1p3xREIFtW9rptqUYLmvV5M1yc1C2N014BMpvgXo0vT4KvlFCxiOjAxw2TVvhPxlCfwNCS+Lpm UYwDGMPGqq4EVMidYr8sDb+wC14kOafJQXRF4n59Xk1ckJakTWYr2SeyTCsCskV1qv5gCTMo+Jw
 KEa9xM9hPSzbARq1L/IVNsUCiu4t5ZouI3kU4WwgUkIetYdPwjQfTXrBWrf4WrxN/CTXBOEgOko iHf/xcWJlFXZKxY9oB2WvM7ikUyUx+KxM0JcICosPd4DZ315Y18Rr1dlywexAdxMPpMLybjqYe7 /H1WFBCLSLsHS+2S/BunR/6DUHzf/1vqcdJRfO+QjX02xYfoO/g97myk+VEGYWo2bFkLq0kIz2d
 +8/8ew4BZKc8JuzxQkyWlBwjWhSTFOfGZZcHTCXeJR9IwLNvJ2I4H3PCcRwnXtZq8pEC+I3L
X-Proofpoint-ORIG-GUID: vzHyflECsKsXXv8JG8I2VlKtIt993jAf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_01,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=735
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100016

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc fixes for 6.16:

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.16-2

for you to fetch changes up to 0d67f0dee6c9176bc09a5482dd7346e3a0f14d0b:

  powerpc/vas: Return -EINVAL if the offset is non-zero in mmap() (2025-06-10 07:56:41 +0530)

- ------------------------------------------------------------------
powerpc fixes for 6.16 #2

 - Couple of fixes for out of bounds issues in memtrace and vas

Thanks to: Ritesh Harjani (IBM), Haren Myneni, Jonathan Greental

- ------------------------------------------------------------------
Haren Myneni (1):
      powerpc/vas: Return -EINVAL if the offset is non-zero in mmap()

Ritesh Harjani (IBM) (1):
      powerpc/powernv/memtrace: Fix out of bounds issue in memtrace mmap


 arch/powerpc/platforms/book3s/vas-api.c   | 9 +++++++++
 arch/powerpc/platforms/powernv/memtrace.c | 8 ++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEqX2DNAOgU8sBX3pRpnEsdPSHZJQFAmhHmhEACgkQpnEsdPSH
ZJRO6w//Wg+R/eJnGwTCHcemPS4Qxd+PhvMQsW+2Z7nPMA5I/5qG6ScIRD1L9dja
SS0qPwzKBXzOo36ohVev7t6F8It2vI0XgqOEphsesqMLej9y3F8mivQOBMXTfxWG
/1EL1E9ypMK0whYuInw6/PHGRN+KtXF1HHjvIppQ7oNVd7MvaSgOutMPeF3m1oKa
P/suie3uDqSpE8XJSQkghNnk44isU9UpncYbLwy2mnG8N5mXGHVjmIiU5lGYydVO
hnLjzHsZunPBZZ4FKKqTZuT1NiKvRACaKu0l5s7hc/vXmv6U9qCMYpMcU06Cdti0
Bc+hgXLNDyf+BZsElL/TRifDMYJIK0F8uUMTYOb8KatvArXqHmNQObfUSxYRJaJE
u0/c82NMrOLJuB1PAU2nlGtZXf2JVPYcrSg4cMoGQ+mllRoJAjGLXZZ1Kvf6134p
UjI8QrYgtNmljd/qyAhlXpvpAjlmJdXLPYhtGrHxIH0w9EqD9Opvcnb3v+AoyeJd
ujsTRMRtgFealv+zovoBRAuRAFYEVrSValwnd03ziDTKHEa8iEYFeCAYwQHUWB2t
vSjxQTqpFnZS8O1pES3G05vFf81Djkzs1BxsnJlvZQKm1+keUu12L/2lb33ZMrq3
wo9mYrGolW6rPVQKx5kGqxg4GgqBRkh+UocAWeT1tXTUJyMStp0=
=Gm1F
-----END PGP SIGNATURE-----
