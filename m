Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2AD1C6FF9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615764; cv=none; b=YX23Rqj/pUZlRpp4j03tm875AaLMDaqE/IRuMQoZw6IqPuE8TNZAPkX563nIKh8g6/2b0UvC/0hLYpZszIVnwvkui80CcH1ZibkX4UKgrSf6w9+IGpmfigQbQgTCyqPBo/qpDsKE+RPyJ3GlVTA4cwLQW8hUnzd8bbnrYASjn8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615764; c=relaxed/simple;
	bh=8y5FRxD1+T+w6r55dWG7lx+dkgt3ZKNpLNKwX+6PAjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W2QpD7d8wkmdZBHBRevK5KQffFzShjTvQlxsqPf1241ogG8nGpRvPHzrngcqXTLcb4WWhuKh4Q8RnBRHcJQubbEE3eZivdMhic6QhWGt+2OkIL6Kn3NMwCej9GnSLF9spSm92sTBB5JvVya6XQXr7+NITsr8BjpaT9YdIY2CR8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VahWP4l7; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VahWP4l7"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3d5eb0ec2bdso423205ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615761; x=1744220561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ce6nXKcnJlQ1Sg4GeG36JJhoy7m7R7t/PayJp4ReXBg=;
        b=VahWP4l76iDfzVnP+oLxlHMgaPgCX1Rtjo6bxZs0+fMx9PkZqvJUAgsUKnq0iiFPyp
         1KHUGsBIsNX37xuUFb5OCwySYNTd5/h7Fl+LyPJfMwP9Ot/lrMCBkX7H9Fx/WAetuefa
         z5HijMJJIH6VW3Vc3n2jk1NzlU6TlIr/eMO5a5BSPWe7SibPzqY3E2nlHzB5wmHePWyy
         /NOC72UP3ZuPSPJkY98ZSF5rGpcgjWn7VpTb2LrGA0StmMjFReU7YiHSKRd0tOdBPBmu
         bCRurl7tvMzRakqWwQcJ7syBT9rIWspCKwOyJ6RlkacMf58GMT+9ustO0fJe0bF1MxQP
         2lxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615761; x=1744220561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ce6nXKcnJlQ1Sg4GeG36JJhoy7m7R7t/PayJp4ReXBg=;
        b=hLmwwbS8znQPUBYrzKI/ULfL51+75TW+FXbXuAa/e5rAIXUQQBAIOg9txRIxNWJ2Sc
         tHMHW0mVm4j7y+EbThJRkYEVOw6MQeaTOiJp8tKES4zGE614SqRGyr1vhX7YZEASzUO5
         xdFB0Ootl8UzHUj/IgsASyAU5xqz9pKojyfoyRSZ9MWdpgx6QqMNcSfnQXhkwuAU5ySW
         Taw2vOZavA9uqo2dy622J8Gnl2N2uKQeYTZAN8g2+CWQPAfwYbQ3tnKo4Ks2lAz/mThR
         ZVPnU4R9wt+DMs2D0550eLAQjMTfZj0mNNfSZ57XbcyRKuSbf5hFEM32yvNxTftT1HpI
         yz4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVksODs4hzd/CNO3PXPACvVlmvxhbGInkBiIW/fJRWfIqaA2LvbGg+FMidXRjH18QXjd3khRbMpb9Cdu6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3sUXUCdUu2AVK//46rwtyyXU/v+FCGmZYVPDc3dV2i2dcfH8V
	PsUU3xKLcswJWpJM68bTuEf3O69GNFBsa+B4tyLyqJk/gjrLDh8j
X-Gm-Gg: ASbGncsMfysh8krCwKZs6SJpwJQ5AWq/RiKi+RQNggbjbReOqd2w6N8JIqT0UqXu2Ve
	3qI8WG3BlMPyKaKlo8HbrPTDh1NKCq6XNbRx7/i0CB3xdDH8bHHuwwQTGNa0AGnovWjA/72cb55
	a2elabtjFQ/x00oPXgde7sn5p2NJwEbf7HdA9hTLO/0un0Peq9/kfqDkk6BmZlgqt2DYV/zZIxN
	3xnHRQ2K9kB6WrGHtn1E3dn1yJ0Ufxl/Od4FjQQMkB3rasI2Bjtm05KZip33tV8oe0URLYfe8j3
	wyV4SNhY8aZ5x/NOdlwh0Xhf7XigDaSmboejgp9kZTqHIYVHQmoHLzbAZ0cxuvLETLI3Q/PKuO/
	7fQ==
X-Google-Smtp-Source: AGHT+IEd82/KaIrP4v3l/hIUqHB1vbL8Yns4imdfxbgbfiFn8gRA4XnyUTSvoiXRh5lRVoS9fxcz6Q==
X-Received: by 2002:a05:6e02:1f0c:b0:3d3:f520:b7e0 with SMTP id e9e14a558f8ab-3d5e09094f8mr180509725ab.6.1743615761151;
        Wed, 02 Apr 2025 10:42:41 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:40 -0700 (PDT)
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
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 27/54] dyndbg: drop "protection" of class'd pr_debugs from legacy queries
Date: Wed,  2 Apr 2025 11:41:29 -0600
Message-ID: <20250402174156.1246171-28-jim.cromie@gmail.com>
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

Current classmap code protects class'd pr_debugs from unintended
changes by "legacy" unclassed queries:

  # this doesn't disable all of DRM_UT_* categories
  echo "-p" > /proc/dynamic_debug/control

  # name the class to change it - protective but tedious
  echo "class DRM_UT_CORE +p" > /proc/dynamic_debug/control

  # or do it the (old school) subsystem way
  echo 1 > /sys/module/drm/parameters/debug

This "name the class to change it" behavior gave a modicum of
protection to classmap users (ie DRM) so their debug settings aren't
trivially and unintentionally altered underneath them.

And by "symmetry", if they're not picked by "class FOO", then they're
excluded from adjustment.  This allowed all previously conceived
queries to work the way they always had; ie select the same set of
pr_debugs, despite the inclusion of whole new classes of pr_debugs.

That had 2 downsides:

1. "name the class to change it" means that every class must be
individually modified, quickly becoming long-winded and tedious to
adjust all the classes in a map via >control.

2. It made the class keyword special in some sense; the other keywords
skip only on explicit mismatch, otherwise the code falls thru to
adjust the pr-debug site.

So this patch reverts to the traditional view, it drops protection of
classes from default/legacy queries.

But it also refactors the skip/continue choice to allow the module
defining the classmap to protect its classes from unintended
alterations by legacy/class-less queries.

Next:

Author choice: use of DYNAMIC_DEBUG_CLASSMAP_PARAM() means they want
the drm.debug style control point.  We should presume they want it to
reflect whats set underneath, with only "class FOO" qualified queries
changing the callsites beneath.

CC: jbaron@akamai.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
--
v3- s/slctd_/selected_/
    pitch the PARAM control of protection.
---
 lib/dynamic_debug.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 7a60088a1b5c..54f462cf41b0 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -197,6 +197,17 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
 	return NULL;
 }
 
+/*
+ * classmaps-v1 protected classes from changes by legacy commands
+ * (those selecting _DPRINTK_CLASS_DFLT by omission), v2 undoes that
+ * special treatment.  State so explicitly.  Later we could give
+ * modules the choice to protect their classes or to keep v2 behavior.
+ */
+static inline bool ddebug_client_module_protects_classes(const struct ddebug_table *dt)
+{
+	return false;
+}
+
 /*
  * Search the tables for _ddebug's which match the given `query' and
  * apply the `flags' and `mask' to them.  Returns number of matching
@@ -211,7 +222,7 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 	unsigned int nfound = 0;
 	struct flagsbuf fbuf, nbuf;
 	struct _ddebug_class_map *map = NULL;
-	int valid_class;
+	int selected_class;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -224,21 +235,25 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 
 		if (query->class_string) {
 			map = ddebug_find_valid_class(&dt->info, query->class_string,
-						      &valid_class);
+						      &selected_class);
 			if (!map)
 				continue;
 		} else {
-			/* constrain query, do not touch class'd callsites */
-			valid_class = _DPRINTK_CLASS_DFLT;
+			selected_class = _DPRINTK_CLASS_DFLT;
 		}
 
 		for (i = 0; i < dt->info.descs.len; i++) {
 			struct _ddebug *dp = &dt->info.descs.start[i];
 
-			/* match site against query-class */
-			if (dp->class_id != valid_class)
-				continue;
-
+			if (dp->class_id != selected_class) {
+				if (query->class_string)
+					/* site.class != given class */
+					continue;
+				/* legacy query, class'd site */
+				else if (ddebug_client_module_protects_classes(dt))
+					continue;
+				/* allow change on class'd pr_debug */
+			}
 			/* match against the source filename */
 			if (query->filename &&
 			    !match_wildcard(query->filename, dp->filename) &&
-- 
2.49.0

