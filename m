Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE002505D2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151827; cv=none; b=re6HrzQy6ggC35pTnAp4OY04E65P3u6GiaW8tk89g4ECvyrBFcqjHIRHDDMKH4qjFBAAbC7SKlMPJAOkqsQfeCGOxPRGUrWQcy9aWZYOLCCcmLLxEga12e3GrkAc0WeGpUVZvn3GkPO/9L8ORu0P1lSX4gYhZ3QmkgnqPtAFLXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151827; c=relaxed/simple;
	bh=MtZ3pwfafxNRz2P+XhgMUZBfB7smsR8XiJQ1pvxPL/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RllhVXmc+k/vpGuQyo750OD33fPq+vNtTKJEQEqHPT6znsyR+Z65dWoyQEy++WQfhFuTLxZ3gF2CbZUPlsmC2zPcxbVXuzWAz4Bj5NSPaHTiMKtfRmLIZPxhq3Ad00rtcv3dCSFT7caTzYiBJX9X2X44Uw8EHNJ13Re2oZYbIU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=c4ssQOBv; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="c4ssQOBv"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-225477548e1so58571265ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151825; x=1744756625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5QgrCJAQQZVGHYnGyP5Rqa3k3tzQutVKd7yDOG3Sy0=;
        b=c4ssQOBvx9EeSES3txNmWr5MxPYPSI+T6xanMeAsvFZI7W3oHv37WhV0U0djUo138D
         14hTwSKLJWgwtCvKa53ZfnoF7qqhJ/YrHpTdSNCDtpYfY9nLcI3CaLE/93Rak83UyBYX
         HdjJHHT4ay+/gBtCq0InM7SOcnwRN3Wd8BFpZeZu4y/bDi5quaXckaU3BZSGws6x04/6
         I9oaDb5+DddO0DSTaLS0fGnNR4kq+TiK3GaTPETj5uoYheyuXtu6h387aYiWohFauxbr
         TkXU1OVDbqSlk8g5yJtvrwIn5HdqZFMxSPY+y2/sOiPYBjTOFo4NL1QROlL197K9X6mr
         RDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151825; x=1744756625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5QgrCJAQQZVGHYnGyP5Rqa3k3tzQutVKd7yDOG3Sy0=;
        b=icR8O4a6aO9yUFLBZE58DSVvyFbE5/d2aWBNvOI7gBv5eAoCog03xIbCWtd5/W+vvr
         +74Rks4is7uUH4qFl/teA0jbGRjpaG8SoKKPc0vaBrgpXajGn5O+y/F+L8sftik81djW
         QJ947Gwy1groy2eFdOEdKTQZXBc0lX+7Urcz9WGZli1AOS2fmbHEjDoBwZqybmgDOKDu
         lvw44M9CIDCRFaSQLd6z0JX+t9eBC+ovsZdgPv2UAe0u4i27CzdTZHF+DsHBDDaYOjQq
         DVjOOvXbZWg1rkL5EQjBUCEScqjWtiuxKp2G0oLJxX6IwJTQjf6D9GHL3abZ+dUh32Fi
         VUlg==
X-Forwarded-Encrypted: i=1; AJvYcCXu4XMDUMFjemzBlD43XkD5wRqSlFEVE/mDnjFGhinxxZFpJfdnRNKjGl30P8BNkkaBIREps4HV51nk0tY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6N4odWg1DExirfoz30sG53zIYy+c+KTddLq2oefPZAmykbczD
	UApYXxozr2NL2h1y3cKgYuhIgqvXgXK9EJjgUXa0SvIylsWtREXOO5X8nHZY2A==
X-Gm-Gg: ASbGncuuOXw3JLnGeZ130Ug2KkjJINFBhnhg0QczpXZK7ztmsrUYFH+hpKlAIlhb+DN
	nF1Ccuy8ctr3pDbAyp54PerbYMZulIpkEtToHFJLmRRNWYDjuEry26RfNiMPFtSZmZdhQm4AQw4
	hyCNttyPuwO7xuoobSMF5qmyhjMn4PrXBlQNjHzfBLxvhnZa1OnhapbkaO1oVMGXx50dRYVUW4s
	mWPCkba2cTcQaVgD3QlbBP0vINYHvWVRePk1tamNT5Tvqw/7GGw8oZIQooeCvTjc35Jq8U92L9w
	+Ily6AmBDKywG/kanJ0f4B4WLTzeWS6JyPqzRmhz0j5lSInPk3pxZuweKjNOZJbpJr8Pz8LPtUv
	flE//qdpyOmdbQpOciSSR
X-Google-Smtp-Source: AGHT+IGdJru4JHcvDVy0T5okzA05M3CIgR90mRA5qF5Fv4cVuCDOBKVQREsR8eV+lmu3XXvmeHzJNw==
X-Received: by 2002:a17:902:e550:b0:223:39ae:a98 with SMTP id d9443c01a7336-22ac299d473mr11858275ad.22.1744151825210;
        Tue, 08 Apr 2025 15:37:05 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865dffcsm106264455ad.127.2025.04.08.15.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:05 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 02/18] staging: gpib: agilent_82350b: gpib_board_config
Date: Tue,  8 Apr 2025 22:36:42 +0000
Message-ID: <20250408223659.187109-3-matchstick@neverthere.org>
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

Using Linux code style for struct gpib_board_config

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 3880d4a23eea..901f7182502b 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -492,7 +492,7 @@ static void agilent_82350b_free_private(struct gpib_board *board)
 }
 
 static int init_82350a_hardware(struct gpib_board *board,
-				const gpib_board_config_t *config)
+				const struct gpib_board_config *config)
 {
 	struct agilent_82350b_priv *a_priv = board->private_data;
 	static const unsigned int firmware_length = 5302;
@@ -587,7 +587,7 @@ static int test_sram(struct gpib_board *board)
 }
 
 static int agilent_82350b_generic_attach(struct gpib_board *board,
-					 const gpib_board_config_t *config,
+					 const struct gpib_board_config *config,
 					 int use_fifos)
 
 {
@@ -730,13 +730,13 @@ static int agilent_82350b_generic_attach(struct gpib_board *board,
 }
 
 static int agilent_82350b_unaccel_attach(struct gpib_board *board,
-					 const gpib_board_config_t *config)
+					 const struct gpib_board_config *config)
 {
 	return agilent_82350b_generic_attach(board, config, 0);
 }
 
 static int agilent_82350b_accel_attach(struct gpib_board *board,
-				       const gpib_board_config_t *config)
+				       const struct gpib_board_config *config)
 {
 	return agilent_82350b_generic_attach(board, config, 1);
 }
-- 
2.43.0

