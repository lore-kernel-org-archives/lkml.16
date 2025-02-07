Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0443A238D49
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940743; cv=none; b=gAMVSHFok5qR8QR3aXHpls4kdkVcE/cd8kOhDpCoVsCEsEhj9LkB5lfO804xiNGIikY7HhhlRpkj/noYtrIc+9/tu2GGC+SiEe+Pyuzopr68oTBFE3uj+zHb+YA7sCd0mgib7mnnDRUl/kqdygqr7zHPvnr9Ul+a9Av5Kro5n3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940743; c=relaxed/simple;
	bh=tpnl5paSFKhhqeqQuFY14M6+2w0Ab9dzNNVQZJyqExg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fnHVukbbA5xbB85nuNnhfo1ZWLFUps5WEG/Yk5eWoT/Y36iXATkMEJBTZiGqM5ur2z/1A107N/wKZypHF/oLbJQ6brp4wia7maptOgVSvFmEu7+GiDjxVoFUa5rbuSijKkRQMTooKvhpo5xWwMj9IY4UDOJuqSNLY6JuTDuVHto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0L9Pvq8; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0L9Pvq8"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2fa102a6106so392110a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 07:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738940741; x=1739545541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSw42FRgNCjxmewimBSBZv8A2FxIaDRWKJvRBMe4boo=;
        b=e0L9Pvq8jltP3SPR9kx0VNmLY34DJiBxbsZ7bm1yJUx876E6ZjrTsFdXGY2Olrr3RJ
         ru13JILfIhpqSWYfRBi+dz0cgwOYC+n6Mq8xrRR9ByjZwmzjbBQhixrFYHCkTgGKXmJ2
         lU5Ij/0DVNbqeiRqqN+9D3xxjTftzaDW2i8Orxii1EEXJ/w1DhvP+zoLlAT0x5LK5mf8
         jj8Meq+W3mn4nKl36RmAjM3aomNSo0KQwiZCn5jz89Dp2jVyF1txBPLj/chtbceeV+is
         ABAP3AEqUw8+3kxogLd1/7JuDKQw20DiZsVaGq6uHdvT7/zbjSJLojBzfhUf4HT+pNha
         iFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940741; x=1739545541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSw42FRgNCjxmewimBSBZv8A2FxIaDRWKJvRBMe4boo=;
        b=BSzb4/wkmqcf/pJZkc5agjxknXjW/9rfxGmaYFRjQrZ1fyn1EDDVUcf+BLBE9+MecG
         7sI5fIaHUXO0b+IUWJpQzHd3MwNYZUSrf+o7pZDo+EFiGBvqmHnPWqs1f4KKNz3k3YVR
         2A0psjmEUF7O+vyNfmpMGwZkBOdMmfFfRErzKYY88L9ouPNiwga8K9uVhQuosVBO93Xr
         o1bfK3eJpCrb+3/uF74/sA14eMHPaOWjsIvXFh9K/3QYomUTyDj/0I/7fbBrqFHvH877
         7MONyJazoHkZBKSKCSMYvs/8BrCoLz03c71884dOIUL9FBJ5B7Pdfj9RtD42asAronIp
         +F8g==
X-Forwarded-Encrypted: i=1; AJvYcCVuMfiMNTTsSEUqJ7hByF+csTxoA58hevKPUwevpMaO8nm7qJzkHa/N+mrw3J6yHyK5XxjtaBl7Lu6vifs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv9+JNyOnJvRbZ7M1zNtEeLPMN0abPR4N4HkK2vbIScvArSVI9
	OlrgtV2QyuyT0CA633QoowDj7vYB6QNwYkss3RLG5YE0kzCbF4YQ1V9LZc88
X-Gm-Gg: ASbGncshkcFiroR6XeM+mdue1eNxXQXZ5axdFLm/WX5hDzTpIgkVE4x0MIZvE3OyK8c
	ZVuUZwKhtTyXVE9bpt7+BwNg62Yb2BxstGXtaR2Bpnu/wBCHcoF/fJWF4k9/2IRi4KIyPk+glef
	7VB/O2G1IJlcfzvCVUnxTs2WP9amuHWLUSVWMYFfQd91p5+/33RTnHl4IIwwCC5BzQAVwuTCSwr
	/BH/CraD6vartiwLmPz/Udy81MtBUOPjc72/P3EQfqjX1UXZRv3bXiROQ9+pP+h6pfPF9Gxk0rX
	8l8xMHncNy0r3uul2OZcGloN9x2r
X-Google-Smtp-Source: AGHT+IGNlS0T/GdMUhhWevTypVg2UM3SagditpbSAkAM1Hr29uViTN4tQepsg9ZLAW/QQ9Svc99U2A==
X-Received: by 2002:a17:90b:4f90:b0:2ea:c2d3:a079 with SMTP id 98e67ed59e1d1-2fa2452c66fmr2112982a91.3.1738940741221;
        Fri, 07 Feb 2025 07:05:41 -0800 (PST)
Received: from localhost.localdomain ([2802:8012:30:9200:a83e:911f:eb3e:1cb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653b143sm31855815ad.54.2025.02.07.07.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:05:40 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ajithpv.linux@gmail.com,
	roheetchavan@gmail.com,
	niharchaithanya@gmail.com,
	eleanor15x@gmail.com,
	everestkc@everestkc.com.np,
	kees@ijzerbout.nl,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 2/5] staging: gpib: eastwood: remove unused variable
Date: Fri,  7 Feb 2025 12:04:07 -0300
Message-ID: <20250207150427.153982-5-gascoar@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207150427.153982-1-gascoar@gmail.com>
References: <20250207150427.153982-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove unused variable 'nec_priv' in function 'fluke_line_status'.

This change removes the following warning found compiling with W=1:

warning: variable ‘nec_priv’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/gpib/eastwood/fluke_gpib.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index d5b1a03abf11..65bb79a8fd3c 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -194,10 +194,8 @@ static int fluke_line_status(const gpib_board_t *board)
 	int status = ValidALL;
 	int bsr_bits;
 	struct fluke_priv *e_priv;
-	struct nec7210_priv *nec_priv;
 
 	e_priv = board->private_data;
-	nec_priv = &e_priv->nec7210_priv;
 
 	bsr_bits = fluke_paged_read_byte(e_priv, BUS_STATUS, BUS_STATUS_PAGE);
 
-- 
2.47.2

