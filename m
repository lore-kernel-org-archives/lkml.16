Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482262D97B6
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751031903; cv=none; b=JBeBLgaHbX35QExHk0BIeWpz21d6hM83xHrztKNflwiwCnNFX7vio5ElyA0azypVvp2s6TZL4ciJm9GYwpmaO5riSD/CTNv+4rrrlD0irXV9n66t8EmRt5JurJhBI+MvT7/G8so4SyoFec5THJFkAynIzx7e/u+GDPSawnJz4Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751031903; c=relaxed/simple;
	bh=8bG3o5gRZA5FwgazcAq8PDL3/TF2VFfzR2zlNp78oD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aDvU0aXSvQZ9z4B65XBIClWgsWPl5UvBNYGzR5Poo82pjZvdLjCSPjdCOdzJZaXEo4XUwD/rN674zA7AENQXfgQNBcJLGBH2SnEREUEybkcU+ZUPnliMZLYkhPZwo951TuI5pCZou6zGdKvvhC/ziHuqY/59FiXw+nhGh2g0/4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ekomk+CW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ekomk+CW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751031900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sfCzCKZHgavpsXvy8TlJ0gEXh9QhrZFiByLFjuD7+iA=;
	b=ekomk+CWZ+TbrAyh/AXhQf6dkapNq1qaX0xJ60hUFR1UZDIippBij+gTt3mHhrd83Ep5og
	0oSTE07dp+o8baJ6P4xvfvtpYOA9MM0Q3JbLg3dj5x1ogciPVz6wfvjlomI6b92JM93syD
	EF9bl0bthGPPavIiomHxpAahOeQfY4g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-2uQr6HeCNGGsGF5VCfY02A-1; Fri, 27 Jun 2025 09:44:58 -0400
X-MC-Unique: 2uQr6HeCNGGsGF5VCfY02A-1
X-Mimecast-MFC-AGG-ID: 2uQr6HeCNGGsGF5VCfY02A_1751031898
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-453018b4ddeso12652955e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751031897; x=1751636697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfCzCKZHgavpsXvy8TlJ0gEXh9QhrZFiByLFjuD7+iA=;
        b=D/LT9k9dBJqrjuJbI4ZWuO5Nfk5YMEucAooURltq7glr6Tzei16iooyhyrsesiuhrQ
         LRDw2bndz7pvWspPqJeWHzuNU+O/X0iT3AFEKIIk+MJb60/yccCcJXkGCSCBIAJ5z7Dc
         4ads5iCLbpJVW+O3hIYEhmPoo/fDaebU+xvETDkYfrqD8+5MEabofk1awBFidWDs8Nzt
         6CqhlwgTDt1HbVih7xGK9etZPMMV4+fbF/36eDSFsx+PN7PpsJMhAGNJ9IUyu6f9qGi2
         xmn0msLjYrXdS4XYFEeDVBNlrHFEG3Z+wsyKyJCU+j2TCABZgJJjvn/tS/iN03TL2a2d
         ad3g==
X-Forwarded-Encrypted: i=1; AJvYcCUJeAXEI0pxCXXix2wK1fJr4JGtEvEHTfZcchYSLX6hC2Hvfmw9+kvugpZjRHqEBatqXk4MrwjjoMpAZUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsePdV1Nn34sJKbaeEiyATPK2GWRne37s5+YrdEUxguYyc6My+
	4vo4HZ/hIkQ+Cp8NeTUFQO9eZH76B5S/765JSjFo+ZbHpIP4o0VI0EpFvZChjUAP3Sm1vUn4fzg
	zS/JoyFqbnxYezPQLKZE8XqgZHudnE3OF0vAtYGv6KiO0tMLCZEeftlY4sRgZ7fTK2Q==
X-Gm-Gg: ASbGncuUrojiWzdkPDrJOSdrU0D+1+43X+AJ9l4EU/z16domL59Itw8WmsKvkomlzCK
	U6WF6JfDw47mAGjG4Iewv7ki0tLJSnchzYtDTebN9KlR1qTtXrjxAPxHtwmr3sDOy7BrNlTPVvx
	GZhQQ4h8ePdLm5u4WYYRYCZhp/wRBjMOztPeOrm0bnmFLenRk8L63B2UedkJmaSs6w6qZDSsR6k
	rpyCpG5SzGmUhLA5BM+rs0YAW9FdPib5tail1YiaO6aiAAYpjDG6UsnugfuFzZ0t75+sZ8xgs4/
	ANz5ZsCTJ9gL7I/TyIfeJm/uX6BbPuq0J0/oQ2fUkYepHZbojFkUsjWj96VYuA6pzXKW
X-Received: by 2002:a05:600c:1e0d:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-4538edeb1e3mr43906655e9.0.1751031897507;
        Fri, 27 Jun 2025 06:44:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5wO7lBzKmrbrRtSD3MlBN7myKwo/CLhGpeObS/nJo2QfYJbjf/v98tsfeefUPIC/qB8O98A==
X-Received: by 2002:a05:600c:1e0d:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-4538edeb1e3mr43906355e9.0.1751031897103;
        Fri, 27 Jun 2025 06:44:57 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233bd14sm83028885e9.2.2025.06.27.06.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:44:56 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry after renaming rzv2h-gbeth dtb
Date: Fri, 27 Jun 2025 15:44:53 +0200
Message-ID: <20250627134453.51780-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit d53320aeef18 ("dt-bindings: net: Rename
renesas,r9a09g057-gbeth.yaml") renames the net devicetree binding
renesas,r9a09g057-gbeth.yaml to renesas,rzv2h-gbeth.yaml, but misses to
adjust the file entry in the RENESAS RZ/V2H(P) DWMAC GBETH GLUE LAYER
DRIVER section in MAINTAINERS.

Adjust the file entry after this file renaming.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d635369a4f6c..bff9651a9a94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21271,7 +21271,7 @@ M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 L:	netdev@vger.kernel.org
 L:	linux-renesas-soc@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
+F:	Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
 
 RENESAS RZ/V2H(P) USB2PHY PORT RESET DRIVER
-- 
2.50.0

