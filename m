Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703434315E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315558; cv=none; b=V3eX6QQ3g/HKk6bYoyPLA9SR/5QvM6XwwhiKJjRotAOkmrRTtHc+UnmhQsfJALEJmeL8i+GptjSiN5SEWRSZQLNfj4GV91HsoxQry1GJ877u85BtR+YUvA80dgiFMVei+TxZbBHTE/8mh5kbAlEorUFpAVi7lgZKVUx2GBAVgTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315558; c=relaxed/simple;
	bh=Rewe3XViB/QkMyD9af8Ut/nMVqYDKYqeV+faE3RMbOA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=YH3VQBiS/SQj73bvN+zdlYuZtDfbyhSJPE8s9Myihohr2w20XteAaKHrPSXDBlB8P44dgIpHBz2aMRawi/5ngzBxBpMUEyzoaVrPA/fXpHwOVRL8ZdKhiSuxuSrH7YVApsb1ufigt9GujtRPj8e2lPjKbZt3Nq7EOtMrQ8jK8LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xg/kbBy7; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xg/kbBy7"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so23186315e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745315555; x=1745920355; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pZUGG5Du0vITtGfdUSROTg1jYJDzZcyCl3pmhvrIvIM=;
        b=Xg/kbBy7eoPF6UgxbdElZBkMtGIHJ98n5zwgiXBDvZMC6qAKBWZHFUnZVIQbiilsmX
         cQLo3i9EGWVoaXH1SjoCXjpxrZ707bFKbbkpJdi7m+zclioZFrYrJXAubJhMx/1pq/+Q
         Cx42wleNoBZR2WV5f6uAtQ8RsqkAVClalrcToPmbTXz5BlhH7QnQ2E+KqbR8P3ExPoPT
         rr+fvieYO1YslGflWoXP+39IMwz9MFhLb0vOJ7Y81PNRmfE2WeNm/zQo3ycNjmPRRSmt
         CWm9w8wdeN4lLXJOl7aOfxwgaK0ZaKJZQyUYvy0zsHl19ztxZ41W8rkAQ39HfczSVBE0
         95Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315555; x=1745920355;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pZUGG5Du0vITtGfdUSROTg1jYJDzZcyCl3pmhvrIvIM=;
        b=OgBAHWEiHAYmiyHNU15c+zx6IJN0hiaEc0Ox49+A0JUQnRo0L/30wOEzQC0A1V5dHn
         o955lotQhvjLFHXXKeU/dHKWMWDBvDKxdVKT5j2MSMWNFgHQ+eDI2XLB5f5TDi6278ol
         fhvcbFRGS1Y4rfuqXAzukUNRcqvRjFq+JjkXlxkp4CCDkL5FaXbyX84LJGrOMEp1PBFy
         EyO6eJSn1yO3u1B5ji+I/6BoUHXOpkZEjk9GM3EQiRzFHszUMWWG8Z/PdG6Si3rAF8H6
         6JbCsFUxJ4xKOxf8MCWBMCZUMTvxHBmwL6a5iIO6+A2BxZCsFclBIsm8XmGjTzL9rFme
         5bQg==
X-Forwarded-Encrypted: i=1; AJvYcCXYMp+yUR+Hh1IH2VbUJ3VPghrclRL9vUul/vBYVmn9KqvkirLXjXyofESoxGaPvIl6TLoCpWP/e1kCXr8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcJvUVuy9jpeKmFMwEYPereCowPbtOAx1c24v2lLeThCTjhAyr
	8tqh4rKyd7RnbpYQs5Ix7s45KfQgcFyY0RYF3l7t6iVN7IooiKQeTCfp9hJiSy74Wgf69P9lZ6n
	TAeDcX3NFFIg+Bg==
X-Google-Smtp-Source: AGHT+IF7rPGCUG35yrlKbfuD7XCFGfGNRFOEC9fiEZqezL8UJPbVupbTHCtOyqtaEcViH6huePbYdR5pb2rC98c=
X-Received: from wmqi4.prod.google.com ([2002:a05:600c:3544:b0:43c:fcfd:1ce5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e52:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-4408efbaebemr3357905e9.26.1745315554833;
 Tue, 22 Apr 2025 02:52:34 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:52:15 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANBmB2gC/23MSwrCMBSF4a2UOzaSR1OrI/chDmJy8wDbSFKCU
 rp3044sODwHvn+GjClghkszQ8IScohjHeLQgPZqdEiCqRs45ZIKTklBTQacfDSZKGNVy1BKwRh
 U8Upow3ur3e51+5CnmD5bvLD1/d8pjFByMtZKbbm02F9djO6JRx0HWEOF/2K2x7zizpx1r9pOt Pqxw8uyfAFWR07m5AAAAA==
X-Change-Id: 20250320-vec-methods-adfa41e55311
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Rewe3XViB/QkMyD9af8Ut/nMVqYDKYqeV+faE3RMbOA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoB2bXjivAC+hJGYr0fbMwz03aFPH9W3gbQgAfx
 IMHKiQc4SSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaAdm1wAKCRAEWL7uWMY5
 RpsqEACm3KSFn0U5qkFH1+pVU2zeWkhlYg2JFcWw0J6NtPwzkQ9fv8p3/+WOnREiTEmN+17cBU/
 K6YWQ4JvXUSJH4d8waPnwy9Ijzoy2pr1jt5aOEorXP681uDG4SSCOewnW7b6HpdDClNlPpQhkY/
 qP+WUD4KRn0fNzWiqn7OoUus/cPAlBAXnc+SDXdbn8IGujgSBc5dEtKkc0w/IS6tkUIx0ixidWT
 FL6+Pn5F8axPG22r4/TbMotphksm8L0vzT7Rp0ONC0EU7Y+BD/yqOAJMDA5oSmH83gzfpzHgplk
 lB17x3S3144bRbp0lmE6yNt2xHfhWnnPElWLARnvcZB0n2bSI/YyNJCP+e2La9TH13biKgO9H9f
 kKhc0kRlmlqnFHvaBsI2iJIRA0rdLNw7P1MLiMwh8x24+kvri6vl1xwN7R7y0O20i7YV+2kNrou
 MxGgJ4svIL/G2xWsW4F/eCxie+wkQONIbNz8584QJYKg2+W9LansRwN14oRLwBDrv5k2DKb0aYZ
 A3LK/s0UCW8p+lD27NuC2UFU5J641FU6a5jBxPzMwn0OSr28JjSZSbJ8b67QQF2wEst2W97Z9ZB
 v60Hw3RmniTCGdC6cwwaSvKOx/xMWQiwTVETcnL9E2w8zOVPyGpg0rVT77dsiGFOlZrHJunVZ8/ /ZahLKoqGD/ndgw==
X-Mailer: b4 0.14.2
Message-ID: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
Subject: [PATCH v3 0/7] Additional methods for Vec
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <benno.lossin@proton.me>, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="utf-8"

This adds various Vec methods. Some of them are needed by Rust Binder,
and others are needed in other places. Each commit explains where it is
needed.

This series is based on top of alloc-next and rust: alloc: split
`Vec::set_len` into `Vec::{inc,dec}_len`
https://lore.kernel.org/rust-for-linux/20250416-vec-set-len-v4-0-112b222604cd@gmail.com/

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v3:
- Rebase on split `Vec::set_len` into `Vec::{inc,dec}_len`.
- Various modifications to work with inc/dec_len instead of set_len,
  with some Reviewed-by's dropped due to this.
- Move push_within_capacity impl into an unchecked variant.
- Link to v2: https://lore.kernel.org/r/20250321-vec-methods-v2-0-6d9c8a4634cb@google.com

Changes in v2:
- Add two more methods that I needed.
- Introduce some uses of set_len.
- Add example to retain.
- Simplify pop.
- Adjust 11 to 10 in push_within_capacity example.
- Link to v1: https://lore.kernel.org/r/20250320-vec-methods-v1-0-7dff5cf25fe8@google.com

---
Alice Ryhl (7):
      rust: alloc: add Vec::clear
      rust: alloc: add Vec::pop
      rust: alloc: add Vec::push_within_capacity
      rust: alloc: add Vec::drain_all
      rust: alloc: add Vec::retain
      rust: alloc: add Vec::remove
      rust: alloc: add Vec::insert_within_capacity

 rust/kernel/alloc/kvec.rs | 241 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 239 insertions(+), 2 deletions(-)
---
base-commit: 1569d07593b986b690eec0bd85a632b6712f4c2e
change-id: 20250320-vec-methods-adfa41e55311

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

