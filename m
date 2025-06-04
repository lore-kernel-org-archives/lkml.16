Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD9D339A1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749053924; cv=none; b=WkRAEFLBEDMGqPGfw38wvT5De2z3kjVxynsbsxZz2ZNj4CoLeBC+dIwiEGjPkPXSaoJa3RJMKCJ/4gNkocsRJAitOcGmmY+xPv+udL3OGJSRns5JISUqI7CMWhef0cJ5hbIdC8o/o3FTe5uVbnExcxkBFKpelCND963KoFSP/AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749053924; c=relaxed/simple;
	bh=Xa8jPrzkHR+phbaz3krb7ugDZBKndKxpt7yIWX1fDJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VD6psHjXv30AqJrgbfhevUtV31NHTfA1WxGJXJwedzvjvC6V1ZjJsYe1pg2kHrWwR3TIlos1M1s3R1P8/DFxt210tL783JGiWUcGubcAOIupKezmSyIA0UqESrJMa7A6V3BN/0FkVv7hbHfBGjZcFhmKpTRNNnG6Qigbzij/C2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=Ul97M4au; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="Ul97M4au"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fac8c5b262so1312926d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 09:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1749053921; x=1749658721; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P8AKCIoAa/d1XSYeACl75HYH/kq79WoVL90DxYrmfW4=;
        b=Ul97M4auabDOEhu2AeiJTH9wMBFUorRY7bWadbSaFbDIovT1rcKtXv82c0bvWEClfA
         z/E0VDnF2SuyFuNAtmWQZLw3rOsJh12v7F+2H2L3JgX44jUNlPxy28cyQsqVylWXNIIh
         vefa5eQnkYvHb/BYUjQnpOZkEauWrgVCxnhv9U6tHButf6a8R/gB48IWbX+cBQV6g7bU
         sZChg+4lo8icz4TCY5dA4Yp9VizhXUYMvb6Eyj0E9RyJ8KksnSwbwSpDXwmZuJ7Jki4A
         T0DJubFnWzUrym3CMQPKtn8iP6KodvT/qbkBIxNP/XGcc4IGf2nu2UsAIHhELbpGvVXc
         aTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749053921; x=1749658721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P8AKCIoAa/d1XSYeACl75HYH/kq79WoVL90DxYrmfW4=;
        b=fi/87Ex0162ySZoEqkL6wvvMyk5TI2dG5ihtwsf6NLBdDJnJJkp35wBgQH1Q8XPNfi
         3U4cYjE+9u6097KDeguC9sqdgNP91XSN3CzMhNw1OQ8CUXmiA7aR2FUcCL7HyjBO2JaD
         N5aCnjEdONHDtQz9+nOM6PXbWpJyYXFmA5vOHBm+hoyTZj2L4/Pck6wLKAvzSEILGfCC
         kRdYZBMY3DaOUS/doEkhkZX4Nm99lsH0DLOWmm8ytNjVuA7s3fBkg62fMZAlm+XHDfp+
         Q1Z3xzHcC+p8TCNf1EJS6/MkVJy52R8UHw6jv4OBcSZ2rHu83VrF5sRQFd9RdNaQiGjm
         NIeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoOGA7TIx8fE3rbWgS0KXsU1XZhxqm7ctMUx1L13zI59T5joskkRaXswPN4PlPti38aHgxui5baBqTCvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzY2Wlnv+x6KGTdo6adnkJFEbVtvNNXzRymfNL1Fkz6Mg4EpRP
	rykv5M/mumA6b63k5LrOdfEvxgi2QuBttKKwt1UuIBRh9Q5jdHwOLxVXidm7vpnVQrPrw0F9eG8
	UN/6RsNfPFWJossZVNwIkganm7Ea40EVVrj2Z5UrMeQ==
X-Gm-Gg: ASbGnctebmL79vqWcyDYd0MpFwwla66FB8WENj7ipehuT/TzFVMITw9ba5j3wa+udTO
	iOA+FVpcXrpWKwcMLlkCrffW2FQ4zME/W7cIBj7QtnpsJDPMh07lKoaMcfFtEwnMPS0EmYPyhtG
	n+we4Rpdat6oRvJ7FNOwlg/x/2e6BiDmo5GhbJoP02dp76fc4Fj3L7LZsW5FDH72KEW5prDprmW
	I7sJA==
X-Google-Smtp-Source: AGHT+IHKumrpYp7KXj3Oppwg97YrZ8QLTUdlX7sch68BDDJcICEIYXc2OCGtCAc7AHX04x4oGqNiMhls5e1iB1AyII0=
X-Received: by 2002:a05:622a:4d44:b0:48b:4f9b:fcfc with SMTP id
 d75a77b69052e-4a5a57559e0mr54446431cf.22.1749053921456; Wed, 04 Jun 2025
 09:18:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net> <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net>
In-Reply-To: <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 4 Jun 2025 17:18:29 +0100
X-Gm-Features: AX0GCFspq72tjQe2nH9NHC6pMzIvIPvg3yffH3OtDe0wEz2aVsnXcTNMk1xSlik
Message-ID: <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Tomeu,
I have some bad news ...

On Wed, 4 Jun 2025 at 08:57, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> +int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +       [...]
> +
> +       /* This will map the pages to the IOMMU linked to core 0 */
> +       sgt = drm_gem_shmem_get_pages_sgt(shmem_obj);
> +       if (IS_ERR(sgt)) {
> +               ret = PTR_ERR(sgt);
> +               goto err;
> +       }
> +
> +       /* Map the pages to the IOMMUs linked to the other cores, so all cores can access this BO */

So, uh, this is not great.

We only have a single IOMMU context (well, one per core, but one
effective VMA) for the whole device. Every BO that gets created, gets
mapped into the IOMMU until it's been destroyed. Given that there is
no client isolation and no CS validation, that means that every client
has RW access to every BO created by any other client, for the
lifetime of that BO.

I really don't think that this is tractable, given that anyone with
access to the device can exfiltrate anything that anyone else has
provided to the device.

I also don't think that CS validation is tractable tbh.

So I guess that leaves us with the third option: enforcing context
separation within the kernel driver.

The least preferable option I can think of is that rkt sets up and
tears down MMU mappings for each job, according to the BO list
provided for it. This seems like way too much overhead - especially
with RK IOMMU ops having been slow enough within DRM that we expended
a lot of effort in Weston doing caching of DRM BOs to avoid doing this
unless completely necessary. It also seems risky wrt allocating memory
in drm_sched paths to ensure forward progress.

Slightly more preferable than this would be that rkt kept a
per-context list of BOs and their VA mappings, and when switching
between different contexts, would tear down all MMU mappings from the
old context and set up mappings from the new. But this has the same
issues with drm_sched.

The most preferable option from where I sit is that we could have an
explicit notion of driver-managed IOMMU contexts, such that rkt could
prepare the IOMMU for each context, and then switching contexts at
job-run time would be a matter of changing the root DTE pointer and
issuing a flush. But I don't see that anywhere in the user-facing
IOMMU API, and I'm sure Robin (CCed) will be along shortly to explain
why it's not possible ...

Either way, I wonder if we have fully per-context mappings, userspace
should not manage IOVAs in the VM_BIND style common to newer drivers,
rather than relying on the kernel to do VA allocation and inform
userspace of them?

I'm really sorry this has come so late in the game.

Cheers,
Daniel
