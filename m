Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38BB1EB19A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 05:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743572331; cv=none; b=Rj5pdanv1ZoL/UFCBOjl8b4FyZ1RT9VEZ/2AVwjFfBJlz3in382D1M4a2UlvZbodOjm5YYXRmKQZwTeuqJgjE0dqe/6Vw5t27PBJjXH2HI4cbRwOlLKDgyLcwUVms2f/0IWj7A8I8rkaDQiCSVtJhGTFY4xVqagT3J1i/M8phSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743572331; c=relaxed/simple;
	bh=f34QjZVnu8zDvSB/1vNzylZB1VDSVA+UeoekNqo5kcA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dnJukJa7D0cMGXUGAXKld9EapPb4T5xvNkPueRFbRREAxsIS8jMu9JAWyMAaAPG3WsBdj8RT+Ftd2hJnwwO3O9X5mJWdcn0sPJgh1B+FCXdMRcQOSbdvkNEusU2SC5Hn7PAW/cS1MAg73RahbtbPeltOQv/1MYllCQPq3DMqsKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PkB1nfrW; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PkB1nfrW"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3011737dda0so8055818a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 22:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743572329; x=1744177129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zez2xuviDEokAGqGnmj+S14YixJPAJCgKo/4A9f+9EY=;
        b=PkB1nfrW4kuzzuxCJJi/QXy7F4ZZ859zPt32fZyoDRUmuPNI7FGlemPOAhqgp36iX2
         ckY/lomf9loPnEsTqzmw73mzDratpwBNIIqspzKX1n2Xhn0zmZrypO2HNzJttfCRNR8l
         NUmY/gl+aempSc2BKFoByUkJaOnpcPRS+MUF2+YZmDLGFQUne8Yvvr9/BEwSl7IsHdf3
         HOfMphI94TJd15n877mJPP4XsBi9hd8gf6QFiIJtRhNY93qyYGVB0dg2r8tmFDSvEExB
         BVvna/6FJdaPuV8cgqTcfNr14YuTSDfm+fmgrb264Jj5m1pg3Zx+kR5cK37WMdLfKSk9
         2Vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743572329; x=1744177129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zez2xuviDEokAGqGnmj+S14YixJPAJCgKo/4A9f+9EY=;
        b=Ztkg5yKJ2+250JvReyZjYHNhEeX00yNCrezjFIbwrzSpeCSamRbuXOF7sdEPv2iGdz
         i9CuVjFUgu8wsT7PrzoLNvUtIV6402oo7lFc9b+KX+o+mhW5nEgbJo1bcUGosexEfXdv
         Der/NzRk8vjM5aB1WHjkyq5HKFlblzb/wXfmZCRMq2HjFwoC8Mq0A7DHqrgmPyeD0/Dg
         rxZBa89T1X8pN1vfyRTNdLot9h4G099d8WRgim5Wuq0Tn7hTIEPrpu0UMsIEMT2GUVZ9
         cuL72/ykn7WoPNRporvg1Lzrp4tlgX49tMkYZ0lK9vFipvGanoBsNnPKNLiUwsDQaqhn
         Lihg==
X-Gm-Message-State: AOJu0YwXhLLZrNeQF/S3MHa7vLMiaxm8razxibu0MCNuX9v4WhuRxXg6
	uqKhWnIZ3vtTPZvNeJOW8+5tWBENe19wSW1tiDQufedbmhLHNlKoqGwIZ74jBTo=
X-Gm-Gg: ASbGncvkEaJ5R3NHGQQMqjlrP/ZEm+Xr7zK63mvT2iGU8HUMzl8NDv0O4WnOJGEx68l
	RnNj1JGknGuPRl3kFOVb4fkc87E+aFQ8cqP2fFOf0cKURvPUIqWvaws+dfeZECrSsVoaMO0yV79
	A8/CRecylZ/lC1kc+9eX2wzmTnFOuM1qvOY7FXbyvOQ8MUiXhC25xWJ4py64xgT7TcSU5T33BPF
	y6Q1UAtcm8iB2Ahqy26wL6XZtI+TIV58pcozoVcgoP8htnpqBjxyntIS6CExuDm2fYL0xNxxEDM
	3qg09BMZ1/e4td6E5BTzv4uFAAIPh2FHqUwXw57JiMHEUA==
X-Google-Smtp-Source: AGHT+IGH1hzGwQPu9MUSODpNVNiblGulmScpiDxx4Hqd+I2N6vWJRXpxsrODcivVP3CvpfnRyXSS2w==
X-Received: by 2002:a17:90b:574b:b0:2ee:9b09:7d3d with SMTP id 98e67ed59e1d1-305320af3e0mr20394191a91.19.1743572329064;
        Tue, 01 Apr 2025 22:38:49 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3056f83baefsm634769a91.11.2025.04.01.22.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 22:38:48 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Burak Emir <bqe@google.com>
Subject: [PATCH V4 0/2] Rust: Add cpumask abstractions
Date: Wed,  2 Apr 2025 11:08:41 +0530
Message-Id: <cover.1743572195.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series adds initial cpumask Rust abstractions and adds a new maintenance
entry for the same.

V3->V4:
- Create separate entry for cpumask in MAINTAINERS.

V2->V3:
- Improved comments, SAFETY, Invariants, and INVARIANT blocks.
- Add examples.
- Inline few methods.

V1->V2:
- Add Yury's Reviewed-by tag in 2/2.

- Implemented two different structures, Cpumask (corresponds to struct
  cpumask) and CpumaskBox (corresponds to cpumask_var_t). Thanks Alice for
  helping out.

--
Viresh

Viresh Kumar (2):
  rust: Add initial cpumask abstractions
  MAINTAINERS: Add entry for Rust bitmap API

 MAINTAINERS            |   6 +
 rust/kernel/cpumask.rs | 301 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   1 +
 3 files changed, 308 insertions(+)
 create mode 100644 rust/kernel/cpumask.rs

-- 
2.31.1.272.g89b43f80a514

