Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F8B748F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540908; cv=none; b=cAH2ZHvsWd8Lr28DoEEMP/95ZnlTqI/uNeV2ty8mWyxvQt0krUs1yUVVuYycNyZEUm+NduwZxC5SjnYM1Ue4khH+EcJg8tDSRQeP+rzxHDw+dCTopjxBL6SI+sbKHJr/ikoFe36HCNDYXcY5xBGAhtoBfb4Wn3x7oBivQpA9pF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540908; c=relaxed/simple;
	bh=A6du4VoIApzpLPXhp1iUZPIafFQ8enDvkgNuwCFgU0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oLQwOibCd33ygM3xU5z7nnMYVgnqhEU1mvxBbo2Vk7suq6IlWEWtD0hCDp/n4g8vSaZaBWS2AQsGrg7O6meg+1IU+IkzxWK4PW8yVr0gA6o29QNtBReU1/XhMqg7sBA3X8U6l4L5cwJgLetw837kbh15mBlYuADuYqr75Bp6QpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N4jjWGIa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N4jjWGIa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C2AC4CEEC;
	Fri, 25 Apr 2025 00:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540907;
	bh=A6du4VoIApzpLPXhp1iUZPIafFQ8enDvkgNuwCFgU0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N4jjWGIa3G9Mx0DMKEwurok2Bt6hl94sEpKPgddAo+Et8KNvG+L1THBwhQW91srLE
	 O3tIgpiNCsxQfv8dnWTkY2W+gEX3yxtISQ7EZRTGKQdTnr1ieQ+odcODejr3ttWADE
	 h3Tf5Cd14rmId1JzMIH6ih7g8QEi3XdHXE/RKoe1f/jsc7NbJFozJFq20epbWtARSZ
	 AIx5MkVyfpwpTmWt7PH2XcTLjSxPsJVu7q+3V7FEdSpFm+h6RYGkWCKngBiYYC+J1y
	 pZh1J62tWj7cC8GK4+lmvc0hX72shcNi5MOjl8h/du/FwHD5SJKJooz5tPT2j8Ivwn
	 3t++cL2o60SwA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 2C3DBCE19C3; Thu, 24 Apr 2025 17:28:27 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 04/20] drm/i915: Avoid open-coded use of ratelimit_state structure's ->missed field
Date: Thu, 24 Apr 2025 17:28:10 -0700
Message-Id: <20250425002826.3431914-4-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
References: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i915_oa_stream_destroy() function directly accesses the
ratelimit_state structure's ->missed field, which work, but which also
makes it more difficult to change this field.  Therefore, make use of
the ratelimit_state_get_miss() function instead of directly accessing
the ->missed field.

Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: <intel-gfx@lists.freedesktop.org>
Cc: <dri-devel@lists.freedesktop.org>
---
 drivers/gpu/drm/i915/i915_perf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index de0b413600a15..1658f1246c6fa 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -1666,6 +1666,7 @@ static void i915_oa_stream_destroy(struct i915_perf_stream *stream)
 	struct i915_perf *perf = stream->perf;
 	struct intel_gt *gt = stream->engine->gt;
 	struct i915_perf_group *g = stream->engine->oa_group;
+	int m;
 
 	if (WARN_ON(stream != g->exclusive_stream))
 		return;
@@ -1690,10 +1691,9 @@ static void i915_oa_stream_destroy(struct i915_perf_stream *stream)
 	free_oa_configs(stream);
 	free_noa_wait(stream);
 
-	if (perf->spurious_report_rs.missed) {
-		gt_notice(gt, "%d spurious OA report notices suppressed due to ratelimiting\n",
-			  perf->spurious_report_rs.missed);
-	}
+	m = ratelimit_state_get_miss(&perf->spurious_report_rs);
+	if (m)
+		gt_notice(gt, "%d spurious OA report notices suppressed due to ratelimiting\n", m);
 }
 
 static void gen7_init_oa_buffer(struct i915_perf_stream *stream)
-- 
2.40.1

