Received: from pv50p00im-tydg10021701.me.com (pv50p00im-tydg10021701.me.com [17.58.6.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BDD8F5B
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 14:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739025974; cv=none; b=p1tolaqSodUpb90gj1AJiAJ60ZT0k1kOo1GDTYOtVAFPyzR2LwNG+11i+81zDBENGw1HR2DmFm9ioTZfS35e7L6/IMSV9v5tQG0MUNEl2/R/H/xacgWp7459JThz0r+sntGUwuqP8XcnUu/rIPO8CawKFq/r91B3b1OAvUYJc5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739025974; c=relaxed/simple;
	bh=TVeiZbuK+2rTLXxSC590JWmJS6wgT99EFo1yoPYm3b8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=k4t/hXipfj9f9UJbivynH7dvKFrYsuAiqDzSkw9aLSrOzSPHHSfBvqcu59E+7wU6QL3xcCx30l293OJFh8S0vIO32hHG/1a8PAIgRxUO5U1Nq2uSbNTLI+LCmwsl7BpX0rbzgygoIDRN+4G4gTyD4v0Ae5wDLr9qmHl9/WDNa0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=lhKBCK5w; arc=none smtp.client-ip=17.58.6.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="lhKBCK5w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=fj9r7R1BbGj3qp7gmu48SP5gnTn8LwG+0qCJX4cCINU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=lhKBCK5w7UnqVMphwFKW3l3DoyBJxEq2CIzty+dNTXCOAgVckrrrRWbHs9lnMJ4lu
	 TuxEL1GEH0nCsaP25pe+zm6TuMhXtWUyArjF/p2tVRHn7nAwzDaEZldPytxGGZdRWP
	 G3GAaFfrIdJD+RGzjKfnfz22EljV5nqUhK2E17yoflUWU1JYX+tJPtkjxGxF8jGSsA
	 //yKYL1ymQ4g8w5K70340DJs8j4gOHr2HHYYwFXBYu6btOYvJM3pUtl6ufT5enVReZ
	 eNHEeYIJLycI2GTUUvkXfqD/cDvrwD9XvFrhDUZBL5h8sxvQewjHD9lOoarlSxrf3M
	 7zpkmJ8KGIsnA==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-tydg10021701.me.com (Postfix) with ESMTPSA id E377FCC6813;
	Sat,  8 Feb 2025 14:46:06 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Sat, 08 Feb 2025 22:45:48 +0800
Subject: [PATCH] MAINTAINERS: Add driver core headers to DRIVER CORE
 maintainers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-drv_core_hdr-v1-1-8205b0483e3f@quicinc.com>
X-B4-Tracking: v=1; b=H4sIABtup2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwML3ZSisvjk/KLU+IyUIl3LlCTDVKMUIxMzc0sloJaCotS0zAqwcdG
 xtbUA3Oa0VF4AAAA=
X-Change-ID: 20250208-drv_core_hdr-9db1e2d24679
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Zijun Hu <zijun_hu@icloud.com>, 
 linux-kernel@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 6TiVs5_Dl7QJeUVNbWvpYbSlOaYqsFJ0
X-Proofpoint-ORIG-GUID: 6TiVs5_Dl7QJeUVNbWvpYbSlOaYqsFJ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_06,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=585 spamscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2502080123
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

From: Zijun Hu <quic_zijuhu@quicinc.com>

According to get_maintainer.pl output, there are neither maintainer
nor supporter for the following driver core headers:

include/linux/device.h
include/linux/device/

Add them to DRIVER CORE maintainers.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa06545e2861abe46ea7029f9b4d3628e..831dd6b0dbdef6e7510919c8f34531d79da12b8a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7106,7 +7106,9 @@ F:	Documentation/core-api/kobject.rst
 F:	drivers/base/
 F:	fs/debugfs/
 F:	fs/sysfs/
+F:	include/linux/device/
 F:	include/linux/debugfs.h
+F:	include/linux/device.h
 F:	include/linux/fwnode.h
 F:	include/linux/kobj*
 F:	include/linux/property.h

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250208-drv_core_hdr-9db1e2d24679

Best regards,
-- 
Zijun Hu <quic_zijuhu@quicinc.com>

