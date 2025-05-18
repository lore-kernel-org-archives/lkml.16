Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC944B1E6B
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 03:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747539951; cv=none; b=l79CiN9fzQLYgwI1S8dNy5c/Sm9ZHcol6DwPQWVUTM0Am9YMoA5bwP1Bz9GrLue7xG3HrZ3yExlUR3huYxGWPrbDR98rQ+eVQAEZhuU5Yx8QwlATtvabox8D6Bg5CIdtgI+dDYW/9tVSoc2tGjHyEyAPSAvQcHcyY8ifLU/NvyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747539951; c=relaxed/simple;
	bh=1CWALF1wrQkBJY3t+c0DqpsNcrnh45DNAO2hfucJ3HQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cn+wGT1ct6tFSxPifpIJdb9pg/9K8OjdBxj/6KuSjmQvbgZmMIKOYb1sVYSLYYHwvP5lDiL6wH106cQ5QfOuBdPFFxj87d+oZKwbIGDUMrrs2Lp8BFbUG4TpRcShIMSPv/D6e3KL3JPuSguKzjD7CWhEdF9I+oEHv5mQkSruVec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=tgKQtHYV; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="tgKQtHYV"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HNGHcF030018;
	Sun, 18 May 2025 03:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=pHOFSE
	VOMTefVuiZWo23oTxLvoEYVyE9c1h/ECt/UIw=; b=tgKQtHYVRzFRgDZMTeKbL8
	tgnVDIi04Z6+rzhdwvCpow1WL0qWBFmOkjB9O1n1XZs8zwqL6NUZllIt5ZRHlMZJ
	AdZofgwkLk1lECLE8VQBhN7+0n/aB/6mRRHXkrhOT7e9Esfz3a45XH6YupkAEwO6
	fh9Ug91jPOBXqVcb5HoT6PsZwjgjNH0PNZGJGY9HVjpauUR2c1hkDbat1uf4D4V8
	KlZ7uvXli1OFdg8FCqoFoNuXZlJ7FcwV4MCT7ka1LI1VFyDtWooP7rIKLEGBthj2
	Plg7iS5YhuGd18KijHE2DcjHTKG9Iv/2ChoVplsn/6f+cgO68VJHH93eORD5nDrA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46q05696vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:45:18 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54I3jIQk029319;
	Sun, 18 May 2025 03:45:18 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46q05696vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:45:18 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54I0bM75028874;
	Sun, 18 May 2025 03:45:17 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46q55yghwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:45:17 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54I3jGZM58327422
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 May 2025 03:45:16 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E9DD20133;
	Sun, 18 May 2025 03:45:16 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 378CD20134;
	Sun, 18 May 2025 03:45:12 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.51.82])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 18 May 2025 03:45:11 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Thorsten Blum <thorsten.blum@linux.dev>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: Transliterate author name and remove FIXME
Date: Sun, 18 May 2025 09:15:10 +0530
Message-ID: <174753967074.24504.676189265868937968.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20241110162139.5179-2-thorsten.blum@linux.dev>
References: <20241110162139.5179-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDAzMSBTYWx0ZWRfXzFa/PwvIBGgt OsFexqdn6huGOZL0WTvnbpG3irC0tNSTq8Nt5Sbe2767zan4zRoXLtw7+sktvrHxF0Go8pmL39K 35idnPCuA2tGRT5W2BPNdVCH5fJvTlsVjRs6tESOXNo3e4GfD9Kb7QyjX//yrwLlx8fw3zyz+rw
 tS26qij6yQvWXf4khnQJ4c+3icZiwvA+KgP+ZY+5YTwiZW5vc8n75BxmVREIl6bVLKIGQ4Jv10R Kh57eGwWmv+NXLIyUnTG5fHOhgkqUs8nWx6A9TPS7dLyNUxoO5UzRwIhHZj2lAaF+Uh9wH/v2u3 ruSy/xnsyDibjStibsQm5lc9qvDbTz+aCSutvLEIaXrqgoqtA8Wjb/LjKuSPABkt/6xOdodeMIf
 yhj70vv7dZU8TIHNwqRevUxmSIIvD2k8J8UBI9qs+1R5/sCExSemHbfUpYXsKpoyxSun09mq
X-Authority-Analysis: v=2.4 cv=H5vbw/Yi c=1 sm=1 tr=0 ts=682957ce cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=1RRbINDQn9zaYogeI4kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: izCNLpHsxeDokV39_6TPDXYIb8uV8Dvb
X-Proofpoint-ORIG-GUID: 40rC4nPjoPK_GaxmW8rIN7fOpfmxpymR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=748 phishscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180031

On Sun, 10 Nov 2024 17:21:37 +0100, Thorsten Blum wrote:
> The name is Mimi Phuong-Thao Vo.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: Transliterate author name and remove FIXME
      https://git.kernel.org/powerpc/c/8bc3252436d371e7ac505f9f2685611090680a48

Thanks
