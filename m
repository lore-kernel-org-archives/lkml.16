Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DA226E165
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745407630; cv=none; b=SELF8H3GJsSmBjsK9fzPbt4rNJNxCl1JcV0v4QGn6ecb+MbAnc7Wto4KT81gCHpb+chBkiwwo8Vk91/bSG5ODMgyANlY0OuujJ7rLLYo15dMGEZ1YGJSgQKqp3lgN7TxRxtEAPj4DOG7oRyH9xU22bJgGRBpBtVWO3T+ZkBRZjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745407630; c=relaxed/simple;
	bh=GWNbt0uc23Fp+9BMPaj9zqpdLZ08H6PPR/SOhlJgWdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/TloqGRaotE6TarZiIajdXS4MyCnRoHXoZege8qNRIPKP9O+joZijkvTITGCVDAK+vssmwDWyzytdkcruUkNMiBVGaRTRMra0h+dsiC/+UWhN3RI7kFE0u7ZHgO0r3GRNh6qF6q15WA0WvJDvKpnIFBJSnIVRCLqYd5E5KJxCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=bf8EbgLH; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="bf8EbgLH"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-736e52948ebso7231861b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1745407627; x=1746012427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lqfsiipj1zIG3B0OdcMsXHIIVUkLBUUNgQuy45j+4Yo=;
        b=bf8EbgLHJbz+tGoEVD0oVFtmhFROsM5d7Xs57IFm6dvaDrDocrlXW14Pl2hq55uI7K
         j1qHr25KI8t1eIBPvvURTzxKaxmFVT1Y5kb+ptQAnOi4WYmWc6k70lN9R9ZycBVXptFA
         QqrXrC1lsLuiQNIcKKUv1/PGFs8Rj4d22mDJrLEPj76CLJ+qLmd8dqkA8jsJ5gF/e9MX
         ODPxY3XYsCMGC6zqtFKc/WuoA9lB53vzehRV0t++S1UK0+ZnLd5A9aKyEtigiNcruX9E
         D/qwP1s52Icc62iyiCM4X0U4gBsGGbGwsb3OArDOoeH7Ku5KHTLM7sDv2QRXymq3BvG7
         RizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745407627; x=1746012427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lqfsiipj1zIG3B0OdcMsXHIIVUkLBUUNgQuy45j+4Yo=;
        b=tamNusFCa+KFiImjQXesGQzxdFNUsxeW2zUMMhJBi5aBP6vhs+gTQ5CuwYRZvJ6Jra
         /PjlS8mMRnYJutKOOpX+GDWKZ0YD54QYUCA8gH7bCX92C6rf1fEeHJdK8i7D5X5xoGqA
         ndo/JfnZvLVQdtjqO8K/He6E5xsroxUJc2OJygygzam31/zjrYJLyu1VVfXhabLoFsRH
         i26JAQ1tnvmI/0THARqgi1YahlwuW7QwN5cq4q5EBZlctQ1sP+whOkHbiduEl70TaC03
         jb3gr/2mMgDvhXxbtZWPLa4ln4apHBYJbrbW1dXzsaqLfZQQ1F4L1fLwDQSLPNcFinIY
         gMxA==
X-Forwarded-Encrypted: i=1; AJvYcCVFsGAGLlCwAABIi9+d+lXl3SihRVc3RyyRM72OR9vrLUT12aJfAv+fKV4/bXbpTKTS1wNQVImgqbCVOVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwjlBbq0FhHSzLoOpL6iJZgqI+4Gyki1AFGt+feg/SsfPoz5P0
	iffmSOZx9WY9CO+ct2AueHqHMlSCaa6QenD0wy3gisZrNWl2XtJZrBbEohhX6g==
X-Gm-Gg: ASbGncvjiGC4KLl3j7YF9zxCsgAHW8Oh6I0MamvGBae3y7nPik+B7n0Nzf57nddtAbv
	T86hiSSMTVwdjwp36Ow5Atfi6APhHNRJgkFjO/zEwFcsZhZfqW3Wltm8Ng6mlwK4+pnohvr1T1a
	1yppn+Hbh2FrQ8Hkqt3sgbBITkR2STdcAbseAho4QzNqfnjjO3L9a6/wxH3USrxI4rMcolaoHRS
	rZ1/TIYm6I1o+AE/tgFhI93PGWcUCcq2EmE6wDX7Ch6ct5jHpRsv9v5Jp7Onc4z6rME3KP1NqMs
	FS1YP4xMCVKlauQRZmIbKcFkpP4p42BP+Ms8rjOF
X-Google-Smtp-Source: AGHT+IHLRi6fszmZI3pApX59BjCB1oFpUKlFtQbO4Ws8sJOQw90F+RI5SOh0oOPu4cYVpPjgDmk/Zg==
X-Received: by 2002:a05:6a00:3928:b0:737:6e1f:29da with SMTP id d2e1a72fcca58-73dc15c48f7mr27748930b3a.21.1745407627077;
        Wed, 23 Apr 2025 04:27:07 -0700 (PDT)
Received: from bytedance ([115.190.40.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa588d4sm10691048b3a.96.2025.04.23.04.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 04:27:06 -0700 (PDT)
Date: Wed, 23 Apr 2025 19:26:51 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Florian Bezdeka <florian.bezdeka@siemens.com>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [RFC PATCH v2 7/7] sched/fair: alternative way of accounting
 throttle time
Message-ID: <20250423112651.GA437160@bytedance>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <20250409120746.635476-8-ziqianlu@bytedance.com>
 <099db50ce28f8b4bde37b051485de62a8f452cc2.camel@siemens.com>
 <20250418031550.GA1516180@bytedance>
 <87776d335eec8fe02b29d96818fd5c2dde5ed7af.camel@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87776d335eec8fe02b29d96818fd5c2dde5ed7af.camel@siemens.com>

On Tue, Apr 22, 2025 at 05:03:19PM +0200, Florian Bezdeka wrote:
... ...

> Right, I should have mentioned that crucial detail. Sorry.
> 
> I ported your series to 6.14.2 because we did/do not trust anything
> newer yet for testing. The problematic workload was not available in
> our lab at that time, so we had to be very carefully about deployed
> kernel versions.
> 
> I'm attaching the backported patches now, so you can compare / review
> if you like. Spoiler: The only differences are line numbers ;-)

I didn't notice any problem regarding backport after a quick look.

May I know what kind of workload triggered this warning? I haven't been
able to trigger it, I'll have to stare harder at the code.

Thanks,
Aaron
