Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3BA21FF2B;
	Mon, 23 Jun 2025 22:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750716623; cv=none; b=mxeRq0+DkdhaRgW1xnKWOrrG69cXktnaKG6zETaL8fWuGrMdBNQ3ctGKFbnRHQ4yJt34enM9STJpNe11Dpg2vtGZwyJFs8bgLd7RBIaikE4VjP/NL53COn+/r3itIPRL+psAGvxsRUyVK9V0R9EiZ0nQnUbpa5o0070kMk7NbCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750716623; c=relaxed/simple;
	bh=rJtgUixg3bc+6Lniu8+P4i4uXvGUZP8yfzVme7m18jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DpL8XaVyc1Sxj3oCKthqiOCFTarbbyecjynEVvK1EIB63jPDSBlRZeuNhiyxe+AwRR0yYbMT9tLZGfZQ3Tn1GeoMTHW7Th4YKCBCNWJ3yTih203XTszhdF0hrhiBWWX2bhFLDKBfzDyCKBggg4iOrj/FvCzaVTMZLYx0prqShdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7f4xynt; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7f4xynt"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a528243636so2859264f8f.3;
        Mon, 23 Jun 2025 15:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750716620; x=1751321420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g6osNOP9K2XHQbWWpjHXmBIwvo4RDOmUZ4V/GR1O0W4=;
        b=L7f4xyntEBP+TYh3bBkYRP1Pdd8lQLVIXmcce5jM+VQuP4n2ODpZcA/R6r886FzaOf
         yvmAwDv/Af+vXJ4b4sb/NRUWmTzsmcT6iX73cl3ITbH3Gwb78AcE+Gzb7to4CeJ8+fNG
         GxMsqsNpHlHtYJdE3NqUWdGAIhZyXZ5sVtMiBzEB7NZOooLoCCmBjT2ga07R6OV29kSa
         fSC+jpt0a4PKe4IIuwJTyupGn8+lU0VJLWScGzkjOCIzgPNoiJzVi2OVq2YkwFsIvtdx
         4FGB47zO+4iSXiXk5Gd9ystHEKMc3KfgSDqGMPZAVBzY6b+XONVqj+sfFZeRz7KcoJHO
         ZJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750716620; x=1751321420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6osNOP9K2XHQbWWpjHXmBIwvo4RDOmUZ4V/GR1O0W4=;
        b=rz9HgzImQT8OeINKD2aCqtNCFb3dY3CnVya7uhGXpuLV/zIvhvu/bxRYLS4sQlJO9u
         YoUFFr2JazUSSc8rpgaMFuf7MU1WgMEe/hjTB+eR2VA8EPSuovYuBHIW2jdPf2EhppsM
         WYv6xKMG8fKi5DjUjoV4k8O8UM3owyLfJBqVt9VMfQbCLoUeaDwdPDNFvEhvUv1HYMB+
         qgEaavFBeGI0QWNHQr/cnRq4jWy9mBQEYHeu5n77eSVXM1RTJqGkGmoc4mON47EGRMpL
         9QXiJVuM1nYLVYAyBMd1XfLiGQpLZmTA8giHPfRhYXd/Bn39G94GufVijYA/vrf8grfh
         rLQA==
X-Forwarded-Encrypted: i=1; AJvYcCWQINpNe7w9z/TETPHwjnc0yMdKInCIJe9vge/WNsCqWJHgpVvYvDEb2POYcUpzGulJZD48GH5yzc9qdwg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwPPcXNDG30NetpofSV2NdEfpG7goTCJAjljvxM6tf7/4/7wSp
	8xHCzI/BWtxJgHKOXTvECM+ocmBBMZPpHCIUBVVBh6un0KZ8pnNhd1qD
X-Gm-Gg: ASbGnct0PVkvlQqRs+rqbWDxHgfhuYET11S90f6zSCHW1Jp3XyzF8I9OvWmFcbVSghg
	vrV+5NfBlpxSR7svPMVxzeNuKk4pKqRhqjqCt7T8fbT0veT0je+m0unQsGZncRde2CRAaI9qjui
	9axW3+gMXsW6ShYIIktvf5OaRI2FsSnvBp4q0zq0VOnJFE0eWXSc+B9r8YtNHmNVFXDuJMDaIgV
	xMqyemmhMbkiFDDObnd+DRxjE3DppkZDODHV0I+vK39eOZSMQf2Fa3N5PrhIkRY/n6o+qnZkgRk
	QSY4ASv+22OWfMfIP8s0S3TkihiIh+R+bZsoWA8yp+r29BjMl79/8uoM5YpF
X-Google-Smtp-Source: AGHT+IEwnihSKaV9MZa8JbefwtxfYi1D+ExJQVtkVsokJq+3Xaa3axXjCwHA/ovAMgIPs5P8j8qYfg==
X-Received: by 2002:a05:6000:2503:b0:3a5:39d7:3f17 with SMTP id ffacd0b85a97d-3a6d12e68b2mr12366601f8f.47.1750716620193;
        Mon, 23 Jun 2025 15:10:20 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a6e8064c61sm250475f8f.36.2025.06.23.15.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 15:10:19 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Rubin <matchstick@neverthere.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] staging: gpib: fix unset padding field copy back to userspace
Date: Mon, 23 Jun 2025 23:09:58 +0100
Message-ID: <20250623220958.280424-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The introduction of a padding field in the gpib_board_info_ioctl is
showing up as initialized data on the stack frame being copyied back
to userspace in function board_info_ioctl. The simplest fix is to
initialize the entire struct to zero to ensure all unassigned padding
fields are zero'd before being copied back to userspace.

Fixes: b8394732ff0c ("staging: gpib: Add bit and byte padding to ioctl structs")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/gpib/common/gpib_os.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index a193d64db033..93ef5f6ce249 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1774,7 +1774,7 @@ static int query_board_rsv_ioctl(struct gpib_board *board, unsigned long arg)
 
 static int board_info_ioctl(const struct gpib_board *board, unsigned long arg)
 {
-	struct gpib_board_info_ioctl info;
+	struct gpib_board_info_ioctl info = { };
 	int retval;
 
 	info.pad = board->pad;
-- 
2.50.0

