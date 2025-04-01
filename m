Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128E01C69D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 01:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743472408; cv=none; b=E9ozvTnRAePHupx1+9BcdTxCyDcq0Xj/i7VhvQugHWJw1UCOh9uy1rfwdoSwioEFJedBo7N6eBwG1hgXiWgCsyMc1QxyrEIzv/ALLXm8YqiXNofZw3gCOZw+zh1smZOR4w3nnW8+4StTkaXfHzgg+L+hl1wXJH/Q8YnHP9YzL3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743472408; c=relaxed/simple;
	bh=khj3I8hr8oDzUh0PLOjj1KDH/DL6+fu/siTxOHYY9bk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=u2mRznxYDWp1i6DO3e0eKUsMSQCvva2mf3e3vFLhxgadkke0J9O7hTkycZAC6JWscvTRKlJGMTlyotJw3fFlah19za3qQ73P1VVLd8DVwGuQufFeckvkxXMMhvQh7fqrc2caX2LbxqjC/6EhHv+3/CHxw7Fa5QGLKcZCao8gWr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gthelen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0lemj78U; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gthelen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0lemj78U"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff53a4754aso12868357a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743472406; x=1744077206; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bkNNQdpSk9bbcKCM99d0+en1tupRsaQZtQor4WU6i8s=;
        b=0lemj78UX6L8bVTeTcAQ011f78/5q/1OJ5fGsF6YVLL+rkIaFERticD7b+6rbtCtEU
         IJkpkn2oe86aAmx5wBaA9kTE+ZSXr/duwtcnkXio7fAAmZH7Mq7eZQ2iFHq/60+JCciM
         ky5LpqnF5/slfs+5gthm4deHRrcZtJyNXaYCFxp+FZ74XRgU0CXS+kn/WJARnrfl1EAb
         RfJf4+xNllBxANYHaj3176avsGSAgrx/fqf4O00vpBkrVa1cHpQW16p93mTi2Gjhbt4o
         AKcxSHpCcQLx6tljkoh/aEUzb4x282mpSX2QllOVu1vC9x8KjJwQM/3qJbNi3oz8tVL9
         ejmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743472406; x=1744077206;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bkNNQdpSk9bbcKCM99d0+en1tupRsaQZtQor4WU6i8s=;
        b=PRE6JAiPk5d+5926JZKgy/TOpf+t8jQ2hSPd1+beBRUtdLCpMhUPclryPX6Mzn0CB6
         c/Z/nIRn1daRn2QFrf6K6TYflx776LcDmgO+y+NVpo1huOtTrzeo0oT31ukmYh1vhJHf
         D9DvwVWOPU0skFtKPqIV1yDcKskzv30+W2ekT/ihmes0ApjXS2PgTJZLO3e0Sh0ghPpZ
         vpXrkl4iLL9ajvJJSYNC4LfGDWxRUDRXuh8EleOeyjuD1ebNtddXhNQ/Sxh9Hi0MxwJW
         7R8gSZ3RcD2aYT5Sw0XWEV/I0tXSuF4mVYw5HwimoFDrpycA76QAMdUxEFuA7GTMWSUP
         0i1A==
X-Forwarded-Encrypted: i=1; AJvYcCUpgB124Tuy4C20bJX7u/T0CIuvgcu6l0kfektGCAe0NyWBs7adGwj9lu/Vzeh/xSyDzf3fAQiS/AtQo0U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj7EsBoGtoc5lPQgoGqH0s2l1umzccWy0fsZI8tC9KNiUWD6Tc
	4inMpyssQ8SbmgLW6tbl+uK2kfEw1UfFd3WEA2s42FQgZBcE9JPZepAFJt8Y53hiefp9vipjTef
	li5I1YQ==
X-Google-Smtp-Source: AGHT+IEnK8LH0fg0laboEMWyVSOSyKeffrJ8PKEqxYzH2W6ofzvPImjNul10lI3H7St49aRK2fEenZVHUU9L
X-Received: from pjyd14.prod.google.com ([2002:a17:90a:dfce:b0:2ee:3128:390f])
 (user=gthelen job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d2ce:b0:2ee:aed6:9ec2
 with SMTP id 98e67ed59e1d1-30531fa153emr20864641a91.14.1743472406332; Mon, 31
 Mar 2025 18:53:26 -0700 (PDT)
Date: Mon, 31 Mar 2025 18:53:15 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401015315.2306092-1-gthelen@google.com>
Subject: [PATCH] eth: mlx4: select PAGE_POOL
From: Greg Thelen <gthelen@google.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"

With commit 8533b14b3d65 ("eth: mlx4: create a page pool for Rx") mlx4
started using functions guarded by PAGE_POOL. This change introduced
build errors when CONFIG_MLX4_EN is set but CONFIG_PAGE_POOL is not:

  ld: vmlinux.o: in function `mlx4_en_alloc_frags':
  en_rx.c:(.text+0xa5eaf9): undefined reference to `page_pool_alloc_pages'
  ld: vmlinux.o: in function `mlx4_en_create_rx_ring':
  (.text+0xa5ee91): undefined reference to `page_pool_create'

Make MLX4_EN select PAGE_POOL to fix the ml;x4 build errors.

Fixes: 8533b14b3d65 ("eth: mlx4: create a page pool for Rx")
Signed-off-by: Greg Thelen <gthelen@google.com>
---
 drivers/net/ethernet/mellanox/mlx4/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/mellanox/mlx4/Kconfig b/drivers/net/ethernet/mellanox/mlx4/Kconfig
index 825e05fb8607..0b1cb340206f 100644
--- a/drivers/net/ethernet/mellanox/mlx4/Kconfig
+++ b/drivers/net/ethernet/mellanox/mlx4/Kconfig
@@ -7,6 +7,7 @@ config MLX4_EN
 	tristate "Mellanox Technologies 1/10/40Gbit Ethernet support"
 	depends on PCI && NETDEVICES && ETHERNET && INET
 	depends on PTP_1588_CLOCK_OPTIONAL
+	select PAGE_POOL
 	select MLX4_CORE
 	help
 	  This driver supports Mellanox Technologies ConnectX Ethernet
-- 
2.49.0.472.ge94155a9ec-goog

