Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E951F4191
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749466280; cv=none; b=AKsU9BGzsMklAzQ14Ir41jxsYYIZAoZeOWXG9BLqvdAeAj7bTdrXCkTweoZR5BF8SFGib+/me7UVLnUvB0rfpTgNwq1kbU7EWgt+Mqpp6qm5S8Agr38YYc1rh665G71obkfCnmTkK1X/kgcChrpjP5h1Cw3si0BwTuKwym0cN7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749466280; c=relaxed/simple;
	bh=WScOWAsVXiVAuzqdP7jM4l6xzCqSJWapHcMjtizWvzY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mLFRx7LP9qLOO3Nt6qa/wgbhJO5hXC4nH/MYBuZsoaIkf52V176Of4xVJez4b14X/vXYbRvmNZdLg6+MJoOk8U74C8bcvPFKI8RBYVArjUkWdwKohwlgiOJpwrzBCV7DsKA8zbspixw6qrOnhxPp6jOF5q0kJCJAv6dJJKqzQZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h+T0uPqL; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h+T0uPqL"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22c336fcdaaso33046355ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 03:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749466277; x=1750071077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JZ5sG/zLHPPiUy0YK+tVjWFK+dG0iuLD9KI2Qcyjs+A=;
        b=h+T0uPqLLObp04iJLA8lZmi8USpfnRB1DJLEjUBU+x6sNuzk4v4tcGVXnOIJrvItxi
         +/bbIa0+cKrKbG5GwbiW4JCfDs3qSB6ojxyg4GTnZzTcVOA/8ebBdcNByIwzjFC5CMXj
         tk5sgUIj7dy7wcYtkNvklpO/PFw4mTNXz3tzflaRGs/q7wovPUqDLwnox58Ixs8hCAqI
         LMDpCRRw0DmzrWWUalhKE0bb9z+Bti31KweDnwoW9gwvcFkxzMfyJ7v6gX4plIsXWhVJ
         UwWIG9w/amE4l2CMQ+3jpDIXGIGNx2DSCAMMH2dhu6B0MxSnORyRiD/iL0/m8ZicCi3j
         fAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466277; x=1750071077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZ5sG/zLHPPiUy0YK+tVjWFK+dG0iuLD9KI2Qcyjs+A=;
        b=ifttTYafECQJbStYy2jJ4z9Te0EUKpmnnuae7SmvKrcJZspYnk1Tjjk0KIvHXHl4wA
         rfAE4SS3gAwR4hwcFF33R1PiZHFlVz2BjMieKnFjZJiC4Llst6VbDsdwM8BWnnmIaDTv
         TCUt2T4zL8VREAGmtb4uhTmovJdF8fdI5oUoV66BPkHUc2SFr2535BojJ5FNI1bPz5Ne
         uUZwbt2DHBGK5PJi2r6MHyyb5gDufg3vbX7TJHtX5zzNJJRre52GIClpbcjPMDXb23Fm
         Exg/D8NHeyoJw1lVUTsJtgNzg3g05cKKyGJBMy99GouBjbcRc/hApyesc+q2Z/2b9WEf
         o6Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWbgQ1EYRAmN8eDf/c6jwFxMUrNk5LSxKy0BzOEvw2HhV0a3hHnAvJyITnb6QX3zUQugAQX3YcOxZvNjpI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJMXsJX7WI4nOxqUdSH+J/fnmNbu90yNz5zomwZyktX3OKYV0+
	A4FxEnDZnJ9/IAwDAtYwhBuRP3fb5lbM5/sdiLx3vTRAT0qdU2sYWeVBqnQaIzalHIo=
X-Gm-Gg: ASbGnctsnjoOQqyAYlpFC3uf1QgvLhso3fYzFftsFB0B9RzCn+YzrRqX1oblQnfFdhE
	QJkFqskUqx56bv/dOaEj5MtQCzXjbZDgHE0IYypGd+OrJy29XZYS7SdJaUMtvXFI5Olfe51z5hn
	+ymM4PySCp25R8weBg+HiLTkemhpPC3lA/blwNkUhqBfc+GRfZXmWruuEITt9H9ItQnVdhIM6be
	4hL/qlBnIM4cWdLVN+zHfNlymvATPGJ+lo/lOzRay4yOQ76KLq+Z5Q5z1uv3KWurmaP+aMxohpB
	7XKRKYGTn7KWCo7wHTBLs8vfBUHSp88e22guROe2jS0BKd3MVWXUWbfGU9ZUZxC7dEO6CmOp8w=
	=
X-Google-Smtp-Source: AGHT+IFPLhDJIesMz+ycULTruk9Mgl8DhhtXvrP8fol6pf7LI+WUMob69Spuj6lN+P05qfqT5WgR3w==
X-Received: by 2002:a17:902:dac5:b0:234:adce:3ece with SMTP id d9443c01a7336-23601cf69d6mr180738925ad.11.1749466276887;
        Mon, 09 Jun 2025 03:51:16 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078d7bsm51827625ad.2.2025.06.09.03.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:51:16 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Boqun Feng <boqun.feng@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Trevor Gross <tmgross@umich.edu>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yury Norov <yury.norov@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V2 0/2] rust: Introduce CpuId and fix cpumask doctest
Date: Mon,  9 Jun 2025 16:21:04 +0530
Message-Id: <cover.1749463570.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Here is another attempt at fixing the cpumask doctest. This series creates a new
abstraction `CpuId`, which is used to write a cleaner cpumask example which
doesn't fail in those corner cases.

--
Viresh

V1->V2:
- Introduce CpuId.
- Use CpuId in cpufreq, opp, cpumask abstractions.
- Fix cpumask example.

Viresh Kumar (2):
  rust: cpu: Introduce CpuId abstraction
  rust: Use CpuId in place of raw CPU numbers

 drivers/cpufreq/rcpufreq_dt.rs |   4 +-
 rust/kernel/cpu.rs             | 106 ++++++++++++++++++++++++++++++++-
 rust/kernel/cpufreq.rs         |  27 ++++++---
 rust/kernel/cpumask.rs         |  51 +++++++++++-----
 4 files changed, 161 insertions(+), 27 deletions(-)


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.31.1.272.g89b43f80a514

