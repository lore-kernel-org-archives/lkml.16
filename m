Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB9F24F5AA
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739286228; cv=none; b=NtKpLq6NB6jIIzbn/oE4X2CBiiss45QT4KTcNQc9Gy9JGShuoy8nDdKO2joVtBSW0qOg7x36G8Lh6TIbswgWYJaV6BH8Lw5K0rFpwXoN7stqyEvNoIkV5wl/Q/wcGxxd2LjBDAM1Og1FU2lOMiZASwNqxaGRg7kFSRFVwYC5iUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739286228; c=relaxed/simple;
	bh=TQQAbEM4Lc3ts4bruQy1Ce810J81S59Y8DQr6RiuK2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsU9c6gUZEdcwCG+d/pEDeqnNkObr/qUsUQ0tIiLtCfjTTMJpmwMYrwifDE7VV0qcFxaAoXOwqNVnEZbnnaqq7ApeptMNqgI53AkNowUmLXRvx/upgsqV90jwhA8H2S5RDNGwMo+xbQ+s8EcpMJ8l1jf8aWJWVr51hbLuSXINHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fi+OpqTj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fi+OpqTj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739286225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6K127Xqp01kwOLTDIHQix5w2cmmFKXaOgArwWedRCAs=;
	b=Fi+OpqTjbNOKytE7YWYT64tMTnx+YARvZucQQxsn/igxR4Psu08lZim2s27FFBo93bdb3z
	FyVwtC5JFEzSv/AOF2CndEwrHWd+EZgKK1n16/shrwNJr35z9jAvK7Z/NbphQUmB/n7I+F
	AB5C5e5IcTeNDpPxqhyfMyz9KdGYGYk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-_KQAmLL6MyimKI-KGXka-Q-1; Tue, 11 Feb 2025 10:03:42 -0500
X-MC-Unique: _KQAmLL6MyimKI-KGXka-Q-1
X-Mimecast-MFC-AGG-ID: _KQAmLL6MyimKI-KGXka-Q
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4393b6763a3so14801665e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:03:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739286220; x=1739891020;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6K127Xqp01kwOLTDIHQix5w2cmmFKXaOgArwWedRCAs=;
        b=sVDUm1/CW9WVtICK9nfsRE+mc/85SNodBvQgpFdLrx3cH4qcTYqmeDbQ8fnVQre9V0
         QgNvhta+ayEATKEL+nJuIZANSkZ5kAu8+0TR5P2Gkujcmo/0TECxNoyXrrcdbucbeA3L
         rbJZ/pw+4CwqHK5aZxyiJDQOBO//MVodJHPSM3AdeAWnqdo019u9/BKZ4v5gy9rHBUrc
         or7UzUhMp3ehg4HyEzpmz7i7Gw0EgNkXdf95tU427YtG+pb8ZzlkXpdDbgiK7pF17Z+o
         D3ukHRc7sBTxYfiPHb/SiPe/jYQi2q3JwJrNzu2qgSEk2SqHm9tuQV0uJvnGSCJH9/7c
         NceA==
X-Forwarded-Encrypted: i=1; AJvYcCXyY3txzhbhQzex/PhN8pxRmrESTnCS3p+XJWTqBJRZyG5AumNTF4fyoYzrxuTr/6U65XVre/ZLNqx4RPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZAgzAOrPZs0iDSYuLZtYhL0KSAWNuTeneXJ4Nw3iJZrGJmrun
	aiNg9YhXKpkXr8dwIRuwT8pb2TXll5ZeuaAcPnT+0lxlNb3fzjdlIs6cS0rIkqkMl84H+swey17
	d1qx6LGPVrkWJLu0TTlWRD1azWEmZ0SOlbEpBvF6B3STahpDu5g6Cw3pdgdN4Xw==
X-Gm-Gg: ASbGnctMghAC7WdQ+Wf9o/b5F2MO7NyESnAtZxF74FTm8GxcQ0eyISOFxTVQz8gpfYP
	Rsg5EDTPA2chxdr9gDqhfJ99NSVaDgH/dZ5rljg/D04FtL2x0smRRsnjjb/l7qAisSZ5gUKsNxY
	EXrHYCDWRhL+2vDUg9Nl/nKwuaS7LiQIm6xlLrCCgTgE7NFYf2C8leGWUd8cbk/3You1yUxHUNd
	JJNlvBJoZ8Ft6sIg2k3DylC7eq6ZEkLeEQNLI1GTLLeJHz5WU2DnBWOfeyWpJ2dI9YljQ==
X-Received: by 2002:a05:600c:4448:b0:439:4740:20a2 with SMTP id 5b1f17b1804b1-4394c853a2dmr42858065e9.29.1739286220074;
        Tue, 11 Feb 2025 07:03:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEN7+RaFI8Q1DlET/AqPOd5Q7ETC0Cm6eLK5eh5/vnngjAmjHCWD7Z20lqQzfUQw3dEBz+m0g==
X-Received: by 2002:a05:600c:4448:b0:439:4740:20a2 with SMTP id 5b1f17b1804b1-4394c853a2dmr42856745e9.29.1739286219388;
        Tue, 11 Feb 2025 07:03:39 -0800 (PST)
Received: from pollux ([2a00:79c0:65c:c300:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc5c8c37esm13267156f8f.2.2025.02.11.07.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:03:38 -0800 (PST)
Date: Tue, 11 Feb 2025 16:03:36 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Melissa Wen <mwen@igalia.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
	lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Christian Gmeiner <cgmeiner@igalia.com>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH v4] drm/sched: Use struct for drm_sched_init() params
Message-ID: <Z6tmyHpqnpkP2gKq@pollux>
References: <20250211111422.21235-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250211111422.21235-2-phasta@kernel.org>

On Tue, Feb 11, 2025 at 12:14:23PM +0100, Philipp Stanner wrote:
> drm_sched_init() has a great many parameters and upcoming new
> functionality for the scheduler might add even more. Generally, the
> great number of parameters reduces readability and has already caused
> one missnaming, addressed in:
> 
> commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
> nouveau_sched_init()").
> 
> Introduce a new struct for the scheduler init parameters and port all
> users.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com> # for Xe
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> # for Panfrost and Panthor
> Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com> # for Etnaviv
> Reviewed-by: Frank Binns <frank.binns@imgtec.com> # for Imagination
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com> # for Sched
> Reviewed-by: Maíra Canal <mcanal@igalia.com> # for v3d

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

