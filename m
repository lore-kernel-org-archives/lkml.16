Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F6D14B950
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744777730; cv=none; b=oVSkKW4KFRETyK6L3FsF5rIIqYbHa9Fe2e9bWKof34UU0L3mqN6WVlmwcHQuyfjHSLAzEAkjr5V/JvaQr7aytpjNE7ALyyBwenrE1CzlDrxqa481bmSI99Z1EMKT/pQazxUBukvKIpYSENbRnQT9grrq/vR0ytMQGriiw8+mLwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744777730; c=relaxed/simple;
	bh=4AJ2IRDS3sRCUOnrqIohAaHmEqjAS+xtpAHzbK07RFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hfv1gybqmYTaW9VrXuXTxzWXy8OS2EOh11JzuD5g5DKkYHZ+KdBC/MfqSowsq7AymXl22iOpyejJz/t6qz5ut1TfOaXFhln4F//2Oc9MEkblonr7d2VURjmhQQql4LIFz3uttq81nJVwB2bIys5WmYamQV/gpPLOFMssRDLeB3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LuKIu+eE; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LuKIu+eE"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-225477548e1so61490365ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 21:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744777728; x=1745382528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=28eKhoko0uR2M75teuQ1e8pqzKdF+6yNeZfykeX93Ik=;
        b=LuKIu+eECOeJhIiIWyf6nkDDGeMxddwG4NIAPmehpUAHMhrtm8g6YCyUyg44N3ImpN
         JVKvRb+frku6K+vN2iJuU5PCHciYVByr5DYfjv5L7qxy4KOmRLpai7deza2xHv6fADw4
         kkq8q2gK+IO08KJzagKg8dfUHNdnyU6b18f9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744777728; x=1745382528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28eKhoko0uR2M75teuQ1e8pqzKdF+6yNeZfykeX93Ik=;
        b=ZwwuRbWIyH79Gql2aJTzgHPvHzZFHEJtWrmlOrskVE3z3pmFboTrk9tryNUnokiK3r
         HartLK5ITNbTRo2i9w4/NoKhiLiuMPHZdy3wWVaQVqtAvv4dKDasEH1bFAiVqUKozzOn
         v3+j4kvQildBB4BDq1zyYv3zhL7hul2N61nZOEFgbvv6ceLkFpblOgeZKEdlGv2Rxr23
         MMuxg5EEOh+SixNIeENennTGCCB0DYQTF7KMz+Tf2o3LFyuj7kgJm7Ez4buec97UvaX7
         wnODUzP6mErQqvhuOmXqbbV3X3Vyy8QiaH9gsBuuwZMMNbO6vw3olS10hyjYwfe9ivR+
         wdcw==
X-Forwarded-Encrypted: i=1; AJvYcCW2MKcke+P0bMdjJBg3Tjlg6XDjT7dWgsLmv4+/VnFRI46Ixhe7R1mRw4x9HWhFc90SQDo351joVZYLy0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMW8pchUe1fWXPxK9hSdhyHJ0k/Z9XJWf7WDObMHNkQQ+cnmQ7
	4Ug6eSImmJsGN+0cyEweUQMvA+64wDNuHdrYhq/b2N8TJimc+j6fKZ3Vf7rTig==
X-Gm-Gg: ASbGncuaQvSxw8nXGZIQN9NECGwY/MLIkbEGU9lZY94xREqYynAgdgDKOn6Qv9Avn6a
	WlDm22IpsRA2zLsnhvkVl5/JH8I6h2biBG4Xen71yqkQXVuPByHlVbEmSExwf/fW6PLSmw2SHa3
	JAGJx1eN89F4eJXd+3AKiTsadN6cAF9PrRxFBv4tiDI6nCtyNZNxHh3+BtVOclPZzawegrE5EdO
	kEmsp3qghM39TZXU2elvoSb05lUnu4BO/6WpzV7OBnBIthNg7Hb/Q6jh4cBhiOdnNo9xh3594Zf
	1qK7M+kU6X+v3suxtpTqsSyr12lu7QfhNfX4HmEi1VMo5aaB5RgoYPv7aWdPf+tIeac=
X-Google-Smtp-Source: AGHT+IFNkpm7oHWOoQ09eBUsjMI/rG4FOnzXtR/BKkkzvjs1ACVlrxBF35cBtCNsTLJD3pbzQs790w==
X-Received: by 2002:a17:903:228a:b0:223:2361:e855 with SMTP id d9443c01a7336-22c3595bc8fmr6134445ad.39.1744777728088;
        Tue, 15 Apr 2025 21:28:48 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:26d4:1f69:95c5:8f04])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33e63062sm4267265ad.0.2025.04.15.21.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 21:28:47 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Shin Kawamura <kawasin@google.com>
Subject: [PATCH] Documentation: zram: update IDLE pages tracking documentation
Date: Wed, 16 Apr 2025 13:27:59 +0900
Message-ID: <20250416042833.3858827-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move IDLE pages tracking into a separate chapter because there
are multiple features that use (or depend on) it either in
built-in variant ("mark all") or in extended variant (ac-time
tracking).

In addition, recompression doesn't require memory tracking
to be enabled in order to be able to perform idle recompression.

Reported-by: Shin Kawamura <kawasin@google.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 Documentation/admin-guide/blockdev/zram.rst | 41 +++++++++++----------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/Documentation/admin-guide/blockdev/zram.rst b/Documentation/admin-guide/blockdev/zram.rst
index b8d36134a151..3e273c1bb749 100644
--- a/Documentation/admin-guide/blockdev/zram.rst
+++ b/Documentation/admin-guide/blockdev/zram.rst
@@ -317,6 +317,26 @@ a single line of text and contains the following stats separated by whitespace:
 Optional Feature
 ================
 
+IDLE pages tracking
+-------------------
+
+zram has built-in support for idle pages tracking (that is, allocated but
+not used pages). This feature is useful for e.g. zram writeback and
+recompression. In order to mark pages as idle, execute the following command::
+
+	echo all > /sys/block/zramX/idle
+
+This will mark all allocated zram pages as idle. The idle mark will be
+removed only when the page (block) is accessed (e.g. overwritten or freed).
+Additionally, when CONFIG_ZRAM_TRACK_ENTRY_ACTIME is enabled, pages can be
+marked as idle based on how many seconds have passed since the last access to
+a particular zram page::
+
+	echo 86400 > /sys/block/zramX/idle
+
+In this example, all pages which haven't been accessed in more than 86400
+seconds (one day) will be marked idle.
+
 writeback
 ---------
 
@@ -331,24 +351,7 @@ If admin wants to use incompressible page writeback, they could do it via::
 
 	echo huge > /sys/block/zramX/writeback
 
-To use idle page writeback, first, user need to declare zram pages
-as idle::
-
-	echo all > /sys/block/zramX/idle
-
-From now on, any pages on zram are idle pages. The idle mark
-will be removed until someone requests access of the block.
-IOW, unless there is access request, those pages are still idle pages.
-Additionally, when CONFIG_ZRAM_TRACK_ENTRY_ACTIME is enabled pages can be
-marked as idle based on how long (in seconds) it's been since they were
-last accessed::
-
-        echo 86400 > /sys/block/zramX/idle
-
-In this example all pages which haven't been accessed in more than 86400
-seconds (one day) will be marked idle.
-
-Admin can request writeback of those idle pages at right timing via::
+Admin can request writeback of idle pages at right timing via::
 
 	echo idle > /sys/block/zramX/writeback
 
@@ -499,8 +502,6 @@ attempt to recompress:::
 
 	echo "type=huge_idle max_pages=42" > /sys/block/zramX/recompress
 
-Recompression of idle pages requires memory tracking.
-
 During re-compression for every page, that matches re-compression criteria,
 ZRAM iterates the list of registered alternative compression algorithms in
 order of their priorities. ZRAM stops either when re-compression was
-- 
2.49.0.604.gff1f9ca942-goog

