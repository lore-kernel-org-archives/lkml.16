Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0534919E7F9
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748357952; cv=none; b=g0ESkWUTD8ySVFcIwdutDDfqes/DXyyJhYnrEv+mlKlcF0/d6uMV1iVtQN8goltj6L9ATkli/XUJ6ZmgToMwXcHQpVZPwayJ2Xp47wEldX08BKdP3yvDsc2k5SJ8dtluWK84jln72xEoF5O/fiIl4Rs3Oi979wGdYpaX0Glq/iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748357952; c=relaxed/simple;
	bh=0hGk1BipENri/pawAxd3E425f5+IuugKQMAlcZfMna0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=arjlOnTyf5aHhr384m7X2jb/JMXoF/AbZhxw6smdohnlDxuSLZZNPelM//yAvkuodJadk1lQSTSXRIpsHNPRNrtpmS97A62X3ASceqy6i6UXmVtLL1TokUawu0OIxOeD2EAGTeet3I9yIIY8aVsfmfT50WtdAgkmdT7Ay0zWxuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQpuwwKD; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQpuwwKD"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-310cf8f7301so2449170a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748357950; x=1748962750; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WUm2RN3Ck1X93suC2+x8ztLUIrvarI3GhREaPzl6gTw=;
        b=lQpuwwKDIrPJC7RS5bb+ArPPtIKD3ovbns0/zLWFCruDZROkd+OEi/y/9OMWbhQhC5
         lwGkGt7aEc0vTArHAo9y7sh9nTxKdwzv+uNWNW3DngQt8gFFdTz3FsK/DsQKfGEe5mkp
         nYN0kiY/I9Esyc0G+77V9wltFUTrDdYB0w86AhSUy+vX9xuhsK8eWY2ktgziT2MQ0M81
         l06jwQOXOMgZFcta+10g+qTJmi1pCOKUXkp0d9rlVWczP8uZnRmLbQe6SoPQfB+8W7Ld
         EBUgHpuo+eqy0FzzCSQCW99Dyp3AKzCUMlUxFWWPZjxzKFofroweTSIqK8U9ngyqp08a
         /Lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748357950; x=1748962750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUm2RN3Ck1X93suC2+x8ztLUIrvarI3GhREaPzl6gTw=;
        b=TP0hSRq5/dZxd3op1pkrqOLmSxmb1fU2g9Vck4cQpNDHPSJ7c3SjUGNGhkXKcDMJh7
         FevMEGcdMNb1WLuEs9vG9NKFAhPvsD7N7A/hSIv/MmGBcSImr69I3SQkgKUClV038TYB
         glYjwEwZUQnhg2EOHRJCDeIzQHJQeOEescZKkXyS9YdfrQ/LPNAbXvNjhAabyCf4EGPU
         0TT974/0O38TsrbDVS+eCMA3EfVWBjWR3DfVUAI8po4chZuSwp3WsHmJP37mCYbYx+Og
         PcfrIZRvLHO4NSKtFdYXWm11Yy+Hwlt2SmdVS2wQWzvQXBBF9mxfWiAqUmJ8O9cPn5GC
         pgVw==
X-Forwarded-Encrypted: i=1; AJvYcCX6CEef87XachCeh/Yq70pFEU4PLcvyc+ROgkqtgzY7adal9b/7PQmjdaMhYiL6bNJ7fMqRkCo4M7d6zjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM0EjO4z/BDiHniy7Kajx913xVv8anq8S7iP6quVE9typYj9fj
	iFVQX9o6N3+wrHDjDi9EwkUolkVvdS6aFW/emTaSgtGTXB+TrwRa6yyV
X-Gm-Gg: ASbGncutPZq2FJgnBTOyM97tRrM2CBR5+mOZgFMCndtpur05Our9idq3VtbtBVXNoOj
	l19y8FbhgJBD7pCzCKYpPKlpxLCYLCGpEoGMkVGYJLeEk868Khi8kICqle+iPIUCSPoP2VCP0Hc
	WQ+2soN6W3wNR3Qr9YZMwLXFus3EIU5tC5M0K3QcGMdEtaAuwqpsAqBp/E0CfZuZBEFkTORp9fD
	D4c2dGHpjuOptUYXcakkm6YF4SvoDaqaZIJHIa8Tuo62+J9L+3/Szw3nqwmBR4c8iHt7/wQQD+m
	pWv7kvRXxM93bIlbCFfyZSdANLb5D7P4z16Z6xeb4zK79KusgKU=
X-Google-Smtp-Source: AGHT+IF1FcIdjvJG9tlyYMtuzVsyLPmQ1KoVcZYvhzD7nXpZ0b9t4dlHOhaWMXgD4gFX0rivHRZxGg==
X-Received: by 2002:a17:90b:1806:b0:30e:5c74:53c9 with SMTP id 98e67ed59e1d1-311cce9437dmr1278876a91.11.1748357950004;
        Tue, 27 May 2025 07:59:10 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b2d8fsm14350978a91.7.2025.05.27.07.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:59:09 -0700 (PDT)
Date: Tue, 27 May 2025 10:59:07 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tglx@linutronix.de, maddy@linux.ibm.com,
	vschneid@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	jstultz@google.com, kprateek.nayak@amd.com, huschle@linux.ibm.com,
	srikar@linux.ibm.com, linux-kernel@vger.kernel.org,
	linux@rasmusvillemoes.dk
Subject: Re: [RFC PATCH 2/5] sched/core: Don't use parked cpu for selection
Message-ID: <aDXTOwRxhrtf5YPi@yury>
References: <20250523181448.3777233-1-sshegde@linux.ibm.com>
 <20250523181448.3777233-3-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523181448.3777233-3-sshegde@linux.ibm.com>

On Fri, May 23, 2025 at 11:44:45PM +0530, Shrikanth Hegde wrote:
> When the current running task is pushed using stop class mechanism, the
> new CPU that going to be chosen shouldn't be a parked CPU. 
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  kernel/sched/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 62b3416f5e43..9ec12f9b3b08 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3526,7 +3526,7 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
>  		nodemask = cpumask_of_node(nid);
>  
>  		/* Look for allowed, online CPU in same node. */
> -		for_each_cpu(dest_cpu, nodemask) {
> +		for_each_cpu_andnot(dest_cpu, nodemask, cpu_parked_mask) {
>  			if (is_cpu_allowed(p, dest_cpu))
>  				return dest_cpu;
>  		}
> @@ -3534,7 +3534,7 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
>  
>  	for (;;) {
>  		/* Any allowed, online CPU? */
> -		for_each_cpu(dest_cpu, p->cpus_ptr) {
> +		for_each_cpu_andnot(dest_cpu, p->cpus_ptr, cpu_parked_mask) {
>  			if (!is_cpu_allowed(p, dest_cpu))
>  				continue;

You test for online and dying CPUs in the is_cpu_allowed(). Why this
new 'parked' creature is different?
