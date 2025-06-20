Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151732AD16;
	Fri, 20 Jun 2025 21:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750453554; cv=none; b=UqyrJtswZ1PcDz5J+tFtLUrV0EiGUtbAXlX6k8q7q91r7bMakhZfoK+Pf4bSQjZ2zeME/X6Vraurk/RyqsaWP/N5k5yEeBcbX1Andy8MZL3cpOPdbO/q6KAXCxwyEsK5hzJaIVKIEYajVCJ8XvE69NiTsLYXRRya3I3MWAJKQrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750453554; c=relaxed/simple;
	bh=+jwmxvOmu0LeXvRtstFYdgzhboaT79g6vAktTlFIow0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k2lQiNYy4Q+O20kS5Hq9nXZnSec7zFWB8GoqjpCV+HkSoN+vdubtdZDlt3Lz8/HbQeRG07q+9jpeqHttaY17ZPfrVvM/6WwVylWyetv2qQ18XIhVA36p2qzucJEEp7VNg7FjaGI4xQXfUFjJn1mLp8iIDfFQ5LadKgjr4BvWndk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i66vg9pg; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i66vg9pg"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-735a6d7c5b1so1383732a34.2;
        Fri, 20 Jun 2025 14:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750453552; x=1751058352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vmBvOI8KX8VsjRKG6qe/NhY13gQYP0cONG0gBKDUoxc=;
        b=i66vg9pg4+xvDZXgKZFABNSzS6/Z9ZED5EtKT1yaH7dnCY+YcV0iCrfypOb9JcS3gO
         hsvl9Tw9Hr9T0V3Pg5anAHBDQS0Xo+JKjWlXlfaX1HADIbQAASwtg8O3vo8Bmmna3X5o
         toGmP45KJNZWTmQq4QEnL8IjzmoqQFvM9fpjSLFWrlKQqBXLmG+ecPBRnrqdhwL07BOq
         95kYiB2iKCcpX5JAjBV/nCoGr9RGDcM2xyiYLZ0eJeFL2v8V3oaVtug4Kd7e6vrS+1s5
         I/R48+XZ8jvXGxiHh21D7lXOseqLMgGusFPpXhiuZg/1OdlBXo+zrwoSwVedlLRuO24I
         Areg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750453552; x=1751058352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmBvOI8KX8VsjRKG6qe/NhY13gQYP0cONG0gBKDUoxc=;
        b=WwJSCK6FzKkaROhkY+yqWF4ramONe1LoriQ1qxKJvJo8qodObMcC3YWZ47sORFCEl+
         8gajPvtNeKoTdVn50zXHwObUvutbtasbit/ueAcqRMACUlnsTERffcZ60tjzLuEm+DGD
         SQ2eExPpnw1AZbOUwZEKCVXcbTxyQGiWUMXr2hwaBTDO3/9kLkfBu3PNDw2g0aFdciR8
         7TU3o4NLnoHGCywxeilPqq+d1fi9Atnh05s9RDaRf2JuNoXxymbhOSTTrJpm9sq9W7ql
         aKY9kIswGmppqnvs0SnJwEaG1cDbD1U6wMwMnuptxl33KaIYLxxlnXtGz2TCUipv8FMR
         UQ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPraxJweDFPpBFPOlaZPr1UJ/u4eZfqvxtejA7GAwyWCJqEzBQ62ffdOE5JYhuHnm+krvRf+isJJlINW0=@vger.kernel.org, AJvYcCWm+YfiY4Onjwi6Xz6WwD71PYn/UFFJVaowB81jGl0lv3Gy5CfhjM9MRAPYWD+YCgH9QQbvkuoPHDjZjEKvlDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ43UuRt1eR6AffSXUJpAfePGkN09OC0xqPZPDI5tBrq/p3jpQ
	JVXlcvIe1/8e7T/2EKj6DsFvjb9fuUCiF9AAwN3oIc+wK8cLCoxjSEUU
X-Gm-Gg: ASbGncvKko1Yg3WTnVrb3dvSaJYrbCBg3H7GghrmtJS2Ml7gfmuUah8hegFVZDynrM2
	AgEBFRMbOlsIpXepWywUtPUAh1j4dA7P0knAlMJQQNXkF3hXf/lySaYJXqF0vFiwPYKQr5BWkBJ
	F5ZU31IIJqZLeu15O096hFt7egCJUX/6dI8c/O5dHdlevz5aPGC2q5AhJreRAqOExnVG6V4CNY4
	4HXi7GIh7IYj9OH2WehkEsfnu8y/X2jZyBD8d2WnNQeeHaf+z1gcz8hpXyO+lcUiuJpW+CfulNO
	Ago9OMJCkO0+7ME9xKxvFpKhVqeZs2CdBhhSWiec9cG91sdOKYLETJNiPJK87UznVbUaqNain83
	x4GEow73GeWY5fv0ZpbWNnMvMShXYpZcNTw==
X-Google-Smtp-Source: AGHT+IEIgYTSXKpAE6sbH14fCEqjlO+2zSV6YM37xsS8Qe/w8tL5c0pLWqWxOTeXazsG/4EjM4CFrQ==
X-Received: by 2002:a05:6830:8317:b0:739:f863:c4d7 with SMTP id 46e09a7af769-73a91e957c8mr2193281a34.12.1750453551919;
        Fri, 20 Jun 2025 14:05:51 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net. [73.76.29.249])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-73a90cb7875sm460596a34.56.2025.06.20.14.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:05:51 -0700 (PDT)
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
Subject: [RFC PATCH v2 0/4] rust: add support for dynamic debug
Date: Fri, 20 Jun 2025 16:05:29 -0500
Message-ID: <20250620210533.400889-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for dynamic debug to the rust
pr_debug! and dev_dbg! macros.

I have tested it and it and it does work but, there are a few
differences between this and the c version (hence why this is a rfc).

rust does not have an equivalent to the C __func__ macro. so, for the
time being this hard codes the function name to be the name of the
macro e.g. "pr_debug!" and "dev_dbg!".

This uses the module_path! macro to get the module name, which will not
be exactly the same as the c version if a kernel module defines a rust mod.
e.g. it might be "kernel_module_name::rust_module_name".
this does give a more accurate description of where the print statement
is located but it is not identical to what the c version does.

This patch series also had to make a small change to the jump_label module.
to add a STATIC_KEY_INIT_FALSE and updates the static_branch_unlikely
macro so that it allows keys that are nested multiple structs deep
within a static variable.

Closes: https://github.com/Rust-for-Linux/linux/issues/453
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/topic/Dynamic.20Debug.3F/with/519289668

changes in v2:
 - fix typos
 - define and use STATIC_KEY_INIT_FALSE.
 - use raw pointers to avoid undefined behavior
 - use cleaner version of macro definition for nested arguments (thanks Alice)
link to v1: https://lore.kernel.org/rust-for-linux/20250611202952.1670168-1-andrewjballance@gmail.com/

Andrew Ballance (4):
  rust: jump label: add support for nested arguments
  rust: jump label: add STATIC_KEY_INIT_FALSE
  rust: print: add support for dynamic debug to pr_debug!
  rust: device: add support for dynamic debug to dev_dbg!

 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/device.rs           | 105 +++++++++++++++++++-
 rust/kernel/jump_label.rs       |  15 ++-
 rust/kernel/print.rs            | 171 +++++++++++++++++++++++++++++++-
 4 files changed, 281 insertions(+), 11 deletions(-)

-- 
2.49.0

