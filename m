Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1746917548
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 21:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749157412; cv=none; b=AyQRpb6tdRNQIyCQws+gU4OlVi7PVk8MY6zAGWjLzVRRGAkxsEgk6Frk60WOG5mLxEC//tK+R1U+8v/xuKt4T9xQoJWjd/Oj4ksjCshRfbVP+Ehi79qE2/JIoTC+gFoCLIgQcNAlAIGNb3wSWsnUjQH8TYRkMi+Qt/AhXGP0PVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749157412; c=relaxed/simple;
	bh=hPeudKWhQ4RbVYkTTt7D3cuJu5GzpC7mlVjqr+LrW3E=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ctsaXihEk0OhbeNqB+woe+Ud4u84+sSxH/I1XaYJqKsXoB0DKudchnJAvwE68ir40uhcSGMTG5mmg5UWJEZqXWKWId1aEkkoHL/LOhTaHwrLSHaxRa/sghF7uaIHLu5VIyHvBglpsNIYrTqhmL1ITMioImS1YVgpoiV5ymLQ4WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maine.edu; spf=pass smtp.mailfrom=maine.edu; dkim=pass (1024-bit key) header.d=maine.edu header.i=@maine.edu header.b=OeTCyz3W; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maine.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maine.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maine.edu header.i=@maine.edu header.b="OeTCyz3W"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6faff792f9bso14105166d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 14:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maine.edu; s=google; t=1749157410; x=1749762210; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yYv/BBqpPR/j3uwNGj5iM8dPA3cPsdOTHli866hFVas=;
        b=OeTCyz3WbpKInG3GBWQDdzDtcMCYGK0EYkMwYCJc9Rd6CgJfTkeiq1UAdXBRMpt19P
         km8kWCtwLIzf9EI9tUEX8SCvth1OAoKDFVuRLzxCWoWoa6dlSgQm8pSywFnKZ1IgWSP3
         ZRTTge0LLRFXwjkwWjlohHBJ1NxGRJFQpoU5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749157410; x=1749762210;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yYv/BBqpPR/j3uwNGj5iM8dPA3cPsdOTHli866hFVas=;
        b=oOdt0ZmCN7UrnwF0U1CGo3YGBTu7q/Nft5j7IiZ3vPXJD1vWqKT5wFxAPDuX1RZReT
         TFyim8P5fmiRGDEdi0glLefnFmRL59SIU+huM2xU194XG5A4xedp+PiHfSdgqRaZIQFa
         jMk3QrBfZbZS6u4t0xLLgHZ7rlxWmP2D86LPDYxx8N3JFcl1/S8BkMVM9OGDlgvraF+v
         EXsOrK1rt9V+aXKuaKZYLy3D46Js6etbV3F3gXf2oGH/yjh1ADI57EOA878iR8Y38+Oe
         wgGvWUULyJqfYRZ/TO2BYogL0xqj88b2q+Iy04Fp5Rg5Ipab89lXp3ab0Da4gisIVRWx
         XL+A==
X-Forwarded-Encrypted: i=1; AJvYcCXq9QlG5Uvf2E7TdghJyNxkUjCHVi8xZJjyztEfu3WyU7mt1u/KumBuxQuYtB+eJIxvCp/lQxvnWt9sxsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxUWdiPdbq2m7q0i8hjSJZEKiGRjjeTs9NJAyUQY9BPhe6wIkm
	4f1ZOEo2LRQQ3xI9wpIdRyMJZ3/kBVvVqCmbXnnPq6Gji5Y4WVu9L26K2Z0gs1Xtss7ZV7Hw7Ux
	ybuk=
X-Gm-Gg: ASbGncs4/V8L8ZHax44Jvrf6P3nuJM67Uzvv2qx4oE/UJed8wvQ14PstfktIdC7Zb1e
	8LlBenvWQC+LMYFoXb8rxfbnAdR84QqqFXcjiDbqdVsIQrvxAoDJC7wT2W+b7jUmbZwvT9o7r4w
	O176vHcRaKmoouc9K5WDEPGFTwQd5b/m5KOR2d6Vm8U2z71J4qYWjtkcevQtCWnWJ43rdEfQX2a
	x8aE36rEXtqnRNMjvZSahrge3hHcWeW4PES8f/QOm7PcNOyO9SPrKZ4w1Gxk6OFNfLSl0RaA4Nw
	RkjukEXqRi/UMD+EcDA5PTQT7fwh2fHR9fZqXwS5epX4k8SqBYwRKauoKVz2O67gu8o0PiY=
X-Google-Smtp-Source: AGHT+IFbnGNEIN/7Iacj9GEJZ/AzfVbRazHzR8ojLNpScIs9K/r0gWT4rEk0OkKS9cjVlYMEz1VS7g==
X-Received: by 2002:ad4:5f0f:0:b0:6e4:2e5f:c03b with SMTP id 6a1803df08f44-6fb08f655f8mr15482596d6.22.1749157409918;
        Thu, 05 Jun 2025 14:03:29 -0700 (PDT)
Received: from [192.168.8.146] (weaver.eece.maine.edu. [130.111.218.23])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09b366f5sm500916d6.117.2025.06.05.14.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 14:03:29 -0700 (PDT)
From: Vince Weaver <vincent.weaver@maine.edu>
X-Google-Original-From: Vince Weaver <vince@maine.edu>
Date: Thu, 5 Jun 2025 17:03:28 -0400 (EDT)
To: "Liang, Kan" <kan.liang@linux.intel.com>
cc: Vince Weaver <vincent.weaver@maine.edu>, linux-kernel@vger.kernel.org, 
    linux-perf-users@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
    Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
    Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
    Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
    Adrian Hunter <adrian.hunter@intel.com>, Chen Yu <yu.c.chen@intel.com>, 
    Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [perf] fuzzer quickly crashes kernel, possibly memcg related
In-Reply-To: <b07f0716-c335-4b6d-bf49-26dd24015d10@linux.intel.com>
Message-ID: <bbd92696-a413-5440-eb65-e2caed0d6a98@maine.edu>
References: <4ce106d0-950c-aadc-0b6a-f0215cd39913@maine.edu> <b07f0716-c335-4b6d-bf49-26dd24015d10@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Jun 2025, Liang, Kan wrote:

> 
> This should be a known issue introduced by
> 9734e25fbf5a perf: Fix the throttle logic for a group
> 
> The patch can fix it.
> https://lore.kernel.org/lkml/20250604171554.3909897-1-kan.liang@linux.intel.com/

I'm testing with this patch and it does seem to fix the problem.

thanks,

Vince Weaver
vincent.weaver@maine.edu
