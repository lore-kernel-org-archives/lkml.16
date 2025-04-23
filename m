Received: from 190-102-104-130.static.hvvc.us (190-102-104-130.static.hvvc.us [190.102.104.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D783338F91
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=190.102.104.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745371298; cv=none; b=XA5+kbFRKb/eBmSrCZLoMngvwq/RKYFAcBXaZPokQ2/i/dbSG6uRIPWAejFGbcHw+HMWExiuG6HJCwvWi2SpWKH/ggLW+W9FcPv91H8x/gZR5WOPvagBvxiyiM3GNLN3KYEQE1EMf3sV+reEafvow0YDJyF1eYdniySjwm+2Hrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745371298; c=relaxed/simple;
	bh=8hxQ4bVtRg7C2EkHwlLBO27eCchHZAwpqN2l5qTpA+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N26pkmRn/CsIAX0N/tdDODnYTkqVRsc6sS+byO4/rccO8zfbOCA543BXrofTu3VnBsgPEXcX/W5AqmCaEQ+hnk3TZ6006J8+5mnpI99VcY2uzvAZrZx7dZjt20tirxj4zLSrJ4Ms6z4e0kZubWHJkSSvDt3vgvBa+V3vGLh1fro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=phoronix.com; spf=pass smtp.mailfrom=phoronix.com; arc=none smtp.client-ip=190.102.104.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=phoronix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phoronix.com
Received: from c-24-15-38-32.hsd1.in.comcast.net ([24.15.38.32]:6175 helo=[192.168.1.194])
	by milan.phoronix.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <Michael@phoronix.com>)
	id 1u7OOI-0000000EJsP-1qhP;
	Tue, 22 Apr 2025 20:55:04 -0400
Message-ID: <896a67ec-9f48-4137-9d34-4bb16861e284@phoronix.com>
Date: Tue, 22 Apr 2025 19:54:59 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.15-rc3
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Dave Airlie <airlied@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Sebastian Sewior <bigeasy@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAHk-=wgjZ4fzDKogXwhPXVMA7OmZf9k0o1oB2FJmv-C1e=typA@mail.gmail.com>
 <CAPM=9tzj_OBFJNsN9j7nMs4OR3=V9yrPmaH7VvN-KNYUYhf-vQ@mail.gmail.com>
 <CAADnVQ+KnfDLd-=Mg1BDJxCf80K_=RN0dJy_yp681gf1dQMhtg@mail.gmail.com>
 <mhewqdlvb5ahqordw2nuebq7yvsxo7xvdas4vl6gehmbmypcil@v3fn7nzllglj>
Content-Language: en-CA
From: Michael Larabel <Michael@phoronix.com>
In-Reply-To: <mhewqdlvb5ahqordw2nuebq7yvsxo7xvdas4vl6gehmbmypcil@v3fn7nzllglj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - milan.phoronix.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - phoronix.com
X-Get-Message-Sender-Via: milan.phoronix.com: authenticated_id: michael@phoronix.com
X-Authenticated-Sender: milan.phoronix.com: michael@phoronix.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

On 4/22/25 7:12 PM, Shakeel Butt wrote:
> Ccing Michael
>
> On Tue, Apr 22, 2025 at 04:37:59PM -0700, Alexei Starovoitov wrote:
>> On Tue, Apr 22, 2025 at 4:01 PM Dave Airlie <airlied@gmail.com> wrote:
>>>> Alexei Starovoitov (2):
>>>>        locking/local_lock, mm: replace localtry_ helpers with
>>>> local_trylock_t type
>>> This seems to have upset some phoronix nginx workload
>>> https://www.phoronix.com/review/linux-615-nginx-regression/2
>> 3x regression? wow.
>> Thanks for heads up.
>> I'm staring at the patch and don't see it.
>> Adding more experts.
> Hi Michael,
>
> Can you please share a bit more on your nginx workload and how can we
> reproduce locally? In the mean time, I can try netperf locally to
> reproduce.
>
> I do have some followup optimizations [1, 2] which hopefully are aimed
> for next release but we can try those as well.
>
> [1] https://lkml.kernel.org/r/20250416180229.2902751-1-shakeel.butt@linux.dev
> [2] https://lkml.kernel.org/r/20250410025752.92159-1-shakeel.butt@linux.dev
>
> thanks,
> Shakeel

The Nginx test case is a fairly stock Nginx build measuring HTTPS 
throughput for serving some static web page with Wrk used as the 
stressor, all on the same host for stressing just the local host. All of 
the assets and execution scripts used for that Nginx test in raw form 
are here - 
https://openbenchmarking.org/innhold/c7b555063f5732b4f1bb08444e258984d1dbb94b 
Let me know if any problems reproducing, etc.

Thanks, I can try out those patches tomorrow. At the moment on that same 
server currently running through some of the other workloads I also 
found regressed on Linux 6.15 GIt to see if attributed to same commit or 
not.

So far, when comparing 51339d99c0131bc0d16d378e9b05bc498d2967e2 as the 
first bad commit against the parent commit 
a30951d09c33c899f0e4aca80eb87fad5f10ecfa, I was able to reproduce a 
regression for the OpenFOAM CFD software using drivaerFastback with the 
small mesh size: 30.6 seconds on the bad commit, 23.6 seconds on the 
parent. So that too seems to be related while the other tests are still 
running at the moment.

Michael


