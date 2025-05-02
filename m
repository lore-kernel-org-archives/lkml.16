Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107EA253938
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 13:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191982; cv=none; b=TtCaDpanlwcNwVx1+2DHDncfoSpHRPIAKrwadfWOrSyHdwjk6Lc9yscVfbKTq3V66RsR3gA2D+aIV7cTl4HCDT5RICSwDtbvjiCe0mphFJHDuif/xUvElLPwkBgTxN1U5Cg7QM4e5PFWJdmtzPJTqZV5/bWZo9LXQMceyQt1SgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191982; c=relaxed/simple;
	bh=bL4r3RcaEtE7LLNUmRhz0ELoSWWsrZAkKfJYpkuZOeQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Z7ClOrQssHKJkGxK2P0Ggx6r7M9iApO7xS4bIbYA3oeyqhjF10lTf31kwDq6lvUZ6J5pBMI7b3DIeVRd4u3mCEyAxEFBWmEgh9Bebw3JTMBjvhZ1VwR8nzDhPBWV8mBUjBTNI9lfDqirkuy5efLrWxzXmdXHboLdQH6df5RDVDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N91vFl9l; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N91vFl9l"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d3b211d0eso12443635e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 06:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746191979; x=1746796779; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HIlPzAl1Ukk5a5YFIh0Teayej0XpzS5CbuohwqBArAc=;
        b=N91vFl9lmpEaqZX2zYLlbeQ/3Htf+lK1mChiF09fOkHr6jdEwgXSCWQuWf9e16xkA8
         yf8zdUuUXI7CPd68bqaXGBrGNv3pc8ZsBxZpceihY5Mg+AgG+QUZKEBcjwvrzXOGDbn3
         KGxY9ujSVvXpYk+9LJT4pjwf/9lWmn8018LOxC4eLWtndlWnLWwEEJl+z3FL0qI4FpGU
         h/drzVGguCmqn5P/PI1vEJYJ15sMj8iqnchrg2fFM7MAGFR/ULc7FoywO79Xt865WkaW
         yVZCj5bPvFkJlcXDnKrSzLTRtoWb6LxBJBnbr3tNAekf3c+Uy884L8QcMq+BGUXG2es8
         wG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191979; x=1746796779;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HIlPzAl1Ukk5a5YFIh0Teayej0XpzS5CbuohwqBArAc=;
        b=gWHHdGY3m6PkpN/g+B7CQ4G215+KTdF68+DvjMZubaSj9NAr6+D+9QZbeln3PSS2d4
         CsTS7QqBto9G+p59myFhTnSLCxpP90U3Tf6xM6j7UpaMdFtfASIcgez8wcnhi6mSbW7m
         eLDj8t3GmwrgEHoQs98zUF+0X9/oOR5LOxbRM4f9a8Wv/2W36bzvWaxnyY+nP8seQL+0
         BLfyuZfeIgdQlFHQiiOKN695lXgJz0LkB9jJ8YxG1n34R1G3bJUIZl55bCHwjGXh+ovB
         TqwQ9fCyjONptBhdb3U7304q2rGOXY9Mu0C8/n8i0TI2UekPhDq0nrybJfU5wPheMCIS
         25ig==
X-Forwarded-Encrypted: i=1; AJvYcCWh7KUFO+bkFolKlMuAi0O0LRRC6mtDtG4T568eYtu+hvbaX1tZFtvwCG7Oh5fDRsut+hFmV0badc/xxOs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6A8FwirccR6IrnMIsndzCxAP/koxWbPSS5g+8gPcOAZbxEZ88
	osiIeiBd/2QMK9O1oGooK/kN6AGeCTZYevJ7XRBzZTENWaqvdCL8REUuMIVh6OK5rJjfJsyaEsz
	Veebq46aPgz0Idg==
X-Google-Smtp-Source: AGHT+IEF6HhrM4ach3hLwMNcmYb7kO3InjylCGXQmvy0SvZ0U3xMqtyHLAZxrtfc3TAH+fkpC3IjTYOrytyngb4=
X-Received: from wmrn13.prod.google.com ([2002:a05:600c:500d:b0:43d:58c9:bb51])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:21a:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-441b72ed395mr46597735e9.15.1746191979505;
 Fri, 02 May 2025 06:19:39 -0700 (PDT)
Date: Fri, 02 May 2025 13:19:28 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGDGFGgC/23N0Q6CIBTG8VdpXEeTA5h21Xu0LggOypbSwLGa8
 91Db9LZ5Xe23/+MJGJwGMnlMJKAyUXn+zzk8UB0q/oGqTN5EyhAFhwKmlDTDofWm0iVsUowlJI
 zRrJ4BbTuvdRu97xbFwcfPks8sfn6v5MYLejZWCu1BWmxujbeN088ad+ROZRgjdkWQ8alqXWlR MmFfuww/2EBsMU8Y4P5M6KSZaV2WKxxvcVixsoIwUtrKzAbPE3TF6IK3DleAQAA
X-Change-Id: 20250320-vec-methods-adfa41e55311
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2195; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=bL4r3RcaEtE7LLNUmRhz0ELoSWWsrZAkKfJYpkuZOeQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoFMZjJPZ+uuNN9uAi386AFXCrhkm7b4O9zxIav
 SZnzis7BWyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBTGYwAKCRAEWL7uWMY5
 Roq+D/0axjbo6DFDNlDx7DPql/FLVnpv/aEdEmtJwNUpyU/avSKx9WSo1ZKIzkU02aX7MGj65Na
 5ZmZRKRCSG6/R6H7oDPO4KB8gyEktnus+GXOyYHtO2Er7pQ+euCDpjWZx0f2E55MWJC/QVq6OpB
 xGzpjgY9/oOY774shzyCrTYchZxdWMj9SofC6E2zG+olL0GwwzSNhKIntsQpByodS6h58Xl6Ywi
 NJd2ifR2QN1+1mtPh+s+LfHh+J/wGRQ5907IS0cEF/zGi/jbRBfc6VsnZ+0XcmBd3+xYLONeZ2p
 lAH/YJAie8VWwF6rxLMWSuw9rzqe4ggLY37Lmg/RhU0zGIRdjD2tqkvPC1YiUVszqc4r0qUILd9
 J6lITFMn6YPDVYqNu3iCIUe3wNCjIseOsi2YMuJXCvV5U+rYAMvbvDUghCNOaFqdrBEjcsDRmf8
 iSCXnlDX++HH9SFj8t3ALw5N83S2TfmizixtyKnh5DvCKmp/Gy8WJ34cMxabJD5je3mVD0g16e7
 AZo/CueLSQtPgc3Togn5NBWq2e367SVFunQklkQ2sh2JL8dhVWovlONa5RZ30TSB9qPt93MnkpP
 3ATOrPps8m1rAzSeYvLW/goSl4OSQne1dRKvcS5KEOb4YJnBYFodwlDe8L25AjJ3YMQPDypxwES 6+hGocp/o35vY2g==
X-Mailer: b4 0.14.2
Message-ID: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
Subject: [PATCH v5 0/7] Additional methods for Vec
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
Changes in v5:
- Replace panics with errors.
- Avoid variable for length in drain_all.
- Link to v4: https://lore.kernel.org/r/20250429-vec-methods-v4-0-dad4436ff82d@google.com

Changes in v4:
- Add missing ? in some doc tests.
- Fix safety comment in Vec::push_within_capacity.
- Add panics section to Vec::remove docs.
- Move self.dec_len(1) to end of Vec::remove.
- Add kunit test for Vec::retain.
- Link to v3: https://lore.kernel.org/r/20250422-vec-methods-v3-0-deff5eea568a@google.com

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

 rust/kernel/alloc/kvec.rs        | 315 ++++++++++++++++++++++++++++++++++++++-
 rust/kernel/alloc/kvec/errors.rs |  61 ++++++++
 2 files changed, 373 insertions(+), 3 deletions(-)
---
base-commit: 88d5d6a38d5161228fbfe017eb94d777d5e8a0e4
change-id: 20250320-vec-methods-adfa41e55311

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

