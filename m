Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E886C2116FD
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.105.120.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738675311; cv=none; b=PGLOlX/33svzFW0dWucLugMu6bNC3sZj5rwl/TLvgX0ahxtWjjNxC5rxYZK2rteLQl5IpLhZ0c65GrVp+Dg5LAQREHHbnv71qjMmo9Y0CsVwMi01BMRvSJNBa3fVBUNxXDnEJUu9wosu9LKhgfMfSqtULKKwePrW9BSpO4ixGL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738675311; c=relaxed/simple;
	bh=OGL5Pl5O2Qewji1ZgFysi5+ZTrlwu+X/F65eQj20hsE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PM19lChRXcEbbHEUB7oAeo/TMP2FNYmc4DO2IG7TIgeAZMDFliFs22lTwABjmEMigscc69EgTH3lT440b0sF00Zxmp1avv2d6H1tFenafQoZt3Rsvi+RnvAhavdGxqpQYOi/tZacUGnprv25K/SAjGCVk5PYid2y/Syv7Mb6k+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lankhorst.se; spf=none smtp.mailfrom=mblankhorst.nl; arc=none smtp.client-ip=141.105.120.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lankhorst.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mblankhorst.nl
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <dev@lankhorst.se>,
	Ingo Molnar <mingo@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH-resent-to-correct-ml 0/8] drm/xe: Convert xe_force_wake calls to guard helpers.
Date: Tue,  4 Feb 2025 14:22:29 +0100
Message-ID: <20250204132238.162608-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ignore my previous series please, it should have been sent to intel-xe, was sent to intel-gfx.

Instead of all this repetition of

{
	unsigned fw_ref;

	fw_ref = xe_force_wake_get(fw, domain);
	if (!xe_force_wake_ref_has_domain(..))
		return -ETIMEDOUT;

	...

out:
	xe_force_wake_put(fw_ref);
	return ret;
}

I thought I would look at how to replace it with the guard helpers.
It is easy, but it required some minor fixes to make DEFINE_LOCK_GUARD_1
work with extra init arguments.

So I changed the function signature slightly to make the first optional argument
a struct member (current behavior), and any additional argument goes to the init
call.

This replaces the previous code with
{
	scoped_cond_guard(xe_force_wake_get, return -ETIMEDOUT, fw, domain) {
		....

		return ret;
	}
}

I' ve thought also of playing with this:
{
	CLASS(xe_force_wake_get, fw_ref)(fw, domain);
	if (!fw_ref.lock))
		return -ETIMEDOUT;

	...
	return ret;
}

I'm just fearing that the scoped_cond_guard makes it imposssible to get this
wrong, while in the second example it's not clear that it can fail, and that
you have to check.

Let me know what you think!
Feedback welcome for the header change as well, should probably go into the locking tree..

Cc: Ingo Molnar <mingo@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>

Maarten Lankhorst (8):
  header/cleanup.h: Add _init_args to DEFINE_LOCK_GUARD_1(_COND)
  drm/xe/gt: Unify xe_hw_fence_irq_finish() calls.
  drm/xe: Add scoped guards for xe_force_wake
  drm/xe: Add xe_force_wake_get_all
  drm/xe/coredump: Use guard helpers for xe_force_wake.
  drm/xe/gsc: Use guard helper for xe_gsc_print_info.
  drm/xe/vram: Use xe_force_wake guard helper
  drm/xe/gt: Convert to xe_force_wake guard helpers

 drivers/gpu/drm/xe/xe_devcoredump.c |  36 ++---
 drivers/gpu/drm/xe/xe_force_wake.c  | 161 ++++++++++++++----
 drivers/gpu/drm/xe/xe_force_wake.h  |  17 ++
 drivers/gpu/drm/xe/xe_gsc.c         |  22 +--
 drivers/gpu/drm/xe/xe_gt.c          | 243 ++++++++++------------------
 drivers/gpu/drm/xe/xe_vram.c        |  45 +++---
 include/linux/cleanup.h             |  30 ++--
 7 files changed, 293 insertions(+), 261 deletions(-)

-- 
2.47.1

