Received: from mail-io1-f99.google.com (mail-io1-f99.google.com [209.85.166.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF1122A7E3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053569; cv=none; b=c382JyixVZgnoyrKqSFZSQMZk0jVn+aRKCujQPDiurkUWRCeWRujgdgrMjSg6HCv82HPdRNKG79Y6qy0YECnRkZiRm0vyesJDFk/45v79t8oSBmm+GQ66vesKOpZZiuXnzd75Je+hDcIOZyIhKYv5G+McOkVpaAUkDiOWqXClc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053569; c=relaxed/simple;
	bh=1hyN+kc3XNgmfNwghwmkyi4ejxAW3PAW3imq8XmVVTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zip7qtvd4K978mAuHfTNc4TtuqTbm13mmEzY8C9O0PP5/OG4GvidAhMP4K9JbdWcIgQ2lbegqsdyDQC1GG4YZs4zL3Rm8M/hA/M64CKHYCqSOdyc2XcUermyC3xkapdXMFVCrCYgos07oXliIunDZGtMi9IVRBJ5RMvfbNxGCoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=T7CcPZ/2; arc=none smtp.client-ip=209.85.166.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="T7CcPZ/2"
Received: by mail-io1-f99.google.com with SMTP id ca18e2360f4ac-85b52d6e034so1904839f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746053566; x=1746658366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4iRqRYOY3v92ahJdyDMU1UlrSYDHa45zvlKwr5Fr/I=;
        b=T7CcPZ/2ts228nRdFvDdkZO36s4I8UonmMAw2w6StfAzbViM70cj7rkcNnemkZlvYr
         0pFnP/bvy0bRzJFvz61DT5B7Gvp95281fEQd4NbOkdEJH+a/ELLc5qq03067UgqQG1U4
         UDsFP8xUZ73Dj0zsaAQdVMIsihlv/6e1wndS0uSBU2IgadWo2DeEUc6M9ih2TdT66RDV
         4VtbVAx/WAz4cpiB2noWGA83i7Utqn8cIn6oFuJouwoMTGFoKojLy4cYxcg34Fqq4v6W
         ODSvFMXRZ2lFmelxsbfOM6kxIqzl/D7g7oOYE3FtgSoKz4433rYDopq/Oh+EWdxQhHLW
         qhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746053566; x=1746658366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4iRqRYOY3v92ahJdyDMU1UlrSYDHa45zvlKwr5Fr/I=;
        b=b8377YXpODbkUYtjVQ0vYWInAdhQqpxg/06C/H0nlJ/36XuMHZHEV7EaZt0JR55Ssy
         wJjJmlI+upEjC+1dLxzk8lzsfuNtkvWw5sJla5Dos3Z1XWhKEijmmmrAn32OcMehkFoh
         gJT6LWycUqi6IlLwlTAVT6IjwQ9xw/2pnPd1t2SK6zwR2T1TByABKD0vvdtHK6RhBill
         4N/JMW6tzyh1uVNWRqGrTpFKQ0HXLlwI7xWqXrAiC7WsDRsyXawMZTwU46vwAEhKvIKU
         /vAMz45AgM//kLjXMAM3NPExf+Eale3es13h037PABmqLMNKray/vNIM/8jRm1AzbEL6
         fjPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnQsuraOXTXxaioERDPuec2QR5VrJ6BmsrNh3JXwOlGmmEzIovab3qB06kiuAfhAtSoT0QhDP3/SFfnZk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz837u6atEHCeoVD2Lz9q8nXkuolUWjiYwzHhIBi9GbDrgVJ0Ab
	fRwIL3ON/MV2A4EsuXxdXPqzDmethZdwQSMSoAeP4efuzpVkk0cSfzmWYzQGJsr9XG6tMMHdXfQ
	37Fhfo3oUrg/42ia4r3KjFm9k0W8q7j31
X-Gm-Gg: ASbGncs7BqnlQ69cxqdK5DtbC9irwqNU2swnkgXg0A3Q8ZSvIV2Y9SLTjNNEI572UKM
	byrQfrKsaC2RKV4Oe9t+LgK6JGxH4ENqhpW8UfThCmQ4quoSy/cJHkyGW/jyobH7FMydf2nvNSq
	qlZP+hQmmt9JYKGbrz80xSfMCG3iirecKm960hxxgmF7uQ6UJ/HptPNXr7LpGRyrqSuBbDmS54z
	xc5gTSgo8Kv7IHK0JNutyhCgHQTHVaGiYG0ycd220Dq8SmlAEJpJrsIScyvKd/zNHKcoFwktJ7Q
	gyKgWQgXIDDkbSIgy6Gs8CJqUXEfNeT5DUUAGWxHPy8G
X-Google-Smtp-Source: AGHT+IH51L+NKmfS1JUzYUlNoJGB0g+pMOtYBRXXIJ6Yp8zTD3wqPafStBmoG8THnE72BpR1jjI2GQmmQL0b
X-Received: by 2002:a05:6e02:1fcb:b0:3d9:2961:fa01 with SMTP id e9e14a558f8ab-3d9682a4f0dmr15322105ab.3.1746053566230;
        Wed, 30 Apr 2025 15:52:46 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-4f8630943besm318541173.57.2025.04.30.15.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:52:46 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::418a])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id DF96D340199;
	Wed, 30 Apr 2025 16:52:45 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id DDDF1E41CC0; Wed, 30 Apr 2025 16:52:45 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v2 8/9] ublk: check UBLK_IO_FLAG_OWNED_BY_SRV in ublk_abort_queue()
Date: Wed, 30 Apr 2025 16:52:33 -0600
Message-ID: <20250430225234.2676781-9-csander@purestorage.com>
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

ublk_abort_queue() currently checks whether the UBLK_IO_FLAG_ACTIVE flag
is cleared to tell whether to abort each ublk_io in the queue. But it's
possible for a ublk_io to not be ACTIVE but also not have a request in
flight, such as when no fetch request has yet been submitted for a tag
or when a fetch request is cancelled. So ublk_abort_queue() must
additionally check for an inflight request.

Simplify this code by checking for UBLK_IO_FLAG_OWNED_BY_SRV instead,
which indicates precisely whether a request is currently inflight.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
Reviewed-by: Ming Lei <ming.lei@redhat.com>
---
 drivers/block/ublk_drv.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 483205a0dfe8..97c61c0bf964 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -1609,20 +1609,15 @@ static void ublk_abort_queue(struct ublk_device *ub, struct ublk_queue *ubq)
 	int i;
 
 	for (i = 0; i < ubq->q_depth; i++) {
 		struct ublk_io *io = &ubq->ios[i];
 
-		if (!(io->flags & UBLK_IO_FLAG_ACTIVE)) {
+		if (io->flags & UBLK_IO_FLAG_OWNED_BY_SRV) {
 			struct request *rq;
 
-			/*
-			 * Either we fail the request or ublk_rq_task_work_cb
-			 * will do it
-			 */
 			rq = blk_mq_tag_to_rq(ub->tag_set.tags[ubq->q_id], i);
-			if (rq && blk_mq_request_started(rq))
-				__ublk_fail_req(ubq, io, rq);
+			__ublk_fail_req(ubq, io, rq);
 		}
 	}
 }
 
 /* Must be called when queue is frozen */
-- 
2.45.2

