Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E3519F462
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 22:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743804757; cv=none; b=BDWCx27WRURA1aM3PY0SeVTefvkITQzkQglQImWz3oFrqBXi3/5y1Njg3TBeUzJsQYJQoWIYsVcxFa8LqJuNjD+pmHp3l3+LbcKuuiuIQyjwzhdW0IZSxuPACGoOEnPLTOZte9xTP/9fz3sxiOlFWNZ88ImQjatfq7MKaAU1FTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743804757; c=relaxed/simple;
	bh=g+xVFtyBpZ06wdvPmdcjIlfg/j4hhnFLxaCyL3AVl6E=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=o8TmM3gkzkl9G3HSE6jZeutXrYgs4iVIXRLAR0eknwSX7bippdqF7Iqq+RJdEbp57OcTNP5c8T2yGwrACNn9FhaZX8xXGpoQoxsvWd2s46Mua0PNBh0HZct2fvvFjsCsA1SpDsAEz0aF+tDteLEhNLx3uQvGBYctM5+7Sm1l9Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BEhIdI1n; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BEhIdI1n"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-224347aef79so35957525ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 15:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743804756; x=1744409556; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/U4kVqaAyKMKtv8m2nE/g7H/7hJOuqXNvkeHjTm7xgA=;
        b=BEhIdI1nm7XkT7msnC3nQWXVTuC0E0ZFX9gDPci07iGG4B4OchCaWMMP69ILUB5nGN
         CqEKsd0fdeytzQznMdn0M8N7jukRPu5MOESM39bq8rpll1pelRtedYEr1BBmPRiY2440
         N0qfeXi5VL5xGfwEnCnyqf/hST8IO09R/KbJXuIhFHUO9tUafe1ve+XIj9sE0/aTqtGJ
         Qg5emg44360RZgAQ/65d8UD1OJXJ7Mgr0iIqM0lfYDrN86IqO9fFfF/BO4DkewCxpDWz
         ERkvqUf5UK7607dLy/X42Dpcpv4W8ak63lJqkro3oiagRR1cdEd66he1koAcvWz3Ej7W
         USjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743804756; x=1744409556;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/U4kVqaAyKMKtv8m2nE/g7H/7hJOuqXNvkeHjTm7xgA=;
        b=ZA4B8cI2QcWPOqmLkhihe8npZ5ILH1aqRm1aAXR7L2iyKC9arMpa8wkbF8ZYcPJBjn
         eG6VVP6ur3Ub/CMqrmsrFeNSQ8AODoaoXYVSjv9r00AXcT4fJBajq0otRlIP6J403Qsw
         LDm+HYAPD/XKS7BqoVluhBjOCG4oCDs9VpuhxIK1lCaiIS5jZ8WBHB0e5OuZJnkYfwil
         rdB8Sn5yt5fhFqRbZJ0LTusvpyej7Ag6zCmVZZo56VUtpxY45v3XkbEoHBvRgFx9oUef
         TqooCmD/Qgk0r1j3UKrsMyigIgkXjdqA+XIV6qpQg9lGZtRM+KEhOuvj9YhNwhrDjtQT
         VWNg==
X-Gm-Message-State: AOJu0Yyn866IE0+2zk7lJXad7luN0433EajmsVvjpipenyzFLI/fmIOT
	zugqjGOidUFwlCmJtcfN8SfDQi1IG5a0ghJenCFFakRJRFaZI44iGt8+CQEij7y0yMi5oDOKU7m
	3Yg==
X-Google-Smtp-Source: AGHT+IE13OUugeg3CeRGcslDvnyM5A0feauPtld5nJtjovt2pXIKA4CqWaZp7OWEqbj4lz/Qf23nRU966GY=
X-Received: from pfbhu13.prod.google.com ([2002:a05:6a00:698d:b0:732:51fc:618f])
 (user=edliaw job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1aac:b0:224:10a2:cad5
 with SMTP id d9443c01a7336-22a954f9e54mr17813325ad.10.1743804755735; Fri, 04
 Apr 2025 15:12:35 -0700 (PDT)
Date: Fri,  4 Apr 2025 22:12:20 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404221225.1596324-1-edliaw@google.com>
Subject: [PATCH] selftests/futex: futex_waitv wouldblock test should fail
From: Edward Liaw <edliaw@google.com>
To: linux-kselftest@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Edward Liaw <edliaw@google.com>
Content-Type: text/plain; charset="UTF-8"

Testcase should fail if -EWOULDBLOCK is not returned when expected value
differs from actual value from the waiter.

Fixes: 9d57f7c79748920636f8293d2f01192d702fe390 ("selftests: futex: Test sys_futex_waitv() wouldblock")
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 .../testing/selftests/futex/functional/futex_wait_wouldblock.c  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/futex/functional/futex_wait_wouldblock.c b/tools/testing/selftests/futex/functional/futex_wait_wouldblock.c
index 7d7a6a06cdb7..2d8230da9064 100644
--- a/tools/testing/selftests/futex/functional/futex_wait_wouldblock.c
+++ b/tools/testing/selftests/futex/functional/futex_wait_wouldblock.c
@@ -98,7 +98,7 @@ int main(int argc, char *argv[])
 	info("Calling futex_waitv on f1: %u @ %p with val=%u\n", f1, &f1, f1+1);
 	res = futex_waitv(&waitv, 1, 0, &to, CLOCK_MONOTONIC);
 	if (!res || errno != EWOULDBLOCK) {
-		ksft_test_result_pass("futex_waitv returned: %d %s\n",
+		ksft_test_result_fail("futex_waitv returned: %d %s\n",
 				      res ? errno : res,
 				      res ? strerror(errno) : "");
 		ret = RET_FAIL;
-- 
2.49.0.504.g3bcea36a83-goog

