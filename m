Received: from mx0b-00007101.pphosted.com (mx0b-00007101.pphosted.com [148.163.139.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524F920C02E
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 22:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748470058; cv=none; b=HcYYCJ6X2e0gekwmrLWk3VA+ClxGuqwcywDoJ1+dGcZvgoyyn6v2bT9c7E2yLQbnaNqye3FUpCkJ1VWLr0IsPpEy8Kx6sBwg91ml+XrKjp20bDke5ETHLqUHHmXnJ1XzTvHrK/9hbwjvXtZXItHzeY1vXfwU+z683VlxInH45y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748470058; c=relaxed/simple;
	bh=8Ej1CQfQ7DfMmCY0i3p9U4s2fRLiRdWBUCvMrXo5+4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p6YSQdFvq7YeXlwVF1OJf5FvFKd8VPgjK1/Vjv6ugBDFVsOJONXexAL+bl6EPB0JwX5uRV4eAcSSK6BQUTviIEY1Nl8jf8yMOfA1U2LxDElfYlRD7elx4rhM/1oSBzJw4JjTWMCjxIf56SxF+64vUcY3LzOG448y03OnhYKGHBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=illinois.edu; spf=pass smtp.mailfrom=illinois.edu; dkim=pass (2048-bit key) header.d=illinois.edu header.i=@illinois.edu header.b=pquFUU6P; arc=none smtp.client-ip=148.163.139.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=illinois.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=illinois.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=illinois.edu header.i=@illinois.edu header.b="pquFUU6P"
Received: from pps.filterd (m0166260.ppops.net [127.0.0.1])
	by mx0b-00007101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SJWMwQ032606;
	Wed, 28 May 2025 21:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=illinois.edu; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=campusrelays; bh=WqZLmxBO
	4LRIFtRWYHBgzSMaAZwMtDHRa26RcVdkZo0=; b=pquFUU6PojhPIA6AfeLV8q90
	2K29YVDzwZS1uSEUXUeui2cyOcX8DCAHL7JBrQuoEgYSkjqFixNgXoK8JyoUeiXp
	xWrxG9Z210mLVOCJK/yjOoED6XdOo6bH88f75y1ldQYZcNepNZafLQZ1t3S2/Y8d
	sjPGEV7Jl3kRm8Zwzzm2tDB92qNG031ya2lyaxkmNUXa1lXfaSAmNeK04kogMhuz
	MzXtlwxWOLezMF2JyYIGFS+w7f2M3kL89J2LfuzT6b8AqYn4YkA+QAyhYT+5HHdS
	UfJRllydjbcN8SqKk7avcV9jjZTJdWzS+m4zciNOZnhDt1kAjOSYTQBK+gwvAg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-00007101.pphosted.com (PPS) with ESMTPS id 46x8qxrueb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 21:36:04 +0000 (GMT)
Received: from m0166260.ppops.net (m0166260.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54SLa3Fh016307;
	Wed, 28 May 2025 21:36:03 GMT
Received: from localhost.localdomain (sprlab008.csl.illinois.edu [192.17.97.69])
	by mx0b-00007101.pphosted.com (PPS) with ESMTP id 46x8qxrue8-1;
	Wed, 28 May 2025 21:36:03 +0000 (GMT)
From: Yikang Yue <yikangy2@illinois.edu>
To: viro@zeniv.linux.org.uk
Cc: mikulas@artax.karlin.mff.cuni.cz, linux-kernel@vger.kernel.org,
        yikangy2@illinois.edu, shaobol2@illinois.edu, yiruiz2@illinois.edu,
        jianh@illinois.edu
Subject: Re: [PATCH] fs/hpfs: Fix error code for new_inode() failure in mkdir/create/mknod/symlink
Date: Wed, 28 May 2025 16:36:03 -0500
Message-ID: <20250528213603.222063-1-yikangy2@illinois.edu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504032355.GB2023217@ZenIV>
References: <20250504032355.GB2023217@ZenIV>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sIosjSiFkkC39z0WWs8DU4NRfAuepHVs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE4OSBTYWx0ZWRfX35+BNqGcCVMA KY8aeOUzdri05zm7IbZsrfLrdu4Kkr8U3TaYQGxDBTbgAySFbb3zmS0lJU+FuwqX0HQ28DQPKMp 44XIU35JGiDiFr/AJRmNFuyAMv9Qj0AwuYZqI0/5Gu2hIW+vXk5fC5ZFDjqPtny9I7yoXSoo1Yl
 GAiJx8i8PSzBj8iBaQcyaZ5smW/zw2avo6QVHNaFMW66iGy+yQ1QbeU5oylISyXHBZPP1skVgIt Omk05B/qMyJviMLXSuI7vUCEl6CL9b54eZSZ5kJZXJu6LhCteuwuokWyxyfTvW4VYuueefA4Zle pYv3foZrI8JMo1L+DqXzWthsdJmGSdnxIQ1Fw79T4UFIS+vbEOj/HY2yrIW+g+McJuLwowDS70J
 tSX3oyI/4J0QMTNMw5B/xCQBtXJ7HQvedkbqyZvceCRYr3IT6xGdbVwvUQje1s/9MjbNVTuk
X-Proofpoint-GUID: NxXk-xSluYr4G8QPjvuuT5k45jLXFqFf
X-Authority-Analysis: v=2.4 cv=UNzdHDfy c=1 sm=1 tr=0 ts=683781c4 cx=c_pps a=+i0Qcp0HI8C2S+A/gso+oA==:117 a=+i0Qcp0HI8C2S+A/gso+oA==:17 a=dt9VzEwgFbYA:10 a=x7bEGLp0ZPQA:10 a=oxbsytTKRh_yBJMSUh8A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_11,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=cautious_plus_nq_notspam policy=cautious_plus_nq score=0 spamscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 mlxlogscore=708 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280189
X-Spam-Score: 0
X-Spam-OrigSender: yikangy2@illinois.edu
X-Spam-Bar: 

Sorry for the late reply.

On Sun, May 04, 2025 at 03:23:00AM +0000, Al Viro wrote:
> Frankly, that amount of boilerplate is begging for a helper function...

Could you clarify whether you meant:
(1) Simplify the patch we already submitted by introducing 
    a helper function, or
(2) Simplify the implementations of mkdir/create/mknod/symlink
    by extracting a common helper?

For option 1, the current -ENOMEM fix is intentionally minimal,
but we can certainly wrap the logic in something like:
hpfs_new_inode(dir->i_sb, &err);
to conduct the error code assignment within the helper function.

If you had option 2 in mind, our plan would be to
first correct the other similar error-code inconsistencies and
then consider extracting a helper function to reduce duplication.
