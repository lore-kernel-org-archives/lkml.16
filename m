Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFC61474DA
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 10:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748859942; cv=none; b=UV5FbP0lci50XVl2Tv5rUqc/TGJ4acgRtitvCarqQqF9FdNHlj4afbDsPKgsMvVDZL/yv5KqqpCuXNvMjBfR03BR+suQxCivzHiYWKXhskK2Cg+pC7BXYfgesnJ4JLteBYG9RQHg+foNvXm3hF5UAA/FsibebM2X+8bRrhkzZ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748859942; c=relaxed/simple;
	bh=7P6Y4GKB06s5F+Y/MFVbmu8Z9uqQTHt8g1UGCgyc4pU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3ZpdazDhd4VCEFxaSPCEG/WAgu1KTlfePCzjhMraIZWC416cmAI467R4YcWyaWBOs4ZAZ6nu9fX806l7LAFQR0Seu98ZzQwVo+pY+O006X20loShnVJaYjx8z0tsvlomql++hmzu5K5o+ZGoKe/2kX/Zbiu+Oc28d3IIjWuehM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b=PNbm4qZQ; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b="PNbm4qZQ"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e803de44790so1947874276.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 03:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1748859939; x=1749464739; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7P6Y4GKB06s5F+Y/MFVbmu8Z9uqQTHt8g1UGCgyc4pU=;
        b=PNbm4qZQw3L1GtFL16JA3+j5b9MPJQDPe6BLVzvZHxADG1f/sf1P0L3H3760C/Enkq
         HSmgULtLiAMMyiKDJiDzf8kQQxMmOQxMreTcltg76MTqwImjhuNlSg8hI2KUknkSijIM
         PwoTHDG9gT9OvIq4PFjhorQGi6uTHxcZ69JIvnH3Bw/STSFqAlgv1V2E/DhOkAHpVyiv
         +VNRRtK8D0I5iPkDtGPXqPjyd77FM5mAFUW5+RvH/Y2OBtF2pjz/aqpYGSdcQAfyWIH5
         LPaPRp56CJX2I5d9Ifb1P+jfZYtt2aCOhdxGzMQeF29d700q8Ov088z6FXEL2a2/4Dp6
         T6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748859939; x=1749464739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7P6Y4GKB06s5F+Y/MFVbmu8Z9uqQTHt8g1UGCgyc4pU=;
        b=pjaETRP4G7G1IFInHyadcbGgkkQ52dR+zemCGX5azvrV7pmf0KtTe0TwrXHZY2tnC9
         B82rzIP90uQjeZzdG7AA7ve09YeyHkZJ6eg6DqYailRi3OXUryLv+s6mD8zd2iRr7+Aw
         qri2LHv35WYmW7NjQ6dUSO3RUa+DImA0iJ0/UPQF1gZOe4HZ3D9S0j9zVo6825KLA3rj
         l4NETVoUXnrugk9zJQZ5aWj5RPLcO2hxxiSMGuSq+MJOTt8T0HQwrMGY0t7PvDBZQyWq
         /Y3BDkvbrrlChJl8/YmxXRiXQsxJctZfG2snAp9BskYbY/X5rZcIsoWUYZNow073A5TI
         PYiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1Wo8HQOVNj0XITZPTHMiu999OZsPBAMZKPqlnCdBapCWPAjVo1vOYIwnyNiNQdPZqG8IHhtsKHWoj61o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYhL/BWhwPUZCLvsUB65CMWyHBXrIX+7T4qDiBDwxeMHe8sT+4
	n2EFfaJ9AdNg4OYxjjqVeblq71/NKI4BjT9wCGdUwtlh43wZHzEw3uSggpvhFeRbyVEvQuBDpmH
	mbmsNAUr980hWW9XkoNRxEOnRFR0UGmLBnGH56tjwsQ==
X-Gm-Gg: ASbGncsADx1fw8WrGNoWQecwzL44S/k75E0ejB8Dd6m4T3ugjAsrV7u+FYTHGl4luIW
	mIT8ZmxkSTN/nX3x2zml3NOfFmFzF1PxrotlCrugr8pvySE1NQr8P/8WCSdr9WdpzrRAvg+Q8np
	E3tXOmlHV/7XlMSqNwKjCGKkzR5tcVYDMXGw==
X-Google-Smtp-Source: AGHT+IHgf241/+XooGY+7VQxGz+QMtTXcq1pcvUD9HmfJ7+OM+oqivNr0clUSJ9p7Kt8etwmmS/GC0gaf+rJbhU5LW8=
X-Received: by 2002:a05:6902:120e:b0:e7b:3d15:10f0 with SMTP id
 3f1490d57ef6-e8128c58284mr8454809276.31.1748859939384; Mon, 02 Jun 2025
 03:25:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107140240.325899-1-philipp.reisner@linbit.com>
 <942c02f2-6496-4406-a73b-941d096aadfb@amd.com> <CADGDV=U_7CdkdEiLX9kj9yHsXhwb5zP_eGXpwmrj20cmgzMAtA@mail.gmail.com>
 <eb5f3198-7625-40f4-bc23-cac969664e85@amd.com> <582e10673bb749f18ebf8a18f46ca573df396576.camel@redhat.com>
 <b055ff59-4653-44d9-a2e0-bb43eb158315@amd.com> <DA7PC2LNU79K.28KBFOL3MGI1S@kode54.net>
In-Reply-To: <DA7PC2LNU79K.28KBFOL3MGI1S@kode54.net>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Mon, 2 Jun 2025 12:25:28 +0200
X-Gm-Features: AX0GCFuYwA4pxqr2zT4Iil1JuDkN-FBXLdtD9OExlZ-E9pvXbkNRDtWL20NsXrE
Message-ID: <CADGDV=WJjcLds5T1uAst7ctOMbApnLR6ixH8wvgvKvF-YS6kog@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Fix amdgpu crash upon suspend/resume
To: Christopher Snowhill <chris@kode54.net>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Philipp Stanner <pstanner@redhat.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

Hi Christopher,

Thanks for following up. The bug still annoys me from time to time.
It triggered last on May 8, May 12, and May 18.
The crash on May 18 was already with the 6.14.5 kernel.

> Could this sleep wake issue also be caused by a similar thing to the
> panics and SMU hangs I was experiencing with my own issue? It's an issue
> known to have the same workaround for both 6000 and 7000 series users. A
> specific kernel commit seems to affect it as well.
>

I posted the stack trace earlier in the thread. The question is, what
was the stack
trace of the issue you are referring to?

>
> If you could test whether you can still reproduce the error after
> disabling GFXOFF states with the following kernel commandline override:
>
> amdgpu.ppfeaturemask=0xfff73fff
>

that disables PP_OVERDRIVE_MASK, PP_GFXOFF_MASK,
and PP_GFX_DCS_MASK.

IMHO, that looks like a mitigation for something different than the non-ready
compute schedulers that seem to be the root cause for the NULL pointer derefs
in my case.

Anyhow, I will give it a try, and will report back if my workstation
does not deref
NULL pointers for more than three weeks with that amdgpu.ppfeaturemask set.

Best regards,
 Philipp
