Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACFA23CE
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 21:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738790979; cv=none; b=rjqd0MX+x07TqhiIEDz+HY9b//7XquKbe0q0Nv/oFCQeOQ1V2+DbwJM2GoAotgIJXGz9AeAZcXwsGQXbvzE+o4MYdAmHuJHVzVwuOO6XPM/sX1Yl9Htz9dsxW5T9OM51AymipvG4rO5pdiE9Tg9LXpzZnxjdXG5ESUBdKb1At/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738790979; c=relaxed/simple;
	bh=DzaZIGVGm7qxgynff/1jUjJ5vq84RX5hbBIwIAnkfQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eKy4kyrOG60OYweEpCY+dPWKW44FYE2ptQG9Zk8FyZ7aymTvLsCb92QztoYh44yWD6DNSaeKsJUNFCzy/kybSZYP6TswZG5D/IE0PFdr5gMNSrjm8WKEt2PKm6f3PLjsdNRWj3gNhWW2TthEkJnux5uQCc1RsJ6TsMDe7KFHNqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgL62QAn; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgL62QAn"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21f01fe1ce8so3493065ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 13:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738790977; x=1739395777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BsjoJB7HDSrSJA02r+vmBeTBw6vIoTH7OoO05MDvcE0=;
        b=AgL62QAnTMsvgWLxdYZW8N9EKyoEAOQ3QKchXCjJwu0JZFK38XFYeWZZvW1dvYNg63
         jUHYe5y+kDMnDMiFmxyuu+hTb4ad74LsWZ0WWHYkjtKvCuNwW/paQRmqgjFY7K18P7Qm
         PQyEPyauzR9tKmQDObESvldn9HrWKCkMgGR5dryMyWuiNUcZcda2/RBpibhveifRRaaA
         Hf8Y2OsYm+SZDFCKhH/DqqUqRKyBS3FVH9kIRpK3DozKh3vj4k+1W5k+/anF9yPFtYhA
         hg+eUHopF3D2tPZnvjtlHeU6PpHooaibe0d2prMUOWdyyHjLQMfvQbi/5aij+t6QqAA3
         HFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738790977; x=1739395777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsjoJB7HDSrSJA02r+vmBeTBw6vIoTH7OoO05MDvcE0=;
        b=ihSIUwuSxxaQDnRJWRuwzW860MBKFmW08yXroLSQ8x47ofh1HCG79D0J7+OuiEh9Q6
         lFAkDTJpDr6nFz9hZ7dnmEcYPb65E5pCL0c7aX4FvN5e6YBqFTXV8wKE7TxbfVzbV7Fh
         kMKYo7jMBaJsADB43bVTseaEtJACV+FKIi9udhUD0fhsnmqIttS9/3anXv+A9x504rnB
         nukOvyUBlndOv3TwBcgYkLetA6ACwBNX0JaVuw5lPAwCkVYYdKf811rBMWFaY9GMv6Yl
         R8chcVvxFB/ok3CXuQiQK3JcWOVDlMKEAYiesUpyG0B/LU/bk+Kn1hPII69qNA3Vnig8
         WvNA==
X-Forwarded-Encrypted: i=1; AJvYcCUhosPjIvKWjM/+fpzWrNlBIIXs8e2VJXdeguQvXS3Wwug0QpYpimyaHLthzGYQfMPAbQKx3BYEAxv+IZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdSGugYRWl09XB+oC6EQ9MJ6pi7GkJT0wNoD4QcQv6RUbBqPVX
	YEV+hTYPCq/UulCAHCSS+6UEZlMK32rlqs+pnrNhlG/hcyXqqY2d
X-Gm-Gg: ASbGncvGxTvzFcg0hDHkxhrRbuPzrDFPk0zpFSI65IDc5mO+cgoVU57o1QoRpJA4gKP
	26FN0c3YksKxNxoqn89QmpZF0CXXKRfxqKS951dZzhmBERdV4qeTYSpMh1+wNrCC4fkWrmT2bYm
	07jzuTVLft6Me8Du78GlPB2HmJcSuSoYSI6Bj4Vk+Si7l1uL+qfn2GuRh2yhvWyuYAlTXs9C1Ja
	Kd+AuM6F7zl15vv+WCg9Px9HTXgIfNTm5+pBgV6o3oemtPm7PdmwFy6uz9bt4rCZE8T4mxh24Xs
	CsTuhGFg6V9cpss=
X-Google-Smtp-Source: AGHT+IHhzYDNMW2DahlJRENyuy6/UOMNqwVg8iWKNVysPefqFop+9Sn0/Bcx97VFtzq0tHNsbU8NaQ==
X-Received: by 2002:a05:6a20:7f92:b0:1e1:b44f:cff1 with SMTP id adf61e73a8af0-1ede88bc471mr6561441637.33.1738790976805;
        Wed, 05 Feb 2025 13:29:36 -0800 (PST)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631bf82sm13450584b3a.17.2025.02.05.13.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 13:29:36 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mikhail Zaslonko <zaslonko@linux.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Joe Perches <joe@perches.com>
Subject: [PATCH] lib/zlib: drop EQUAL macro
Date: Wed,  5 Feb 2025 16:29:32 -0500
Message-ID: <20250205212933.68695-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro is pre-historic, and only exists to help those readers who
don't know what memcmp() returns if memory areas differ. This is pretty
well documented, so the macro looks excessive.

Now that the only user of the macro depends on DEBUG_ZLIB config, GCC
warns about unused macro if the library is built with W=2 against
defconfig. So drop it for good.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
scripts/get_maintainer.pl failed to attribute this patch, so adding
Andrew and recent active developers, and Joe Perches for the script.

$ scripts/get_maintainer.pl 0001-zlib-drop-EQUAL-macro.patch
Bad divisor in main::vcs_assign: 0
"GitAuthor: Yury Norov" <yury.norov@gmail.com> (authored:1/1=100%,added_lines:1/1=100%,removed_lines:5/5=100%)
linux-kernel@vger.kernel.org (open list)

 lib/zlib_deflate/deflate.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/lib/zlib_deflate/deflate.c b/lib/zlib_deflate/deflate.c
index 3a1d8d34182e..8fb2a3e17c0e 100644
--- a/lib/zlib_deflate/deflate.c
+++ b/lib/zlib_deflate/deflate.c
@@ -151,9 +151,6 @@ static const config configuration_table[10] = {
  * meaning.
  */
 
-#define EQUAL 0
-/* result of memcmp for equal strings */
-
 /* ===========================================================================
  * Update a hash value with the given input byte
  * IN  assertion: all calls to UPDATE_HASH are made with consecutive
@@ -713,8 +710,7 @@ static void check_match(
 )
 {
     /* check that the match is indeed a match */
-    if (memcmp((char *)s->window + match,
-                (char *)s->window + start, length) != EQUAL) {
+    if (memcmp((char *)s->window + match, (char *)s->window + start, length)) {
         fprintf(stderr, " start %u, match %u, length %d\n",
 		start, match, length);
         do {
-- 
2.43.0

