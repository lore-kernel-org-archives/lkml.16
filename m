Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DCB293B5A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561170; cv=none; b=qd7v61iJ4yPenwhGTtm8a+4N4E4E2L0pBdwSzQunL1h2wihLm3H5hqB8jhTlVjUBhpId2VVCNra3o7p/4ESm4hCPj1b6vV9vK9kEgKKTfKlX0YdmcaXoozH9a8EwEUC40LHBeVBtC5uhKUhqL42JtRWVYGgRnvTJiEal/aSjrTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561170; c=relaxed/simple;
	bh=tSR7/fIjqV9+yyF1LGzAkWsi5rJ8eOhUaetz1Bfbz9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aTlz6XlMH2silMJYO54LVE2jrEUTxMWgvQvOSaCwPUPIwRMiPoCQfdTGQSC06swHbUZCwvEI+aLYvMX3gsnHv6ENRxiaRxiD2ZUPknacpRLJpe0d3zeDObNBbTpHpZLDV36EwrVVDiVjbjsXacjqSxjFyJXoKTuSJDjXPSrRqQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CITwnkDi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CITwnkDi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749561168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xKBj4p2Vjm1RVX1kUZg3pFVIOXv8dd+d+30EbLY8ru4=;
	b=CITwnkDip4IaOcvrgEZfez3JrGNi42isgpLDUsZIThM/9bnJmtYUFRbPWydLzwpNc7l5yV
	VoWrOgHcN7OXOGla1xdTmyCbt5mWYaKHzykwt7ANw2wHy/FctF+e7j5Uij1m+17CdJt3Lf
	ikRQUSQLr99DSW+ySKMhjmD57GEUzZg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-Cc9MMdqhM5eYVXLxFIG2MQ-1; Tue, 10 Jun 2025 09:12:46 -0400
X-MC-Unique: Cc9MMdqhM5eYVXLxFIG2MQ-1
X-Mimecast-MFC-AGG-ID: Cc9MMdqhM5eYVXLxFIG2MQ_1749561166
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d21fc72219so377600185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561166; x=1750165966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKBj4p2Vjm1RVX1kUZg3pFVIOXv8dd+d+30EbLY8ru4=;
        b=AlpsYfIizu8rQbUh4cC4dxfsn7Ao2gskaoLIDE+FON20PjTzWMrU5ePdBqj7VjDW3c
         Eg14g20M1Evsg6XPGPmODELZ8c4JnN1iNtXzo+vywev53VV96Vxczgt+WvD9TCMIW2li
         CL5pWpRjiyXkJjRBUOiRA1z+W/ELiqVdOkmLnJO8DPwgpoVIx8Ug1lbj97KwkA6Dd/M4
         UrIEIZCHNkTu0Zc2LiDBsbiwyGBzY/NM7XlWIeG9/56NbfQvQGFH+Quu48fHyP5bzRsA
         v9tfdZ1V4YRM7IAknHd/aXlL2HMf25l4+tDgwyRAJ6UZ7WldXtYMiFUD9nGDI86hqTb6
         IKrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV57sHI5Ve6TJeYqi9gzRpCX7RvOPbwZsA7e7Ly3VzOUOeRL97YDSjmG54VMiKY+Nyapm3/oueh6AhfV/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDIbN0R5wqiY4bQdH9Zgusf8ngg2ulOFJjHqE+Xy1GrR7JwqHA
	weEU6RD/2aai2QLmy231xLqiS2+ReZwbOnVKG4eIAfamXIv4qc517H1VV50R4D5Z/VO1vNm54hf
	SS/zQ2WhQp3u5e1r53eWsjJ3NSga+ubjuxv3BJ9EcF6aEDRbcjHdEqTgwANwgL33x4g==
X-Gm-Gg: ASbGncsWVflrncBSnwWMhgIkDBwANBBRgdCWvXRBNBGhCFawUekFy2dYcATmof5RjAS
	lS6Q+OiG1YO2CjcO8l1W2HtDfGpCKn3/e78z7IGOnRWt/30LymWaqCxx51wGOnB8ATCzbd1OlKh
	BRW3jWxj1b/ENv4G5OEyyulo3asfXCTg78ezMEF6xtZRXHsojTINGy4rqNscJugJFjqmSuBdA0q
	r1VwTbAumDExJBt9yIc3od3AVvcNH/H79ToCy5sN5X69Ie/I8mkHyIv6HAAXHyGmjjpNgzs5wEL
	B3I+VWxC+e5ploq8TWBSoIF0YzJfxfxKhBdhtrxlio/QWFkTXp/e8g==
X-Received: by 2002:a05:620a:8386:b0:7c9:5501:80d2 with SMTP id af79cd13be357-7d22995ec82mr2171099885a.15.1749561165978;
        Tue, 10 Jun 2025 06:12:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrYOJLYnD20Za7bwTGNM2Zhi1hWiuol78eHZNm8ukeun1kZlhQxetU40CFKtTARDHt7p13cw==
X-Received: by 2002:a05:620a:8386:b0:7c9:5501:80d2 with SMTP id af79cd13be357-7d22995ec82mr2171094985a.15.1749561165513;
        Tue, 10 Jun 2025 06:12:45 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25170615bsm696832285a.9.2025.06.10.06.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:12:45 -0700 (PDT)
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
Subject: [PATCH v4 0/3] dma-buf: heaps: Use constant name for CMA heap
Date: Tue, 10 Jun 2025 06:12:28 -0700
Message-ID: <20250610131231.1724627-1-jkangas@redhat.com>
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

v4:
  - Fix ERR_PTR() usage for negative return value.

v3:
  - Extract documentation markup fix to separate patch.
  - Adjust DEFAULT_CMA_NAME per discussion in [2].
  - Warn if the legacy heap name and the default heap name are the same.
  - Fix DMABUF_HEAPS_CMA_LEGACY prompt.
  - Touch up commit log wording.

v2:
  - Use tabs instead of spaces for large vertical alignment.

[1]: https://lore.kernel.org/all/f6412229-4606-41ad-8c05-7bbba2eb6e08@ti.com/
[2]: https://lore.kernel.org/all/CANDhNCroe6ZBtN_o=c71kzFFaWK-fF5rCdnr9P5h1sgPOWSGSw@mail.gmail.com/

Jared Kangas (3):
  Documentation: dma-buf: heaps: Fix code markup
  dma-buf: heaps: Parameterize heap name in __add_cma_heap()
  dma-buf: heaps: Give default CMA heap a fixed name

 Documentation/userspace-api/dma-buf-heaps.rst | 11 +++---
 drivers/dma-buf/heaps/Kconfig                 | 10 ++++++
 drivers/dma-buf/heaps/cma_heap.c              | 36 +++++++++++++++----
 3 files changed, 46 insertions(+), 11 deletions(-)

-- 
2.49.0

