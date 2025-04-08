Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67972561C1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150852; cv=none; b=ArfwvD8KV/v/Afb1y13SuRPUeyrHaIyDz+Fyrcx0FEArsem458I/iXXQsB0UAT2XhUQn6yzZzdmmfDYF/y2f8ffvFejhZSV+d38HQVxEVGTZ+/elbzgUOtMu9nsLNzgFXXvFNLv0F7mVti4jEqbiQszLdZsEJnzJzV60Qh1+O+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150852; c=relaxed/simple;
	bh=fwesv3cg8o4VBv6/5yiHTFa+jI6dd8WfdG5igc4D3LI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NQKuBOfZmoATtJEuxuYflpsGb7mvVfR0JQxK0GBRe4Y334xS8WCKD28vPKUrz/tIIM2Dl4tWQNmVGiv8ArBRnA8jpFp+oP19Cp5qXWl42Cg7mBbDn4Hg/OesU6X1HF+w0vdlJZTvbTvMyEP2azDdhrMhlWBJClJIMAflek3pDH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=JIoJkLH2; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="JIoJkLH2"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7370a2d1981so5243406b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150850; x=1744755650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fciAdO40HhCnrgOyu6ZiFGIBLIfrfdARzc9S5Dg/Caw=;
        b=JIoJkLH2/05WCF6H0GCjVSJcxW3u/En0fP5c+tgQ9B/n9wUOQSHfbUF7yWh2vgoDT2
         oSMlbJVZeYqn2UbaNqD3HgF2YYfyqo90xLOzJGitMrful1WH8/jIUBkSRVdAXds4jLj5
         bhxw2hlmBI9aRIbyndbx/gqwBPkOrCdEGTlfLZpG7nTR6bac4dKuMnPerQKertet3Fv+
         BT+w8gP02u/I1bHQuEc4CBztuJ2SfIiHhBkpVhFc5F4sXGBanlmUZQ0WXn5TWXPsuCSI
         3Vw49j4MPksiQWjNXJXjc17hX2JFTx2ccjX/Iw+wtv2Qck2fBkAnVqZaTb6UJYJzBH0w
         js/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150850; x=1744755650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fciAdO40HhCnrgOyu6ZiFGIBLIfrfdARzc9S5Dg/Caw=;
        b=UZt+jAsX605SF8CmnyhagKyDqUsnKGwgjLVLfNXYP2Zs/0Si9m/uP+shJT6TpjJo4i
         XU7hpnMAP2Ez37WPs51hZCFLHf1hhOKakY7UD4P2lUqZrj1ogqOOyfkDAFllQvBmcoj4
         3Q1HXWYrTocRl0vxpehy0H2xLHU49C+QIJcSNsULzs9t2Fer6nHNq9sl1jF4aFhHs0Zf
         ODz+3NBa97CvNb/idrqULuaH79cIk3CX6iqSO94XmBdconrKHLiSzuAHhXs9jSFlvNDc
         0FrZlUauDqWvRF1fYirM2kFM2ubtshCuVq5gauE++/wQWtqq3qhAu8S+p6DAiB9vNDRc
         njjg==
X-Forwarded-Encrypted: i=1; AJvYcCVRNkdyuY9CKTsN+bHY8hGJ7MdpsOvQmqCyTC/JlxB3oi/Nv6mra2C63S7a38BrZP72sk7mWq8gHjFkUC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWlBGy4UyivRXRUcybvkrAa5o6T9STmErUNHCxs3pRlrropWuh
	lAtsAp9EI+bJPwvqw3wNRZogwYcldxPJ1/gEBvgD5Z7qFjhwTqCcSVbtDKkPmF1mSWJ6j6VdBY4
	=
X-Gm-Gg: ASbGncsZ/5tFXcsZbB7CXvQxet7nTOrxsp40yQmm+L1L3EXBusvAFYj1n73pyrIEYrb
	+F/4SVjeDdC8EoFW2UHjpZBKlUxhAhvdEpo1g4a/81Sl8iPT3DcOIsqf4RGGbllMwm5rYA+8Jbs
	kgGA7bToODk4D6cKZ9sIJOyyKYGQjX78sxU6eDMZ/+Hzkti9QO9VMB9ovZvtRJNq2bUZ+T/KFH1
	4rpMEa6u8YG3UEn2rvH4AmLoxV7DYQu78Upyw1xLThdMeaGIY09ZOtZKSO9EBzCmuXEelowWCgz
	61puaQ2bp+jlF5N34dL78Xb8aJ2kxsB5CJSk6tnoDgxl8JNPIrDHy+88JhYwdpO7LHfuugrHEpA
	r/29LQxinN4De2Sw/8ybZ
X-Google-Smtp-Source: AGHT+IF9GoaVnRN88Tn4u4acoy/C26eOIHkUe1GhVr3aB4dlN3cLyYHgPHD+Fh0EkZIvMQV63Ma8LQ==
X-Received: by 2002:a05:6a20:d490:b0:1f0:e3df:fe1 with SMTP id adf61e73a8af0-2015ae8f37amr157619637.4.1744150850272;
        Tue, 08 Apr 2025 15:20:50 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc2cfa87sm9615769a12.6.2025.04.08.15.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:50 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 05/14] staging: gpib: nec: lines exceeded 100 columns
Date: Tue,  8 Apr 2025 22:20:31 +0000
Message-ID: <20250408222040.186881-6-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

CHECK: line length exceeds 100 columns

Reported by checkpatch

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/nec7210.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/include/nec7210.h b/drivers/staging/gpib/include/nec7210.h
index 069896456230..4b06ac0408df 100644
--- a/drivers/staging/gpib/include/nec7210.h
+++ b/drivers/staging/gpib/include/nec7210.h
@@ -101,7 +101,8 @@ int nec7210_primary_address(const struct gpib_board *board,
 int nec7210_secondary_address(const struct gpib_board *board, struct nec7210_priv *priv,
 			      unsigned int address, int enable);
 int nec7210_parallel_poll(struct gpib_board *board, struct nec7210_priv *priv, uint8_t *result);
-void nec7210_serial_poll_response(struct gpib_board *board, struct nec7210_priv *priv, uint8_t status);
+void nec7210_serial_poll_response(struct gpib_board *board,
+				  struct nec7210_priv *priv, uint8_t status);
 void nec7210_parallel_poll_configure(struct gpib_board *board,
 				     struct nec7210_priv *priv, unsigned int configuration);
 void nec7210_parallel_poll_response(struct gpib_board *board,
-- 
2.43.0

