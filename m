Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E165A21B9CD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997701; cv=none; b=Pmy27maYU22wmET96LsZUVZLwTP8tSD+ozy5tA+JOuRgkF0ShHE64NCi49Y3SvBi21Wgj8LtbgDH9aUSnCPhOOchvnLNx72UiBQP4VP0u+EUoDQ/DyxwXRG2XSuay6lKHoue7mgePJl3Ietx0oYSGNinCAnirpB26r48rvMuxm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997701; c=relaxed/simple;
	bh=Y6+jh/N20q5vgDZ+rUTiFEYPLOfUfkLSliU92OGQsrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GjAVKPYnyFOlVtxnPzdqDVhFiJAjkAgN2F5PE1MFdeG1piunxMn7BFp/yh52nTSkbA8+eNT8hpCmG7BnTV3Tb36HJgFzRpTW9MITuuzhGFdAEAu/cCObyFSdbA5/wYPMb/L4KFYfA4ULQRr/vGh4OJXSDVC25jhKxQiTxuH2Otk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Spra1xXU; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Spra1xXU"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so1421651f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997698; x=1745602498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzATcEFy4yD0nb8pE+dCXra4c1CFrIcpPdFq8ieoLC4=;
        b=Spra1xXUGFGUnfxipZ8cUFMB8kyNNTXOFrQAQuuq8RA12zy6DPpibjLAibw7DWhIip
         CzF2yWbY+0xqAALDfBE7dwvM4YPhaz/xpPxa/eXSELGuYq41PrUdOoJ66SOYyz3yM1px
         uyeuKexZsSsQcENpMZ2EOpW+kA7OOvPJIe1yz9MhmweyNT8fr+wtTHEKkwU1ka6s0bn1
         hGlD46dptzOuo+hjrEO67HwtdUK3/ZcSTMuWozt9C+07M/+sP7FVfasFXQ/bvs5fWFtt
         JCTIiJZGNMTJ3Q3do0CIMUZINk6WL/OE8XiI/YGpbnP7UaLadU8hnxqEWMKIA/SFW4Wm
         iuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997698; x=1745602498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzATcEFy4yD0nb8pE+dCXra4c1CFrIcpPdFq8ieoLC4=;
        b=JIQCZIi0uixKyMmHbz2M8m5YWr+64fzIUIlPqTAbF5hTFfgpfgQSZMfFdXVTGRvbSQ
         TbVqlqEEtP24a9rXD/f/70g/IdIiLAi1mEtNa47vCPcuez+n3T1vjDucHA/Er6XDLHIH
         MS58qbeocC89+xK1B+K5hOm/oOsXBdgx12nUyRVXK9oR8Sxgb7y+PK2BYH6v3JxS3tEV
         wP9xfjKIP4vA+I6ybNAG2rtT/7VfNdH/yu28ch5FkIrb6ke6nzkjhGJk/VN7dL2bhcnU
         r85xfI0wmbpQXkNa7DTjr2cFX8vpQMSze3q8mPo3zKtDdWmLu8CPEIM5YuCGT5kdQ+do
         txUA==
X-Forwarded-Encrypted: i=1; AJvYcCUjO6QAyUCUmpZWd7LMhpotj6FD8sTbOAjkQVAumRJF7RA04wlnm/MpI+kiVb8hQqM2VI9lPxSTIqwV1hg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxedzhyx4GRDElBl9tS3Tw96BauL/hqrJs4lxPJoUsrkKu3ykMc
	WBMeXukppF+WPCPkTHVlp84zMFAWDA90RmxyxdUHkvg39G6YFEDw
X-Gm-Gg: ASbGncv7knjlpaOA13jzhzwGMuZjSG88Le5HPbdL8K4uu4LV1Dd2nSsrHvSDWIR7JjP
	QBhqSV+8u8sP42u2TdB+etdChY6PFwaoQndAYol3As2lLhLzCXk8A17zCYQv0vJ10hXWxuA3KzT
	TrRLJqV1564gxgQHsLTzQJh1ioQ72SXn0aiXwn+IgPAJQPo6N/SAqLIFzFoP78j8QHaJcN5R8PY
	VwUE0nl1B/bwWteqVNdiFlSOP8RWFgn1Rs8UbguhTnuswzPu3Ofn/iOyotU4sgs1dmCNTFf9rpS
	jsjG4283avuzkqnH3DxOORRJDOyd/Xd6g5JMcAV1pyFn4llquw0Xs9CFBHc/d2XF4t5Z7OGmMIX
	4
X-Google-Smtp-Source: AGHT+IEZf1ha1txArdhgWM8acBtGgyt+WHvJBGwchmFEH5kJ9VtYLcai8G/K+Zp0NjdzZjrfpODs4g==
X-Received: by 2002:a5d:6d87:0:b0:390:fb37:1ca with SMTP id ffacd0b85a97d-39efbb095eamr3057655f8f.53.1744997697904;
        Fri, 18 Apr 2025 10:34:57 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332f8sm3287320f8f.40.2025.04.18.10.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:34:57 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 3/8] staging: gpib: Enable SRQ irq on request_system_control
Date: Fri, 18 Apr 2025 19:34:29 +0200
Message-ID: <20250418173434.2892-4-dpenkler@gmail.com>
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

The SRQ irq was being enabled on attach but the board is not
set up to handle it until it becomes system controller.

Move the enabling of the SRQ irq to bb_request_system_control.

Fixes: 4cd654f84769 ("staging: gpib: Add gpio bitbang GPIB driver")
Tested-by: Dave Penkler <dpenkler@gmail.com>
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index a92c4eda99a0..ac9ecb6e0aad 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -884,6 +884,8 @@ static int bb_go_to_standby(struct gpib_board *board)
 
 static int bb_request_system_control(struct gpib_board *board, int request_control)
 {
+	struct bb_priv *priv = board->private_data;
+
 	dbg_printk(2, "%d\n", request_control);
 	if (!request_control)
 		return -EINVAL;
@@ -895,6 +897,8 @@ static int bb_request_system_control(struct gpib_board *board, int request_contr
 
 	gpiod_direction_input(SRQ);
 
+	ENABLE_IRQ(priv->irq_SRQ, IRQ_TYPE_EDGE_FALLING);
+
 	return 0;
 }
 
@@ -1299,8 +1303,6 @@ static int bb_attach(struct gpib_board *board, const struct gpib_board_config *c
 		       IRQF_TRIGGER_NONE))
 		goto bb_attach_fail_r;
 
-	ENABLE_IRQ(priv->irq_SRQ, IRQ_TYPE_EDGE_FALLING);
-
 	dbg_printk(0, "attached board %d\n", board->minor);
 	goto bb_attach_out;
 
-- 
2.49.0

