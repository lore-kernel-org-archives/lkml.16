Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B32925F99E;
	Fri,  9 May 2025 20:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746822891; cv=none; b=uUXIqgVb9AbLBkcBZ9sCFBWsLk9ztOuqdTGKVHpXCZBPuHemzBSTnkH2RkxsQuWt/+qVk/wsnXs7GCz4Oz2Qz8F0RVtpAYnG6jKhxRG9QuXWU7YP0Ums7NxmMUGFQk3k5ESyFSiRW4JGsnKrAMJl3uVuNuNJOjEMPfxSixJpP1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746822891; c=relaxed/simple;
	bh=K7QBPYmB6+EbJVMyvMl1640LEwKYDegVA1qPrX+sRYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQACpA0KTExnwapUqYLHNvd9rpVMLx/pVQHvbm0gjIeV2oKQrAWphl5m3Tf5CSL7o6NXPg/hVxANI8OabIT+5fe9weeeZo4BmQvfuVAoIOIoPOn6IRN4BjBuiLGum3ze1L0QIlXAiQ9OHjZP9Q67f7GCyQ0YEExCZ7Hs1HcBVWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDXLC33m; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDXLC33m"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad1f6aa2f84so540456666b.0;
        Fri, 09 May 2025 13:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746822887; x=1747427687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QseTgvZE/lbbP5A3w+jo9a6ipC4Dy60OVzZjutbgQf0=;
        b=HDXLC33miOSc6qKfjUjHmypBDko/jopXWDgSeDWN32gBA1n5u6ovtthEBY3tud4QIX
         EKI313GW6uQQFRWcwCo74O6+0ylhpaEIbkuv80cUXckGErw9t3GK1YxIfKR/0REe+zQJ
         WNxHeRQheLOeEJ18sxqDAMA/7VEBFHEF49KpNqamtKwz3F4EAjSeke9VdPAh0FTcmMbP
         fgArDp/UI8w6HyNSepkPWPLZrNpRwU+DK3FuNuS0cVDBniRjanL5MW++kdwe5wXin/Ue
         jyo8zLoPeppR4vM4Gxjl6qr6wsmkotS+npOnUhQShtG78m10mInNG6GbG2phkAxxB1gh
         HptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746822887; x=1747427687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QseTgvZE/lbbP5A3w+jo9a6ipC4Dy60OVzZjutbgQf0=;
        b=XCRKF113IQ250TnzuXWX4OqhmLwEYvUwuA59XbGwjYzhgE+xYrfh/deIP+QVZKpZxl
         /y64A+eXTFysl+CnbTnFASM7LzVU53n34MgdUDN8wt2b0zpOg+Kk5UI0IarSKgysaUSo
         GjRmQijSPIQ21FxLWJU1tvGzKEI6ymhiO16Dh0iaqo+6Sl9l7MEjzDxvmSTNyKk1CkOR
         yBhnBbM+KnjhB+qevhESpUC+SfQtbCLYZ9JjABXMlVXABPXuhrd7mswUFvRH47bVVGKg
         40muYTNl/3/AdyRxriGjCMyVHIdsZa3WT5GNP93uDVJwIFVHgtV2CpRnwuxZ1EkslsOx
         Z3Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWUP2JLyKfIYCQyFS1XjsBKA2jvDcQiFqHZsaJk/5y1c91vMCG3Szvxdu+M9fGz/4SwUeWsC38QQD3qbJo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN6ZxER9RqVqfecvF6CJsTKtC9R7XycsyTQM1/FvShYij6VUut
	VqcX5g+hZkjevufigGGx55hFLXMF/+ZK5yFeZhpv3M/OS8EriMQ=
X-Gm-Gg: ASbGncsAoTPD0ev6RK9zxndXRvNuO/h346R5K2iOwsSdtCN4pv1I3qi0oXuw/TQYF6b
	y6khdpcLVQShhHbxsh2Xnlu7WbLI1R7hUqqYt+ZupIJm44+YIZcnOnlqPpgWl4eQUCYA7Tpzi+i
	9qIvDvp3XeqxGdYy/gNIMSu2HYWOf4h7JjsXZfKwfvzZ2iOHibylJQJZgLD+fPZdlihrkFeXlWt
	8IySbJkrLQOIW6oIlpQuknSHM6pYTClBkDht4MD6HvpbQ7BzAoHt0apAjxnBp/lzqFtBqqF4RLZ
	vkjY5+yMOn1/JmSW01qnwYSWPjlMAWKnY5LOPUVBsM0lYZxQRvi+KThqAKhyqfnL4tgIDnA=
X-Google-Smtp-Source: AGHT+IE+KkRZI0IG0hdj0VgiW+dAtVoIaJen/kaHtZsl1gsuQxJ9ijZRKJV3LchmaZZdtrbt7/Wlpg==
X-Received: by 2002:a17:907:3dab:b0:ace:d50f:8ee3 with SMTP id a640c23a62f3a-ad1fcc9885fmr796696866b.19.1746822887456;
        Fri, 09 May 2025 13:34:47 -0700 (PDT)
Received: from localhost.localdomain ([46.53.251.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd219sm202255066b.141.2025.05.09.13.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 13:34:47 -0700 (PDT)
From: Alexey Dobriyan <adobriyan@gmail.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH 8/9] CodingStyle: tell people how to split long "for" loops
Date: Fri,  9 May 2025 23:34:29 +0300
Message-ID: <20250509203430.3448-8-adobriyan@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250509203430.3448-1-adobriyan@gmail.com>
References: <20250509203430.3448-1-adobriyan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---
 Documentation/process/coding-style.rst | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index e17de69845ff..494ab3201112 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -183,7 +183,21 @@ Descendants are always substantially shorter than the parent and
 are placed substantially to the right.  A very commonly used style
 is to align descendants to a function open parenthesis.
 
-These same rules are applied to function headers with a long argument list.
+These same rules are applied to function prototypes with a long argument list.
+
+Very long ``for`` loops are split at the ``;`` characters making it easier
+to see which code goes to which clause:
+
+.. code-block:: c
+
+	for (int i = 0;
+	     i < N;
+	     i += 1)
+	{
+	}
+
+Opening curly is placed on a separate line then to make it easier to tell
+loop body from iteration clause.
 
 However, never break user-visible strings such as printk messages because
 that breaks the ability to grep for them.
-- 
2.49.0

