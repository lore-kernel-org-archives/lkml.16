Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5116F22259B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997712; cv=none; b=P+oCmzH+9ijhjWBvqFPeOdcNEXXaEQrvfC9293IeURmI6PQsb2JMvgpOAkNt8gL7+C2ghxD3pum5c59RHAapptfixxmWZyoe1jEo3axsKwvFHjAlg1j4y7SpJb07y81EwBagpRqQmp13WK3zamFE+O8GWGpL15DIGUpPqpcg7Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997712; c=relaxed/simple;
	bh=LDThIiFsWtW7LNFAZQNVxUPP1fREV6zlJNSL4JVrM5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uH7aFH2Dgbmq8MuqcmPfIOVkXipm49CtddlpTvCTGd6JzNp0GXMhm83ZGyzlN/jEdj5NxkSoGN1T8u4ORck6bzrbf/Wykt2OG058c1y/kZjB3nJtwTq/XiOpTUbYcc0y0Z7ZOJyeXnCnIthr4O5dRubAZKFjE50m8gtpcdU76rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvTyJ/hW; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvTyJ/hW"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c1efc457bso1241628f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997706; x=1745602506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csArHKuBMKX8dfUeq28zUks4GtsX2v0W8y/LTpEF+/U=;
        b=GvTyJ/hWzeBpp/eXoFUc0zro8z+66tsKXBQn87NoZnq2IgHYP8E0r9Xfn/hCdVyRz1
         zW/m0ILmMDZcFLAYsAyLsiMF0tR1Ss3hxIogEuH13JyboXU0Dn7CFJYBdAUSjmbSdDqn
         RHTLH+YIpZm0BC8xOj4rdWXDKyUNX3yEZYsimuVm9hQoBhCudaSY8FbShSQYjl4by8Pw
         YqTLew41IpU+3xmmMTGAwOqP3Bd0S7OXA6hKg3IcSwGZk2v1X5SaGn312wfolFOJLJzC
         EYgHb7TMRE++lADCS4V1MgQQNXb+FO72O3K2CtQw7HiJVXQavqKfD1mrRc6lX9ErCpIQ
         wRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997706; x=1745602506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csArHKuBMKX8dfUeq28zUks4GtsX2v0W8y/LTpEF+/U=;
        b=rB0YABhf+h5D3KpIUjbXrUVgHTC8Ozth1nyjfXoyrlLOnTT6d49aEzYov2ZDYP6tTX
         H7ToVhs+8RuLIYkh/hlD38NKu36ny2llDdqPLRbDS5EuXyk2xPr+LE9Obh3tAEFt8E0a
         HEATT1ewZxoQnqPVdqZx/RMToc2/JGbRb80NCLKsueE9LOHULNjr+zEudTwVmdTQ30u8
         jkjVcKnyO01ulLGJtJYsT/WotQB/Qp1fGN8XEzkY5+ZJh72okhJLczSuMCXp48p/mCW6
         vcYnml5uzZ3IdXYCenqOwdp+SyFUQblljEEaKD2J9gR4ypDZtEtWYDVyyHaXi3NSGu/F
         /HmA==
X-Forwarded-Encrypted: i=1; AJvYcCUeF3gNeLfl6nnOIPgfC1NoMXtppEU/IT0VpoqpsB/5Pn4o1aiimucTap0oELVQXRPpKzCfgodEc5xorTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlgdlLtXYBq/ZGhuw0aF2xzW3kYjWZnuljLGkSOe4gclmZEBFq
	W3ZbuCKrgPkNfzwvZGPwUJIrjE3LIGDcJgR73yubn63y/7zwTDdP
X-Gm-Gg: ASbGncuXBXGqhA4jJQ0VbpcQuRO6fX7QEgQ/R7+lbsuvd/hnStbGz39jEO3PT3ntdj+
	pC2g97hOOQ78mfzz4LfhVO1asHQIvkPW56A9fYONL4KHK1vOz3fmfxvMJQLzG1RM7MP8ENNbbX/
	CVrDUbl8+b/EtSlLgrJ1ZqQAg5JlYIuxqvjWnYGrcH6GJCeOf1BKmp2dLsw2qkOiyg/liaSWt5b
	5CF+3SqZbxzOAK8rGJirsUwUzLMsaYtkDlWbRoA9ILir3Lw7rXGl8Rgl1F6JIwJlo1JZsUje7u1
	BFDtLYn7cMxy0FORJCSkOOhD8ITtPzPJy+AUW6VOeiioYZoIT7wUvuQj4R1NtN4OPS3SKFBWfRQ
	3
X-Google-Smtp-Source: AGHT+IGthIenlsGwjtshWXOrozso53tzfubQVslTvO6z3gNHpw83s4dbK5+maUlUJ6SvkuAZFIAF4w==
X-Received: by 2002:a05:6000:2913:b0:39e:f641:c43 with SMTP id ffacd0b85a97d-39efbaf689bmr2763752f8f.53.1744997705477;
        Fri, 18 Apr 2025 10:35:05 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332f8sm3287320f8f.40.2025.04.18.10.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:35:05 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 8/8] staging: gpib: Set control lines in attach
Date: Fri, 18 Apr 2025 19:34:34 +0200
Message-ID: <20250418173434.2892-9-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418173434.2892-1-dpenkler@gmail.com>
References: <20250418173434.2892-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the driver is attached the state of the main control lines
is not defined and can lead to hangs. Set the control lines to
a known state (logic false).

Fixes: 4cd654f84769 ("staging: gpib: Add gpio bitbang GPIB driver")
Tested-by: Dave Penkler <dpenkler@gmail.com>
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 5c134cfb6d61..625fef24a0bf 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1262,6 +1262,10 @@ static int bb_attach(struct gpib_board *board, const struct gpib_board_config *c
 		gpiod_direction_output(TE, 1);
 		gpiod_direction_output(PE, 1);
 	}
+/* Set main control lines to a known state */
+	gpiod_direction_output(IFC, 1);
+	gpiod_direction_output(REN, 1);
+	gpiod_direction_output(_ATN, 1);
 
 	if (strcmp(PINMAP_2, pin_map) == 0) { /* YOGA: enable level shifters */
 		gpiod_direction_output(YOGA_ENABLE, 1);
-- 
2.49.0

