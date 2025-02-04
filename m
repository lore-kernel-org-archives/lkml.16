Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9474013C9D4
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 11:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738666840; cv=none; b=ezv/at/vpxBKbSdrchuU+EIfgJUrd7FpcmvMRM3eGo2IVnUVRtqx8xIez5qz4Ic9z93EsVRq3M+ZWXYCNE34WPHknGIyYsOICYNOX+TPD39LqTxg5RdWfU/ZkBkOZDGJfro5aJJJa9gZZizAjBzkjN0+FXmx+QlrzXDZiw7HkBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738666840; c=relaxed/simple;
	bh=8hZiOgzN1mpFCvn/VyQy1YDSqwWsZdAHL1vTgPXCgsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0NX3uJp/uj6Y/R5UfuxoPdR2nt1vtUrfDqrbVwdmkCjArTQ9Vf1NS7dbZ7zqpTeQBNj0sQ5ydkkiirf7ViqktjEf/G0iXIAMwWd9SH2f4wLdHz7PCW3pTu076x9yjsgPSxl1ejFM0FdDAW4QdT2/dBFJj+OviPYzkeMISeAjAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Pi7uA6zY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Pi7uA6zY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43690d4605dso37203545e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 03:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738666837; x=1739271637; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1qEq+ElMf3tzfmwe9V3JN7eeJb5z/31FY7C4V4/CChY=;
        b=Pi7uA6zYlratt9On/VjLVeL/nDZiWG2BKRWknfGGvRVFhbJj97JEGrrXXdunE8cRZz
         TDKSeSgXAIjZ0Yta6RThmct2VxF/jtK6EjoiMjyfF9fhQ9OwwxXFOiPb3ksrclv4otwn
         pzonvHpTKlOBzvqHmkhbfk8VbGFfZH9pp3at8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738666837; x=1739271637;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1qEq+ElMf3tzfmwe9V3JN7eeJb5z/31FY7C4V4/CChY=;
        b=DfJc2m0EpjasvM122ITw6n9fu1LUB/liekiNl4xsKXOoCv6ponaT/56w37V0yc57w3
         3lUF3sLMFQpk/GuSmHWsTcepei3xMJVRDenr989mO8WJmRWNGiZ6blW/1XTXI7hX37bP
         ik049nKyHi8/Q88e7CiBJ69izbzQIqpm6IwznHv255ZRY8+B2RfA+f7F7YTTVobdGvsl
         c9CsHJe40JVXgpze/7WkbDTkGgZhBr3ljz0gD6lVJ+XqBUoYbVWSymk2bY6HgLNXK5BD
         1yCZ9rmzr3DJ42s6HQspBTlO/pmoqOuk5pvVYTxX+rkjF5fXOgyGKZxN4es9bdTmEZQB
         jPNA==
X-Forwarded-Encrypted: i=1; AJvYcCVD3GZI7PViA2MobCCpUO33vVVghZTM4FBaGrBc1QYq43kIEmDWrP85JiCwNlWHhnB0W/MWIsYMIZ0v7I8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwARBxM47c+jrCejWHmaIg/+H1DHEhqVpRYTa3taibCMTw6ijhy
	2RMZzelGrr8yqtqpwUDmFD4S2Lxbv4nuGsG71GW1tg7zZCVC7Xtkdp/KhKa2DR4=
X-Gm-Gg: ASbGncuvriotg+jNuhSTHTCOwiF+YXEFxHRdDRXBTpr/P49BGiBOAV62ww35ltozRB/
	Vvyuyq0ieQ+Bg1SwQqKvtVlGPjExrfY44LeMdyW0Lor/MPnpvqKDVOGPcTZTjAb/rEahZUvX5Y6
	FEobqbgZ3Md/zmDyr4fLWHxRuISh0+ej5jR0kkuQi6LWEc7+kosnrH7d7nV41cqUzwbUB58LAcc
	n0Aps0SBLnZ7T4YCOvy+i1NZopZLdy8dcVGpCMN1A9YZDwAoFtTg7vyZroJOoZQdbXuP7osmukz
	zQC5GG9AhnXfTy+hYSG+b7cxQQk=
X-Google-Smtp-Source: AGHT+IH8E/wHWTyhYFZ9PZjCo1HsdJQC/yHrtDwtnInnH1WvV9/UailC+a7uxbTK7laZAYXd3pK4hQ==
X-Received: by 2002:a5d:59ad:0:b0:385:f560:7911 with SMTP id ffacd0b85a97d-38c5194c68dmr21045402f8f.10.1738666836603;
        Tue, 04 Feb 2025 03:00:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b4e99sm15513991f8f.74.2025.02.04.03.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 03:00:36 -0800 (PST)
Date: Tue, 4 Feb 2025 12:00:34 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] drm/tests: Fix locking issues (kind of)
Message-ID: <Z6HzUidu_pOth2BS@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Wed, Jan 29, 2025 at 03:21:52PM +0100, Maxime Ripard wrote:
> Hi,
> 
> Here's another attempt at fixing the current locking issues with the
> HDMI kunit tests.
> 
> The initial issue was reported by Dave here:
> https://lore.kernel.org/all/CAPM=9tzJ4-ERDxvuwrCyUPY0=+P44orhp1kLWVGL7MCfpQjMEQ@mail.gmail.com/
> 
> After fixing it, there was still a lockdep warning for a circular
> dependency. This series is also fixing the issue.

So this looks like it's a kthread_exit, which yes is broken. You cannot
acquire a lock in one thread and release it in another thread, that does
not work for lockdep and therefore is forbidden for mutexes.

It's kinda allowed for semaphore, but that's why semaphores cannot be
automatically checked by lockdep. So yeah we cannot use such a deferred
action, it would need to be a deferred action that's run synchronously.
-Sima

> 
> There's still an issue though. When running the tests, I get:
> 
> KTAP version 1
> 1..1
>     KTAP version 1
>     # Subtest: drm_atomic_helper_connector_hdmi_check
>     # module: drm_hdmi_state_helper_test
>     1..1
> 
> ====================================
> WARNING: kunit_try_catch/25 still has locks held!
> 6.13.0-rc2-00410-gbd9d16533367 #18 Tainted: G                 N
> ------------------------------------
> 2 locks held by kunit_try_catch/25:
>  #0: fff00000021586f0 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_kunit_helper_acquire_ctx_alloc+0x5c/0xf0
>  #1: fff0000002158718 (crtc_ww_class_mutex){+.+.}-{0:0}, at: drm_kunit_helper_acquire_ctx_alloc+0x5c/0xf0
> 
> stack backtrace:
> CPU: 0 UID: 0 PID: 25 Comm: kunit_try_catch Tainted: G                 N 6.13.0-rc2-00410-gbd9d16533367 #18
> Tainted: [N]=TEST
> Hardware name: linux,dummy-virt (DT)
> Call trace:
>  show_stack+0x18/0x30 (C)
>  dump_stack_lvl+0x70/0x98
>  dump_stack+0x18/0x24
>  debug_check_no_locks_held+0x9c/0xa4
>  do_exit+0x52c/0x970
>  kthread_exit+0x28/0x30
>  kthread+0xdc/0xf0
>  ret_from_fork+0x10/0x20
>     ok 1 drm_test_check_hdmi_funcs_reject_rate
> ok 1 drm_atomic_helper_connector_hdmi_check
> 
> I believe it's due to the fact that drm_kunit_helper_acquire_ctx_alloc()
> will acquire the lock directly, but will release it as a deferred kunit
> action. It's not unsafe, as the lock is eventually released, but I don't
> really know what the best course of action is here:
> 
>   * Forget about the idea of a context tied to the lifetime of a test
>   * Make lockdep know that it's ok, and we know what to do 
> 
> I've tried the latter, using lockdep_pin/unpin_lock, but that didn't fix
> the issue so I must have done something wrong.
> 
> Let me know what you think,
> Maxime
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Changes in v2:
> - Fix circular dependency warning
> - Link to v1: https://lore.kernel.org/r/20241031091558.2435850-1-mripard@kernel.org
> 
> ---
> Maxime Ripard (4):
>       drm/tests: hdmi: Fix WW_MUTEX_SLOWPATH failures
>       drm/tests: hdmi: Remove redundant assignments
>       drm/tests: hdmi: Reorder DRM entities variables assignment
>       drm/tests: hdmi: Fix recursive locking
> 
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 200 +++++++++++----------
>  1 file changed, 103 insertions(+), 97 deletions(-)
> ---
> base-commit: e2a81c0cd7de6cb063058be304b18f200c64802b
> change-id: 20250129-test-kunit-5ba3c03bffb0
> 
> Best regards,
> -- 
> Maxime Ripard <mripard@kernel.org>
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
