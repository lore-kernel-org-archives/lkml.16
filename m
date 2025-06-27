Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4A31922C0
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056676; cv=none; b=e3QZo9WXoA7UQO0oHKn6rYsqm+9WTQz9Qe0ZRtja9UW4MZuFfKM2OQmb6Re1Kx5DQGo/ImX7Qz0hdSEUKqF7ILYVyvmbgegqVdtXNpiDyCvv7/T4YpYaiVfaiWMlyMLU7+BtxwDq3kJSokY/irYgYFroH9KLbur7xD0Nso+Uhng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056676; c=relaxed/simple;
	bh=jVCnSgKgTBaALIL5kswG283XAlndIy4N1hK9vcUxt+M=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=RMGG45/FEQrwaAHKjGG14Qj7BFcUCMaQUxn1Ov5DIeB0I2uwHRELIiK1gEJwNAs6P/A03umqk2vhVE3OxW54Vv3WwsodmQS6KN3BEqqhW6W15MfwktBeVAH2r24rhNovV46d0HXWOM8l98BafukgMEim76yVuxjJ1DHDXMnj0K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZWZBKHma; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZWZBKHma"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so494644a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751056674; x=1751661474; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KNNvKIHZytjNLKER5B5vXrvdNfJHgheLSxitrBAGU4I=;
        b=ZWZBKHmaK5wk/zCcm449atcmiRiZ5iBkLYwQUhRf//jWZ97rFcD8eZj5aJEADQppvc
         cWt05VHRyOj/pD6rgY2WVYm3gtISa/HVIY65zetcMsme9DBzzHanIHyo1E5E7UVYlvWo
         dFn9iO8lqjDVB9NPStf0jB7E1qtJhv3/+mcZR977v8eMK8b3klnPNj+X4Ux/WysWh0Dl
         7HqHWL5f5+gEr92ZKZA1Y10N4ef/Z28sHyl4FrHUEMA56Pomt4wGYr29ZxPdWjJo1Cz0
         DsRr6Ucx772Bk/or7nXCZr9D8zhsJE/8x5EzqAff3404eZpnjopEFgLoGd4kfLy1od7v
         yrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751056674; x=1751661474;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KNNvKIHZytjNLKER5B5vXrvdNfJHgheLSxitrBAGU4I=;
        b=Dy295ko1lS+LZ1SfeRLYFnxqvEhxzE7XQKuM5v+tOQWMO2RfpQUkNU68sXkn0HEpDX
         wyCptcfvnvWiR4AvBtRhlpzTlLt87aU2pSxot79tlHWixpWfYlc96/YuKCiuN+Kw6VpO
         SuTr+CPm5f4TBk0RKPJVMDCH0YjJ+F5+ZFabZ5bKAUBWZiQVa8zeVzLJBvQwkxW4PZ0V
         G7CjObdpnGJFO9XccrLRwjkD7RXc0gYckYJA6Oj0eschXaV2ZAHQbQq/KoWDFog/r6it
         saWfhtHlWaQR6c9jSr4KqS35wD0DCvQ1pWCyiF6ssLuWwMy1O0ky1W6okA0fntaKRiZM
         lkXA==
X-Gm-Message-State: AOJu0YwBS14gR/J/KQd7orVXGyNCjHTNPWChuqgKqpQIgudV/5UyKrwQ
	W5nL/UndhnuaaakzeeQcWod1r50t1Uef6IeEs+hPodSOB+BSl22AQRElhYBQnkrlbYhXw/4ytL4
	kHqiMQBd9lrJKxSx1VHyZZ7ebKLZsG+GHD1HcjcIzVQ8NV4V8pByTrYragrmkwb+TwCYWktIoRA
	8jKI8aHX0nf2JH5lSFSrKpfL+Tc6bGSAj0GjNla0SZClbw9JvVUg==
X-Google-Smtp-Source: AGHT+IEQQPKAxqNl0ciLgZyXlCg61DjKjjnF3AS+cRg0GMCYoGzXmaiv9R+XlDrGhMU44WAuOC72MBc+TqmK
X-Received: from pjn8.prod.google.com ([2002:a17:90b:5708:b0:312:151d:c818])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:278e:b0:311:ffe8:20e6
 with SMTP id 98e67ed59e1d1-318c8ecd20cmr6632918a91.3.1751056673987; Fri, 27
 Jun 2025 13:37:53 -0700 (PDT)
Date: Fri, 27 Jun 2025 13:37:41 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250627203748.881022-1-ynaffit@google.com>
Subject: [PATCH 0/5] binder: Set up KUnit tests for alloc
From: Tiffany Yang <ynaffit@google.com>
To: linux-kernel@vger.kernel.org
Cc: keescook@google.com, kernel-team@android.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <rmoar@google.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

binder_alloc_selftest provides a robust set of checks for the binder allocator,
but it rarely runs because it must hook into a running binder process and block
all other binder threads until it completes. The test itself is a good candidate
for conversion to KUnit, and it can be further isolated from user processes by
using a test-specific lru freelist instead of the global one. This series
converts the selftest to KUnit to make it less burdensome to run and to set up a
foundation for testing future binder_alloc changes.

Thanks,
Tiffany

Tiffany Yang (5):
  binder: Fix selftest page indexing
  binder: Store lru freelist in binder_alloc
  binder: Scaffolding for binder_alloc KUnit tests
  binder: Convert binder_alloc selftests to KUnit
  binder: encapsulate individual alloc test cases

 drivers/android/Kconfig                    |  15 +-
 drivers/android/Makefile                   |   2 +-
 drivers/android/binder.c                   |  10 +-
 drivers/android/binder_alloc.c             |  39 +-
 drivers/android/binder_alloc.h             |  14 +-
 drivers/android/binder_alloc_selftest.c    | 306 -----------
 drivers/android/binder_internal.h          |   4 +
 drivers/android/tests/.kunitconfig         |   3 +
 drivers/android/tests/Makefile             |   3 +
 drivers/android/tests/binder_alloc_kunit.c | 572 +++++++++++++++++++++
 include/kunit/test.h                       |  12 +
 lib/kunit/user_alloc.c                     |   4 +-
 12 files changed, 644 insertions(+), 340 deletions(-)
 delete mode 100644 drivers/android/binder_alloc_selftest.c
 create mode 100644 drivers/android/tests/.kunitconfig
 create mode 100644 drivers/android/tests/Makefile
 create mode 100644 drivers/android/tests/binder_alloc_kunit.c

-- 
2.50.0.727.gbf7dc18ff4-goog

