Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EEE2566E4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744154744; cv=none; b=Jfg5D7uBE0W/c58XWXQbimq/IPI48mu7Ceqqg+kLp23ROUaLVbeXWu18eGK78ALgEGcn3hXShGxDtL3OnQHDoH28I6Ybl6Vxq42+O68Ee7Kt1XkktBlo9cN2dxUvSgJ8ohIxFWOXv9X7jiDKLvzDTfzE0z4hvfFujlUvK4NHiCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744154744; c=relaxed/simple;
	bh=slT6m15jtOTNs/B2FLm4zfuo8rL09VaXielIzRuqlBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AvbD81eYFn6pB+ij5wLaWvb4cDABIr1AKe2BffTkLFW+tEJmk3M8K275fY7nV/vp2snCDo5RfskL/XKxgSup8GXOsgsaX7IlWwKhzI2fOqnr7iCrc8SS5aVu35dAmFGrTvryTY5vNK9KW/6eEHK8l0RAVAHCrMHPX1fu1VuP21c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=MYohIUMb; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="MYohIUMb"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-306b78ae2d1so3253898a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 16:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744154742; x=1744759542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvVUYF3W9WGYrgSJIX9w9iCFvoKwdGoVDieJ1Vz/Ohc=;
        b=MYohIUMb+YAqHW3xWA7nC9CTDxC8Ujwx9o29W001rswHbke0NLce15nuMsCR8snVJR
         jI+mYRbaPybtypTCvwMW+Ape01WNhcYt9QN5UXlqf0GfYsqE9L/+aFcThPvgGSnsa6Jt
         lyoYMsuQP8nUe1tYRjOmwhjjX0HnjrnOZOTPBSz92ir1/rIMEhMUSj4tTkzgWuMGOjys
         3T7pBGaTJkQDqHXx2UdXMEbVsGRwdMM02NbtoO5iqcC8hd/oXqUVoiGEmTWCyiDIQDmO
         nlzinIekqfZcJDYger/YAYvp9RRLJ90nnOqEomzgbK1uwwFj+8s1idWbsMe7CIyfRVON
         uyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154742; x=1744759542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvVUYF3W9WGYrgSJIX9w9iCFvoKwdGoVDieJ1Vz/Ohc=;
        b=o/VWl+rUawCu475n42X4zKLqRYk3s+ELTSY3j+z4MtkZV6uWFSn5CLqtPYSJDCRhBU
         QjhpEa+Bh/aSFeklrHJrs1FyAOZJRn5qXTYUgdZ+WAf5XFVc6HqrNBuSzHOeflET70i4
         g2u5o2gkPzksx4RyYqLP0eZDCmjHTKlX52Su+4gJ4J7VyUNrVDaTt/639HNOB4H4DLQL
         vzyZY9ieKOQUA8jdVTSnz/s96lqKvW2ZTlxw22AdDJPjIUsZBxrz8756De0C88A57auq
         H5CNzW4CuWeRjcFOISzXdBMLP0KrfQDOFy62hapfS/3PAATAtzFcpDAHqSpbBau0IvIO
         A2Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVFmXkjzvNkjlINeCqOMwdtUrA5VBhr22xxaqHmzLfq3MQVnbSysqel1mMhZNxe9R3O42cvp6hLbDkmmzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTbqOofCSjzWSy+chQ5F8Rb8relrchlbwX9Fpln6odBTAxtEx5
	MLs6/g4mBnrKlZog/pVz3KeHrgh9qbs0dhKvmtSIMdzYyYQPZBOA/QCHeJgwVMz+TG/249tic1Q
	=
X-Gm-Gg: ASbGncvy2jkZlgnNrQzoNZ2a7MzmcXlw1rDgIQZNAl4PKECf9NJz2U83KvFABVRD4RN
	O7kb2BaVlJGEF1eWDsuqtr52o+KLPL2paqQ1A9FN9mjcZl+A64fc/d5jAOMRYGzQb0dAgCaUMMx
	W0zj7v1hB0TWrDfMaSlrmPQFmiawuoIVv1rwBIyyWmPXw+hJ1dKqYY/S3PopRBum4TNJ+OY5qG8
	ZQ5QlWSRL6RhfMLCw6ttPTqjScd94J0tpFBfG6z9Ytadx37++FleMY6bxwF3zGXN8hW59GsrRNK
	o4jeUFe5hnibjqSx1x7+6KUktmHiLGDd1lcVxGoBofWur1Hpm+rqgfm7UqgHptGVD/NXQqlHanV
	SLs23WeRwQw==
X-Google-Smtp-Source: AGHT+IFK5EKx7Wi3+ySQBoxihMaRXY/3fkiix5XLIBkPbmbfU+gZbTOS9D4JxSE8/AuYlWHhbuLCgQ==
X-Received: by 2002:a17:90b:548b:b0:2fe:a742:51b0 with SMTP id 98e67ed59e1d1-306dd5789bbmr322739a91.31.1744154742199;
        Tue, 08 Apr 2025 16:25:42 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e3b2sm106860275ad.178.2025.04.08.16.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 16:25:41 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 3/7] staging: gpib: Removing gpib_event_t typedef
Date: Tue,  8 Apr 2025 23:25:31 +0000
Message-ID: <20250408232535.187528-4-matchstick@neverthere.org>
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

Removing gpib_event_t to adhere to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c     | 8 ++++----
 drivers/staging/gpib/include/gpib_types.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 3fb369caf17e..575d9b65f293 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1848,7 +1848,7 @@ static int push_gpib_event_nolock(struct gpib_board *board, short event_type)
 {
 	struct gpib_event_queue *queue = &board->event_queue;
 	struct list_head *head = &queue->event_head;
-	gpib_event_t *event;
+	struct gpib_event *event;
 	static const unsigned int max_num_events = 1024;
 	int retval;
 
@@ -1861,7 +1861,7 @@ static int push_gpib_event_nolock(struct gpib_board *board, short event_type)
 			return retval;
 	}
 
-	event = kmalloc(sizeof(gpib_event_t), GFP_ATOMIC);
+	event = kmalloc(sizeof(struct gpib_event), GFP_ATOMIC);
 	if (!event) {
 		queue->dropped_event = 1;
 		dev_err(board->gpib_dev, "failed to allocate memory for event\n");
@@ -1905,7 +1905,7 @@ static int pop_gpib_event_nolock(struct gpib_board *board,
 {
 	struct list_head *head = &queue->event_head;
 	struct list_head *front = head->next;
-	gpib_event_t *event;
+	struct gpib_event *event;
 
 	if (num_gpib_events(queue) == 0) {
 		*event_type = EVENT_NONE;
@@ -1920,7 +1920,7 @@ static int pop_gpib_event_nolock(struct gpib_board *board,
 		return -EPIPE;
 	}
 
-	event = list_entry(front, gpib_event_t, list);
+	event = list_entry(front, struct gpib_event, list);
 	*event_type = event->event_type;
 
 	list_del(front);
diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 4be7cfce539f..8ec89290523b 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -302,10 +302,10 @@ struct gpib_board {
 };
 
 /* element of event queue */
-typedef struct {
+struct gpib_event {
 	struct list_head list;
 	short event_type;
-} gpib_event_t;
+};
 
 /* Each board has a list of gpib_status_queue_t to keep track of all open devices
  * on the bus, so we know what address to poll when we get a service request
-- 
2.43.0

