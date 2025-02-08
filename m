Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C3A23C8D4
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 10:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739009977; cv=none; b=mKWASW1XdDsRKDg5nnW7zsH8AChhr+IF2jNhPKo/wZ34wCptDpQ/132kdJy118VL7jQ68jzBsG4gjQY+SFS2e4ehJH8/oLE8bB5ohDmybVVGtU0+QvbsKuMcuWeV5fanB96lnOjYZk8HO1hipQY5LPrMHtG+CoMzxy4B1/tRSQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739009977; c=relaxed/simple;
	bh=nl/UMAZyeMLDl9KNcnT4jDMNCOBQN+2wkdDP7C6aPQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ht8YeQ0nOohzXO0u70dYnkgXyChssld9nJanTT6zhc8SZZtHCw8gIdfzycYs6Dmtt0tlvVnKdE/MkMJO9TKJLvfa9/xk6mvyULdnnC2CDvxTY1gDLABzyLUsSCzCucAWv+QWFnO6GbwoAUWRbz/9g8OGEfmYZpqc+/AyJVFZ6VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LWIMbFDE; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LWIMbFDE"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso1439162f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 02:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739009973; x=1739614773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E52ub7AHUPwU1UhgD1WiD/oAb/xchvUZ3s1LGR5AR/Q=;
        b=LWIMbFDE6e+hLzyTLenQ+M/VFdTZ1HWQ4T4FnnzLUoaH47mVmUlYkVkrJPSVgfZdN5
         XHItfFWqVvgQsMW98IeBehS6+bp4r8JS5TrtPMK0tI5DYwgZGstlNqTXM+YUHiOYnm10
         QQ71rBp6kiwF+gg0jnUf+2Xm0DjALy+OQFshApZ5lS5FXJCAbFbDP7qJexDPREX9BkSR
         xBSuf8klouSv8xw9EhF/nKBV5fPjdmGvc7B/IzoxbmhhpI9tbwW55+bl3cLF+SRSB6gJ
         eT2GSfZYEzefMgtfhcL4cGpOedIrI7MO/eDv3eoI35cp4eY+t6Gq3DQBWph0nUr8kyff
         tLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739009973; x=1739614773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E52ub7AHUPwU1UhgD1WiD/oAb/xchvUZ3s1LGR5AR/Q=;
        b=I1X7koHxK3rNSV4VLRLkqpM6UzJBj0KkM0st8HlIYyUWWsGcgZqvUr8YfFmxHvobtr
         7T9tQcjk9g/FpdC3TYi0FENEqhFSakk9I52zrS/0KJw/3WIq60rmNd4hDbMnXeRQBX+o
         tFrpAoMkmflzDXiKIKz9UJCeLBa0Z2h1aCRCa3I+kD0adXv0Mo3s7MBN20z+y5Q+pHJB
         4xFqHHiVF5M1LUglKjw+qGXq2mOewQJu8dARieDBBqF1k7soQZ+B1ZGpdv518ADHAWkh
         4pl4rwj0EfNN/3PxPyUzO+FJTeVG7w/yreM8P/RaIBLeQCLm8tHyw2NZB2OoUIbDTkA8
         3WRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSrOiXxPmzpxTtDW+u1GmDLCG3U2HrwNSIhuNeCgDmqpibrgDKbix2LtxvJaPeWYYuXzPlu0wKjIHqWyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR7r42cCFFGL5vGSVxcWfs8EpjEnfI2weH2l0QfeCZJR/L9wxx
	TMNoapsq5dZhMJpnGaKSBaY0i4AX+5lOvjZbyTSTtYrFyIJJ5Ux3IvoEe27rYzg=
X-Gm-Gg: ASbGnctIBegBakA5D8ew1ng+UNEUgqqaXDreIMhtjvdgZPs7OtPf6VtZsWLHUJ4JWHK
	YlcVm0dAbU+qcDe9+9WkmZOx3rnV8lUQENJKS7B+RDPojInMhwfdUWmafuz1Je0oLHZ7kTuw1Gi
	FK6jcOnmhvIrQCAYbx6XcTJzWgpG0vccrvYRbE2IMWrtzXdLXylh5mmnOcXHquQOajXKq0fFhvz
	zGC7RYXlWLdQg+2O8+9e/kiaFFjxEGMBChMFKusWuCFR8YhmrrfXn3zif9NhQyF4ch4Qy0a5Qwx
	VF4zTxQ72dobnoY9+FnZvXE2hNvcPT1FDB68Qqk=
X-Google-Smtp-Source: AGHT+IHbLMa10VIqBv+a4WF96rSbHJEqAj2+w72AGx0qwl94J4A0SXsQrm/d3uwBwGUltUs98eaYqQ==
X-Received: by 2002:a05:6000:1845:b0:38d:b807:b894 with SMTP id ffacd0b85a97d-38dc8dc35c3mr4497447f8f.18.1739009973106;
        Sat, 08 Feb 2025 02:19:33 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd3a9cc05sm1474057f8f.0.2025.02.08.02.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 02:19:32 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Frederic Weisbecker <frederic@kernel.org>,
	Jinyang He <hejinyang@loongson.cn>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Bibo Mao <maobibo@loongson.cn>
Subject: [PATCH v2 0/1] loongson: Fix idle VS timer enqueue
Date: Sat,  8 Feb 2025 11:19:23 +0100
Message-ID: <20250208101924.20743-1-marco.crivellari@suse.com>
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

---
Changes in v2:
 - arch/loongarch/kernel/genex.S: code improved as suggested by Huacai: 
	https://lore.kernel.org/loongarch/CAAhV-H6OKwmxhF_iWJEc8OEZ==h8dTdorTwkE8oMUMWAbU6xeg@mail.gmail.com/
 - arch/loongarch/kernel/reset.c: asm inline inside the while loops

Marco Crivellari (1):
  loongson: Fix idle VS timer enqueue

 arch/loongarch/kernel/genex.S | 31 +++++++++++++++++--------------
 arch/loongarch/kernel/idle.c  |  3 +--
 arch/loongarch/kernel/reset.c | 18 +++++++++---------
 3 files changed, 27 insertions(+), 25 deletions(-)

-- 
2.48.1

