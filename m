Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A599C295DBD
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 02:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498044; cv=none; b=P/NKwntUJkVRaNnAe4g+8xP1rU7QKpT9Kfo1Utgm/PL6VSLM9+U6D2Bk3P5upUlxjdNCRPFdyLuF2MXu0m6k23EsuNVmO4WiYG9Qg9dmLOdZ4/V9CqeRoguYZ054SbjAZYRO2hcStyHoviebjcnj3EkZDf/rYVOmb+4bDRQFLs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498044; c=relaxed/simple;
	bh=pB/2z9gfgk2QzpmlM92q8FYnfovHFOn4LHn8HHtn3ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGO5VOrLg5m+RxI0ff4ymtVBhha+kyc12duCulC58TafErFg4VcV6q0uQuCYyQX1xJAkErv8uj56GCT5Y+MaHOWuDaurLi5hz7aKpHTVkkaansalwX9V2hXenCkfDROr2EuDf7tfy2bvMep90JZ+CXgMK5c0ZzyP3tY+BX9xXRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gfrsILBB; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gfrsILBB"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736b0c68092so4473825b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 19:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746498041; x=1747102841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YCRivcMyKZAjTDZHcc+7HA18fyk8T4lAA8XlsxUQKdQ=;
        b=gfrsILBBHx+up9yBXju5DXqKwSz/MMQeUd6C6UtCfmtCvjzCRf1VWLut1v644DXEvB
         hRSALIMzGS1Uyo5IQMx+omHlKfLuyEzx0K7XfxXFnR/jq+EU0oeNPchAKky5gSm8REAA
         J04iZKRcGiPPibX9D260oqUxvVQsxbZo4hR6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746498041; x=1747102841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCRivcMyKZAjTDZHcc+7HA18fyk8T4lAA8XlsxUQKdQ=;
        b=Gy4DX7yTKcjbBe38iKHJomncIPVkvIyLR8EPufLWiiAcJsvN9kQlurxa+iT78+tJ4o
         GfW32T/B358pOk4fPdPHgoD5Ahtc8fc1HhoBH70kCtZG67gFTOpP0J8ihoN6OA7Y2TM6
         JuyUAzpWB9TWOV3xTn6/qG2y6zkWtxHhJsauffhX7hEVROTNtZA24TsD7jZnWDGtwsKx
         EwU3NBBEgckZi3Uaa+iB8wSietMhFNhXjgZ2p/Pg+ESG07//Bvgu8Vtcsr0y9EwUrFEJ
         mf993/KGRIS9EZ1GZVu+umEpLqaPd67BfcMf23WDwXuNqqZtKaoX4Tlh8R2AfmMT/adb
         3TqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+IoPsBJA/qV2TDDcFVJ9enOUr8TNNJj62d9ehD+zTiMCZnrMFsBNEozMbhvdgux4yzL11od2+GE4JGng=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxDGMprpYcq76359uSnKeerV30gYS5OG3AQc9OIY8WXk25/ZfT
	jCC7Lbz/mHwBBP/qMbVj7OP+aYuSn68W+0N0QbE3Q117F/PUMgdDJ19rUv9Cug==
X-Gm-Gg: ASbGncvfsG3wl1C3lBndRPNQneC2GSMa7WqRV7H5rpk8P/hkiwOLm4m+HaECKa5GDru
	WpVG0T9vk8LU80vh+XX7VWWbAWQaCQWamXGcqnFEiDSMm6JOhur/JVQkOHFi+/IdD2EDNu3xySt
	hUjuK+Vx/n0JIc+ySOmwc2t+h5p99e6Q1c67hE0t9FcWQuGZ4dU+vNbUEfRcdpyi4g5OidGe8qU
	YEVgT5hF5LT3W9a0A2eV1Jz74g7XvjCqc8CYbV3wbOxwytnE1nB4zqtIpVO+tt5yR4U1NyjWTuy
	4DFzC7Fr+68j4r/BtFvf+1Q9Qqv/Oare5Cl048b4XgZk
X-Google-Smtp-Source: AGHT+IGh1OnULhXn2xtFUOqy1BCdiiwtDwGquTntDY3zBj6xTjRCCRtPqb5UQgHUOHJ7rl2HYeeMFQ==
X-Received: by 2002:a05:6a20:2452:b0:1ee:b8bc:3d2e with SMTP id adf61e73a8af0-20cde373ebbmr24382308637.8.1746498040820;
        Mon, 05 May 2025 19:20:40 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:4dd5:88f9:86cd:18ef])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c3bfabsm6327470a12.62.2025.05.05.19.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 19:20:40 -0700 (PDT)
Date: Tue, 6 May 2025 11:20:35 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bpf: add bpf_msleep_interruptible()
Message-ID: <6g5d4y7ahyjcrlixjkzwgn473klmdhib376q5vvvfp2kelkk6t@yz6sipuhe2lt>
References: <20250505063918.3320164-1-senozhatsky@chromium.org>
 <CAPhsuW7-jkU+KiunvZw9-NsxT+7ohcHQtJ6JSXNU4aDPxJLWwQ@mail.gmail.com>
 <CAP01T74_fCpuqwPpqs0tVWAUwO3rm6D-PRC0MZjiGyqf=oXRPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP01T74_fCpuqwPpqs0tVWAUwO3rm6D-PRC0MZjiGyqf=oXRPQ@mail.gmail.com>

On (25/05/05 21:30), Kumar Kartikeya Dwivedi wrote:
> On Mon, 5 May 2025 at 21:07, Song Liu <song@kernel.org> wrote:
> > Please keep in mind that BPF programs run in not sleepable
> > contexts, including NMIs. Maybe udelay() is a better option?

If we want to timeout various SCSI operations, for instance, I think
we need to sleep for seconds.  udelay() won't probably work for that.

> Or mark the kfunc KF_SLEEPABLE, IIUC the intention is to use it from
> hooks which are sleepable.

I think it is already marked as KF_SLEEPABLE.
