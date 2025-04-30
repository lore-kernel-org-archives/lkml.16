Received: from mail-yb1-f228.google.com (mail-yb1-f228.google.com [209.85.219.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFFF226D14
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053566; cv=none; b=EHwTOY1artsnJ2/7ffWbth6eWLCc0o/9Jhviurxzqvu/o4tbY94JIV1D0XA9A+fHgR8w86nmb/8Fc8djyvUKh6aR2D9HA/0E+ct2uh3HFTqbiC0IR9xXv+SpkoMZQ6icJi2vLTJRssuZ/nYwhfSyVNwMnUD3z5OeKZeTMgJAjyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053566; c=relaxed/simple;
	bh=cKuSj07UNIbFR1xRrPWEFTmA04qMg5m4ZTKpCK+46sY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ceDVNHTNtkaXqHUoh9dapOVSXiAXPawqRTBTTSbAnnIQnJodyho2gd9v8i4DEGmof6NAAV3GTOtvKtfeUD9xe0nI7GyfKg9iY/SB6LKq9Lu4JX1+26x42vp6lTIhS8O3xanwuXrf2IdHub0zuu2D3Jc0Tm53R0o7bUkjlMzOXrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=GRM9m0PI; arc=none smtp.client-ip=209.85.219.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="GRM9m0PI"
Received: by mail-yb1-f228.google.com with SMTP id 3f1490d57ef6-e634949074eso38402276.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746053564; x=1746658364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zX3d6Es1jqYsyf58SuUf5JPCb512PPSOHmR2awR6dbQ=;
        b=GRM9m0PI3tT1o2mH2Hw54ioWkMbII0CYyKdJG8OXwSDgCc+jUvWB3XqKFn1CtWowpx
         pQJBAurxYkqUoRS1pvCKBXTnLs/eFwUvo9XOjBPNqMznHfVwUsjVbEh+LcQGbZusUOvf
         K1LahCgZBykVi2Ev1aTTgXpBA9ttC0oPZqxy9XA2vdwv1QgVUO7KDm2AJTOdTkT0AxP2
         Dh56/4DG7ClIIbTyxd7IzBDZpM4pM6P51e5/gklEMt5UI6fWkhdcvjx9yJpKOG0KCLhX
         3lpMrfWo2m9LpqDra8nKLHSC9uCITkCVD7Eto+bTIuuiP2iyeqGG4N4gXctljytUxCur
         nXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746053564; x=1746658364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zX3d6Es1jqYsyf58SuUf5JPCb512PPSOHmR2awR6dbQ=;
        b=KjBsvqtPFGi2zvoNOpQUar2nlbpKY+zX16h8SLXh3XF2Xs7UlrmcjUEhc95pB92YEE
         t0P48AVk0TDTTg6/7pdAh7JOafCO7t+1Mp09UiUjzri3swT7PzmfQPqdCWvKfAPTJ2zQ
         /TaGcs9ZfBWDQBWg02gXejSP8UeeKNvl2rVlzs3TsDzfdhW9yqnhFTSt8GzT64kpDmxr
         MczyPQwxvzurtTI90BIPQYT4cNF9xAbUgLLk7k7ZRptVpet5uvg92AxXJnORThsaxooz
         H0m9pW3HE7NWzkMab66R7qVwWBbHXN0OV2umozDYYhU/i+n9Gb5Ua/H3VwtkwkiTZTQM
         znqg==
X-Forwarded-Encrypted: i=1; AJvYcCWINNq1aBI4Q0sMu/76whWsJpd4yuN8JLpmGrbYKHJQkdoMKED+IBOX+68FEe6BrzAtK3rkPaWX64QbKtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQFrJFGiFZjL0vR+ZRRfVZuRiASSTscI4iwVBfmYY2CkeMQvXO
	WobHXdyd19A5IJm/FnrW/D1GBy99Tn3cw3xxsLUVqxJDaoaYl+JcC/Om9uhgt5uzSk6r8UCS/OX
	MG42pCeWodnFfqd7aQC1ZE2AWdHZ95Ub8FqZCO6RaBUTeTuio
X-Gm-Gg: ASbGncsFDOoxRtGnhenDp51mLBCsOTMXETwzySBbXok7I27h/RyTbHoCMuMYGW1b5VB
	L0lIQOen53uCYEBbbGnETnbK4kMpdmNFJJRl80RSkOUkjI0LEI2fh0hZ0fKmuB4wYSK4OjTT/fZ
	tBbqe+VSLhm0PZUi2T9sYyCwLID4+v5bp68fz2Gxrd5CvDdU7avKZIPlAGAshphnFLcccNyv0Vh
	oqJTSbUSw4iKaLjQPq5A2THK94GjN+2aCBDqY/kMS6nQErJNTbszjSI3VcMhxy30xwp4KrOHZde
	FjXCESSYH/dv55ZKuGT+I2WnRSUmpg==
X-Google-Smtp-Source: AGHT+IFnJsuKlmbBF0hmSnvalU7hKImH2yDVj+qrhAdYzIaphRu5c+jNpubN5obJYJRBoIoqINxkaWU+M6mO
X-Received: by 2002:a05:690c:4:b0:6fb:b18e:147c with SMTP id 00721157ae682-708aee70293mr26628307b3.1.1746053563707;
        Wed, 30 Apr 2025 15:52:43 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-708adfb9e1asm1748467b3.1.2025.04.30.15.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:52:43 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 2AD4A340199;
	Wed, 30 Apr 2025 16:52:43 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 2948FE41CC0; Wed, 30 Apr 2025 16:52:43 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v2 2/9] ublk: fix "immepdately" typo in comment
Date: Wed, 30 Apr 2025 16:52:27 -0600
Message-ID: <20250430225234.2676781-3-csander@purestorage.com>
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

Looks like "immediately" was intended.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
Reviewed-by: Ming Lei <ming.lei@redhat.com>
---
 drivers/block/ublk_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 7809ed585e1c..44ba6c9d8929 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -1180,11 +1180,11 @@ static void ublk_dispatch_req(struct ublk_queue *ubq,
 	}
 
 	if (ublk_need_get_data(ubq) && ublk_need_map_req(req)) {
 		/*
 		 * We have not handled UBLK_IO_NEED_GET_DATA command yet,
-		 * so immepdately pass UBLK_IO_RES_NEED_GET_DATA to ublksrv
+		 * so immediately pass UBLK_IO_RES_NEED_GET_DATA to ublksrv
 		 * and notify it.
 		 */
 		if (!(io->flags & UBLK_IO_FLAG_NEED_GET_DATA)) {
 			io->flags |= UBLK_IO_FLAG_NEED_GET_DATA;
 			pr_devel("%s: need get data. op %d, qid %d tag %d io_flags %x\n",
-- 
2.45.2

