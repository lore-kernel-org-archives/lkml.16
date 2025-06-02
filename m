Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773261474DA;
	Mon,  2 Jun 2025 08:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748853288; cv=none; b=cb59rBC3vWStf81ys0YDz/1Qx9HuKUfJy9n6Bu++CGRso96nu2JCS47hT9cjZGOT2lbMlfMp77z1EnXna0FR5LwAwASWZ995cWIE79Tr6DN8Itkc0zptWSrFI2y/gTbRF6Rsy/imO+A4A3ImEHxafgc+T5UaAjLgGmDm7gqQ7JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748853288; c=relaxed/simple;
	bh=J0M3jyHJqytQ2fRxhIn0EzqB+KBXvL25DDYU1JG4HoA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=muI5LP3KeaW1KDN7FzAA2yKpCZVe3ln+E4sMdZZLg47IIlAmDbvdHsDKvJ2RUR4LIMycPAWiEcOCsIC6+W9Du8c4tY8vzrug+tKLO02rJWTnr2P+hxSWJr15IXkz0ylU3TOvtYuYp7UpdbvCSJvU33tLZ5J253ZoVZJS9xWBkfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izVHQ4IU; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izVHQ4IU"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso5208193b3a.2;
        Mon, 02 Jun 2025 01:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748853286; x=1749458086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uk1R1JyhCIe/fQRvoiM0DWTwBgVcs7kTPMVdocZRyaM=;
        b=izVHQ4IU6ttTXwkDqtXrJlVtvMXzgw6ZaYzxdBgffrmHIXsiWBBXss1HqjeqTEUHSl
         QxKYH2ciN+rJ9pyTsz7Yadi0nEdwmuTFg03Ton6W9FJOePf7tWCkaXPcKywk3izK7rrB
         kvdEL5z62SMxRMFlefdGOlzDbe7qd8G0M8WVGakvcaQ0ljV/YXKcg4SODdtNmABnKGss
         0jS+mgHBsht77afKEznC7ZJ6BygPaXQZ2cn/GSzqN2174A5K3Fy4yIwPBqiz2Eqz58vs
         9XnKs1r6ghyqayRjg848NUBvpxWXHwldtTBw9D0dGGyCqkTbXDy+jHprgULKYGztnL4y
         fMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748853286; x=1749458086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uk1R1JyhCIe/fQRvoiM0DWTwBgVcs7kTPMVdocZRyaM=;
        b=r5Yb+gBfk5ZehW/A9YnB/taE4EbceVOxPbqPcXyuYWKneiV7+soUB3OY9BnoU3OXcm
         +VF1+60vUGcxa/QgULyH02DNm2QSFn2tQ7s5jzc7R12oOdyVDtrkLUIvwgk6rv+1Ade7
         byrjIjWZPbJcRh0QOg4dl+5wVR86SnwVHbVJLH/Haw9rhWfbXUQOJpvH52IxPAlc8JnH
         TqmEqe6qFV0+3GtDbpI1viRz95Cy/pHxNHYQsajQnrXUDhy5q8IJDaBROhp2YPHT9DQz
         WR+41NIJLLi7UTKXkIKIPcH/RyGi0/oh3O+14MLzvH9lh2NZw2fhKgEX0FjH+ZyjMC38
         0p2w==
X-Gm-Message-State: AOJu0YxV7ZaUwXLACERxZdXKeKSQ5XKTXogdBVlilu8N3a4RyiCQQj7j
	8AAFEYG7fsMyM7FExmVajUoeyOGlV2BNFmdSDufegQxhGgdE+aUpMVvXH+1aUmlQYP8Iig==
X-Gm-Gg: ASbGncs5U91Oir9oYrmlMhAUa7l7oJHQf3BOoPZOby0oVbodh+xhukw6IK7+ChTsyZ/
	vBW+kWyqaMgbLTjsbWZ5H1hLXcHsgooZXMdBvOtYhPlmOzLc667yFSH3XBb8bArUi3plGuWLngn
	lr2RVEwd0B1sIoUfKFDAT3PJcSBCkbib1Gu/xdJ55UqA8kZf69HQ2+k+AUE37YbHTkHmsMLk1dR
	vEK5O8sg8+RLp/c95r49/hcaBrqWZY9po/5ReSQHU1f1GNPN/MLr/0y/LFqPzp1W8rW2cCfw8b0
	5HzzqQfsqD5fsw2HSw8Y2CD6/xvCJWH1pOiDUxaytw==
X-Google-Smtp-Source: AGHT+IEbVb5ocQumAcWvPMi4UZGbZ15BBhbTJ6hJC2hPqqZwe3KERujm/wa0uH1aU67X+MCsr1/tIw==
X-Received: by 2002:a05:6a00:148d:b0:747:bd28:1ca1 with SMTP id d2e1a72fcca58-747c1a1f6fdmr16951983b3a.3.1748853286529;
        Mon, 02 Jun 2025 01:34:46 -0700 (PDT)
Received: from localhost.localdomain ([2409:40f2:11ab:2cf2:10cd:85bd:e95:5230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed33casm7099687b3a.73.2025.06.02.01.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 01:34:45 -0700 (PDT)
From: Sai Vishnu M <saivishnu725@gmail.com>
X-Google-Original-From: Sai Vishnu M
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	gregkh@linuxfoundation.org,
	daniel.almeida@collabora.com,
	me@kloenk.dev,
	Sai Vishnu M <saivishnu725@gmail.com>
Subject: [PATCH v3] rust: doc: Clean up formatting in io.rs
Date: Mon,  2 Jun 2025 14:01:20 +0530
Message-ID: <20250602083119.17752-2-saivishnu725@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sai Vishnu M <saivishnu725@gmail.com>

Removed reference to internal variables in the comment of `IoMem`
This avoids using private variable names in public documentation.

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes:  https://github.com/Rust-for-Linux/linux/issues/1167

Signed-off-by: Sai Vishnu M <saivishnu725@gmail.com>
---
 rust/kernel/io.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 72d80a6f131e..41404c1e17b3 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -43,7 +43,7 @@ pub fn maxsize(&self) -> usize {
     }
 }
 
-/// IO-mapped memory, starting at the base address @addr and spanning @maxlen bytes.
+/// IO-mapped memory region.
 ///
 /// The creator (usually a subsystem / bus such as PCI) is responsible for creating the
 /// mapping, performing an additional region request etc.

v1: Used backticks instead of `@` for parameters
link: https://lore.kernel.org/rust-for-linux/20250530123129.31505-2-saivishnu725@gmail.com/

v2: removed reference to the variable entirely.
link: https://lore.kernel.org/rust-for-linux/20250601164939.5306-2-saivishnu725@gmail.com/

v3: Moved changelog to commit message. Used the proper parent commit.

base-commit: 7a17bbc1d952057898cb0739e60665908fbb8c72
-- 
2.49.0

