Received: from pv50p00im-ztdg10021801.me.com (pv50p00im-ztdg10021801.me.com [17.58.6.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CE4246332
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 15:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739027948; cv=none; b=XNdXLp5Ux7TME3t9d0hKtwUKlLp1R20/lqbKHKDA0vQLzOt2w2IKEs8BfxL0iiEWEqqCJYDoYJ5I6ASbiZZuploXQu37kg6Bgs7+Rvt3O9zWQR0q8FzlKM6hKTdHFWxTnWVef31dXh2BJx+Usjk33AocHTZAPLa3jxYkf9z/Lmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739027948; c=relaxed/simple;
	bh=dv25vtjn2MxKTY4UKEauqf+tOxPZbBBCHfDLspW6j5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qyD77J93cJYKKBE0qfCutQz/bSL3AjADCvtRb7qfTmF0RK4edqJz5AKnZM65jIMy4DidWdUumdgs74R4nmt+6zbuh+T1N2WouwPmhCAMRgAVN+ZpS3XTUvyXVhLi+e07f+P5wmrR+8SbPb+kR46nkFUhYLE1skvi8kBKUs2zzwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=ahCnOiUH; arc=none smtp.client-ip=17.58.6.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="ahCnOiUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=2LMd/5thrRr8rI/5by8zTWFhH/z2IgcHxOvJTMAISOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=ahCnOiUHc3bvt/4s7PoXSUSrZJmhLAoOotCFKfMmvHnXyRrHJPeWP6iCpkulxsJId
	 8VqODZD1tnRsrwwNYtXEhGhD835o8orb4K2LBqDA1pBhFmfY2DHfyt948QwKIBhwd2
	 QCqLrMXs87wDxRelR1P+R/Jvzu/GqQ7k1bGTAdB73ynHiEsmmCfzaLwBomu7Z3k6jx
	 2Sdrf9Tk9vu5lgKkxJun2CuS9wgi/jtc5r7DAdKAKIiS7tphQmj0QkAON/0ue6MWg0
	 SgYcRP+W5jyl91vykznrsTzxZh8Wtv1suaqEJAT1A0uTCaDN5Wx5wMQ6k+5A7aIpSN
	 5Qr2G4ckOfs2w==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10021801.me.com (Postfix) with ESMTPSA id 65BDE2010306;
	Sat,  8 Feb 2025 15:19:02 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Sat, 08 Feb 2025 23:18:39 +0800
Subject: [PATCH] driver core: Remove needless return in void API
 device_remove_group()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-fix_device_remove_group-v1-1-8a5b0ac0ce5c@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAM51p2cC/x2MwQqDMBAFf0X2bCCmLYT+ikhokle7hyayQRHEf
 3fxODAzBzUIo9G7O0iwceNaFIa+o/T7lBmGszI5617WWW++vIesYkIQ/OuGMEtdF5OfKaaI4ZG
 jJ60Xgar3eZzO8wK3l+YtaQAAAA==
X-Change-ID: 20250208-fix_device_remove_group-d4cbcbe13db8
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: oYRuUpuFy2xarWRn4PbfjzfeJTURQoje
X-Proofpoint-ORIG-GUID: oYRuUpuFy2xarWRn4PbfjzfeJTURQoje
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_06,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 mlxscore=0
 mlxlogscore=984 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2502080128
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

From: Zijun Hu <quic_zijuhu@quicinc.com>

Remove return since both device_remove_group() and device_remove_groups()
are void functions.

Fixes: e323b2dddc1c ("driver core: add device_{add|remove}_group() helpers")
Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 include/linux/device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index 80a5b32689866c39128b4a564f8521cec663de01..605b60254f6d812eae4b25120a5c32931311f70f 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1268,7 +1268,7 @@ static inline void device_remove_group(struct device *dev,
 {
 	const struct attribute_group *groups[] = { grp, NULL };
 
-	return device_remove_groups(dev, groups);
+	device_remove_groups(dev, groups);
 }
 
 int __must_check devm_device_add_group(struct device *dev,

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250208-fix_device_remove_group-d4cbcbe13db8

Best regards,
-- 
Zijun Hu <quic_zijuhu@quicinc.com>

