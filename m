Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7320BB666
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 19:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745349590; cv=none; b=KKbtOpKbLHsxBzHArlpBMgxQSzN6pd5fgA3PjTEXX5wBmc6qNpdbui0gSyJqtab3KMtwlLObxUQ6aiF60TFGUQfd7BrDWeO3GJfX6L5KQzX9LUOYK0e2uCxhU8xGZSGjRrAO0o8lOFEYtxPt4key2JGhF+k5O6awhGdjEIGVkY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745349590; c=relaxed/simple;
	bh=kw5xSLwjdxLb5UzO93JefRlAfAqBFORrjIP38P6h/8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T3CADOqQV3dZVwmUHUQ6wC+p06mPCtsDMfKbrO+kDlK97/wHFDt6NFGzCovMNgMdZiwWwGqNuyTV7OJKjmlIlvSzD/I4fqTtt8RLin1wb3CWFpjVyhfRh0/Dw8NIQizAkGRSs5iIiP/q2snotTUQ8T6QsYfbTe3DIORL3+39DqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MFg3U5St; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MFg3U5St"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745349587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y+KK05zMW7c3LQIz7d14BdD80ooDf/JC+jFj6UdPYvQ=;
	b=MFg3U5StAXWpciOG8PMrdO2c7ql8GB1Prw35u5jHLB9x5HSC2dYLZg+Iv03fB2ICeI5UGg
	KBxiTDyLXe2Ibvn58a0ttrl9q9zBKs3CGYb/sXIISJ4Ka2JahMl24M4afurA1tfO35Uxj6
	YSR/cRAl2u63LnVD/pK0RONthNg4iCA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-uyy3w_bNMM-m4dPXdKgOxg-1; Tue, 22 Apr 2025 15:19:45 -0400
X-MC-Unique: uyy3w_bNMM-m4dPXdKgOxg-1
X-Mimecast-MFC-AGG-ID: uyy3w_bNMM-m4dPXdKgOxg_1745349585
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47b36edcdb1so48662891cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745349585; x=1745954385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+KK05zMW7c3LQIz7d14BdD80ooDf/JC+jFj6UdPYvQ=;
        b=k19g380r0QlivGE2tIeBLmxEyS9tz5xr7r0SrALicNmH8w+WUz4ViCoiW/r8b/pNAU
         kiMQqxZbRl19RiKIFbqaW3Jrl2DI6c2vILhojLMQvYeyOQcaqbwr7hVJXXVV4P2CdnDJ
         Qnp+tJOvfveHQkYYl4SCyy+iYXaCQB84VINLW6UExxJ/a4tmF4UOrEIkZT5GYuow6uC+
         4gCyFqiJjKbeczCZhHnhimitLl2CqL81sVyDYabDqfq0eItu3C5V+7AFtS/mTjl5yUf1
         0LEVrkV253JNsxCTHXcaW00Il2OAPJyo2pnR7VUmBZxL8zQzOWR//HkrDndYi6+OcTMK
         uJxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx9Wf/FC9PggkE/c0RMIdMeqMXPezmKJwL5kCZcC40zzxVvZnOhLAHGhlln+JFPAAmptgpJZgcaNC3EQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YykJyblJ4aexrD00FW6VXlQ8Nm3hVgST08BXngzGdYLhX6QbIhN
	XBe+YvWRZtHn5Wffu6mpp3a17tUWwAbJp3GKgm5NsMXVUPxnQT31Wf7Bmvss27Ag4Txrn5fVzgF
	fdx4fZqp9Ha68wmvElKJlH0YiPoowqrs06z4ELhFYx97tTP1phL7ankWjgBoLmQ==
X-Gm-Gg: ASbGncu4sCETXAJ0Kjdp82Ygx6MXPC6FgXVIPv2doghMUKih0ancE8ndI102gBRS6sp
	eUsKM2r+vkxNKZO97HI28JyOeUf3qfwRlmxebcgRYG1n3oOdgfLUfCCD70kwBV7dhpmdkCWqx9D
	RYdGCqo+Kh+0uMAHSH1oKbwyPhN+B3aVYxQ92chxObcCW9/gDbGyN9iqPSF6NOi52MYHqErDWnI
	qW1X9NOuaYtYz50yvfeWPPyOS1FYP+loyZR/9ojMD1QKj6Cx6om52xCl+8LhMSFMPKCrH6MTw+i
	uSip1rTxV/cZCiSXCwFrk9XblVEBl2aTXC7cTJtbT08=
X-Received: by 2002:a05:622a:10a:b0:476:60a1:3115 with SMTP id d75a77b69052e-47aec49fe50mr306107561cf.33.1745349585343;
        Tue, 22 Apr 2025 12:19:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpIAsSnkkHHksne2RzJemve8iXpTk1ZF86CXiy9hxjUVtuSkEj08Rwo52JAcVf57qaA/nAwg==
X-Received: by 2002:a05:622a:10a:b0:476:60a1:3115 with SMTP id d75a77b69052e-47aec49fe50mr306107231cf.33.1745349585034;
        Tue, 22 Apr 2025 12:19:45 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47b01bef3ecsm40842141cf.55.2025.04.22.12.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:19:44 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	christian.koenig@amd.com
Cc: mripard@kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v2 0/2] dma-buf: heaps: Use constant name for CMA heap
Date: Tue, 22 Apr 2025 12:19:37 -0700
Message-ID: <20250422191939.555963-1-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch series is based on a previous discussion around CMA heap
naming. [1] The heap's name depends on the device name, which is
generally "reserved", "linux,cma", or "default-pool", but could be any
arbitrary name given to the default CMA area in the devicetree. For a
consistent userspace interface, the series introduces a constant name
for the CMA heap, and for backwards compatibility, an additional Kconfig
that controls the creation of a legacy-named heap with the same CMA
backing.

The ideas to handle backwards compatibility in [1] are to either use a
symlink or add a heap node with a duplicate minor. However, I assume
that we don't want to create symlinks in /dev from module initcalls, and
attempting to duplicate minors would cause device_create() to fail.
Because of these drawbacks, after brainstorming with Maxime Ripard, I
went with creating a new node in devtmpfs with its own minor. This
admittedly makes it a little unclear that the old and new nodes are
backed by the same heap when both are present. The only approach that I
think would provide total clarity on this in userspace is symlinking,
which seemed like a fairly involved solution for devtmpfs, but if I'm
wrong on this, please let me know.

Changelog:
    v2: Use tabs instead of spaces for large vertical alignment.

Jared Kangas (2):
  dma-buf: heaps: Parameterize heap name in __add_cma_heap()
  dma-buf: heaps: Give default CMA heap a fixed name

 Documentation/userspace-api/dma-buf-heaps.rst | 11 ++++---
 drivers/dma-buf/heaps/Kconfig                 | 10 +++++++
 drivers/dma-buf/heaps/cma_heap.c              | 30 ++++++++++++++-----
 3 files changed, 40 insertions(+), 11 deletions(-)

-- 
2.49.0

