Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7BE156F5E
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 05:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748237714; cv=none; b=QUNWjrKA6eZ7b/wkqASFi64+GiGhqujF09JdunstiIE1nr3dH1sScM0V+ds1pm98pyuX2OX3CCHJaIPNF0Sx3pxgvPQ84VCoQ/Rj5lsHRoLQKdVJaE9sJVyhc4ZmQo9nNMbQyMRMPFABvs6edeuQBDP3oyCAiuWG0fsEU3Z1NXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748237714; c=relaxed/simple;
	bh=H0+WhDUcNKkbGapBRoI0Xxxi+jWr2MzxiA0ug1aiUiM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ASVFIpPo3fmhfbrCAcGK50k0B/cwFqrV8vNNVEuhV/dYCrBlZcFblkNcikZm25O+N2Lx3u+ha5e7rxQUgG/a3Pw3T/3QFKSgAbJHZKmo9Lwg7ZVdqEI4NerobPLG5UlnTxyh5Ef8iYPhBxpuT9TV2phv6NLVf5T68yQAWfxLMTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dOlSzZq3; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dOlSzZq3"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23229fdaff4so19941385ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 22:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748237712; x=1748842512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VH2/AcvAgBKUfR7WHrs8FnBZffSGIY59wg2ntym2dZI=;
        b=dOlSzZq3hwMwfxcS4vK7JCsoIEFtMaC5xlwjmCzP705P/Ps27K4TUvSjAQAZbFpFQd
         1kaSo/4yDCwp58JTe4SsPeJaKPYabWj1LPU/cv9Aal3u7zKWIEb2NfRrNEHzRPD46nrr
         4CJq4RDQUKgXgbb6uv0o59dSa8wMKQKJAd72E1Lpjk9yioAiteOkosKYeDa7ujuRmUYs
         mfeV9EAF1m3HCBixbI3ELpyxfzSKS9KXEOx9qEn1DU4pKdxaO7yybZihAy/TjOrEP2r8
         TgoVtCgM4hcDNTG1gGOWDmdaJEfZVJsOXUmxyF+Bdp/6RXQ5fDb8kuYXiqhfZjkqDlTP
         bjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748237712; x=1748842512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VH2/AcvAgBKUfR7WHrs8FnBZffSGIY59wg2ntym2dZI=;
        b=atKtPz4piCcHD/P41I85X0hlJ+haDAd1bl/YThdMFgjZUhTjtjZz3yrIBaEQlB57jg
         q1bdXaanovzSykZwf3u5GlmYWWdwFsESMyhFn1dPHduUXhoiovrWF1Wk98jmaiYDP/fr
         XD0sWqO/OB119Ts8Dq0/NSHtf1RtZRXEHWFgD7oSeaMplI3AOqV3rGQNbVpY2/DzmrpK
         US/2aObVuXAqwM5oUtkeYoxqjBX2Ob1RqIu0hZ2HVX12rmdluCBc0NGNjNwFCWGJTrDn
         GcYCTHOQS1HGBafr1qKETCU4/uZjiqyPa+AobWgr7r1JOna0Wv6bJyXiiCXtXCWDEt5i
         s+LA==
X-Forwarded-Encrypted: i=1; AJvYcCWDKLRcYyaaPmrCIAlMwJ5GNJhxC5BqFZ9aJBrPii125KYvuyj6+6ZuFM0jG6i9EFe4U1kuzd/++p2Y/G4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzF4RBSw9rrrwulZ+wsvXSE24SHD1W0QVzwpiLpvQdgIKUgy+Z
	Y1kpxpB3fWASOVI3M06NEntkXKBZo7wk+g6wuSVasEtdQcQB3fAWnpTPDhW/0+huxjg=
X-Gm-Gg: ASbGncuU1A1BPvvFQWGxoHLq1Xx+YyYF/S5/fknmNPgB1AIyZG35XaYmrY9Lc68/DAY
	eQnAfmAWWV18kIXx9hnOufsXrosCUGXs/kf7IGZeI/QeggDSR+tsokpsZUKLOcn9tdHnHveHVTK
	U7gQgVrMwotzVCAsRurYhMQktBfZkc3zAEIe6K0aPkZ197ptHyvimWeVDEJCrbZ8zsB5K25u3wo
	pWqwI19d7IMqDCcFnX3iJ/tpYqQGOqAv9RR7DOE7r14jIdsvj43IgvLZlO+ISbzO13MxgF2tl5y
	hJBXEkNOs6pCcKbVo1SwL40Xi9m6JXFatPk7WT3LAMmNCOwzz9/QMx3Ujlx6p88=
X-Google-Smtp-Source: AGHT+IHinl9wFGIz/jsNy+zLrUyY4TiHvUrwrDfwtmojE3cGhsYguIkcm+poR2ISccO1zd74L+WiNw==
X-Received: by 2002:a17:903:2b0e:b0:231:f9e3:188c with SMTP id d9443c01a7336-23414fe83cemr113628515ad.52.1748237712047;
        Sun, 25 May 2025 22:35:12 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-310f8faa31bsm4620782a91.19.2025.05.25.22.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 22:35:11 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	kernel test robot <lkp@intel.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: opp: Make the doctest example depend on CONFIG_OF
Date: Mon, 26 May 2025 11:05:03 +0530
Message-Id: <a80bfedcb4d94531dc27d3b48062db5042078e88.1748237646.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The doctest example uses a function only available for CONFIG_OF and so
the build with doc tests fails when it isn't enabled.

  error[E0599]: no function or associated item named `from_of_cpumask`
  found for struct `rust_doctest_kernel_alloc_kbox_rs_4::kernel::opp::Table`
  in the current scope

Fix this by making the doctest depend on CONFIG_OF.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505260856.ZQWHW2xT-lkp@intel.com/
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
Rafael,

Please apply this directly, if no one objects to it. Thanks.

 rust/kernel/opp.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index 212555dacd45..c2bdc11f3999 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -582,6 +582,7 @@ extern "C" fn config_regulators(
 /// use kernel::opp::Table;
 /// use kernel::types::ARef;
 ///
+/// #[cfg(CONFIG_OF)]
 /// fn get_table(dev: &ARef<Device>, mask: &mut Cpumask, freq: Hertz) -> Result<Table> {
 ///     let mut opp_table = Table::from_of_cpumask(dev, mask)?;
 ///
-- 
2.31.1.272.g89b43f80a514

