Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F371A212D6D
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 12:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.105.120.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673869; cv=none; b=Fu8hzwCKO4P4i1AiDN8iW/m7UKnoy3PPyKqY0XziD+AkF3NgN/uDmsXiBmk6CwJEete1qN8umi51pm1FgckDXqGnP4CLEx/7qbapJEDJD/hitB07y+nPhJwwsLVxMvKXUKdh1dtc8rbow13DKITs2uNY8u1XMTgaMph01tm2SXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673869; c=relaxed/simple;
	bh=9rSE9/vcqxM91Q6q0/7W7xPtEKU1UCojx/RqqK+Jrn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LcUTz9ebNbJy3yg4g9jLXO1enoz4UM3Z0ah3FiRZKu15Z1h9vHzB64q/GM8hvaF1hW+1QNqgKbeTioy8dzaIumKuLQ/JgdOkiXkusNeVbo9tREj4rAuCStQZdyTfRG/0EqCI5Z5MUNrx5ffIONFKtsB4TLrXvUdtCPrRTXRqz2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lankhorst.se; spf=none smtp.mailfrom=mblankhorst.nl; arc=none smtp.client-ip=141.105.120.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lankhorst.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mblankhorst.nl
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <dev@lankhorst.se>,
	Ingo Molnar <mingo@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 0/8] drm/xe: Convert xe_force_wake calls to guard helpers.
Date: Tue,  4 Feb 2025 13:49:01 +0100
Message-ID: <20250204124909.158315-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
