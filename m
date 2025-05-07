Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388FF258CC1
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746619600; cv=none; b=PE1sa12lhLKtr24hrqug8zqZND0Pr3ufGprUmWcROXXtd8x7jTEJ0eZF7nDKD+0shxihBu8Qo8GkrF7TMqbmbKq02mt6ZUAqd0FWwmq4cPRPrnKwfW1oTvLG9EZ/bCFUudPnFZjHL4r552ADE1MYVbkSCHp1G2JyDpZ8tR/pGLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746619600; c=relaxed/simple;
	bh=bZoO2jxC64CtB3eROZHBgf0N4kFEXtsSReBN+E/atLw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oLVRSW/roHq3ldEk2W7J1GDUYgWbc33r4ZaeJshvvZAssgXEgzhHCeB+JmzdeQOvfupo1Tq0V/2E6obOQRLxq/KHi2UTIjyFyQEUpXzz38dY/w1gj3OGzBetV9SLjck7GkhgjbrM1u6oP7RfUg3qNIIJBXqUCsOlB3BnrvWq/3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yh/jWaDV; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yh/jWaDV"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so45278425e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 05:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746619597; x=1747224397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9kghykG29WfM/5QurOmGS2Z0jr56p5eKv8MqxmLHkg=;
        b=Yh/jWaDViPSV7CGPQSmt3+a1xq34T8we1Y6c6MD8tZ1PSZ1x2ZLXaJ3I8Yf2AkE3fH
         3x2TfCCB0CflQk1dSwkHnl7kkIpm4KIp9xrTWfU1Pq1A4kqnJ4bv++4No2rVek7fsgOr
         6xOEBAfN4tJZdFQo9Fmp8GaLr5IsCLDnB5Vag/2KfqdaNYPXCiBeiyIbk4dOYrtdnI6y
         gVxel2APIgUxd1/TzXFDBz8PMXOarHqI9VLpKLEdxi6+I3dg1XoSpXIwjuNgaEAnpI4X
         s1TPf+PbimANNzc/R/TNOxIoG+/0IcZyNhO1QvAhLwGpKSHrLI1UG91IC4Dajo6XFQBW
         ++og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746619597; x=1747224397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9kghykG29WfM/5QurOmGS2Z0jr56p5eKv8MqxmLHkg=;
        b=aSK4WZJbmMBk/oEeEkmWPBfyeroWald9yUf5F+5uOOzwFckXqrG0eySFECtFLDZMqa
         AZHZd6+pm1m1t3m+rd7miGm1TtyuNIOvaPGem3rQraQPJb5GSYLeYv0flL6PDVNT99j6
         xEAEF8NCc6nRYxbnPN2Y7HRON1yK7QOTHiqJMUnsGe6ZyCOi9VzY4ynW54cxfm+ThqA+
         clLkcAHHEC2yAlTVxZ99tEDFmRO7wivdkiMNaSGJ7qubf14ESCSXn/zx+PbnUwELLbrg
         1Uadhi70vsv8Rxs+mYpFkGpyg7MoiEhJSsxcbU7kXH2E9bfGBa9vMdu+VH8Om3Mlk2bR
         jp1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+z+jfOybMDjIivQa4CAp1iTATR4C0T504a5RmzBXAC5E9eSRexwbX6veHl/2Hi9D7mcSij+1VwFgdGWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFfBRwI+c0oCMCT1W4sqILnyok634UhfIa89AEyqON9FDp14yn
	Ol5QHbF07wvEmXVO1aewwbusSrhfof2dCsJHJJKj63YDRYQO/HutCaSZUw==
X-Gm-Gg: ASbGnct7a0DG4ZuEEIWXXivkcTf0YeywLhiMUhQZC5Wm8SGxKhGHbovqwGydXPO9JZu
	p/b6yfpohn+ZLQsuMZLZ8E7JSQhQU2BG82VHwwkCi73SsESKBKEo7FD/leBu/1zooGblcaShXTX
	zMttk4nqnq8Pld43mF6jVQFBhX3+iQ0tYc2e7zcZgRO4F7zfhFJmZoBqxDOVruBvb8AD2aUKrrm
	uYnWF3WHc3Pq3zcscZaGPCWxTsS3BMS17VpisAXyEr5+EXJym/uypLG5wJWgX0YcZFQis3Ob9ZK
	CWtl/w/rMG97imsFrvMuayCtznkrNTaiug/chdjYB5fsnu5U4Dig1sKM8IJ/tcKRRpm1tdTaQK9
	4olw145PzQWFGLA==
X-Google-Smtp-Source: AGHT+IEMRpmzlKt1cCPCQn4bwWAH2byEnhm2IIX4fgH353B/MjznTc9F7tqWGUWyfRjHfvwdQmyLKA==
X-Received: by 2002:a05:600c:3ca1:b0:43d:aed:f7d0 with SMTP id 5b1f17b1804b1-441d44d8107mr19706025e9.28.1746619597160;
        Wed, 07 May 2025 05:06:37 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441d43d6ee7sm29247575e9.20.2025.05.07.05.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:06:36 -0700 (PDT)
Date: Wed, 7 May 2025 13:06:29 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: WangYuli <wangyuli@uniontech.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, yuzhao@google.com,
 stevensd@chromium.org, kaleshsingh@google.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com
Subject: Re: [PATCH] mm: vmscan: Avoid signedness error for GCC 5.4
Message-ID: <20250507130629.303b01f8@pumpkin>
In-Reply-To: <aBo3W5HNMxLdtV2p@casper.infradead.org>
References: <85050791B887DC13+20250506160238.799984-1-wangyuli@uniontech.com>
	<aBo3W5HNMxLdtV2p@casper.infradead.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 6 May 2025 17:22:51 +0100
Matthew Wilcox <willy@infradead.org> wrote:

> On Wed, May 07, 2025 at 12:02:38AM +0800, WangYuli wrote:
> > To the compiler, (MAX_NR_TIERS - 1) (i.e., (4U - 1)) is unsigned,
> > whereas tier is a signed integer.
> > 
> > GCC 5.4 does not permit the minimum operation on such
> > type-inconsistent operands.  
> 
> 1. This has nothing to do with the compiler version; the type-checking
> is built into min().
> 2. We have min_t for a reason

Mostly historical - to match the original inline function min().
min_t() is definitely overused, it should be the 'last resort'
for a type mismatch, not the first.

> 3. Why is a signed min the right answer instead of an unsigned min?
> 

I don't seem to have the patch itself, but I' guessing it is for:

for (i = tier % MAX_NR_TIERS; i <= min(tier, MAX_NR_TIERS - 1); i++) {

which seems to have been added for 6.14-rc1 - so why is it only an issue now.

Looks closer, I bet the function is usually inlined.

	David
