Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9518B25F7B2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745966457; cv=none; b=M6eUqItwx9mMUiws7VeH3XlxTyW0UbPEbjoi/bcPPPitJItIbKlxDG+S/FUcprrsO0jZ1dp0TxR8uATEEW0q//4t9e+GyXRbS2v5YwQctrRDn0nHxNSyF10YPnlXy4Z+8z7GVbs2oWuVsSs3v6V033s+KadNxlb2WPO+Oz/Eg9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745966457; c=relaxed/simple;
	bh=rzblUjmuva03Jqa+IV3WtGt8yIVowSe+ChkqLl4IjY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d/TmP6fIBiOw+kEMTzXAnlAlP3oT5gjAR322uJrHD6nCJG+Cqa2eCvK4eVN/DLImFfk6jH3LL+YqSFUOfMYYaXgMiSRQFmjvNy8HNzmUOJqiNXeBIQ+icz1tH1W5bjfV7v0NbbadWsEdi/BodtpIjM+jF3RclgDvRXHZ6Ma36fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRnKOfWZ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRnKOfWZ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22423adf751so66754365ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745966455; x=1746571255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yyTeZsz6IZ53slc/uXF/wiJNoEHlyhXOmtXLOMGmbDM=;
        b=LRnKOfWZ9JfyoY/Hcwd2XJ3qXQ+V4XT1GVr/N7PefwCxyMh/i6tnZBu/c2vsKDJ4Vz
         PD3NSMsVbl7H2LocAsCWHXlrZm8yVDSi/1o8uR23pwQcU4/Et/pxcKD9GfplYLsAf6+k
         Xu5CsViBJTevxxejUcyDmXf6wq8bZKOipDAUVXV0tgB3RYCfxe+Z90vFerrpx+LLgipu
         yIajHxa/jOVlDvtTSsiFtnh6mAxfo4if0WdLnvD5AJXW1qvJAow36QzuJTq5oekQwiI6
         P48T5cFfjg7/obcquJK0rODxv40fIy4uMNe8c0/z45rUvtyUV3tpUJHK8FynEf/enGOW
         7TOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745966455; x=1746571255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yyTeZsz6IZ53slc/uXF/wiJNoEHlyhXOmtXLOMGmbDM=;
        b=b04T3HmV6en21Xvnqi1tQ5t0amTxGgZehI9LjA3smBH/2nSmqXQl2j2QMuM7acpWoA
         PTLmLSWmUMRP9rqCAywSLAHYP62FiiHwxI8TJlMevPFyFcGo0q0gDqnbvh7xMuoqPhq+
         quNpjxIsjOPFPTRYnbFgcUP3u+bKkAVmFYRjGRxi7Vur8n6O6dulj5CQ5z5CIUO+E3Iv
         DMab2yQ0uwYN6gv3Bn0sL+Iy2SJmqHswrgYHzIfOJdSOmmxdpS6TWu+LzJn0vTZBHPIe
         natLZl1z/4MFX34kwwJe4AJe3z2n23rgUEWYrHqmZ+9F0Fh4OEVnLmRwGUCtjuLzRuzJ
         ZZ9g==
X-Gm-Message-State: AOJu0YyIMopgFk5YubFVga0cfPmbZk8+La0BHkf5WF/H5B06troTiRSt
	4GKxA84w5bpk0fVKDCv8oU+MkhQr707qaoC37mu8HzijHNa6aSvN
X-Gm-Gg: ASbGncu4YlUvizD4l6gpGkwfvCJDfZdJFs/Cu01XcQLy6zdTEU9FjoW1YUi9YIthxWX
	K4rpVuiLp3ehK/RWW+E3fV61PpVjIp2aP6hi46h8pokMgmcBNhxOpn0b5ORHN8iOIAT2Fk1BvLT
	8xVHTNDzHQZBiZDiYSn/8MgEdkd8sTFlOJarYya23+EceVtW6wqqjcpE8c/pxRE1I19CPyA7gQQ
	76EHv8G36pQPFrhRnVhu1F28D11VGdWMThY5OzMf8d8wZfENq1OSraDSpEhYUvjcvz/L6l4CPUp
	x8Jn54wHpuev+WiTKQn2tO5/D39Z2sAjzpFruaPRXrzcuc7IuhzaygEiIOFP1H9WOAhoIGvuxEX
	EcuIYYzTVuFJKXYOfaeS/WJWovVmzrZ1DWu1fQ1eV+zi50LsnpQwny8cl
X-Google-Smtp-Source: AGHT+IG/LcYTawggDwNx+7aZsKXZ7xv08EL1BPd6O9A7QWNZPdPJKyekrLT/6B7mGyw5UqbPrBFvuQ==
X-Received: by 2002:a17:902:e741:b0:224:2201:84da with SMTP id d9443c01a7336-22df34b38bcmr12875565ad.6.1745966454671;
        Tue, 29 Apr 2025 15:40:54 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db51025basm108642445ad.187.2025.04.29.15.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 15:40:54 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	hare@suse.de,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] nvme: select tls config when tcp tls is enabled
Date: Wed, 30 Apr 2025 08:40:25 +1000
Message-ID: <20250429224025.3077488-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure that TLS support is enabled in the kernel when
NVME_TCP_TLSS is enabled. This allows TLS secure channels to be
used out of the box.

Fixes: be8e82caa68 ("nvme-tcp: enable TLS handshake upcall")
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 drivers/nvme/host/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvme/host/Kconfig b/drivers/nvme/host/Kconfig
index d47dfa80fb95..4d64b6935bb9 100644
--- a/drivers/nvme/host/Kconfig
+++ b/drivers/nvme/host/Kconfig
@@ -102,6 +102,7 @@ config NVME_TCP_TLS
 	depends on NVME_TCP
 	select NET_HANDSHAKE
 	select KEYS
+	select TLS
 	help
 	  Enables TLS encryption for NVMe TCP using the netlink handshake API.
 
-- 
2.49.0

