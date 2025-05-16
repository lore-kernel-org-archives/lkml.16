Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5CB28137D
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747432771; cv=none; b=a9dVFj1SXysMOnq1pxtRGHK3TZLouXVr25e48W/2tfIslE2OkvtxMBg7ZcmDpwsXYexEzIYAvY5+GCpDJVd0DzSw2SSNfNyxBlI4Xzw1st3oFtOLApUTbA9z0HGALHF65oGs+5jw38Dqahr5hBem4QnBcWtrjqY65jEZnrpieR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747432771; c=relaxed/simple;
	bh=fHzQNuAEGzAs0V+/3iJg5MoPsJofX2suDpfAK1XD40o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rxW2zKbeagS5Pg4WqpWBqov6z5mIomRv9/pdDmfLrc9Uo7YeyWF15XZ9m3Qnh72rhmwrMNo51NCFbU0zIeWOUjV6mdrpHXnsPUAG/vlomNeowfixIAt2km2uNl4F4ivgNyplfbg9yecas3HJJNJzj1opgRZWvnxUKI2oARMrc3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sxAPbcgX; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sxAPbcgX"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-74299055c3dso3323094b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747432769; x=1748037569; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=KJLKvOEBBRqQbKBXlovuW7nBLdsIgFKyRZr0KCcKFF4=;
        b=sxAPbcgXfTvyZbyytJYNRJy1NoqtZVTDYJPDNdzyB4xvojx1YtX1/Pq/GzfpNGEWph
         iB1jeHLkW1gVBYIF+ABLf7eRf6HauCvGZYDkSpNfU3xOPy36SYObh0p6nRR57auPdhLL
         6J0J5S+Vo5RqjjCmToX9fE+m7ax7rJXgRczl5yn23UBwrT9u8rKMkwwNUJJcosZmV0+I
         lF61EDy3layoGId3gFMAGlpykBTZD+n3PmtkyQjrDHy3aRi1c0lJZkJ4/7veoTR3yuHw
         /tkWgacVKmsqd/R3zX5WodIFT5hJFv00uwaV8pAmTM8DT6/RP2UkH1aPHWkDYuZQbiqC
         XE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747432769; x=1748037569;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJLKvOEBBRqQbKBXlovuW7nBLdsIgFKyRZr0KCcKFF4=;
        b=IsyMzWxtiQxVO7BeU3VDtG6Rgi4AV4f6rW1sAe0wjB36eYqO+Hwz6hx1/vkaMg1/AZ
         E4KCcQH3HAkKXDEV3TV9VFpoGHCYWqWODA/GRstsS6juyKCFc7EJpHYk1lZ/tKHt5V+V
         UGMnRDXP6U/WEkb0dsPsv3qjtPhOwcnVeMvCn2Gb+g809UCaCHhcGhUV/fmfAQK+fxoh
         Q2wAW0UtLVUKrRQ7bRAq4gACUHz/jVx9/G3ZqOHbvw2l7yqG15KUcA1AskT1EOxPl61e
         RORChsXUt1IFuSZges8HM9dM5qRWGT97VKJJyt8WOBi4O2yBGK5TVXD0EvOcrvqkbM7v
         xcWw==
X-Forwarded-Encrypted: i=1; AJvYcCWXkQvcpntiYXMSwNKFPVzy5DBTPQkplJ/C9nHKKd5qBruxgMvmsTrADJ6BGCrFUCgFLdIpgakEyccYNEo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8YlqloVPsRkPzxPNXkuA0MVqlxOWTHlZmv87exMj8956cZ02+
	ohxLsUC43FFTEi612jvxOvqWzKBC8d15XEVFVb0iNGUjj1axr8GM7GP2rd6x5jQm97B0HBytMr5
	F6IBFRQ==
X-Google-Smtp-Source: AGHT+IE+ZDBFv/EaWegJcGZxqlIbLXp60sd2aeiJn9nLSrWpqIbz5IJGRoEqQKdaxj00HZApGs0eC5hkpLs=
X-Received: from pfey12.prod.google.com ([2002:a62:b50c:0:b0:739:485f:c33e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2e9b:b0:73e:1e21:b653
 with SMTP id d2e1a72fcca58-742a978e6a3mr6863851b3a.5.1747432769498; Fri, 16
 May 2025 14:59:29 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 16 May 2025 14:59:09 -0700
In-Reply-To: <20250516215909.2551628-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516215909.2551628-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250516215909.2551628-5-seanjc@google.com>
Subject: [PATCH 4/4] KVM: selftests: Print a more helpful message for EACCESS
 in access tracking test
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"

Use open_path_or_exit() helper to probe /sys/kernel/mm/page_idle/bitmap in
the access tracking perf test so that a helpful/pertinent SKIP message is
printed if the file exists but is inaccessible, e.g. because the file has
the kernel's default 0600 permissions.

Cc: James Houghton <jthoughton@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/access_tracking_perf_test.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/access_tracking_perf_test.c b/tools/testing/selftests/kvm/access_tracking_perf_test.c
index da7196fd1b23..c9de66537ec3 100644
--- a/tools/testing/selftests/kvm/access_tracking_perf_test.c
+++ b/tools/testing/selftests/kvm/access_tracking_perf_test.c
@@ -596,11 +596,8 @@ int main(int argc, char *argv[])
 		if (ret)
 			return ret;
 	} else {
-		page_idle_fd = open("/sys/kernel/mm/page_idle/bitmap", O_RDWR);
-		__TEST_REQUIRE(page_idle_fd >= 0,
-			       "Couldn't open /sys/kernel/mm/page_idle/bitmap. "
-			       "Is CONFIG_IDLE_PAGE_TRACKING enabled?");
-
+		page_idle_fd = __open_path_or_exit("/sys/kernel/mm/page_idle/bitmap", O_RDWR,
+						   "Is CONFIG_IDLE_PAGE_TRACKING enabled?");
 		close(page_idle_fd);
 
 		puts("Using page_idle for aging");
-- 
2.49.0.1112.g889b7c5bd8-goog

