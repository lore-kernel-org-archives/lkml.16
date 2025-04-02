Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC9E1A5BBF;
	Wed,  2 Apr 2025 17:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615738; cv=none; b=E+JWIvCnqWPoaXW5UsbBbbE5NSbjfpZkJk7Tuky2Ojfkdri1rjCEfOd8Gp6XEoNg2XTfbaPAQaMshwcYUbbS4kiyxBBZxAIY9yq87f/arNWmOTBfp1lkriUDD04CKtkz4H9eS4ISSFtQwsOSOx5yWElX7bsjUrdtC3RCTruLNFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615738; c=relaxed/simple;
	bh=sk4ZuN0yqr+ELUK/hlV5OrzP5ge9kdc23DiSTcL49RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qkvQvUmQRx3LymwsVNPsa1NBC8mKUCiJIfD2sPz+6c2q14dnOh8qEo2hVxYz+wwlr8CKoxzhd70V8rRs9Lyga9/Bi1gbp2pGSnelq7zsF3wRlbcBuGAJzelvgP/+8UW2+YIKrgt/FZGwUxHvGC6j99zFp1ny4RMvDme/GdgTc/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLTm4Qce; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLTm4Qce"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d439dc0548so503175ab.3;
        Wed, 02 Apr 2025 10:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615736; x=1744220536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=td1hbocEroQ+eFWd3dryN89mziTxSjQWv4lhLkRyiDg=;
        b=JLTm4QceOpZt3uSkjSFNg9AKKm+cD7Yoranu+1QRWtmAgQyM3Xl/vRKsoeoEjmgmBI
         C3MUbtvOoThYKLl8YGX0cPV9lD/XfWT2+Xs6ngjiHvmIl/sNsaY1P8Mm3yBxTEetrrSt
         5010A0jwyskn+zOwuK6nGQGqSV0yAe993+K0DPaFz56wo05hjNEbvqWm2VTmCZE+JNiD
         sqpS/V+kZSmmtIu9y//j/DyFgyrDHD6tNFDS9VQ2Q/XGc+zGwomFWqvsNhb0C82yFtP5
         Bn8+uvsS1aImQA5i0vPP3UZQWY5nddYhTpRuWx2fjZCW+iyIzdk3jQBksRJLAyn6wF9c
         4V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615736; x=1744220536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=td1hbocEroQ+eFWd3dryN89mziTxSjQWv4lhLkRyiDg=;
        b=J5TZgkoz4TtyzUre+Bh/V/TzHgFzdh9On5TqBpNb5MBbWP+K+uonZJOKN/n0OQvCT1
         35qz3KgXorsopX28qfTaJl+6/Cgk+DkDlM48mQJFD1VAWG5HAcEcxX4SOegFZlbIL1Zo
         4Zkp9+w+meBFRRqVAYBBQ3h5cChNl/tb8i0NlgFmqLiKYRgOm/TEEaQTxgZld8nk4EZ5
         AB2JoITBOshzWxWOPcNReeV+8dJ/MWoWNniCcebal3Rjkphe7rMT8aPpd8s/6Uq7zY/l
         zZBhFEgZGByrFOqlTcBrd4GhHrbk6IKTqYntGvdzjs4vCBA+TYb+Jj/0eJC81fg4Kvif
         ObVw==
X-Forwarded-Encrypted: i=1; AJvYcCUM+vKfvaRTXcKNDLgCJvpls7Me2I82PCN2wqacRqG8XPyl6YZbSeYPJOe7+urvx72Q8jp1Loi64mt+iFBb@vger.kernel.org, AJvYcCW8VEt0evZ5ZQypLy9mKRPqi5xaP36NBQwkiCZaQXE6eizdL1RsN+QBt8ZU8k4KOdPH9rO4sEEzmwg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfLpMgOPJRsP8MrD4yL19hNKqFvC7OYddjxzi6aU/+7kU+xVqA
	Enmno2FkQBosZX3SqHjydT876Oz6SQjnnvexKMCSkLoB8hlxzJyD
X-Gm-Gg: ASbGnculxGZc5hp1FJtRVqWYWE6xkYlTd3P6kJfiZsHYKnKeCWDu06cOxPnBX/wzHeK
	HQ9ly+NklN3Z/483P9qRKWeLcjO6orUS+21qMDG9mjPs2Kwi847PbijCRrqBBeJYarVX1FSQ4pt
	1bV4MaJadG8BaVeM4mYvIOzQEnRQdqJQLkmB85WJkO4PpRbDdqRVY0tU/9locsrHNw62h2Xapks
	H8xDv+hTz8d8FnlGMe2qe6pzwzIEyc/NG9snqmGvDUKc1ul8QSGQ6/arSLRiLsYYyEIqPJS+/wl
	YOAZeFPAqjPQtooNj0xMva67xDCNXzch8+1nMmyfCAlyU17cixVcsFFd9sg/gSoxDx83XV74RmG
	Ualsugk7hMHJL
X-Google-Smtp-Source: AGHT+IFoghihjH4MYpOsA0qp+LY0KBRJDcJg5fZDrmZZoUA3dpTLzhFFCuTnSVLmEdCyPs5O9yahhg==
X-Received: by 2002:a05:6e02:378c:b0:3d4:276:9a1b with SMTP id e9e14a558f8ab-3d5e09cda1bmr184969825ab.16.1743615735764;
        Wed, 02 Apr 2025 10:42:15 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:15 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com,
	linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 03/54] docs/dyndbg: explain flags parse 1st
Date: Wed,  2 Apr 2025 11:41:05 -0600
Message-ID: <20250402174156.1246171-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4ac18c0a1d95..63a511f2337b 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,9 +109,18 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
+Note: because the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword values.  Flag errs will hide keyword errs:
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
+So a match-spec is a keyword, which selects the attribute of the
+callsite to be compared, and a value to compare against.  Possible
 keywords are:::
 
   match-spec ::= 'func' string |
-- 
2.49.0

