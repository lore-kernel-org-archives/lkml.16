Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08401EFFB2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743509448; cv=none; b=nvQFCjS/Pe9Hwaw0qPd1V6e3lplb5SIrRoYna5TfVTL5aWzGhFRJCLhRd6O4yf6mKasuUvacTEusaDv+6jnRt1TnDnWt0onFfQOhQl5Ti9Czdlfkj5nrgapuBz+oDk6sEmBmi10GTNk8FFFAkCn9U0H1MvnVBYjerpjysuIhcH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743509448; c=relaxed/simple;
	bh=YQ8tu7x+Ukps5x3s4anWDD7Vj6bx89t2M5F/63Ywx3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gy7LzprviUWcmHsbq+oLz8shygxMAUORehgnJNxE4ZTN1gSGXEq1w29wJIXaqm3LW9+uzwexDX74WX7lpssnLrboyfbXYOUqI+ob6JVh1FMv0LHiQDCsM7AhARriPzGofZEPMnriDYW4QS2s8yErnLNjy+MQ4MzKj9xhR2c9boc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NkheP0nk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NkheP0nk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743509444;
	bh=YQ8tu7x+Ukps5x3s4anWDD7Vj6bx89t2M5F/63Ywx3Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NkheP0nk/x6W5AyxAZCzKQJSTd51b47L9ARfS1xcqAWPsb9EQzOuHewB410L4jRwr
	 4O0Yrvlj/OoI4JO4JmM8Em1CPACIMKF8jZYlN0Kjt3n/3oivzdQHwlD9cMi2zXs01F
	 6nkeH9OTM0X7Ublj6cuI5a2gOzh7wo/KpbM/2PfCQmAGgBTp8fZGmthnO4JcRNqdJZ
	 Sz6uwwMh+RAnRxAMMmoAsMQHK+bojroLZhGpQvyyMH9dlUKeGz5iTKWdY7n45Tn+5S
	 U7p5vOeA0HqqbG1OyB6xqwG5T25EKI7J5Kxd6yB4RVpWX2QibzLVmfNgOauiMQ3axT
	 MXBKD7DdgfOpg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 512D617E0657;
	Tue,  1 Apr 2025 14:10:44 +0200 (CEST)
Date: Tue, 1 Apr 2025 14:10:41 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ashley Smith <ashley.smith@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Heiko Stuebner
 <heiko@sntech.de>, kernel@collabora.com, Daniel Stone
 <daniels@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Make the timeout per-queue instead of
 per-job
Message-ID: <20250401141041.535df992@collabora.com>
In-Reply-To: <20250307155556.173494-1-ashley.smith@collabora.com>
References: <20250307155556.173494-1-ashley.smith@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  7 Mar 2025 15:55:52 +0000
Ashley Smith <ashley.smith@collabora.com> wrote:

> +static void
> +queue_suspend_timeout(struct panthor_queue *queue)
> +{
> +	unsigned long qtimeout, now;
> +	struct panthor_group *group;
> +	struct panthor_job *job;
> +	bool timer_was_active;
> +
> +	spin_lock(&queue->fence_ctx.lock);
> +
> +	/* Already suspended, nothing to do. */
> +	if (queue->timeout.remaining != MAX_SCHEDULE_TIMEOUT)
> +		goto out_unlock;
> +
> +	job = list_first_entry_or_null(&queue->fence_ctx.in_flight_jobs,
> +				       struct panthor_job, node);
> +	group = job ? job->group : NULL;
> +
> +	/* If the queue is blocked and the group is idle, we want the timer to
> +	 * keep running because the group can't be unblocked by other queues,
> +	 * so it has to come from an external source, and we want to timebox
> +	 * this external signalling.
> +	 */
> +	if (group && (group->blocked_queues & BIT(job->queue_idx)) &&
> +	    group_is_idle(group))
> +		goto out_unlock;
> +
> +	now = jiffies;
> +	qtimeout = queue->timeout.work.timer.expires;
> +
> +	/* Cancel the timer. */
> +	timer_was_active = cancel_delayed_work(&queue->timeout.work);

Looks like queue_suspend_timeout() is only called on a state update,
and this won't happen if the group suspension/termination fails (FW
hang), which will leave this delayed work behind, possibly leading
to a UAF or a spurious queue_timeout_work() call when we don't expect
one.

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index e96179ed74e6..1106967af0ac 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2784,8 +2784,18 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
                         * automatically terminate all active groups, so let's
                         * force the state to halted here.
                         */
-                       if (csg_slot->group->state != PANTHOR_CS_GROUP_TERMINATED)
+                       if (csg_slot->group->state != PANTHOR_CS_GROUP_TERMINATED) {
                                csg_slot->group->state = PANTHOR_CS_GROUP_TERMINATED;
+
+                               /* Reset the queue slots manually if the termination
+                                * request failed.
+                                */
+                               for (i = 0; i < group->queue_count; i++) {
+                                       if (group->queues[i])
+                                               cs_slot_reset_locked(ptdev, csg_id, i);
+                               }
+                       }
+
                        slot_mask &= ~BIT(csg_id);
                }
        }
