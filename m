Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA4671747
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 03:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746328905; cv=none; b=OgghCyNMdKseML5/7Nh+V2X10oLJJlOUCO704BdQmNIsdfaxzAtZ6lWuXzrx/5s+uMXI+Z/yoIb0ve3lLG5evC5nzxhMRKXZFt+hbfpwQet0Sg9KodVjJtb+ELFh8n+5Kou8PieHz9UvjC7eMdOjOiVyhqS35sTh3nO5uT0LOzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746328905; c=relaxed/simple;
	bh=vfmddom9UWhMJinSMKSvacl/K4Hsb/WHAtyWkyJNV5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PTyY92xMIcPR8a/WSdFEi1dEj5O6xCS6g2vvmR6NVHg4shMmEnpyAqPs08QKCng1rW4bIstTLid1NYT6f/fpsx1c9wV6M/L+bGrNBaGV25YU5akYvqqPEXXsEPknrsauiZzTkQkZ49BEgQ0LGJcZJ1g6NU+zrltKzGN6HGu97ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=RSr6sJG6; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="RSr6sJG6"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543Mo4b1016826;
	Sun, 4 May 2025 03:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=S2F+RY
	d9wZDLevjGHWb1UYjtqmlYocp8Z2jBhNR8qi4=; b=RSr6sJG6b5rPQiAamMVvOC
	3xFlKNU34L82dLp2BgDK1q0vOqTFiItipms11omCRPsdegJsdu6J1Ps7dNZyRfhQ
	q/rGoKbFu1stYpLlzeQ3KdAxVcKszHnCYQNyTePB4kHWQ1IvP7u1cS7zFXY053Ot
	r7fi5AIxFolkw/JTNbigWUeu6LEQeQxKKJ+T1DhYO0wDDEooH8bzP750T0W1XNcP
	q8l4m2l6Rjs8Dzg0QB/54t0EZj64mKu64vdJyw/Qr06TELNHOPtr3cTgrjMrfc7y
	w8j91KIEhBORiKlH7HbKVro9HuWME6ghs3FTRK8ZISjTMjLcwP2uTXYKNbKzwm1g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46du9v8n35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:29 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5443LSJn017670;
	Sun, 4 May 2025 03:21:28 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46du9v8n33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:28 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5441rRk4032235;
	Sun, 4 May 2025 03:21:27 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxym87xj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:27 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5443LNVA39911716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 May 2025 03:21:23 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1DA120049;
	Sun,  4 May 2025 03:21:23 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0957020040;
	Sun,  4 May 2025 03:21:19 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.99.78])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  4 May 2025 03:21:18 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, Gautam Menghani <gautam@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        vaibhav@linux.ibm.com
Subject: Re: [PATCH] powerpc/pseries/msi: Avoid reading PCI device registers in reduced power states
Date: Sun,  4 May 2025 08:51:15 +0530
Message-ID: <174632869188.233894.4873397095169337027.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250305090237.294633-1-gautam@linux.ibm.com>
References: <20250305090237.294633-1-gautam@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UXduKJ87RUAHaiXd4d5RIheWz6baHltk
X-Authority-Analysis: v=2.4 cv=XNowSRhE c=1 sm=1 tr=0 ts=6816dd39 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=JkMHheumRQZugVL5IKsA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: eYBLSUlFqBKrrKHPfKDuO9UwkmZSFCdR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDAyNyBTYWx0ZWRfXxIB3Q70r1KLZ EA+zvKPK4Cppmf05Ugltp9eZamhHBtrxtWHPFFYccyfNQMI06c7PE3aUgEejtSG0ohEBppwMI0j NifSHS81vhiggPuU8plQE91PEdEofDJFTE0zxi6F26139E08HJCc5eiAncolCd9rdlXN0e/Z3jo
 joOImOE0Xr4LrCcnexW1+LO+P0wvDd7OUJGHbHg3cSDNRAVgJxgUgdh0E/FPJuquKYZvpKcGxkM Ayoj+gsqC53RGilvkGtNczgLLEGuyK6DCeo5OD02jvBfBE5EqIlXAtarfMUiy8XLun39B6QX/IM cFvXNxSpSAiT1YVOeazMN0/DIlDHgTGphSYm60dBQVgFKSZhJup82E4aLiR07oRw+e/I5dAetPQ
 n7ZZa1MdTQi1wM7aUlVfZ0ksMFNnSfYKGWn+VmsVbHIEkLffXMMGQCS0PLG2oXPgkgEXTbbn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 mlxlogscore=559 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040027

On Wed, 05 Mar 2025 14:32:36 +0530, Gautam Menghani wrote:
> When a system is being suspended to RAM, the PCI devices are also
> suspended and the PPC code ends up calling pseries_msi_compose_msg() and
> this triggers the BUG_ON() in __pci_read_msi_msg() because the device at
> this point is in reduced power state. In reduced power state, the memory
> mapped registers of the PCI device are not accessible.
> 
> To replicate the bug:
> 1. Make sure deep sleep is selected
> 	# cat /sys/power/mem_sleep
> 	s2idle [deep]
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/msi: Avoid reading PCI device registers in reduced power states
      https://git.kernel.org/powerpc/c/9cc0eafd28c7faef300822992bb08d79cab2a36c

Thanks
