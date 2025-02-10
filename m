Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0041F8BC6
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202601; cv=none; b=mRDwIx0iPDFphlkpKSKi84m9Jvqygq3sDiRmYNxqrQV6snIIS4Y8utnFbESx0YIR64Sr5Y9mKJqyshfohSIYTJkALqOh7XoVwpDJUyxsG33Z0Dg4zOWc9r4JIv8rZqzZwZREoBz6WXA1oRAZZQldBlQ+u4ho1JdE2ntrZKPvD8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202601; c=relaxed/simple;
	bh=hTF9BBpSp14sdvnM3Qbav0GMODhgNlVIj19eZpklVHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H18wyPLoKxzyw44immumPVC4v9A7acasNtHJmWL+h3DFa63S+45Sm7NQ3m6Ry+PrjdJlOqqsdanrdlgFV9o+/wpHfjehKpln6cDoFmYSI+36k+doF4ioO0SundJtzXgMMDjaQHwHs7QVDrX4jRVPsxPpZWm0edtQqDlo88GLm1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=inJbW/zF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="inJbW/zF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739202598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XD0KIaPZUowHnH+rhCFRqX97yTDIYw3TwTQ1B3wDB2g=;
	b=inJbW/zFWhU4bLiruB7UlcbzrqU4nZVSjf5T3G55gTIuUAcdkhw/ulZIctLMYFStoInqem
	8ggHu81VifL40D3btGFTjEXCJ5/fnElY8obVaOwhnR2PBK2hhYhsoYdP7NQZCWv8XdfhAN
	S88Bbdh/KtpdQ+8QgkvB7xDLBK1Pkmo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-KT6BKx5xPkmw3n20QNpk6A-1; Mon, 10 Feb 2025 10:49:56 -0500
X-MC-Unique: KT6BKx5xPkmw3n20QNpk6A-1
X-Mimecast-MFC-AGG-ID: KT6BKx5xPkmw3n20QNpk6A
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43942e82719so8499735e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:49:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202595; x=1739807395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XD0KIaPZUowHnH+rhCFRqX97yTDIYw3TwTQ1B3wDB2g=;
        b=tMkCCssaWhpP4WEXwItsHgTG06TQuQjvXAAS9WJzBJZ2VPgPfcuiF8hqRyNye0bnAg
         /PsWeKKjBQWy+v7nVpb2eX/q99Gssn2Qtx/iYXXZsmmTaAmXDg4gYgQ1Ku0fZl44jZXq
         cqXfgtjUl5p5+n24yLav2qZ5ZumVPOa9IDnuOGPAd98SgWdoCUCv62to9J12hl+brgtD
         8LsuAgEGSpES2DtMYfltC/To/QvG/d0nbEQO84nTuuHD6fVHyj6GHraN2Gas09LI/zou
         Dpi8GlrzDPUXojUARXhEZ20y20CkcukFdKpHVzRJTb73ck6uw5AHdLcGuI6TfZ4eYYOp
         12WA==
X-Forwarded-Encrypted: i=1; AJvYcCU86IhI7YRgYg90zQEOXk2gMOXuXnAsEc5d2lLRwcdpMyPYoGh0VErDMb0WBYYd+31YYZ42R6A7n/L3MSs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3HxJ060q2KAVJ6jwxSEN/1GroqRD9xPymXEUcd2JAV/g6qpdg
	MYkMcbX/0pSoE4HLUwC6pjM6sfgA4ZHnRh8OilKXNRx34IamWfwCCW6JhQALnZ7JhYrp6t+xDUf
	XvY6x456/yWh+iKUbubloHB8tX/2WthbXIjHvn6Q+AcfLyAtuzV6iK6E03IZM/Q==
X-Gm-Gg: ASbGncsSLGnIFH4aAE/Ke6gFyLxgvY2vVYzUycNnOMEnkd893ZZKOfps9/OJCeTD8bA
	d6CBPJkglW5DU0kqUV+ub76PE7OR85mXq8W926XAOIiOCJIrRx0mb2zwUPk1qvCdye2xk6yjldq
	UrDi5MJWL2umuaQZHoXQko1QSONsuL4jzhoz5oWvwc9rh4aonpxWZPkiRZj2U6LPIGIt7TQBUPS
	LKl/SQ0qOMdemNToJ+GiQQWRWtqZP/VHOVlyPRbj1rokCIJ+qXIMsrnxOmDcPIIR3zSwkSUfD11
	lBaWTS+IP24aB8SUlhBtQoOkRaXlyAzo/byajt6ag8fVCxoMuVdE4GhaDDK7J4I2Pcw=
X-Received: by 2002:a05:600c:1e25:b0:436:17e4:ad4c with SMTP id 5b1f17b1804b1-43924972ce9mr110358935e9.6.1739202595726;
        Mon, 10 Feb 2025 07:49:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOvLjTF4S/WYvn3O6o65yj9aqhnQ/dCaqnHrrF3Js86fWc5irhrJ2sZiow1ffrtpyp0aYWnQ==
X-Received: by 2002:a05:600c:1e25:b0:436:17e4:ad4c with SMTP id 5b1f17b1804b1-43924972ce9mr110358615e9.6.1739202595321;
        Mon, 10 Feb 2025 07:49:55 -0800 (PST)
Received: from rh.fritz.box (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da96502sm153559395e9.1.2025.02.10.07.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:49:55 -0800 (PST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] KVM: arm64: writable MIDR/REVIDR
Date: Mon, 10 Feb 2025 16:49:49 +0100
Message-ID: <20250210154953.27002-1-sebott@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on prior discussion [1] this series allows VMMs to change
MIDR/REVIDR to enable migration between machines that differ in
these registers. Since these are used for errata handling the
errata management series [2] is a prerequisite for this one.

Note that guest access to MIDR_EL1 is not trapped.

[1] https://lore.kernel.org/kvmarm/20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com/T/#mb855bc51714095a164a7b26bb8bead1606e4b753
[2] https://lore.kernel.org/kvmarm/20250205132222.55816-1-shameerali.kolothum.thodi@huawei.com/T/

Sebastian Ott (4):
  KVM: arm64: Allow userspace to change MIDR_EL1
  KVM: arm64: Allow userspace to change REVIDR_EL1
  KVM: arm64: Allow userspace to change AIDR_EL1
  KVM: arm64: trap guest access for REVIDR_EL1 and AIDR_EL1

 arch/arm64/include/asm/kvm_host.h |   9 ++
 arch/arm64/kvm/sys_regs.c         | 134 +++++++++++-------------------
 2 files changed, 56 insertions(+), 87 deletions(-)

-- 
2.42.0

