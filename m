Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF58255E2A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151123; cv=none; b=HRdaCA/hSPfUu5cm6hF59V02VXvhrnVuDztNWzV7zGjjXA66D2xqp3HUL/dPgtRwYGvcvsqcNTi1fyPUlzqoaj37YMH/Q7pFN2MewC90NJ+jJhg7a1LzlEXJqofI2+SemFE5Mko09Xt8a+2M+BeYDzSYiZU1cNAc/pcy9ZoODnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151123; c=relaxed/simple;
	bh=se3YZvKLgPAHLR+BdipUhIdfwA1QSNs3G/9/cqRGo60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AqmA+WdZlgb3ddAOH63xYxCtskLb4ldYnoOaEPnfF+bko1l+7A0jsKg/hTZwfrQ1YgPf6DxVmTDaIUNFQNSX+E+dgoJztC1ibOoB1StfG+Tb3tZ17+JrSVQ4r3c+ptbBQnp5eND2CCFX3sgbQ8uh/GC/WUfnuVwdRoGdtCEMBjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=OVVsprla; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="OVVsprla"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ae727e87c26so4063559a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151121; x=1744755921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4C+lWNdknUJZlypfGnCZDNz6KdZ6zmn7ch4eG88+8lE=;
        b=OVVsprlaubvDlTbEX5b3ViCen0ULIxiKS+Ukk/YKJQhOjzgUmS41wYANQlzfsxqw9F
         VBdnwsPJOnrDTYd2KTG07mK1ahz/87FMyxraFZofDiax8A/Od1K90biynlDjQ03LnzBj
         2Je4891VuR76BTJxI+XSoQyJF7HU7/NHoW1uPccmGrxfMsGlHdDeWT1lgodx5EM7mWhS
         6WD4N4caMzEVuQRRoZl2ZNPSUFqi28S7yzWJv5G9l33n7lTIIDGzGmPm3Lz3HgdKItCS
         rR6kJbaxxiiIY+qsRGijtqfnocfv3xXKDjQ7mzP0ZJBnxMrgoIn4HsVI8NUqQgatLLFG
         iktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151121; x=1744755921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4C+lWNdknUJZlypfGnCZDNz6KdZ6zmn7ch4eG88+8lE=;
        b=qmScoBIG9pY9H2ae/VBHBqfSZqmoHYv7dePprP1yiSgQGspCEK52oqyAZrHhbokwWH
         QfEo/M9I/1ZXDjUo6X+kbgxi4pnCrx1OlyuStDOeHldQXA4wmXv9gXoUnlkpD77w1F3a
         75TpHgJ41b5Au1aYW/Zr8RCUKjQuBHhNqxqavUj+8zoJrFbDKDl/LfsZlcV4Mf4OmKkY
         BUMEkiu8pV3KSyAHoI9nPKzli2RwCrmXwDsIyElMg+t342SP5/iv53cRVZlF0bkS+Jiw
         AUQ8synGfdZXJMjfYx5m0BlqBv1Wx7YjGSfBDKPN9zXeV9dIy+4y5uXtuKSVWGbSiOty
         i0Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWEjO+hGFi9G3WImF1GlCqTGmWrUPDBaqQU/Nf1AWD7oQhCCDUR5JlEZ3NOhHrNWTugJTwCX6w4Rwqk3tg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjlFbg6oecwCeDbs39zkSNBIKYAaTru4bpkzm2lWdGkJ4CQE6H
	ArSoMlWgvxdXvrUaCBn3q31diS7o2W1ZFOpDl/RLPdXfUSM3vUw3KY74EuekBA==
X-Gm-Gg: ASbGncvZgqOF9MedHER9cM14ao1vDDgL+JTqoPBwsL1Q9O8hOBY6ieo8iF9iI4DP81q
	TbYVgf5ElSv18TMrtyzWsBtUVn7QTCWbU5WweH4y0DROAHze+oJy9gSWUqCf1/AJhHjG5DCcQP9
	PAaLU3B7b/kcIByCN8I8ryBrzNN51jD22LBk8uwH5ga+AamtxCZcU9XbAn0TOqHdI863alMLZTc
	7BzeMTXv3F7dX0vbT50iiA3BQWro2vnOxLQyNoOjVs46CCtAc/ZNxJ5P+duzBszXvXPKZKBnE7r
	xnhJ852kCdwa3SkJsi7eb/FcIMUbydnbn0XMMaxn7Jl5Utp6tSvCFiU5sb64vctwVxYK0qdBmiR
	ny58QhgVd2g==
X-Google-Smtp-Source: AGHT+IGyeoiqqphPpKL5Sn7eKU4nhD0G7aTXKtNfs0fA6Ybtm7sOFRaFnTq6ISHfRriprZbTNWKv+w==
X-Received: by 2002:a17:902:d546:b0:221:7eae:163b with SMTP id d9443c01a7336-22ac2a2e867mr11925265ad.46.1744151121190;
        Tue, 08 Apr 2025 15:25:21 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e6a9sm105819055ad.202.2025.04.08.15.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:20 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 10/18] staging: gpib: hp_82335: struct gpib_interface
Date: Tue,  8 Apr 2025 22:24:56 +0000
Message-ID: <20250408222504.186992-11-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/hp_82335/hp82335.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index fd23b1cb80f9..1a93a456f7bd 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -179,7 +179,7 @@ static void hp82335_return_to_local(struct gpib_board *board)
 	tms9914_return_to_local(board, &priv->tms9914_priv);
 }
 
-static gpib_interface_t hp82335_interface = {
+static struct gpib_interface hp82335_interface = {
 	.name = "hp82335",
 	.attach = hp82335_attach,
 	.detach = hp82335_detach,
-- 
2.43.0

