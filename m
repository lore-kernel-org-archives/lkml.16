Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420611EE7A1
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745220170; cv=none; b=qK1MJ/fkakMlxPQ9oiFGWcbdA/LvKYfs29DzrAa4kQHUi2nlJO02183HazVzdn8t5UpP2XRe8yIQsOJzw6q4jHISfa9vU6WxbbAmqEEJLTJqE4wKpOiXshL9Dnt2fgJMMjPV/eYXgEvrz4argTp6KURdrgM2KcxOQaOx5tYCr2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745220170; c=relaxed/simple;
	bh=oQ/uumB9dZEnQv7fbXO+2/DavkdF+8BaxTejDAZiJqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IGWYEqbV7Kal1HSybmI7DaRiqXdVSHzWMk3Q3tXV1YY43gXHXBAvdWxpYeDiaIaIpJLG+U2wObMUf3oIwDUG/jYcEOBeshLA8/Ur8AYvL58zWN56tuyJe+MCH7vPKVykkBgmpjJnAznbNGNUyqiXQhruLUmMNERtl9jVbNbusJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W1oWHbBG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W1oWHbBG"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22c3407a87aso55766115ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 00:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745220167; x=1745824967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Br+IpXn10n+9CXIhhXnelWYoEuJ5Sc8cDeYzc7Zl6Z4=;
        b=W1oWHbBGZ1ci59ZKo3ZlzpDDcDPhIvu/tUtzfp0L4G8paC2KTxNZ9ytj7DaB37vcBK
         bfMLMPRmwcVPPW9w1qqwp568mxAEEVvuLTcPclAbQCooICZsE3I1KYuzT4lcNrKbkA9K
         IRRek8cZQntTadSe9aMeDkvUPzf/Lbk91ZbbNnAij1Wg+gxMAoO7JmRSTSQnaHFuT+dO
         1UPOk4/ABwf5iBW1PiUTz7od0NJNAMS+rpPUZukZ97ZwFzprkJghCaj86hE9xD6NdUGR
         Eb2fKUiaLioiFlhc0f0Mgcr63vuP7oodrHwhwrs9/sARCIaBstVEHEJHKhwQ5whFM3qf
         kDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745220167; x=1745824967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Br+IpXn10n+9CXIhhXnelWYoEuJ5Sc8cDeYzc7Zl6Z4=;
        b=Kps1TJ5n80CY9kev4MTcs+b+BP35+AeqiHzKPQ4Cu8bIykqG0TZu22/eDA7n285W4G
         Z9iIDBlcAaOQUXHVO2zE3tPGFqnfkS5l28+Ypb98hbq2eQNc0emCEbvYEcoWUoyh69pG
         yGyetT5dV+N/d1XAztIsKcuCQLbInZBpseLSdg2MBnxxMobXcXFmgPvoKUrYtMgaE5xk
         k/CP1AAm7IOI+29YuhfbTjiZ/aIXTZxS4A+ixkeMkPr/8hF6CwOwqgP3xDTErMSH5GlX
         3MoEcEVLBKeADRMuhWqOzEakqJs6QKt1P6RBFU301xsALiFkfKtsTlaZ3d9ScAoFF9CM
         D3og==
X-Forwarded-Encrypted: i=1; AJvYcCXzWOqshnZ6qtAPjHVrc46ngeHscwZk5EE/YCwwvZ+X2NLwyZ9Gaa0D04WtQDM4HjmqvaUfwAprJnin3PE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc+Ok35CkfZdEqzb7wpZhzcUbwATEig1Dg9uzXJK+ioz/3Jw4q
	ejO6u2L9vSFdkDyQ+PBYhrfkqEk3C//Lyk5h/lsvtKemvgB+D0iBcQDqWyTf3Ac=
X-Gm-Gg: ASbGncvtl9cvhQO4zF41vkuv8tMe781TXq6syfcEnOLhdm8IJYujrtGKJ1RvxHCz4Lt
	g9pZ1MoZwxhJ3Zul5VhVxS4M2eEJbiPXvkcJqx9rcM2eL77qnvIouhvdnKtCZBvdwQaZVby3TIk
	8nAy2WasCicteXtYOY0jIU+YwfrGJ3h0mp7DI1JmhcfklAYWIHqQ6AE24jALHkhxVyA/uOd/z7x
	jm6wWAK869pzHsKV2/GwDOwSpYipS+xARu2pIyOhYWiexjkMF35ZQfodsd0GcWJSgYFZBq0+3YK
	P/NHkJCF2vj1v4VqX02nBAY1DTxe4xXWlxzvEzprGQ==
X-Google-Smtp-Source: AGHT+IF3+oCxTMMz+R3DrRhQUE2THmmZKmnz5F87I0hadILJtWNneQEBdeLOmXBL2HrlyI2RGFtiQQ==
X-Received: by 2002:a17:902:ecc8:b0:224:2717:7993 with SMTP id d9443c01a7336-22c5362062amr153799585ad.45.1745220167576;
        Mon, 21 Apr 2025 00:22:47 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb48a4sm59089785ad.133.2025.04.21.00.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 00:22:47 -0700 (PDT)
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
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V11 01/15] rust: cpumask: Add few more helpers
Date: Mon, 21 Apr 2025 12:52:08 +0530
Message-Id: <944ee57ad1b190f6975c739802b4d93166bd00c5.1745218975.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1745218975.git.viresh.kumar@linaro.org>
References: <cover.1745218975.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add few more cpumask helpers that are required by the Rust abstraction.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/helpers/cpumask.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/rust/helpers/cpumask.c b/rust/helpers/cpumask.c
index 2d380a86c34a..eb10598a0242 100644
--- a/rust/helpers/cpumask.c
+++ b/rust/helpers/cpumask.c
@@ -7,16 +7,41 @@ void rust_helper_cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
 	cpumask_set_cpu(cpu, dstp);
 }
 
+void rust_helper___cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
+{
+	__cpumask_set_cpu(cpu, dstp);
+}
+
 void rust_helper_cpumask_clear_cpu(int cpu, struct cpumask *dstp)
 {
 	cpumask_clear_cpu(cpu, dstp);
 }
 
+void rust_helper___cpumask_clear_cpu(int cpu, struct cpumask *dstp)
+{
+	__cpumask_clear_cpu(cpu, dstp);
+}
+
+bool rust_helper_cpumask_test_cpu(int cpu, struct cpumask *srcp)
+{
+	return cpumask_test_cpu(cpu, srcp);
+}
+
 void rust_helper_cpumask_setall(struct cpumask *dstp)
 {
 	cpumask_setall(dstp);
 }
 
+bool rust_helper_cpumask_empty(struct cpumask *srcp)
+{
+	return cpumask_empty(srcp);
+}
+
+bool rust_helper_cpumask_full(struct cpumask *srcp)
+{
+	return cpumask_full(srcp);
+}
+
 unsigned int rust_helper_cpumask_weight(struct cpumask *srcp)
 {
 	return cpumask_weight(srcp);
-- 
2.31.1.272.g89b43f80a514

