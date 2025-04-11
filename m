Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84C7238C0B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369145; cv=none; b=KYkdMyzzeYb4j3DEyvSbyGjlLFFIVo9lb8qlEmXSJF6gxGKtVfZXpXqYMxFK34qsMuaZpwiIzKLBhn2Lj6RsfGLsxaFmFF6B7FaAVM6wInjb0OMBDlQmfGvjgz1pOJs1+MtcSV08tCQV9WtfGNIaDPr77sRbBj55/Wwri35oSic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369145; c=relaxed/simple;
	bh=yS8zzoAb1gzolyqRZtRGFelUspFvZ1+mTbeqhW4yRic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aLuy7npchiUQ6WPRQaQe1bEC1XkzNeO7cNMK9/DT9shlThFCYRv5G+K59UiEUkYlzQ0B8vpC8g1cwTutBo0asYnRwfY+jqXq1kUSlFs3zk4HdC1mWoFX+AbShn7euSrEfo4XvlTruPCq88CfoivpJfFbrll0UtxWcYxmXPclA78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s4fL1QbZ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s4fL1QbZ"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso1786202b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744369143; x=1744973943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5QmLNWlEhMlbaeU7vUP5c8vKPIyuKJozs3WjW7NYUo=;
        b=s4fL1QbZ88rgE2W4qUliW4BBCp0K5GqKT2wjxutfN7g3pvg0G90uCcFWg7kF2M3KK4
         gbtQ9RjfrrGq+pomf5cYrAVSimECQdsT/SqA20GQSrDEQRUCfd1yZg3lPfm19cARug06
         m1Sg9hRV3eZyMIT4QOjlIir4OoZtWstb60/KjKcp3QL4UCk2ErJ30SWrrcJwAY5on+Fd
         iIaVakybeOZrF3bps/shhUUl5WZFYq5c/U/P+OkF+7UcFmJGG+VNezjpKieRhlukOCzY
         eMl/EtLbXfOC5wG6fotO3H5jDFtePU8nCeN9Hqrqu/Xg38EXOOK4JvgL7vUSFvKOwOz5
         te1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744369143; x=1744973943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5QmLNWlEhMlbaeU7vUP5c8vKPIyuKJozs3WjW7NYUo=;
        b=N1f+IIBM9cFogc5EONko/XDDiDxpNsKQTCyFCyI/Tk6JNyStrlqdzf1t0FDIT3tYl5
         pJojnYh46JAB/rZ/JkSKF0h2WiICwqE7YVUb7tKb81AeEyf48BrB2sm+cMFnN3jFyD74
         X1fDulbQbmtRW6IZxfpEvaFqrQG0mYgxFmeeUX612hVDmS0mTU06OTLdDLKey+J17ttG
         F3efah+cYpE/esJKMP7O7SQOQ3fN3hJ7b63kfLNsGu2LZL/E+EQRZ487KUeKg5rMlp9B
         /j6ZU+sCxcEtRstPYtbmI31KnoFJLnuR20iJKyq+eWR/Q4s64FU4YCULTjDiQJFWyHtU
         0IRw==
X-Forwarded-Encrypted: i=1; AJvYcCVBuR7fbWhnpRp8eCs5tgdrV/R8U5Mw1h0mB2TFXhelDpIk5hdVt2CFxQ55LnFt1KXPj6iSDd1xAsO9/0E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yynod5hq1GTllPFZ1vxd970w0uLCWiRxAc1KOVxLIxAIEoguiow
	Ys75WGgA4zYce7Pmfm9RgsZeGAfgbDbYd/R/wVa8aR+Lbh2z73xhZX9bfaJwhqA=
X-Gm-Gg: ASbGnctaCVb0NXC0QwW1s/fvCq55O/NI73F7NWXUqCWtnkmodD/8OACg065KGw0BtfC
	XagMcpTwexiPxsWguMiGgMpTG2SOAuVAbia0IolWWdDEofXzCjdm5ELg0HFmj/MGzuydkUXOpY9
	ZzNuf7gJq8ezrKLkqU3kiQ4mPDO0AhfyDgIsHXcws/Mjh0RvvYkviOpBzTafflLORStSy2JhI5t
	Fxq7oa5qLPa+iKJd/sf6ewrbyU1q5bs8r+HKXwAAy7FGTijstG3sGX1yjL+rBN030PH0O3HvjO2
	YCZ5+VktoxDvWBRlj0kLlAWVoVx9Gbc40rpeEiNtxA==
X-Google-Smtp-Source: AGHT+IE2OjzWyw13U8ckU/PhF26xnq5qyW/KpQps6B6mpDc5lX3qxmzsxgHjgW2+oCee8Ta27wiyxQ==
X-Received: by 2002:a05:6a00:1486:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-73bd126b973mr3107562b3a.18.1744369143132;
        Fri, 11 Apr 2025 03:59:03 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2334376sm1179973b3a.165.2025.04.11.03.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 03:59:02 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Yury Norov <yury.norov@gmail.com>,
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
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V9 01/17] rust: cpumask: Use non-atomic helpers
Date: Fri, 11 Apr 2025 16:25:00 +0530
Message-Id: <b092bbcc23529663b1a8b381efb85566453185e1.1744366571.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1744366571.git.viresh.kumar@linaro.org>
References: <cover.1744366571.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cpumask Rust abstractions don't need the atomic variants of helpers
for now. Use the non-atomic helpers instead.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/helpers/cpumask.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/helpers/cpumask.c b/rust/helpers/cpumask.c
index 2d380a86c34a..ae964cddbd41 100644
--- a/rust/helpers/cpumask.c
+++ b/rust/helpers/cpumask.c
@@ -2,14 +2,14 @@
 
 #include <linux/cpumask.h>
 
-void rust_helper_cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
+void rust_helper___cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
 {
-	cpumask_set_cpu(cpu, dstp);
+	__cpumask_set_cpu(cpu, dstp);
 }
 
-void rust_helper_cpumask_clear_cpu(int cpu, struct cpumask *dstp)
+void rust_helper___cpumask_clear_cpu(int cpu, struct cpumask *dstp)
 {
-	cpumask_clear_cpu(cpu, dstp);
+	__cpumask_clear_cpu(cpu, dstp);
 }
 
 void rust_helper_cpumask_setall(struct cpumask *dstp)
-- 
2.31.1.272.g89b43f80a514

