Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086E02951D4
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751303360; cv=none; b=ho3gcX/EBP/JFoxCMKHeHKA9z/5J04B5y6FclBPIyGlM99OQl0UVLgK+Zm/De7s2QuIoUNwJdLsSksDPfQqYcTmNWNWQSBcv+om+0COS3gpKWxEvYnzZ1WFaXe0ffyDiJ2wR9LZeNv45TtCz2upkMNuTr49qZjMhlTgExzMnL2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751303360; c=relaxed/simple;
	bh=UUSKaxqW2JiZ6k8aAINHbR5UNuJdzh+o69P4Z8rDROo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=IoM9Y+QL+GgdRXtiMVr8rv/9Lji5cLywgMn6Z5sdz+ToXSUy/u76cQSYB3aVklwQX1n+M14TnUXmG2tN7ZcRH0t5K8f0bOpVLTUEKuYyXLsLKU5gLmfYxYS2D7wZuQw3Qqbq22rLenYIqSR4VYvzALgjUjYaYcS8SPC0oG5JyMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fpkAvPto; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fpkAvPto"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4530c186394so10478925e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751303357; x=1751908157; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kM+poFmpKItXkYaDEhmuFa89I8i1fFFkiIMelce0Oe4=;
        b=fpkAvPtosy3mbcWEeN9ocHxwPv/cCBOvKQLhH77veW3Use6wVoR8I7A4m9OpeYrfNG
         0YTaUhsWfF9PVuWzomVHetWHh8s81r+7N0WlMK/46h94PQwRAiDnXykvZ9SV14+LIQBO
         Vv3YE6pGdGZVZhsncFidxGKlPQRupF87QTeKmfkVvUsc8Szvtc4u5U5HaUwe3N1G38Yt
         g+7xfDeNEPDTs+vuL1u3HySwY+NDR7+bqGY62nNQeLK6Gzr6zQ76PG2zhpeWBZ9QWonE
         Rup3Huy0tJ4oriN4rT6o6DntRkT9P1JGV0yjm1G3mliAh63OtfkbeRrby2O98vFraYL4
         IA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751303357; x=1751908157;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kM+poFmpKItXkYaDEhmuFa89I8i1fFFkiIMelce0Oe4=;
        b=Bud7yLsbXJzBwfnVOKeBb5TJmvSz8Ax8JS4S8Isdb1Ni3SJjf4bxqQCXduNiZ5Q/8D
         E2dFRkGldIzn9DH1TBNxpEn0Ms8DxXIIv9m+v+RnKoZtBMJx3bK5LxfRQ4C/bqNTZV8l
         l5yuRpshTvuHEH/qiTVFabDpbEFnno1k4aK0pkVj6vtpeMAFGWY6nytSWEqFeQ2v1swq
         MbJNhO9NTx/WqyNC2wKrAMBLpQF0aq0PoiKql1gNFs5CZfN/8tSkUJdJ+y7EkXsvqDXz
         P1gHFPOl70Mn7RYcF+hzHsiGahrYibMWzPIs8pMVzDMbZDLnWBqu+4piVaLAQ9RGFsRg
         lcjA==
X-Forwarded-Encrypted: i=1; AJvYcCWXOc6l9SzZyoWfk7tQTOwcTJ4PRXEtF4zzXXoDsD15gRXnurWjUzh2k75z76PMSy9sL9I6xi13PriryvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkzSuJp1ZhAa85wWKnKEqQ2efSDJenMJqBLejh38U1/MU6+mhC
	qlXBO+pjQikZ5Ty6SUjjvpqif1Jlii5v/n4cLKArMoFBnGRW9G8KPGCvbt/dHfxPEdL8JnvAIfl
	Mcy0I4vf+us6d4g==
X-Google-Smtp-Source: AGHT+IFZGpWbed6vexGOhMFfsFnZUtmsDJtWbg/hA2nciuk/aGV5FLxw5JHySasMeCX1Yv92C2NXaTWKwGhhHQ==
X-Received: from wmbeq14.prod.google.com ([2002:a05:600c:848e:b0:442:ea0c:c453])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fd1:b0:453:6f1:bdba with SMTP id 5b1f17b1804b1-4538ee60a60mr116785185e9.20.1751303357487;
 Mon, 30 Jun 2025 10:09:17 -0700 (PDT)
Date: Mon, 30 Jun 2025 17:09:02 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAK3EYmgC/x2MWwqAIBAAryL7nWCG9rhK9GG21kJZaEQg3j3pc
 4ZhEkQMhBEGliDgQ5FOX6CuGNjN+BU5LYVBCqmEbgSn6yDu6OVWaeVa0XfGLVDyK2DR/2qEeJt 5R5hy/gD2RrruYgAAAA==
X-Change-Id: 20250630-ipmi-fix-c565f7098afd
X-Mailer: b4 0.14.2
Message-ID: <20250630-ipmi-fix-v1-1-2d496de3c856@google.com>
Subject: [PATCH stable] ipmi:msghandler: Fix potential memory corruption in ipmi_create_user()
From: Brendan Jackman <jackmanb@google.com>
To: stable@vger.kernel.org, Corey Minyard <minyard@acm.org>
Cc: Corey Minyard <cminyard@mvista.com>, openipmi-developer@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
	Corey Minyard <corey@minyard.net>, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

From: Dan Carpenter <dan.carpenter@linaro.org>

commit fa332f5dc6fc662ad7d3200048772c96b861cf6b upstream

The "intf" list iterator is an invalid pointer if the correct
"intf->intf_num" is not found.  Calling atomic_dec(&intf->nr_users) on
and invalid pointer will lead to memory corruption.

We don't really need to call atomic_dec() if we haven't called
atomic_add_return() so update the if (intf->in_shutdown) path as well.

Fixes: 8e76741c3d8b ("ipmi: Add a limit on the number of users that may use IPMI")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Message-ID: <aBjMZ8RYrOt6NOgi@stanley.mountain>
Signed-off-by: Corey Minyard <corey@minyard.net>
Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
I have tested this in 6.12 with Google's platform drivers added to
reproduce the bug.  The bug causes the panic notifier chain to get
corrupted leading to a crash. With the fix this goes away.

Applies to 6.6 too but I haven't tested it there.

Backport changes:

- Dropped change to the `if (intf->in_shutdown)` block since that logic
  doesn't exist yet.
- Modified out_unlock to release the srcu lock instead of the mutex
  since we don't have the mutex here yet.
---
 drivers/char/ipmi/ipmi_msghandler.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index e12b531f5c2f338008a42dc2c35b0a62395c9f3c..6a4a8ecd0edd02793eda70f9f9ae578e37da477f 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -1241,7 +1241,7 @@ int ipmi_create_user(unsigned int          if_num,
 	}
 	/* Not found, return an error */
 	rv = -EINVAL;
-	goto out_kfree;
+	goto out_unlock;
 
  found:
 	if (atomic_add_return(1, &intf->nr_users) > max_users) {
@@ -1283,6 +1283,7 @@ int ipmi_create_user(unsigned int          if_num,
 
 out_kfree:
 	atomic_dec(&intf->nr_users);
+out_unlock:
 	srcu_read_unlock(&ipmi_interfaces_srcu, index);
 	vfree(new_user);
 	return rv;

---
base-commit: 783cd2c3dca8b6c434e955b84c20c8940588dc68
change-id: 20250630-ipmi-fix-c565f7098afd

Best regards,
-- 
Brendan Jackman <jackmanb@google.com>

