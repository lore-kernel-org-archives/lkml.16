Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C2B253939
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544092; cv=none; b=C8GE3WjYf3D2DufwWI/Me7LnEqPXqqpMM+AkOqcXflhOKRsgJGghJ1iYa4b1aaeW+ODcs0XM7tp9ILExrYxZ5koRd99DH0owT4Nl4XhInQ83eBUxEKa610O9eVrAvG8X3/LlXS84OvoCP6DKA9FILm1If9PXGC4WPmfuJef/2DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544092; c=relaxed/simple;
	bh=z2VMVssNf2T1qI0QODTU/q2QBzCWr3raQvOE+FydPRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9QfVlM/1JvLhwxjsUe0z3vN5lMcxBeuW+22jVMvxW70m6LqkByHyw2QM0DahoZVq8a2kMzVBczENOjdLCH65TM1UVdfCR5mz+AYDU+uDXwuY06+lmtOC+kjUNDvu6e28GdmLWK0mpiON7nYDG5MGwS5odbzAaZAyFWR21rY6vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=S0ctuNej; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="S0ctuNej"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453634d8609so56833735e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 05:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751544089; x=1752148889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aopz9JcRK0iEgUc501SKKnowXTL3SIijDXQz+zmIWgU=;
        b=S0ctuNejtpvrRh9jAsx0+Bj9uqA4Hd7hr7Q0tVsTUKcMCte7othb7lPezaKYI04aIw
         Rvp3oH1F36N0hwS2gzAwCDvsl6cEH6SyxrtqljFALogmPICYZ1gqVm56QqF2M9R0FQVH
         rucrz1eHJfvk1dletLgEdE+aSAqwQlattjJLUFL6nyiwBAmC2Mh2AT9Ma1HYJ0EwYGTk
         G1D9tL/dJdKvRByDB5WXFMkChAqbC9DqvRklLSQc7fJDUgiCyDDDJyx4huFZzrGCpOo9
         DYRY1UCOTmcXcN6+dC9ZCsQCVl5ZBjU2jXjRdOTezFULdp4vbVK6fkocFSERTWkUrKF6
         o4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751544089; x=1752148889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aopz9JcRK0iEgUc501SKKnowXTL3SIijDXQz+zmIWgU=;
        b=sZm3EeCpX8GxmjlZs364rxhYnzu2F6aFHf+1rS+Je6VFHFsADX+8W5HO+d0q6zxRCC
         qORdUxauIlvvQ9bJTnZ1RZ19ZX0Dl3PTsRuvq40srYOM6KL4cG+VdIBIDYTGfIIuhSE7
         68zAtAKvML8jM7j4ZRIcwLh4Is2kuafDgGqT9Vqi57D8QComNUcw7oPuXQu4XZU06KrF
         bcfGjo7YQGP0IpFBR0Zo8/ENzaaJ+p2QxuTybewv8Q2LuSfgfm9RKcp0jkwKOKyTikFB
         DQboKBy+9pXQNNEImd7DyzrkMLDYiN8b/JLhCWtK7cxt75uWNs/8u8/cmZMDqcwkyoG3
         cQKA==
X-Forwarded-Encrypted: i=1; AJvYcCUVWYJ7h7d4FQugltp7T/0t4Ykr2HE2ORto5BDaQ6L1j7dRHc0qn87ffZeF1b68GzKUP3PtA/077btnbao=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtmEb/Q7Ij+FBzV8bPCctSCIjFSwpyqSk4Q6gNllfTPuhMfpkT
	xHnSli1ByhO/QCj7HPcX3M+zzXWPm0myYI8h+bpeH5lr7PCgkoaZAigjLeixB+8Wag8=
X-Gm-Gg: ASbGncsXw/D45IcH14GAn2eINOfmkdgjGVlxcEWFtUOvofRFsR0Ir0KbBPy3eFcd9IS
	imj34IDZdNlSk1cEMlPpbhScvqmm/El55douTdqavnKzrphajIOtAVABc6T1miaA/lcrgRgTIRV
	+XOFi0w/9Uk1chOzV/icFT+vId3HdcotbqhJX4hye+w+Zb/HGceN1ad3du78v4Z3sTRcV4e+zrE
	w5BNDU4GwJsOlP8rcN4PpDTnmKuKWZqR0oJSG3W9hApAsGfOqq7hDKYf3IlP4/8iIGDPtcQTben
	fBiF4Eyn3UY5jya3PN7nnBUJ26GRD2L0lwhUiBb1r/e0rmqvMlbg6hCdkN/jV9gaUsRO6bg/d68
	=
X-Google-Smtp-Source: AGHT+IEKdej4rZRfQsA8lt2P2H7zqGUWgsuHW8FgSQ8FsnWOkSKG1hJ20TPEje3vH/3yFkiIG7JoUw==
X-Received: by 2002:a05:600c:608c:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-454ab3a9274mr31654735e9.17.1751544088630;
        Thu, 03 Jul 2025 05:01:28 -0700 (PDT)
Received: from localhost (109-81-23-161.rct.o2.cz. [109.81.23.161])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a99729basm25002165e9.10.2025.07.03.05.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:01:28 -0700 (PDT)
Date: Thu, 3 Jul 2025 14:01:25 +0200
From: Michal Hocko <mhocko@suse.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Chen Yu <yu.c.chen@intel.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tim Chen <tim.c.chen@intel.com>, linux-kernel@vger.kernel.org,
	Jirka Hladky <jhladky@redhat.com>,
	Srikanth Aithal <Srikanth.Aithal@amd.com>,
	Suneeth D <Suneeth.D@amd.com>, Libo Chen <libo.chen@oracle.com>
Subject: Re: [PATCH] sched/numa: Fix NULL pointer access to mm_struct durng
 task swap
Message-ID: <aGZxFRVxHouLaMPg@tiehlicka>
References: <20250702163247.324439-1-yu.c.chen@intel.com>
 <20250703072608.GS1613200@noisy.programming.kicks-ass.net>
 <aGZNTtJuCyHJE_25@tiehlicka>
 <20250703115006.GT1613200@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703115006.GT1613200@noisy.programming.kicks-ass.net>

On Thu 03-07-25 13:50:06, Peter Zijlstra wrote:
> On Thu, Jul 03, 2025 at 11:28:46AM +0200, Michal Hocko wrote:
> 
> > But thinking about this some more, this would be racy same as the
> > PF_EXITING check. This is not my area but is this performance sensitive
> > path that couldn't live with the proper find_lock_task_mm?
> 
> find_lock_task_mm() seems eminently unsuitable for accounting --
> iterating the task group is insane.
> 
> Looking at this, the mm_struct lifetimes suck.. task_struct reference
> doesn't help, rcu doesn't help :-(
> 
> Also, whatever the solution it needs to be inside this count_memcg_*()
> nonsense, because nobody wants this overhead, esp. not for something
> daft like accounting.
> 
> My primary desire at this point is to just revert the patch that caused
> this. Accounting just isn't worth it. Esp. not since there is already a
> tracepoint in this path -- people that want to count crap can very well
> get their numbers from that.

I would tend to agree with this. Doing the accounting race free on a
remote task is nasty and if this is a rare event that could be avoided
then it should be just dropped than racy and oops prone.

-- 
Michal Hocko
SUSE Labs
