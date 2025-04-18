Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCB1219311
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996442; cv=none; b=J0+nSD1IGAyeIqXpXyQtlNy0XFxVFPIcwrG28B1zThH0QUHmkDShzSOlUQyIEFHALyJP9Ovc40nhe8PCxT+Hz8oFBo2OXZIlMSQAGgeZuX2qER6MhnybDfXtZPzokJG2iYFaguXRZ1rmuvsaICmuf+IFDOJShegmm37N42rrvJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996442; c=relaxed/simple;
	bh=By9Z3/GOKSo9jX2bX288pITAL8QKbK/wJaL2Y5toa+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aCNkuPlEV9txVoJqDAsQ47O3/WA4fYdAgNBmBg6QvSokwS/qC798dSxfY0TyT7mYBRmI9K8jMVc65z9hY8G/f6WfXgsy9KqwfW8h2ImIBoN2xO56HaM2YFYNHmkve46tb3FkOHLSdk1X5pizWUdupur4a5K5CK4q3VGdcPpkL4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3mhSmBh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3mhSmBh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A84C4CEEE;
	Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744996442;
	bh=By9Z3/GOKSo9jX2bX288pITAL8QKbK/wJaL2Y5toa+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o3mhSmBhtFASWfZ2KgiYlj9LA0feGsF/AkkLLSTsVzOjwzhRui6ckoIjUD0clMiXV
	 fVcpDewtRdZ2lQFbgsE5oAR1OjzVmZlAFoj2c1i8KWqlNlIzfcKumjn1KNwnNTowBV
	 Mq8LrA+ihQjZuvb9Caac8zjHo/CEev2NA9mmovs/RUMVqb4XPwApFXqofzpVcmaYdC
	 gw5a571GjZkGK8y3YELHQSSQsa6wDJvz1svYHuIV7o8sStTmIVhTqxqf52kc0ve+MA
	 LM8/8lJEHe68SlMLEUBw5i6+ag3mnDP02Q93nP1fj1EhJWA0WuZtK1Bi/15McraAHq
	 oDPIZqZRwM6LQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id DF494CE0F4D; Fri, 18 Apr 2025 10:14:01 -0700 (PDT)
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
Subject: [PATCH v2 ratelimit 04/14] drm/i915: Avoid open-coded use of ratelimit_state structure's ->missed field
Date: Fri, 18 Apr 2025 10:13:49 -0700
Message-Id: <20250418171359.1187719-4-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
References: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
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

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
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

