Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DA815C0;
	Wed, 11 Jun 2025 20:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749673819; cv=none; b=ESnYzhZLQMdjXLjwhNKl3hrkRbkxmGsG1+51WWapXIrX68rFmgQQtV50wrZc0VckOWXgsSEmWpCTPftIylg5IM6jcVh0UryFIGr+DSsnskxYBn2JGZyOiSavu2Ryt3AKidWiC+fD/0BuYZr/WSC2PDexQo/ysk315xEfLiYHSQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749673819; c=relaxed/simple;
	bh=4UtRKohkxqENpsYh8iGXRD6NETIX2qwRPWFjW0quexo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K9YAL76VoVfAntEZwH/tmBAQbIzRAlCVJhQ16BqNmrse4eiZ9yuh1Ev7QZpHhvn6tgbFSlfHUriBPNVAV0Y4eYQvLQgzp+Rmc0+bV9JJB3nCtw4DcbiHoHNzgb9Pz341Xo/0wjp2PH9b4Fp71rmCbQnFF60hQ7OtZERdQvIlQwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIYDasS5; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIYDasS5"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-60ef850d590so100424eaf.3;
        Wed, 11 Jun 2025 13:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749673817; x=1750278617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pv5p8TJwxPf045PkEKfFQACVA3z/pX6ZOvkokNNKGr4=;
        b=YIYDasS52RRwvN+3E0I3e1d1rSLtMz4r+NyO51MP7U/QZvH3cOUgQOQaq2Xfsjx3XA
         mC31WCCPFRPMU2lr9uDzdO7hHa4yvtlx1QEiyzYAC8vFf+jquRfUpTfDzQpPLgwtZimT
         r5aXgGGbEOa9yXvpQmOscnIozwYUC8VtUNRJj5P3O7OrmQf/XtDrcIyeymsGbtteS24M
         CMO2wzoyZUr1CwvqOndRdOixs/GVmZn5R3R4KRQfskCsSMYJHlyluIe2wPryUsstTcaM
         iOXJqil9WAtddDB40pViPBdA1lgGryr+tO4vfrSmnYWxTFqqOZx0x1UqyilFnErw2S9T
         R3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749673817; x=1750278617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pv5p8TJwxPf045PkEKfFQACVA3z/pX6ZOvkokNNKGr4=;
        b=MRNqV3hv/weROUAhZKnxwIPGzbhwEOZQdohl3ZWJKQBGcJH11nmEUb0fzBm+1OY5m+
         h+CTwNDpKNvFvs2KZXYcjv4g3mG1aEJP5iwQYAEUQSrSsOTvEYsv4sr91eXk2PNZbvlX
         K1x8EbvcgNUKCwf2/vP3rLB1b493ni8gBj3fil6QjvYBExfgQC3XkwxmpeHE1rGvloY7
         qoXnJxlEBHlTWml6owgORjI2MSw439deQNDb6LBRyXVLteK9NCI0/WEuYMz8iDxCuaG8
         YFDSuf5xUAM9hzlMCYmt/7OuQYp53khZsJXwp4rMXTL8fGW7x8b0AIrUgjmFkf6czpyL
         zE7A==
X-Forwarded-Encrypted: i=1; AJvYcCUfznnypHfolPrx8D+++SzFwbbOMJH134IveJStdzLTeYysADDYdUWbuI/80pEUXG6AsfjsP/ZP5NT6D8Y=@vger.kernel.org, AJvYcCXh0SYTJbGu+FE9CE6QIaSc2Ns1K7kEzyW/u1CNXOZrtGBLQw5ZFajhZZdULvrGxwA6GbXaaPGYsI4vN4darRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGS2kcLt1WiPDvJu90aEolptYgMNngzqlIFE6qgyOGfGWmV9hS
	zvN48R4q+x/ifIEiTL5DTDOIszOodZ6n+MClGOjN96yKuk4G4oUNLQYg
X-Gm-Gg: ASbGnct2+zBC0gni+yZiQ9ZRp8+7JHZeKyM1TVJtPPeaFo6TXwWSW+bKQxDsgH71DMM
	4jtVy7JPdDhPeFAKEpV4ayvo7GZqBoD1eEXWLSKPX0/XZQa8jW0DsJ7HMnj4fh4mRRPs1/kCu77
	y9etHcHCkjvzsWzWYJ124pvKU+NgwxBm6r1qIMNVHtvSy7toih943ssUevBIlv58yVHmSddv/fL
	bam54eOLkceKJOMvnxdUNXEatQo3lk+zgHF0N7Ctj17srOcyNEa5khEeKrvRbZyJ3zmzXqQmG1V
	s5mXZvxXiI3lVNcFcBdocyFLOkJqgcxf/Pzu1jUM5bpfQH09VHNNVILFxURDfwydN+wNaRHGUby
	TMw+2mm1nk3ZwK2/91IwkXyymmjgygvTthQ==
X-Google-Smtp-Source: AGHT+IEdW2GwwH7UlC82DZ8tArQruFrLKD9FvV+cJYxLDW8g1S5uaDlfI73iFWvbZTw8jio1Ez/bQA==
X-Received: by 2002:a05:6820:1347:b0:610:dabc:f94c with SMTP id 006d021491bc7-610fbe42378mr832225eaf.2.1749673816935;
        Wed, 11 Jun 2025 13:30:16 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net. [73.76.29.249])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-610fd44cc85sm19129eaf.16.2025.06.11.13.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 13:30:16 -0700 (PDT)
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
Subject: [RFC PATCH 0/3] rust: add suppord for dynamic debug
Date: Wed, 11 Jun 2025 15:29:49 -0500
Message-ID: <20250611202952.1670168-1-andrewjballance@gmail.com>
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

rust does not have an equivlant to the C __func__ macro. so, for the
time being this hard codes the function name to be the name of the
macro e.g. "pr_debug!" and "dev_dbg!".

This uses the module_path! macro to get the module name, which will not
be exactly the same as the c version if a kernel module contains multiple
rust modules. e.g. it might be "kernel_module_name::rust_module_name".
this does give a more accurate description of where the print statement
is located but it exactly what the c version does.

This patch series also had to make a small change to the static_branch!
macro so that it allows keys that are nested multiple structs deep within
a static variable. 

Closes: https://github.com/Rust-for-Linux/linux/issues/453
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/topic/Dynamic.20Debug.3F/with/519289668

Andrew Ballance (3):
  rust: static jump: add support for nested arguments
  rust: device add support for dynamic debug to pr_debug!
  rust: device add support for dynamic debug to dev_dbg!

 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/device.rs           | 102 ++++++++++++++++++-
 rust/kernel/jump_label.rs       |  10 +-
 rust/kernel/print.rs            | 167 +++++++++++++++++++++++++++++++-
 4 files changed, 269 insertions(+), 11 deletions(-)

-- 
2.49.0

