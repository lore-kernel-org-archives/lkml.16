Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4D91E7C02
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973311; cv=none; b=H0T2SufA4EkJHI6pwhboym7moJqUPIRM76xkDwvhv6zQU5hL3s1f5INfPN5H+qOlMUpZpG4lykPCN1RBf22T/OmUm3KSTPa8sfstx+LUr21+OSqMSGPJLEGZHMIwc/A0O+JrmI/3gX5UyIcMX9cFkE8tHLse2AAltdmz3sblt04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973311; c=relaxed/simple;
	bh=PeA1Qh4bkXWSr5eOgWoYNNwwFBUKo3wxQufc3Ve3xHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L/7c+rfVAydNpiuMSE3Hc5Jlo5tF3F6wbPuE4UUZJslfgUL6OaRyrIxmFvjTlqLLJfFguig6MavREFSjDAw/yZQvc8Us1JmAJX0t3lDnoXeCon6jr9Ft5+XmJwe0weqOiUAv9EZ+HLabZ7fkwB1/mqmPIJA5Ej0KESSiAaWbECE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bVx9BGyn; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bVx9BGyn"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60461fc88d7so11879696a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748973307; x=1749578107; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fC/6H+NAYLMVj5GzwzsNQxA9cPRU1IAN6ZNdrc7a8/Y=;
        b=bVx9BGynQ/Hl08LxiQqaDraQbqGZzFE7+tsdORJCdni/8QTbh8uDtgCLxVcf7thqxa
         H25I4nz+9hO2Qyynbhy3QeVz4ks6CmsRz2x/BR1PzhlO0AW8kaW1CQ198OlF2TX1XRqh
         8DjdGkgulek4V8xc22VGGV+nqjaeXUEDM7jOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973307; x=1749578107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fC/6H+NAYLMVj5GzwzsNQxA9cPRU1IAN6ZNdrc7a8/Y=;
        b=k81I45oKsExkK05tEYx9cyrME5jqjYyiwp7pvlAtFK6h1MToyWtsW4mCsiL27wit6N
         DEzjbtIeTO6NT9OvWYI4Ttcu3ZNnQgWm2UVf1OWypIYoDPi5xWwvlT2iw2tn7cLbhE4S
         SeH77sVqkiDrHBoIoYvnLxg5kHzG7Rh+XCYPy+nleIttzxlmt8XnuwVUQahGWXNVdi5a
         UGdnkKvgsFoR7VQ0OJxAwKeGhTnNml4RlTI3eUc/w8N0LKEl1PZn4WZ2oTUrrgiWyTLN
         Q9wUVXi6ysU9Lpn4a9wSVkU9IH/dWi6GbGqomgA3jTGGCvwbU2XOwdnTvEuiwbB9eTca
         ZZiA==
X-Forwarded-Encrypted: i=1; AJvYcCVDq5HYnFDGflXgjGVlSO3d2TeqZk7Y4gGqC3tGOuRQLDUqVx8Bs0VPNJ4fnmmM2ztWkx2X9jv7BysEemk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf+Gmt6qKldgEboUgdHP+X/tYpBMFrjH11ETvmUc7LMK6NylQR
	F0qZUmrnau1fVKfWIgBvhoqTr7Jxs4UyeFp0g0S7E6PxfutYrjZ9p5yTT66JFJiygR8AyMbS3Ud
	Tw5Q52K0=
X-Gm-Gg: ASbGncuwaNpZobwhmWoGEiPqoMG74nbpmmVlYJB4DQhu5yKdyDYjomCKmg2KGJHMKA1
	08KY6ZTaZKdi0HE924n7F1Vr0z4cTCLLpbPV1uJYNi8R2PFtn+GFp8eSJdtfqG8xx22vDln/4Qy
	Bb2BQ+zQoQJkp3E759YdzWRZ7rT6FQ7eMqOr7Z5HrgtMOUIiG+xGbUDHe8LYeuCp6B3D2AUMj5J
	RB4/73Ixc+8EPQc/bZOtt2PDOy5M30GNJK427DG5+sEg6QrjLa8JI5PP5orJgDWkA4IIm1w4kyy
	VLpzUwbRbv7wPA1hr6nuKhb71MQw7v0XShxfSQvudbGXC3TSN7t6Elfl1EgHO/Wm+qIe8eVnguq
	i46VwnECG4ynzQJPTnPRff7uO1Q==
X-Google-Smtp-Source: AGHT+IGe+MMiX48shXomTKhKU9ipuH8LaX6KmgrUskaUvMx3Mh3Z9CkElgjKNJY2Ypd31isZQH+IVA==
X-Received: by 2002:a05:6402:3513:b0:606:a08e:b8e7 with SMTP id 4fb4d7f45d1cf-606a08eb9a1mr5198630a12.26.1748973306775;
        Tue, 03 Jun 2025 10:55:06 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606cd1d62fcsm578314a12.37.2025.06.03.10.55.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 10:55:05 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60461fc88d7so11879644a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:55:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVftN7rzv/zzAmJI+fcR/vuaGF5NCq1vwVcYeDz3EBixcmb8RmDXgP2u460EAGYQ7+iHeriWnwtzSMrGxE=@vger.kernel.org
X-Received: by 2002:a05:6402:1d4b:b0:602:17a1:c672 with SMTP id
 4fb4d7f45d1cf-6056dd5cd6emr17985307a12.8.1748973305522; Tue, 03 Jun 2025
 10:55:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602170500.48713a2b@gandalf.local.home> <20250602171458.7ceabb1c@gandalf.local.home>
 <aD4boBrdZXtz_5kL@casper.infradead.org> <fc2b6a94-bd2d-a5d9-c935-381a1613f47e@google.com>
 <20250603102959.20c85adb@gandalf.local.home> <aD8iL4cFoXpIVK_0@casper.infradead.org>
 <20250603132736.554f611d@gandalf.local.home>
In-Reply-To: <20250603132736.554f611d@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 3 Jun 2025 10:54:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=whb2rMUCGsaNQC4pkCikJ7iX2_Tc1ye5_a6R9-vAkd2Cg@mail.gmail.com>
X-Gm-Features: AX0GCFuRcH8vVPhe4YXVxMZojF04nrgUVpEyUgoXeIKviV3b1cQy4lAyiTFx_xs
Message-ID: <CAHk-=whb2rMUCGsaNQC4pkCikJ7iX2_Tc1ye5_a6R9-vAkd2Cg@mail.gmail.com>
Subject: Re: [PATCH] mm: Fix compile error when CONFIG_SHMEM is not set
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>, 
	LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Christian Koenig <christian.koenig@amd.com>, 
	Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, 
	Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Jun 2025 at 10:26, Steven Rostedt <rostedt@goodmis.org> wrote:
>
>  config DRM_TTM
>         tristate
> -       depends on DRM && MMU
> +       depends on DRM && MMU && SHMEM

Yeah, except I think you should just make it be

          depends on DRM && SHMEM

because SHMEM already depends on MMU.

That said, our docs already say that if you disable SHMEM, it gets
replaced by RAMFS, so maybe just having a ramfs version is the
RightThing(tm).

I don't think such a ramfs version should just return 0 - much less an
error. I think it should always redirty the page.

IOW, I think the "ramfs" version should look something like

        folio_mark_dirty(folio);
        if (wbc->for_reclaim)
                return AOP_WRITEPAGE_ACTIVATE;  /* Return with folio locked */
        folio_unlock(folio);
        return 0;

which is what shmem does for the "page is locked" case.

            Linus
