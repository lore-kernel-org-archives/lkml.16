Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6832986338
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 02:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745031032; cv=none; b=Bb4en5PTzvpcxehfQ4D7vwruKDudUZWI70qpemsI/7N01WebTm3vhQpSiaAgDumFO1n+1+QXqWcYN3v2TyIX70FFCnKKmyL7ZoifkBDqewA+e/ZvQ6T9tWIdGrilMhkFG523iz3RF1R8pMLoJ1TEoWrpJvN41rTctvXM7sv5AY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745031032; c=relaxed/simple;
	bh=QwCKBsyKbk7oiabFLpJZ6jzsLzhuP13gDicjNFIjbvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e9GezJU2CE7FPVSbbBpbh7r0dd1rVNrVtHYnFvAGpkjZ88fvttSYLXtQgSadvnrb7OlfjaWOUc1ty2Me445E24ZQGNn8vB+Npn3pHS2WnKIcvNzlcliYf4L0Gn7J3Gyg/hwqhwmC40Ke9R/4aUx3lFNRiSeu9F6+ox3353vEGKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=lhoLAPsw; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="lhoLAPsw"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c58974ed57so219413485a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 19:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745031029; x=1745635829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGln0a48jaf9DRVm8+XmoNEcb7k76T6oai1+Kf48TEY=;
        b=lhoLAPswo6dA3lJtXj1ta/Xf1YaRQw3ckyZK0PDW6LOPtN60WtZVygbridkZCaL3n3
         bsiCkCeWxLR2AV1FLi8g3JWcHmY2nZKVYJ2pgoHtxR7ez34tz7cVseiFi5BHBFBLxCXa
         zAg1uyqjPZVZt8pc9OcEccOlPesBbxhdTd1LztUtSLSYVylCkc73bMy+//DNmxG/LPge
         MNOG03FRHExnGTUHPhuZDm+briQMh5X63uL61pirW4a5P5Cc0R1rC6jmoOOjFNv+OenL
         fwK+nXqosyQjpsGvybEgw3hTm7XNQGahKTYuEfwMvYHQJuNAKHfhxrVlxf0Jz5dl1leH
         /odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745031029; x=1745635829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGln0a48jaf9DRVm8+XmoNEcb7k76T6oai1+Kf48TEY=;
        b=Mp+C5oLFenYkpu/VP/k1KAUDQGcIBUBfH/AWLaFAQO/TqeuK5i0ngxBNIlCuZW4C3z
         q1Zw11o9GYEIu/o13cUiv6p6l5HjYSx1fh3dp7MRCiZYGJi9V4Hw3FjLlArtiwqwCwGW
         rj9cflZXedexd2cAvk/kESXxEzN/6wtO/PIFwqAONEeedhHmv89J4mWLNicLVNxayL8a
         wgvo+G23yA8ePL6p25wIDbfHvYUezt6NWK6sy2yLJx4JTmda0gD3NqR2GEAAvv+X1BGY
         QhjitVeOe/ty3CRtY/1FCJY/XHluiSv15K+BZSlQMluveBCvuJ8KcshHtGV04aWz2PHF
         a48w==
X-Forwarded-Encrypted: i=1; AJvYcCX3JThLaWErmjjxKpbgZot5S1d4FU0eLJxuhdTcI9dzW8ZpJRoc4y0grYLz42qz2jpgNS0dzsCZVDMvjXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz57hr+pkwoRHJ6ItbsCDG9eTgqkNWT5f8vFLNcqSgOxf/lUzsC
	TQfhLqR0tMt/9BZ0VD/p+2NF5RWIzQyjv3ITkX+liZo9nd6C2GLCMa1l37gzwRU=
X-Gm-Gg: ASbGncvydlVvyH6vM/iv00T/bdlE708QjTp5cUI9U6bgxL6VSEZq1+/DQDe6PToZvTE
	vQPST59xt5ane3PFLaOoSaPEOyqpX8Anb+ooSCo+rYEPbdJ6lrkCWjQdXLWZWZiM01qpV2KrykD
	Ak4TyRFna8H9ZeFwQllJ1Lj5erNzMhK4XcnQs5smDsIye9LRDDNvXMOeMx+TNi/6EqCt9xnt6t5
	kUUjYIBFhXVdEQpcd4OtlDsx1aZeijBVAId91pyVEbqeSaQxybk3W923vH3lvzFCJQqHPptzcZk
	1SUfxC6i19wj596zERzkvbeaAtrpAofbsTaqLKyon3ub4DV9oUcvzgctNRYnIuKsjsdqVxjGWfX
	dBCPm5TUJexNFk6Z8eenlTIXj944V
X-Google-Smtp-Source: AGHT+IH2lcoFJnmcKqHMHMuViyeQtAANiMR2GCkNYZS2Tc0UyGe6pfEvfe5k7CjqMK8sR0uQ3r12sw==
X-Received: by 2002:a05:6214:2602:b0:6f2:a735:574f with SMTP id 6a1803df08f44-6f2c4675729mr64023376d6.40.1745031029301;
        Fri, 18 Apr 2025 19:50:29 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfd86csm17008116d6.88.2025.04.18.19.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 19:50:28 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: platform-driver-x86@vger.kernel.org
Cc: naveenkrishna.chatradhi@amd.com,
	carlos.bilbao@kernel.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	suma.hegde@amd.com,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH] platform/x86/amd/hsmp: change driver name from amd_hsmp to hsmp_acpi
Date: Fri, 18 Apr 2025 22:50:26 -0400
Message-ID: <20250419025026.1555230-1-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The amd_hsmp and hsmp_acpi drivers fail to load together (whichever
is loaded second, fails) because they have the same DRIVER_NAME.

Change hsmp_acpi DRIVER_NAME from amd_hsmp to hsmp_acpi.

Link: https://lore.kernel.org/all/20241021111428.2676884-8-suma.hegde@amd.com/
Fixes: 7d3135d16356f ("platform/x86/amd/hsmp: Create separate ACPI, plat and common drivers")
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 444b43be35a2..a9c24502d3d2 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -26,7 +26,7 @@
 
 #include "hsmp.h"
 
-#define DRIVER_NAME		"amd_hsmp"
+#define DRIVER_NAME		"hsmp_acpi"
 #define DRIVER_VERSION		"2.3"
 #define ACPI_HSMP_DEVICE_HID	"AMDI0097"
 
-- 
2.49.0

