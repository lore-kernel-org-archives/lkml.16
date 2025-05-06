Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4192027F19E
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746539816; cv=none; b=k0BjHT8JrIxzr9sqzuefh08zihzvkh8CgI85RC+CR4Mg/pd5mQqplfZSoOca7SutznzLdgPDSrP4ozpLxC10HaiCMyCgDSsXScr+WM/4GomeexBX3x7dJ4jjYKT8Hf1qfDyWzzXi5Fdl2mfGGfcfhNXNAx97ULtXF0fSMuDCi5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746539816; c=relaxed/simple;
	bh=diuTHdg9wH86je35PAf/oPFW74sGs6JKnCKwxE06PsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdjK9MIxtbSu4ibefYA/uCRMDSmKGCwIjh1SeRVRbNZys71NfSm6XcjkrG/BXPF1LWVub3aTA9BiQN/9aagskE5LeS76nWmS8tpi1QOCKHM5zXxxSsi8iZnBJbpf42XF7jGiZi0v8CXs7eIJd6hLk6XyjBU2R0BOadvpR+8Y7T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=xiv0V3pp; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="xiv0V3pp"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-47691d82bfbso11410051cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 06:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1746539812; x=1747144612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aN2vCmnMOiTJRd2NcNvbHVRm+Ax5/gKsVJUXvhmTYu8=;
        b=xiv0V3pp0l/1/UgPQaNQXiGsXnKvvgJ14lIIF1YxYa+blDzmEonvgWuC7fw7FdRA2O
         l0K57/DMpbJs9jNNp1DlgTXF3MuqZJhNO599cYfhpdj9Hj4eM+E7xs72M8KpErz9DFV8
         FbNgPc83/9YQuncqvCvMcjvEO5I5qs2Fuaqntdjeuc4MIruAGx4giiPxKrLC+avFvZHl
         gha1Ww+MP11r29vK4pIzXkNsHfhDGNH+4nmqgblgdITSZMWaa5R+mFsi/TKPZSUsENG6
         59BcYKnRjLbEnmBP3h9TFZJqRiNuLLDwfDZlArnGw+5vHe4QEQOMeB9xZj3RSDPTQBom
         JuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746539812; x=1747144612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aN2vCmnMOiTJRd2NcNvbHVRm+Ax5/gKsVJUXvhmTYu8=;
        b=tMNhhsE3cfBtERSTTGpejGsh1CiBZXsaDNyraUYtDrPBt/ieUbGHMd2VrPb6u6SY+U
         t7v+9AI+dvknjrssX0zEE6Euh3pOvM3mAwlOTK2nP5e6yM1jm/zg4d11W+NINPSGdfE+
         o4Ebr5te5z72sFxPNFPy8eqztXW7Ys1bieOFq/z9UvtbyJv3eyA8fjouTmVDHQgtK7ll
         atkMk8uPKGafsMs552PuyVe4SWU1wgL8MOYLjcqkGh496D3ZRW6wx8Bkpu4s9xMRRRrs
         YCuNuT7q3UYqtQoB8i3kTmcZmscHuRqv4AgLTivlbGMCM4INPF20xT3BfvutyFsKs2Mj
         LFTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgozkTYilmoGsYSjOV9sO36rVcoQp6kWyih6T9WDelnfeiwQgNBP5Isa7SuaC7NuoAAYGwI7s9r7txgf4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9464AwwZ/xmLLAJvhOM8GtPK6sQQmES2snAL9YJzyZZ9vboh8
	Bsl2Io3FbNtLHbob8YTaaOIEUwi0JJVfpc15kpNE5MGZiY65V6bpwtvzjeUhiNU=
X-Gm-Gg: ASbGnctJ1hPBk9vCXBviopEY94TCix1oaGnm8kBeUXC+fIxOVGttUCXE0ne4U4cxgIW
	OPNLhIVScpPyIkenS4d9/cemn+1+8cQIKfgyAvMeNtjAPSio6E7PllbwWZGirXiZAf8Jdeuuz3/
	G9B91XCWtTg+xE7oa6Nfw3g7rAQwi5qYH2FizIW/qHnHv1VmXeA64OzHftv9w3pnzGcyrZNPntW
	Z0iHgUP5BO3Vf7d5QFZabV4xGZkg/6J7bMiN84LUOvtqUaopvcw1fnqb9Kd72xkNT8RI0bIWn72
	hTxH4U5O/j5UU6whjpFwPd8QsYNcnXKuQpIf+3o=
X-Google-Smtp-Source: AGHT+IEf4MiWHFWj8hzchKZtX+h2HhYFuraa3E7oJqsE/qGwLNoxGmCiP394t/DNB9Ph3/h3uXyTVg==
X-Received: by 2002:ac8:5dca:0:b0:476:add4:d2c0 with SMTP id d75a77b69052e-48e00e67234mr190077851cf.35.1746539811949;
        Tue, 06 May 2025 06:56:51 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-48b98721c92sm73164021cf.55.2025.05.06.06.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:56:51 -0700 (PDT)
Date: Tue, 6 May 2025 09:56:50 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Vitaly Wool <vitaly.wool@konsulko.se>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Igor Belousov <igor.b@beldev.am>,
	stable@vger.kernel.org
Subject: Re: [PATCH] zsmalloc: don't underflow size calculation in
 zs_obj_write()
Message-ID: <20250506135650.GA276050@cmpxchg.org>
References: <20250504110650.2783619-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504110650.2783619-1-senozhatsky@chromium.org>

On Sun, May 04, 2025 at 08:00:22PM +0900, Sergey Senozhatsky wrote:
> Do not mix class->size and object size during offsets/sizes
> calculation in zs_obj_write().  Size classes can merge into
> clusters, based on objects-per-zspage and pages-per-zspage
> characteristics, so some size classes can store objects
> smaller than class->size.  This becomes problematic when
> object size is much smaller than class->size - we can determine
> that object spans two physical pages, because we use a larger
> class->size for this, while the actual object is much smaller
> and fits one physical page, so there is nothing to write to
> the second page and memcpy() size calculation underflows.
> 
> We always know the exact size in bytes of the object
> that we are about to write (store), so use it instead of
> class->size.
> 
> Reported-by: Igor Belousov <igor.b@beldev.am>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Could you please include user-visible effects and circumstances that
Igor reported? Crash, backtrace etc, 16k pages etc. in the changelog?

This type of information helps tremendously with backports, or finding
this patch when encountering the issue in the wild.

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
