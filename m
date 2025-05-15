Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBA61EA7F9
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747332298; cv=none; b=lv3U5ThJ2yf4VEDtpAOdH0njy5YVB14+hQJOL/aHj/PkAB0Lvf8EUeZLr1vcflj5WuxR9tMXDSFGV0Y4rtI4CrnJhBjFSh3h7gVDqiPoOKlNPgk/R2OiK9FOQT/p5LVvW8qGErB7LEFMm1hrT4BWuu+KUKHvhRg7oQz5HUvIcec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747332298; c=relaxed/simple;
	bh=MeW2imbD+0sbVbaIbmZsCArhOObxP247tps4EkCCdJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=qI8kmx+UH/sdirVqNxk43LEQckyDplko+lz++JJnquE6f++coAi/cyqwYTozoVN5JCJ6JcEtLIybAA/kq9TcogLFOUMSZgqeD1lvapXRNvZzafAdbfUU3bHpZD1Hy9COBov4Gm6x5GyUt8jRWy6SDLA85poxUXMDhDK6cqe+Uwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=iM/RebzE; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="iM/RebzE"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-47662449055so7997981cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1747332295; x=1747937095; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SqENoL4aMLDUtpJ6J41zIxw9AQzbwBrm9u1/bZHdjuY=;
        b=iM/RebzExkNQVQ6EtT7OmMwDzXu2wio5qrDY1W3ppc+eSJiZHR22gIRk8C/ylXzspv
         KoHZUAYv0/l8VNaEN34pKAkpLTXoJ5XHmiAgF5t5P7WzLvsaZyuXtQtFJDY/ubD8zlxy
         kw2fLzJlOoqFbtY5IKHpsgCi30z/E539ywxisUdmhs/kNEOvF/Li6xkGVIvSwzrsOylH
         m/f1q19ETQzKj3O1wFUr+ajFAht8BzkJaueMDL9zwmNCs+ShfAE4Z3zUrF8dh8FQ3oDU
         +uQAriHofF+t34B7eYMad+LqcN+UN6/qMlIMvTk7j0v8z4PH3oEleWkbZMIWuLn94diq
         Q01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747332295; x=1747937095;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqENoL4aMLDUtpJ6J41zIxw9AQzbwBrm9u1/bZHdjuY=;
        b=KZtkRT86nylNOdjHcs3zlVvEgf+LZ324MmF4qgX0AkY4qXeN2m1Xmqql/Dfmq/TlUC
         mZOP3Wvv8LGJw3J3DyU0khFcvO3F/NO9ZPPJiJK1JFfKI7fFk+11TsK0WVDotN1zLXGU
         zU1phU32UNFWsV2YwdIoYJpbfIRJ/6oqltY+JKhHtgsCCLYlq3RGbqPZIlut+lN6I+zi
         x4CAGkL+5xiicJx7tD5dJK5EBvobc9tdDyQRJYuXnee2t800GXLeuwkOwYPI9njwfZZP
         nZY/u+Zg8hlpJUah6gLo1g7PTK0duaj+SHUO8OnOY+BfsBMoY/V3rHVwm82hjmKkDZPJ
         EM9A==
X-Forwarded-Encrypted: i=1; AJvYcCUZ856fm3JI+UzisEUL1z4o8n09SGanSoyGs0v5nSNyx/+R0+XmWaEtz5B+lap+d9owiEd5WEeTtYyAkkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhIh7Ub0r8OO6YAgDXTpNgZIJAOQ3/cuujv6xn0MLUzWT2LTpx
	GyG3v1NH0ZEcRaCuUy+Ik0OHQYyTkB4vWa5Rl46HMgtlH6VsoI3hxVTmjqJ3eM08ZJXmpSb+EXM
	WDK1+sCWqf2wN5yRNtGDLHoXVbtvJyhiaMj/UZbUV7EzHRw9nSmXkVTCo+/eP
X-Gm-Gg: ASbGncuxsM4PCTddWxl2M/10PJ3zeJ1YnQO7yTrorqo7TI0FCnt5EsGYXT06PJIWS1J
	mGV6ysuTg6y8qk2FJdmc7q0YvEW6X34dh4evi6aWbLSWGNlpndwT6XSEKr8adsGaP5HJQHvBY2Z
	M4HfN4SOSEW+rhneeuqUls/DHJ7cyNvmw=
X-Google-Smtp-Source: AGHT+IGFQP++c9XJDNDJpVGCGwvgZpf4fTxFvv688y33OjFyfYfYLK9l//bZATh/43rI6k4OFGCYqhyQBM5SOYRCBtA=
X-Received: by 2002:a05:622a:59ca:b0:476:9b40:c2cd with SMTP id
 d75a77b69052e-494ae49f4e0mr5251951cf.47.1747332295147; Thu, 15 May 2025
 11:04:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507160713.1363985-1-adrian.larumbe@collabora.com>
 <20250507160713.1363985-4-adrian.larumbe@collabora.com> <9c0b95c8-bf2d-4689-ac1f-ccacba826060@arm.com>
In-Reply-To: <9c0b95c8-bf2d-4689-ac1f-ccacba826060@arm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 15 May 2025 19:04:44 +0100
X-Gm-Features: AX0GCFuRDimE2NPezlvg51LNRrQrl-sYF337fsjOpF63sMhVPLZez7fPK-61IS0
Message-ID: <CAPj87rOiEa1bTOPqyauYhoVoXEtNeDjE+DkLbzeGVJ1tW9fJcQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panfrost: show device-wide list of DRM GEM
 objects over DebugFS
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com, 
	Rob Herring <robh@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Steven,

On Thu, 8 May 2025 at 11:42, Steven Price <steven.price@arm.com> wrote:
> I'm also seeing a splat when running this, see below. I haven't got my
> head around how this is happening, but I see it when glmark quits at the
> end of the test.
>
> [  399.505066] Unable to handle kernel NULL pointer dereference at virtual address 00000004 when write
> [...]
> [  399.882216] Call trace:
> [  399.882222]  panfrost_gem_free_object [panfrost] from drm_gem_handle_delete+0x84/0xb0
> [  399.893813]  drm_gem_handle_delete from drm_ioctl+0x2b8/0x4f4
> [  399.900237]  drm_ioctl from sys_ioctl+0x428/0xe30
> [  399.905496]  sys_ioctl from ret_fast_syscall+0x0/0x1c

Soooo. Let's assume it has to actually occur in
panfrost_gem_debugfs_bo_rm(), since that's all that's changed here.

I don't think pfdev can be NULL here, because we've already
dereferenced ptdev and written to a structure member earlier in
panfrost_gem_free_object(). I don't think it can be the debugfs mutex,
because a) that's initialised with the device, and b) wouldn't be
offset 0x4.

I'm looking then at list_del_init(&bo->debugfs.node), which would
effectively execute bo->debugfs.node->next->prev =
bo->debugfs.node->prev. So if bo->debugfs.node->next was NULL, that
would explain a write to 0x4 on 32-bit systems.

What I _can't_ see is how that would be. Even a double-free calls
list_del_init() so we're all good. If the shmem alloc failed then this
would splat because panfrost_gem_debugfs_bo_add() happens too late,
and we end up with an uninitialised list head - so that's one to fix.
But I assume that isn't what happens here. I wonder if it's the import
path, and the panfrost_gem_debugfs_bo_add() call instead needs to be
in the panfrost_gem_create_object() callback rather than only
panfrost_gem_create() which is called through the ioctl?

Cheers,
Daniel
