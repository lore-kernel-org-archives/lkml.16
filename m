Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207EF2AE93
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 20:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738527834; cv=none; b=FPsbOlVFbiDQDOs53EDJtEIP/Yc9cUlqKSNnlalzKkQSaqb5pUNcvYFOZ+6RfnhQjEU2GyY2XVG9iNi0ibjLw6BMIAPG0ldJS+ZJ7gC5r5BnS3v+mAvVqhKLNeEJiveUYPWkyBq0IILeUfGEi2hoNn9NoIlvQ1A0I7gR0oEqyQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738527834; c=relaxed/simple;
	bh=WplmU4QcynysjjCVyPVBJmm+RbbZnNeCb8r7p1d7kxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TzMXi69OLmIk6za1CkmdNMy0ESqNmPEn6lXQQNIWQtQTdaD+y6k2gmdgZuStGcug7UXJ7NZTaHe5b0luHHWTDYC7DWuThPKyjj3+ANAJnknerFNauazTN6yGd/g3b2IAGExevrtW9JhTiRjjP2eTlmX8L7qYuOUVL129O0fO7Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PmpuarfD; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmpuarfD"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4678afeb133so40902811cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 12:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738527831; x=1739132631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rEqekHO0qN5Xa9lVAU+E1hy9DPghJ9XjZ2xleGRCQ3E=;
        b=PmpuarfDa23oIWWPtDMHtjGUrAVmy/4Kc1jdF5uYLF9cl7g8KxtKoRjJ1q+FoD2UMT
         z5j9t8N0QwL/CR1MsvWUIr0QzU8mF3JWmmlUTj7SOcY0NCmG4dwQr+E1OTNt9nx7jaV2
         pZNWF4GJG6FTx8CXuJcVahpXG2uDyxtkwu0yX0QmqSNyQsOR4LRrionf4GdcLju6nPFt
         bYLjRtQP4nGrmyjxJVw70m0yi3dULqOqPvYGrbL6jJKTzuxjq42+6HNJlsz+7xwL5AF+
         gkWKTv2ftESZdXbq4tDkbHQPirQt0/o3guP7rwhLG/hqIdked0OehqdKY+ahggwxawwT
         YDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738527831; x=1739132631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEqekHO0qN5Xa9lVAU+E1hy9DPghJ9XjZ2xleGRCQ3E=;
        b=XhhvVEzNeXwKsL1mqs/2srbfHmCc6f9Sb8QG9ljHb3iEQqN2fIJoShZJYpioLf1k8z
         r4lr3e4zvGwYMqrTWt7vizYgAyhwNM3fhvgxTavUkj433ATKEz71BL2o/p6QXAG8o9Tp
         s4dYbLT4DCvc2RoQ51fzArPmT+IXo8d0pu+dRoC7YLX8WDslIFXK9ZFAQxufE5TFwy6E
         H5v+JaMZwEXU/FQy0/ZBWdDSi2OPqhcI+rRSgACWZRPs9Jyms+XMDVxYLCrgcw4cMTkb
         C24OUq8c0PG5MtjkYwzy16qn/h63GG1Gt0FJOSwxRV/XxhZOjSA7jFsmf/20ijBq7PCc
         zvnA==
X-Gm-Message-State: AOJu0Yxo/f5X60lCTW/zyhrLMlakYFIxc3x5XXEVUPRXM6emf7JLWUdt
	kkBLS9Ny2EilMqDaH44PfC9RGxAmiq5aFDO1mHQU2VknTsSEWVfaMNR+
X-Gm-Gg: ASbGncs/6KlE0gz11/qwIj31i09onH1KvHypFAwksNw4vl1NFZXM2LiCirOSvXJNFLk
	XJ3eTxA2k36jBbUJ8lz+cpzhHx1VrOqIw2FI2z/NhzQn6RIgpfwL7OCq/si9zLMELE1XW2rn9S7
	XIh6MXXwdaQVIMIxOG6JYkzEgCPqdQvCz6m1CwzbmHkqfQEgoQrOG850Os41tyvT+2aU08UguHl
	gpdgC3a8Zb3ynV2xophXx8GUjKZ9/xsifz1P8RdId2kZhpLlLXZ4SnskDmTZ11Wjanyv8PY
X-Google-Smtp-Source: AGHT+IEMSBi9624j9z9v3alAd2L7KvMX/V6H5Lmc7VfzpXOOHQ2a0FcGFMwTnhg/SLVsXH+jNccisQ==
X-Received: by 2002:a05:622a:550:b0:467:5f2f:4a9f with SMTP id d75a77b69052e-46fdd328316mr187046551cf.3.1738527831559;
        Sun, 02 Feb 2025 12:23:51 -0800 (PST)
Received: from citadel.lan ([2600:6c4a:4d3f:6d5c::1019])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0a74dcsm40800871cf.3.2025.02.02.12.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 12:23:51 -0800 (PST)
From: Brian Gerst <brgerst@gmail.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Brian Gerst <brgerst@gmail.com>
Subject: [PATCH 0/2] x86: arch_prctl cleanups
Date: Sun,  2 Feb 2025 15:23:21 -0500
Message-ID: <20250202202323.422113-1-brgerst@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here are two simple cleanups to sys_arch_prctl(), removing the compat
syscall entry and a config condition that is always false.

Brian Gerst (2):
  x86/arch_prctl: Simplify sys_arch_prctl()
  x86/arch_prctl/64: Clean up ARCH_MAP_VDSO_32

 arch/x86/entry/syscalls/syscall_32.tbl |  2 +-
 arch/x86/include/asm/proto.h           |  3 +--
 arch/x86/kernel/process.c              |  5 ++++-
 arch/x86/kernel/process_32.c           |  5 -----
 arch/x86/kernel/process_64.c           | 20 +-------------------
 5 files changed, 7 insertions(+), 28 deletions(-)


base-commit: c911589353d148ffc65cddd5c0b00ac4f80a5b9a
-- 
2.48.1

