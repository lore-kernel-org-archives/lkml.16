Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B3124167D
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 09:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745746894; cv=none; b=A5fThm1UOOp7YhjdgO5HxJmgcec1xogOU/XMnw2x2eP72aTr5fsrdsWTgRdLzyMgCKj9DpBMPbnykHx+s1Yx5EAcpJ4bbpTEehU3h5uU+3EGTx8trZrdl5D2dqdyxXnby9UjGfQf6jert7pMJFYTLpV9XDLq4U8bMHTQbPInr2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745746894; c=relaxed/simple;
	bh=Mc4hvb9z5CZb7t4r+oQuV2pkKLHcxELRJOCzuGN9B3E=;
	h=Date:Mime-Version:Message-ID:Subject:From:Cc:Content-Type; b=T97TW2nWTHfDNJ8cwS2tkCF5vjM+tYlB63+G09Oo2GcPvOmQ+kdC9KTMyqjYKy2ggVeoxfqZY56veGEdqn74yOfEishDEB/h5UAJA/3wBbex4NPFEHqhnEShmhju0y0fGagXc0jANPJpuEdINsgCMFzo3mrAvcR7VqBxfT4uArs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kfr9RpCh; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kfr9RpCh"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b1c654f620dso510270a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 02:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745746890; x=1746351690; darn=vger.kernel.org;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T1QzW8ASYWJaLvx5FFC5RLETegsZ39C1u79HEntZtqU=;
        b=Kfr9RpChJyS8JGnhW6NdoVZl9OSN6mHz3jND6V2MdMbPnLYVQPd+V+O0PN0wmJXcDm
         KTJM50mTef01g5Gq1Vgf5NNyDNMmephsyZB9v//xmstl2qF3ObQ87deAyGDAKiCeb60P
         XOWzQTTXBGk1xxLf3Y5INxRcwFwapGXVyGmzO7pSz4eUj1dEM8BH+kfKs+/kNfSwz5Tg
         bUPIhmcZjzgbsCS4jMBu7YSRB9WJ0yo2JA/mkE42NMUAQiP2kkxM8qxJ0HLUU0ZnfNBY
         qbqMy1usruIEQh0zWY0wUpzmDBDNMmlMfs+H3gjRoYMLeonrmI9WQKuk+kaFPsLMcFPy
         1cVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745746890; x=1746351690;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T1QzW8ASYWJaLvx5FFC5RLETegsZ39C1u79HEntZtqU=;
        b=Z1dklqlTfiCrqgzzAfK6et+fft2toOvlkEfGBe6XCzwjAOsEf3SwJP1gM4JUfxO2/O
         QGYyDdG7nh5SuLx95/wCBmAKBxQ1EqW3qhhv+UJoyqBOCqyEkf7EjL3hEF7Y8almlc7f
         3yqeal7WvHpcNx6OGjJzFwuF6u/ygOcNKIKK4aulN4htKGGXwyezvA+C6gf6/Y9pEmgX
         Exu5yvEek/8CpoHfaKqfO0VKgWUdK8q0w1a+M4wir9khLGe2peGx4MIZzc47x0wmef/f
         56eEV5hkJ7gnpIIwO/PTTAHN2XyyN0jt8qxMxK4M8/IMJfD0nVRDVaS0P2HTslsO5r+9
         MXhg==
X-Forwarded-Encrypted: i=1; AJvYcCVktB1GfzQGQh24UNm1u7pl91wAD9s6TOoFM/zr8wOu9wSX3926B0xV5z521R+bPwf81rgSM8CCq4Yazk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC12Vk/bzv0qu41zmsqEX6NYwH0+hlx5souz6Woq2NIUm30cs7
	hX9+3Spf1+Sre3OF1sz70anR4BBpjzhnfQczJ0nafpO51CT4I3uQRRoPEp7wGToPW+pySv1bj4G
	zQHwhYQ==
X-Google-Smtp-Source: AGHT+IE+YOK4bUXyeUihTdfe88MG12kjU7NJjnEZ1UiwKcYDjmIUXUZlOWiD5yJB6YrhY981Gpkc3u2UM024
X-Received: from pgbcp4.prod.google.com ([2002:a05:6a02:4004:b0:b11:14a9:1d8c])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:998c:b0:1f5:8903:860f
 with SMTP id adf61e73a8af0-2045b6ebb88mr12037759637.14.1745746890050; Sun, 27
 Apr 2025 02:41:30 -0700 (PDT)
Date: Sun, 27 Apr 2025 09:40:58 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <20250427094103.3488304-2-nkapron@google.com>
Subject: [PATCH RESEND] selftests/seccomp: fix syscall_restart test for arm compat
From: Neill Kapron <nkapron@google.com>
Cc: nkapron@google.com, Kees Cook <kees@kernel.org>, 
	Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The inconsistencies in the systcall ABI between arm and arm-compat can
can cause a failure in the syscall_restart test due to the logic
attempting to work around the differences. The 'machine' field for an
ARM64 device running in compat mode can report 'armv8l' or 'armv8b'
which matches with the string 'arm' when only examining the first three
characters of the string.

This change adds additional validation to the workaround logic to make
sure we only take the arm path when running natively, not in arm-compat.

Fixes: 256d0afb11d6 ("selftests/seccomp: build and pass on arm64")
Signed-off-by: Neill Kapron <nkapron@google.com>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index b2f76a52215a..53bf6a9c801f 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -3166,12 +3166,15 @@ TEST(syscall_restart)
 	ret = get_syscall(_metadata, child_pid);
 #if defined(__arm__)
 	/*
-	 * FIXME:
 	 * - native ARM registers do NOT expose true syscall.
 	 * - compat ARM registers on ARM64 DO expose true syscall.
+	 * - values of utsbuf.machine include 'armv8l' or 'armb8b'
+	 *   for ARM64 running in compat mode.
 	 */
 	ASSERT_EQ(0, uname(&utsbuf));
-	if (strncmp(utsbuf.machine, "arm", 3) == 0) {
+	if ((strncmp(utsbuf.machine, "arm", 3) == 0) &&
+	    (strncmp(utsbuf.machine, "armv8l", 6) != 0) &&
+	    (strncmp(utsbuf.machine, "armv8b", 6) != 0)) {
 		EXPECT_EQ(__NR_nanosleep, ret);
 	} else
 #endif
-- 
2.49.0.850.g28803427d3-goog

