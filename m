Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508592E62CE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743714917; cv=none; b=UIohDX0FScB9pAFCIp7wo6tXUddK4PBY2ZRHxkKe/p/m5m6eI5DX9DwsHc5mcLjva9ohMx6AgGqe8B5gxMMF9h+4I+HggPKhuNqdrrtjkdcL2GH3kYtc0pzvFhaVaItw/cOcfI5oqjGU6bF9DJksE7LyyK3gVL9CldrL/vnEFn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743714917; c=relaxed/simple;
	bh=+hz6Lt9eK0VnWHjtOAHlfl2JmWIwpKU2QhAqSPr3DC4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QmQ1aLXBlocqlqOqNQh84awIrKYV8ybw7Jebhz2u9uoxT4FuMLNSR8Vjf8eL6vpTh8BfuBCYIqkZUyVjD119EBjUUo04bjHPS3gSdS6YjoQ+2XJJ+MZag3KWW/e4OA6qXwdMEa4rl9YaqrAlBvdV5pbqiK1YsQ1LdESjC+XjTDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBdw/Vtt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBdw/Vtt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2AEC4CEEA;
	Thu,  3 Apr 2025 21:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743714916;
	bh=+hz6Lt9eK0VnWHjtOAHlfl2JmWIwpKU2QhAqSPr3DC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IBdw/Vtt+K1fYwvlxBgSjY1CTLOhlYQaZCQQuN/WStvXTF//EqpSSL7VFNwGBmTR7
	 K8WB75u52q7sWFH3fQkfL3Xa7IMz2XIKzcx9pL24eGI1d+vMZksCKImV83t+hOb3VA
	 J9zK1ZN+xqd2pqKQ4DBCqk0rpmK2OZDkvczIKuRigj52xoPr93/3iywSEjregKj1EP
	 wDrHEHi0hszH6UV+FKVnPq5/5vDL7/5MdbKErSYsnqPWf3pBgpM0l67bGlydo1/TKU
	 0zHIOUNoH/6jn0RacPN1NWJsGWWdyci4ZCdw2HW1iujkrC2OSk2N1ZVGfLCGil8wF6
	 sstOpbxuNVI2w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9B5C8CE09EE; Thu,  3 Apr 2025 14:15:15 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH RFC 3/9] drm/i915: Avoid open-coded use of ratelimit_state structure's ->missed field
Date: Thu,  3 Apr 2025 14:15:08 -0700
Message-Id: <20250403211514.985900-3-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
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
index 5384d1bb49233..a1ffb45a413b0 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -1663,6 +1663,7 @@ static void i915_oa_stream_destroy(struct i915_perf_stream *stream)
 	struct i915_perf *perf = stream->perf;
 	struct intel_gt *gt = stream->engine->gt;
 	struct i915_perf_group *g = stream->engine->oa_group;
+	int m;
 
 	if (WARN_ON(stream != g->exclusive_stream))
 		return;
@@ -1687,10 +1688,9 @@ static void i915_oa_stream_destroy(struct i915_perf_stream *stream)
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

