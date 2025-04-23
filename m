Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6BA29B22B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421815; cv=none; b=q1rubwOtlmFvij5Zu2vF7iZcHNcnhEDQT2w3drx+YafMKL/NtI0xoLZlzoLEJq2jkEpND6/QBa3Awpgqngn/7eM+xDQdLdNSB2/sa/JhrLwqvjzO4LnrMNHy+ZrH85puySvMJ9DHuhuBaj1yA7iZitqkg3N6KQ8mJsdF9AFbnsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421815; c=relaxed/simple;
	bh=vhcyUo6KAslWblrUDCqe77mhvYixtNpjDAllsEwMg2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r9MO8sEoRpETyC/zRssMS7DIwY3v8bzP8C8KwzGpvoKqkQ9yv5fNi28/NyU7Whv9Yxoog4ZJhVT/V+GI5fucEcUf6CzEI387LEMUoWIjTb+ILNJ38uXj/9wk7b1Odk0zJxfsjql6ElHBFGEtyT9rgFYLD1wdL0riqUARZkgzTKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IezQSZXV; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IezQSZXV"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f435c9f2f9so9971793a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745421812; x=1746026612; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sBJXxI+VnkOvdG03h/gTU2mlJ2vsoYyyCCSIoMLfBQ4=;
        b=IezQSZXVaHdBTpHTOxflFZFt5kGWQIQY7hxXIQlYSqnYn5Wn/NH5iaQgSs9u7a3vej
         XGCMrX8yogeqRmwiOHqUL5eFIdiG854Ylq6F5r7PddKFg2OWJyIRQhAlaaPWwTbpftPB
         pfiD53sNMjZPsWzvqIRc5eyXfO1t8UBGhlaOhwfVvyc/LGrpBA+vEXEXPoLZGtZ+4fK1
         KVZi0sTY/PyBvMcI2PtfdkGbDxDXNLVBkfe3LuY44+bOEcMQRhRg5JrKe1vxryvx2nYd
         Y6f9LcikDyMqfLLpVc/AHiRVH2myWuTJFVMlaCc0+bR+6uWwESPhBSWDa1URs7pO08nv
         d7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745421812; x=1746026612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sBJXxI+VnkOvdG03h/gTU2mlJ2vsoYyyCCSIoMLfBQ4=;
        b=K4WONzx3rIA5i56nssDfy8SGncmq64dHmRLro7Mq752HjT38HtRRYYN1dlPYN+Qw6i
         KFsXeyG5xE87lwv7dW3mLxAV/1eodSFN8Sy4/7UuHoVLDAFWvNHjb/et9GAlTDS3PaoY
         oAS3+nbqqd3YdV88ao7n8TGyao0KCR+giud6KN5Qtzp3/bNbOyhKum68O+MqKfSI+FIy
         fVAvbwYo4W7j+QVSPb+MPWf/poD75R9wJHaOGF5HwfovluRnM/JnRrKMzIp/uYPVVsOB
         Wk75YZcjtwwKxBETPglCuURVfIhxGeasuiccxzToBSUTIxEnAZ8L7t2EBHssxcw2d3x4
         TeKA==
X-Forwarded-Encrypted: i=1; AJvYcCW8qZBrGyBPp9NAk/8w8MYTPLLT/zzEIhdSDWUGPPyLLCrbelhqq0JoXaLkekaGTldNWZq76lbBPbKAVZs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfy3W4vlhbDCpvmqlintcrnPb2+78N6DbeEl8S3SdpzX+ysVS4
	HDCfa6rh6tp2UBMAtalvPS9MoWkFYYRsdx45q3Ua7rc/oLlo1jSUYxFTwhACFxH5UZ1wjpGAq7k
	w6DYFJlO6bUEIruFL7Tfq+mkecahymVw49fLdaA==
X-Gm-Gg: ASbGncsrbN53KdeyY4rHs1/rDxp7wGXZt/cG2cyqxjqqHVbN0qmvDCIlS/LI6I9iKFf
	obA8eiurmlcHyakpw7kPHhSF1ZXRRkVyQgbNYkcoyTRWX5JWJtSqPJFJQlds63Y0kjgYlzvSDEy
	sQL3qpuOIAXCkb7AjOa2rM9E8=
X-Google-Smtp-Source: AGHT+IGPu59FaDGH5BEkXJJ7svic3UgDeQqapGND2AunCs9qXYZnqI4o1kWAywADMLlCU4WGGSFlE+fbrGMmBQWyplk=
X-Received: by 2002:a05:6402:524e:b0:5e5:d9e5:c4d7 with SMTP id
 4fb4d7f45d1cf-5f62860fdcdmr16126430a12.28.1745421811890; Wed, 23 Apr 2025
 08:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422191939.555963-1-jkangas@redhat.com>
In-Reply-To: <20250422191939.555963-1-jkangas@redhat.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 23 Apr 2025 20:53:20 +0530
X-Gm-Features: ATxdqUESCavL9HzimYlvlWteFP-krmBUrVLSD6RMVwG58YA294DJfz9zHgN2yXY
Message-ID: <CAO_48GELW3ax5Q3h9=qpWBJJa0Uy3eJwFkEcbaz4ZT56Gq513A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] dma-buf: heaps: Use constant name for CMA heap
To: Jared Kangas <jkangas@redhat.com>
Cc: benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	tjmercier@google.com, christian.koenig@amd.com, mripard@kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Jared,

On Wed, 23 Apr 2025 at 00:49, Jared Kangas <jkangas@redhat.com> wrote:
>
> Hi all,
>
> This patch series is based on a previous discussion around CMA heap
> naming. [1] The heap's name depends on the device name, which is
> generally "reserved", "linux,cma", or "default-pool", but could be any
> arbitrary name given to the default CMA area in the devicetree. For a
> consistent userspace interface, the series introduces a constant name
> for the CMA heap, and for backwards compatibility, an additional Kconfig
> that controls the creation of a legacy-named heap with the same CMA
> backing.
>
> The ideas to handle backwards compatibility in [1] are to either use a
> symlink or add a heap node with a duplicate minor. However, I assume
> that we don't want to create symlinks in /dev from module initcalls, and
> attempting to duplicate minors would cause device_create() to fail.
> Because of these drawbacks, after brainstorming with Maxime Ripard, I
> went with creating a new node in devtmpfs with its own minor. This
> admittedly makes it a little unclear that the old and new nodes are
> backed by the same heap when both are present. The only approach that I
> think would provide total clarity on this in userspace is symlinking,
> which seemed like a fairly involved solution for devtmpfs, but if I'm
> wrong on this, please let me know.

Thanks indeed for this patch; just one minor nit: the link referred to
as [1] here seems to be missing. Could you please add it? This would
make it easier to follow the chain of discussion in posterity.
>
> Changelog:
>     v2: Use tabs instead of spaces for large vertical alignment.
>
> Jared Kangas (2):
>   dma-buf: heaps: Parameterize heap name in __add_cma_heap()
>   dma-buf: heaps: Give default CMA heap a fixed name
>
>  Documentation/userspace-api/dma-buf-heaps.rst | 11 ++++---
>  drivers/dma-buf/heaps/Kconfig                 | 10 +++++++
>  drivers/dma-buf/heaps/cma_heap.c              | 30 ++++++++++++++-----
>  3 files changed, 40 insertions(+), 11 deletions(-)
>
> --
> 2.49.0
>

Best,
Sumit
