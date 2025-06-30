Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC5472621
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312205; cv=none; b=EFTIDh0+Blklag55QqdbMqLBxI1gKn0qPQHWnOOHBfNi9OCUJlA2tk17xxvysaCpszYS7/uQd/kiRrTQgbSh5FUsVuHIoEEXZfMzVB6XBEUu2oOAOzQEbZtv8I1tDVpyOYB7kACSkQQ4Shhm3YqvXCoPHk307NTxH1X0sOFVOMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312205; c=relaxed/simple;
	bh=PIZPJ7i63i8C0TC1GjtbhrzgGNXE4XRxULt5H9rtUVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KkBGMNw0l6I8u06Zs6gzM5/Zs+YpuKw+c+k/odbBEKySbGG4/IxtuAKccgdVtK3v0Cb02jUfqorZN8wgiGmB2KEoNyUnQJ2TjJMFUrb5ydGhbS3GNCkEgqhm2bLM30m0+4ANDcNKDqnNJ1fpxX+/Ddqdl+pCgrayt5sA6xBrNJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QaNZwgCd; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QaNZwgCd"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-606668f8d51so2552113eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751312202; x=1751917002; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rFs3jWGVmRQiCPCz55IrWTyhhJse2uDEsntELmdGZSw=;
        b=QaNZwgCd8LTUrRGOqXQg/AzG2jvyTlkvLpxZ+mvKqDxX62j4L9xJTbvtYLSkhGld0K
         Pjj4/ECsMfArbItgVOIoTW6iIZBrJzSp+DVSNVKM6bO27ASyD4bkn9J49/bbxKTs622F
         jegbtqUWdwJG8XdDuatbQnBbUSrjMClsx/5nEGRgBc81Pehz+ObYpe5u6gOhI+FVVEBP
         TRx4jqecbqbQ5C8S4+RFMU7g5TftSyL2TPI7hJI5jO431XJaRQd6e/HXQxcbF+Vk7l39
         EnZ22C8TogGRkyRxF196sflQOLXOM+6ONzJlBuHOlckX2MujDWfjIMgzmg+bISUj1nS+
         nv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312202; x=1751917002;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rFs3jWGVmRQiCPCz55IrWTyhhJse2uDEsntELmdGZSw=;
        b=o7nFQ+EhaP1zJ8mKTj6VV3818uUFR5B7PxvR5FUFkBiM0u+jaY+ZWqR3AjAQzTj/r4
         QPyMk1WSbD5lF18VuV0vbN2h0n4l/fFQWL8gNAhIo6GD8iaj0tAA1aWEIP9bWli7u3/0
         MSQ3NQrylk1jE+HMIsLqhAydIqPW62pwoWbjd76X6WJVfI0Fk0xCFgphRne+QIwVzXCw
         qC0kfOOasyr1UY4/sDh/uyJ0Ib7VH/1jUHtl98A/g5rHi5BP8sz0hpB2h4NoqOj4Tgau
         mYBso1PqABGjr7hv5fG9a9Cu0UbxfvGmiNlO1KFgKQq5S+7CSP/dzaQREYjxS4eLNsuu
         f5Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUoCaaNP9p8+Juks0H6nRYcESUjlIRtvzBz6RAzoEpKHRR3NLqPfn/8QIsT7vmQ4WpEH0D8bBRVIprdEzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCKAyfABQWpxZtZmhe+cr1YJN9EpcsZZn55912+PkTdhiIcvEL
	QVIkNNu1S1onc/5hkcYsBI6joTCR/0xZpJwedi/JkPmqwkvtSrlMU2Hf8B0tHHdZO3cOc7TSd9O
	YjPQBJTc=
X-Gm-Gg: ASbGnctzmmOebM7PwdKm0N3zqutqiEeinZSW1uamuk48kzSOQ+Bqt6RG2G79RoWAVFg
	1TF3mKHngU8TkOb2hY56jvc9zRQfGA5PYBuRMPrYmR7uM6GYy/cr1sk4Fj66d/mrzBtBu1gYTZf
	5Xh0XYxxlF8vavwI/vetwOAC4NiJVYhLLC9D3anewZ7fYDS00lcVV98YntkJg4uUivVksZz4MN6
	GeEwF+MjGwm48DIuaSXXaiuHLxurwcjImciSTQlQTHYrO+Yd9v1A+Zp/J7VWraaRjzcxoMgN1mD
	BzLnHHqUm86rILA5F469eARbWWy0EBTJAdHhX1de5opMSbmQU7O7P0lD5si/4sfmNqGt8Fc3qTc
	4Vzs=
X-Google-Smtp-Source: AGHT+IHjOIaQTv70hTn6APt2/cC+UCDsl698/+NS7It4EICnrQ1NcFfOWmmAvQSJbsGHKSZ8d4JqzQ==
X-Received: by 2002:a4a:ee04:0:b0:611:3e54:8d0a with SMTP id 006d021491bc7-611f389e302mr585444eaf.1.1751312202009;
        Mon, 30 Jun 2025 12:36:42 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:49cc:1768:3819:b67])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-611b848d86bsm1176542eaf.13.2025.06.30.12.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 12:36:41 -0700 (PDT)
Date: Mon, 30 Jun 2025 14:36:40 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jiri Pirko <jiri@resnulli.us>, Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Ido Schimmel <idosch@mellanox.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net] lib: test_objagg: Set error message in
 check_expect_hints_stats()
Message-ID: <8548f423-2e3b-4bb7-b816-5041de2762aa@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch complains that the error message isn't set in the caller:

    lib/test_objagg.c:923 test_hints_case2()
    error: uninitialized symbol 'errmsg'.

This static checker warning only showed up after a recent refactoring
but the bug dates back to when the code was originally added.  This
likely doesn't affect anything in real life.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202506281403.DsuyHFTZ-lkp@intel.com/
Fixes: 0a020d416d0a ("lib: introduce initial implementation of object aggregation manager")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 lib/test_objagg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/test_objagg.c b/lib/test_objagg.c
index a67b8ef5c5be..ce5c4c36a084 100644
--- a/lib/test_objagg.c
+++ b/lib/test_objagg.c
@@ -899,8 +899,10 @@ static int check_expect_hints_stats(struct objagg_hints *objagg_hints,
 	int err;
 
 	stats = objagg_hints_stats_get(objagg_hints);
-	if (IS_ERR(stats))
+	if (IS_ERR(stats)) {
+		*errmsg = "objagg_hints_stats_get() failed.";
 		return PTR_ERR(stats);
+	}
 	err = __check_expect_stats(stats, expect_stats, errmsg);
 	objagg_stats_put(stats);
 	return err;
-- 
2.47.2

