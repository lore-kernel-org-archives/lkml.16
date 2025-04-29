Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970592777E4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745966473; cv=none; b=PAxJMSwX+uswN6ioQpstp0nB2wzhSEaETsSfLGRX8V1bBqjIAySN3H65+ZjgTGaknfbwKFo5HsStQXSEV+S+2OZLlNzNA6DJU2fcuf3Fek4Zyl8bl9Qk13b2A25b4HzAY/CbuRGJVHY4KkYGcDJ/dZw6USK6j6lRMKOV7zh1mDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745966473; c=relaxed/simple;
	bh=yLjCvoCe6VXMT5MsUjHgKpFFAFBbBtQRcr91r8jHk+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QvrRdKhINQX+6Xwiix7gZ5qKgzs7rYMo3Sch+kJXcVcB+uvupr+vUOhGqtB6yvTZoDwmnheeliSYkTh5yvVwEMyhNo2qherlAqy+KOMlwHG/IoRBgomyoW33w6gATauMTDP0MPSsDSnQMapdeMUcEeUsEYIAtwNBhQ9pwclQn4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=LwqKwcsW; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="LwqKwcsW"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2241053582dso99247165ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745966470; x=1746571270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FFNtS618ufyKJDtfH/r/PyGi4nE5aM2nCuyHf6tRb3Y=;
        b=LwqKwcsWiHCt0Ma4fVElW3asrerOszOKpN0s0hzAvtiMJPqCAoFGGvNNRgXDX9Cf7S
         ZYYWkvnueOR5YH6AXoBwp0ywutmIfIL3iSN8+Teu8N6RDD3EWiY3Ct8gx7dVdnZEMVZp
         Wf6c1/JNeztMCGffl7q1cMvUUBiLKdMGDg2aJdDNpqlYr/67Xsi0VqjgqIHeWotNTtgp
         dj5oVroce5AkxbB4/g0K13X/nGEXXOANwqaGmtE2vylF3hHmcWvBK0NlKV+kX61Nq66m
         b5dMFMF8yeUIP5we4+t9qiZA/D1ApZ/o/DQD564ytiq/CECJq+z9Nx4m7LeFo5bVfUZI
         EjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745966470; x=1746571270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFNtS618ufyKJDtfH/r/PyGi4nE5aM2nCuyHf6tRb3Y=;
        b=NUN7L6VNVRcjgo7is/fv+1iqBgpt6xtOua9/saA/lj82pyhe9xRvx0BajLZtKwJo5G
         wdIB7ctGBEbXyDYox1bkpv5Df6v+l/eNTYkR0qBZ7ZlS2HaXVHiQUj7bPZxwvholwRVc
         s32FqsWNDoDHbMUJwsNO9+J5KMO3p+QI7mtXpEUOSnJklYef+sC/O+IdQqixiQiow/Rz
         nfhHGzKikJM8MRyM2PesshDKOf9tcnuse2k+W2cynqCMxqHTdmKVkXfz2vpjEbNpaH3C
         NvA4Wryfj93T3PrxgOJIN8tqMp4SGHGQoiCB61VcNnnOUwmIofACKJdJUA1S1GcY+Cfq
         bpHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrlpS1YnIuvhyw/XZ9icdPkLgmrfIbJ1fuNzdBYaTrJL4hAKgEYYWIPoQ/65LI8RpuIwfqv3RQjo2y03w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx05RrkTV0V3W/oKl3tCU068aq5WjhFHW9hkKh0ggthuWOB0GGA
	QymDqaZt1fQnW8btOLVOQTujoTc0NaxC80Ier0NjeRdzEezu2xEPmK+NIATzyVtMi7hYTVmbU2u
	uq2Y5xyXK5bW+YX9bxv6aLy+V8K9cU0F6AO1WRUpK8Rs9LZ1/
X-Gm-Gg: ASbGncv5vbG6spn6hhm+1NnmwYuygCsBn+3NL0ub5cV4NjITPLa6lESghnSjp+uyXog
	SQIPHMDXcyvCE3Ppyw4u+j7a6XW9bKAbQKTpXRr7WuE0yWMrqmrDfLTYDlTcPj6C8gcj1ZvD4BE
	1jXikCXRBg2wCC1ME7y/yv0jG64/ZecTD6z14oBPH7qOhTj2TK9+drL8b67mZS7/SmkKtlCAeRm
	rwtn8pFpqr3PgBS34+R7m/DkzPRCsWfkFLCB6npGkxxenHxf7fnatKTfKOMQRw961cddhdlbsT3
	vMr2oLbebU14McMbMyd1SeMMr0tn+u4=
X-Google-Smtp-Source: AGHT+IGBZ7D6TEnAUN4d7huIcnUzTzs2CYiqo4tm38ieihvVaysSOYFpmF+9wSpzUkmmpxVwAfixH06NtvV6
X-Received: by 2002:a17:903:3c66:b0:21f:1202:f2f5 with SMTP id d9443c01a7336-22df57638e7mr2895685ad.8.1745966469787;
        Tue, 29 Apr 2025 15:41:09 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-b15f7ec226dsm809653a12.1.2025.04.29.15.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 15:41:09 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 0055634034F;
	Tue, 29 Apr 2025 16:41:08 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id E501DE40EC9; Tue, 29 Apr 2025 16:41:08 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Tue, 29 Apr 2025 16:41:04 -0600
Subject: [PATCH v2 2/3] selftests: ublk: make test_generic_06 silent on
 success
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-ublk_selftests-v2-2-e970b6d9e4f4@purestorage.com>
References: <20250429-ublk_selftests-v2-0-e970b6d9e4f4@purestorage.com>
In-Reply-To: <20250429-ublk_selftests-v2-0-e970b6d9e4f4@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

Convention dictates that tests should not log anything on success. Make
test_generic_06 follow this convention.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
Reviewed-by: Ming Lei <ming.lei@redhat.com>
---
 tools/testing/selftests/ublk/test_generic_06.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ublk/test_generic_06.sh b/tools/testing/selftests/ublk/test_generic_06.sh
index b67230c42c847c71b0bbe82ad9de1a737ea3cb75..fd42062b7b76b0b3dfae95a39aba6ae28facc185 100755
--- a/tools/testing/selftests/ublk/test_generic_06.sh
+++ b/tools/testing/selftests/ublk/test_generic_06.sh
@@ -17,7 +17,7 @@ STARTTIME=${SECONDS}
 dd if=/dev/urandom of=/dev/ublkb${dev_id} oflag=direct bs=4k count=1 status=none > /dev/null 2>&1 &
 dd_pid=$!
 
-__ublk_kill_daemon ${dev_id} "DEAD"
+__ublk_kill_daemon ${dev_id} "DEAD" >/dev/null
 
 wait $dd_pid
 dd_exitcode=$?

-- 
2.34.1

