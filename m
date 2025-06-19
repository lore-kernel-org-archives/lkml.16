Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9751F30E831
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 18:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750357592; cv=none; b=fH0gRluxiht0K5K21BuC1H28u47ntKgPbWhNrM5LFOklY6l1nZZyVrUko8w2So5mf26BDdqFYkV9RW11b41dDfI6YKlJkItE5wbdULhm2yYJeNtYT+8V00vYB/osO0LODVO7VYkt29UVdr/grljrKo9Pm8K2LKYRiOHPzaLl8UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750357592; c=relaxed/simple;
	bh=xAXdXSNpkRXdJk0Iuqg+ysFWFY24YTHzxOXr0w4V06c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=WfZEcDA868VRfNR5nLwsLno4zVHLSDB1deNaIMktH0KcVt9CRN4HbETYaIOf3c0wBTAy5XXb5XoVf4CE/lwT8NYbj+gPTnmX1OPzOj0sfc8dCkMpMKKVigPueua35A0kSCfMKv5P8zt2DpVfenXielqPfW1JXEK0C0wSQgkgfDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkoGRBaU; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkoGRBaU"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234d366e5f2so13821145ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 11:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750357590; x=1750962390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6LU6WZ1sS2P+1pyOyitPk8GofNcu8iSEglDbZ8V7xgU=;
        b=EkoGRBaUGgPfkzIfrCWnLlcnxDjJdKzMNnsJYnoM5f5zYvPGiHif158ol228G3qGoy
         /6O1yOL7Xwr6s1Eh1cvcEjfOSITr4nXI0wUK2JQvmli0OMSZo8oYFgHggrx5ekv0hUDo
         Fo8sx8lUTn/lVjbU8vGj+hl1tA4uoptCe4EK7R9vjx1f+PefggTi7JFnlOhBY0xGgNCm
         dbLVQFrwwJZtBepXiD4LckGnN+t8DbbTyHpQtCDKP8zlvVJHbJoFKDIaiaYUCwC7kE6f
         3OzurZ/gbwFdgonC0i9smN/SeXC/Gk8Bcxjjpz/3Tpm/ci/XomZPMWP7ZBwqzjwHMjom
         Y/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750357590; x=1750962390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6LU6WZ1sS2P+1pyOyitPk8GofNcu8iSEglDbZ8V7xgU=;
        b=sa7MeVglJSefhuBR0Q/wf3FcovkKoOUWusOGNhIjjwu3/fumb1Io9aXAQ+zIpEKV2b
         A3w+x9esQvd5UyBAmLSjiUggfRh0mOPjzcH2jE6g6DtdbDcFYNU86TiT6rBQPiVzvXOE
         MIRELzsxydeWjRkeTYhUbjEmr8va6jBqYObNu+b8U0Ynbx68vJiP//VylJpQkzohekj4
         +PhfbHnV0UKZhx8BRSVAYLpzi4q83A0Bt4X68fjiwwcWlA6ytFUGACZE12VOqPmGqCCw
         zQOvaEANzMYsim0GIZq1ppB7+72YLsYgmJgUmen9iEHuTx4u3+eTSpsmIvlAl4V1sGJy
         M6iw==
X-Gm-Message-State: AOJu0YyUM69jG1HMutgjz6ErRG1ZuexZ7/D4ALTB8oh4GSxDsgh3CZsY
	nMNVzeIzYd0Ej8eWmVSgZiQrkSCg2xxQkV1h+CkaRKSLXBClC4yjoIqUFagLXQ==
X-Gm-Gg: ASbGnctM+f5jsvBkb+xedSxX3lnkITfiqPYhdAZof0WxXACAzEVyaaT5CqE/nx9u0a4
	Ss1wMz6KnpQAqlVXVLmIsxM371+/4tVW/JIlm9fLKTXFf1IB+O5VB2Ih4FU0aWzpYDcoj2+oLzn
	ckNEnYd7eS2r8tB52L3S7zDN/We9RCBE3wQ+I/CtSLP3vHicCfn7udR5nOMLf0Pucz3zj9EuWTl
	oY19QQJ58d9DADYqOy6B1hmkD+WS2M65Xal1JBeGKdGAQ596K0/Q37tAyYt7aiSuuxR/M7JX0/H
	j7J7k9NtEyI6xsWSUKdIboq/ezDmuDMmn0z/BTz2leLUb0aTTTf7WUuabHYg5A==
X-Google-Smtp-Source: AGHT+IGTZK204b2vIQNWi1IBdTbPOnR3ud4wldbVOTVIgJeqLxy7/UmQ6nbHt+HrUV38ARAFYkk5Iw==
X-Received: by 2002:a17:903:32c9:b0:235:a9b:21e7 with SMTP id d9443c01a7336-2366b3df793mr321850155ad.48.1750357589729;
        Thu, 19 Jun 2025 11:26:29 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83fb15bsm619075ad.81.2025.06.19.11.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 11:26:29 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 0/3] bitmap: introduce find_random_bit() and use in clocksource
Date: Thu, 19 Jun 2025 14:26:22 -0400
Message-ID: <20250619182626.393541-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nodemasks implement node_random(), which may also be useful for other
subsystems. Generalize the function, and propagate to cpumask API.

v1: https://lore.kernel.org/all/20250604212125.25656-1-yury.norov@gmail.com/
v2: https://lore.kernel.org/all/20250608194536.28130-1-yury.norov@gmail.com/
v3: https://lore.kernel.org/all/20250617200854.60753-1-yury.norov@gmail.com/
v4: return NUMA_NO_NODES instead of MAX_NUMNODES in node_random() (Andrew)

Yury Norov [NVIDIA] (3):
  bitmap: generalize node_random()
  cpumask: introduce cpumask_random()
  clocksource: Improve randomness in clocksource_verify_choose_cpus()

 include/linux/cpumask.h   | 12 ++++++++++++
 include/linux/find.h      |  2 ++
 include/linux/nodemask.h  | 18 +++---------------
 kernel/time/clocksource.c |  5 +----
 lib/find_bit.c            | 24 ++++++++++++++++++++++++
 5 files changed, 42 insertions(+), 19 deletions(-)

-- 
2.43.0

