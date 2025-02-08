Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93E7243385
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 23:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739056776; cv=none; b=DWwa24GoNcp3ONQRqpNybpwhPT/cjUVCDsoSPS+snJtUt/BVrn/q1m+aCJlDMUiUDNu5XzgxJ6bmNbZ6BEIaPzoErwTKD/2z9XpJCd3cnrDyyai7C+Q5EEznB0qkk2WJdIjwbEY999XdJPQalRgYE+DNp/1DI6XBsS/PQNLuJ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739056776; c=relaxed/simple;
	bh=jIFv2SsvGgxh5XvyGujY/iKz4uWqj9G4Vnr3Ld7sPx0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dTEIpMUYQx/t0E4KU3l/xbiup15FTNIMt8nrmAEglakbf/9vTmUbaUdEAiAW8nHuSuHWLM3VRM0F0xZC2L5bkkVf21doi6I4+JsrixUy2j+zm1GCD7Gxs1VR3PPp4ddRG3FTccxHJ8Gs+jyQ9/b+o8XTa9e1AS2PDmc8ngfdRcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--akailash.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0pE+++ft; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--akailash.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0pE+++ft"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f81a0d0a18so6862482a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 15:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739056774; x=1739661574; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2fAxa4aN2gJ59ABhKxViFnLDaFYa2+S9AaH1Jy6Y5iE=;
        b=0pE+++ft7A+U8XVIn/aGpN+7Z0teWbhhLpUnK4f8ep5MeWyqBMzu1a6yPaEAwv7kda
         jf/qUis3MxLb1MF1mdoWBXAVYYsYooahq2ZbHgP+KHXHiF3Xsutk40VERiB7yztBWNah
         4Bl7s18ZQg8lRnEGx9M4SdQ7LD5iN7HA8gI9aeFFlSGTA7egn7K2Mc1O29md8ROSK0Bq
         lR850U2/SngHi9bHaCjpsKq1LO8SPGZjbT3Tz5q8CErFy4bkKzbzQJ+d7RWD9KXn0Uat
         9fBkyn2cLu9H/fjfdj2GiInE1FtLFBaHXNc2NmXuD4lRx2I8D8sI4KloiURDPQA2GyHK
         fbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739056774; x=1739661574;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2fAxa4aN2gJ59ABhKxViFnLDaFYa2+S9AaH1Jy6Y5iE=;
        b=rS2l1vwlIGlqMQuATLYYf0BwOum082wjNCIh/hUFlHOiGz9zYQ86xB3tMshjLuuRvT
         KlbcFTH0VeHZhfWoXOzwE7+RyKnag3aEXvXE8dpSZe/05J+mxMm5fSybsPkzOL0XdyTT
         V3CBmbKBQynPKhEfpArzVcbQIwNSbPv59vn1NwRDJUKGdEBkCpfPJt7zAENAdbOx2us7
         5BlMRTw6lqAFsEm0o88bAzkC2ptyDXYsD2ejzf8Y3sNOA469Q7kBF4em4bYKTfmS8oNX
         G4YzPWUjcYabltoj1R/+XmoKjb6hW+ly60dkKcHb28vsvvIROsZSaYRWWxw5x84dbKvL
         153A==
X-Forwarded-Encrypted: i=1; AJvYcCUcl3IAh/j3dsR4vuZ74/CZ0dv5bQQhYJrG+28nAL5LTednx/C80Yczb0OpuwFCPdA4Q7gO/xINTKUq9p4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNN0YDqixbioI/cZ1mT0QfldNPIV6TPA/CZ5DGqhQ9jEu7AfmM
	xVtuQ2/r2TiFdnHaA3jCHGxaw7xJWIH7FchW+d+/wJ+kQUQs57tk76azyWVBSjPiPYrpvWrhW9z
	kb0NOzVYsOw==
X-Google-Smtp-Source: AGHT+IGTo0DIBBKLaC8j/EXJp5BYuwmNZDX8o3x/MBdEOSTLIkG/S7kviz6vlv/uW0jpyiGro0lOtJPHsX1Y0A==
X-Received: from pjf3.prod.google.com ([2002:a17:90b:3f03:b0:2f4:3e59:8bb1])
 (user=akailash job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5543:b0:2ee:d63f:d73 with SMTP id 98e67ed59e1d1-2fa24064ea7mr13002389a91.11.1739056774226;
 Sat, 08 Feb 2025 15:19:34 -0800 (PST)
Date: Sat,  8 Feb 2025 23:19:23 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250208231923.1952228-1-akailash@google.com>
Subject: [PATCH] dm-verity: skip verity_handle_err on I/O errors for metadata
From: Akilesh Kailash <akailash@google.com>
To: Mikulas Patocka <mpatocka@redhat.com>, Sami Tolvanen <samitolvanen@google.com>
Cc: akailash@google.com, kernel-team@android.com, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, dm-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Handle I/O error for metadata blocks if FEC correction fails.
This is similar to handling I/O error for data blocks:
'commit 2c0468e054c0 ("dm verity: skip redundant verity_handle_err()
on I/O errors")'

Fixes: 2c0468e054c0 ("dm verity: skip redundant verity_handle_err()
on I/O errors")
Signed-off-by: Akilesh Kailash <akailash@google.com>
---

Note: This patch should have been included in the data block fix patch.
A "fixes" tag has been added to address this.
Link: https://lore.kernel.org/all/20210913092642.3237796-1-akailash@google.com/
---
 drivers/md/dm-verity-target.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index e86c1431b108..e1ce3b256f0a 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -353,16 +353,26 @@ static int verity_verify_level(struct dm_verity *v, struct dm_verity_io *io,
 		} else if (verity_fec_decode(v, io, DM_VERITY_BLOCK_TYPE_METADATA,
 					     hash_block, data) == 0)
 			aux->hash_verified = 1;
-		else if (verity_handle_err(v,
+		else {
+			if (bio->bi_status) {
+				/*
+				 * Error correction failed; Just return error
+				 */
+				r = -EIO;
+				goto release_ret_r;
+			}
+			if (verity_handle_err(v,
 					   DM_VERITY_BLOCK_TYPE_METADATA,
 					   hash_block)) {
-			struct bio *bio;
-			io->had_mismatch = true;
-			bio = dm_bio_from_per_bio_data(io, v->ti->per_io_data_size);
-			dm_audit_log_bio(DM_MSG_PREFIX, "verify-metadata", bio,
+				struct bio *bio;
+
+				io->had_mismatch = true;
+				bio = dm_bio_from_per_bio_data(io, v->ti->per_io_data_size);
+				dm_audit_log_bio(DM_MSG_PREFIX, "verify-metadata", bio,
 					 block, 0);
-			r = -EIO;
-			goto release_ret_r;
+				r = -EIO;
+				goto release_ret_r;
+			}
 		}
 	}
 
-- 
2.48.1.502.g6dc24dfdaf-goog

