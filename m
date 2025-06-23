Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F3020B7E1
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666371; cv=none; b=GQqYP5ycW+zOyAMkrOJSyQnY97Fx8c7r4tmFAaQK5DoJMOiQjh7vJBDQKQ6vTlzigj8fmUDUIaqWNv0y6C+A5IRgkJ1s9JLk/pMnz1+BYRyCaI8iwifk0OmpUNpxevGZbDZlttbWRN9xyEFWY3u8R/1tkIbhWd/XMoxpBfXmPlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666371; c=relaxed/simple;
	bh=gPbrjKfb3/t9+bJ97l2JcUsCeLq8NB/AHeQm+JnD8Tg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kY2CsEo6Elnbz+cN4rYZch4qxfjIE/bn50QiBXTRF4CdhnSO8t5AnLF8PKEJ/MrWQySWQkyAXYypdne4xG0V1svPvsvREK7AE+J3toWfjN2d6nTOt0vneTLE6LoCrAaCRKjeRj4wKVFySYqQn2V79UOEZx0WUKZdFstae/8vrVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=evW6TOgF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="evW6TOgF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750666369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ely3LYIH5ApPb1uTkKRY78N4Y4FDOftaWbIcVrfOOjk=;
	b=evW6TOgFkO1OY+8dsGYT8jRcX8V9vMMggMd6AOmBiUmuIyjXjvaRuZxbfUkNs627WiUtS0
	kHd1JayymoNYMLf63SLls+RlLhZn4OMGlWgewnAfcwdliRoygA9uXStm9J/VDNUSdLCptB
	2D+LxDNOeMV5oBae8blgkLuYHjywhgw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-uRaByIW-OJ6dXyJ6dK1RCw-1; Mon, 23 Jun 2025 04:12:46 -0400
X-MC-Unique: uRaByIW-OJ6dXyJ6dK1RCw-1
X-Mimecast-MFC-AGG-ID: uRaByIW-OJ6dXyJ6dK1RCw_1750666366
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-60724177a1fso3534296a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 01:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666366; x=1751271166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ely3LYIH5ApPb1uTkKRY78N4Y4FDOftaWbIcVrfOOjk=;
        b=S2SdH1UtlKuwcFE3e4yZW6hTe6PooIhiXQ2D8/Wq0RsR3hx8S0jA4D5Cagw97uosa2
         rDGHCro5aeEmLY1xPF410QJbDhT9PqJWHvQ4U7sjybWPkzZsyZU8SxWA1dtWaQBiCaMb
         x4+uTIEOXCnZCZ2ctLjZ855u60OyxR5D7TT5va5SZ8Vz9UZw+SVNepStV2XHUpJPYGU3
         kJ7ftkARIavIZQcmy4Y3FLfxtxQJ/HRT7iI1uj+t1+NN1vqKXmKvusVxA5r04mtXfXrF
         kmCMFuusK5/ofagvSuVIbDpg99hrravpBBeVg836AU6eVMTFS0yqw1uuV/FEWd91npCo
         ES5A==
X-Forwarded-Encrypted: i=1; AJvYcCWHhcr5lHScC2vg857qH5BYEB5scfEAfHCw0+jDxriKJvZ4yHoMl350nOn/jERDSss6xVDyixwO9av5CQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7d7K5UAWiobiL9ZEhlIkC9s96PtKZ439kpugI08L38EkJOQDA
	/ZxVSvtfr7pNZTt2+UjoCsfHrLAChovYYlGUpUHzwVJHW9v0skDqRKUC8i60ofxKII7Q6t531DF
	3xF93DJQS8ptWL+aI/UszMbjmUnwNeDjmk7XqXzkphHYXTvuMJOpL+4bnbXrakOSufg==
X-Gm-Gg: ASbGncuF9u7oAy/1xbZ2/qh4YYQ5yOemol1B9/C/f3igT6WxHqBnk8gmt3qddiHNPTF
	Zu2/Qx63XH7gQ0MCvWRmTIX9K5np9VuKsrAaXT2D6WKiaDhGzZABXOpcV+WL6sJWPGh2fWYkW4w
	YLdsbEgxITf3kPidkg0877F15CEdyAgj5BvVuchQq3/ZBZ66BNMBI79J9as5M6OMpb/32hR9jMu
	RjjTlhg9enFwIuhuxtfT5+E0ng+1cY78/C/9hLCR9qTKomIT2txgR887oAkKgeaEA4oNQ3iaVxp
	5sqTP6VYZsNLmwMDcinGWzDRlYaX32LjtUNq9UHoQlLUJHqJAaevhvfnpr+ZHCsBfVdX
X-Received: by 2002:a05:6402:2744:b0:607:6097:2f9c with SMTP id 4fb4d7f45d1cf-60a1cd1d0e8mr9229002a12.21.1750666365754;
        Mon, 23 Jun 2025 01:12:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmSn5SEBbkY2WzQ8Wstprge0mliWZNTw4CyeFgF4x1e2Q598sLsTkhN06aRTXMr6PAByyRyg==
X-Received: by 2002:a05:6402:2744:b0:607:6097:2f9c with SMTP id 4fb4d7f45d1cf-60a1cd1d0e8mr9228976a12.21.1750666365083;
        Mon, 23 Jun 2025 01:12:45 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18c9769fsm5838013a12.40.2025.06.23.01.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 01:12:44 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Casey Connolly <casey.connolly@linaro.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: rectify file entry in QUALCOMM SMB CHARGER DRIVER
Date: Mon, 23 Jun 2025 10:12:40 +0200
Message-ID: <20250623081240.149446-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 4deeea4b0741  ("MAINTAINERS: add myself as smbx charger driver
maintainer") adds the section QUALCOMM SMB CHARGER DRIVER in MAINTAINERS,
including a file entry pointing to qcom_smbx_charger.c. Within the same
patch series, the commit 5ec53bcc7fce ("power: supply: pmi8998_charger:
rename to qcom_smbx") renames qcom_pmi8998_charger.c to qcom_smbx.c and not
to qcom_smbx_charger.c, though. Note that the commit message clearly
indicates the intentional removal of the "_charger" suffix.

Refer to the intended file.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 41f13ccef4c8..c76ea415c56f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20612,7 +20612,7 @@ M:	Casey Connolly <casey.connolly@linaro.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
-F:	drivers/power/supply/qcom_smbx_charger.c
+F:	drivers/power/supply/qcom_smbx.c
 
 QUALCOMM QSEECOM DRIVER
 M:	Maximilian Luz <luzmaximilian@gmail.com>
-- 
2.49.0

