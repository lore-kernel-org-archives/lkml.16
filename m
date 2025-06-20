Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A860823909F;
	Fri, 20 Jun 2025 21:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750453565; cv=none; b=Emf4KleOpVTKsd+FX1iFDqiyCM6WnnctjLtsnLw18o6AZ3Vz9TrsY7PWi6fO2sFoYEoW/yzJ+i5vQiMMInF5/eBiRgbaK1UUn6NS2Htoq0aOxtwYQYzyYg2QjA7Vni/yoakj6Koi+aGorI+S22nsIJYtvsVFJO5BHmdSDyeiMek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750453565; c=relaxed/simple;
	bh=rNlWtuR8c7x31Q2t55QMyJvnaO5HTQtXqtdR8NIKeOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=txNGAKVz6bBLFLxedufBUPF35nzFaEAO7GvjsGIBxBH4n/rG37Dd1iqNB5bbleqreK+Az+KWBw8PjFKJYBzCGFxiLWdy/0FM+hBl3RzV347Izx4sU9c+tFqMyg4tRuCDJ94sUptUuDRnyHXLuSd7Kgjs75V+RVzisYxOZZSLj6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTE0WhzL; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTE0WhzL"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2e541e0b974so1538734fac.1;
        Fri, 20 Jun 2025 14:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750453563; x=1751058363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3E60FYUUWfAZf8u+QDWDPe5xu8ebDGQOiJLbxOxa58=;
        b=RTE0WhzLwpULheUv0X3b83n1Cr5zXpm7q/cnV3cHnok99YqRyNdfINwCXhirUF214d
         PiRpsCOk9sO9okX3C8CX5ABrKaU/uvlGNK+C+1JZMtyaFySPfNfZ7Ur/lfNnbsQXPEMZ
         q03KD0vbA9hWrcCqGkvVwQ3deUHDGUKEh/hLB1NJzrtRxtZEhBdV8UO53kxcCPDTUWW8
         lSTfsUtZWmYA/6JOKU9hrIIXQeK83DO3O06eDb0SmTf/km0daZ87PtJ+jQe1SFncKvhd
         bC3x+ByDJ96djF4QSjISudio7Oyzo+MsRtOeK02TWnJX/BQ1NW+v2IWjYzYbOuAcv2O9
         Bsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750453563; x=1751058363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3E60FYUUWfAZf8u+QDWDPe5xu8ebDGQOiJLbxOxa58=;
        b=N7mkpU5uzJyJq/H6csBeZ/yLgKawO0G/6gZYG8T2JGeMVvu+iSSlrL/QXxB+EIkUFp
         1VrY+RCTb26/cSo85l5zDaPtoU9+5S3Gm72nAyUZrgwE5/5jZ6e0irwuNXOBbPQ7is2R
         wqdEyFh14bU3p/ZQiAYzv0JMcPwKKGBs8OTQQjAzgpv6D3W1lv5GcgUE5ZWnQCk1/kdD
         td0GNqXxNG81/ALJS+hshyZkjUb0GxEe+IVuW1/iSPMwpd0QcIuLEu6wbDoqT4dTF5zR
         ketut+8yrgbot0trL3kbryWb9hrU3QBlikluiUz/ZmuMQFqz9lCL9VIhcZq4nM1X0nRM
         0vxw==
X-Forwarded-Encrypted: i=1; AJvYcCWScSllRKnYo6/dxlKPMCzyWOCTxnBt2JkQL3tWrZcETkhHoo0APz4nyswqths7wcTMQ5CqyITVCciUqsg=@vger.kernel.org, AJvYcCWdZ40RP0EYAR9HSwIuOxvxDFYFd5IPOYL4lZGYu0wLTPlbvR+9wD5Vv5PmM6vatPmhK4AsLfHRVXFJEqNeuKc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm1vAhfS3fNj3SSrX49x79fLhj5e6rt04hfF1WLxkatFKQh8O3
	Q1vpTqm9pDbvo4exUug6UJqqyasQ6Yklhq2AwuFneKMTNnyBiZxvvjmq
X-Gm-Gg: ASbGncszrmqaFKroGLUv16qA12CJXlxRfd5MoGNYjaRO8pZDbBA6wQntrxOg9nmc4WR
	SgXl0obBqX0OLzsZpHsuqdZTzM8lfmxOxgPr9QcCbJC4LSu/SB+15UOqaO9fRnoun1jlRbxM6e2
	OGyVuDezubyQUmAxzgBB+Lw1JUFbN0VU6vqDyJ+ybepqXVXDijSRNybppFODG9C6B+iPPP/I6Q9
	xsPDXVUAEE0D1eevo/kG9C/OLBeW60vyMIjNPRhbGpZxBjR9V5UXnpkwoOKYWC+0xjV6pgdb845
	XbAUoOfMue6aGKpNde7JpTSRLoTEGcjm3wVkTzIjOb5whAxt0UHtjBil36fnP1swB/syOBB/iwk
	fJHn1qqsfkdGYBi0DbESi1rkLwfRrJpC17Vm8f8w25Cme
X-Google-Smtp-Source: AGHT+IF2mz/ImmHs4vMwxeTZnzIQirDaYEcwVTXFvUoKupjSurhgt5RxRvjzFbqT17Ii8gXc/U1o6g==
X-Received: by 2002:a05:6870:8196:b0:2c1:4090:9263 with SMTP id 586e51a60fabf-2eeee8698ecmr3701545fac.35.1750453562689;
        Fri, 20 Jun 2025 14:06:02 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net. [73.76.29.249])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-73a90cb7875sm460596a34.56.2025.06.20.14.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:06:02 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: jbaron@akamai.com,
	jim.cromie@gmail.com,
	daniel.almeida@collabora.com,
	acourbot@nvidia.com,
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
	rafael@kernel.org,
	rostedt@goodmis.org,
	andrewjballance@gmail.com
Cc: viresh.kumar@linaro.org,
	lina+kernel@asahilina.net,
	tamird@gmail.com,
	jubalh@iodoru.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 2/4] rust: jump label: add STATIC_KEY_INIT_FALSE
Date: Fri, 20 Jun 2025 16:05:31 -0500
Message-ID: <20250620210533.400889-3-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620210533.400889-1-andrewjballance@gmail.com>
References: <20250620210533.400889-1-andrewjballance@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adds a const STATIC_KEY_INIT_FALSE which should be used to init
a static_key_false.

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/kernel/jump_label.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
index 002cc3bd73da..e30db2d06c76 100644
--- a/rust/kernel/jump_label.rs
+++ b/rust/kernel/jump_label.rs
@@ -72,3 +72,8 @@ macro_rules! arch_static_branch {
 pub const fn bool_to_int(b: bool) -> i32 {
     b as i32
 }
+
+/// Default value for a `static_key_false`.
+// SAFETY: a unlikely static key is always zeroed
+#[allow(dead_code)]
+pub(crate) const STATIC_KEY_INIT_FALSE: bindings::static_key_false = unsafe { core::mem::zeroed() };
-- 
2.49.0

