Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70E41E5B7F
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 21:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747516251; cv=none; b=ff5jo9hbFreVUrcMGh08OJQAMdRvz+YamLL1btTl+Be11nTi8FkHYyys2H27dmqY0/2t4ZEliFuusSX6e8RqJ+aWraJLg7DTa5M2/kDY2AtiDAC2P9AYxMi4Doj8KLO570flUrdo12jTQOMU+r2BhYJVEs5SM4iQJzq2Fi5lR1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747516251; c=relaxed/simple;
	bh=o/Nya/tGk006xRA5N500QpaY5OOYSf0gkMPQt5ZX/IE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aJOlGI7Dsj5VKUebzsYKAX8wV37nXkl9gF7lnkR1GZqO2RD1vLXP5I1Tt9Swm0SYNuylHWhEqB5Y6dFzEpLNl02+ed207sw8yuBxao5POhhOuwwVWbYzzFTMCgEKeim7UgAja4EmfHvxXHPiV0MDL5WIiUjqqUZn1gXDOdylBBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=GHL2o8lq reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="GHL2o8lq"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3da7d0d7d58so24202675ab.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 14:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747516249; x=1748121049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qsAWXt+W0ngarXnftcnhixQhh8eXvZ1EEvRj0zEMsI4=;
        b=GHL2o8lqkSudd1Uk7QW6I/krnKcP1hv0oaz7UrRhzq5v+hosno1Ww8QLyFHHusTMmV
         WmWLXiHS9azgnOeUrfyq+1ZSXeG8z3fpEW/aWntFtMzMG2+APGCh4wYRQQ2IJmZ7zTTv
         CDsW+24S/ZNUIsYvulzEG1h2BRFtq2123S6ahbbvFWSWrmNzL3zKdKIpDbDIUG+Oe6Lg
         uycSWRKorKXGC/MWIAMI0Jswy/iZKj7wy0brCN44tvm9AdiIJ/uDPEsZ6CpuahdbdYTc
         oR1cCw+mxSz7wZ1llfnAXtHpiQGCCRxvheq1BzLAJ1sh4a8t6tJyxpndje989X6tf4kN
         vvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747516249; x=1748121049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsAWXt+W0ngarXnftcnhixQhh8eXvZ1EEvRj0zEMsI4=;
        b=l4pwYsPMDqkXsUaVOdprGfuBIO6kK3NXJVnwa8XIYND9YL89LXPD5JtcG3YLx5h3p2
         Y6ORUHe2L7CaBwItRfxF3pKdJRozOu6qcfEP35uVqIDsJksHN8Nloa6F4VX01nGNXoBt
         DS3Zho2fGrkSFNSlsRACA/Issk0NbvFrO48kBkXlwUQIuvBVeAHwcdAy2HQm/T1xTlQl
         6ZH9FpNKYutUUGJp8gpWUXw/vRdPcrofy1K0aibsS8v9dPnupDsc2qvPePVzUYwz8d58
         0IoE2I6IJIINM4xNSP5PGV5ew0oNy7850ALIkdgdzcwiCPuw5K035u1mFomsODkwJpTQ
         hB7A==
X-Forwarded-Encrypted: i=1; AJvYcCUrvRM8tI/i4cfW2xRUtqKjpdrib4Y9vil7sI5O/2xdto8ca/UQcl2I7IA6B9Cw35nWNwVSyYi52gfKz+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYDXdgehQXqq3468DISqBgw+C7dOdZO/b44eYK9f+iQn443vfZ
	acP05dKfhRyQv+o3zbmb6dpS5VaXABIsspDVD5sqduHesngo4SxdGPU7OVxrnSo0XhE=
X-Gm-Gg: ASbGncsBTFtb2ACs3k8+AzdahUVlE+Q2JsK7AcefriB9D5RGm3xm/NAoFXfae9KWE9a
	mqt6DEOqnp3lud3M/XVRbtSvC/nB/b37Dbp/v0a6Gzi08fyrQNDO4KWZ7iGA9Q3ieNTeYap0Q9A
	DxnpXTZ1yn1e43qMO3bhuE0YtCVTRpXnS485UsJxWf/8iJNAvPdW+gAEf9FEBY0aHgwo0m4SPi5
	2Rz2N51O9ZZgVdy/XM3GNz3V8Alin0/qfTaG/hqNHnb/KRiTcHpuxl0qjXQ4JOH7rLHdjJx3chM
	abxpPyyZxXOioK5n6WgTk5shcPZ5dgitzhXHWui6CJSYP/w05nF8Gw+dhRU+cU9CEMgm4kFr1q3
	PrsmOMgo=
X-Google-Smtp-Source: AGHT+IHO8vmPZ9wtEiIB3JiDHbb2n/QkwioIBKsC0rUUGe/Wln0nL1EQukSNTPuRfRNcvEViMy2SvA==
X-Received: by 2002:a05:6e02:1c02:b0:3d9:66ba:1ad2 with SMTP id e9e14a558f8ab-3db8569e88bmr68385155ab.0.1747516248818;
        Sat, 17 May 2025 14:10:48 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3db843e07b8sm11777445ab.20.2025.05.17.14.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 14:10:47 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: shuah@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH] docs: powerpc: Add htm.rst to table of contents
Date: Sat, 17 May 2025 15:07:59 -0600
Message-ID: <20250517210757.1076554-3-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These changes fix the following error, which was introduced by commit
ab1456c5 when Documentation/arch/powerpc/htm.rst was added to the
repository without any reference to the document.

Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree [toc.not_included]

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 Documentation/arch/powerpc/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
index 0560cbae5fa1..53fc9f89f3e4 100644
--- a/Documentation/arch/powerpc/index.rst
+++ b/Documentation/arch/powerpc/index.rst
@@ -19,6 +19,7 @@ powerpc
     elf_hwcaps
     elfnote
     firmware-assisted-dump
+    htm
     hvcs
     imc
     isa-versions
-- 
2.49.0

