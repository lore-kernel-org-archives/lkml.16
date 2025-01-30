Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED4B1E8823
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738246884; cv=none; b=MSTpob0/oLVKVllYwpbJvynXsrsjWCpfuyLkSvcM96f2MhCR4EBtIYAMZ1fsOCltZFHRXH56FDXlXyFUKyIQrPx54o8qDFr0Sen8ZLhInHeP8GjjEOK5MAqm/bZZom1Wq88YToCo8dbX0aV6Bu+M0dv3SxzcrIlyks6paddqlTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738246884; c=relaxed/simple;
	bh=hlP0fLuRPUJSDcijkHX+KUit5h/ociTs81FNlrGzm2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttL2EXi9BcK01Zr/3pb4F6saiqnRj7WwCXkPRE/nG62YfhVXb9RCIGpT4/vAzx3HQY4Bnm1rnqoXBCYbQTrz1GcDv8+N+3FYoru/LiKNi492YMySLbsMy73sgP3zb3jk1CENfzuazkvoeazQgYN9zQfwlSh85Xc5AeYHtJ79S54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kSkd0faQ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kSkd0faQ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so1113823a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738246882; x=1738851682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NqhTfjT1zxbId5gVT3Fchb/kBjZWREIt51i3/gBR220=;
        b=kSkd0faQT3aJNYs5SDQN2Fi7fKf064pFVY7626Hsbi9LlFIK05TyU+B1vr0CAS0w+Q
         kTM5Wg2P7H6XNU9Gq9UZDHqllPZLrKLm4pBsXIDexvUz37ia7qXbk+HattKJNMJaUhNi
         j098w2oOvwhHxVNEkdkoJgpTYGatnbdagiyZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738246882; x=1738851682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqhTfjT1zxbId5gVT3Fchb/kBjZWREIt51i3/gBR220=;
        b=RLrC5mj0jHspXdGZubQCNosM1LodPkny0YUAO9pfpsFgm73358v8PEssrNrnxQuUlT
         01X1BKATNRxr79cokZjBwSyHwo5OW0D4Nnb/pUE1nhx/f6o9bzJR8HF8wxf1UH+wkomu
         UjKJFHFnwjaerBR5jq3IYkWxkgJGA27jOnWEj+KTdAxQdTMSl46+mmrvobhdlHZlS5cD
         DC2hfkpP80XEV/xVcp+m9eBgXZS779HSxWPabZQxW0iB8kYIq2xMcmL5ANsvszPcSolm
         3+9bWVDvMTwP5gcKBtnxnltGKT/stee/+pDuL4kUt68vmBHo5PytQ9ooGcVPkcR6Z51u
         Da5g==
X-Forwarded-Encrypted: i=1; AJvYcCV9DbPU4N+z1/JVQFKgrrQ1JMj2ZQ7u0Kg7CscZv4B22b/kIl3a/i1qzfG0V8tEgkYCxnzbM2zofXTn5rA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFH+3Dyye4evAdB2irgJYo3m1MavexCrPJ29F3/FtZ79M792PE
	EFeEQdzUatOdQMMJwsBlGk7CajlKPF1URuNmQlY//x9bhnOqQqPjps0/wTSjMw==
X-Gm-Gg: ASbGncuaH1XMWEUMumnYO/AQFv9cfZ/RHfi84rKcXQNG3wNB3venM4er7DdJJu3UXXa
	BL/jXgwh1EOJJka9ooU79arT3oO/sosVwniJSJSPY2dHmfdfLR09Rqt2mlE0A+edALuPWET0jYr
	XVlM/D54nED1c9YIsjfPJ9JB0pVOKYsNWb5BgxFG0Aizj0O1t29yiXeQpF8dm4tQ9kxgZ7R2x1P
	MvLUy/4TKqPDUbWwfjy+KRtTCIgTDyRQjIn9D7ZOvlVpVF1gggUMaZ4pZeCU5FH1PjBxrLsqiWh
	IjRDoBXyT3Lb1pddsg==
X-Google-Smtp-Source: AGHT+IEIDj0DKTRAcc46NPrLBSCskSXSvStIOyNtXISUhnAvpm3MYKwMCn14LOk1QaNxFmN53KGy1Q==
X-Received: by 2002:a17:90b:520d:b0:2ee:c457:bf83 with SMTP id 98e67ed59e1d1-2f83ac09200mr10220522a91.19.1738246882479;
        Thu, 30 Jan 2025 06:21:22 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:d4ce:e744:f46b:4fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bf93ef3sm3933996a91.30.2025.01.30.06.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 06:21:22 -0800 (PST)
Date: Thu, 30 Jan 2025 23:21:16 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Minchan Kim <minchan@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, Uros Bizjak <ubizjak@gmail.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 0/7] zsmalloc: preemptible object mapping
Message-ID: <x3b5fm2oecr5rlaytfpopbntg5mam2xsd6nnvvsgou2qxzegon@nsqfbkmhvnd7>
References: <20250130044455.2642465-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130044455.2642465-1-senozhatsky@chromium.org>

On (25/01/30 13:42), Sergey Senozhatsky wrote:
> This is Part II of the series [1] that makes zram read() and write()
> preemptible.  This part focuses only zsmalloc because zsmalloc imposes
> atomicity restrictions on its users.  One notable example is object
> mapping API, which returns with:
> a) local CPU lock held
> b) zspage rwlock held

I'll combine this series and zram series [1] and send out as one patch
set.

[1] https://lore.kernel.org/linux-mm/20250130111105.2861324-1-senozhatsky@chromium.org
