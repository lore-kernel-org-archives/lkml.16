Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A71E2E2675
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167441; cv=none; b=e/zXOBspJVLxH6se2Pr9B0iYOcfvlNfBaJ6jYeaqZjMfkhmBFo7oyuKMAa/9mV8KvHipL0/PQs7reYsIg0aW8pqnU0MRgGyqX98zqcZhj+Ne8pkjMNudtMDoKtSZxbzBibtY5WekZUjhGMsItdPoUDUWXApekP3vmZZ7GTsQ/vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167441; c=relaxed/simple;
	bh=xtt2rNThOOd0Ch0ay5t/SRPt0e7QyIQa+1AuoLWf+2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RqRHMWQVAEvNfHx+GBMxc9oVoAqPGsMXB2uKBVDV92YLffwEDidh4GrwTxpqL3NU7UAVzQRhhk+a3vW8tg68akKGFL9sDHbi/Nu5/F78nmixclhb0fO/ZnpMFc9BhTKl8kruo4g569pJQEAoAWY/Jd30X89BtW0eSzD7rOrS+KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZcK8urI6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZcK8urI6"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-453426170b6so17706305e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750167438; x=1750772238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/IirAviWa54+DB/4fGXki7ILuYvAogeRyMVXvAl7uRo=;
        b=ZcK8urI6w0HZat+W0ETrhst7YwkcpUv2RNrOMD4e51q9NcdtuCa8LB1WZylPwpgd2B
         bSpseIJDU1r2cJ2GlZ0j4MjwBa7n6sDdDoKxrAu7Tq4dC+0vYIAFLrkeznw/hQXHPrTh
         KBtGAwMekGhwBmCPEKW4sZ1W7hN7/D/4ZmndrmXvsfnhOLhOAr5YcRAtMOUzooPLAifJ
         TD6gI1ImQ381LaXyPLL87o04QrQWuTiRKqvQctth9IJB+zM/LNUlYScY/xolpjhGWJEZ
         BB5iaONU6ouovoVBnR0PGzVU7u+ADE2Hj7uQ3GzgmVskyDdD+EXzqnfkt8xkwPpxpjIV
         mgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167438; x=1750772238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/IirAviWa54+DB/4fGXki7ILuYvAogeRyMVXvAl7uRo=;
        b=g5sM+DurCTTylQQ0oVSWOMHd203PWiGimFCs7h5U/n3ZSBHCwQ8nIvj08T9JejrYmy
         KVMedfHGg5S/AZ1UpdQMJ2B1kIDtQaVv+CbwIFtduVwNEg97y01F1UBLa9VBS3NzGq5W
         WXbHkEpxquLAW9qYY2ib3QvugcA3A+y4udx0JoKT6aWtp3KK+y9snq9733jjk0uzc7CR
         WPpOVBh8bit4cJDESFaHdVNH4s78xAH5Z7aW3hh7ESG/zNh7KcLyuIcoJ9ROlnp+2GBj
         aumwlI2ftcKXxKSBeCTsSOxZ3aykV+FTswWg0NXDrJ9D+5zPIyP5w8C+65qPc+ezgyC7
         5w6g==
X-Forwarded-Encrypted: i=1; AJvYcCUgm/Gd1NTq2IxV/SsZ7B0GOP8zIA4gAOdeAF5/plzXkKTWXmMAIfJ6xRCUK8XghA1Xv6XilmEkzQ9AFYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxImz1cLxlaCmt+iSO+zBpaYlzzt6SU+jit8R8oq8EqYrXL5scD
	qvxyOWiamDGXNhCNGClrIqFS6Hr++ikS5abN3jKN3+u+Aiw9FSe6LdRF8D8z628gTj0=
X-Gm-Gg: ASbGncuOPpDcOCFkJ9j7thpqnVh22stKcAkoic5oSIxsMbkXC40HwT3Bkhl0Q1hGSY/
	oVj5/Wt6jWHgvQNxCLmLyESSqJ8IRqFkD3dZ68EDCxU0u4mKg3e9hLk6Tu3mpduTJ3no/d5Z4qS
	6rWa9kBytwEv4SYwftCVjExQ3MGSM1tLnsmDNiQ2x0s4q+Med+qexavXooxCtQINh0DWlT2THeA
	xaAHXQbvZkY3vgMHbKVhIWm0Qli/cOVRNTxSFo/ddwKzyS6cXhMPBO//6GekoRDlUkxRZem03rC
	qyzN3xX7FytVn2+2WU2/DQsuDYYXKWuXk1bT+W54SZCjy7+lpgNIsTnVgyUTv9cTt2twxS750c0
	=
X-Google-Smtp-Source: AGHT+IGrwE0n8xObbXy+xwulox5ORPMmG9dF8KEQ/VAwCkDtHw6tIijP1d7NSitWFCIxbglfxPVesg==
X-Received: by 2002:a05:600c:5908:b0:453:827:d0b1 with SMTP id 5b1f17b1804b1-4533b235e16mr90149065e9.2.1750167437646;
        Tue, 17 Jun 2025 06:37:17 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224888sm179494365e9.1.2025.06.17.06.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:37:17 -0700 (PDT)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Shuah Khan <shuah@kernel.org>
Subject: [PATCH 4/4] selftests: cgroup: Fix compilation on pre-cgroupns kernels
Date: Tue, 17 Jun 2025 15:36:56 +0200
Message-ID: <20250617133701.400095-5-mkoutny@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617133701.400095-1-mkoutny@suse.com>
References: <20250617133701.400095-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The test would be skipped because of nsdelegate, so the defined value is
not used (0 is always acceptable).

Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 tools/testing/selftests/cgroup/test_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_core.c b/tools/testing/selftests/cgroup/test_core.c
index 452c2abf9794e..a360e2eb2eefd 100644
--- a/tools/testing/selftests/cgroup/test_core.c
+++ b/tools/testing/selftests/cgroup/test_core.c
@@ -21,6 +21,9 @@
 #include "cgroup_util.h"
 
 static bool nsdelegate;
+#ifndef CLONE_NEWCGROUP
+#define CLONE_NEWCGROUP 0
+#endif
 
 static int touch_anon(char *buf, size_t size)
 {
-- 
2.49.0

