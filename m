Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D03AD5A
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 00:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749859725; cv=none; b=Z1ztcGE54SmV8DHjJud/LUimt/KiglygQaXlAIiHQiPanKuJrPM235szhsctq7HXkH8pa8l+sIXhEJkDogzvnJyqSHUfNUEUkc1ytWmQ5N6W2Oi6acdNDh+P+GQPz1y+AaYRQvGefm44r+jPOLPocPKFvJlKeYKE9UmrOQByKNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749859725; c=relaxed/simple;
	bh=vuCp+799+GA2TdD3womsE4plTUsz+mVthrFC6jCIhdw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ch6rl0FNGY5+41nY7EQR87kQITAaAb3O3GMmLEjMXLyT4W8JmvSvoqN1rX17QJ1OURdF82/ItXJmBr7Dmtvf6DEUkw2BqyZHVheDIxn1Dqz7GPh04VlSdQVaqRCStXI7k5MkkVHp6qZzG6pl6uhoTEXhq9PQgBd50PiFVxnT6vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yuzhuo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2nu2eXsv; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yuzhuo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2nu2eXsv"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-313b0a63c41so3272994a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749859723; x=1750464523; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8gRBKiUS/LqVw91mdG4BB51Db6Wh9r5ixmp7H76fvHU=;
        b=2nu2eXsvEsSCFdHixF1YPnpPXIXtmXWQGtto3WpgQoaxhZrwqHMa4F7vR8TZK7MUCL
         aSucvRFt1fEWsW6C6xp49/xOqtBe4z9DcVMJCqK8rSpbqOg+TcogkoZ4caSmPoWPIWd/
         vR9ArBk9MM6I1cK1518f8xb0Hp/nEQyuP09+PYOAuwZ3Vzj/uHXfNFHYn0kyV9AWM9Ph
         tx7ADrmV+5K7suFvGeMLiKO53WJpds/q6xrnypgTf4yoRkxNbUX6rNToJkf1y7Nm8O/l
         2973k19vi9VspB2BsEGRfcvMXyifYUhGOOCNbcIbM3Vr8XU0uTt4gmMld4bSpZaP7uuL
         nKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749859723; x=1750464523;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8gRBKiUS/LqVw91mdG4BB51Db6Wh9r5ixmp7H76fvHU=;
        b=mSHdxF4fGBmdOjg8S/Ha9cQLK2OHuvYTw3+/jufoYyPSA8LVFzDZgWTVbqRoE2J+9h
         8e+WAGa3HfoapGadIP39A7H5jFoGOey4AaDhzPPRcDWC0533+oLUbqiDXDnH+WD4q7OV
         5IDP/mOJ0HTq/9DpIARgJfXla3fPxqcUin36qZy9+74CZ324is6aVq6GYaro56Vj+C8I
         Hy2WZs0rabmtVFtkRuBb94PsSKCytULGV08kacLfBMOkYGdw0w8CudElrZCG4ef+g6j5
         3wQximxDBIfuUZ7Hye9TV9dxBoQBcnQaXK5uuj71S9GtI9m34KNU8AUFZwt+sGd6En6/
         NwKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2OJjZZ6JmBY953/KC+N7u6JmCvwQVmPbIhkoofKP3Gkqq0Bxl//gQL6Jj10J7kgm7vaFW0X+W2oO/iIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YweVnJScK/V5GlPeJxL6ZB4K4pq6qaL2YfKabepYUrEzf2uvPNp
	EQpys1fdxjVjAVml2x+618/FFiUlWHqgW3DTrRQkmo653eRKZwH96SMuUhUhR44OUb8Ejzm2tak
	aGlRZUg==
X-Google-Smtp-Source: AGHT+IE6o+GDxvYYDKjM66M41eSWNOGyDPF0TERhOYuWw3vwrpms5wYhLmIqj8aM36fhlBScuEhdO5teB2c=
X-Received: from pjzz7.prod.google.com ([2002:a17:90b:58e7:b0:2ff:84e6:b2bd])
 (user=yuzhuo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2c8d:b0:312:959:dc3c
 with SMTP id 98e67ed59e1d1-313f1c0c004mr2437852a91.10.1749859723377; Fri, 13
 Jun 2025 17:08:43 -0700 (PDT)
Date: Fri, 13 Jun 2025 17:08:26 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250614000828.311722-1-yuzhuo@google.com>
Subject: [PATCH v1 0/2] crypto: Fix sha1 compile error
From: Yuzhuo Jing <yuzhuo@google.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, 
	Ian Rogers <irogers@google.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Yuzhuo Jing <yuzhuo@google.com>
Content-Type: text/plain; charset="UTF-8"

This is a followup patch series for an ongoing patch series to reuse
kernel tree sha1 utils in perf tools and remove libcrypto dependency.
This mirrors the fixes made in perf back to the kernel tree so we can
use tools/perf/check-headers.sh to monitor future changes.
Link: https://lore.kernel.org/lkml/aC9lXhPFcs5fkHWH@x1/t/#u

This series contains two patches: one fixing signed and unsigned integer
comparisons and another fixing function type mismatches.

Yuzhuo Jing (2):
  crypto: Fix sha1 signed integer comparison compile error
  crypto: Fix sha1 signed pointer comparison compile error

 crypto/sha1_generic.c      | 2 +-
 include/crypto/sha1_base.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.50.0.rc1.591.g9c95f17f64-goog

