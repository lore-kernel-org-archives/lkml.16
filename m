Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C84A237178
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859396; cv=none; b=icWrF/W6p7aPI4kO2FpaYyFNrZNtirv5mi/qsplqjH6GsSWS1TaP/cShvciayH4ZJQ8beN29g0vMJg9jPnuISuwIPnnOGKhiK8ZtuhYaGhzV+WB98V9i+2wX1RcKGPs25w/6jnBm0iqqXyKVqdhC4vFQclNJDs8NyBZ5NHBMWPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859396; c=relaxed/simple;
	bh=iT1dGSwpnuGP00T4Ar+Kut1BwH96o46YMnM9awaZugw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TizzQaMOVkSIRm57s+QC/VdRrXGf9wifLJZUxIHjh5cVmXYNPxRwuK+wTIWChAGGqjgly1PrGelfyoXsB6FcWsLos8awPkdtqMB4AefjqWTjlRA0XC3XJTIsieyYKuotMpxMRT3KPfOswhYZ2LNRNyHp+OZMciLvd3cRdJV/aLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=X1BTAx+5; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="X1BTAx+5"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab7863f9be4so9711166b.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 08:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738859392; x=1739464192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+oHRfsKZwrAHmNfmaoBp4cNVz8j1BX173gqVMxnYc0Q=;
        b=X1BTAx+5hQdxtE0e5k1npeZjcurGlxnvc6l8gXiOIIZzlJSP2myM0BNL7d7jobUhvu
         LmxcR/Dg08v1gjBwZ/lRp8UK9YE3e5pOOZEuWhaE5NAeCGG6CjwtIBYKKZVssC1ipTlE
         Ngp7e54rhYFIeTyGegV9qFBJOZnTPNFZTwnx9KTxW9Y/yDiJ2Zubs0ETioxGCpu7f9cL
         RVLLnbso+xnluAzYSWTXhgHlbRBZEcQkQE9hxogz2S7g2KlHFMBGRzCdWQtK8TSaWmdD
         NSwQcYEiRMDP1MJSAK1ODcDvHpPARP5TuSu9Bl55XuGxym6PNcqHqhrl4PHMpIoGOSKW
         Eyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738859392; x=1739464192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oHRfsKZwrAHmNfmaoBp4cNVz8j1BX173gqVMxnYc0Q=;
        b=btEZsN+8vp8VGVp75yC4iRSKI3X333q/N8i4ykv68OKN+93CGCoTAvBpW7cr4kheXk
         RlkGwxP9o5hz7JRV3GFVCwZL6MZLVRLC0tQGidZDpz+1GeNP97MnjNA6EGOmfc0VwOV2
         VBHj5FUbqb5YBWpbtXEWsCdmCIbTaIDdS7w9hZ8quswUatlz6CygAT+KfVmsAUUig52M
         1LIVUwAhwJs0Z6Xd9IEUMs2mVaVjZHKArr9XIRKTOYMq/ErCBiBcX6+o8j3ZfE+PGRX9
         l84DMynyqnFkdMKvV7uDyZdhxPV0wVjP+88KGHaVNsvcRC95bWPNUVrgtk2i+HN7GZtF
         xEdg==
X-Forwarded-Encrypted: i=1; AJvYcCWA6G/KItRgguMtRvzLGy70IAVWfEpk4tHehXdXGwG7dewVIEu9sGwn75212L5YHiawGMzYbChV96epcMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZNaZxVjoj8320tCscudZPtI4hqQo0rXq1Ccu3RGbGK7acz6lN
	tNvlDC3WPE7ZZJ2+ylJFBZTJxSnTpUKRo+oeretCZHqFikv50J77aqgop1SdB16G8pUbC0qxgax
	QrEo=
X-Gm-Gg: ASbGncvENiOoVPtbfTeMfI3i9XtP3J0lGkTxhGC8ilW4IeK8Mr4HmiAsr0ZEW2ZEpiH
	KQxfCuqFBbymuKXx/GNagxYfqyK08L/37JKIttGTar6JGAa1bqV0PFamDBN2t7U756HCb+sIx0a
	BgRG7pW+4r2DY77/bxECps72cbOHotPwwkvUHGkm3iDb8/lL5k4QMW1gjwSEZ3jngS9be9Hr+sl
	ybFwyw0j55lVxQQ2Vhh8XfrhQx8zKi5vgZj4AUOVSve8+qWGA00NyPNPx8eJOzq/gtQeNFDXTeZ
	bH/nc5OYpaPqe6Nw4SyIevzN1w==
X-Google-Smtp-Source: AGHT+IEAiTv3bhqmUm7QYxdfJUhdzZ/eVors1B4C6qvg+EKYN0W4MZJZUGLnR7vaav6rNnOJD8/DMA==
X-Received: by 2002:a17:906:6a14:b0:aa6:79fa:b47d with SMTP id a640c23a62f3a-ab75e21fd40mr782332466b.1.1738859392286;
        Thu, 06 Feb 2025 08:29:52 -0800 (PST)
Received: from localhost.cz ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab77365c9fdsm120445466b.169.2025.02.06.08.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 08:29:52 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: bibo mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Youling Tang <tangyouling@loongson.cn>,
	Peter Zijlstra <peterz@infradead.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/1] loongson: Fix idle VS timer enqueue
Date: Thu,  6 Feb 2025 17:29:21 +0100
Message-ID: <20250206162922.3028861-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch aim to fix issues if timers are queued because __arch_cpu_idle()
only checks if TIF_NEED_RESCHED is set before going to sleep.

Changes are described in [1], and [2] improve the patch further.

The following patch is the result of [1] and [2] combined.
Code compiled successfully, but I couldn't test the changes because of some
trouble emulating a loongarch machine; I tried to boot with and without
this patch, but a panic occurred, due likely to a wrong VM configuration
(panic occurred right after the i8042 probing).


- [1] https://lore.kernel.org/all/20230811170049.308866-5-frederic@kernel.org/#t
- [2] https://lore.kernel.org/all/06cf8750-901d-2f65-fb9e-81980688e017@loongson.cn/

Peter Zijlstra (1):
  loongson: Fix idle VS timer enqueue

 arch/loongarch/kernel/genex.S | 33 +++++++++++++++++++--------------
 arch/loongarch/kernel/idle.c  |  3 +--
 arch/loongarch/kernel/reset.c | 23 ++++++++++++++---------
 3 files changed, 34 insertions(+), 25 deletions(-)

-- 
2.48.1

