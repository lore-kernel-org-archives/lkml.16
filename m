Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3CA1172A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744875946; cv=none; b=LYA9NLZXIMEQuKdn9P8rDmfUCph/kcBD30/tr93uRggW+V/Zp7YfD6mNoekWof0IlhT3Bp0BTrzlXpUt90ukYhrqjzL2Wu5vCWk2ezmnQss+Q0M4skqUG7RG8OSBEJuzuXydmswja/LeW8GVfqskGFjZSNsj81jRjnX3a1bwnMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744875946; c=relaxed/simple;
	bh=NWuj/z3Lu9fKv1xasdH3+8IObzXT3UiA5n97fEPAIG4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=duZ/oRAh2bim0YTWudUnbZ215iiN6m0nxSxV4r46SggcAQlgcub6DAw+omEFFKuRfSHXl7DMQ0eXoQbDbLCDu0PzXPdLxoykyBkwliqkZyWJIaMFO4gMlC5ywiJRQdUOkIeaDrDyUZ7vIk5t2Oqd56lqkRL+YSj9hjbLQ8KZwXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=g0892s9B; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="g0892s9B"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZdVLY0tS3z9snh;
	Thu, 17 Apr 2025 09:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1744875941; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o01QhRRBt9kbGlZJekh53pp9WB+AZ1VXMfcDIjz0TJ4=;
	b=g0892s9BhUhMNN64iMQ6epD56Kl8AfSwwketorczIHbAL2mlAxPhjNk9ToLepZYUOpKzh4
	DSlDKbgZJjvtp3kzU9wBKftCRNySChuK8SbG6m34MI7DACrM2rxf5RDwkhjoh4zDex07+D
	HpFJQjBURim06m+Fq5OA7SNRQMRvyOAAOusKV5q24Br2cqywBbWNnxKIQ93gSLYAAR23dJ
	hvaioSVBjtF0AJdkMOtrsfgpKag7DATK59lSf/JYWm5ZwK4myuoqa9brQT9QgUc86TPN64
	9s2eavL7DOVxBwGHD+2XSiF/kE/rOBBPmK4glF8bDrT5CAMBN7CKBeW6ze/Uvg==
Message-ID: <9607e5a54b8c5041dc7fc134425cc36c0c70b5f3.camel@mailbox.org>
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko
 Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 17 Apr 2025 09:45:35 +0200
In-Reply-To: <20250407152239.34429-5-phasta@kernel.org>
References: <20250407152239.34429-2-phasta@kernel.org>
	 <20250407152239.34429-5-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: ht1k5cx6yf918cstjfpo94f1fsqmah66
X-MBO-RS-ID: 72d8f281a13a97fa464

On Mon, 2025-04-07 at 17:22 +0200, Philipp Stanner wrote:
> drm_sched_fini() can leak jobs under certain circumstances.
>=20
> Warn if that happens.
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 4 ++++

I hear a lot of amazed silence for this series ^_^

If there's no major pushback, my intention is to pull this in once the
blocking Nouveau-bug has been fixed (by pulling my patch).


In the mean time, let me review my own stuff:

> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 6b72278c4b72..ae3152beca14 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1465,6 +1465,10 @@ void drm_sched_fini(struct drm_gpu_scheduler
> *sched)
> =C2=A0	sched->ready =3D false;
> =C2=A0	kfree(sched->sched_rq);
> =C2=A0	sched->sched_rq =3D NULL;
> +
> +	if (!list_empty(&sched->pending_list))
> +		dev_err(sched->dev, "%s: Tearing down scheduler
> while jobs are pending!\n",
> +			__func__);

The "%s" here will be removed since dev_err() alreday prints the
function name.

I find this dev_err() print more useful than the stack a WARN_ON prints
(telling you about invalid_asm_exec_op or stuff like that).

Plus, I guess the places where drivers call drm_sched_fini() are very
well defined and known, so a callstack wouldn't really be useful in the
first place.


P.

> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_fini);
> =C2=A0

