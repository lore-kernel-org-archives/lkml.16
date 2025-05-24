Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3CA28EB
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 15:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748099031; cv=none; b=KKkZiexeCwaEGUaNQYGNbWBlvIthvlBaRAYR6MQpcS7Ef5nTrU+GZIFg/gboNeT4n/AKv+yzfqg4wCMGUsc4rDmGcaiyevcFZzBlBVxUjcC8TXrh/Mmt+53uCWJ+bmSVO0pZSOW0jUSAURF0yDDjTHMi9a2+KlUGP2MEzoLSOiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748099031; c=relaxed/simple;
	bh=UVaw9tMZxV6aSXUUSxDjO6KMVYd3BavKv34NhO8h31E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pl5wrvneLsAMxK+GCYXpuX0/z57v7+SvcJCrjHNgReNnKXtbA/CkTircUd4uUNPAyYHuuEuAES033OITz2RWw9/ZVFNRbZIHIOwWf9vLgHWhUshgP6I1uVqdFVPpO9r5hbJyf0YP85hY8oWbcwPYyFWsstg0/IvV2SJiULInbCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=j4PHeoMW; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="j4PHeoMW"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476ac73c76fso10237011cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 08:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1748099028; x=1748703828; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UVaw9tMZxV6aSXUUSxDjO6KMVYd3BavKv34NhO8h31E=;
        b=j4PHeoMWRMwwSzfuJ5gHS5u7m6fZmtCFuDidh+aJ/JVDEdARHRbhLQVDWE7stc7jef
         rGd5iP3YuMDCLdIrXMnhb+g48c30TFPkSfiPt8v/bbTpjd+8+uLYhss3nSgiSxPNpJfy
         vKE2gw+/scsfTjY7RewpGt/PqDwjzV+8vCA9OWutvyfsct0YA69Vs7q3HtOKtyFERjdL
         NlICUjqD8lumyXaURJosYQJ7b0e0/gA9aI0Qr/Aj0n/L2/K9KYOgdtZ6WlzFqRMQObcA
         TyhMop7JDjzr3Ogf4ZKmZkoCs0DJQpHbhuyHnlaiXgEs/RiNzQ6On1bTPx3TkDXSrc4v
         F++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748099028; x=1748703828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UVaw9tMZxV6aSXUUSxDjO6KMVYd3BavKv34NhO8h31E=;
        b=P1rYamu0CIzen6mSn5dfw0+E268wP9YnIIGDxHZdLeMu9njEgFBBOs0bxjCnmLZF3k
         m9PBNsSgdrABDSYPbhy0CGM2mkYU45qzvk/W5FkO40kFh3o9cDSGLWdPMPtx/aKY+s5I
         WiAt9zOY8mGjcbcxv2w7hJEnDTi4bBG9fUUAEp2PaY8oQlkSy4NSy/CJ2ZzfguOidlgf
         Njfn1wxuEiS+qmt7nvXOWu//AyjhyYizoO/2QxHTauRo7bh6HcvQsubM3v/pCZ3eOYkj
         q4ei85kq7QATrVpeyVePE+37qNfBZ/0TfSR7fvpqWClMG5t3e8IbeMaz2e50NmUZfoR0
         XG8g==
X-Forwarded-Encrypted: i=1; AJvYcCVcj8OigMV/8jpfrPDZ/VgOqfw8X4LdY8XoDQSSY5J1RoC60+1tOrHRqYc46pISv/ZXSzZP5/rM4tBAn30=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0c65Z79Qj5Efhwc+Ri0jngsRTTrhg5K7dfsXCXJidcIAzHRra
	uZ9g69o5N+IlRHlEzuOZN2HBtQEbqIPZdXgMU8n4F56ziJLhb/vuOTgk1ceODrgZ2GKpVHYINwH
	wL+4aHZ7Ir/Xo+Hz8qEk3scrTp65SSBso15nDcwNy/A==
X-Gm-Gg: ASbGnctfdTy9fcCh9VPkuG7kw+DS4XH0RWxDaJuhO7rOeATvyj9lQ1Qmyfz9SHM0NNS
	Xeqka8vmgKCCcg3vYenmixYqXra7IG2j+qy/0fhKv1ApZ2LqU31r00hHhZSWGj57QounbCfCkj5
	v1l0unpcjxuKoRwUPSI275rOh2sjB/4dQ=
X-Google-Smtp-Source: AGHT+IF3JrFc7SwJPPR/ex0cRrWFS44gKdyVerJqRqEogYjxU96eHZMhASxXrUy2AHUF4yrt3iR1aBtSTppfCawdUuQ=
X-Received: by 2002:ac8:5c8d:0:b0:476:a03b:96ec with SMTP id
 d75a77b69052e-49f4781f61fmr50461271cf.32.1748099028128; Sat, 24 May 2025
 08:03:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523150815.3066081-1-ashley.smith@collabora.com>
In-Reply-To: <20250523150815.3066081-1-ashley.smith@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 24 May 2025 16:03:37 +0100
X-Gm-Features: AX0GCFtvxeP45UVauxma2CtR9gOBHxAzOl0x4iOpXOifVzICZvXpap9pkjQSMr8
Message-ID: <CAPj87rOw2UrabPVHBw0ymJEV3LZ29vzL5KK9T2K0znoEyDYeaw@mail.gmail.com>
Subject: Re: [PATCH v4] drm/panthor: Make the timeout per-queue instead of per-job
To: Ashley Smith <ashley.smith@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Heiko Stuebner <heiko@sntech.de>, 
	kernel@collabora.com, Daniel Stone <daniels@collabora.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ashley,

On Fri, 23 May 2025 at 16:10, Ashley Smith <ashley.smith@collabora.com> wrote:
> The timeout logic provided by drm_sched leads to races when we try
> to suspend it while the drm_sched workqueue queues more jobs. Let's
> overhaul the timeout handling in panthor to have our own delayed work
> that's resumed/suspended when a group is resumed/suspended. When an
> actual timeout occurs, we call drm_sched_fault() to report it
> through drm_sched, still. But otherwise, the drm_sched timeout is
> disabled (set to MAX_SCHEDULE_TIMEOUT), which leaves us in control of
> how we protect modifications on the timer.
>
> One issue seems to be when we call drm_sched_suspend_timeout() from
> both queue_run_job() and tick_work() which could lead to races due to
> drm_sched_suspend_timeout() not having a lock. Another issue seems to
> be in queue_run_job() if the group is not scheduled, we suspend the
> timeout again which undoes what drm_sched_job_begin() did when calling
> drm_sched_start_timeout(). So the timeout does not reset when a job
> is finished.
>
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Tested-by: Daniel Stone <daniels@collabora.com>
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")

Unfortunately I have to revoke my T-b as we're seeing a pile of
failures in a CI stress test with this, e.g.
https://gitlab.freedesktop.org/daniels/mesa/-/jobs/77004047

Cheers,
Daniel
