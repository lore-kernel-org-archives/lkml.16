Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF4B28F4
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 14:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747578204; cv=none; b=oqOZxWSZAEXjLT94tRYCNm7J9Eff+V+9BJ/khNhpHGqEQu7mNIuWBiNqCHHhc22Oi82p5Ji2uJIJi7NNaU4AEXZtO2rVutKCBSSUn6VdJV+804AiqfDXL/aVb25OHDCBOXFbTtZLCJP4zVIrfuGjKBfxvTH2i3Y+/7KaVYwCYjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747578204; c=relaxed/simple;
	bh=q07axOdquBa9fI2lg1zwk+/hcThPcHgPpGJ9psztHJM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=G8sMhrIRgf/hug4/UwoDXxVDlHIX2qwbL5cM3Zg4pDOWtyVKSzGdSgSFiJqy90No4lhGpct/PbDKbu0SW/hQdNhzHNxxhWtNZCYTd8rBMYQ3kVGwKOAZbdZmpS+otGIGe8wV48WRfX5Qy/ZwBVOQjkz+VRVuPK1IfYnlIkRU1o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H+3VNsOL; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H+3VNsOL"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-23201f062afso8503355ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 07:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747578202; x=1748183002; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O0JMFpfKRHkWz5dz61vT0gOU2nDX1kBA9SfAMIkNRs8=;
        b=H+3VNsOL/7uMpMVePm/9PQ63jjA5AoCxZ/CwQP+eARwvb9SaF75jDBbOYHXmTMw2IC
         owam9d3rKoW0/xAGwT/LpN1h75DQ2JPN1zZ6YFy9xrh4xM1xOiuHGzWTwB4NPum/T41K
         ys9jqvQo21cTquHnCWqrvOjwOD2fcq6MDJkKMz25R2cKRCL6TcbgKMZe7VwOQCt9VdZL
         TX7p6R5ZJLVBNBdVorDhPRF/Glai28wAGMbDLJEKO6yfnMfw71HXcLIvqYh7kfcNCQq/
         Coju7deSGGEKeUpSqzjPSxsluFHdKsw8J9/6Nl5Br7aBN4fL7Hv7Dq36msQEJjSyRKdF
         frnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747578202; x=1748183002;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O0JMFpfKRHkWz5dz61vT0gOU2nDX1kBA9SfAMIkNRs8=;
        b=ZzdAbR7SCMnRY4JVbP/wbtRzYD8uGeyrg0MnZKq4dvmcEtFIxeI9uKg7UVYAFcaMCZ
         uQCExahoEEIe7IQeZszjtuzJHaUHWtUhcyEtvknEGgQD3a4kzAl2uXA6Ka/raR+h7iWU
         XvwRUrwoNH99B/B6upFXXi+Vszld0q/dkZ+dmyoCC1cYF2J2LZGLBHweoDNuGZ80+fJC
         lJVNonw7ekymO3ATsRJ/WMrx5CYfTdd/hXNKshitNaBZRm4fVqHEteE99cKXOAt3mpVY
         IhT0d9jqENxK6yb3peWI8IBn2ZOM8vvlb61cBa/LF1xKPxy8EsdL7nvVIB6S7Irb/I9A
         WYNA==
X-Forwarded-Encrypted: i=1; AJvYcCVmA2xs1qJ1RR9MQO8Rrk6idL74u9kf21BD76inkBtp5v+DTUffkxQW08HZr52Xi6vy1JKqUjFUhd7xw64=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjOz5An+OxovsTZ/O+NqjLnXK03NMx1UIrVzQ2ZKOjLOXeTFA7
	qCKJuMlKWifbgCFEhechS4zDquaKlqTNwSpSLxkj2ohuwyyKQhZtv7lnBfg5qbAuyguGiW1If/W
	3dM9eQ6coLQmtmpUw8ko+cg==
X-Google-Smtp-Source: AGHT+IFhGGyS/qpB4ADRzCQh3Eoab9ep25ucby8TNS7Au1zgh1ezVTdpgmmqERacLD7ZZnseES6r62f7/FRo3P91
X-Received: from pllb4.prod.google.com ([2002:a17:902:e944:b0:223:432c:56d4])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e5d1:b0:224:7a4:b31 with SMTP id d9443c01a7336-231d4b05b02mr95899675ad.6.1747578202235;
 Sun, 18 May 2025 07:23:22 -0700 (PDT)
Date: Sun, 18 May 2025 07:23:13 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250518142315.241670-1-changyuanl@google.com>
Subject: [PATCH 0/2] KHO Fixes
From: Changyuan Lyu <changyuanl@google.com>
To: rppt@kernel.org, akpm@linux-foundation.org
Cc: graf@amazon.com, bhe@redhat.com, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, chrisl@kernel.org, 
	pasha.tatashin@soleen.com, jasonmiu@google.com, 
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

This patchset contains 2 fixes for the KHO series
(https://lore.kernel.org/all/20250509074635.3187114-1-changyuanl@google.com/).

Best,
Changyuan

Changyuan Lyu (1):
  memblock: show a warning if allocation in KHO scratch fails

Pasha Tatashin (1):
  KHO: init new_physxa->phys_bits to fix lockdep

 kernel/kexec_handover.c | 29 +++++++++++++++++++++++++----
 mm/memblock.c           |  3 +++
 2 files changed, 28 insertions(+), 4 deletions(-)


base-commit: 9e619cd4fefd19cdce16e169d5827bc64ae01aa1
--
2.49.0.1101.gccaa498523-goog
