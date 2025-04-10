Received: from mr85p00im-ztdg06011801.me.com (mr85p00im-ztdg06011801.me.com [17.58.23.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B493E14F9D6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.23.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291819; cv=none; b=P1uMc6cY7yr7IktkYqOG47fGe+FOmfjBo5TwTjzfS6OWuC6yJ1Okz+RkswyBojqwjD/l/jWxeSHdHWGU6e4Eft718vdFK0w7ywMv1dUWkGfncfUtYHyR2Ihsxsky0WnVF/19F8+C7dyDen1x3XQFoT04zJOoqsHB2H6MipyMU2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291819; c=relaxed/simple;
	bh=PeYlpguzBAJBSYZuTdFEhDxkqpAKxhISwwI9nHI8VIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bjUocORkuHrOQliK+G3goIrsxrpQ4wi6Pefk5piFGiqr6N0Xf0szpcVfv8GrMEpyH/bOXW/ai5sBdPQNMog9e9GVACchLgeoBNAzEei2eLkCSzVkTJkTzDS0Zh2iYhvFVMKdyTc0LFDXVvAucDITiboS7HbuDV9G3QoIftpz3zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=hvM75HUw; arc=none smtp.client-ip=17.58.23.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="hvM75HUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=0BtBz3X21cuIftamDh8WNJg5QmdEhN/COS/87vOGwLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=hvM75HUwDz5CC2WFXhJIjutkCZH6NUVlqW0AQe/NR6sctAXT2qsdQ2EBeWTrBaABU
	 qh58noP4OJ4Q0UX75R+jyqNlJFnnCJ0zj0sCENnT025atjzV7J8KLBJcpXzxHlZ5cW
	 CK3bi6hMDt7DAT7koEUfYK+Rv8Fve7dsqEINF1YJXa5DwqrkDmDyY6uYjfBxroLY8f
	 8WHJeqXAANWcHlil9WL3g7kmTEpFUoomKjY/BdG5SsDaU2EhNmPaguDwUDWjU3bIjq
	 HcNdxgoIFO68cZa5yLcVViBVR8d3k7//l9bYTQLSjNvlkn2YWCDiZfPR9q4pMiUk2P
	 9Xm5ArCzZysKw==
Received: from mr85p00im-ztdg06011801.me.com (mr85p00im-ztdg06011801.me.com [17.58.23.199])
	by mr85p00im-ztdg06011801.me.com (Postfix) with ESMTPS id 681ACAC56E4;
	Thu, 10 Apr 2025 13:30:16 +0000 (UTC)
Received: from [192.168.1.26] (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-ztdg06011801.me.com (Postfix) with ESMTPSA id CA3FEAC5A22;
	Thu, 10 Apr 2025 13:30:14 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Thu, 10 Apr 2025 21:30:00 +0800
Subject: [PATCH] usb: dwc3: Simplify memset struct array
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-simplify_memset-v1-1-c7bbd850e520@quicinc.com>
X-B4-Tracking: v=1; b=H4sIANfH92cC/x3M0QpAMBSA4VfRubY6NMSrSFpzxilDOxIt7265/
 C7+P4JQYBLosgiBLhbet4Qiz8AuZptJ8ZQMJZYV6gKVsD9Wds/oyQudCsnUk221QdtAqo5Aju/
 /2A/v+wFcK3/oYQAAAA==
X-Change-ID: 20250410-simplify_memset-0ea6dc94a0c7
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: LZwqiBKxY8UJnlIEkJgC_2La6eiLM1Wr
X-Proofpoint-ORIG-GUID: LZwqiBKxY8UJnlIEkJgC_2La6eiLM1Wr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_03,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 clxscore=1011 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=925 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2504100098
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

From: Zijun Hu <quic_zijuhu@quicinc.com>

For 'struct property_entry props[6]', Simplify its memset to
'memset(props, 0, sizeof(props))'.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/usb/dwc3/host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index b48e108fc8fe7343446946e7babf9ba3bc0d2dc3..5a2fe4c6b0e433c32945c136b8b35e1912e3acc8 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -158,7 +158,7 @@ int dwc3_host_init(struct dwc3 *dwc)
 		goto err;
 	}
 
-	memset(props, 0, sizeof(struct property_entry) * ARRAY_SIZE(props));
+	memset(props, 0, sizeof(props));
 
 	props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-sg-trb-cache-size-quirk");
 

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250410-simplify_memset-0ea6dc94a0c7

Best regards,
-- 
Zijun Hu <quic_zijuhu@quicinc.com>

