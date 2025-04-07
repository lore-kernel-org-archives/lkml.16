Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDD31FA851
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039371; cv=none; b=eJjonoBAVjIA1/zwn0k8oEjNQMyr5DWCRt/eC7Dk/ykerRuiJJUA/eUrGbSzHiTHOv89gRaHNMpakz1GCySm86rtGgSKn20oTcET/3468Lar/j7G0EKXHdotzuqshvsU/HuROc199Bf765la1Dg7sxPGMbYfCW8z9wciWPIGDkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039371; c=relaxed/simple;
	bh=0iTUGwfBCB19jv9H4P+0OSkSNi+DOqnUVr6FKoz2PgM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cw3yCML/qmsyTGEjOKrjOwGrS8FMWLmjHuxc5suEYDd3Aixbp0QZc7Wq0dnwff6XvoLInH33vt29EVM+JUxzGOTWNEUTEcb67/3S7YevfdEKnHxdiKp6LmCbqoEmSqstYYR2xSSZikUhzrZTCV2XObPqal3oA3jf6cB13//LeGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6FO9cfy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6FO9cfy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36FAC4CEDD;
	Mon,  7 Apr 2025 15:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744039370;
	bh=0iTUGwfBCB19jv9H4P+0OSkSNi+DOqnUVr6FKoz2PgM=;
	h=From:To:Cc:Subject:Date:From;
	b=e6FO9cfyKRjC7XXRuld6CHIRvj0S9BPpVRq1Qd4YYZ9sShN/obWkMgPF1fH4BHyUP
	 MpuhXsbV54OzhtzdYJgoxOXSsamu+ZuA4Pay8jG+AnyWy715sRZ85FrdQ52msvqLUs
	 ZHR6m0LTloHlgYFoyv9fEdEg6j9JAtxSERpq58mAVooYJefVqpSa4Q7ZJ2hyCT72Od
	 bbhdeSpDwIGzVgE7ECOxtAIuA0P2xVtw5Aj8QiRYP1+ui/VHX4TEDieKRCcDlPxLq2
	 AyJV0h0RLIXNSaIo4AQgNU0cKLb2kBwd6E6UsS9PlXtnFQsUelLGuKaTln3sGN9f9o
	 f1p99Ni3emKHA==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] drm/sched: Fix memory leaks in drm_sched_fini()
Date: Mon,  7 Apr 2025 17:22:35 +0200
Message-ID: <20250407152239.34429-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since the RFC:
  - (None)

Howdy,

as many of you know, we have potential memory leaks in drm_sched_fini()
which have been tried to be solved by various parties with various
methods in the past.

In our past discussions, we came to the conclusion, that the simplest
solution, blocking in drm_sched_fini(), is not possible because it could
cause processes ignoring SIGKILL and blocking for too long (which could
turn out to be an effective way to generate a funny email from Linus,
though :) )

Another idea was to have submitted jobs refcount the scheduler. I
investigated this and we found that this then *additionally* would
require us to have *the scheduler* refcount everything *in the driver*
that is accessed through the still running callbacks; since the driver
would want to unload possibly after a non-blocking drm_sched_fini()
call. So that's also no solution.

This RFC here is a new approach, somewhat based on the original
waitque-idea. It looks as follows:

1. Have drm_sched_fini() block until the pending_list becomes empty with
   a waitque, as a first step.
2. Provide the scheduler with a callback with which it can instruct the
   driver to kill the associated fence context. This will cause all
   pending hardware fences to get signalled. (Credit to Danilo, whose
   idea this was)
3. In drm_sched_fini(), first switch off submission of new jobs and
   timeouts (the latter might not be strictly necessary, but is probably
   cleaner).
4. Then, call the aformentioned callback, ensuring that free_job() will
   be called for all remaining jobs relatively quickly. This has the
   great advantage that the jobs get cleaned up through the standard
   mechanism.
5. Once all jobs are gone, also switch off the free_job() work item and
   then proceed as usual.

Furthermore, since there is now such a callback, we can provide an
if-branch checking for its existence. If the driver doesn't provide it,
drm_sched_fini() operates in "legacy mode". So none of the existing
drivers should notice a difference and we remain fully backwards
compatible.

Our glorious beta-tester is Nouveau, which so far had its own waitque
solution, which is now obsolete. The last two patches port Nouveau and
remove that waitque.

I've tested this on a desktop environment with Nouveau. Works fine and
solves the problem (though we did discover an unrelated problem inside
Nouveau in the process).

Tvrtko's unit tests also run as expected (except for the new warning
print in patch 3), which is not surprising since they don't provide the
callback.

I'm looking forward to your input and feedback. I really hope we can
work this RFC into something that can provide users with a more
reliable, clean scheduler API.

Philipp

Philipp Stanner (5):
  drm/sched: Fix teardown leaks with waitqueue
  drm/sched: Prevent teardown waitque from blocking too long
  drm/sched: Warn if pending list is not empty
  drm/nouveau: Add new callback for scheduler teardown
  drm/nouveau: Remove waitque for sched teardown

 drivers/gpu/drm/nouveau/nouveau_abi16.c |   4 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c   |   2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c |  39 +++++----
 drivers/gpu/drm/nouveau/nouveau_sched.h |  12 +--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  |   8 +-
 drivers/gpu/drm/scheduler/sched_main.c  | 111 +++++++++++++++++++-----
 include/drm/gpu_scheduler.h             |  19 ++++
 7 files changed, 146 insertions(+), 49 deletions(-)

-- 
2.48.1

