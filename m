Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345AB28C2A9
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451947; cv=none; b=RBzhAZ/OQU1gG5SHXpAGoBgPEIy2DOXVbyaWCG1eVJNHji3JWUPFGdJMK2dY/UMVqIVrMrrSwkB+FyuzUUAcUhYtEf3SxC6mj2zBJ12yupu/mYN4Jq3IWGO8EKgcX1KjmGSIClwVJ3VO4kJdP+Axu9ZIwTyV+6VyLs/jAXqSAm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451947; c=relaxed/simple;
	bh=MjN3DeO7RN6Mtg+Ma+91ASlzL4kT4/NFZVHo/75DdS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7nDW+gvchdATklLURfCtzK+lNhJq75QnJ4RTa6H8g+w5oOwyylgl623RtOGWrDqNPxhNdql2Pg2PycCj8WPcVMW5q+K2b+RNURSDOHhzgdQwltNPhswdW004jEYWB81ecOQTKB3GlQjeWoFSyZDC3YQ2vh2aHiJg00aPX8Q66I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=QU3K5Rcw; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="QU3K5Rcw"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-476af5479feso45838771cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1748451944; x=1749056744; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MjN3DeO7RN6Mtg+Ma+91ASlzL4kT4/NFZVHo/75DdS4=;
        b=QU3K5RcwwQRFKzg24rtjAGsmq/xYQYKtfzNLBU3zLHCnLfMIf14jactvm2tVB+KPVk
         +OqJLGi7c3pTeXzZKkp0HPz2+5f34hpV0jUYcFwoQiDXXWvEFp5HRAkXSHNAtpgcSOWJ
         +MVcIXoeaoUZ/bmJZibWprGxdGaXz29h05O42I/XOz1KUfuk3K0f6C2rRsA/VEPeinS4
         5cEBbRY5l0l20ftwxnkyJQMjdG82JGEWxzYsENpwDHkl9JJAHzaYI+uM8nApp7zO6Rl3
         QxcGXa1wyjVV1Su+08dS/vfHz/nSy+EMHHgcGwyH7A2VdOx1u9yK1itsG+eMZ4n2/LrD
         lQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748451944; x=1749056744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjN3DeO7RN6Mtg+Ma+91ASlzL4kT4/NFZVHo/75DdS4=;
        b=kfaJ7jJ7ujVPn74RI/4AvG5kok71f9IDR04xBvjNX3dJeXLPbZKj/a9XGtHDoGf93o
         3OmgYObRupG3J/gerIeBEQW+x7fIzb+SpqQwTUs0uquV+eF6h/MYRwqLOyc5leNrX/wx
         1zJIzsTQ9elDIJoVax+ABh9lAYb1G7U/nAgffvFyOyJDZstftlkYb/vmbh0danHX012m
         1siHcjQsT5irEuh2jqjAyTjG2XQcBWaWBeFDSKjPZkhC+KmmnDOQYi6gebwoUsX+fj9h
         EsZoq8Z39ZXZKAowdnmddJQBpVky7VO7ud+obXhJ7L+dxFBb72/0l4pOwcAI+CEYTLqD
         tHIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz3UZycmmjE4abAE/5WvHYh9qb5aHbXV6rNdoQVEvtpP0xXhY2ej9DFNtLP3dDx22hfZgCrwxMj05c6zw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlag1wnQT6wjWM7uJTN5twAaYq6lxd5IN7GJi9oREO7f9a/cus
	1DAEgs9tueEWmISOA1y3yBcBr1DT0XeHHTIxVEwQa88l/aKDPQy3hLcYHa8409XjIvIh51VQgHn
	AKjwGNTCdg2wu4El+cjKb6DSB/xI/DO5zqEO7fzwgSw==
X-Gm-Gg: ASbGncs3yu+k6a2fhQZm/0Qe/XN5uCKlegLKvLCwmOV6AXZssfP5jKFrhCnPID376MI
	sn2/qvKBeFADWFmWJGWAo9Av4SHT5au0VMGQWZK5KRIXDwR6M6VsL3ZM3VOkt9k6T+Pf3wligpT
	tK67vMkZvDyFDw8VC7XagMp9VNOARYgw==
X-Google-Smtp-Source: AGHT+IEm0ejvPbwrNrqDkZXRJHIE7U5qRPKrsu+TZQu2HF/RoG0QL+BHmiqMQvBwLiCrtZT5dzW9XHwkZ3YcoQoZDUU=
X-Received: by 2002:a05:622a:22a2:b0:476:a713:f783 with SMTP id
 d75a77b69052e-49f47de7e8amr310623321cf.47.1748451943943; Wed, 28 May 2025
 10:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523150815.3066081-1-ashley.smith@collabora.com>
 <CAPj87rOw2UrabPVHBw0ymJEV3LZ29vzL5KK9T2K0znoEyDYeaw@mail.gmail.com> <20250526091646.7020bcff@collabora.com>
In-Reply-To: <20250526091646.7020bcff@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 28 May 2025 18:05:32 +0100
X-Gm-Features: AX0GCFv3czEaeWL4c-hEA86xSpuMEGadqYNvEfZwMV6awSY6zHBdvHknCd_zQJA
Message-ID: <CAPj87rP=HEfPDX8dDM_-BptLmt054x+WHZdCBZOtdMX=X4VkjA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/panthor: Make the timeout per-queue instead of per-job
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Ashley Smith <ashley.smith@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Heiko Stuebner <heiko@sntech.de>, 
	kernel@collabora.com, Daniel Stone <daniels@collabora.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 May 2025 at 08:16, Boris Brezillon
<boris.brezillon@collabora.com> wrote:
> On Sat, 24 May 2025 16:03:37 +0100
> Daniel Stone <daniel@fooishbar.org> wrote:
> > Unfortunately I have to revoke my T-b as we're seeing a pile of
> > failures in a CI stress test with this, e.g.
> > https://gitlab.freedesktop.org/daniels/mesa/-/jobs/77004047
>
> Note that you need [1] too, which I don't see in your tree. Ashley, a
> note for next time: when you have dependencies between patches, like is
> the case here, it's usually better to post them in the same patchset,
> so that:
>
> 1. They are applied in the right order
> 2. Cherry-pickers/reviewers know that they need to consider both to
> have a working branch.

Oh, sorry I hadn't spotted that. Yeah, with that applied, you can keep
my Tb, as it looks entirely solid in CI.

Cheers,
Daniel
