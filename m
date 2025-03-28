Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C3A18E25
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743161783; cv=none; b=MU196qco+erRSaVYLkB9+GxTaTfOzfQAWolp7E+PzuLWRE0qZbvA7x8HhYcxXLPWoTOa2Z5mr/UKVngfOG2NEuipZSNnunu6ZEsElygco5HGqLcXZpoSCCbMcD/KvE9+gSTmviX0BzLvnbI7koM5s7Y/XaTb1KplXlpaariueK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743161783; c=relaxed/simple;
	bh=ET074EYL50HSsDeaXyGaU0mb+9S3ItW3P13lTFuLZfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U4ZYvfF4ON1BPnLt+gQnRcFbXkb2R6sPfoO4zNm0OAUWloko5CpOjB4MWVNZVWFiHePUXWrm3CVDZ0D2V6vQiDke5pz0vYNpTGByFYUaHo6OJSZOuuGFdb/tfk0l3IegCH1ZzSNxaSQzSkqpySZ2z+8fgNpcRgw80uGYVi9RePk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=KQqEwOom; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="KQqEwOom"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4775ce8a4b0so35076121cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 04:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1743161781; x=1743766581; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ET074EYL50HSsDeaXyGaU0mb+9S3ItW3P13lTFuLZfI=;
        b=KQqEwOomJ+ZXwBLSwOEI0L6fOJSXh7DjwQn4YvoX6fauK9j0lruVye1iuwbYIZG6R9
         HG2EJ3psxWLUcYuU0DuZKyeboQaGJgKyMFJe+SLFWTBKSB4Q0an73yg0SqEnHFJJR0Hm
         CCmMMznZGX+MvdJq/LVSSrxWkgA7fT8hHYYuRiBG9nQgCFj7yTESQ1j92RoTjxwhT9ie
         EHEJHV0Y6HgZ5W71J7fgjtFfCFkm5eUGWW/1dyR85Zh6ISpDiZkFAIo2kVN/UKUH5eIP
         y0kdC13hclxn2iqfYR+QOwmGcfmSXYDjOI3/fcYDjIbM0gZDvpvc21tpdIQKF46PuUjc
         mRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743161781; x=1743766581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ET074EYL50HSsDeaXyGaU0mb+9S3ItW3P13lTFuLZfI=;
        b=bRannTrqpLqaB3GBatkfn8hj1ug9AAY47F1HDcLbUqguP8XzpcwZEKpbjGf3Kfi4SM
         AxPo6BZTYd1oZAIl1DxN64827vIe8cLRYWu9hQjXzUdaeewiysC76mShrEbgserBFyOy
         K4y2SGT5pmnC7OLTxew7pWtSsKiO199IRaEcAMwkopOlreIP0qr62IdAkQQURMX902Pm
         yrXvBOO9GjhJCoXK+h+zoDppSvDav9AvIXThpkMN1VqJxiYMBTCgEix/yYbxX2RfnzrA
         GL/kpBt/iI51a1/7kfRWbB++fLo/GvPCLvPynePTAx4/vIKWy6iYbb6crWAsLW3eE3W0
         OcWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiEPSlgA6eqOBUqw4Uu5o+0c7FfzW4iHZ8Tief2pvdyH24jxJnthd4YCXNFbbaGCLPEgVVOTlM/l9ZX94=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpSWS+3JKDU7mxlO4cRC+MAKBgXgro/4/pvLL7lvv9WJelDWV/
	IYGYL9j+DBUAYrRkJshwvyA94VuGdqGtsvyA6n9dTtJH7guG1kNHbWT3I/5Ahs6Vw41rqZDxSNr
	W3ySq0BfmhJFhvdR8K1gUhr5aVDb4OkOoTafCJg==
X-Gm-Gg: ASbGncuWNWDH8/RULvnxZq2CLQVcg3a+sTjmrnluwjecUlglw50f5z7HMb9k6rsTuvq
	hhRnnZ9hRsOXhDCFT6QtVztliSX33qw8Hf7PC0fYUKt+kZG268aJVtD7HRheGNNLNBJUGmjc1GW
	v8R7/akTufNWrjJS0bwPWPjclC
X-Google-Smtp-Source: AGHT+IGgZ+mLJodz0D+guvTqMFLeD09dzf+lw+ubZeqocR8L/AGvkeOetdVLhIiwDUZf+RYpUNyNpa4RIYpozR4orO8=
X-Received: by 2002:a05:622a:2587:b0:477:e07:4c5d with SMTP id
 d75a77b69052e-4776e0b2338mr128707891cf.19.1743161780705; Fri, 28 Mar 2025
 04:36:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328110239.993685-1-vignesh.raman@collabora.com> <20250328110239.993685-4-vignesh.raman@collabora.com>
In-Reply-To: <20250328110239.993685-4-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 28 Mar 2025 11:36:09 +0000
X-Gm-Features: AQ5f1JqmEJUT3tv3RAXr6WPZW7InZtdLNYmLZ4c8-tZqyom9CaQS986EPYo3Vgw
Message-ID: <CAPj87rOPHqLaFn3r4rkeMMrQ=OSRQUJ2LLrQ4ZDE6eA1S6zybw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] drm/ci: uprev mesa
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
	robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
	lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vignesh,

On Fri, 28 Mar 2025 at 11:03, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> The current s3cp implementation does not work anymore after the
> migration, and instead of fixing it and propagating the fix down to us,
> it's simpler to directly use curl. Uprev mesa [1][2] to adapt these
> changes. Also replace broken s3cp command with a curl wrapper call in
> drm-ci.

Thanks a lot for fixing this. Sorry the fallout has been so bad.

You can also upgrade ci-templates to get an s3cp which works again.

Cheers,
Daniel
