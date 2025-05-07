Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7760A1D61BC
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601818; cv=none; b=GBdb/2feRfttBOxmH0hd9PY6cN57nTl3KodaFgdoInIFXKDzpxjndOSWEUR4gtlj4Sy8cyotVF+TOh1Kpwf3aLlQ449PGnhbxxdLxKYl91IhOJzqIAsy/+Z57YSHjPYDmbPktjePJLe1/HwIGXk3KqYGotnZUXOH/oFE9s9tebY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601818; c=relaxed/simple;
	bh=+vG8CnyAs+ahRAEKOTlY/fTH1jIgvRBbEsdmjuvigsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X/CjGvhZ3B8z5/idToETrjh9fyYzOUgczJe4P0y31M1O1fY6rL/6UJ4KdviDC/UFOMRJb2PH3nR1oYe5MeHLGDA0EqYyTYCgsj8hU2hniDFsLkvEaDF1NICaFMe1fUFy0GAbg2f4vgRhdS+owqxOwL1ivRzd/1fM99W9uZZolcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ES3/fUCP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ES3/fUCP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746601815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C0GKFC8KldnbZQE+xBqEHBh0rPqBW1RKl0FzVBfySkA=;
	b=ES3/fUCPQA/8dYj3z193PEWq/idT1zm4P/dcQjbprivT1Pqdqd0Hkq3SIHyWoVmD0S+9QA
	o6x6D7g83034OAUHw62WxSKFXjI/FxA80B2Hb5n5GE/JQxPTYG4a9TvYGoaJUiBS5bxApH
	QT7t5ndnwwNlLvixeDvAFgQ2+LDNG+8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-0JEYXBglPLmKGhaeFU3cRw-1; Wed, 07 May 2025 03:10:14 -0400
X-MC-Unique: 0JEYXBglPLmKGhaeFU3cRw-1
X-Mimecast-MFC-AGG-ID: 0JEYXBglPLmKGhaeFU3cRw_1746601813
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso34997055e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 00:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746601813; x=1747206613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0GKFC8KldnbZQE+xBqEHBh0rPqBW1RKl0FzVBfySkA=;
        b=Ya6yQtUlpaMXtVdMT7WygWXFjZgBH7qWmpZ6O+FiLLvk64j+FwpB0hy+JJqy30MFzJ
         4hu/XGLN3ryNMuVDUJxpCAJ6TG4+LQGb2DPAvHCZGoo11Tj+cWeO49T5j/t+dLpB4DB/
         ZaGVlzuPesR9iTNT3tN37xbPvTp3JIGBS5pYzgbqRoarSzdlb8hS3hWPsXpDhLZSNy7m
         Mc6AlXz8WvMtQF+6DrrNJvik3Ptzjwh2ELPR/8rKNRg1fW7ewqeREZ4golJfXvIneLGN
         u5bU+qsnJZaoi5xc41eBm8FlUy57P6D++leSrB3rQXqQ09x/0J+PY2WmEBDMlWzBAbXw
         EQuw==
X-Forwarded-Encrypted: i=1; AJvYcCWFfh/sg/ru1vjlS734Q3wuDpvYBUyqQuczb6l2ux67DiD31SjOX9lgUuP5m3o9L6WxrwkSxhHJhRBC19c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRWuNvXmOjfoUX+T6LKEkvK8f8AuncB+Wp+t4o2SnD40HNNSZA
	WXv8j37XGnEhyF8tT//l4ND578hxa2SVmmuWFBLJmm4LK87HtakRtORE4Wo6cdVjm4UwaPDD8yZ
	4u496hA2ApqadNGCBjPofMCHq3HU2mslS/XakaXGWKtCwxoYzcXdYtB+vj3WLTFLFU4LcxQ==
X-Gm-Gg: ASbGncuzc7acbQCAcHJqDtv7wSheHDRZjhjuYL31AsanNV2E7yrMnIu2ZSe0Nqc/Ny8
	XixlzdEYF9PZUGHK1i/Ej/7prYOqgBHgvypt3pDbrvpPcEhtYWzCU9Dq6cTAlp/HAQNInlecZIJ
	oEWhCkmRayvAOjNAvAt5P8Ra8eHed/sAQtgGbkm816PpW4ms++7P29slPuhwJedPm+xNO1PpiNB
	sJi5JXuzTyxHuNlzljuKw/oceaytrrtZ/nHRx6rO+vvpf1pEBPuAPIdCFConfFx9SrY2vC9iUIr
	RXbGsu9i+IquOwKe5Qczt/hGii6pZsTJbtpMi+SGx0gHm7Sz3S8csvrtcA==
X-Received: by 2002:a05:600c:3115:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-441d44dffc6mr13756025e9.29.1746601812772;
        Wed, 07 May 2025 00:10:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9fskhTRs+MwvCppLYelBRlCfT20TAw6J9cuN0tMrz3HMBb7GdWxRU+1hCm6NmREYeaXZ5kA==
X-Received: by 2002:a05:600c:3115:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-441d44dffc6mr13755735e9.29.1746601812359;
        Wed, 07 May 2025 00:10:12 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0d3csm15667725f8f.3.2025.05.07.00.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:10:11 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: remove obsolete file entry in TUN/TAP DRIVER
Date: Wed,  7 May 2025 09:10:04 +0200
Message-ID: <20250507071004.35120-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 65eaac591b75 ("um: Remove obsolete legacy network transports")
removes the directory arch/um/os-Linux/drivers/, but misses to remove the
file entry in TUN/TAP DRIVER referring to that directory.

Remove this obsolete file entry. While at it, put the section name in
capital letters.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9c166503cc6b..34a55e3ff863 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24981,13 +24981,12 @@ L:	linux-parisc@vger.kernel.org
 S:	Orphan
 F:	drivers/net/ethernet/dec/tulip/
 
-TUN/TAP driver
+TUN/TAP DRIVER
 M:	Willem de Bruijn <willemdebruijn.kernel@gmail.com>
 M:	Jason Wang <jasowang@redhat.com>
 S:	Maintained
 W:	http://vtun.sourceforge.net/tun
 F:	Documentation/networking/tuntap.rst
-F:	arch/um/os-Linux/drivers/
 F:	drivers/net/tap.c
 F:	drivers/net/tun*
 
-- 
2.49.0

