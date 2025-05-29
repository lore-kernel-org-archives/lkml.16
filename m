Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A17257AEE
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748562459; cv=none; b=Une1vlfuSIjNvCsyyLHX76mAnxEmsnGWfr6s6A7R4mGOU/9gyZS0Rs/FMaM8cC7Mxy89mte2jTpXK9RCGP6LVkUk2l4jgmq8Rh2RJtJrxU2TmaLg18PbHcTffy8R2c4GHPBY0y0wycjNCZymPpoUEZhFD0bOmh2+11Mmrfqh/Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748562459; c=relaxed/simple;
	bh=KFzR2R0oE+f8Zx4hoiyK9LWJS5zkAw4p1aYmlL54wbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cg3o8aLAo/TPLZAGofq9UMPgRG0fXGWwgekhiVm6cnZVaNpMLjM9dpqt58Ivbc1+AJKaOcsp7H4bcq+XpA5b8t2B0WJ9cWpYSVb46SHykat3eR9iwugSy+4hG9NboCjY9uw3BdUTtLQHg7b5wb0zsl12bpHBlYgoSU3E1sGGdJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=HVM4EM5o; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="HVM4EM5o"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-23508d30142so14457245ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1748562456; x=1749167256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZpDwixmcLhBwd2X2YXKWEWGwjdFqClV/mbfesZkbLZ4=;
        b=HVM4EM5o3m5NnyEnDtFVv851YsRsOYFOfvZ5S1meTMdIU7rIo79NCE6BVgQbbJqLw3
         PIVBnT2YWC8n/NNFeclz3BHE/1/apz4YPqNxoAsg59bmNnoWMAnJdiuMwsretwYUcKHU
         fffqBc4ghupzcLgrSnVVUAhzC3XvvZ7fJkZuD8R/OHn5unKdzJvMy6X5QZhhzcUFyPrY
         2dy6o8JtHfaA5SrkN4fSMkpGbhwb7HfotO9us3pei2LYmngGYe4hRGvc3EttEkLEBIeH
         +t+m0wCV4CrvC62wKOnlhZiXOPWYXG/VW579qtgzAgNuF0QbBDJUELhIvhwZ+YkPaTcU
         nCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562456; x=1749167256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZpDwixmcLhBwd2X2YXKWEWGwjdFqClV/mbfesZkbLZ4=;
        b=ParwtbMtqZmrwg8ZBXvQlwf2hhGpIfKcVLS8rlGpJqz+DP+fl+i1zF7nJesLUMCldB
         jAnGl2sEuFjfo+3YCSDuPQdWak0DEhgPs5ggxH+ikU0Xlbyzru4PJ5Rmv0fpqkJPqlN4
         ErVKG1opqoCO5D9NDAdYVeF87ziMG7jBeZdSMikWnSO7+MrLy/nvTK1BUY11E3MqOSKl
         0wa0msEFx0aO07W9XnOBdKVv/5VPajgVXk5G/ZZcd2tNK2xO9E5LBDydWUTC/gQmAUw4
         nGqS//NCHFV9oa+rAKEsXL7ty+uoCKaxl60qhGHbtCfrG8HuUAPWKawW6ngR0+qKx7GE
         sGXA==
X-Forwarded-Encrypted: i=1; AJvYcCVN3EJQ39kfqBzqtAYqv8S3GNauAN2zcAZwhZ8Jqn/QjQL0kXOzm3BSxVao3ISp5d/KzNYpajDM+EoEcpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjQSWWrYdvDzlUu6dSq4nRvLtCPLjQzTUYqCMH/u2cnHKmo2kN
	cZDTNapPr5RJ610VwvFLI7AmUqV8PQ7vyKJJSlwkgOQqW/mIhWb7w3GoAoLEZPMuXlYD3he0MuE
	9POwKS8g+XyZNlVUH0PqSWLhJP9e356cT+SSOrCbzvNQwqZp4C0BL
X-Gm-Gg: ASbGncsGP2wDeyqX5Sbq/awfGhUbP1Ohk2RrGN/sqzQVe+6B5x4ci60vJJ+gCKCz15r
	+qKc3ArL47P3mmmxuXdK3FudUo9k83Nvhgt7y7mipw2Mk05Lx3Ylc0kFgRivyDlypk8IwpLqFzY
	vYe/gtUCyTUFcKHI5mzUaAR3ImX9vCJzrORyybtjnkVV9wxmzRliB+W1vLD1kz0MuSKYCQug6Od
	4ud8xuhP68cbwLgMu4dVY+1iTwBKL4bmNTkLYgIAbgJyAWUfbw1Lf21IZz/z39Ysw7jvkVKfrkv
	5vEftEiuBsr+oFQXOtwRSMk6hZutYmS9pWYhIkrIUw==
X-Google-Smtp-Source: AGHT+IF+JXhCtFUI7qIQoWLQaSp7IslKBmx1r2vGs1hjp44ssVnCEbbybY4kaM+WQWqB2rfGGO71/R3O8mVk
X-Received: by 2002:a17:902:f652:b0:234:f580:9ed with SMTP id d9443c01a7336-235390e41b7mr1149165ad.21.1748562455933;
        Thu, 29 May 2025 16:47:35 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-23506d37f6csm1336845ad.83.2025.05.29.16.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 16:47:35 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 223603404BD;
	Thu, 29 May 2025 17:47:35 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id D603DE4133B; Thu, 29 May 2025 17:47:34 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Thu, 29 May 2025 17:47:17 -0600
Subject: [PATCH v8 8/9] selftests: ublk: add stress test for per io daemons
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-ublk_task_per_io-v8-8-e9d3b119336a@purestorage.com>
References: <20250529-ublk_task_per_io-v8-0-e9d3b119336a@purestorage.com>
In-Reply-To: <20250529-ublk_task_per_io-v8-0-e9d3b119336a@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
 Caleb Sander Mateos <csander@purestorage.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

Add a new test_stress_06 for the per io daemons feature. This is just a
copy of test_stress_01 with the per_io_tasks flag added, with varying
amounts of nthreads. This test is able to reproduce a panic which was
caught manually during development [1]; in the current version of this
patch set, it passes.

Note that this commit also makes all stress tests using the
run_io_and_remove helper more stressful by additionally exercising the
batch submit (queue_rqs) path.

[1] https://lore.kernel.org/linux-block/aDgwGoGCEpwd1mFY@fedora/

Suggested-by: Ming Lei <ming.lei@redhat.com>
Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
 tools/testing/selftests/ublk/Makefile          |  1 +
 tools/testing/selftests/ublk/test_common.sh    |  5 ++++
 tools/testing/selftests/ublk/test_stress_06.sh | 36 ++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/tools/testing/selftests/ublk/Makefile b/tools/testing/selftests/ublk/Makefile
index 5d7f4ecfb81612f919a89eb442f948d6bfafe225..1fb1a95d452c2e9a7ed78cb8b12be2b759074e11 100644
--- a/tools/testing/selftests/ublk/Makefile
+++ b/tools/testing/selftests/ublk/Makefile
@@ -38,6 +38,7 @@ TEST_PROGS += test_stress_02.sh
 TEST_PROGS += test_stress_03.sh
 TEST_PROGS += test_stress_04.sh
 TEST_PROGS += test_stress_05.sh
+TEST_PROGS += test_stress_06.sh
 
 TEST_GEN_PROGS_EXTENDED = kublk
 
diff --git a/tools/testing/selftests/ublk/test_common.sh b/tools/testing/selftests/ublk/test_common.sh
index 0145569ee7e9a45b41898c2c789842b4c8380f18..8a4dbd09feb0a885ec7539f1a285ed6f437fe3ab 100755
--- a/tools/testing/selftests/ublk/test_common.sh
+++ b/tools/testing/selftests/ublk/test_common.sh
@@ -278,6 +278,11 @@ __run_io_and_remove()
 	fio --name=job1 --filename=/dev/ublkb"${dev_id}" --ioengine=libaio \
 		--rw=randrw --norandommap --iodepth=256 --size="${size}" --numjobs="$(nproc)" \
 		--runtime=20 --time_based > /dev/null 2>&1 &
+	fio --name=batchjob --filename=/dev/ublkb"${dev_id}" --ioengine=io_uring \
+		--rw=randrw --norandommap --iodepth=256 --size="${size}" \
+		--numjobs="$(nproc)" --runtime=20 --time_based \
+		--iodepth_batch_submit=32 --iodepth_batch_complete_min=32 \
+		--force_async=7 > /dev/null 2>&1 &
 	sleep 2
 	if [ "${kill_server}" = "yes" ]; then
 		local state
diff --git a/tools/testing/selftests/ublk/test_stress_06.sh b/tools/testing/selftests/ublk/test_stress_06.sh
new file mode 100755
index 0000000000000000000000000000000000000000..3aee8521032e3962b8b070cda8eb295b01e7b124
--- /dev/null
+++ b/tools/testing/selftests/ublk/test_stress_06.sh
@@ -0,0 +1,36 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+. "$(cd "$(dirname "$0")" && pwd)"/test_common.sh
+TID="stress_06"
+ERR_CODE=0
+
+ublk_io_and_remove()
+{
+	run_io_and_remove "$@"
+	ERR_CODE=$?
+	if [ ${ERR_CODE} -ne 0 ]; then
+		echo "$TID failure: $*"
+		_show_result $TID $ERR_CODE
+	fi
+}
+
+if ! _have_program fio; then
+	exit "$UBLK_SKIP_CODE"
+fi
+
+_prep_test "stress" "run IO and remove device with per_io_tasks"
+
+_create_backfile 0 256M
+_create_backfile 1 128M
+_create_backfile 2 128M
+
+ublk_io_and_remove 8G -t null -q 4 --nthreads 5 --per_io_tasks &
+ublk_io_and_remove 256M -t loop -q 4 --nthreads 3 --per_io_tasks \
+        "${UBLK_BACKFILES[0]}" &
+ublk_io_and_remove 256M -t stripe -q 4 --nthreads 4 --per_io_tasks \
+        "${UBLK_BACKFILES[1]}" "${UBLK_BACKFILES[2]}" &
+wait
+
+_cleanup_test "stress"
+_show_result $TID $ERR_CODE

-- 
2.34.1

