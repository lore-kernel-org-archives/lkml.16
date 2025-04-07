Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7550E4642D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009434; cv=none; b=gj5YTddA2u2r76aRC2vlk2P7tpczdwxA9c/R7I/4hvJwiFy6Z1b7FXAuTgZ07FGiK0HwOcSs0sqvE8oWf3quhq9yRA4c4glDsACMupmrBSB6ZGdmPCNCiW/zzBVjaaEj2AQnA3d664rio19CQIqlw8qLujNTc8uJnpoZfa7iQ1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009434; c=relaxed/simple;
	bh=Z+8UOO39YBc+T1y97DlWYg7KLpo0fCp+oQJIQR/1Nds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rLIl27I81DVleAht+6vrKe18W9CR9ArywhuP2PRlL+orL3pWs+TC09OzROECxnHvXNNipsb94+KT/a2vZn1K8fOLszgtu/ZTDHMRmtbzwnvtubF2OKyq1Y3CyJ5268MEM2UAC6GguYq66qAbdYeFEKfKUUbjo1pObnaGI86/k2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UqXA+PPm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UqXA+PPm"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so39667065e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009431; x=1744614231; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qzzp+JKCZz+nQ5nLldVSHzCrtdZcblauKURYiVCXSZs=;
        b=UqXA+PPmR+6tXaGL1ktJx1gxqgc5HyJQEnG1MiyjbgY45GVZduSpmDSO/AKYe5VxeB
         ENNjsXrztA0yZ0HqKpGrdA8LN8sPq6vF0tXZn6xbPDP+YdQxwmbmTDi2lfIXpD1YIgjg
         2ruLU9K6riWn+YICeWEouqYiDq4zxmaHLdP7XvhWqwnNIrk9dwag7dHkNnJQomWaGN5i
         8Y75FRivMZ/UEyf6HwgyFbih2L4d/utjdfWzDngDtbLvzQjg8XCMQWmqh9psZPv3fAUE
         NpLomyDrnViQkP1UmD172KOsQ0r6D86l+YlnnN/yWA9+nY0onnIhFuq/7yRhFadcPGA9
         8daw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009431; x=1744614231;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzzp+JKCZz+nQ5nLldVSHzCrtdZcblauKURYiVCXSZs=;
        b=j3MVSSw3BXyRxEGX5ukCwyNUZoM5DZ8zdexAEkQL3ogqGcnyeqOgi/ExNl+qYapieS
         rxK3iuEu7CVqZ07FfPrJRJdb4VvIvExCNfQD3xqwRK1jP/W/GpMbWFzDBxRz8BwtafLA
         qAhU+Xv7DKFPBSpe6vFrK8noihYKHZNAJc8ltHlAlLY0ST/r6/t/l7SIT5OM4ziTmEHT
         qMFS3evaq1GXGTGEEUCYN2mddsXiRbKMXmfuBEo2L1FGkv1flBY6Fz+XD6j/usmlot0n
         1LfGDsgyGJEXfrlQUTpH06O7/aaUtSMC4SRhHS++prskdMIj7Sb1zQMPc6XzlE+G7xiR
         tuXg==
X-Gm-Message-State: AOJu0Yz7QA4Ak33mp8POJiTv6QJunWfNrDrihWxuH5yXkoRxHnSqnSrG
	0w5UWWRmoOV5CkhEX1f0/+T5GEemjXdlsTc/vO+mNBqpvuei30kVujkO61ZUvv0=
X-Gm-Gg: ASbGncvzNXIFDGuy7wsj7t6SH2BnVNECKedhVCAyOJYFtOmmOkWy0s5PFgHNy9tdLfU
	X1aeX6reSvBAQzDD7Gi9JqHpwmhO4PSbbakecCIzkr7ke/BjxywQZHFigqhHVIckP/7ZGkoMJNw
	mn8BKKH2nRkj5C8rSKwIC6g64fjzztWj0abiWJMB0RSzxJLEvzVmKrUiVHD/jdeEUH+0ImNRRjk
	Vf6lGBCcaGRtbgN0ZcS0ztM63g0aIaa39wDPXkaj4LinPabBgx5Qu4IWRDirsTe51brsJVFlGBO
	Vj2O5XtD/JKPco+eKH0/cw1mhPiOjiA2rSGhog==
X-Google-Smtp-Source: AGHT+IE3e261hN5ddjK1VdmAtTVul76Z15/cJ+jnYnQw++nW7BWrjLIYsdp9DL5FInlkWKry3Su1mg==
X-Received: by 2002:a05:600c:3ba4:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-43ecf89d5b9mr80236805e9.9.1744009430754;
        Mon, 07 Apr 2025 00:03:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1660eb3sm124626095e9.11.2025.04.07.00.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:03:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:03:46 +0200
Subject: [PATCH] locking/mutex: annotate __devm_mutex_init() with
 __must_check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-devm-mutex-must-check-v1-1-cf62b440bc33@linaro.org>
X-B4-Tracking: v=1; b=H4sIANF482cC/x2MOwqAMBAFryJbu2DiB/UqYqHxqYv4IYkiiHc32
 AxMMfOQgxU4qqOHLC5xsm9BVByRmbttAssQnHSi8yTVBQ+4Vl5PjzvQeTYzzMKlUX2VdVC5Gim
 0h8Uo9/9t2vf9AJYSjY9nAAAA
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=971;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yzYomcDSz3wepjXnFTizqQ80qxF0+60xkxZziczpyzE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83jSVWvs/vASEstezEcChhelHcz5h2Vfmd02w
 cGEsJttJhGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N40gAKCRARpy6gFHHX
 ci0VD/wJTTM7dzsY5Gn9K5mzq5HTM/2YNU5g+1VNjlTxd6XDKddGI2egtprXPb/y18sArGvUABV
 JYJqpxDGCj+4kpj3SFxg31fvLCe0jIYBXUvQIb2yNQV4+XA8NcWBiULBZJhDBKl0V2SMj884rWi
 J5g1wlE2texmrn0nzliezbEe7Hv6C0Wis2kVSHK2g/WBejk/94ALpLABNkw6RSFgAqkTt/TCu1Y
 zbJoMfCEwLFyCBm/oHiHF8RaIJjlYJJf7pI8gQJuYUWCCsrDolFFCuqhjCd8xrDnb/5d++Bd0NR
 HBXrH/kIxQwqLcIYHJUtxxZE2xCwsG9RbTEHP214U8+sNz+EA1Qc+S0unjriz4Z4lASy1k7+6rQ
 B9eJ5UrrYwVNJXS24YDwQydcj/O1+duAuM1q2t/iubG4JXekAAidNBTn0bqMgFPn6IdJeqbdcxQ
 5KrxF8H0oD6iSmBh0XGxnNkdszVFC8Hra8a7lPxUJSDqaNktjEl3VBKPCx6aoUXMyV8e0g2UJsP
 phAqSJkDH5fQQ+KZKgHS1XGkuQKbZ/Jh68Vln2mHP29YK5JZ+Bv2iJ9TxzOSQthTWy5+pR6TkZ2
 SNP+fdlbfXJx7rsTWJCOKQoQy1E1gStBvh/qdfawtdGHnqZasGrdiT9euxrFF4Y6LLDEP1lEhO+
 T6quSfnchEcqo/g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Unlike the non-managed mutex_init(), devm_mutex_init() can fail (for
instance: on OOM). Now that we've fixed all instances of users not
checking the return value, annotate it with __must_check to avoid this
problem in the future.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/mutex.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index 2143d05116be..e194f8c22d72 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -126,7 +126,7 @@ do {							\
 
 #ifdef CONFIG_DEBUG_MUTEXES
 
-int __devm_mutex_init(struct device *dev, struct mutex *lock);
+int __must_check __devm_mutex_init(struct device *dev, struct mutex *lock);
 
 #else
 

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250326-devm-mutex-must-check-8c1b94ae151f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

