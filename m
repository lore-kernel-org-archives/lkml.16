Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAA827FD6E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715290; cv=none; b=PeP8mTE10aAzjDjad+xxeJYcWrX0zODdNuS2gFi5jwd/59jMj3cNuEaCQgzhdyOZLasxVZrMkcVKgddp84zAv7XCsAXsZ8fWkxLPiNcRAfd2qHc34GBGSpe+g+Cm9Y0fpe3QFm0ovUI/KxWt+jKLhkreyhqCVwr1QjBKArXwXkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715290; c=relaxed/simple;
	bh=sXyXU+UZTcrxkOb/c0qw2SFIN9UPdBx4v8Ai0f7UcAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HuAba35895SUUwuZDogj4pWmSWW8ResSzyq+ewK05VvauUGVsLOVq1DY82wPXrfsvl3Qeg6c3pFrya727CkQMrIn0nYiQXYpbbDgujBHUeP6pJbbt4IcUxkSdhDSqXw6MnqcOK2tShBcTTY28bUWKmFY0sf572Ue8zFHcyHQmy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=KRmVML3s; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="KRmVML3s"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4774d68c670so75519021cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1744715287; x=1745320087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAG9YdmRy2spdhrSdR+PSo3J7c8KUkAozpqOr7XPBVA=;
        b=KRmVML3ssIjOdhfyKbEnzCVfzq9Ondr4Bll52/G0JvOnwrDN5aqJ918zgLEy4RtC9X
         Awzmy0B1qzNDcKKGU12bFeMbIyiiQ5IzWZ1D3qXSI3Ca9FdWVmzQ4x1C9AkfzHT0CH3C
         IpDypQfQRptsZsoqfPTcXtXgGpp+5PoG8wTScHfW0OF5BSb0ZbI+yptXkMPcK/dkTAnB
         9sHpLLbHRpLSl4llPPqIWe0s0cT208HkFnQc7bezF3MNYdZw/tuWotcdWfLEma0VRf3d
         dOOwr9KvPsZxpDCwruJnI3mYEnJK8Araq3KxWYLwjJUa1F+yVBGmAVHYPZJYketHNQdu
         HGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744715287; x=1745320087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAG9YdmRy2spdhrSdR+PSo3J7c8KUkAozpqOr7XPBVA=;
        b=ssjZFmPThlLhXC86q9ZElkWSdJrwhMpdW+k7635p/vX5cTE7VSwFa5YoogHq68O+fU
         2MHt1u96wnDyL9NSo886iKjQOtgvd1Q8F4bW1h4R5/UD4cu4aL0BAEnZmQxjiMcwioqf
         fFqGbBLskAimmQmQyR6yA0aBPuJp69GqUdAJjLKs5hEVrThcCjkCiq0TvgHmTh1LdLdK
         N3CsTmvLcOEoaLQIv3ltRp79biDFvkc8dAAyiWQy9oXuBB1s47OHVWi3fKqaPUwEpN2K
         LF7pSUn38Ex3uSSlNTB7olbSSxtWxBMSJIkgl2q4GsUSfzu38B82TTXaPppBul6fDGHq
         Cbtg==
X-Forwarded-Encrypted: i=1; AJvYcCXbph9Jg7s0m+7fLNKXuFj78Ze2ZpoDTjhGkHUjs+YPyff7cF5qFkDX2lk+ysRrG0HvVKTPlrfTl+sXMcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvBLwgiHezhSf1/Iwr9cpeZlmvwUSGhORDTvXYlXeQCI4m/uHd
	iNz2+kvGQ6mMO/11TJuvhajAERYndFtuS0IyfzGxggDFEDLMhujob3L+prRz5zUFe28OkVbs1rH
	xqUza7rDS3l7Uphs9WGmokGwgrX4ibwuINlPNqA==
X-Gm-Gg: ASbGncsTIUUMMz4GBUMfoKsx3YWjcmvJGuTwHCGf03j6ublZzm8+BcwQimXcEZIjJSd
	4T42Jy+ISUaGWuwPlorpxqkXzE631uRJdLENisLjuG0di6QwLaSXuMtp+BUtEejzH+7EMeFb/t7
	sNXNr3uQlALsHuGA/NJPo=
X-Google-Smtp-Source: AGHT+IFh1vXSx5Rq5c8vZLzOiN4zABX47o5Z4Ug0aK3S4poCk694vjoyQA4QCi5vMCDm+1X/EKPDvHIQ3dGkD/YgQP0=
X-Received: by 2002:a05:622a:652:b0:476:a967:b247 with SMTP id
 d75a77b69052e-479775e95a4mr196800161cf.47.1744715287731; Tue, 15 Apr 2025
 04:08:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411150357.3308921-1-adrian.larumbe@collabora.com> <20250411150357.3308921-3-adrian.larumbe@collabora.com>
In-Reply-To: <20250411150357.3308921-3-adrian.larumbe@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 15 Apr 2025 12:07:56 +0100
X-Gm-Features: ATxdqUFMfgk3LCHq6b_tQhtbniGbjNbES2JG54tU6ZFtUvvi9zS7dF0xh4LyD-U
Message-ID: <CAPj87rNiKyXTO-+2F71ZKU9rTjYfeLKvxxd2bGwZo7tZ=3tjvg@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] drm/panthor: Add driver IOCTL for setting BO labels
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: "To : Boris Brezillon" <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 11 Apr 2025 at 16:05, Adri=C3=A1n Larumbe
<adrian.larumbe@collabora.com> wrote:
> +#define PANTHOR_BO_LABEL_MAXLEN        PAGE_SIZE

PAGE_SIZE can change between kernel builds with a config setting.

If the thinking here is '4KiB is big enough' (which I agree with),
then just define it to 4096.

Cheers,
Daniel
