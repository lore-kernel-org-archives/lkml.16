Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802861E9B22
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747620340; cv=none; b=pMu9ubDJzI7b4D8vTjdAFOyIWJt+NBEQyTQFkcYaGcH3aagGDCQRCYQkM1y0eq3XAlORh1JoTfGB+4ZpdxX/3WO18UkCvFR9oF0jNy0BedYB3GnISSrXIZK2Pf4FofY3upkhisVZRWxU/ZkZQ7qHeWJ09OLHXW8Ez7yEGaeI9FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747620340; c=relaxed/simple;
	bh=Ir3qwYotxNrRx5ZxChu6Iu2jJnsU/GgC2Fht1CI+cJ8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DNfmXc0+6RJ26pH2LAghe4jtQTjIti0ld/vwP6+kID8FTs758QbApgd+ybtpwS4gb1B/lAqjCWPNnkAUmctTMcqtcrso/vJqtAazIeMOywkGqGOMla3pJZupUZsT+GYZvP/q/GrQr1fL2qbGlWTtOemJyglI6Zxc3ktg2oxZ4fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AjZ2jGvR; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AjZ2jGvR"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-231d7f590ffso17928905ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 19:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747620338; x=1748225138; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ia1JORafIKNf9NZI5rHJee8OYvmSWCc+nVXQMpMhVBM=;
        b=AjZ2jGvRIbql5yRT69LrEETgzIU95bSRWXafp9+IEFnulI8cch/xPDNHn7tOxC1kP2
         zJQ6Qu6V2YhGb/Tef/q/U91ksulsT3sI4QnhsXwW/xc/mihWvUU434j/gDkc+hgoaBry
         sFjt/T9JW2lxn+XQ+g07HJSwAZAdrf0j6cmBQvzz3SjXYjpI1MbEaXGlyznHXoHY5dMj
         wsyXMC+05pmlQqvH18r+O1vXE89M5tsqWYlZ/WFsqTJqFK26gL/0yylKmXF3Coa3zvmt
         KJUpLCLIEqoOlrHctfmZG5ACaduosh+Iw0m79eWqJYBm7uUP5+UZu9uZEZhLW1SnjSAE
         6/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747620338; x=1748225138;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ia1JORafIKNf9NZI5rHJee8OYvmSWCc+nVXQMpMhVBM=;
        b=KktBACoDynPXC54o+Mg1zQkDnM5dNh3Izc5d0qhdF7Te157lYyq+zFTva+KCDqzReU
         u2gip63AkUnfL3qqUVCr6Tj2B7eZN8mGWYR8Bw0WKty1KCtw/YTpVAf+uks/r4FidAnd
         JvdV3KG4fUGKnSlGbVx084Ol7i15yIt9+J0Gf8SnHUp/s+zbO3vGXffFMdQcZsd9kZFv
         MmM2HU2JMU19X7Ix+DnoLEDM8zcq+C0ZzVBesRWXQNOROhrlS1xawvvjMVHCwIi/IjJp
         m3k3c/l9TTGaguQv+zeemuYuAIy9S+UzSVCjc4buFknOBph5vhByPBEsRF3zY57B4nNq
         WwVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLA1su7tEs8g7Df5Ygpi3P4c7iC1AdQKOjPkPHJ5S8JItjZ+XyASOSrsEWPCiwDGt9hqDn+ZRPVb7GCWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGNN6Nrjw4dESiKFJqjnU6ZoxSatI6M6rpgJ6P78Wc2SdcttBX
	bijbm4ooVBt6Xpu75THEeWaE6PQWLnD+ICpqa+8B+lcxlSvQNjvlZDvU/L8rrl1HDtVSMqF+9fw
	szV/OQa5IQgA/lwEvwq0zVw==
X-Google-Smtp-Source: AGHT+IEYub+CaQOwQjmJw5cedeG+QL91WXp6CF/LfCf17xPCOhRY9xShUpV3HD7yhcXlneRVxb9kapYtnJqa5486
X-Received: from plbmv15.prod.google.com ([2002:a17:903:b8f:b0:220:e952:af68])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2452:b0:223:628c:199 with SMTP id d9443c01a7336-231de37fc12mr145942715ad.52.1747620337952;
 Sun, 18 May 2025 19:05:37 -0700 (PDT)
Date: Sun, 18 May 2025 19:04:51 -0700
In-Reply-To: <cover.1747619816.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1747619816.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <e00a39ffba89e000fdf8dc277166297d995aa891.1747619816.git.ericflorin@google.com>
Subject: [PATCH 8/9] staging: sm750fb: rename `hw_sm750_setBLANK`
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename `hw_sm750_setBLANK` to `hw_sm750_set_blank` to conform with
kernel style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <hw_sm750_setBLANK>

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750.c    | 2 +-
 drivers/staging/sm750fb/sm750.h    | 2 +-
 drivers/staging/sm750fb/sm750_hw.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 935c7b1a0fa4..eb7e107bae68 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -606,7 +606,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 	crtc->ywrapstep = 0;
 
 	output->proc_setBLANK = (sm750_dev->revid == SM750LE_REVISION_ID) ?
-				 hw_sm750le_setBLANK : hw_sm750_setBLANK;
+				 hw_sm750le_setBLANK : hw_sm750_set_blank;
 	/* chip specific phase */
 	sm750_dev->accel.de_wait = (sm750_dev->revid == SM750LE_REVISION_ID) ?
 				    hw_sm750le_de_wait : hw_sm750_de_wait;
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index a70f51d08dd2..97682cb8c58f 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -211,7 +211,7 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 int hw_sm750_set_col_reg(struct lynxfb_crtc *crtc, ushort index,
 			 ushort red, ushort green, ushort blue);
 
-int hw_sm750_setBLANK(struct lynxfb_output *output, int blank);
+int hw_sm750_set_blank(struct lynxfb_output *output, int blank);
 int hw_sm750le_setBLANK(struct lynxfb_output *output, int blank);
 int hw_sm750_pan_display(struct lynxfb_crtc *crtc,
 			 const struct fb_var_screeninfo *var,
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 04a0f9218eb8..c64807cd06b3 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -421,7 +421,7 @@ int hw_sm750le_setBLANK(struct lynxfb_output *output, int blank)
 	return 0;
 }
 
-int hw_sm750_setBLANK(struct lynxfb_output *output, int blank)
+int hw_sm750_set_blank(struct lynxfb_output *output, int blank)
 {
 	unsigned int dpms, pps, crtdb;
 
-- 
2.49.0.1112.g889b7c5bd8-goog

