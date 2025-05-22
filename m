Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E2B2D4B4F
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747957969; cv=none; b=GrRyf1sPWh5sOgkMI4tHZsseXlzZbeGQxviQa/nqooPc+JZpZVW1Q2rReirat3l+uEx/FV2zGQisPWnST0UILRG7U9gfy2hsNa7PvCt22rLbkbwCa6MkYeOEdeoxYeXevwdD+Bde1jlF5Zjbf24pNVek7p5fVyk7aT5AYxlqGLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747957969; c=relaxed/simple;
	bh=Xjq+huymn2c342iWWiY1CbwR9+2osfFq6dqedGxHGtA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iNCsRogDR67chEeMU+h5sy4U/EERLxfucjC4O51V1LlF9sWoCfMMRYzpKWpVD22vO4aJHxBLWtavWh0sYQYHNSchmYx7WeFnbjv9qyxFMQLXzGXzVrtAIgOh6iIOc8p2LW+Y/dajY9f5efCq4fero0mNZGZriEzM2W+1UKjZ4bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fzNquj/f; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fzNquj/f"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-745e89b0c32so1323986b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957966; x=1748562766; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=rhj01gCo8zRE4ihm7mjL7ntGfsdvBwkWydK82rp0ihs=;
        b=fzNquj/fhOTTgsHJHG8cKybKfCiPTn7g38z+zY2tFCRYgAnLXKxC3j0IqhrLfRNYuE
         WBZpV22YWTqqJ56zJ3nRI+JPNEtoT8c9aXTnj3PCgfXtveLCp4S/0EEUK05VLme5esFS
         eofAWTXdlInU2TSjQ1iW/1mCxbhJUM/TIL+ekZ05tcW6TiSiUlUO9wxAHxRFckfg1X8X
         UbKU50xYHUAK3kumKuyKAcdkrB+4uoAXC1dkEcMrKYV+yuBTcm37ZsjJK1h0MBfg7zDc
         3wPVB9cuabrogf0dvueAJEvwOevRneC2LSi2rrRa57GuEETcuxxUT5HzW/HUqW8gIYjz
         ZYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957966; x=1748562766;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhj01gCo8zRE4ihm7mjL7ntGfsdvBwkWydK82rp0ihs=;
        b=Rg9/6g92YgNRSJak/rOVwlgZuoncmLDlf5dHBWMIwTSS0JxbJ8HsGiQtHzV+YgMXPG
         LMUcujjv/uP0Mbs5I8kkAOw3qpuXYGfMab9NZs7YmyYJZX2R9gT3N2Q2lbBMnp88DF28
         sm+5/YFsGZmSIad3K0BezKglPnBkDVYlQfAG2TGWs6WV9kzVu8hDfF7EOPm9+UiB7ueE
         Kp9Lvjpdw1LYUkFnfiPGNapvu2BJoOJ5BptLC5fGtLYj55yXewBoNInYcYU8YEDgTSws
         7u2QA0HfgbahES4UEpbXItF1Lw5iYASJT7LscMARZ/WeF5HxCZx+PzIYzlE3b4hzuZWm
         roNA==
X-Gm-Message-State: AOJu0Yy+bQWu8HN3aYjy/sT1zL/6OhYma0KREt4BpKcTBn0INy293kte
	9WCNNgjm447+r2mImJeckRcODDzsb+4/Q2u6ar0Vi9uodGOalYjgRU7Yt8057tWXIjujr1MZCjP
	Iun9JIg==
X-Google-Smtp-Source: AGHT+IFcXQOzVhyYyYRvvhxCpwMSPB5FWKzf2e+esBNAhvIROXYgtUD8Jyc4OswUVSapVQEWgVgXYmNxl9c=
X-Received: from pfbhd3.prod.google.com ([2002:a05:6a00:6583:b0:742:a60b:3336])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8594:b0:740:9a42:a356
 with SMTP id d2e1a72fcca58-742acce36c5mr31613679b3a.11.1747957966116; Thu, 22
 May 2025 16:52:46 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 16:52:17 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-8-seanjc@google.com>
Subject: [PATCH v3 07/13] xen: privcmd: Don't mark eventfd waiter as EXCLUSIVE
From: Sean Christopherson <seanjc@google.com>
To: "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, K Prateek Nayak <kprateek.nayak@amd.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Don't set WQ_FLAG_EXCLUSIVE when adding an irqfd to a wait queue, as
irqfd_wakeup() unconditionally returns '0', i.e. doesn't actually operate
in exclusive mode.

Note, the use of WQ_FLAG_PRIORITY is also dubious, but that's a problem
for another day.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/xen/privcmd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index c08ec8a7d27c..13a10f3294a8 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -957,7 +957,6 @@ irqfd_poll_func(struct file *file, wait_queue_head_t *wqh, poll_table *pt)
 	struct privcmd_kernel_irqfd *kirqfd =
 		container_of(pt, struct privcmd_kernel_irqfd, pt);
 
-	kirqfd->wait.flags |= WQ_FLAG_EXCLUSIVE;
 	add_wait_queue_priority(wqh, &kirqfd->wait);
 }
 
-- 
2.49.0.1151.ga128411c76-goog

