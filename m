Received: from outbound.pv.icloud.com (p-west1-cluster6-host10-snip4-1.eps.apple.com [57.103.67.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3148B28E56B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.67.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430470; cv=none; b=kpNku7jD8uDxh+WNpM6oSyBoTZvox+3Ye+pETsw3X27KLEbgfmsLf+ThVL8GfL2FTylayI0vL/OVQonx2ZgxW+jfDr4lypkJ9nt94il/HAqxkYoVG9R9iWiU95VO2b0EmydbIJtF2DgO0B9PX1NydR1HFLp2+H8Ijtign4/mMBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430470; c=relaxed/simple;
	bh=AQ13IoXC4m9v9P31XZtq4ZiBTRTh4WHYPGE7vsqSEIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fEmSOyW0vEtsgZjqTYqK89vBOaaqpCF/z99AyqHnLC8ZnULZyxYKo3L/d0pG7p+aSEqv0qLS39FFPDIVvdPvIYxUj85rHfWA7NlQb6YVY9mszSW7gzU3b9fO0YTDyOssI4jrSrzDy8lpQfyMNipzRfD8/nbGXb7XTxA/R4d87FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=CAF35you; arc=none smtp.client-ip=57.103.67.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="CAF35you"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=M13rf6LOK4dwBAi3S0xkl4YinwqU742jKuz44rSZnmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=CAF35your7xlkBXvDPWSMT06Cf20vP1pKOKZKtIekrGDC6UB/knIUsXJX2k5PUfUr
	 aL/dT11iG24ainLodRg612uxk99p+lV01tGmEQSEUybBdurjz7jjpWS2X6XStpqISC
	 ldfft5VQ5T26riLrvxzuGl779poEfS0QPqxGpWEsjq/VyLlzfa96U5KKsKevy/5kHs
	 fpayAdyFBB8ZHkrZfFWDZM4Zjc0lPnRb97wwPM4OEGsd5R98p4y1i8DW27AW8XRFef
	 nNpjJHr9osKPhrLHyvOVOsaiAzNqxis75VP78+gQ20JcO/WieYQsrq4Wlohfli2xVO
	 fB3G/ymop45MQ==
Received: from outbound.pv.icloud.com (localhost [127.0.0.1])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 730D01807E93;
	Fri, 20 Jun 2025 14:41:06 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 4EA20180B554;
	Fri, 20 Jun 2025 14:35:47 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Fri, 20 Jun 2025 22:35:20 +0800
Subject: [PATCH 3/3] char: misc: Fix improper and inaccurate error code
 returned by misc_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-fix_mischar-v1-3-6c2716bbf1fa@oss.qualcomm.com>
References: <20250620-fix_mischar-v1-0-6c2716bbf1fa@oss.qualcomm.com>
In-Reply-To: <20250620-fix_mischar-v1-0-6c2716bbf1fa@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNCBTYWx0ZWRfX6yq2+zIZcv9X
 KVPO81Fwv6FJvk6IaUQHLntsXIGKCDMJ2LrKqLba+hZ6FZen7CCXv2syjURioA49xKEswiZtDTH
 WnMxRkU0tDDZtZlcux6RyZiucwDbYqFEbkwlNCmO5+Nd6NiwfS+P2StGGafs9Bt65UJ7nnUgnxh
 BD1LN88buvJIOOsC2ZS9POtgZdiEhsqXwGncHl1/9mJLvDeaeOK5cyi4dDw+PbkkngUdC+iIWDC
 NgzJD6RyiaLuGnC5FH+YqmVhytdbjWc7O6lEkkEe9MmBQYb6G1BD7r359rv60fnona1qm70Ig=
X-Proofpoint-GUID: 8pIuE0yExZG1nCgiMKhMSt8em4PdDAHf
X-Proofpoint-ORIG-GUID: 8pIuE0yExZG1nCgiMKhMSt8em4PdDAHf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506060001 definitions=main-2506200104

From: Zijun Hu <zijun.hu@oss.qualcomm.com>

misc_init() returns -EIO for __register_chrdev() invocation failure, but:

- -EIO is for I/O error normally, but __register_chrdev() does not do I/O.
- -EIO can not cover various error codes returned by __register_chrdev().

Fix by returning error code of __register_chrdev().

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/char/misc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/misc.c b/drivers/char/misc.c
index f5ef8c175adb559e67dfe905d43d1404b249cc9e..e5ea36bbf6b3d1313eb35d3259617bf90c55727d 100644
--- a/drivers/char/misc.c
+++ b/drivers/char/misc.c
@@ -296,8 +296,8 @@ static int __init misc_init(void)
 	if (err)
 		goto fail_remove;
 
-	err = -EIO;
-	if (__register_chrdev(MISC_MAJOR, 0, MINORMASK + 1, "misc", &misc_fops))
+	err = __register_chrdev(MISC_MAJOR, 0, MINORMASK + 1, "misc", &misc_fops);
+	if (err < 0)
 		goto fail_printk;
 	return 0;
 

-- 
2.34.1

