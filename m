Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7BB248878
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 09:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745745784; cv=none; b=D3fdORD0i0kpXtCNNmemXlfA5gTTZqO6lRV1guiyuP6/jJdG1/vhpuytHxV81tUk4GdcshVtpbOhKGRsEAZUMxZeqQpDkv/IUqG5R7su0a8vuH+1E+idXxCFlpOcF9v1TFWlsNB9fxpDtUyGytAX7mlSQ4S4c03asn4hE1KcqtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745745784; c=relaxed/simple;
	bh=WZ/aViUI4SyDQrmZUo2zgeycetmsihbA8iFnIGRSmJM=;
	h=Date:Mime-Version:Message-ID:Subject:From:Cc:Content-Type; b=Ne6EqeP1eHQaqWat7R3ZEL6VkQFxNdjonYJE9TYdjfe++QB+x8sTRIy1ea/Li6px4+eaC+iaSkvr/ofp6F4BPM2TP4wyFhRKrVSt2jilYzHlr8YZsMA6PgGOh6cJOL30AdLjwV3TIga51JpFds0OOR6Cw82uQWK2kfbd7UTXm6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gM16h1RP; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gM16h1RP"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-73dcce02a5cso2089831b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 02:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745745782; x=1746350582; darn=vger.kernel.org;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PvB0WFJ8LpaALOYW8Xx/CWM6owL785SHgzuXle7StY8=;
        b=gM16h1RP3bFG/l55L4AsvWk9oPA86Z+GT0D0wXwiB+szdPDF0poQFNwDy+RO6w5bNF
         OhTSfDgl0xwbTK2HIuNZFloAB/YmmFvaFuFm4fciIL1VF5dAMzxArfe5+DYTrUNo7u96
         rsEbfEQ9s6+5T12/4yw9HKKP/QVJWSzMN+IrYY0OBvXCiTCq6vjOXimVstbxJYvqNeuT
         jn4cYgZAoL1qdqYtYBU8lPs+XQAqZ2hAuflSaVjD3+Hbjhh0KX7Ek5q/M8W1ak37ZTWZ
         tGjoIyOmkvv3xw4hoefLmuS0Ir+Z060aICrUaj/JNpLD+bZl2roECnWuCaz9vl+Krq4i
         sKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745745782; x=1746350582;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PvB0WFJ8LpaALOYW8Xx/CWM6owL785SHgzuXle7StY8=;
        b=u18za/Wb6lUpATU3OPptz7f9LetpBzZWmRK8i8Ga64l8s3Z4CwrZtdFF8FUuWcNAB9
         m/V6rojE9Z+eAPjJJqNuFiHIAu7vFYSjxpM5Y5TenGGLpQpZg4vW+I0DzC9Yu+fqs/g+
         4/snbZku2sXelhy4EUbyv5RmxVL86Vqh7u59qFwMI6RzbCVV7TtrQRNEdZPFKKSa+rsH
         ZH7c8slQoCMJ88exQQNlzaN7uAfEzxJ9AcyinR+JXOjaJvCRvqA3+3yJQYoVbNeKbyqp
         eBW3sVTW+rnG5Lujm2FlGXFeuSIGSuhY4ypBwNGbf6Kg+JKgXB0kNAEm23dx8twfcLqX
         qrLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcZubZyG98i7thfX00SHE9roW3VLo0tpxBrvcnelXWb3zTYnysYmBMCl2UJL0Gg2oSn5th8qhmYV62Lc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YytZ0bVTkj6MgaEirEag6TPlGd9c/3wRjtdDg/U+y2BwyPNEh+O
	alLnYg/yyQ/Wp5Azo7cwkRlX4Bm1/zfjuFON819NXgXKMrmNcBoEFAfy0jI55QvBR9A5z8DdjNg
	jrXdojA==
X-Google-Smtp-Source: AGHT+IEC4fmk5RMrs7/B+YYVWJOa7hQpxIGr9ZZpihwteVlFumQgJhCsLJ6cnOjAFz222TCymBv/P8REh+hL
X-Received: from pfbkr16.prod.google.com ([2002:a05:6a00:4b50:b0:73e:780:270e])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1490:b0:736:5dc6:a14b
 with SMTP id d2e1a72fcca58-73ff72ce6c3mr6571771b3a.13.1745745782292; Sun, 27
 Apr 2025 02:23:02 -0700 (PDT)
Date: Sun, 27 Apr 2025 09:21:19 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <20250427092134.3482407-1-nkapron@google.com>
Subject: [PATCH] selftests/seccomp: fix syscall_restart test for arm compat
From: FirstName LastName <nkapron@google.com>
Cc: nkapron@google.com, Kees Cook <kees@kernel.org>, 
	Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Neill Kapron <nkapron@google.com>

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

