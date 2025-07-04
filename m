Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EEB2DA756
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751633624; cv=none; b=nlfbY2huvCLKLOJ4Qz2G/IZSk/WP7XVFmN/938HYboo8y873PDROfcotPQ1wNY/mSbHH326lTOE+SqeIJxXGfCa6vOYDLGPlqrCvcgsM2jY5Yddba9ZRD6XsMwqvBe4roT541KpDVopD/78pbQHWLvAoM0JWt+TQG3W+Z1IFUpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751633624; c=relaxed/simple;
	bh=gQW1V9m71ryrxmlD4mF7lowP8cVRVurHwVgZWNpXS00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k5r9N8Fjp4WJPv54/VklN4gTieHpOH2a2R5EpQptnkmULl2E4V7B5KH6Humt++dZC7J3KbOhdagoaxlCICJm32ZrCzK7l6bC8ueD0Eu+xM7PX6oBxa2rCwcdvScu8+OUI554Yqx1H8y2baP837OJXhuObuX274kC4fV+leJ0jog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LAbTpMh7; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LAbTpMh7"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b4dc9be5eso1232611fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 05:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751633620; x=1752238420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C5irpwJohjmYuveaRSftdub5qXB+Y6zVr7PqlDralMk=;
        b=LAbTpMh7UcbuCOi+1NXO7Bd3tArRi5RLwHXH/I42gR3XzP83s9s0RraMhjHCebkOrj
         x+1qAWPyNvR7ekWHreVRnda92GnqTJINGDPHrVROaXIYxTQpBH4fIRIr4oTSpzuThWJ1
         TYkcTT+Fd7V221cw1XASAl7W45K4JY3mLYUVZWv+mvXxRMCnx4eNEVgR9emZ91sUkvtd
         bkg9+Fl01WQM3jqI65OX/+Dg4SfjY0fk6e3pQL/4E+mkpTtbt7hrgRj2cxqV7jMnjRmz
         fm/HDqj3FseVswvSrCQL4bvdxeaz2sKm8uo6ecT/kydqHc2QI5zQRToWdOrhjcqiJa15
         1unQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751633620; x=1752238420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5irpwJohjmYuveaRSftdub5qXB+Y6zVr7PqlDralMk=;
        b=Sq/H5+JOtXUIywfjdDKZGEFoZNqoGg6zlBULRcqcNca4UvIknqVKDmTih0WvDWsAlh
         26E8qy20ghfI7Vc9bxBvzN5pBHqdTYrJVT53iyWS5v5qU2EpJbR+aIFr8S6is2tVqirw
         J/fkwxEAysSIQJeczYUTd/iXxPo/B6SLVhMS7ISpVUPq+cu+MUpqYxX495FFkNExT4bx
         BSTO4nlGy+Q4yiIbjmoZpAif5IIOBUHRC3/0JUcFPzP1h9fYHZo77VPDw7O/ZnS5DbYp
         wQYkdslNw+4MqtdeFsvXF+RV4A5yvOr/druqKthqe4emxQkTCOB+29ArfWmGUe9Zhiv7
         lsuA==
X-Forwarded-Encrypted: i=1; AJvYcCUAXO+AwqW30QBSUs6uq9SKLM3yCrUZ8iczsTTXOfIypsBBoC6kBbaQdJcgIfgXZjJuMwNF8w0Nflgz+qU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlxHMljVBYkluH8uFeXKkmOPoks+ab7DyP+t0VIeAfo7lQttEr
	GHft/gnrXAmRQ6Ou0rcTmuVY+Eziqq6c6mKASnpaeU4MM5xCvObYUUKKZcXDtosNm7w=
X-Gm-Gg: ASbGncuxit5TppWNIs9N5xIq6e6078PNukln8ae2ib7K6nPegu5SVZq5oqYPcuSsyyF
	oarM8yE9IUQVEjaxWbjkCHjzHxFujY3oFkYq2vKBGwJ2AZ6BbfjuzlWeum+PCe06sdN05/dHo1S
	WPkRjHLTSBuMTCXr6ePxCFouKdN3JcV9dA4oKhM5uOhAsAvaUfnj9loPtExcaPyGQXysvsyh1P0
	GM91vuF3j8VVQaQwuzUunkZrj0YgAsx5z4Ad8l/ZKs6bWEEciTW+P0w90CphjQAT/ygCtA8i6Zn
	pu1FY4ZDaBROz/sUYlVBMRGDHQTLOIzznewdA+Tjl8WeswwY5cqNsOo9k/h2cCcrGwFfTLYUxni
	3s2giLPYuktt9jBrWYyrALg==
X-Google-Smtp-Source: AGHT+IEQlE2inVcPa3XqH6/JYvapWfOKX27mQ8m7//vg+Z9RExKQrvITesM045aa9ircpVQ2pBhElg==
X-Received: by 2002:a05:6512:3d0a:b0:54f:c1ab:2cc8 with SMTP id 2adb3069b0e04-556e71185fcmr232528e87.10.1751633620006;
        Fri, 04 Jul 2025 05:53:40 -0700 (PDT)
Received: from localhost (c-85-229-7-191.bbcust.telenor.se. [85.229.7.191])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-556384d57a9sm241167e87.257.2025.07.04.05.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:53:39 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: mst@redhat.com,
	jasowang@redhat.com
Cc: virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] vdpa: Fix IDR memory leak in VDUSE module exit
Date: Fri,  4 Jul 2025 14:53:35 +0200
Message-ID: <20250704125335.1084649-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing idr_destroy() call in vduse_exit() to properly free the
vduse_idr radix tree nodes. Without this, module load/unload cycles leak
576-byte radix tree node allocations, detectable by kmemleak as:

unreferenced object (size 576):
  backtrace:
    [<ffffffff81234567>] radix_tree_node_alloc+0xa0/0xf0
    [<ffffffff81234568>] idr_get_free+0x128/0x280

The vduse_idr is initialized via DEFINE_IDR() at line 136 and used throughout
the VDUSE (vDPA Device in Userspace) driver for device ID management. The fix
follows the documented pattern in lib/idr.c and matches the cleanup approach
used by other drivers.

This leak was discovered through comprehensive module testing with cumulative
kmemleak detection across 10 load/unload iterations per module.

Fixes: c8a6153b6c59 ("vduse: Introduce VDUSE - vDPA Device in Userspace")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/vdpa/vdpa_user/vduse_dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
index 6a9a37351310..04620bb77203 100644
--- a/drivers/vdpa/vdpa_user/vduse_dev.c
+++ b/drivers/vdpa/vdpa_user/vduse_dev.c
@@ -2216,6 +2216,7 @@ static void vduse_exit(void)
 	cdev_del(&vduse_ctrl_cdev);
 	unregister_chrdev_region(vduse_major, VDUSE_DEV_MAX);
 	class_unregister(&vduse_class);
+	idr_destroy(&vduse_idr);
 }
 module_exit(vduse_exit);
 
-- 
2.47.2

