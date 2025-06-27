Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F35B293C7E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751018268; cv=none; b=Fr5mqsXdh14ykttyythgZn6RCbU6XSFy+jmA2EJFM13MUVUL0vPCxV4SRrOYvlioE25PzF19Y2BjeeCUFFAtC7AhAKEFgcww+sYSl14zrCT3D0dosG3HVnMvU97CDcjtz8eXitIv7MjCcNUv4iJ4GK8dyj4SedHVIlO9QON+LBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751018268; c=relaxed/simple;
	bh=RAmv329Xaq38x/JNCC9NLv8ETZtMOW78s5QqfPKBgwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Bnu83e0GXl0txk8Ck1e91jlDkEgAE9uT2m09ShMalqsDrincMqEny7SD5MIQJ5Ls5hBqw1Iu4RhJ7pk5LBmVYFav5aYwzMVHI96y5MAZLElc8MdQuDTiGYp7SNBe0N4zdpAzFpWxQGJ0gVgsTbPH+uv81/QRbqzqHHFsXAHm1oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b=Yhnnllym; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b="Yhnnllym"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60c4f796446so3329414a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1751018263; x=1751623063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mwDy+2proYOLrYP4jEl+UhyGumZmUzGwf/H1c+IwxdU=;
        b=Yhnnllymd1RGK6ar9ILKBRxOJauwPbREPZGKnDGxyYfOPAq6TD96T8+sZeoGtzYksl
         tSHPByeNc4jB0w37dvbhN8gLLu2enwOxxyft1wbdl/2Z9TE8cwV9kzfzPj86IxZ0mrqR
         A1BqSiSKr65tX8lPDqAeMdHHwgHk7OXJDG5zyA6sQCW+0rCuPHyCVHNnW022Q/95Y8Xq
         lPb7Kyv7uw3h2RmY2o0F2cne687MNVhIfM/dcVMitzFqA3sFKx2MLrue6tSRXT/npr2k
         iuyAdF+wUQmzkp5qRISLW191ZInd8rn1xM4H+oswEvOVard+b3XfRXZ4yRVnWhNYT0We
         /qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751018263; x=1751623063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwDy+2proYOLrYP4jEl+UhyGumZmUzGwf/H1c+IwxdU=;
        b=RK6KaUsYsWK52lPCPOa4hWnj/FbIPZ5pwD3LI7zTay2/EwKpUmtCcRmg5PuM/kqkGN
         ZebCho5VcgzQFpt5ohlwq+mDBdUlEWfBecqJiiQqvw4UzKd8M8ENJX+kP2rIayTXnWYw
         C1+4kH1Dref48fh39u6DYBltKddep2qjDruRpgeGZf3LMWN2CgbiLiiEd9qZRXB+rZWS
         phXs5lnNYwbpgEKSLk0+1QVbYikZh0C8eg93mNENSKffNXKNTfiSWPSxaTOFhFg0xR3Z
         6X0vj7NHyFEq5rE2NnJHZ/myuSQmcPm2n9NmluqWnC6Tm2Nn60Ip2LbHJ2FHrOqa7bWH
         QUHA==
X-Forwarded-Encrypted: i=1; AJvYcCUdCFImCckgdYp0gnBOO3S6kzxFH+maxRbQrbb3XEIa3NXo0tOHMDaSDtwNHHUDyNcRKQiGvi4OOtrXoNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqbHFAFfOHKV0qSwPur0nUQJm3OmF2SkB/f2lqD5HJSKsOprht
	9JarsEqDqKSq306bfo8H0a75r36p1YPyUs1K/ldusPBXSZjGEBEeSIIaJ0b7k2SKmsw=
X-Gm-Gg: ASbGncu5lA9blQ87uKyVwypCxpcW8WpN4FSy1vw71W9lxC3rcrdxSKo4lLZKFjQUmc/
	dvryl0wJ4jzoZyYSTNVQB1gFPelPojjn9OiDhr/l0r2CUHUcP9K+apr84+mRELSm0y8y4x48rma
	meN/f8XFMbGCow7kjBlz3Bsg7Ff5Bf/0yBZ4LB6o6Jot2sITnsv+YMxShRdjsNVTJXRYBnXO3Yb
	gqc6dLgZEXmHNhXLISz+kAwyGMdXXfv3TEYfvgI2SsNma+0mIKOS549G52ugnG//EeR+LvH5sT7
	+HPTAkBh7DR9iOHQJk5Hq5CEZ6ffrxs6K1M3zVIQxjvJqeSB/8HkVW+hne3isBAg327LomNs40i
	YfMgxoW4D5ORXqCKLNO6gBxaKB3sLUGKtEJAcPQ23Z6W0ag==
X-Google-Smtp-Source: AGHT+IE1SvpNm5CP6mOqFBIwW5hSM+IQAnFj1rNcxOwLH+ZTDysF76MjOPbBHOe49nDHS4m6dEzzRg==
X-Received: by 2002:a17:907:9812:b0:ae0:d7c7:97ee with SMTP id a640c23a62f3a-ae3501517b3mr215390466b.41.1751018263460;
        Fri, 27 Jun 2025 02:57:43 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at. [82.218.28.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363a149sm94561266b.9.2025.06.27.02.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:57:42 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linbit.com,
	linux-kernel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org,
	Sarah Newman <srn@prgmr.com>,
	Lars Ellenberg <lars@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH] drbd: add missing kref_get in handle_write_conflicts
Date: Fri, 27 Jun 2025 11:57:28 +0200
Message-ID: <20250627095728.800688-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sarah Newman <srn@prgmr.com>

With `two-primaries` enabled, DRBD tries to detect "concurrent" writes
and handle write conflicts, so that even if you write to the same sector
simultaneously on both nodes, they end up with the identical data once
the writes are completed.

In handling "superseeded" writes, we forgot a kref_get,
resulting in a premature drbd_destroy_device and use after free,
and further to kernel crashes with symptoms.

Relevance: No one should use DRBD as a random data generator, and apparently
all users of "two-primaries" handle concurrent writes correctly on layer up.
That is cluster file systems use some distributed lock manager,
and live migration in virtualization environments stops writes on one node
before starting writes on the other node.

Which means that other than for "test cases",
this code path is never taken in real life.

FYI, in DRBD 9, things are handled differently nowadays.  We still detect
"write conflicts", but no longer try to be smart about them.
We decided to disconnect hard instead: upper layers must not submit concurrent
writes. If they do, that's their fault.

Signed-off-by: Sarah Newman <srn@prgmr.com>
Signed-off-by: Lars Ellenberg <lars@linbit.com>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_receiver.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index e5a2e5f7887b..975024cf03c5 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -2500,7 +2500,11 @@ static int handle_write_conflicts(struct drbd_device *device,
 			peer_req->w.cb = superseded ? e_send_superseded :
 						   e_send_retry_write;
 			list_add_tail(&peer_req->w.list, &device->done_ee);
-			queue_work(connection->ack_sender, &peer_req->peer_device->send_acks_work);
+			/* put is in drbd_send_acks_wf() */
+			kref_get(&device->kref);
+			if (!queue_work(connection->ack_sender,
+					&peer_req->peer_device->send_acks_work))
+				kref_put(&device->kref, drbd_destroy_device);
 
 			err = -ENOENT;
 			goto out;

base-commit: 456ef6804f232f3b2f60147046e05500147b0099
-- 
2.49.0

