Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE1F1C6FE2
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695476; cv=none; b=KVTkStYci+GvevW7zlgQuXaFgdUhlbkWwI0FeoHLq1/+tzFLxLL0EN34qL5cQ7wg1r0HgA/HoRIdsaZmrjs0FZI8gM+QRjReQap1QaP5Rg4Dbp1iu6UVFmX6KWBkT0cRai/Qdt4rNsQcWCwWzp1AQquK7P/FXQqDJ+ibLNkWb9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695476; c=relaxed/simple;
	bh=R/KnCgLEH1i4D71Srw4baGTHNIy8kR35e86GFY54Goo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jvFY6MlSCZ6dUU7K2O8o0co2q26n77VGZZnFp/PKb7+BOzLBBOfMch7Ll4RV2pHkCJtog0WDUaOM0SEqlRPBelY0vJWzAuyesVOnhwLes1vvX/qSJlbmAIOOn3e+67ZDkggEv+NLGNuz+348uF5dUsvJLSlxn3G04GeGFINehCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=mc8NzojB; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="mc8NzojB"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6f5499c21bbso16650766d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 02:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1746695473; x=1747300273; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R/KnCgLEH1i4D71Srw4baGTHNIy8kR35e86GFY54Goo=;
        b=mc8NzojBZLPm4XWSEHf+uVpqzB50tiiJSvOqRQBYKOsKnmm5wZdhbF8gBcQynIVnYv
         LUa4eb9rcaRxuH04K3ov1nYkxsat1yP24BPNL9+21IVSGnLQrplkrxDEI7rfjKq0aMOp
         wkTEYeGzbrL2c2MVkZDmP/ECvsCqrAcWtDoVPphlYVsrm0OpVmVXn9I92Wsidk6XPrRU
         Udrs6WXAQokAVU4MKuVARVJs4HnF3IWc3Ar1OvAiHv2sPB9TuTj3rrAatSgEzwvPJPcp
         dlZ7ProJnSSgFbvBB608Uwt0bYI/dnWC6bRMfxp9AYBH58MVaKrWXgKdfNN0L/Yxjk1w
         ZPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746695473; x=1747300273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/KnCgLEH1i4D71Srw4baGTHNIy8kR35e86GFY54Goo=;
        b=ZTbWc5kApKTfODfft4QEZbDCx2cNQDEHBo/evtldeiRKmCcBY4s63MeiQK4PsUHpXR
         ykKcxsGTJDhdlj06+DN7npiBzaBdOoJgVbr+cogN/8MMITq6Nvt+kLYRS8U56FE/SSOT
         rrEXF4xLOtU8U52hp/4iL9K7N5PjvrsWPxBsuRGPxhydWxf8mfhYxdsEl7n89WwGO3l6
         sKA2Yt5RIvMkbYdU+sZIRl/lECnfoEOda07/rApzxAhXc4qTq+PRNQmM2EATxVgvHCdR
         qZw5sbq2bZ82PDRn6lzxT4tfOipqUgJmOZBh9QAFRy+NKP5hCKB3D96BnZIncXCAuUM2
         pR4A==
X-Forwarded-Encrypted: i=1; AJvYcCWU4qTqLSF3Ck4bYKpA2ukm4DQD3xHdtDPDUDkAhs/XgigevC9shn5hExphda0nrE31/RH9K/zx1s4Drts=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO/lJbPv1Ma2eYFK0yFKmHkyzAm2jP0WCG33PoVBLDHqNhocEj
	RvwtHY0B9OD2ySycqun8+RqQuepWidh0TmkcXknaGF03BRHjop77VwJtku+kfXjLPDvXiqcJEwb
	5PrixaB1hbQUkOvLwit1wxRGmEz8bEEYt5T1sLA==
X-Gm-Gg: ASbGnctdjCzUOQXqZWp6r/Y8fVMLTW4PJY3cnKTooPFQgDxALuzYAQvQdBix5lstb+S
	hYRGx1+aC9AzpRLjG+k/brGgFtd5HZYFeNWWlBfgEKs2nrLL2aVtpMn07Ok/LdP6YXHDaQ2AA1I
	iSaq/+qm9ZSKCr3Bq/OSpWZ3zqbbo0E2IV
X-Google-Smtp-Source: AGHT+IG9krRjL8m6Nqh8vBxq10hmKPFSkTpU7prTYgzI5+0oR0UHRvJLVw5g47iLQx4N0PZMh49KSVcmraCObtRcUSI=
X-Received: by 2002:a05:6214:202c:b0:6e8:87bd:386e with SMTP id
 6a1803df08f44-6f542aa2f5emr102817566d6.33.1746695473355; Thu, 08 May 2025
 02:11:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508084811.2472877-1-andyshrk@163.com>
In-Reply-To: <20250508084811.2472877-1-andyshrk@163.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 8 May 2025 12:11:01 +0300
X-Gm-Features: ATxdqUHI1TGK36gxgW3UTwFXlSUt0qN82uLoLuKNGHhJOVQj4yUNPKBYA-FhmgM
Message-ID: <CAPj87rMJgJaj8p_2DLdM8p3phB+eQnMm7iAHgEe_R8sjuGox1w@mail.gmail.com>
Subject: Re: [PATCH] drm/gem-framebuffer: log errors when gem size < afbc_size
To: Andy Yan <andyshrk@163.com>
Cc: tzimmermann@suse.de, simona@ffwll.ch, mripard@kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

On Thu, 8 May 2025 at 11:49, Andy Yan <andyshrk@163.com> wrote:
> Let the user know what went wrong in drm_gem_fb_afbc_init
> failure paths.

Thanks for this, and thanks also for using drm_dbg_kms() to make sure
that userspace can't flood the log with errors.

Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
