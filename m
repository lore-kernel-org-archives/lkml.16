Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9D2280313
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747432769; cv=none; b=s94ssj6UXiBWXSqtw9aW76u/kDr/j8vvbucjIHAWNaJYkycReUyCuCkKNMyrXw6Apn/GxnjedCzyl818BXYrs1narVklWu6guJNC7ZZM6D/v+KS3JMLG33NblrtGYBHeqANlUVbXYRbhzbiBipWRIaCgkE6HEd8AREOn59j5rok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747432769; c=relaxed/simple;
	bh=XuQn38073KHqrzPrijgLyDNDCPtL6wvRlD+O0fD5OUo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Pccw641LCmJyqeNPfCwBCu+BunJBYG8XknHG9Icy0bjOPqgWjFVLE8Rin8jPdzQidSXsNQgI7Txq2nMx/RObACEJj9SNDUUpVgtHlkstCgAbgMXQgWYtaOrqO3foqnZiuvDU02SXzqWDCY2c0rK8NSLtgTGKipqvmujJaH85SRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aH8CvCg6; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aH8CvCg6"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7424eb14904so2326705b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747432767; x=1748037567; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pDqYazeOU2MMjFDIvxd/6WS3ibNxsUMiTmQuhluxDl0=;
        b=aH8CvCg6UAtqjiKGFR1lSxGdgm07KX1kNwfdaQUtus6Jel3GCc/P7DdqUGNMLSes11
         ppQI8rvmyC+8Bb9UNomaRUxmCsNuI0oZKPmTEA+aLUh5plrQ1HJTkGyIffcUNUjniHME
         ApiyKSAnBWBIJOfQjzfbkxLLgBWslWlDjS6U/UM0/XHOJfErUHJLvU1N3hPkLCx7yEVd
         0j6wQVZqUz76lPQo/1cg4ahUx2yQwQ1vQJvJmr868ZDTXWnp1foyCMQaonkyMna9irjv
         OgzmV0G1+CZ1xCPGa1dUv2cw6wk32IQv8Vgaviu2JMztm1yHmPxc6lk6q8kraZGQlkEv
         hfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747432767; x=1748037567;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDqYazeOU2MMjFDIvxd/6WS3ibNxsUMiTmQuhluxDl0=;
        b=BdiaURB3nzbQpYmGZSHBNBqlZE0g4m7+N/r5cnXMObzciDdTBWwKNGDcmO9fEq2Ty3
         1YptoPp5SnFBEaYwanbnhT8ZlssAjIaj2ikyfybZTIilHF8CJAaFYf6KzySrRjYoHgLv
         ZUnbI/6V+6YipWzptYTOgRSqDU0JxrQ0v8sGQFyRZG9D4/koA0YWv/Mj39B5SE3w3uPI
         6XSN3aXn9ZEvDQKflKG80k8YgvLyW+mjnZTEMUSX36lYGuHulkDHQAs2IbogkzwgvCbp
         ySvmkLf/Nq7yaXkvG/bruBMxSdeuaGC1ER6gr9TP/iWqQmSmh7KVJl3XlNyWUZHAUMo/
         eSKw==
X-Forwarded-Encrypted: i=1; AJvYcCVCkZ2kHG0om+76hZc+2KxgH1X1+iPd8AboJT9bXmm59vBt+ItJiXwfGZC9QQBrajz5vkiywfieD1lKT/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YytcH2pzEN7nw/c8fSZv+g4eCXvfCwBp3pYsqr/wbn6eQV1ELUC
	36GPxb3JxMNPY7DWAEWQpfzUqTE1+HpmafGqTjQpoPMCOIbqXhAsfU2ZdVLYgSIdWNSsXo0vdHR
	GbQI5YQ==
X-Google-Smtp-Source: AGHT+IEMpqGq+n5rZKXrfZWJxx7HdXHB3++83H1QA7R+pncGD6kY27CVeqAueI1gRToAFbpOxhL8FJB+P4c=
X-Received: from pgcu198.prod.google.com ([2002:a63:79cf:0:b0:b26:e8ed:2bbe])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3289:b0:203:9660:9e4a
 with SMTP id adf61e73a8af0-21621a18c62mr7063111637.41.1747432766886; Fri, 16
 May 2025 14:59:26 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 16 May 2025 14:59:08 -0700
In-Reply-To: <20250516215909.2551628-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516215909.2551628-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250516215909.2551628-4-seanjc@google.com>
Subject: [PATCH 3/4] KVM: selftests: Play nice with EACCES errors in open_path_or_exit()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"

Expand the SKIP conditions of the open_path_or_exit() helper to skip on
EACCES as well as ENOENT.  Most often, lack of permissions to a file
needed by a KVM selftests is due to a file being root-only by default,
not because of any bug/misconfiguration that warrants failing a test.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index b133f2b1dbf7..cd415f70de98 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -37,9 +37,10 @@ int __open_path_or_exit(const char *path, int flags, const char *enoent_help)
 	return fd;
 
 error:
-	if (errno == ENOENT)
+	if (errno == EACCES || errno == ENOENT)
 		ksft_exit_skip("- Cannot open '%s': %s.  %s\n",
-			       path, strerror(errno), enoent_help);
+			       path, strerror(errno),
+			       errno == EACCES ? "Root required?" : enoent_help);
 	TEST_FAIL("Failed to open '%s'", path);
 }
 
-- 
2.49.0.1112.g889b7c5bd8-goog

