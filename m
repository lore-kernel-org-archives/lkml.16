Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC9A2907;
	Fri,  2 May 2025 02:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746153252; cv=none; b=OjKRmV0pvTrw5jNnjGzVeeniqFv43hgY6O2ZJ0DM2snr5iuy4IvVGbBpGHJUyTFFHC+9zTuiZ9pKkw1FzlS7Sg3glR3b3asfxXLeYQ6xroZ5ToAK1VTq54O0gm/39F+6IBX73AUNk824kKirmq8E3O3z4+Cdwm2NmM3UDCqwLbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746153252; c=relaxed/simple;
	bh=jxQ4AtCytiBcKJEdLSTc1Y4Vmzs0RBigJwvcoI4eal4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gccj2rYBlh6CWSrzbUmij9lX8k7FPV2S5xBFZoOZ7nEMMJD5wYAY4VjpADRFGMhLxBJ3mwWWPTO7e96aQa7IEYZ7tr/I7XejGEHzNQWnbWptmUB+p0Id3iRCCW3UIy2TYbuhX+Pi8XLl64xsfLFm/4HwR7yXhDakD493/NNvafM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTvaXISk; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTvaXISk"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-739be717eddso1356986b3a.2;
        Thu, 01 May 2025 19:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746153249; x=1746758049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+0VmhuGhanKnbTzQbxudXoHQeY9FKUjFsARdJaOVXWg=;
        b=XTvaXISk7EIyai3eGAFLiLXvitY042nuBcI0yx5dYAH4aHr2a1XCCM1Hl1NHPBWfJ/
         abUf3ra3h1zxXD8bEVd5PFPUZkGjO+Uqwy1UFEyFgvQvZFdPTmlUlgRIvm3KwzE9VC+u
         h2qGg7L2r76jiGOlvUdjmvB2Jt8NpHL/jCoDd2ctrGjpqjfJNuIMzDCHanbxAjHCaV1t
         PpzPPC0MGduRybOUA8e3xY0OO651XyLVshFyP21zRKqjUyEvaVQwE713wY9rv3aoJqe8
         i2HkgpwlxmLhty/meVk0lS9dj6FxJt5PeGi3BhQHm7NkRbTdSfi41TElGsg7g7SCJS1p
         fnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746153249; x=1746758049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0VmhuGhanKnbTzQbxudXoHQeY9FKUjFsARdJaOVXWg=;
        b=a/BCz5vq7o23pbHqTvyZHrXt+QzhUNJvXoBftcmb7KaK0fckkR0WVuFxXUjGmi37Z0
         arNNTF/ajcgWqB0tcBOxgxa3siBhee1I2bjcixAR8MlqFBluVt1o9vREgsajYKIxy8SE
         e0A2gkNJTRCncQkWvYkMy2FW1ta0JHHoj/d/qFtDn8THGmUyd7DKwb17I6cj+kpTfeEk
         VUq4NrHaeXxpEnfoqAZahTw9twpQuIhasdEIn29u36aZHcx+1Z2Rq5pgzZw+peeJtHji
         4QpKiWn8a+y4bEsidUQm9xe/s8JTqtc+lNkfI1Ye1bd+YPowVyR1m2EGLYFUvRnJ8KFA
         GAMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxMA5YHXzP26I0E3WKrtNR3yemLvZww7gWvxTXWnf/yASU4TKjVVNAXWcoBpRNrd7xZ6S6IToBvIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcffbdOfREsufYNXlPnfScFwH/f+unohhZfRwAu7rvsnsGXY3D
	D8YP/BnFoI9jh6+AJtEvzKGvZF4U8hmDr1Gc6ePaWJx/v5NeIhQc
X-Gm-Gg: ASbGncv+lstGx4+R/po8ZqVHQprllIFecEFcekgQ48Nt1i/x6s2Bduos54aIqYmF4Nb
	WxGuAC/yheirPFzLuWE/zU9ChzcjMCFxVNgi9QFKd14mh7kDNwnEVO99cA02FYBDBcudCTLdj9L
	RjDf9ojfX3wISnutNmQsq5vn1D0xV4mTey108RI9en2oJXEmtrCTs7cZJFQDTk85xXy6eq3fMlb
	iQmu5KPSMmX8ZrUn+k9PD3xU6uuqf08t5m+oOL2QZAVVd1v8Z53A+VuqBQ4ZkpRURUeYiM/AJrO
	hie+4B/UsSSf9TJ9gXfqyxXrwszE2jkC+Kd23N7G
X-Google-Smtp-Source: AGHT+IGWyOPQA3ltZClbKdEnGZQUk+rwwl9wjJznk+gRmENzIz4qHWYWSdAezQJiAuao5NK9GJX6pA==
X-Received: by 2002:a05:6a21:3a88:b0:1ee:d8c8:4b82 with SMTP id adf61e73a8af0-20cdfcfc9a3mr1931565637.31.1746153248829;
        Thu, 01 May 2025 19:34:08 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fa82b66e5sm362030a12.39.2025.05.01.19.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 19:34:08 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 6A47E420A6AB; Fri, 02 May 2025 09:34:06 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ingo Molnar <mingo@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] x86/cpu: Add "Old Microcode" docs to hw-vuln toctree
Date: Fri,  2 May 2025 09:33:57 +0700
Message-ID: <20250502023358.14846-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=959; i=bagasdotme@gmail.com; h=from:subject; bh=jxQ4AtCytiBcKJEdLSTc1Y4Vmzs0RBigJwvcoI4eal4=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkietG8RRdzEliO5vrKP9m9+KCyDW+H95ImxX0rQ1Krb vu7/bzcUcrCIMbFICumyDIpka/p9C4jkQvtax1h5rAygQxh4OIUgIkwzWL4H8Ty1Nv5e2Lnti3X DCUe3+h4WRAe9l++TFhWcVpwbeKhmYwMJz/tiVz/Iry87mvWm3X90pOWvXwaUX6tbo7Hc+Gkl1n fuQE=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Sphinx reports missing toctree entry warning:

Documentation/admin-guide/hw-vuln/old_microcode.rst: WARNING: document isn't included in any toctree

Add entry for "Old Microcode" docs to fix the warning.

Fixes: 4e2c719782a847 ("x86/cpu: Help users notice when running old Intel microcode")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/admin-guide/hw-vuln/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/hw-vuln/index.rst b/Documentation/admin-guide/hw-vuln/index.rst
index 451874b8135d8e..cf151114592790 100644
--- a/Documentation/admin-guide/hw-vuln/index.rst
+++ b/Documentation/admin-guide/hw-vuln/index.rst
@@ -23,3 +23,4 @@ are configurable at compile, boot or run time.
    gather_data_sampling
    reg-file-data-sampling
    rsb
+   old_microcode

base-commit: b43dc4ab097859c24e2a6993119c927cffc856aa
-- 
An old man doll... just what I always wanted! - Clara

