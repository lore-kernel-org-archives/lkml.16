Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3B927C151
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834764; cv=none; b=aaEX13TbPWSK+eMVoGryu5MhOzahnCffLNG1yppucO5mrutb+ybgCs5CcpJTBLxywaMzsP+L40yQ2LIkiiskqfC66WzUo0YXMujKyopHbgx0+7QLsBcUOJri1t9zNhkD4eSmVqLBhEFwmMFm6ROritDY834tjWfDMWGvjcr2JbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834764; c=relaxed/simple;
	bh=pzxSFKxJQXg481Jmg4tJCFE5y6jCZnD7TayCy0V8X6o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JcsyEI1WzEXjf67fHAukNArS4R3I5sV/2mmfE6rCyqkJwj3MjD5bhjnLWK9azmg5NN+anl/0nOoMMEGmj8oK+dpgK4ItUngbZJiBD8ASA8H5T0y2dWDzQTBiBqtAyzPEuFvGQdFtc8yeefqOP02y5olOLs0KgSZIqU57Kg7K3mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4dAB+7U; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4dAB+7U"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32805275e90so38512741fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747834761; x=1748439561; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pzxSFKxJQXg481Jmg4tJCFE5y6jCZnD7TayCy0V8X6o=;
        b=m4dAB+7U/Y9mx0oiZo+k8clXVHpV3SnxdQV47iKBtZtrqPSsmilqU3y1ehYBOHf4l1
         ece8F8brgq5T1jzjCCK99txaybsH66kqaoZRCi2/8QXOMHMA5QqUKmh5+vtHQNG0h79W
         zhlK0mkJfXyzNIZ+E77KbsWDHcuzoWozscBCxte8qjhm9pu/VvPsTCOoX1Iu8xSLQp47
         H2oXLuCxRI8+pG+oUISRk9BDUiisUX8JhtcKbPJhOb6axPn1xxV02F45wyIO8SuJfs4v
         GTOqB0jy/XhS73to7G49Z6XzjziP50EW9MVkoAfb6HkW6Aht0STtoIzgY4JhkQQELJCI
         7ckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747834761; x=1748439561;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pzxSFKxJQXg481Jmg4tJCFE5y6jCZnD7TayCy0V8X6o=;
        b=DWH1rmd6LSDMQ2iFESkNCuu8c5JsEXewsBbrT8mS0yHSnqkEosNDzi29obK0JG/r43
         MrGkUpJbOhNRehniyl+wk8yZA22XBjdKCAIwQPdZReox4os4j6PP4Vy9Pesg7IFKf45/
         xOo3szfUp0Zz2HbrIcF46vvil/ur2jweX9shYl0RlIB6/MGOE8zZ7ClFB6STbY0JE/KW
         h+gxf2YoD6OQ8soOp5gGK7hP6qITcMB5yGFtwzGlXFk8d41y+D84Gq9zs8kDBxJVb0VT
         OuTNKAqdpSHy6gcmof95TNzzFKP4LcHOGt4Fjz0cauy4lV0W1GGwKBstH4NFOmScN5p2
         e8tg==
X-Forwarded-Encrypted: i=1; AJvYcCUmspd0ECtROPvh1LUuFvqNlzS//UZ/BAx1M3LmakXXIuvUm7zqIYUs91JwG49Sn8JXyj3yXTsm15JfI9o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt18FKYf9y/C4SxvIodWU4qJte7QeLSD9Px4SlTfaYw8kazv8/
	BPPEonTct4GvYnPqOME9Ua+mL4BsKgZoTXJIfa/nlQoVXfJkSMMTQbP/GuzMJSHidmBdIOWksE0
	ldXG3yakyH064fSbT0VsXQ9C3kSdzdQ==
X-Gm-Gg: ASbGncu5NCoc3uLViRYkY171abpje7fCO9rI3hzJzdFbESn0IA13dtj+l3Pd5A3prZ9
	2SM5gFCvZ2T1XyYwNypceuWBCwZio+rTRP5JX2TYcsNzs/PTf5yH7v1FnLr4zTmpaSUjQJUlU/s
	++IlJIP+XYaCB/vQY2WrJ4NErpJesuUuliGPDs/i+X5AnOHJqAYsljfA==
X-Google-Smtp-Source: AGHT+IGhQe5Kt7joBvkTPBETSOjiV3ZY0TYmn9PJEk8UPTkkhdpPa0pl7NMSIXqKKi9I7OhELJFcauglzqSBLxzAYWU=
X-Received: by 2002:a05:651c:400c:b0:30b:f42b:72f6 with SMTP id
 38308e7fff4ca-3280977f153mr53456091fa.32.1747834760313; Wed, 21 May 2025
 06:39:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: John <john.cs.hey@gmail.com>
Date: Wed, 21 May 2025 21:39:06 +0800
X-Gm-Features: AX0GCFsyYlABwIGknBhQjEdn9AyHwOFmcZsqDvNarxyio6i7-xnJpWR2_c8qF2c
Message-ID: <CAP=Rh=Oo1KdREOq8=B6wCBOcQ6H=uwELS8MFaMtvr-a28LAxGA@mail.gmail.com>
Subject: [Bug] "BUG: soft lockup in ip_list_rcv" in Linux kernel v6.14
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>
Cc: Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Linux Kernel Maintainers,

I hope this message finds you well.

I am writing to report a potential vulnerability I encountered during
testing of the Linux Kernel version v6.14.

Git Commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557 (tag: v6.14)

Bug Location: __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:152

Bug report: https://pastebin.com/t6jtEzp1

Complete log: https://pastebin.com/g096W4xD

Entire kernel config: https://pastebin.com/MRWGr3nv

Root Cause Analysis:
A soft lockup occurred on CPU#0 for 22 seconds during execution of
avc_alloc_node() inside an IRQ context. The lockup is rooted in
spinlock contention within SELinux AVC (Access Vector Cache) node
allocation,
possibly triggered by a storm of SELinux permission checks
(avc_has_perm() calls), while audit is in permissive=1 mode, leading
to continuous allocation and reclamation of avc_node objects.

At present, I have not yet obtained a minimal reproducer for this
issue. However, I am actively working on reproducing it, and I will
promptly share any additional findings or a working reproducer as soon
as it becomes available.

Thank you very much for your time and attention to this matter. I
truly appreciate the efforts of the Linux kernel community.

Best regards,
John
