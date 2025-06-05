Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204362C3242
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 09:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749117581; cv=none; b=NDL1kU9ULOocHb1SktVn2tVZ3UKKbTxQ8VYUXEyQ5ENj/0RxeDTJr8gHl0a4xJYdF/8v2rDxCCQu2PihzxRQVYt9mYBozXNVRVdAJy6BAdqfyyPWjs/KhSagzaFuRyvJnl0dgWU0TJUDKFjnKlmhMK+vjdML602qe1AVbia6WzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749117581; c=relaxed/simple;
	bh=h4Sr50U7Fa3ZLey5ejq5Mb9emBQg8zqtHTnk0v07q1E=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kiyzrx94+QB+SnZwRdX3DdkrS2/W+ILtQTvhr/WnoAhEVEbRCPk5lW4feO2p/fuI0vxZfUvfsBomm/z+AuoXHKx4WWbIVWZs0l/Js+stvwOv2HOhz6edfcusByu4aChnTmsrub42Wl4Zi3gfwKkHwj55o0QPciyN/4Ewxl9R97U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Mr8Adekt; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Mr8Adekt"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bCg0N535zz9t7b;
	Thu,  5 Jun 2025 11:59:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749117572; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hDdQmDYmHeeSabXLUlS6vBspu5rauZhRjYKirbrPyK4=;
	b=Mr8AdektLf7qqjY1OnEWTxUNVof3JPgBDO0ELrwMijU8jUi4j/Gyom0KQpTfaFjt5Rj6vk
	ZhDMMIvOWRCJMTnUAXIzoOm06Wbx31xhBEFCPKBdglCEs7T3dJBSFHXqy3EFyMR3Ojrj6q
	wJAlGNlsxv6v06iQcIBF9YQIwC22u4bYiKeqAVx4pqqU42h9bf6cD7C0XqxSQnThx7CKbx
	DiFAuAtIgY6XCX71ckpsQV1GZCVinpbMHZRnvwuXDAMLZlEsis+dl6tBbolUWzlfSwBLgA
	H2jvFWsfpfKcCQ25I88NhTveEEitXksmObebGqKKCxRszKcUjqdzyuBn7SGtjg==
Message-ID: <0e117b173891294369f158872fdec132fe6bcbc1.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Discourage usage of separate workqueues
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 05 Jun 2025 11:59:28 +0200
In-Reply-To: <aEBhIzccXBPyt_58@phenom.ffwll.local>
References: <20250604081657.124453-2-phasta@kernel.org>
	 <7a09c357-2d28-4dd6-b637-4387cc430938@amd.com>
	 <aEBhIzccXBPyt_58@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: e6943d585bc301b67a2
X-MBO-RS-META: axrmkt5ann4pfocdh4sm5k73k6khxa9u

On Wed, 2025-06-04 at 17:07 +0200, Simona Vetter wrote:
> On Wed, Jun 04, 2025 at 11:41:25AM +0200, Christian K=C3=B6nig wrote:
> > On 6/4/25 10:16, Philipp Stanner wrote:
> > > struct drm_sched_init_args provides the possibility of letting
> > > the
> > > scheduler use user-controlled workqueues, instead of the
> > > scheduler
> > > creating its own workqueues. It's currently not documented who
> > > would
> > > want to use that.
> > >=20
> > > Not sharing the submit_wq between driver and scheduler has the
> > > advantage
> > > of no negative intereference between them being able to occur
> > > (e.g.,
> > > MMU notifier callbacks waiting for fences to get signaled). A
> > > separate
> > > timeout_wq should rarely be necessary, since using the system_wq
> > > could,
> > > in the worst case, delay a timeout.
> > >=20
> > > Discourage the usage of own workqueues in the documentation.
> > >=20
> > > Suggested-by: Danilo Krummrich <dakr@kernel.org>
> > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > ---
> > > =C2=A0include/drm/gpu_scheduler.h | 7 +++++--
> > > =C2=A01 file changed, 5 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/include/drm/gpu_scheduler.h
> > > b/include/drm/gpu_scheduler.h
> > > index 81dcbfc8c223..11740d745223 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -590,14 +590,17 @@ struct drm_gpu_scheduler {
> > > =C2=A0 *
> > > =C2=A0 * @ops: backend operations provided by the driver
> > > =C2=A0 * @submit_wq: workqueue to use for submission. If NULL, an
> > > ordered wq is
> > > - * =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allocated and used.
> > > + * =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allocated and used. It is re=
commended to pass NULL
> > > unless there
> > > + * =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is a good reason not to.
> >=20
> > Yeah, that's probably a good idea. I'm not sure why xe and nouveau
> > actually wanted that.
>=20
> The idea of this trick is that you have a fw scheduler which only has
> one
> queue, and a bunch of other things in your driver that also need to
> be
> stuffed into this fw queue (or handled by talking with the fw through
> these ringbuffers).
>=20
> If you use one single-threaded wq for everything then you don't need
> additional locking anymore, and a lot of things become easier.
>=20
> We should definitely document this trick better though, I didn't find
> any
> place where that was documented.
>=20
> Maybe a new overview section about "how to concurrency with
> drm/sched"?
> That's also a good place to better highlight the existing
> documentation
> for the 2nd part here.


Let us first create consensus about when providing workqueues by the
driver makes sense. Correct wrong statements:

   1. Using a single threaded workqueue for timeout_wq is useful for
      guaranteeing that timeouts handlers are performed in the correct
      order. (Christian)
   2. Independently from the point above, using the very same single
      threaded wq for both timeout_wq and submit_wq allows for dropping
      locks from the driver's callbacks.
   3. Driver and scheduler sharing workqueues risks deadlocking, as
      described by Danilo.


I'm wondering about the following now:
   1. Why does the scheduler by default use the system_wq for timeouts?
      Could it make sense for us to always use a single threaded wq?
      After all, each scheduler only ever has 1 work item for timeouts
      in the air.
   2. Isn't point 2 from above purely a trick to avoid locking in the
      callbacks? If it is, I'm not convinced yet that we really want to
      actively recommend that. The callback implementations I've seen
      usually only need their fence context lock, and many drivers
      don't use their own workqueues to begin with.
      But I guess having a sentence somewhere teasering at the
      possibility wouldn't be hurtful.


My current feeling right now is that we should document why the
mechanism exists and discourage using it. It's optional, not really
necessary, risks deadlocking and making that more waterproof would
require more substantial work, like maybe lockdep assertions suggested
by Matthew.

I'm for the more leightweight way.


>=20
> > > =C2=A0 * @num_rqs: Number of run-queues. This may be at most
> > > DRM_SCHED_PRIORITY_COUNT,
> > > =C2=A0 * =C2=A0=C2=A0=C2=A0=C2=A0 as there's usually one run-queue pe=
r priority, but may
> > > be less.
> > > =C2=A0 * @credit_limit: the number of credits this scheduler can hold
> > > from all jobs
> > > =C2=A0 * @hang_limit: number of times to allow a job to hang before
> > > dropping it.
> > > =C2=A0 * This mechanism is DEPRECATED. Set it to 0.
> > > =C2=A0 * @timeout: timeout value in jiffies for submitted jobs.
> > > - * @timeout_wq: workqueue to use for timeout work. If NULL, the
> > > system_wq is used.
> > > + * @timeout_wq: workqueue to use for timeout work. If NULL, the
> > > system_wq is
> > > + * used. It is recommended to pass NULL unless there is a good
> > > + * reason not to.
> >=20
> > Well, that's a rather bad idea.
> >=20
> > Using a the same single threaded work queue for the timeout of
> > multiple
> > schedulers instances has the major advantage of being able to
> > handle
> > their occurrence sequentially.
> >=20
> > In other words multiple schedulers post their timeout work items on
> > the
> > same queue, the first one to run resets the specific HW block in
> > question and cancels all timeouts and work items from other
> > schedulers
> > which use the same HW block.
> >=20
> > It was Sima, I and a few other people who came up with this
> > approach
> > because both amdgpu and IIRC panthor implemented that in their own
> > specific way, and as usual got it wrong.
> >=20
> > If I'm not completely mistaken this approach is now used by amdgpu,
> > panthor, xe and imagination and has proven to be rather flexible
> > and
> > reliable. It just looks like we never documented that you should do
> > it
> > this way.
>=20
> It is documented, just not here. See the note in
> drm_sched_backend_ops.timedout_job at the very bottom.
>=20
> We should definitely have a lot more cross-links between the various
> pieces of this puzzle though, that's for sure :-)

Docu is in far better shape by now than it was last year, but there's
still much to do.

However, we probably also don't want to scather over too many places,
as it becomes harder to keep the docu consistent.


P.

>=20
> Cheers, Sima
>=20
> >=20
> > Regards,
> > Christian.
> >=20
> > > =C2=A0 * @score: score atomic shared with other schedulers. May be
> > > NULL.
> > > =C2=A0 * @name: name (typically the driver's name). Used for debuggin=
g
> > > =C2=A0 * @dev: associated device. Used for debugging
> >=20
>=20

