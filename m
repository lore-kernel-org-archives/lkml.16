Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586BD7FD
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745225955; cv=none; b=U08340yhjmkbKlJmIUZsQ6BwoMjysuKIwXzgibeLZhrogS9RzAGbGZPGtXnPzaIeYP+oHHH4PzT++MfguaMLrD6QgNTc+ujk8KNE0ob7GrsjDi/9icOWR5tNDzpQeWnqTWtkTlbHxB//lt+XGzEbiwK5CbewZ5DLPb2uP9X9aJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745225955; c=relaxed/simple;
	bh=Bju8ymkEDmiiXyO85/hrBKVbmyrAz/Rxg2vfmhSIMWk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z3Ucutt71M5i7bVG+b7PCCrUf+C2WOhpJZPHjW0C8E0tNdeJRtx2ahTWAcw/bhrBHwY9XldwXOK/kfpOeqB3sED75hWU7cjZneUGr+8JeY93lw06bZjB+eaLBozEK6kG7ae6ofV0rmpZ5CiApVtaiMVUUvMZqvb2SzPA2IcgqyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ElH1Scpj; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ElH1Scpj"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736c062b1f5so2882041b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745225953; x=1745830753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hdfyYcjWGTOdu/UCbalSGgUhj6rHypbD9RyxJsRcQ6c=;
        b=ElH1Scpjjn/yzBPnL02GiXd7CMOm02pJpeIHs/CYbdMeeKQp/sBj46xx5Vhv5PK8YZ
         mnj43ju6kaDK2UYxzd5SKxUnNxG6o+yPkX1dwIahi7L0G7oIWK1M2wPSuLrX3y+5NA7f
         rjdBcudfGSFas2e1vg4E3rLnTlAdM0D9sUSNXvKlFNreeNo4zkguQDk2Enf66fLL2HAD
         5BY51BQY0JTI3pheGnNk25lc6bpTJsNaQ4rnlKgvXFq1iAFnwqpMwh64lpcxRckuB04c
         jA0Sks0uehB9eTyFEOsxVAuZNld/O5b122Nx4HiLA3SwTAH4gdmGlQNZrtDTT8DOdekr
         u7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745225953; x=1745830753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdfyYcjWGTOdu/UCbalSGgUhj6rHypbD9RyxJsRcQ6c=;
        b=Oq9wGhFoOe9tNfRXhLemcE1EAbuQd0yIxhQ9G2KJZUgX7M89wEgwr1TG+9W90+cV0H
         WZT8lb1QnkufLK90E5TxfMgkSfO1jpSqJzgsdS4CdZ5J9WzfEBd1lE4XAcDzN0rti0Ma
         bEhT3rnydICEm6smiF0oXPv0+GEGi+Y5nbzxaLT8QWXMuWCn76rqnPagT/rssyHIgUk0
         Uze3TvCNwLlkV2DrukXoy65IQ7un0EQv/UfUfPMnSjbIeWpSVq7qZdb+i1iZeyZr2li/
         qP1v4IejSN3iYYp40dz5f3uUX4hhEB/HN7NlVjcg8FL6wBfBys8fit07bkHPrTaQRnsx
         Z2Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWUJIhiLZPd9qBihvm7IySo2UbJOHOyUAeXqE04oncjd+OcZPPlYc68LLjKMykCdjcwFCahhIAcWFH6k1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJP+KSZyQEvm70M/frx12ziprq91pxmTuPL59ZKj6r58RWR/nq
	7cs9Wngawv1Ep9zV+UPARiRuu2YijF62RKEVGlzMBQi5oS4bdb+N
X-Gm-Gg: ASbGncuKfE4+bel6D14spkxYlNUjOU8Ig45HtS7UnAY1W8z6Le6BFjuAasKCvkUzVIM
	E9ZUvq5cWUJUIeXtFfUZfcTy7+dOoMy5ZM/PA7iQQSzfIZGExNadvk9+5gP6q9+eHkthODtGbBB
	iQvf1kGo+9qTX1giYFkVUoau1NTdiYciuODWG/MKgNVtbtLgRU7lPrZmJY4RlbkhZ3/BiiShOZ1
	SB3dyqz6RM6blq+YPUGcU0bukhmdJsg32a7wHbWVdsDcbmlVHkThcWTa2x3K0dnkcOz8VtCRM15
	p86wOkNgKxP9ybCWIiTl9KlI8qr6n4Gf/U9wCTVyAKiAqV+EsGRvZLXqp5Q=
X-Google-Smtp-Source: AGHT+IEdexOf33Nc2LGLtrfxZIzDjmw8YeKrnPWNGs7WB2LGvu8CfsnuMSErAkh78OcSgvv7kP9FlQ==
X-Received: by 2002:a05:6a00:39aa:b0:736:ab49:d56 with SMTP id d2e1a72fcca58-73dc1453877mr15139537b3a.1.1745225953312;
        Mon, 21 Apr 2025 01:59:13 -0700 (PDT)
Received: from localhost.localdomain ([115.99.204.184])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8beb0dsm6082879b3a.33.2025.04.21.01.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:59:12 -0700 (PDT)
From: Jagath Jog J <jagathjog1996@gmail.com>
To: mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	mcanal@igalia.com,
	maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	jagathjog1996@gmail.com
Subject: [RFC 0/1] drm/mipi-dbi: Use drm_device for debugfs, drop drm_minor
Date: Mon, 21 Apr 2025 14:29:06 +0530
Message-Id: <20250421085907.24972-1-jagathjog1996@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch updates the MIPI DBI driver to use drm_device.debugfs_root
instead of drm_minor for creating debugfs files. The debugfs setup is now
done earlier in probe(), before drm_dev_register(), and the drivers can
avoid using the .debugfs_init callback.

This is an initial version, and only a few drivers are updated for now.

I noticed that some newer drivers or patches still use
drm_debugfs_create_files(), which relies on drm_minor. I was wondering if
there is a specific reason for this, or if there's a plan to switch to
drm_debugfs_add_files? I can send patches to update more drivers if
that helps.

This patch helps move toward the debugfs cleanup task listed here:
https://docs.kernel.org/gpu/todo.html#clean-up-the-debugfs-support

Looking forward to your feedback.

Jagath Jog J (1):
  drm/mipi-dbi: Use drm_device for debugfs, drop drm_minor and
    .debugfs_init

 drivers/gpu/drm/drm_mipi_dbi.c        | 8 ++++----
 drivers/gpu/drm/tiny/ili9163.c        | 3 ++-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 ++-
 include/drm/drm_mipi_dbi.h            | 4 ++--
 4 files changed, 10 insertions(+), 8 deletions(-)

-- 
2.20.1

