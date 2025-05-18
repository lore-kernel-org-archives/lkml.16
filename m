Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D982A199E89
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 03:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747539929; cv=none; b=mEweOycouZm9GlbYsbaoCEhheyZ6r2m00Y6LIbQVPv7b3Zl7wS8xHwzjwOBw/KHlVj5TywUw+oixwFSrj+HHyxVTU6wyzM8L7ltCJIfrbwV3rhcq7vXQpP0KIya5ltplTo/LfM3QTeNoReJUcB4QkBN8bKlN280oUJRvHXg5kIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747539929; c=relaxed/simple;
	bh=N9Us2nbh0XQApzOIO/c5+MbO8XeYpzPsZqIhZQnt128=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gHmM0dMXkbHbSheIBQQZxH+dLU0IzaKWrSHXPBPBE5REcvGBywQ4KkoHs/CRjAsBh6De5rZf5xnJFNb/iuoOmZ4uSxH2cmp1myikNUp5rY5mzeXBVCpVrKY5jzeLo+yBQu4u0OtlrsE4aZhMn6F4aczM11g9z+C8umEqAEPWov8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ncI2vTXY; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ncI2vTXY"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HMe4rd023130;
	Sun, 18 May 2025 03:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=TAsBsJ
	F6M+HZLYoEUbyOYukC+7ctXYecFMVMGG3OWsg=; b=ncI2vTXYY0lXRrb8vz2P1+
	7M9mz4UiuRSw8Hp7oUwPUR4OtPyNRguP5mNoTXRDvZz/kAGiASFGfM6yuZ5fnK/w
	zu86QBcJKdXnSexknGOioTn6IJ/T8lOZYoLsw44ubZhdvcGthXapiCAb6pTBdeoe
	7YT9RuB5GF+OwJ8yrR5w1+x0tbiK3kN3/ys/Vfb1nmowetUbyBAYmutOLeP2o+4a
	G03bts6mEHq4RzchVP14YbtnlUYBMoKkX87L0oiHIjJHGHABJ0tUZNd/S2klrWst
	gI+AwC8RUi77o1JMTU9IBRE9mOipt21QYygd9mcu1S2c3jZvSZIz5BsE8r+9XFvw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pqnhtnys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:45:07 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54I3j7el001373;
	Sun, 18 May 2025 03:45:07 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pqnhtnyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:45:07 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54I3FLN7015958;
	Sun, 18 May 2025 03:45:06 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46q7g202dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:45:06 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54I3j58956164736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 May 2025 03:45:05 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F16E120075;
	Sun, 18 May 2025 03:45:01 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16BD020074;
	Sun, 18 May 2025 03:44:58 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.51.82])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 18 May 2025 03:44:57 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Thorsten Blum <thorsten.blum@linux.dev>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/powermac: Use str_enabled_disabled() and str_on_off() helpers
Date: Sun, 18 May 2025 09:14:55 +0530
Message-ID: <174753967076.24504.5804183720757402859.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250117114625.64903-2-thorsten.blum@linux.dev>
References: <20250117114625.64903-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDAzMSBTYWx0ZWRfX/NVJMY4IEiEp pz8GwxsnrMj1P0iyXgs9nhFTphDKe3Ycxx/dCl1YoehfIoLg3J3pZ2+FJZB5c9MR0srzXNdKtIY VNzse13LLpU+Dtt9uhS6J3a/lsLTyf5QUPo0EWn5PxeHd8rEFjJXGxnCZizJO5L97M5qrygnh/d
 0FK470q0MR1w1X11XLna1z49rSN8FQAKDTOcC9nilJqPhbQcbFHx0/jkBhWzPrpwL97QlhZyy9N xpP6LZYVcnATaM6ZFRIfzxv3atJdOVowxkvDm7SX/pfSRcPogO+UYv7ut9EVqStbQCKshXZRIHl re4n75jNT/42Hl1r+/zEloJ/LID3VdpQlj9Q0rlf+xLRv69Q68YuhzNWcQ8MKsqXYlcQKhkp+Jg
 c2uzCykA6hApAmqCB7KAdV57gXc1c7PbmPqRL/lnIQPoRZEsxAJqOFTjmMu1FIEjNJhE9iTT
X-Authority-Analysis: v=2.4 cv=V6F90fni c=1 sm=1 tr=0 ts=682957c4 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=4QqHMXSaZKTnzLmzyTsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 2384TZKJwVMsAWmYam4pY6QH4TT7xXJX
X-Proofpoint-ORIG-GUID: qCOf8b8bOe0WqHGmpO6Lb3ORF4fGSjfO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=706 malwarescore=0 spamscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180031

On Fri, 17 Jan 2025 12:46:20 +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_enabled_disabled() and
> str_on_off() helper functions.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/powermac: Use str_enabled_disabled() and str_on_off() helpers
      https://git.kernel.org/powerpc/c/f36a28192e3cbef6952c1b82d4ef78f26a0d2cad

Thanks
