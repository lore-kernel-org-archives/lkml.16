Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9A026A0AE;
	Tue, 20 May 2025 10:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747735692; cv=none; b=WcsFdyJzF5LyDfLP6ENpx935Ug0D6LeqEFBxHx0M3EQgMnMgbRmOhSH9Ls+GSMmvLZy8LDrVjB1+XAJY83UWUuB0IISVYju0BfFT0SNMDPNEMckrtfvm9/+jdofkQDMkzCy0NT8M7FpeX6pRdZpV8GaKflm0AB4boxH1/QWY4VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747735692; c=relaxed/simple;
	bh=zolhmYhyHr4joDT+gBXqiUzVZUaMtnM/IO5wc7F7X2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mvyWkgrdSzPPQWLyEvGCAz9h6DpprnPIsZfHDUY1RgLXiNutTsQN+Hr4EqwyXDYnYX2tkFFpcxY01TcOeS0YJ3jaX/bnuwjzIU3EoJ17t4Vq2QpVZfSs8QGq6bO/m6meYTCzbdUxnYO91NkzFW1oePsHjJOL+WcJpVS3CUtp35s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=tEqq2Y5g; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="tEqq2Y5g"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K9EvPw007692;
	Tue, 20 May 2025 10:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=JidFdJQ6oQzitTBq0oMAAsFklOtwX9ZBeJp/hFh0d
	c4=; b=tEqq2Y5gZrdBB2/7raVatsD7qwFQ3GTBAhotNExLZSxSIt5TERXupzwfc
	xFzpZ3N3ZjbcXU+xGew3X1Hoq4XAp0eDPi/FpNtW4PA2/MhIYrs6bppoYjXM6dww
	SXWre/alL73OESt5/ArUqLKVdTci2gezxO1G8JgxjXyP7c1KC4E9Xp5ZMrPkCC6O
	yFo0TVqywyXt6HbhkkrfYecpfSDQftRkkshUTYUxX+EENo874jiqEWYrqhtZmJXI
	5qV1+JPCWsNzfuHyNOPEjf7NLwFZ2iprFLc3Ko8W/o49N03d4LFzxrSKattrZtcS
	hjPEA2hJgtxNnIYb7bj04yET+kCcQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46rpxkr8nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 10:08:00 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54K6QZSi002433;
	Tue, 20 May 2025 10:07:59 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46q5snu9tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 10:07:59 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54KA7vmv27984582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 10:07:57 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7224A20092;
	Tue, 20 May 2025 10:07:57 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8A0620091;
	Tue, 20 May 2025 10:07:55 +0000 (GMT)
Received: from li-fdfde5cc-27d0-11b2-a85c-e224154bf6d4.in.ibm.com (unknown [9.204.206.228])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 20 May 2025 10:07:55 +0000 (GMT)
From: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Swapnil Sapkal <swapnil.sapkal@amd.com>
Cc: linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>
Subject: [PATCH] Documentation/scheduler: Fix typo in sched-stats domain field description
Date: Tue, 20 May 2025 15:37:52 +0530
Message-ID: <20250520100752.39921-1-vineethr@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=EM8G00ZC c=1 sm=1 tr=0 ts=682c5480 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=3Jt-_lBcBdfqp74euIsA:9
X-Proofpoint-GUID: OPolaX72nBmtf1N0KS7Vk9xLbS7cfE_E
X-Proofpoint-ORIG-GUID: OPolaX72nBmtf1N0KS7Vk9xLbS7cfE_E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA4MyBTYWx0ZWRfXx4++rjdYUnKK 9bYO3GLzBU1blbv5AImIiEc6kqPVyUqypkJLXGsDhCZ+22aq5+1MioE4IZQUyYtjPHPlLvqIfN3 dViP0TNkk6OfWBcGSSWAmtzkusFjRFWd82Dk/bwMmElQJTG8CQQlBizVzUqwXoKogZmidwpc+JE
 08ceTibvtQ2xGzeooO0Mcg66o7E99Qqa+wRA0dmucMlkR1xJR0yHsTSHjsqLpRGSrmjF790gje5 diihHMfQkt9HxeiVwPfCY9L5vU14oNcDd/+EG15TzyX4y5dW47vEXryy4Iwz52T/MeaZBsIDK3J z1RpFuELKQWp92MKXbQs42p887zMhXjKsNhvzmYALhsmN9c9HoB6R2B0sX0a2TygMVt/SDxB+1I
 5+HrHrxQ6/DznPdWua+8ARy2PR6H7M6CyMiUeWx7ANFMV/BRi72jhAlon2+GiaA6FtwxjD+p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 clxscore=1011
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200083

Fixes a typo in the description of the 23rd field of the scheduling
domain statistics, which was missing the word "cpu".

Fixes: 7c8cd569ff66 ("docs: Update Schedstat version to 17")
Signed-off-by: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
---
 Documentation/scheduler/sched-stats.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/scheduler/sched-stats.rst b/Documentation/scheduler/sched-stats.rst
index 08b6bc9a315c..d82e7d2b54f0 100644
--- a/Documentation/scheduler/sched-stats.rst
+++ b/Documentation/scheduler/sched-stats.rst
@@ -135,7 +135,7 @@ of idleness (busy, idle and newly idle):
         cpu was idle but no busier group was found
 
     23) # of times in this domain sched_balance_rq() was called when the
-        was just becoming idle
+        cpu was just becoming idle
     24) # of times in this domain sched_balance_rq() checked but found the
         load did not require balancing when the cpu was just becoming idle
     25) # of times in this domain sched_balance_rq() tried to move one or more
-- 
2.47.0

