Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F97E2E4982;
	Wed,  2 Jul 2025 18:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751480840; cv=none; b=V9gUbyRhLYwgIAoZ/PVsB3yWy8Idtt5SlABzshhwjKD6an3P/59UKpF68fCzBPcS39FPfsFVxqYf/Frhv4I5bsy3QOyPPca3nirGRsui1zH8meRSrzxMX1WBdbT+zJFX5nh8Gy2kEftLhlN8agEZuB1jVW97dyvD3ErqK4H9opU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751480840; c=relaxed/simple;
	bh=KTxbQMS/BAvEdlSPfoyTogrhhDtpHWNCvTzmjyqNsZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uX9mqLRftGhiRkDy+U49TfQTGTUC1lbdyRnzZ8dBuYj1VbQAGH0X/hO3bm0craNhqg2OlLrPbB53JUklnMK9jBnkNDQgi16qGIlewGK4yYgnJ45iC5Wogdxw+xLl4iTLLhXZH+GbXTbbtVSC0Z9rif6eQ+z6lCNCcwhSOKcf7Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMd1vl+K; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMd1vl+K"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5551a770828so4081112e87.1;
        Wed, 02 Jul 2025 11:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751480835; x=1752085635; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kUJyMooXGKuPEulf4eU+JzZbJFPS97/MtmwJJ3+mmaE=;
        b=GMd1vl+KuyXuZzb+XtZ94lUugeygltcq6N+DniqYZkKuDheiB4UlANNB8IvjNQDKp/
         GJorewN004mmyCn2DOKxZshFdReGrea9eDpuzql4Yz1WVmCEOf9HZqGpMULu3aq84eOU
         X0t5wosP4rYR1YpC2UpcUQfsCPzdw0Nv+DKGxsGp55uVX8OzIqEpbU+4HrVZ8mY7Ww9Z
         i/zgnsQHuWASwmxZdDgzRtzDGC528ejCPw7gotajxIIxVJ8rsu0511zcOWx5Px0ucjcq
         EnEBiwPHTJMQTCxxG72GE7V8dRbcaF1c3eaWd5xx2aI6I6R6cKFZNqOOYh3qkC5l2+G6
         21YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751480835; x=1752085635;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUJyMooXGKuPEulf4eU+JzZbJFPS97/MtmwJJ3+mmaE=;
        b=gc0CbA//MWn965tZssFXyKdDZLWy+5vCajvOCYcT/MokckUMuTkjcenKqq3P9+C/1e
         FdXW1mnl/lANIoII7Q53WldpplJsA9jVWUrQuMcywLhenWKaAc9pm2IKhFCRALNOFDOH
         CgN+vNqyrC0SMNxZX7XGjAQtVLJgJQUwRZ5tn0TT+5AQBBDiMVLsENUU8UR/5d08XccL
         UoUbILrP3lcucWOGiAlfDbS/P/6SQyq11WSG7aXwhBu0H9YUT9ywHxJZC1mA6/1Z62cD
         H2D1D0b/Vb1Ix0zQIfNhA3rLJh3g5aDM3DYKIy4rNnaCR45kXURvTYrvd0LXqvTg88vK
         CFqA==
X-Forwarded-Encrypted: i=1; AJvYcCVrPm0vVeVxn2gYM+X5J0wnREpkdPLUereeSf75LLK5BIh4x+TaIXo0uWvb6QUMtmLO7wiLx9vfPThaqwI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw44fpqaL8e2bC5DJWCadahrV1ffDvHz4qJkpF/apf9M9Q+Jesp
	miq9XgNxA4d1BOlB3KliR0V3B2impJXoXHU5+QHvAljhFSLS6C7hRXyUAPm/0Q==
X-Gm-Gg: ASbGnctFBjRFWzxMq9e8P7FI/nrNWcTI3L52dFtqP19Fsm6VOcsEfMDaIS+peDO0hbF
	0cepmtSsg7f0JT/B2reGl2aCsmhE+BrWAo6uiksyXzvuefvjipEOAWlCtPV/QzuUD8zc17Sf5wu
	/up8uzWn5ogNNlns5Pd7J8jR6DXJHQXacNa7RmSbcKBnnM018+5Nt/Wceztaqy8Epg+VtKmlf2A
	D1Izr0nOxYcZgTNvANeThUAXc3sgGOmofmkb5CQ+BBudbEeQ29r3B3GkF0tylzW51gnM4KhmAQC
	38u9qGS9s+ihsoSEDbKpdjTh6nh9C3azTYHzge5Qsu0qZqEYo8c=
X-Google-Smtp-Source: AGHT+IE1nlRqfV/jPTPge+6zw/NRVt0QTEeCyaRZ+kCJIv9QwpuwQobGO6w4OYl6OPfOyVnVnO2Ytg==
X-Received: by 2002:a05:6512:31c6:b0:553:2450:58a6 with SMTP id 2adb3069b0e04-556282257e1mr1575751e87.1.1751480834834;
        Wed, 02 Jul 2025 11:27:14 -0700 (PDT)
Received: from [127.0.1.1] ([46.251.194.26])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2407b4sm2211911e87.23.2025.07.02.11.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:27:14 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 03 Jul 2025 00:26:58 +0600
Subject: [PATCH] docs: scheduler: completion: Document
 complete_on_current_cpu()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-complete_on_current_cpu_doc-v1-1-262dc859b38a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPJ5ZWgC/x3MQQqDMBAAwK/Ing3EVLH6FZEgm41daJOw0SKIf
 zd4nMuckEmYMozVCUJ/zhxDQVNXgJ8lrKTYFYPRptO9NgrjL31pIxuDxV2EwmYx7dZFVEPrPPZ
 meQ3+DWVIQp6PZ5/m67oBfHPypW0AAAA=
X-Change-ID: 20250702-complete_on_current_cpu_doc-94dfc72a39f8
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751480832; l=1715;
 i=javier.carrasco.cruz@gmail.com; s=20250209; h=from:subject:message-id;
 bh=KTxbQMS/BAvEdlSPfoyTogrhhDtpHWNCvTzmjyqNsZM=;
 b=6Js+x4P5psTsQKrFxdjD5tUEiaNpWODu5AuOkrsXazuXSyY+h4La4qdYDBUDgmKyaPLoUPQhe
 L6ceIUOJRf4Cn7pHhpo20+FQHMSzwZ/DjMhIWU452+94MqYaTnBv3SA
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=/1fPZTF8kAIBZPO3D8IhqidB0sgYzPDkljBZXsXJZM8=

Commit 6f63904c8f3e ("sched: add a few helpers to wake up tasks on the
current cpu") introduced this new function to the completion API that
has not been documented yet.

Document complete_on_current_cpu() explaining what it does and when its
usage is justified.

---
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---

Currently, there is a single user of this function (the one that
justified its introduction), and I emphasized the need for a good reason
to use this variant instead of complete() or complete_all() to avoid
abuse after reading "something about faster context switching".
---
 Documentation/scheduler/completion.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/scheduler/completion.rst b/Documentation/scheduler/completion.rst
index adf0c0a56d02..db9c131f0b62 100644
--- a/Documentation/scheduler/completion.rst
+++ b/Documentation/scheduler/completion.rst
@@ -272,6 +272,10 @@ Signaling completion from IRQ context is fine as it will appropriately
 lock with spin_lock_irqsave()/spin_unlock_irqrestore() and it will never
 sleep.
 
+Use complete_on_current_cpu() to wake up the task on the current CPU.
+It makes use of the WF_CURRENT_CPU flag to move the task to be woken up
+to the current CPU, achieving faster context switches. To use this variant,
+the context switch speed must be relevant and the optimization justified.
 
 try_wait_for_completion()/completion_done():
 --------------------------------------------

---
base-commit: 66701750d5565c574af42bef0b789ce0203e3071
change-id: 20250702-complete_on_current_cpu_doc-94dfc72a39f8

Best regards,
--  
Javier Carrasco <javier.carrasco.cruz@gmail.com>

