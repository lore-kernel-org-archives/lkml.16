Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79647262B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748324018; cv=none; b=ZORsnXQGXO6YmgmHzy0VPlKsN/Olc47HvQTp2rh6HnEF/oMMKJQmgOTRDlzE23Bm54UJg59HcW9o6IfuUhpWkbproBWkHgETWgVqy15gmvUe85zrAeyoa41UdnUMC6LTJhfPrJUV/EkCgscdkNHmREvb3V03VYPSyeCW4qvTMhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748324018; c=relaxed/simple;
	bh=sKF4zz/4/zo8wIkoons3Ms5WggyqYOdPqZb5QTOICR4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y0+/ZaHixKenl2OokyOm9jffCCXYCviWeyQlqBB5+GQey9ch2EDdqYNlFPTqgZuQgTHUXdoNf5e+pZzlOjSSp98Q4ug0Mz+h1reJOx+bwYMQqMfrPBakg8+SRg1nowDaA9H7yPRntv5ymICL+WV6zokfGeP4Lclo2FOJggL9fjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zgKDa09u; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zgKDa09u"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2347b7d6aeeso12620445ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 22:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748324016; x=1748928816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h8MeiKlq1phnPLJ3Wy+Q/bcsd9h4e9tZsVOSyiDWgEQ=;
        b=zgKDa09uJ6cQ42fPgjgWK5JeTlyHF6USwMvZ1zQm638+3clrDVIF+BJ5Kjx+vUoeA0
         4+xAV9VUrIsuCcGSgI88R8Qb3lI6+O/pkn+RThelt7GSXUGbQSg0UgatHlWzFB+LDMl5
         3hahH1FeJFlTS9HfH/1WLtXF0tpIx+5U27hedjtsF8HWU9vb9wZQlHaizOtHqxndLFyV
         l2ToPgOUNZQ70x6XYLiScKpb3RPAgUCWoGOUAHUFaDIG31iplX2hK3PzU/TR8Tqz6BQA
         AGw6+ZErAVX5oYNZJgD9LbHzjLsqI07aRmYXT974xtnYqLyJA3MuzmZBE0wSDNLmfQMY
         7kfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748324016; x=1748928816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8MeiKlq1phnPLJ3Wy+Q/bcsd9h4e9tZsVOSyiDWgEQ=;
        b=kidg05WZcYWThxGPHYak63u6XBi3JNeKNF4V79SMjuip6Wqwl7fjcsarLqUBb0m4cn
         L6Vj3dxcb1E6OhFPUbNcYGAluYnlRqCiZo+O+D/uilri+PkZgiGj44KN2q8ngNeEu2Hl
         MOC9rTvo6PnnpQh1z0OE37jMu/8KtkwpJEnpoHa2WgrheGdedRPQQD/p3NJBQ/mYYDt3
         SclkZnI/kHGFyF23ZhEWmgqHyyZXVMLixem+7kkTFdq6iBaEJlNx1LoevF+PY22Aepw6
         EqCz2xL/uf+QUkSBylbFhne4kCwsqA7hyFG4HV2m315YriIaNS3nlg0jQD1gurwq3EeQ
         3RQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVS6sIYuKX+UZ6hrpVsI6jFzkldbKz32ikhvYm0kVQhpGfupyZzmV34tde+gPrTMqnmEiThM5s5YrNY6zg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwARn719SnSQk9rYfyggLL1S5Yyc99QwCcT2Hkxgrw5RIGYLiMK
	iE/+ZqEsV28A/EjHlgZrz2jQZuseDCDLo1RIXvwbjKJaSdy2hqRJ/KnXrVzuxkfgrwU=
X-Gm-Gg: ASbGnct9H+3gfitwpdZaG+blGCG3Y/Wg7kdqv9xpdM010EeQpA5RAMGr9xfGZmeRZBm
	UZ1kT00JJryJ6Sfoh6312ddxnpd6aOTpbRNVUGOeFfKas8mAyZ0w0i2IEGe1vrkD1anHjS9OZ4C
	KE1JYV101QMFqVVou7fuxkxqsM9nxXBZ0yanHKBi38rQ+awIewPKnaC4Y4/fETDmoOZDEe+OxRz
	g+9HyKqxU1q97As9wcUxxW2DmpzD+oZWlpD66kqUmySGsfB4nE6+vb0PtB7+dG2raaKy/9wf/UO
	jOvP3tghmeptxGWaBqwmRnQx/RhYbYTH3QTHQV70OuZK/+u0j6v4
X-Google-Smtp-Source: AGHT+IEoBXhd4uJBmeZzJI+pUQ69cLynbx10Uo0njUY2UHsLd0QLG6xZBUS+XTdwv/Joqn/Yqnc6rQ==
X-Received: by 2002:a17:903:244a:b0:231:f5a8:173a with SMTP id d9443c01a7336-23414fe82d9mr155104945ad.51.1748324012616;
        Mon, 26 May 2025 22:33:32 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3110ee8f631sm5747169a91.5.2025.05.26.22.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:33:32 -0700 (PDT)
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
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: opp: Move `cfg(CONFIG_OF)` attribute to the top of doc test
Date: Tue, 27 May 2025 11:03:26 +0530
Message-Id: <9d93c783cc4419f16dd8942a4359d74bc0149203.1748323971.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the `#[cfg(CONFIG_OF)]` attribute to the top of the documentation test
block and hide it. This applies the condition to the entire test and improves
readability.

Placing configuration flags like `CONFIG_OF` at the top serves as a clear
indicator of the conditions under which the example is valid, effectively
acting like configuration metadata for the example itself.

Suggested-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
Rafael,

Sorry for the trouble, one more patch to apply :(

 rust/kernel/opp.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index c2bdc11f3999..a566fc3e7dcb 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -575,6 +575,7 @@ extern "C" fn config_regulators(
 /// frequency.
 ///
 /// ```
+/// # #![cfg(CONFIG_OF)]
 /// use kernel::clk::Hertz;
 /// use kernel::cpumask::Cpumask;
 /// use kernel::device::Device;
@@ -582,7 +583,6 @@ extern "C" fn config_regulators(
 /// use kernel::opp::Table;
 /// use kernel::types::ARef;
 ///
-/// #[cfg(CONFIG_OF)]
 /// fn get_table(dev: &ARef<Device>, mask: &mut Cpumask, freq: Hertz) -> Result<Table> {
 ///     let mut opp_table = Table::from_of_cpumask(dev, mask)?;
 ///
-- 
2.31.1.272.g89b43f80a514

