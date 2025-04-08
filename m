Received: from mr85p00im-zteg06021501.me.com (mr85p00im-zteg06021501.me.com [17.58.23.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9246F26B09F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.23.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114198; cv=none; b=iW/UlrtgBa7nfASCytFokK0ENcnVMB+U7kic6iO1DhXtm0gcSfzsfpy+IXA/a+Dd8GyF02i8AlPhxs3ib9jQyvKYniowYTq9Fp6eB66/q+r+bMJdUxwizQCsPXBTdIC/N3RanZjnyjhxnnPgK0sXC4ObX5FRgm/yTiARo1Rrj+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114198; c=relaxed/simple;
	bh=QEqKjxqbWub8YsuQbU+tPhuhK3lJRWqkR2DgLlJnxvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Y0WT9yeUkth3g3FFUo7tsJumxSnKrViq3y6SBrFxH1fcn3Z6QfLpGBtrinloinWfoYjXrpl6Esq1EuDW16SF5mUVTWAUMqPAX3mT/bG8tcZD+roOwzJgKiZ/9ksLLc7/XqJfInkH3G7jTyblqzvXHLi+yDJs5DHLH+6Vuj8fT74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=Bgm3jS76; arc=none smtp.client-ip=17.58.23.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="Bgm3jS76"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=BDiMM4gbvtusq153Cw0jBPOX1iQ4qyGjf3UtgNk2nRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=Bgm3jS76T0ExwCoHgcW23Pl2H4wM3F0J2gZznH5M7UOovoLE4b0EGT+8OvTX4UrZf
	 IGZDjtj/EUlFSr6zvMrGnRDP4PNbVwgGRTxZSNyg87knuq5TpUJUIsJ2/47IB/cJrN
	 NQVxtjmmhIXk+5iEYkHun3pErC3gyYuJVE1uIqAqbPvgY68BZzfZjpq8ix3GZefrcZ
	 AcT8LmkEB0n1gKUMQse2N541qju9CUY0OGH4zlt6X8cFDy9d41vW4MEFx3eRLpw82w
	 /Q1t/qZZ1kTSzl+he19tkfkOSnGHjRk4L1Y6x8+Y68Ffix9KSKOqKe+fZb9z9GxJ2x
	 5yhpjQDkdzCmA==
Received: from [192.168.1.26] (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-zteg06021501.me.com (Postfix) with ESMTPSA id F26582793FE0;
	Tue,  8 Apr 2025 12:09:05 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Tue, 08 Apr 2025 20:08:51 +0800
Subject: [PATCH] USB: core: Correct API usb_(enable|disable)_autosuspend()
 prototypes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-fix_usb_hdr-v1-1-e785c5b49481@quicinc.com>
X-B4-Tracking: v=1; b=H4sIANIR9WcC/x2MWwqAIBAAryL7neATpKtESOWa+2OhFIF096TPY
 ZhpULEQVhhZg4I3VTpyBzkw2NKSd+QUOoMSygojHI/0+KuuPoXCnRZWWxeNQgm9OAt2/d+m+X0
 /abSx510AAAA=
X-Change-ID: 20250408-fix_usb_hdr-8305358f42e1
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: FQj8FmXbrb2tqslaEMhyWDlIIDI50Zr_
X-Proofpoint-ORIG-GUID: FQj8FmXbrb2tqslaEMhyWDlIIDI50Zr_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 mlxlogscore=697 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.22.0-2503100000 definitions=main-2504080086
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

From: Zijun Hu <quic_zijuhu@quicinc.com>

API usb_(enable|disable)_autosuspend() have inconsistent prototypes
regarding if CONFIG_PM is defined.

Correct prototypes when the macro is undefined by referring to those
when the macro is defined.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 include/linux/usb.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/usb.h b/include/linux/usb.h
index b46738701f8dc46085f251379873b6a8a008d99d..1b2545b4363bcf3ef97a53a004ebf456eb9d5d05 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -815,10 +815,10 @@ static inline void usb_mark_last_busy(struct usb_device *udev)
 
 #else
 
-static inline int usb_enable_autosuspend(struct usb_device *udev)
-{ return 0; }
-static inline int usb_disable_autosuspend(struct usb_device *udev)
-{ return 0; }
+static inline void usb_enable_autosuspend(struct usb_device *udev)
+{ }
+static inline void usb_disable_autosuspend(struct usb_device *udev)
+{ }
 
 static inline int usb_autopm_get_interface(struct usb_interface *intf)
 { return 0; }

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250408-fix_usb_hdr-8305358f42e1

Best regards,
-- 
Zijun Hu <quic_zijuhu@quicinc.com>

