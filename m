Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19E51DDA1B
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747985595; cv=none; b=uwqG4b0clWD7mn1jk8aIjwoinow+V2aVoVhedd5TDms8unJffWbzzf0cmFHBXBBUVfsYzbMXBdTNuhougASDhETznSHhmDIYGdDnSuDdifXwYLa10XaiZkZOYBiQ9XBA6bgSgvwdSWhaAokbZ+ICXS+GQDteHy99s5FD2GfpQWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747985595; c=relaxed/simple;
	bh=qAY6EeFJTZG28TvoJgL9U5bXPgvj6ZZgzASuq00yAbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fUMaJvrjx/dI3GNSQYc4TmLrXacqNMlLnIFSihITQxq8paZfqBupAnqFraz+cP7i2cQr9IUeNo3EFmqkYPtEW3Ux8/tMANbYHflH2mkSduHZGMIPYtclnVbg93kWpV9CgxV7U36FjNoMxUtGX4GHf4igseFueZ+0K3i1FcU9lLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=RLZ0F8Em reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="RLZ0F8Em"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3dc82baf4eeso11853985ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747985593; x=1748590393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EhDC8DXcjYenT+PN1rPVu6Md6wucoYZjvtH8KVhEPDM=;
        b=RLZ0F8EmpKF9ZzJeaC0it7Lgr9JFnBgyRUh3XBbY5SWav0fK/mcPKZVRJyuy/fEuqo
         id7wkfSegzL5hQkdSAL9gvqZAHL0MVBdz08QY+na1Nc/QbyLg1ASGIgezM+0wd0AE7Bd
         wrLm/JoOOsriYl88em+4IgWn/9ZsLwhHSrWXj77vXnzAwb7lhK0HR2kOZ9TCxSz3Vdic
         ueWEx5AU0IfYtr3azoT4NJWa2bO4C1G+1ixGlEyTBSUSdA7ZSt/1yR9+emIVq42hdbb4
         AwDslKoZz6tMEHWVR0Vwg+J8vbjg/CQnVRg/LO5vHuso2+GHOyXmahqjQMJh6UqoCwJY
         RKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747985593; x=1748590393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EhDC8DXcjYenT+PN1rPVu6Md6wucoYZjvtH8KVhEPDM=;
        b=ATQVKhKAW/xdtTQbkvqXb9NZcDsDmFESNyaeGNJ7H4z0TlQjk3WCm6vU61CcSNLoTX
         pUSWxFkTY4xNO4Ia8BGuDTn6idntLp7LFSwwkns+8rYsfbie6IA/VdgcWckm4q0KiBI4
         fkMQ5AgE3ebPlrkzCLTV8ziUcJpRugMlC2QQFqzfQxYeyNd61hX3vh/wYfYwpMXphj8R
         LewLE5r3H4G0oczsPGmfjk8iKbtR7WbWIMuXP8yualMgXn/+BV9zLpuNZnaI17OKuB/W
         blk2iVpZGjAX8Jdt0WVeSOqGFNoXPODfh8E/wdT7Yc9/Iz6VOXv7rcD2LXkeUHkse2kH
         Wx/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWw8YLRHYqQp+rOt0vV7q/ykcBYm/0P9YzEkGyXgwq+QHi+qeBxMemObw6fp60FSIE6PNNwBoN2A9DQZY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwitM/IP7n5mZG4ylBiUIiR7QzBKuZ5xo2F4OOBZSAo+lKhsfoT
	tIcfxor8+/GiLmD+8xFB6ZyQcf8COazx5+IVQ4CYlfEOlhgwd75Vwv9D6lEpoaDg93Q=
X-Gm-Gg: ASbGnctS/631yht/JqpHHFdi19sdlDtTP2DVDBb0cTSUu7Wkocgj0rgwYh/dK47Mj64
	lcRcn9R38978oXuon/+ddmxuinKBNCMyJTM/Yo7x2WfoKuQJdmoRrYb7jsQlLSMDNTMKqOz0j4G
	QYv0aIOEKn2a2n/cqsoTnpoJGgsQfG14Al5JCWIhunipYgE9jd2vRZVS6TiNJsxKKV/+5vXkX+6
	pdNAeV6H2hV9A0DR8V0JU7uuwU6ZP9Z+hIPal98N9Pac+neTqKBCIzcA5GoFxfny7NbDeLq2NAM
	NUSR27iPt1LcfkdcoK3rBHcvmwaIUr+JRUJY7QrVIHe8uS8G7YyGK2tz48asdtfo7eOrq98pk2R
	2TehbzaA=
X-Google-Smtp-Source: AGHT+IG79dWbaOnWh6fbDdUHStp0frh1mqNr2bxuilmex7AQRbHU72XCruvtgyU30RqIruk4/I1vVA==
X-Received: by 2002:a05:6e02:3b05:b0:3dc:7a9a:4529 with SMTP id e9e14a558f8ab-3dc7a9a4999mr104600585ab.16.1747985592940;
        Fri, 23 May 2025 00:33:12 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc3ae5b9sm3460807173.32.2025.05.23.00.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 00:33:12 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v2] kselftest: x86: Improve MOV SS test result message
Date: Fri, 23 May 2025 01:32:21 -0600
Message-ID: <20250523073220.112238-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apparently, this test completes successfully when it completes execution
without either causing a kernel panic or being killed by the kernel.
This new test result message is more descriptive and grammatically
correct.

There are no changes in v2. I'm resending this patch because I addressed
it to the wrong email for Shuah.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 tools/testing/selftests/x86/mov_ss_trap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/x86/mov_ss_trap.c b/tools/testing/selftests/x86/mov_ss_trap.c
index f22cb6b382f9..d80033c0d7eb 100644
--- a/tools/testing/selftests/x86/mov_ss_trap.c
+++ b/tools/testing/selftests/x86/mov_ss_trap.c
@@ -269,6 +269,6 @@ int main()
 			);
 	}
 
-	printf("[OK]\tI aten't dead\n");
+	printf("[OK]\tkernel handled MOV SS without crashing test\n");
 	return 0;
 }
-- 
2.49.0

