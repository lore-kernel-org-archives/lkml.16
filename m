Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8781B87E9
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738332789; cv=none; b=Rwpri/92sbpBctwebnL98zoigG3a/4tvH2EogtfpTWlK8SfM5bKzEI1M84fQj3rDkgf5iHk+8imqA3pK91VcX3QRPyjgvGBT3oLNCWWfjPS0ZXli3MTsCqJEdfi2eiK3Y8vspPM6RNLNXpqEL7Wja/6crMOLglMnyG9uy9OBs2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738332789; c=relaxed/simple;
	bh=XghCemtK9MiQOCdePWwNBlwwPmBOCo6aVrFS4lk1e0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mxGKfZaNlbYPtnWkEdrVgprGzZFsAKfu1TzzHO7PLHKDWpjQogEA40G6GLqiENUf3QHzkUnflnQ0mWg1jKLN3TEjBfZztyvBPE8W4u8SV1c5P+UDLfvhbKJ68mMm1qQXuKmuEGxTpADpNKSwgx8IUWFX50DOn2RM74z9krMPg8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vd90o9a7; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vd90o9a7"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaf57c2e0beso422685866b.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 06:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738332786; x=1738937586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lH11xScjXdBhwu0owdbMuzIidEXbN+tQBLtkebV8+ok=;
        b=Vd90o9a7GNp2zWRouREwMbten1uXi/NBOCIu0hUvZocyWhtQKQM8JUnUKzZkqD21/0
         s5nkuXT72yolChr/rfer0MDqQ6xUy5TRGgAP8iw5KYJUKrPsJwlQr95gF4Wmqw69hABv
         cylHiuFNWJbuAAAlyPlu8+L7ZEhuRe0B/9CWLgDjPZRFjxPrqvZMnQNj0UNey7eoBQz0
         qnYvUddiASNDJJIVi5B/ypGiQ/NzMhhP7KfAmEsbZ0lbuwDZErRXCfAUWRWN8C1CUOdL
         gVAHqgy2cYcSwbGilAev9HNbadYvKBRqYUmAygcgJdy1drBdgCG9OeHsMeExy7u98bYT
         T9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738332786; x=1738937586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lH11xScjXdBhwu0owdbMuzIidEXbN+tQBLtkebV8+ok=;
        b=DSWHQcTEU6D5daA5fFKRCQAeYri1iKvDKw7qGy3Cy6jYx2Gh/Km5UoNiFISebY/Qxq
         RjLfjCPLKG1ycEQkqlMd0KCblAcSDZ7tSHlveV7MDai5sT5DT8ZNQOhe3vUkGG9vLH1l
         5lec7Tqwf5/KGP79D2ONjoYH6iozjfJWyKYz4jf1xpVo011uKVt+LVNSTjf9cfhPxh2L
         m/ldKl0W+sJBfAYrrLMLdg8T6Y+24fow+oelhMECZhwOJuCouTAzM11FFeXbutlqzZSd
         KGnmfO0bgfDyZJdoi94Pr46e8DUujyxyZiU7eczCUsmuaG+MFtJhssqNwEwMxQNGBned
         6Ekg==
X-Forwarded-Encrypted: i=1; AJvYcCVJIDFEppBMK6eNR1X+9KO+9FA2Zy2jv6m1JcsA5n03CBxHfQHREB8FZBb0eYCznz8lw8cK1LzozhwEs2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNdi3aKitUiKMAOa/XNsw/4RxmFxY6/9DLY2Yc7aKEMdU4FY2s
	3z9ItTmu9KsevnIT57CsPkM7JxZEkhRxECNzlErT0maKIqZUAqJV
X-Gm-Gg: ASbGncuYtSbGa/M4XKHJUMUJAZmUAiAqxhDdo3G+jgiVUQg0Pmrqd184g6+ioqZYeIZ
	RHFp6rU4C7dNodZJWFJcqYVIo53pc72Fsr6ymVoGUuuBcgIFurDNX6l0gapiu9dva8m7Ui2BbaD
	oCjV11Kn6hblYSz109ApirL5TqdfZ4uyVx3p+eUPwqQFaS8Hq14S+dOsyQFfqa5/MteBDMIyf8B
	Gcw5OGMpIIJ2nZ3YBlvtvLWjU7l1iH5Slbnh6NrQP+keKRJp5bhxdNkYxkXLAN+cU3EtoOKmHU=
X-Google-Smtp-Source: AGHT+IGxnW7w2b2+d21bXlu4BddbT1XaKbwgCcXw8POUPSKV07AfU8TIbqWuTkwUJMe0YjlES78GBw==
X-Received: by 2002:a17:907:9703:b0:aab:dc3e:1c84 with SMTP id a640c23a62f3a-ab6cfcbb88cmr979173866b.17.1738332786098;
        Fri, 31 Jan 2025 06:13:06 -0800 (PST)
Received: from 127.com ([2620:10d:c092:600::1:7071])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ffd63sm304535666b.94.2025.01.31.06.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 06:13:05 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-kernel@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	asml.silence@gmail.com
Subject: [PATCH 1/1] lib/iov_iter: fix import_iovec_ubuf iovec management
Date: Fri, 31 Jan 2025 14:13:15 +0000
Message-ID: <378ae26923ffc20fd5e41b4360d673bf47b1775b.1738332461.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

import_iovec() says that it should always be fine to kfree the iovec
returned in @iovp regardless of the error code. __import_iovec_ubuf()
never reallocates it and thus should clear the pointer even in cases
when copy_iovec_*() fail.

Cc: stable@vger.kernel.org
Fixes: 3b2deb0e46da9 ("iov_iter: import single vector iovecs as ITER_UBUF")
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 lib/iov_iter.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 9ec806f989f25..65f550cb5081b 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -1428,6 +1428,8 @@ static ssize_t __import_iovec_ubuf(int type, const struct iovec __user *uvec,
 	struct iovec *iov = *iovp;
 	ssize_t ret;
 
+	*iovp = NULL;
+
 	if (compat)
 		ret = copy_compat_iovec_from_user(iov, uvec, 1);
 	else
@@ -1438,7 +1440,6 @@ static ssize_t __import_iovec_ubuf(int type, const struct iovec __user *uvec,
 	ret = import_ubuf(type, iov->iov_base, iov->iov_len, i);
 	if (unlikely(ret))
 		return ret;
-	*iovp = NULL;
 	return i->count;
 }
 
-- 
2.47.1

