Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA20824DFE9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836147; cv=none; b=D5Fqc5QoGd81uPZ8DIXrz9CxtibILen8uvA9fXKLxI+k/Lx8mAde750iZmJa+LzN2ZVXZxTXd5c2SqS4gLbVum0MJlWAQ2/vlK1EKr2JhjWzlartlDaBi7EKixWJD6ERPmH0Ax9lfm+8ZVMglemwOW/O8/gydciMgSmst6LvhYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836147; c=relaxed/simple;
	bh=7oIHWBBjQ7BlH6IvMzYiszexZSDJnBmjz47kdnIC5NU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCPAp1HsAarJ0ef53zmynze4UtyVzKCTnuwLxdDPOZW0tsUkaUlx7hDsPYv0sF1alrdr/0F6pAPfbIN/DgdBXgodrHsSkcDZMfRRNHQEzdGomNnZyr9xOqZZViJucPUKl6D2m6PSKESYcxraJURaQh+8oTK6pXtjigPZp+VZrFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=N/QBXhYr; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="N/QBXhYr"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2295d78b433so1041165ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836145; x=1745440945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Pdr3HWigL6Ku7LuE0NhaS5q7GdvsPzI86/WAfJAJfQ=;
        b=N/QBXhYr/+djcMpQJ1tRCCXT4onW8r++z4ikP/RcajKYHrcPbk1hoMx6j/QxtzxTFu
         FsC8y5M4jJJwYyQPcryjSXU8HK53xLKHiJjveJbfFKWjw5+t07whF3AS2uX1JRrMxCl0
         lq/j9c5gLxztPlx2VFSIIYM9Bws+5id4ZYe9AQL5LhNqG8NQK/hUVmuW6K88ryiFxEQf
         5u7coMcQylTFUg5AAGvUSRrSeQpGNm1zZGsqSxlE9AuK5dCDi04LIUJnw9P3sNDjAS7q
         D+ID71od/qXwTsXEKNvwgQUEa40C8TIMsfS6Y5sffiSrr83KZE/q8pnyJqIFEnCeHGV3
         SAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836145; x=1745440945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Pdr3HWigL6Ku7LuE0NhaS5q7GdvsPzI86/WAfJAJfQ=;
        b=aICF8pVmvNxjv4L8DaPY3z7vgLaWjhRYPx/tuZ2bPrLm0Z0NHfIxLtV4aRgfMY01np
         8Ic4mDwkSewsRbirrJ0cUSkSAGrZBe3u4uS9e14dfGB4lLDPPVGPHBuQ313Fo37S2UGy
         IniBnQEfu0gSIZy5GrjRW4J33Bmr8S79RV9IU1GfL35Z5QfeXwlG3U+ytdi2XyXr2u0N
         FY0iqogVx60s0F29hhrOK6neEg/G58UKauiH4CMFU3SEi0pIX9CDGbHQBRhK425C0zZX
         ToEsCwOVtXFlJLoBCjaao9/gTsBj4Ys6eLNbBYjPhpXNJQOx9ST2SwHdBIncVYtbEYQ1
         mjEg==
X-Forwarded-Encrypted: i=1; AJvYcCVaQCc3KmwqgcEVQKyqTAtfy5rhAusEbcIizDdL6S1Et0pKDNY11ozkQleU0fjZrrVukcDLDcFSPFSFdtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1QXmkFhvINosPWRKR3q7q68vyafld8zRfk7HgS1gPSLmQd991
	ViNsf+QLwHvO+4y9wOfT2nf2cQZXIdgmp92qZveH7yNM/PwTmWuNwjpSWId2lw==
X-Gm-Gg: ASbGnct0zsuRl9EQTNbKpH32Ax3mtVvxVA4+4hqXQf1HNMzkNku0Ty+YdyNUd0UZ+do
	5X+UKn89Fbj+qzf7401cz5oHS6ptRTBoDM3xvcxNN6GfBRpc8CrfZ8pEXAzNTUE8l1KtFgbqAOQ
	vWm4QubALdoQBQjy5QxK3U0meZVcs/C3RBrWRHY1KsVnGMWdkoWHCapnvvYMKV+zinDOsOkNLaS
	BEiuoBBDgkLM1UzmVuGkXl2q1EE02BnC48FmBKOhub+etEIEi5tW5bPSwQuSUcP8dsADnrwieOY
	HZ9SQVs4sLXqjRiUcih5XVXcTY29+GoChOlFVRiARkzr58vBepwuuJpPhgU1moSpWpHA3k/fa7j
	qJLCH6LDYdGS4RJXq
X-Google-Smtp-Source: AGHT+IFgGXbC8NUaBhucm1SllpfE8LnJo42AjeHbg+eXJhZJkPIsWniUDEnSNOIKzZO0pM812bXo7A==
X-Received: by 2002:a17:903:234a:b0:21f:7880:8472 with SMTP id d9443c01a7336-22c3597480fmr64364245ad.35.1744836145370;
        Wed, 16 Apr 2025 13:42:25 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe97ecsm18901965ad.255.2025.04.16.13.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:25 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 15/18] staging: gpib: ni_usb: struct gpib_interface
Date: Wed, 16 Apr 2025 20:42:01 +0000
Message-ID: <20250416204204.8009-16-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 00f788a59dcc..a3d517efca08 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -2373,7 +2373,7 @@ static void ni_usb_detach(struct gpib_board *board)
 	mutex_unlock(&ni_usb_hotplug_lock);
 }
 
-static gpib_interface_t ni_usb_gpib_interface = {
+static struct gpib_interface ni_usb_gpib_interface = {
 	.name = "ni_usb_b",
 	.attach = ni_usb_attach,
 	.detach = ni_usb_detach,
-- 
2.43.0

