Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4461C25A2AA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151846; cv=none; b=NuWViWZZSZQN1VMYMWCAGvlmErY9nvqpLFGegCxArjGzDd3qPCWpis6jUzoo5EorqClRgKIJNROqxqVngLbuIQVxT/WSJlFjLPJTSsCK6LCYqe9AqJzCK2k5pI9oEDysxi7D4eyXQaTZ/kIOJXmmrJcvgOewLLeeX09IG/tqCak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151846; c=relaxed/simple;
	bh=EDe/v+ceS3a7mNmvmw5sWy6oiSYKVkUiKcSfABJrvLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=USWIE2cFGtKQZtFgH3LSxQ1JJSdTPl8TssQ2+7Xom2aO8T6Kp8KXK6yKp9N3Iy3bTsAxwthxWOTcAp0YmtmIaLNCe8lkjK2cHMUvWpZxBu2WvAgfRsPBBWXekBIsb/WODJ+YSUnBqO4L2Vbi88lxRWdqgpWz4xLGNcwSNjV7ruY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Tqv+a1h9; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Tqv+a1h9"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736aaeed234so5180809b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151843; x=1744756643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HafV7m212oxhd9ZR4mr+TfwYqRBb6sb8NYg6QNI6i1I=;
        b=Tqv+a1h9HfV3b7o+P+G5QTdpZHPiSw3mZeU6WwqlExBgRn88IhITe29FXy3YlqJIdT
         CNgO+2XQcUGy8GFC402eOBfiNhaMMlouY3wdzIAqGFBaJQRxYIRrFwzh8DCa/aFK3vxC
         AYoep3D+92HjpqVvYueZ+LBZxolJcXOrtPLCxKMH1tts1ZCfJYkFjl2K4g+qjmMz5dnU
         /onHycyudfPwWyiK4kkgJYjoBKlZZjEDNKXwVjlRIypuGE8hnlugSUBRyskgg1+RH6tb
         7gglWheLLLVFPbfEOU14O8pjXL17pQ4uLnnPMG8umzf5Mu/5ls6yQ92+966rpISbrC/k
         FJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151843; x=1744756643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HafV7m212oxhd9ZR4mr+TfwYqRBb6sb8NYg6QNI6i1I=;
        b=avm/pd9C/9xPnH4n5I0cgwOmonM9y9d4HBsu5z4WXv0Pssr6cvMBgnJ84MXsXHFkli
         vpfR3z+hzP7TZvwDUY6VFit4tLZostbuNUa+PxNYI6SQFShJlHpraV2ZSCZwlbPBD2hg
         n6PNAEin5n79/bpoX9W9KiDVb2cx9c+Ug/KEsqie2kQZGYOQogFXPFu081UimgmWy3gN
         zzMS1pZz7YfeE+DSByxIlmSaNtQdkPtj7k6Ha49kjQgpwCVNmnWDnL69/jDsiSLPqrkJ
         FY12LrzqKC0zPxOThE5HJbsQZh21Nqp8s+RQlj5hyzQZjE1XgfoHBWIKJovruEqqT1Rs
         Ktng==
X-Forwarded-Encrypted: i=1; AJvYcCVSDI1Rouf+93jU/LrCkMlrZkAGPi+Yb21ON6t86eZ/uoH+CkRiURKUVGsHFJxVcDhz+GFw5zgHjqe+l80=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWGF4E62yI1zIki0BUYrArevuDAg6OkU/mHeP15XVJY4VEU+gP
	Q3nN6+m1KHNQGZhBLWR/kVvSxzmRxMBPMtwvfa+mqTuijBUrX1/jBZQXb46bIg==
X-Gm-Gg: ASbGncssNsKz8JEn6kJFmFJmv75w2L/UoCk6esLWMdM4cpG5bWFiU973BibIyk7JERW
	IDGf8BVGhEGbnILVyprwH1qo1WdqYZNA+fU5xl7S56o6ZypWwq7faao0yr7iZHL/iFDIdCPIpWI
	z1i41R1BxAASHdbCvD1aGnxPyOXhZ+2AcUX/8yNOdaA34guufKblmHC4HF16+cYLhBEXrvEOkih
	QPf9zn4NlNIDHpUb7/DMMOGsm/QafpT9rUinvxML7GYLu1eZ8vcMA9q4VJLqTUv7HJnq+9gW5vq
	YyDv9bJ3Wzf7jIpdi5+Vho8AHHl/wnu8OjRJQsXZkVZqdw/TaZDlZ2/NmfmM6RmWhBFQIfN0SSZ
	Hpj+4Qs5zAIGVU6qefZKT
X-Google-Smtp-Source: AGHT+IG8o+6R23mHGAHJzEyRzY5w9h+Av8Ahw5BDr+ZVDin1/+zjf4sgEVTD8dOoEDFUTBUNzC5pkw==
X-Received: by 2002:a17:90b:2d0d:b0:2f9:c144:9d13 with SMTP id 98e67ed59e1d1-306dbc29f06mr1214429a91.24.1744151843610;
        Tue, 08 Apr 2025 15:37:23 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e5d7sm105919855ad.124.2025.04.08.15.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:23 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 18/18] staging: gpib: Removing typedef gpib_board_config
Date: Tue,  8 Apr 2025 22:36:58 +0000
Message-ID: <20250408223659.187109-19-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing gpib_interface_t to adhere to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_types.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 1c641f17bdeb..0253ef2c94a3 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -23,7 +23,6 @@
 #include <linux/interrupt.h>
 
 struct gpib_board;
-typedef struct gpib_board_config gpib_board_config_t;
 
 /* config parameters that are only used by driver attach functions */
 struct gpib_board_config {
@@ -55,7 +54,7 @@ struct gpib_interface {
 	/* name of board */
 	char *name;
 	/* attach() initializes board and allocates resources */
-	int (*attach)(struct gpib_board *board, const gpib_board_config_t *config);
+	int (*attach)(struct gpib_board *board, const struct gpib_board_config *config);
 	/* detach() shuts down board and frees resources */
 	void (*detach)(struct gpib_board *board);
 	/* read() should read at most 'length' bytes from the bus into
@@ -291,7 +290,7 @@ struct gpib_board {
 	struct gpib_pseudo_irq pseudo_irq;
 	/* error dong autopoll */
 	atomic_t stuck_srq;
-	gpib_board_config_t config;
+	struct gpib_board_config config;
 	/* Flag that indicates whether board is system controller of the bus */
 	unsigned master : 1;
 	/* individual status bit */
-- 
2.43.0

