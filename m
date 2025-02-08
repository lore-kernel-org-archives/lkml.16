Received: from pv50p00im-ztdg10011201.me.com (pv50p00im-ztdg10011201.me.com [17.58.6.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA72D246336
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 14:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739024155; cv=none; b=DuCM5vI98E+9b+3Yfq00l0dsNUOmjBa4Zm7A52McMnr/acVDldthSgea41Kk3ulAsuk3gVkqaNitHvYijSlb6dngKdw3xdpfxs2gno3gtlkdjfYjfnJKXyWBdJ55Zn2uEXCuCVnOukQovmzUVixqKuxQOxpR8IziFpqTT3qIrt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739024155; c=relaxed/simple;
	bh=+6Arw3449YEvsaec+tbPgDndq0PzwIGCCW1mzwhn6EM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GOhS//itYbQt8Csz1kDEFImdrp5frS9S9nVS8w/ApwRdIkvkVVZFOtj5FiGPiRhttn3j409XamqaeGLBPw4hCZ/ZJS79O1bSzey5/ftLrXYECkbv0qY03MwDnxXQTInusFAaSdnLxDuVTL9oxwCPCiodyJYFA2g8cmZaUWMKnA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=gt/XUlrF; arc=none smtp.client-ip=17.58.6.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="gt/XUlrF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=6Ux/PWxxpeTkXEyVJkufknuvXHpPT9YcrM5y1trwYLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=gt/XUlrF+NuxcVuCPGeojFCjST5VmrysIUzA3cEtn+jSU6QlwkBvwzuonvJMtnMJI
	 sbE26yB8XUYTe29emctbhzvFpJ1owszl8qxn2yhCmKuWINyO5iJ1OL0illCIdhsWi7
	 urh/0Jwn53Q9bXhjrO/edebjciCfDUJ1rcNe+Sig4gxkn3zl988GdvMCp5QsgKddga
	 IRzXLQ9wb45YDPi4hlliuOqtpdr5qKJ9fBFiQu1mkkoZbC66CrVuG7AMaq0WaeWc5/
	 Td7bLRcr+U1J16dTviiPPXp4+wsc87/WoxzqPC41yJ69Xc+5NL4TUqFJRcqI02Ecg8
	 bX/9JXIfFd8oQ==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10011201.me.com (Postfix) with ESMTPSA id A7B48680268;
	Sat,  8 Feb 2025 14:15:48 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Sat, 08 Feb 2025 22:15:26 +0800
Subject: [PATCH] driver core: class: Remove needless return in void API
 class_remove_file()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-cls_rmv_return-v1-1-091b37945aac@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAP1mp2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwML3eSc4vii3LL4otSS0qI83VRjSxML05QU4yRLSyWgpoKi1LTMCrC
 B0bG1tQBxDK2CYAAAAA==
X-Change-ID: 20250208-cls_rmv_return-e39485dd3b99
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Zijun Hu <zijun_hu@icloud.com>, 
 linux-kernel@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: X1Mxg3tFfiDH4gCfj0uTPx7-O4bPG362
X-Proofpoint-ORIG-GUID: X1Mxg3tFfiDH4gCfj0uTPx7-O4bPG362
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_06,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 clxscore=1011 suspectscore=0 mlxlogscore=876 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2502080119
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

From: Zijun Hu <quic_zijuhu@quicinc.com>

Remove return since both class_remove_file() and class_remove_file_ns()
are void functions.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 include/linux/device/class.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/device/class.h b/include/linux/device/class.h
index 45ee3a634999331d4f9efa4c85bb1d36918eb27b..65880e60c720834f5a9cf102a93274e03300ce6c 100644
--- a/include/linux/device/class.h
+++ b/include/linux/device/class.h
@@ -193,7 +193,7 @@ static inline int __must_check class_create_file(const struct class *class,
 static inline void class_remove_file(const struct class *class,
 				     const struct class_attribute *attr)
 {
-	return class_remove_file_ns(class, attr, NULL);
+	class_remove_file_ns(class, attr, NULL);
 }
 
 /* Simple class attribute that is just a static string */

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250208-cls_rmv_return-e39485dd3b99

Best regards,
-- 
Zijun Hu <quic_zijuhu@quicinc.com>

