Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D1218EB0;
	Sat,  5 Apr 2025 06:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743833010; cv=none; b=mjH4K+sPHE+pK+G3DDIMpL1n9NFHDSWMdCL1DaBXqP1TY1xPy6UUINaEAKbn5t73eMxeSf8m28aFT8CLoRI5ZzbOfA7ba4U5gKc9xgopXPllv6OZYdqB65iwHu+WzzIuo8+k0NdGqtM3EUfebM44Oikk8ZidRWeXdj/ew+kZSic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743833010; c=relaxed/simple;
	bh=YmJwQEXqahgapK0oajiNluXqZwbnM6g7h6Zu/n1mYeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VpRK30wdP72VvZKjRIJtgjXXhPotoJAJoun3a8D4nZlRYOvuAaJnM+VbU7T23m37BgIs1dBUH3L1Xud9TnyVNS0JoknAgkmlyhfUc1xJnSTTwhlMnACZ1Hr6ttPnxuR+ZTncPo5U5IhfaC4gmyrOSMKqMqbs6SKQpLcSQe2g3ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6eDFa6J; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6eDFa6J"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4003b22c2f4so1712920b6e.0;
        Fri, 04 Apr 2025 23:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743833008; x=1744437808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vmo855L+OJY9wWVTPniaeELLqvSXz8qMxqdDHxIVTqU=;
        b=H6eDFa6JDHMtpaGvUX6lGmIHqKWV4kmvemGmVC5eL7xk1FIeWg5Ec4jLvrL6v5HiKh
         676ka+QU3vAc7U1Pyyycg83MrpnKM6OdyEUQ0Mo1oP21gpViy4iYzepqEe6qGMCHKCRn
         ODHunWiknn+hKnCfrGXrRGY11dODvFNloSEF+gKfEoUbdYrt2yWLR+XJ5nDZUHTAgvln
         h5hF42kkZYOTlpHGG7B5d6AW8pb4nJyQKqhob2pTavtAKJSZyuiSn3TbJH0X8UgaLsJf
         /pF17ZCxfz8gs5hADl4ArrpDuDpPssq+YQI6YUg6o8vWHT/q8E25fyA1bZZFYtgJd7rU
         VbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743833008; x=1744437808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vmo855L+OJY9wWVTPniaeELLqvSXz8qMxqdDHxIVTqU=;
        b=LJKjPdV9XujKdzk2NdsF2epFUmdjg61DH9VJLhnhdMfraIU0RLGWRxW4GFzTkjh0Y/
         0yiMH51JsbtJiud+U4V6f82k4RpJfwOF8LHnjBiA0lRYpR6vP3qKCxkkLG9KRPra2Fs4
         nmXiyMIRflc7MwDWA7q+wB2uowio5i69RMD15rCuuwbf4Vnh0dn0ha6E3mJcu40kS6xR
         mpb99An65G2yyg/l1DRkzQo3Rkcbvis7KNf0jgC3jOcfVk4HNNJXBCpCTzua5ThVFQhT
         UFjqtFMQzwWktBFG1gElXnHxPDn4xKeRHK25tF+6Y6wELLYW2irc9WGLGWdN3ULn+ej3
         h9/A==
X-Forwarded-Encrypted: i=1; AJvYcCV7qkymkVJRn3RvL2JOUb31FQ1+bkuh4G936fJWAKXFut9+xwETQJrmqIVDveW5auoIg0cxk5iJuWFyVPTIITw=@vger.kernel.org, AJvYcCXL1mt5u6m24Ke/Em/qMfsP12B3fKpgAyq/woXnFxP1MohnGp0PmKVI/RicPA4xZDM6Bx0zoK4MH/5bV7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIi869NoLT29aGntioWWcmfhrMxqEI0WPClfJX7Zg0zIqd/P55
	BBpjfuoahCtWT+l4alOw3tABws64lKs5B2ukMaQ0m0LS286oxSQ1
X-Gm-Gg: ASbGncvbcG/cEK0JEua/Q4dvp76ExnMFJ9eOVgLIWyvnahnOPrd0BwMhaFG8Wz336s9
	f/YCW8JYgPAvcBFHVwrDF21XWXwW+rU0udoasOxzp8sIZIoagSqxbL+02KVXScjdD1nUtOyB/EF
	vVgcrQdfXRPiLdxeNtp1NtcgBbV1wy2HvNi+SVfphoXiuiPlmGyJbK0oKHBcm3TyTCuf2wHNLVC
	aP+b+QY6Y1idUUWJbT5Q7Un/hFrpOfptZ/GkOX9Y9pP0ZrdJN98QHXCvYAHQOTOPqq8bZQiZLin
	v54GcFbp4fVCIYMLCDci5Z3e7fTJCwWTiwIGhjhtpxgOULtmasxYYSGEkQYIXyI0wbbWuii70C9
	vZOCJTHckvIZgNcmx
X-Google-Smtp-Source: AGHT+IELtUR04lQJCB4Zo+IW0AifuT9GmUm5yuYn3qvlJ/xjFCgZEenYq5QySgDL4xLzlnxXgPoQfg==
X-Received: by 2002:a05:6808:1811:b0:3f8:587:dacb with SMTP id 5614622812f47-4004658c82amr3137388b6e.9.1743833008281;
        Fri, 04 Apr 2025 23:03:28 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net. [73.76.29.249])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-40040080a15sm926565b6e.34.2025.04.04.23.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 23:03:27 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: Liam.Howlett@oracle.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org
Cc: akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	wedsonaf@gmail.com,
	brauner@kernel.org,
	andrewjballance@gmail.com,
	dingxiangfei2009@gmail.com,
	linux-kernel@vger.kernel.org,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org
Subject: [RFC PATCH 0/2] rust: add support for maple trees
Date: Sat,  5 Apr 2025 01:01:52 -0500
Message-ID: <20250405060154.1550858-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC adds an initial implementation of maple tree abstractions.
I would like any feedback possible.

I would like to upstream this eventually but, it's probably going to
be a bit until there is a user.

Andrew Ballance (2):
  maple_tree: add __mtree_insert_range function
  rust: add maple tree abstractions

 include/linux/maple_tree.h |   2 +
 lib/maple_tree.c           |  37 ++++
 rust/helpers/helpers.c     |   1 +
 rust/helpers/maple_tree.c  |  25 +++
 rust/kernel/lib.rs         |   1 +
 rust/kernel/maple_tree.rs  | 340 +++++++++++++++++++++++++++++++++++++
 6 files changed, 406 insertions(+)
 create mode 100644 rust/helpers/maple_tree.c
 create mode 100644 rust/kernel/maple_tree.rs


base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
-- 
2.49.0

