Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C2923AB98
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750409521; cv=none; b=jxIJdjslPT0bvAE5dLJ8tK/xj+4PNJ1CyuI8Z1gqSz25IxF7dP6EXhIpWRJNALqiLFfhp9yv0js+sSdJcrUG+s3+ZELLX4LBhEJLYV/D2LoJ0O1iZbC8XqWUHgU0iMKRR7wZWz8VI7QcgR+1QUhkXb5qyW288j+04t8xware/dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750409521; c=relaxed/simple;
	bh=wgq+pPQlLwigoibbI4Mg+rGu4bWJwFQ6I/BJULaB7/w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jt4OfgQU/BuOFP3OYzO6pkZCNFzEz1Z6OjT+IHBwqUnYxKihHV/oUybkfBUXcV6imUSX0gGr4CQU6g+GLV+7D8OdzBGCcpirc0wn8B9nCNvtN8SuGqiNGor3SHHwWMj4ydCuyLi4DL3p0W/MSwCQuLnHwrsL9Aaav6WEMKmDRBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=VaAop4LQ; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="VaAop4LQ"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K7TDvI023584;
	Fri, 20 Jun 2025 08:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=7z86dh
	4qXhNZTYI7PvvY2BHZbsWCQbSOuedQNshZIAQ=; b=VaAop4LQi1tDz+S2SE0oB2
	bVkcpZJjY8k37nmcio1QZGyqxCK0YjpZhBi7xbhNtmbsd5BX6kEr+Wu7p9amWETw
	/LUElFcYHnuKUER+9LE0yMj3vjx2eNjBtfIicOC1RZhlj+qYcBAXw8WEFh8A6gaa
	YFoENTjpjU3kogNlfe5ISxXzIxKPrnDyU+A8A61fzTFKaq3fgSUE9JQSctGBcYST
	DwqiFVhAruTKP7xeQp6uqZKVMoQAsN4GRfzEAODeQ2cHyIX8CM+n3TM6HiWtS737
	+YoZHqX1DpC71VmetsaFRIOL1AexsfYcUMPXSQETCXvPLwr6Q75uHcFJu5LEhncQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4794qps8nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 08:51:51 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55K8p8g8002153;
	Fri, 20 Jun 2025 08:51:51 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4794qps8n9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 08:51:51 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55K4kMvx011236;
	Fri, 20 Jun 2025 08:51:50 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 479kdttgx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 08:51:50 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55K8pn3O27722412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 08:51:50 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD09058045;
	Fri, 20 Jun 2025 08:51:49 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32F3558050;
	Fri, 20 Jun 2025 08:51:47 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.90.171.232])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Jun 2025 08:51:46 +0000 (GMT)
Message-ID: <f617320f0afc758e408b3f2bd525ac942729c83e.camel@linux.ibm.com>
Subject: Re: [PATCH] misc: ocxl: Replace scnprintf() with sysfs_emit() in
 sysfs show functions
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Ankit Chauhan <ankitchauhan2065@gmail.com>, fbarrat@linux.ibm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Fri, 20 Jun 2025 18:51:45 +1000
In-Reply-To: <20250620024705.11321-1-ankitchauhan2065@gmail.com>
References: <20250620024705.11321-1-ankitchauhan2065@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: s0yeC42CHfrGHiF9sxlppQA7CrNi-twi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA2NCBTYWx0ZWRfX/DjREGvYfGkF sw8VRNx8HZDogKyJcnAtGoj3xtknJqhtdYIMayQU6oqbzHSpQoXio7Ap/GAq/3BUTSZA1ny1S9n NEjOSvPGZ4bC1QzhZhwHmMI5A7MXSPS14IAMihX5bT/ItWAVF1eWNdTit+BQOqUNcRQwCGysulK
 DAXMlYKl/CxQbbcx7XM/iB7GTfDefCJdp2aclceK6UUZkmuZmYCTmi7EJIhaT0BzM4+M46Qqaqu KE1AG+HOtbEtFQPpwbdDbGqva8XSNUMLQ4Tm76/ymw0NEPsgG0CzhIRPmsh0VAR4V65bCPQilce QyOtH2J8PxJ2wJHAiuoKZ3M08RbCFnwJshRNylJk5XYC2gQt2BxC6GF9MLkYJ7FbNsrt7N2x9U7
 sJaX0QddOH95mZ/gIVJ3oyIkpYnjDG5FLEmaDXlsZosvawO/4DKUKztV6OMsX8Bhy7KKK4Dd
X-Authority-Analysis: v=2.4 cv=NYfm13D4 c=1 sm=1 tr=0 ts=68552127 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=wAt-YwC9e8J5cFVFfmUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: HiMfCx_T6oSwTWmiVMC8VdL7YE42I-bk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_03,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=639 mlxscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200064

On Fri, 2025-06-20 at 08:17 +0530, Ankit Chauhan wrote:
> Replace scnprintf() with sysfs_emit() in sysfs show functions.
> These helpers are preferred in sysfs callbacks because they
> automatically
> handle buffer size and improve safety and readability.
>=20
> Signed-off-by: Ankit Chauhan <ankitchauhan2065@gmail.com>

Thanks for the cleanup!

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
