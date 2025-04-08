Received: from pv50p00im-zteg10011501.me.com (pv50p00im-zteg10011501.me.com [17.58.6.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6600C8632E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744118810; cv=none; b=q9vNY7ubx/UbWMA/NzyjeBJg4HRxz9L3znsnJBMtC5kfBu9cj/ulx5OXuJ4XUR41JAi4SUxd3ytBoNaJulTCQaTbpIIxQQVt955SCWoMbPPlW67eFHng7ROpAvYXnY/i09LlvaiSVcQIuVwRgyzEaEvcu5aSPWQ2n2sg2ep0WKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744118810; c=relaxed/simple;
	bh=D3TLft5vzDtLci/D0Mm+2AYzOxRwJOtxDijEOJv/d20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QnSnXHMCSW3WLwIZVGxqf7/jpJ/3FE50a/1JHek05xKxvDunsaqNruM0tLUNwfUeZVGOK4PK1d5qsdWd37vZEvJhX9KVreE94UDr/yujUTIb+CAxIwp9vTbQMKJa46s5Ea/zmEYS7xUmWqK7C+2oQKRDYc0aYKMp1TfgjK1i5XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=A7+8kzQI; arc=none smtp.client-ip=17.58.6.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="A7+8kzQI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=WiNh5TKh3hAOkb38yFzUqVNfpE8DqEf28HYHG1c8eo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=A7+8kzQIF3s4pmHH0XWDacSy5eeEAxAjJxMxhkb26ueniBt+RWOLltbI5HPLk2MUA
	 rO3NngrdDecPfxBdXwMuU15biWLJVmCjDMqORPB9od5f0GwgQpU5YZpE+/QTx1vBD8
	 wZ9LF/oMxqFmP8UUj340lbnnaoFvhobGvlG4kLx4Ra+0duHk/roRtZ1TKxImbQdOO+
	 mLAOwHxVO33Sk6ly7MY6ME3VHAWyabj+0+I4D/QQpCdOCqnsxtzwyvoVjgy5wYpen4
	 CQEfNiNLiew+SO9Ik1N0K5V+/LWVFNjjN2RdEKYjl65VWQz7a8AE2rodBZK2ri9c/Y
	 n8zc5DKs+RyXg==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-zteg10011501.me.com (Postfix) with ESMTPSA id 844F64A010E;
	Tue,  8 Apr 2025 13:26:42 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Tue, 08 Apr 2025 21:26:09 +0800
Subject: [PATCH 3/4] configfs: Correct error value returned by API
 config_item_set_name()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-fix_configfs-v1-3-5a4c88805df7@quicinc.com>
References: <20250408-fix_configfs-v1-0-5a4c88805df7@quicinc.com>
In-Reply-To: <20250408-fix_configfs-v1-0-5a4c88805df7@quicinc.com>
To: Joel Becker <jlbec@evilplan.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 Al Viro <viro@zeniv.linux.org.uk>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: rDoWmsIkZXYLyvFoz1oiR2Yxxm_ruSsn
X-Proofpoint-ORIG-GUID: rDoWmsIkZXYLyvFoz1oiR2Yxxm_ruSsn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_05,2025-04-08_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2504080095
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

From: Zijun Hu <quic_zijuhu@quicinc.com>

kvasprintf() failure is often caused by memory allocation which has error
code -ENOMEM, but config_item_set_name() returns -EFAULT for the failure.

Fix by returning -ENOMEM instead of -EFAULT for the failure.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 fs/configfs/item.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/configfs/item.c b/fs/configfs/item.c
index 254170a82aa337d95cbfbdf1a2db1023db3a2907..c378b5cbf87d28387a509c3cabb93eccfb520c9c 100644
--- a/fs/configfs/item.c
+++ b/fs/configfs/item.c
@@ -66,7 +66,7 @@ int config_item_set_name(struct config_item *item, const char *fmt, ...)
 		name = kvasprintf(GFP_KERNEL, fmt, args);
 		va_end(args);
 		if (!name)
-			return -EFAULT;
+			return -ENOMEM;
 	}
 
 	/* Free the old name, if necessary. */

-- 
2.34.1

