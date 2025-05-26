Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF10A2DCBFB
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 17:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748281567; cv=none; b=QG6PVZGR+BMY1Qt1r+M/NBbIXbzlmTVUxKUs2jAgYg/St5VtzfMLynGmxsaBvkz3DNVOsGETj+Fte3kIckbKPEBCxmnvWQCcIxZWmb6o4o61dMPISqiz9lOQh7UicQCmteIYfOulFde1HkgZUZ8jAvZBskK/hjSsCoqk1lseVk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748281567; c=relaxed/simple;
	bh=Rq9/3aCOUwohSbNkJLhOOSA8WRStZcP1e2RR3X2QZcA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rsWqIiuLw4C2D3MVo3HcI9RmDGtECtF6vH6Tj0ihez/OJHeFHHftiDWHzWzIydS/MfA4fVK8sdqJwKO/l5TfaJPKoZZhY2L1Fx3BiEpTZ06UGy+ZIgBJIUky0fxXdDmQskeffXdHp9aeruaYsuGN33QJ+84erkoPDW+Ho809pXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVUtZbMj; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVUtZbMj"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2347012f81fso11746465ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 10:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748281565; x=1748886365; darn=vger.kernel.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F7qumZUcoGtX38Cmc4lHFRFFrnEuMPICmiWU+876mek=;
        b=aVUtZbMjTUyqS/Z2EPOS/pI8wPn2/B8uXwzO7Z99uqJtrpDs4cLsqL/cnUeA5xnY5P
         0Pv6pBQOSUZG1YBSk0d/waXkqZSTTkAT4V7JRBGJfEbOBDWBWVbrTShNOa/cwKVm3Ank
         vQPpi04GrQDBYvHXuYP2zzIkPVKTGNRVN0UVQ5tN8OxXFwUCnZE0yZLPVSV1Evh/cnAq
         Cc3qDpPAv6orBprnytXnr96zR9/2DZLSLPoLFe2OmJhSEa0PRhmnhA12fwjaev1ORfkb
         vZW12uLq0wpwI/bVFsW0hzlRrvkt+XbpElMvE5e8A9bFZv7DhGV2oCjydm/KLxl8TyiQ
         KECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748281565; x=1748886365;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7qumZUcoGtX38Cmc4lHFRFFrnEuMPICmiWU+876mek=;
        b=GbUA5hyGLxCn8Cn5GfJhGSijh7cxHbab6Z5mchHPBXJVeEy4YlsLoHkIRVxr+fK86g
         4V2n4Iey3bMdPRWZ4JmEYiV8RMOUVHdfvKmhBr6atB+C8m3q8Y2YTyfisD0bGmtCFnuJ
         r4O5Tnf4d0a5l26x6J0PKMvCsdRdq7KtI+CvjoyJB9XH5jxWXyBjYTSfeh1qX3xjeRmg
         Taczv/0HPef1K0bUNabVk8SOvVihur/E4aXAWxFHEUJ8l8KE4cuIAeNffbAeH1Khr5O/
         ARyOT9InVg/OLIaSbpFOA50kB39ifd/fM4vVYu26GV1ownPASORuopdtRDWjbC6/Iwd6
         KjMg==
X-Gm-Message-State: AOJu0YyHrZJXPcuCGLKwd8w02hWGhjrF1rsVs/GC68YcSSRJV1btRmII
	3rt/SxphtzWt8Ygiu19HD8weLfhARI/cJOLYh//uPLKTVNYcI/YU1m58Qaatsg==
X-Gm-Gg: ASbGncvXOc8YE0RqDHCBcx/lK6EzZSAL/S8KirQPCEdP69rKWWAXqtzSY8l0eJoVDA6
	bphVq4NoLqZonsj4Q6sgA2qTgKeKd8YbzCL+99zdl112mhkYwxxqp81EXTm1EmYO+MIhjd3Cg7N
	5/DceAy4Mr3FUfbgTv8gORKtSnlZWntIriEcjHz5dKFyR3G1swl92ZynhR6MzBb8jK/bDEY+YFp
	rki+z+VHBRsmyQZQ9eskiREErlL+Jw14y1dwf8C5zFw0osW7jDsImJ9TFzvsP6Hbw6VOb5B/eSl
	fXZhPDgMY/qjjsLGw20Z//7Wj1ZPLQU=
X-Google-Smtp-Source: AGHT+IFthzvCyxbSGN9QIV29VfCwGvMFZNWGHK5Y+FhrLC7STTy8cxJ0FLiteLjAvqyLIuKiRvzXkQ==
X-Received: by 2002:a17:903:41cc:b0:21f:1202:f2f5 with SMTP id d9443c01a7336-23414f34c83mr125064865ad.8.1748281564965;
        Mon, 26 May 2025 10:46:04 -0700 (PDT)
Received: from fedora ([2601:646:8081:3770::9eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2348a065cb1sm8035745ad.143.2025.05.26.10.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 10:46:04 -0700 (PDT)
From: Collin Funk <collin.funk1@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] groups: Use bsearch instead of hand rolled implementation
In-Reply-To: <20250526002519.GX2023217@ZenIV>
References: <ab5708c1e35e1b2a54a1d83fafda1b3f8fa01103.1748218528.git.collin.funk1@gmail.com>
	<20250526002519.GX2023217@ZenIV>
Date: Mon, 26 May 2025 10:46:03 -0700
Message-ID: <87jz63jmec.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Al,

Al Viro <viro@zeniv.linux.org.uk> writes:

> Careful - that really needs profiling with setups where processes have
> a bunch of supplementary groups.
>
> It *is* on hot paths, and while the current version will be inlined,
> yours will do a bunch of indirect calls.  These days that can be
> costly.

Sure, makes sense.

I would assume that gid_cmp/gid_lt/gid_gt all get inlined no matter
what, but I am not sure if the conversion to 'grp' to a void pointer for
the generic bsearch prevents some optimizations.

> Reducing code duplication is a good thing, but not when it creates
> measurable regressions...

Yes, that makes sense.

There is '__inline_bsearch', but I'll have to do some expirementing to
make sure that gets optimized well.

Thanks,
Collin
