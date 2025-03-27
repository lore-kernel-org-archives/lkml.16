Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA9A7E9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091769; cv=none; b=OSe5xndQ1qa/PzLDcq1g5YPfekM5RyK8qTZHHX5lulOUEhS4bJ43lnSt4L/X/RT/kj4XdtAthDTgA54syZ+gVMGii7f6V6gDlHgkYcsytg1NIktOE04zaNXmF3+vTz6gXFRtG9PBBXhVt6U0S3ZLl+AJHJ8HAPy7h9UawUlngUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091769; c=relaxed/simple;
	bh=Iv1t8vhll1NnfJAVcvohsPup3KoMa8DNYAHImENq+hY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UAjwqB4129z0vaE8cJbr+H3EzzNiPG6hgOvBgceTHYyDdaPQGDMS4d5EzTMSL/V2fn18QaX2wox1JF2OYKEepP/TC0DdoSMJXM6wFBBCIfUaM6DXqGS7sowZ/NvYYBRFCTwfsShpJ3afHNCu/0InQvEhKtI5kyYKF5q/fU4ioBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=T1QWWaMg; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="T1QWWaMg"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85b4277d03fso42068439f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1743091767; x=1743696567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lc9tpoqy6nWDYPuOoCnxwnYnaP2wtDpP4dKKDjWcgOM=;
        b=T1QWWaMg861Yv9Jw3i3+lACFSA3Qz3b5nG8s0Ze5Fmc5zuzynrs/1ZIMVErAfvuE8R
         Y6ShHmLkiSJ8VitH1BSIWLgNI/f7ZBqTrjHC78/owDZ9iTAsWlh/3CMNKkDC77xdxR4S
         Ls11a8f3CuTCVJh2usKWn4hV2b62nuKKxhu6C6aMAOgYGe+vL5P+bHxn6FqX2O1eEvuN
         40I44yXX26RCHcjNmpY6S9TgxOYWLM2dOX+b3cLqdqrgCNQq3kiesf87YyvJo0O44a6/
         deXJz0G1W2l5Q0URaedxSgNyrT/tcVY4DmONC6aWvjaLgLCUDNaoXvHPanV8k+GgrEYv
         X3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743091767; x=1743696567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lc9tpoqy6nWDYPuOoCnxwnYnaP2wtDpP4dKKDjWcgOM=;
        b=dgBKxY5Z+PgAQwnM+8jRAbUgqAPxJsRk4uHCF8yE4ckG1akaOgjPmgxlVr+ZvvOgvU
         tKJy4hOqIIULvgWFipqEMClskpGKM2kK5b5QFCETs96AIrLTnCyVOSPSyZbSZga+K01T
         p3xfVFPPc5y66BbzY42Yti5Z7Ba+DPsIqNCK+CqxKf9+0sKItiKep74WLxuExNoNuCTw
         uN9GKEgOBoNqnJqBRirlGxVJAv3HpkenlpyM3iDI3Brf069XW05+e5YLWPULUwZKsTnj
         qNsLgkoYnmBdgKVsrfkU90pttZteDXMX0+7NvbWu5eoRRyNQ5gH4hI1twJQsQ3wRb4F4
         jD4A==
X-Forwarded-Encrypted: i=1; AJvYcCX/49kp+g67S/s6Ytg8ffvYKd6156KmsLDt2vwnCnFtJwWCxJt7pJrCq2Uk9dufCRWm5NQYq0QkwljokTM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwehjgv5P78cm0SR3QeW8GtWE3gww9HaLZGI0kCV6odILeM1Sl
	ii/7d+KFNsvWwO/jidXUp4hft4MbbMVlk/IOA1/IrPsRL8rTSflMGz8UKZnlz7A=
X-Gm-Gg: ASbGnct66uw20Q+YGsbJbw2hZzm5Pwpn++fn9f1hlaSzMuhsmw+Sgx3ka+8YVY2jiZY
	ysQ4bVMtWbUUtgE/I2GK7XITrdH0BKLRA7CN7I6/Lo6zNf0fGDXqHncBUknuC8hsFsaxRzwQeXO
	DkbSsLE6ONP8pTnI6ED/nt8xc0jlQaIT9doLoYt4YrzPiulOhDlzLRRd6oJfiCyVffAV2Hqk/LY
	Nov1Dk9dJPL2x5gGC8oRSsagCBQJbvRmnt/UVMgQh4tM6yRf1gKI9wnI/o/vOMOKOmP9zkTMnSA
	Rk2g3AAY6T5obvQaXwvg0FR/2C2eVphGQ9l/waM=
X-Google-Smtp-Source: AGHT+IFIyIjqN7KRfbbaU5gWpkJAPN98hiWDLVUjmx28XhdIkaVpn/ZdT5fnt+0q+a+MgIWRytnq6A==
X-Received: by 2002:a05:6602:3798:b0:85d:f74b:f8a8 with SMTP id ca18e2360f4ac-85e820551afmr551444139f.2.1743091766522;
        Thu, 27 Mar 2025 09:09:26 -0700 (PDT)
Received: from CMGLRV3.. ([2a09:bac5:8152:1b37::2b6:1])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e8ff7f50asm1804639f.9.2025.03.27.09.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:09:25 -0700 (PDT)
From: Frederick Lawler <fred@cloudflare.com>
To: Mimi Zohar <zohar@linux.ibm.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Roberto Sassu <roberto.sassu@huawei.com>
Cc: Eric Snowberg <eric.snowberg@oracle.com>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-ima-devel@lists.sourceforge.net,
	linux-integrity@vger.kernel.org,
	linux-ima-user@lists.sourceforge.net,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@cloudfalre.com,
	Frederick Lawler <fred@cloudflare.com>
Subject: [PATCH v3] ima: process_measurement() needlessly takes inode_lock() on MAY_READ
Date: Thu, 27 Mar 2025 11:09:11 -0500
Message-ID: <20250327160916.279090-1-fred@cloudflare.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On IMA policy update, if a measure rule exists in the policy,
IMA_MEASURE is set for ima_policy_flags which makes the violation_check
variable always true. Coupled with a no-action on MAY_READ for a
FILE_CHECK call, we're always taking the inode_lock().

This becomes a performance problem for extremely heavy read-only workloads.
Therefore, prevent this only in the case there's no action to be taken.

Signed-off-by: Frederick Lawler <fred@cloudflare.com>
---
Changes since v2:
- s/mask & MAY_WRITE/file->f_mode & FMODE_WRITE/

Changes since v1:
- Add MAY_WRITE && action check to violation_check to avoid MAY_READ
  only situations
---
 security/integrity/ima/ima_main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index 9b87556b03a7..bc453f5a7531 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -237,7 +237,9 @@ static int process_measurement(struct file *file, const struct cred *cred,
 				&allowed_algos);
 	violation_check = ((func == FILE_CHECK || func == MMAP_CHECK ||
 			    func == MMAP_CHECK_REQPROT) &&
-			   (ima_policy_flag & IMA_MEASURE));
+			   (ima_policy_flag & IMA_MEASURE) &&
+			   ((action & IMA_MEASURE) ||
+			    (file->f_mode & FMODE_WRITE)));
 	if (!action && !violation_check)
 		return 0;
 
-- 
2.43.0

