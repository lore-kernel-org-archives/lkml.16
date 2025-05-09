Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD5028FABC
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746791842; cv=none; b=C+IMetnGKW3f0MpWUfibOgrYM54GaHV8Vw3OzEG+pSP7gxW3LoLFS2KDYvsfcyeC/hDu+KzP33kgcPgr08LNoHb1N0x/KdhC9yt73zdFDLdYO8f0MCjRhT/ehJx51wITbMvFjXbarEvu7kEnrd0dmU6e0r3PiII/btUk9H0iID4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746791842; c=relaxed/simple;
	bh=Q5IK9HN+g/ZwX1gC4emIwTwcU9muoYR6ijy3AT09hzg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UAAHL3ufaACUh3ybaNKlA0VIHkTJBZ1ARdErJgSYmZzKfaO1rm1vKNzwcYLxj9BZJW8o476X93iTksBqP4Y59DX8myYmAzEsqaCgFQ4SDOI29h4T7czgyAzJ6ZMqOA51aILiK8xMdALulfnVrZZvawSJWmqNdsstH8bjgvMUw/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PYTcJouf; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PYTcJouf"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso18858185e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746791839; x=1747396639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=th1/bFaPGJFRCo8JO8Rwr3mcmgSJq8KTF5FpG5MwqQU=;
        b=PYTcJoufQeQNTiDL5uL+1fe/GzGTGyxOM7Ez6cVsgYGGECsVLPctTKZ43NH2IgSFkO
         sKn7x63931pdlwIjCjKQWdOSf+opdjXmtL7cvtvFIeplx9YIk3gdpWRnvBjsWjFTC/ql
         wrsYYtG1hPN3MUXn4i7Bx++ZkGMG1j0UHW6lLaSYz47QYS4sJZPhFmWpBWFPbcOJ0GYa
         V8P7u8ToiGrD+VgawNhP4qtJ8MnxUx9gUk34juMidQOkcvE16eicjqWh0AjGYDi+5Xni
         yDDNv5PFvI7NfBlO4oCiKdD54Ubpd9gnV2t5qdztYcS2Cw16gAVO54oc41z4Q7HaBcRy
         wSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746791839; x=1747396639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=th1/bFaPGJFRCo8JO8Rwr3mcmgSJq8KTF5FpG5MwqQU=;
        b=bj8t2k2gifmjIuQtUgC0rkKwDGALZIO/c1LOsjREne8AprOSb6mQamKKzmepasAuZY
         Vz5An8CE3hkCRE3vt/FQ1qBDlCZfAnUNPh9fBUq/yerG9S7pG9OnSgXoJFzk3uu0dSjA
         dKL2KkF0yOMn/5gXKHffCRWqMwHIHparh4wnr2XCtr5WflPVG60r5clCgp+Aag7dwcnN
         pFjqgyRzQ2wMQ3rHVG9NHNFe9rerbqnzLcsjfuWiiK2zX6zGbII+3JPcWq3g6t1sGyNZ
         9X/kr/8JyVR6YGZ6OrMOQ1LyE8+SU3W0nKxYgWUc1qgsMdtmdn0Jr1vr+LmaPkOHTDmq
         yDMg==
X-Forwarded-Encrypted: i=1; AJvYcCXFcWcCmIaV+KRLja1OJCwy8d6diiRJn4ble2dqerizpBgea3x1pXo+I0JhakOyUbWPlbPK6x1/4B/sxas=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaZvJjdjQWILi8Vqkqsy8cJWazmp7oTDRTHqJ8CsFX2TstEbMT
	5q9Mt4jQVV9t46jXTqmyJga8EClAEa1s6x/RpTGylatAeDREPbg5nYxm6IEA7Zg=
X-Gm-Gg: ASbGncthH8f8GS8Stp4KUaPgrIn1Cvd8lQixBeMoXs07nfASYgEznJp9HUhQ+XVu4hP
	BysVVFFMhHq7JOgb99j+AtCLk4t+5KcUkU0mfvKQbHZVKTrXiz5mj7EaecUaemIv6S5EucEsO54
	98NcpK+588iIETUJ3X1rUXT9BEtOFbbQGPncWKRPJGyHoBHtevddlI9uqLmEfVjPErV2oGq+7cI
	sei4i6OEQttGBNEMzXmhyIw1BgtWxIsxVBwC+IxbJCN5fOhNbIiu63HRPyjYrPbsfk/f7mcqq/7
	RiZguw/joTwEFiknBsEIavJgcON2EV30QIlTt6ET9O7/hJJTkRjcVcMhEHby5eKO+zWs3q7ip18
	Tp9v8iYQ4009ySSI24cDzqK+1kUCZKmn87+ZEw0uOjpLvNcXIIQ==
X-Google-Smtp-Source: AGHT+IGMhurb9PArmXo9wi/bzeveBgpvfyiPoLnFXyt7C3rq/dYKOcqicf2Ep0ffCf8DbUss6X3Ofg==
X-Received: by 2002:a05:600c:a409:b0:43c:e7a7:aea0 with SMTP id 5b1f17b1804b1-442d780033fmr15039445e9.26.1746791838633;
        Fri, 09 May 2025 04:57:18 -0700 (PDT)
Received: from green.cable.virginm.net (nail-04-b2-v4wan-166353-cust693.vm26.cable.virginm.net. [82.35.130.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67ed1bcsm27032945e9.18.2025.05.09.04.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:57:18 -0700 (PDT)
From: Terry Tritton <terry.tritton@linaro.org>
To: Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Terry Tritton <terry.tritton@linaro.org>
Subject: [PATCH] selftests/seccomp: fix negative_ENOSYS tracer tests on arm32
Date: Fri,  9 May 2025 12:56:22 +0100
Message-Id: <20250509115622.64775-1-terry.tritton@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TRACE_syscall.ptrace.negative_ENOSYS and TRACE_syscall.seccomp.negative_ENOSYS
on arm32 are being reported as failures instead of skipping.

The teardown_trace_fixture function sets the test to KSFT_FAIL in case of a
non 0 return value from the tracer process.
Due to _metadata now being shared between the forked processes the tracer is
returning the KSFT_SKIP value set by the tracee which is non 0.

Remove the setting of the _metadata.exit_code in teardown_trace_fixture.

Fixes: 24cf65a62266 ("selftests/harness: Share _metadata between forked processes")
Signed-off-by: Terry Tritton <terry.tritton@linaro.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index b2f76a52215a..c43a6f8f8cd5 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1629,14 +1629,8 @@ void teardown_trace_fixture(struct __test_metadata *_metadata,
 {
 	if (tracer) {
 		int status;
-		/*
-		 * Extract the exit code from the other process and
-		 * adopt it for ourselves in case its asserts failed.
-		 */
 		ASSERT_EQ(0, kill(tracer, SIGUSR1));
 		ASSERT_EQ(tracer, waitpid(tracer, &status, 0));
-		if (WEXITSTATUS(status))
-			_metadata->exit_code = KSFT_FAIL;
 	}
 }
 
-- 
2.39.5

