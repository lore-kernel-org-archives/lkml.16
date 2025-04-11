Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB4A263C97
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744396278; cv=none; b=WuOVeFQVYTLY0OlF7C1F7fjO9cRszFXuKGqiKRGtaPr4SfBU3j98rHeAwrH2vVIoXYWoRMe+Q6OV6D6vN5eURtUsDg/qjGWcnsbJHd/Cxsz6/TDyJdVlAhc5JKeTLWdn6RsZwhvycZu/Dw2k4MU7G4NSv3GMwpHwF4qrQNg31Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744396278; c=relaxed/simple;
	bh=M8BnE7y4pCyI756pxYEVmi0J7DoEWU3Ee5ThcHEeydc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j4FmfMgwSAjcfTDL/5/DK7oFFV9iqIXjSc4bEjR+lGtp4W5KnDzTRIOHWsZeQlZ0HKtqrwo9mZr9Esqw8U2tlwpudLiVaFnQT6rg6+Lu2UGITTyut+9D+1/NAvTDUWpTtiWW5GsaUICCKDCNO8lM+T9lv8Mgqir4hTgL+JUDJ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxTQEIbO; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxTQEIbO"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-227b828de00so22783805ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744396276; x=1745001076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hqLCPzFXeiQ78a77xW/BVwb74EuVbQh9e+hd5aQQ4q0=;
        b=dxTQEIbOlIXXuzIIhcNVg8l9RQDIMsGQmhs/jecp/aMomrSqk/A9O04BkJmx35Mr7V
         OrhonhB9YEO1LYmeHRlUUEwasBc+BlNYJBSOjW2yZUYUf77U0fg5meWunWAU2bV3Pato
         CKeT5tHAjVI62YQE4n9PtdhDWNKYqmys0m+8HBjCXEzZAuYTvsdaRGlp0v20qR7gddOG
         4Fj+G/nOb/OiGJDshsGwdM1bZR2z2tf6dYiyK9GulLs+beUX1u5CGeRTevrI/BpuPhyc
         H9EOtLfHIbgxDcus0OPv2A8EIxfZuI1PJLoJ5QD5vGAIzbpsuh/jwKeO7gzwmI2/AdEL
         mBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744396276; x=1745001076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqLCPzFXeiQ78a77xW/BVwb74EuVbQh9e+hd5aQQ4q0=;
        b=SQmkLvKAwzbFiHg7WqdSk+FUZ6lZUKQYLO9qhMH+jgpkg1JM94r9aUdjLcaxKqAWX3
         JBuQpWIGDr00ZbYuUsGscOt92uhaU6NTj6DMDGPagwTJwpuNHvT1Iej9x9Yjpd5wL5wV
         YgWdakJ5+CGYDktE3eUkG2MiSQyguctfsI1iJv2V4kqPGNe8hp55iVbHKXigARaxuEGB
         Ujz2ehm1bUxwQnl0LNgsNkBnZyRVBIvts60qiHOctToW3MkukLBWoT14MaB31+wgX+Xr
         RDDSBq2W92swcsICkFCg5OvLkdNz5y8pEh6DNv0s8J6B9oagQovzD7LZjY7Ue58FK+Qt
         aETQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl11ybZPA4zMAn5PpGGi6+6tnZKv53LgN3DtZh2soevvesVFqdDUl8IfvetrAt2AxyWabiBW52T1nrPys=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPCO6Nf6aU/QIZSfL3jSvQhWBXKKqzb6R81Vu7WTkpiIswYxOQ
	X4kX9kpsbynm1w6mOKtDYrWDw9Hv1uKcEtIsso36PByiuakA8L0L
X-Gm-Gg: ASbGncspMkcea+QIjGrqWE+h4bjsfqeL7p0YpOjavhbLNltLhikBkAviTBJbUuOFpsR
	0nHJKHjUJKO7VdxsbX95n9+LU7457fvTaIHEdcXYLQUOURyT5JuIT7Ho4axoYu/TbY2K9/jokUO
	ALTTCsZ1pLfo7c5Tfj3DnFRwu4f7YJ/ErP2U+1FokQm2CWzEENEpQHOa5Zn6zZE7EpF9S9Itx9K
	euzOFdicb4OuYgkrRIlQxwpM/r0ubKMqmeGs45fnqEbG41X969cIq7yrw5bGHwvpxzzMB6Lj6wH
	sBxzJ/dkNlxijJJ9nXkCQfHCwxG88el9fZ4U7bsqUUugCRtmifE=
X-Google-Smtp-Source: AGHT+IEXOJDs2wXgxcFgUbdNAfxLHWUacypzxby1mTgd93J+HYC9pcfOuZKdGA9KMKK8PT1SKNnS6Q==
X-Received: by 2002:a17:902:d481:b0:223:325c:89f6 with SMTP id d9443c01a7336-22bea4957b9mr53480645ad.10.1744396275764;
        Fri, 11 Apr 2025 11:31:15 -0700 (PDT)
Received: from VM-16-38-fedora.. ([43.135.149.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cdcsm53279515ad.118.2025.04.11.11.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 11:31:15 -0700 (PDT)
From: alexjlzheng@gmail.com
X-Google-Original-From: alexjlzheng@tencent.com
To: gregkh@linuxfoundation.org,
	tj@kernel.org
Cc: alexjlzheng@tencent.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH kernfs 0/3] kernfs: switch global locks to per-fs lock
Date: Sat, 12 Apr 2025 02:31:06 +0800
Message-ID: <20250411183109.6334-1-alexjlzheng@tencent.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinliang Zheng <alexjlzheng@tencent.com>

The kernfs implementation has big lock granularity so every kernfs-based
(e.g., sysfs, cgroup) fs are able to compete the locks. This patchset
switches the global locks to per-fs locks.

In fact, the implementation of global locks has not yet introduced
performance issues. But in the long run, more and more file systems will
be implemented based on the kernfs framework, so this optimization is
meaningful.

Jinliang Zheng (3):
  kernfs: switch global kernfs_idr_lock to per-fs lock
  kernfs: switch global kernfs_rename_lock to per-fs lock
  kernfs: switch global kernfs_pr_cont_lock to per-fs lock

 fs/kernfs/dir.c             | 74 ++++++++++++++++++-------------------
 fs/kernfs/kernfs-internal.h | 27 ++++++++++++--
 2 files changed, 59 insertions(+), 42 deletions(-)

-- 
2.48.1

