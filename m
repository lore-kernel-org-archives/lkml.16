Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E85266592
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347197; cv=none; b=pVydQTuVWUrDglppJdJhel+kEUhKtXEVG61E/ESlfRyg/wRpplF3bKWzODoF7mRPfpAHbynW0QF8ZlG45V9AiMqSH7LTq03hEzZ0cZM7mUQbzRGUTNHM/fksK42ggzIxGMMr32hUhMR/5z71T87DHs/bye5asDBK6Qlxoxu10vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347197; c=relaxed/simple;
	bh=XvfvqIlOFYkGBwQvnRjxIQVmk28wdXroPYPye0mvOo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZkON2yOIhKNvQKI5n0gnQcAv5PG575PiwRQ0nZRzAgP80jRxB2QCh1hfyGHmf7Ygr+gGM+zNz1NBLSoLX8twFmVbqtIj0TgqE8nItkiLZ993UEqXOZjEDGxkMBHNkGCZuYSaLkijBfoXuRdPtaGxKY3xp3o4UeBbMPJtDa+IAZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oUIamwFj; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oUIamwFj"
Message-ID: <33103ab3-6237-4215-b8de-bef680bef691@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748347192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pk2NLxMSSgva1+BnYknCHoFS3kE43fI06JfFheI+Eh0=;
	b=oUIamwFjhKSSGTdHN8jb8CGTGpz83Z8ankF7n25wxCfLV85nySyUiYP5ucOo9H65eZ9nhh
	QYqOBpoAbT0J5L+hcVlm+9NmdcBOAHu2LsjWOMUXpMlBjNFVDY2VTVjY/U8geSUeLSCzRo
	lH4ZqYchviUx8nR23Yp058w57r7Uw80=
Date: Tue, 27 May 2025 19:59:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [WARN] LOCKDEP: MAX_LOCKDEP_CHAIN_HLOCKS too low
Content-Language: en-US
To: Waiman Long <llong@redhat.com>, peterz@infradead.org
Cc: mingo@redhat.com, will@kernel.org, boqun.feng@gmail.com,
 linux-kernel@vger.kernel.org, Lance Yang <ioworker0@gmail.com>,
 Zi Li <zi.li@linux.dev>
References: <20250527020252.43684-1-lance.yang@linux.dev>
 <c0fb67e3-ebe0-45ec-9f61-a8cd5949cc42@redhat.com>
 <055a9abd-8137-4382-9830-551961cbcda2@linux.dev>
 <25e2293a-f49e-4bc9-bf80-efb66d87c7cb@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <25e2293a-f49e-4bc9-bf80-efb66d87c7cb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2025/5/27 13:53, Waiman Long wrote:
> MAX_LOCKDEP_CHAIN_HLOCKS is composed of 2 parts - (1 << 
> MAX_LOCKDEP_CHAINS_BITS) and AVG_LOCKDEP_CHAIN_DEPTH (5). I believe that 
> the average lock chain length is probably bigger than 5 now. We will 
> have to check the /proc/lockdep file to figure out if we should increase 
> it as well. Anyway, I think we should increase 

Yeah, just checked `/proc/lockdep_stats` on my machine, and it shows
'max locking depth: 30':

$ cat /proc/lockdep_stats
  lock-classes:                         2074 [max: 8192]
  direct dependencies:                 22596 [max: 32768]
  indirect dependencies:              124267
  all direct dependencies:            527384
  dependency chains:                   51354 [max: 65536]
  dependency chain hlocks used:       327679 [max: 327680]
  dependency chain hlocks lost:            1
  in-hardirq chains:                     209
  in-softirq chains:                    1068
  in-process chains:                   50076
  stack-trace entries:                306274 [max: 524288]
  number of stack traces:              11921
  number of stack hash chains:          8482
  combined max dependencies:      2651851138
  hardirq-safe locks:                     85
  hardirq-unsafe locks:                 1301
  softirq-safe locks:                    284
  softirq-unsafe locks:                 1123
  irq-safe locks:                        303
  irq-unsafe locks:                     1301
  hardirq-read-safe locks:                 4
  hardirq-read-unsafe locks:             312
  softirq-read-safe locks:                12
  softirq-read-unsafe locks:             307
  irq-read-safe locks:                    12
  irq-read-unsafe locks:                 312
  uncategorized locks:                   352
  unused locks:                            0
  max locking depth:                      30
  max bfs queue depth:                   379
  max lock class index:                 2073
  debug_locks:                             0

  zapped classes:                          6
  zapped lock chains:                    163
  large chain blocks:                      0

And, the average lock chain depth could be calculated as:

dependency chain hlocks used (327679) / dependency chains (51354) ~= 6.38

Seems like we should also consider bumping 'AVG_LOCKDEP_CHAIN_DEPTH' to
something like 7 or higher.

> CONFIG_LOCKDEP_CHAINS_BITS to at least 17, those we may still hit the 
> "MAX_LOCKDEP_CHAIN_HLOCKS too low" if we run a variety of different 
> workloads without reboot.

Agreed. We may still hit this issue, but tweaking these values can make
it less likely ;)

Thanks,
Lance

