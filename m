Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6DF171658
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743104955; cv=none; b=dL4aJAWEdUy4fyxUYXudTAn30KIFZ6x/HdT9n6pJO/Ds8dflkrF6Lr1wPHVaBR79Lc2GUZfw71hbI6xLBYq9TZ0mlyyLOHXqsk9QU4hIGCzgzZgJIyUwDIbidqE/tKfraKLHpajhzR0Jz7JpcK3hn6L3vq/86tktrH2yoraRsWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743104955; c=relaxed/simple;
	bh=TmhrEyyzYHS+5GOcpxXhAFm8eLJRmXJBamh8xsmNaSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LIW6QkwPvKdiCC5/cPa1WX/W1aBurzkXCcRvUvB0M8Tndj1w8u+Sn/X3f/lEGdlpLnlz39WF3EzJK2+BConTwEcT4mYps6AjqimQSj3Y22vkprG1enPsZPcxmNMbg/8RJNkJjmtqr/Ji60V9xk2x7qXLD6RPbKgoSeRvAhJxchc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Em9mcxso; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Em9mcxso"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e61375c108so1774281a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743104951; x=1743709751; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9ItE8oX0ILk3WjrUu6e7/GfRlQ0WuxC6tMvI04/KUJA=;
        b=Em9mcxsofxkOn9pYWhQrCEUL1/t6yt3+Q0YHUxxGSYF4eY6++t9CWSSyXnqSpyq4D8
         W+18/2maStRvKVSQJK/mMt4jUC5OsnUH84a6a6IybA31AlfqQJrKkm1uFO454l0y1yAd
         KcwOlsuc5xeludgaqX0izfRzL70SbjTCzrhhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104951; x=1743709751;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ItE8oX0ILk3WjrUu6e7/GfRlQ0WuxC6tMvI04/KUJA=;
        b=dg/Fh+xj1vac3KBfXrl61kCKHgKXLsYMBIiRGTr1opg5NUQTuKON6nYcZbDjfwNMZ7
         3AnuABqHxZiBQoLuhgbulZabkW9kHiMdfx+0v2Ozwu0CIMjYAyM4WZ8u5LQpm4vKCQPE
         Ok9IhYDvxy5ffBkDSK4leRDxiT1dXwHMtvD203Fmq/Q8n3g4YVPLtyp6gK/2sP79wnNs
         3JfQpnWG3rebD1dn7Uz9oiK4OzCLY0+DElhg2aEK1H0wKi9zBe6Ww8LIQeb5hYcgdf/D
         yAokhWYTgFoNFOPVdjkB00XSqWpdN5dYIlXq0JndRLwsSJVIIGBLJP9DVEDYw+i5koG9
         Fwcg==
X-Gm-Message-State: AOJu0YwdsmYVLlczL9pdvFLWX292BLeuv5xu6ADPRkGh4ZKH7xUT5bZu
	5w3OspqRGddGWX+7oWXO7BJ4NYtsd0TZ5epRchjN8ovH2xRygxpH7XO9pzxYrrjYzg4NdtO3Tdz
	N86Q=
X-Gm-Gg: ASbGncuWtimTD0UJzx05JBybMm3bugP2Urthy8pdQh1LI0fh/uWKDsT/E5blRVXuV4v
	EXZv38ZwUfuPMueFJ2B8JVqLUM1/KYGLzvTVmFVMtSrYSFUSweS1BJZsh3AfnJtGCCq1WR6CqIV
	O69OO6wFQs709/U6P+7w3Pr1Nhge549ouwd5LESLkG7iREWsJ7WI0snZj+evtIR8KXWy3S3QFmC
	Glk8VlERD4JOh0n5dQjPCyXscJWp0iOIrSwlruPrvrXA6JYtDL3leJJhm9Ujk5b/onOFoSkEwZL
	d5HZIrLmlO5ye286Ar3xx1mTcfOs3Bk4KPB82YAmv4+3oUnEmGLhpMPerJ2DGGd5yMLvezjScqB
	LFWcxYo6dQLyjSH1k99I=
X-Google-Smtp-Source: AGHT+IHv5Z7lSC8TsdVynOEG7/vuX+l4TUNnGuVH/578VK1MW//EeAAa0F00UgZ19Oon0NOIgT09fA==
X-Received: by 2002:a05:6402:26cc:b0:5dc:c9ce:b01b with SMTP id 4fb4d7f45d1cf-5ed8e27b765mr5031209a12.8.1743104951142;
        Thu, 27 Mar 2025 12:49:11 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e0042sm245518a12.80.2025.03.27.12.49.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 12:49:10 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e61375c108so1774249a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:49:10 -0700 (PDT)
X-Received: by 2002:a17:907:3ea8:b0:ac3:45c6:a1ec with SMTP id
 a640c23a62f3a-ac6faeef8e8mr423348166b.25.1743104949094; Thu, 27 Mar 2025
 12:49:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327102953.813608-1-mingo@kernel.org> <20250327102953.813608-14-mingo@kernel.org>
In-Reply-To: <20250327102953.813608-14-mingo@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Mar 2025 12:48:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wihuzRytaFKr6b_pbi209JW+GWiNMtb9x-XhQdstxPuMw@mail.gmail.com>
X-Gm-Features: AQ5f1JozIZWS8j2lCU6cy3yQlYJmv-RuLU59ehvhVkiyHqS-QfeMDqKPFphPR_s
Message-ID: <CAHk-=wihuzRytaFKr6b_pbi209JW+GWiNMtb9x-XhQdstxPuMw@mail.gmail.com>
Subject: Re: [PATCH 13/14] bugs/sh: Concatenate 'cond_str' with '__FILE__' in
 __WARN_FLAGS(), to extend WARN_ON/BUG_ON output
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 03:30, Ingo Molnar <mingo@kernel.org> wrote:
>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: linux-sh@vger.kernel.org
> Cc: <linux-arch@vger.kernel.org>

You say that, but I don't see that in the actual email, which only
went to lkml...

So the sh maintainers (and riscv and s390 etc: same issue with those
emails) probably never saw this.

The patches look fine to me, fwiw.

           Linus
