Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A2C174EE4
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 09:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746438331; cv=none; b=VVh7909rA8sj8SKZ7IlDQg3z2sl77SJjk0M5EaqvmIjheTXr5APdd1i/luWmH2EuacKUQuqQrbwKGXpyL7RXpdDiRWE5OS+7AsZlFj+j4ZGvyzF0xp1VBXvhui69yDMyCE5tpJFOfpeTVvtc6gaTjgxhP78tCfKGpfZBIzmTvog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746438331; c=relaxed/simple;
	bh=SXaHpcK1z4iB+BSc9tSoARrxCcf8j04BsifwtY0k14k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kRoWNWQUfORt+FsaGxbkRNTIXCXVVin0tdqeSDiRyReUX+QLTfpSik3KqS9e+fPsKDqyG0MxpD6Y5qIt9lxpNRjCIEYYeeg0PHFiFaYeb0eOC9iqsmpdNHkTmgEXPamcgfo6f+cYvGJkW21bJJ3EFyccwtv74DCy6P3WyI/y28M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=BE7sEhgH; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="BE7sEhgH"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5450p7lb019542;
	Mon, 5 May 2025 09:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=odq4NQ
	NI7uhQDIrO4MJdemyiy21aI4OIXjj1VT0ZNyk=; b=BE7sEhgH54mIX4fy97EMyP
	+u/th+bmOxbnY1RAk+GH3BNSu9e4wz4AbMWmYYhBbRc7Gle1iDAaXPlMxiDcbngP
	5gynr/rdg5hvGFKzoYPv7pDZtE/12pE9ZpGLOlc8QsyihwMwAifeog5TfQyBLoaf
	DT9H2A9Z59Msz9jNvsiI4bbj+D/67h5A8FjuTBRZQGGkpFww58QxXRyFJjrAqzoc
	tjLjCJm/U6uaKhey9nSzLVq3wdyKzNWll9ke0FDNwVXomaTaqJWwhHUb0fNnHQzy
	9PzWsl7cVQlYLuEigd5LJ4TuiCJ4jv+RoAK6VdeVMeGfULjn8/qBuKYxXLZfrS7g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46egcv25ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 09:45:14 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5459jEEC019335;
	Mon, 5 May 2025 09:45:14 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46egcv25cg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 09:45:14 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5458gwcG032220;
	Mon, 5 May 2025 09:45:13 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxymdh5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 09:45:13 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5459j9Zj58196324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 09:45:09 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95D3120043;
	Mon,  5 May 2025 09:45:09 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4979420040;
	Mon,  5 May 2025 09:45:07 +0000 (GMT)
Received: from [9.109.215.252] (unknown [9.109.215.252])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 09:45:07 +0000 (GMT)
Message-ID: <34b4f66f-2bba-4047-b056-8923449351de@linux.ibm.com>
Date: Mon, 5 May 2025 15:15:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] powerpc: use lock guards for mutex Set 1
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, mpe@ellerman.id.au,
        peterz@infradead.org, ajd@linux.ibm.com, mahesh@linux.ibm.com,
        hbathini@linux.ibm.com, linux-kernel@vger.kernel.org,
        venkat88@linux.ibm.com
References: <20250505075333.184463-1-sshegde@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250505075333.184463-1-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1FJcsKm1SK-IK3pDETSJn9mAYgM4MBab
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA5MSBTYWx0ZWRfX9b6dFVvI7rhN sMJngsI7CPDVs9WSUD4/D4+kXeBSovsygRr5NN8EWPB7KtT9VXQZqh+1U5NhO7AGO/ICVQZpnbz 7p+WD50H1FxhVBqkNJOTLIMdmtzuBE7dcJO6LS2YvmlEUYLo5zOG83bSBX7lbar80Ej4hUoyO7t
 Vxb2zu+spZ+Rqgk1O2D5v3gxb4uPkThtmhfqnMq1aIiSVlCIytBCN7i+4wu0cDQNo2m2xrCqx1U KM8ASnBGJZa/mLP/87kEyjnUF65kZEREuxJimi2gTa4lv/ZT98zSyda/T/RW7CUU+JtfzJxCEVg /P9nfvSxdR11BOw3wZbLZgMjOEOpid80qU2aLsb2lnD+6+rrino3irlVQNBwwOTmdLUtK9k5AqA
 aDSx1QbS/A0NBYJTamSFkY3lnhFS2RzObzKI5UQ14Uy9b3Oy/knykIUnpfNtPw+4z4AaMiYH
X-Authority-Analysis: v=2.4 cv=O7k5vA9W c=1 sm=1 tr=0 ts=681888aa cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=_WHVDzdL9Q4wb5IpKhAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: a_-Lms8RERylWpZG-PMiZFHBooqTk735
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=649
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050091



On 5/5/25 13:23, Shrikanth Hegde wrote:
> This is an effort to make the code simpler by making use of lock
> guards which were introduced in [1], which works by using __cleanup
> attributes. More details in v1 cover letter
> 

compile/boot tested on PowerNV(P9). Also ran eeh selftests.
No regressions were seen compared to baseline.
