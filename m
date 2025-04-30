Received: from mail-qv1-f99.google.com (mail-qv1-f99.google.com [209.85.219.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EE822A4EE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053568; cv=none; b=ZLtcrGY5cvgxiyL59kLq/F9XjvCRSW37v/ItpsD4/TdZbVmAxYOftmsHcnv5pmagvMag2Fk7BT33dS3Rufydn7O4GN+cGhOMseHgrA7dGEjX37YID7jCbyfiKoJe1DgMTuLz+77mBrTJZ8dcm6ItjY7Zq6s2lRpya4EhRmNi7S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053568; c=relaxed/simple;
	bh=nXCg+pXbRoR81xflleG9ocvd7Z1Tja2d5kz5BHY9Lik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jC6Nemvk1XBotfS4zHldmpL0dwh8my8gHhWvKBKeBRhxbJmvEl9lRkwJBWrK+0YR8XiYUyN1fgSS8T6Gq+lM8SdipeBV87yoyjdCjmhQYXpDP1q8bZeHWV16yML2mgsNy4qyTRWDkPl66S0lacWTT7UiWByShioc9IZZKZwOB3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=KAyJdyeZ; arc=none smtp.client-ip=209.85.219.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="KAyJdyeZ"
Received: by mail-qv1-f99.google.com with SMTP id 6a1803df08f44-6f0eb824f51so914086d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746053564; x=1746658364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2c2dCDfSwBPxUeqKnIelTKrQEoECHUUK99fQC7EIqE=;
        b=KAyJdyeZ9JgtstAAPiaiMP2xQqfoVvDeguNGkjrVMaGnE2cdj7OJSvWCmh+Fh+woNz
         yYYBn6ox6DoLpGgktf1dafxOw+3+4ymQnEr5ykD33AJnsihF7C/bbyuZ9QdOCZmZ9g0B
         GlhKT6z2KkbaSqSA0Z+nurOscadT2udI4whoOmKMHzW8tyPWQsRYPeE+LqnVduw6k9yw
         JaBCelbK8/hosIhDx06Ow5DzfMLjzpOGw16G7WzScWXT93E4WrLleLEI0tgeodJZJ257
         ZRY/vu0va/nQWkU1oCo7AXJR0s+maCLLTtCYic7lpPNWld2/DddeGxmC7hygQ0dW+fPR
         lBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746053564; x=1746658364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2c2dCDfSwBPxUeqKnIelTKrQEoECHUUK99fQC7EIqE=;
        b=RuYa9aKzm3TuBP7CEoOsmTYixOQX3DeKySOSu3vPsVof7kOnbB5uNl9b+MFbW3maJT
         3Ild0DdeXoT8o4/1j9j7hcWi4VX92ymalkuy4R5IqUzVtSSQHbFngOQm1xHWDBC5Uu5A
         AOwcu7a4zoyYed2jnyYINqatVOTfmn6DbGt9uWSrRSyjW5OZxSFhvg6D44ubgFEl0GcT
         elkzFfDl07d184EAbmJ70CwoNORWL8OxAfFPlGUKrmPbMWzGC1g08j0+u2JbdsJNic0p
         alpkn/yxYE+egNBbX3JXT8uSgyfRqME7wj18elQ0zEk1zE6QNSE/PPAxHIytYkbzRBlz
         vL4g==
X-Forwarded-Encrypted: i=1; AJvYcCWllkP5ZIFruLJv0XTc1+X5NPSfaWn40E9vGMrsT0GngX829xgHOFHdJTFOaRHj/2DEGxncrC0V4Nv+OUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQA8neov2hUYRKrh2oqXpOQasoAP2jOeMI+QLi0K4daP4e2fZt
	b2Dh8sKu0qkny7PGbsNNdmK5Vb6C21xkxQpL24DUtnsVo3Q6CQHpXNAisHIy9rShHrh+nDmuuu4
	0C2mrUsEarrO8tl53RguDAd1RlGfjjOOfONkp6paoIJlMUbId
X-Gm-Gg: ASbGncuxuRDeu4eDoT4T4TCRoin4i+1DGtLe/EYWe7QvIbWTWV4jV/e1UhdTuO7aoHG
	2VZ3G+ksEA+cy7bFGaYPDttmlgIBfOAT4zLjDZJXHPLQOhqIPaLf6UwQzp0k+dMk+ll9gWz49lR
	aqg/pWZ7Ae8iqMY/mWLVgkhvo/JT1+r+00rbfmzPEQxykUw48yxZFmqjGErdDw6/4JdHVOxmkMZ
	Z0rANurEgC/EYL8saQFgI1yc/VsTxlUAXKeez3+MBeptghTF/aOuVkvvBnpSxvn1zsq2eJ7qY/9
	pjL13i0PDpLvoetB3RlHdhP6fqwzWg==
X-Google-Smtp-Source: AGHT+IESWiXXlmdqbgJMpyGebdlLbXn8F07CDFuUX/F5hmqRKqmz+YwqsOelqF64p4S+Y6KzAphRZ8TJYC+G
X-Received: by 2002:ad4:4eef:0:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6f4ff62b7a2mr21508726d6.9.1746053564282;
        Wed, 30 Apr 2025 15:52:44 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-6f4fe822198sm1264146d6.65.2025.04.30.15.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:52:44 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id A3CFB34022D;
	Wed, 30 Apr 2025 16:52:43 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id A2634E41CC0; Wed, 30 Apr 2025 16:52:43 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v2 3/9] ublk: remove misleading "ubq" in "ubq_complete_io_cmd()"
Date: Wed, 30 Apr 2025 16:52:28 -0600
Message-ID: <20250430225234.2676781-4-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250430225234.2676781-1-csander@purestorage.com>
References: <20250430225234.2676781-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ubq_complete_io_cmd() doesn't interact with a ublk queue, so "ubq" in
the name is confusing. Most likely "ubq" was meant to be "ublk".

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
Reviewed-by: Ming Lei <ming.lei@redhat.com>
---
 drivers/block/ublk_drv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 44ba6c9d8929..4967a5d72029 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -1123,12 +1123,12 @@ static void ublk_complete_rq(struct kref *ref)
 	struct request *req = blk_mq_rq_from_pdu(data);
 
 	__ublk_complete_rq(req);
 }
 
-static void ubq_complete_io_cmd(struct ublk_io *io, int res,
-				unsigned issue_flags)
+static void ublk_complete_io_cmd(struct ublk_io *io, int res,
+				 unsigned issue_flags)
 {
 	/* mark this cmd owned by ublksrv */
 	io->flags |= UBLK_IO_FLAG_OWNED_BY_SRV;
 
 	/*
@@ -1188,11 +1188,12 @@ static void ublk_dispatch_req(struct ublk_queue *ubq,
 		if (!(io->flags & UBLK_IO_FLAG_NEED_GET_DATA)) {
 			io->flags |= UBLK_IO_FLAG_NEED_GET_DATA;
 			pr_devel("%s: need get data. op %d, qid %d tag %d io_flags %x\n",
 					__func__, io->cmd->cmd_op, ubq->q_id,
 					req->tag, io->flags);
-			ubq_complete_io_cmd(io, UBLK_IO_RES_NEED_GET_DATA, issue_flags);
+			ublk_complete_io_cmd(io, UBLK_IO_RES_NEED_GET_DATA,
+					     issue_flags);
 			return;
 		}
 		/*
 		 * We have handled UBLK_IO_NEED_GET_DATA command,
 		 * so clear UBLK_IO_FLAG_NEED_GET_DATA now and just
@@ -1227,11 +1228,11 @@ static void ublk_dispatch_req(struct ublk_queue *ubq,
 		ublk_get_iod(ubq, req->tag)->nr_sectors =
 			mapped_bytes >> 9;
 	}
 
 	ublk_init_req_ref(ubq, req);
-	ubq_complete_io_cmd(io, UBLK_IO_RES_OK, issue_flags);
+	ublk_complete_io_cmd(io, UBLK_IO_RES_OK, issue_flags);
 }
 
 static void ublk_cmd_tw_cb(struct io_uring_cmd *cmd,
 			   unsigned int issue_flags)
 {
-- 
2.45.2

