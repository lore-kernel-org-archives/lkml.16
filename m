Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C35E1C242C
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 23:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738453447; cv=none; b=hpxfAr9sQg4cLzS54TGHEDqAaXeyvGypeyxPIqtU00CeW3I7okZyOTx6b2HJOzVNtccop0nr2HNV3AezEukSYdiT6QeeMl+/JVi5OPxB6uIzZ5MkCdhAbuyOWYSCjHvexPeLHd1EcLzorHtt2nvuYFwDHcA4DJxtUX2YtoBZkZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738453447; c=relaxed/simple;
	bh=hQwwtbzsmJHmXEHRTMgu1nJ554PuDLcjoSBNYNXXDUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lvMtUANLAs5KhxfyTsVHSbHfUktLVluNxUg+4glvlpAiHy5a9eJRWa4jlxpym4NqfE/pcQDRh9hYSRRS5eUEHa+AXgQtrBWgovIznCCPWmoRNDGFFIRYCUxEhVFhNnVbKBU7IbYPY/itNJfx/Pivi+4m5uTKe9rvr8Qg2tckmTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hQuZPoZH; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hQuZPoZH"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-543cc81ddebso3689889e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 15:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738453442; x=1739058242; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zrQs40ypKKdRXf6GVxA0OdtSUwZLc77p2H2fv4z8Urw=;
        b=hQuZPoZHuMjCl0lnhQSSGDSIPNmh4gUVxbsresezs+zFFcL4luMaMGDr6IsN/ZwYz8
         GFaLzA/WtTXjXtjKyb6h8YlI9J9E2GuCiEnb34n4bwpU2wekurIsC3BNnJrp8xEQ6iX6
         iIija3yjv/LFdJqU8y2370jOiXP0AkC5BYyf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738453442; x=1739058242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrQs40ypKKdRXf6GVxA0OdtSUwZLc77p2H2fv4z8Urw=;
        b=F335ILdgKjWRrz6tA5Svnig05iDVc3O1bR6sS4GgrcTwhKfu3cEHxErZIZRUyeiRc0
         SUbvj+kSLGwASatvUCA00MGyfBjifLXtgKJmr53/ZC0b0zogZzFDNHUBEZgFDS/354g2
         BOl/J9qzPMuHS4QV03MQ0JXS+ScCM/ca2SP2tga8E9gI0lVIEngmaLGxsraYqVkhe8l6
         tFsvOlMFQs3KUVSdnSJTYaud2On0Bc+XG3y9rlhh6k1Ty7aJLvWjivSatUTzU+A2Mivk
         +Sw1AOJA3vR3Utb7/VaQW5Lo8mpifTIjkaX3CNBURHgeZPEVDElny3xLNxnaTpUBLhNU
         +VIw==
X-Forwarded-Encrypted: i=1; AJvYcCV9v0u9xjB6nkbanO4YGM2+uNbt8xOrgLkMzGk0h39WcCFJEOoUip/kUfKhDGOalQa6V/XB+0Wp5OJL/TU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKb0M3P2NK90Elk4J01VgBP3ryEasQDJnG0sfsfq6I+bTk4QEh
	OkYv8t2Uj8G2veRPa5201s1sDuCg9NwDt8VF8geL671i/OlT9ljSmoB36wZ5pwYU7AgjgPpi0IR
	YKA13Kg==
X-Gm-Gg: ASbGncsPseqSYGJNMUNmbokyMqz9EawGPFqPmvlzXjGpHRDdD99I8QSpFjZ54XRmOxN
	dLjQHb7bIFIAU92W3pWTdSpikKwmqk03QsomUR8M20NUHpMuyX8cIHMQ4lX168O1KyxcQ8GXZtq
	38L7/wzi+BU1sEhlyjyhDi1hKI5+PtpTvTBS8TCAniw5EDPz6fvo/LWoDTT5EVbaHjCcUSoECXn
	ZYpQappvGLDZtDEvtslG3l6pty8GffwU2jMyT5kDdpZTQaW/A0m9rf1d1MeIUwDqfSMBGLt2zzx
	pfsGUq47U3UszWzEZekIhoeqPgpNDoLkNzWBmsOJapptCgR+V/AkmqtXen7CHcsVTWqr/w==
X-Google-Smtp-Source: AGHT+IHQcA9Ws5Ixym/rbmbkoAbe65QC06JBdZoqFhrq4MrpzQJzY9gd4ANsoCvx2XBABZrsPMb39A==
X-Received: by 2002:ac2:442b:0:b0:542:2972:4e59 with SMTP id 2adb3069b0e04-543e4c02f74mr4689439e87.28.1738453442067;
        Sat, 01 Feb 2025 15:44:02 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebe781sm843896e87.217.2025.02.01.15.44.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 15:44:01 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30167f4c1e3so29819501fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 15:44:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQaUHAjpLILToa+uHeridLReAfGB5IO3ms+e+NwULbC73ArgaTWFnQJq2j3OVa/f77lQ9gX+7xORTjjsk=@vger.kernel.org
X-Received: by 2002:a05:6402:909:b0:5d9:f9b8:e7fb with SMTP id
 4fb4d7f45d1cf-5dc5efe74cdmr17656373a12.22.1738452969323; Sat, 01 Feb 2025
 15:36:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131225837.972218232@goodmis.org> <20250131225942.365475324@goodmis.org>
 <e83ce086-b55f-431a-a499-f83a434b70db@efficios.com> <20250201180810.1faf4906@batman.local.home>
 <CAHk-=wgTWVF6+dKPff-mhVwngFwBu_G9+fwOTF2Ds+YPj3xkeQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgTWVF6+dKPff-mhVwngFwBu_G9+fwOTF2Ds+YPj3xkeQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 1 Feb 2025 15:35:53 -0800
X-Gmail-Original-Message-ID: <CAHk-=whVzwPwiQj5PdmZXA8G=9ZS2T-OUPm4VrM8TKTDQW3Dmw@mail.gmail.com>
X-Gm-Features: AWEUYZnL7HWDqqscez1fIJLpsSsGzS2Qj9VepL3JpazWidbVl6o5BaS06DFvaNM
Message-ID: <CAHk-=whVzwPwiQj5PdmZXA8G=9ZS2T-OUPm4VrM8TKTDQW3Dmw@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/2] sched: Extended scheduler time slice
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Ankur Arora <ankur.a.arora@oracle.com>, linux-mm@kvack.org, 
	x86@kernel.org, akpm@linux-foundation.org, luto@kernel.org, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, willy@infradead.org, mgorman@suse.de, 
	jon.grimm@amd.com, bharata@amd.com, raghavendra.kt@amd.com, 
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, jgross@suse.com, 
	andrew.cooper3@citrix.com, Joel Fernandes <joel@joelfernandes.org>, 
	Vineeth Pillai <vineethrp@google.com>, Suleiman Souhlal <suleiman@google.com>, 
	Ingo Molnar <mingo@kernel.org>, Clark Williams <clark.williams@gmail.com>, bigeasy@linutronix.de, 
	daniel.wagner@suse.com, joseph.salisbury@oracle.com, broonie@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Feb 2025 at 15:18, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But you *also* are literally telling the scheduler to put you at the
> back of the queue, despite the fact that maybe you are still in line
> to be run for *your* priority level. So now your performance will
> absolutely suck, because you just told the scheduler that you are not
> important, and other processes in your priority level should get
> priority.

Side note: we've messed with this before, exactly because people have
been confused about this before.

I have this dim memory of us having at one point decided to actively
ignore that "put me last" part of sched_yield because we had huge
performance problems with people misusing "sched_yield()".

I didn't actually check what current active schedulers do.  I would
not be in the least surprised if different schedulers end up having
very different behavior (particularly any RT scheduler).

But the moral of the story ends up being the same: don't use yield()
unless you are on some embedded platform and know exactly what the
scheduling pattern is - or if you really want to say "I don't want to
run now, do *anything* else, my performance doesn't matter".

A traditional (reasonable) situation might be "I started another task
or thread, I need for it to run first and initialized things, I'm
polling for that to be done but I don't want to busy-loop if there is
real work to be done".

Where it really is a complete hack: "my performance doesn't matter
because it's a one-time startup thing, and I couldn't be arsed to have
real locking".

In fact, the whole "I couldn't be arsed" is basically the tag-line for
"yield()". Maybe we should rename the system call.

             Linus
