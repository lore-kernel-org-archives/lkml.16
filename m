Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6293B2571B0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744154747; cv=none; b=DsV5B5SOotIcn6PovVq/7JGEeNLHIJoft4RiSd8j2y0m89uSsNL2CN4yBODU0AVGa6/7rZWKXwaQX74ZIgYdOfC/mJMcYa4eV0qo8Gs+4fABxvhCJEgO4L4xFwDcag8dJUA4ZnoLfI3BiWSTbPCEPylsSE6E9pVp6Ug+P1zXf2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744154747; c=relaxed/simple;
	bh=f47LmV+7WjkLMPIKBfkl9xJdb7ie0wGOQSjehuWY3ZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jj/GCVB5JYWNAJTVq0ulf5Hf0U4SI4fEMFLLEV3NbxN2qto+L7T3mYrBXLQ/tqk0fI6ahIcv7EkaJMuBIYAohqrHICsS/s2WvU+nHKpzO32jlJrnAqq+sn1CQii2/2vW5HjWUIQIYV7e0HoL4Nw4TzdNNr2POG7gMvilSr944YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=THHR0WmW; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="THHR0WmW"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af9a7717163so6056488a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 16:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744154744; x=1744759544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2xjIWuXyaxMet536XfRVVtc+yMtIlss6dqtracfTNw=;
        b=THHR0WmWDuAN2DKv1ZzquCVVcWWnfbz8LW8RY+Nu/IygP6EPbuH5eeGr6qMtvOF4m+
         WRvf2TjPADvNjTCCfpywdxxJeRZEPItshHLEASgJTVubgX/J3SgSta1UINDlwvAcR7RX
         h7euXJaJkYyObnmbcCbC2zGG9mba7zct4hNWjXu8B9skeZAk1ei6EaSQxPZFB+myPyoa
         lPobnn4hp0N448jQSI2wY3bHP2Y9gDN6Qh71Qpx7/IVOKkMX5EEuH7f5OsFzXnUcJuxR
         youbiVhD78JwMTHwNdU9u6hCQTgdyibiJxyiQSmt55E5uktLnINX7NxfwtQJM+ZYyQg6
         lflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154744; x=1744759544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2xjIWuXyaxMet536XfRVVtc+yMtIlss6dqtracfTNw=;
        b=eolCTWByhbvlBtsG3JX0ILcKY3C1Mnm/+EAhIg0i3IGcb43zrb5Mkm1w5fh9o2Qw1a
         CNBRYzoVyukkZaR53OjEf0Pm5myihV9OxzCw1HLGQaIMV6DhKt+scSjNUML7wO9lDamV
         5kU3jF4WHXcbgPEI+nHRT01ilUcT33cNxY3cnb0jlCYs+4Ngc0fZ4bm00K9ffVUY6AHq
         Np/OZ9M36NGZxITE1qYm5SLlO/B66QskPFhSccXzH4vyfpqSsWlgFq+/Trtd9XSB15+X
         OKG+krnV2WRCtBOauNip6hYh3e+jjq4kP8Xrbro87NzQZy93xyQdBm/r9H6X7ED6k/4x
         sQrA==
X-Forwarded-Encrypted: i=1; AJvYcCUZxOIZ4I6RwEpCzTlYic8PB06KWg/mQowIo3perVjnhxaf6KXrk7jd9TLCwGAOLedrw7EjNGwsfvzIxow=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl8py+n6QEGmLHjnCmVM5+O0Udvj9nC/g5t3/y4lZTgJBFBICA
	9UXsGPTiz4RjozCwl5+HBf99KfxXIK3+wC+dTugMBS/eCP/O3yyU44xseWt7fg==
X-Gm-Gg: ASbGnct28P/IBKlGjZ9tNfP8qkqQEt2Rl2HIVXorN4xVpAc/ily5fyDQTV7W6JVtULA
	PE2qWog1OSZGfX15PGIW46w/+t0wYiSAasZj+NbCwzON2wno0aowQlbl/peWLpry+CycP8/owml
	NZwPs5SHW0L3aT/eL4COSnN8At4qLXMb442oBnmiAtB5F/ob5uUFD6riGYNwa1hYVw6R2LmlTQG
	ATC4d+9W0wL8LBx9UK6aCX3Ra9IX1nhI1Xhtfi3MTaHCzIa6lXSRM/djFt9CL8EnDQxaUBN8w8n
	5Zg276oAK1N2Pg2HNvDeBcZWlN1g16mTBpuAmw0EdvEThtl3KMcbkUVsjw2bsSp4e9qGdONNww/
	i8Wp+0q4wI+T8FvppJwXi
X-Google-Smtp-Source: AGHT+IG/xSy34k0CFTgjANoPWktPJ3qK1n+UL3TMBJIpsVBenJhFTfbQo1dWwYbicmN6hxa3SriRzA==
X-Received: by 2002:a17:90b:4ece:b0:2ee:5bc9:75c3 with SMTP id 98e67ed59e1d1-306dbb8db11mr1260947a91.5.1744154744609;
        Tue, 08 Apr 2025 16:25:44 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97f36besm11186913b3a.72.2025.04.08.16.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 16:25:44 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 5/7] staging: gpib: Removing typedef of status_byte
Date: Tue,  8 Apr 2025 23:25:33 +0000
Message-ID: <20250408232535.187528-6-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408232535.187528-1-matchstick@neverthere.org>
References: <20250408232535.187528-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing typedef of status_byte_t with struct gpib_status_byte to adhere to
Linux coding style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c     | 8 ++++----
 drivers/staging/gpib/include/gpib_types.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index a2138c7f641c..b06cbd53c36f 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -183,7 +183,7 @@ unsigned int num_status_bytes(const struct gpib_status_queue *dev)
 int push_status_byte(struct gpib_board *board, struct gpib_status_queue *device, u8 poll_byte)
 {
 	struct list_head *head = &device->status_bytes;
-	status_byte_t *status;
+	struct gpib_status_byte *status;
 	static const unsigned int max_num_status_bytes = 1024;
 	int retval;
 
@@ -196,7 +196,7 @@ int push_status_byte(struct gpib_board *board, struct gpib_status_queue *device,
 			return retval;
 	}
 
-	status = kmalloc(sizeof(status_byte_t), GFP_KERNEL);
+	status = kmalloc(sizeof(struct gpib_status_byte), GFP_KERNEL);
 	if (!status)
 		return -ENOMEM;
 
@@ -218,7 +218,7 @@ int pop_status_byte(struct gpib_board *board, struct gpib_status_queue *device,
 {
 	struct list_head *head = &device->status_bytes;
 	struct list_head *front = head->next;
-	status_byte_t *status;
+	struct gpib_status_byte *status;
 
 	if (num_status_bytes(device) == 0)
 		return -EIO;
@@ -231,7 +231,7 @@ int pop_status_byte(struct gpib_board *board, struct gpib_status_queue *device,
 		return -EPIPE;
 	}
 
-	status = list_entry(front, status_byte_t, list);
+	status = list_entry(front, struct gpib_status_byte, list);
 	*poll_byte = status->poll_byte;
 
 	list_del(front);
diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index f85091b1bdf0..6a34500af65c 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -324,10 +324,10 @@ struct gpib_status_queue {
 	unsigned dropped_byte : 1;
 };
 
-typedef struct {
+struct gpib_status_byte {
 	struct list_head list;
 	u8 poll_byte;
-} status_byte_t;
+};
 
 void init_gpib_status_queue(struct gpib_status_queue *device);
 
-- 
2.43.0

