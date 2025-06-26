Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF2C3C2F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 00:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750896176; cv=none; b=c99/FSAJnw0mOaLI8MhfXWXOzxSeMmg+blu/lePb1D5LfrvFRunH4zQyOLNSojgJm9M96nNOXLLuADY7D/7vPm72aVMGyHOHFtJ4p2XMlrlWO03e7FZWxfqY9ANEJ3Q6T0BNDYSBIhTXcWqe7paUsTI/9XQQeXNFWxKJJPVzbxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750896176; c=relaxed/simple;
	bh=kshfTldGwa+NqLCEMdWnaa69rBSF7LioeLsQJInJyMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmlDrXNZWxB1w5uhI83AV4pjOGFW2PmcxNcLrZDjZfXweNUZddq76BCBZ52R5zmmwxNEtPNgo0Yadl8CwBaGyRP665ELnXQjmZotPIEv6Q4yjF8vEi1za60eDnT8gFft6aoHnsvKR7wpMw3zrF2eJJysX1sWAiaG4qvqRHd/rYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Obv9QQ8V; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Obv9QQ8V"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-748e378ba4fso695495b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750896173; x=1751500973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lM1GTPPHV5WCR55djJT3W1q00iOrpCxrYOZ6QlrYZ6A=;
        b=Obv9QQ8VfG7bmIjDjQMWRHUSdfwDgMZYXnFGwbdTPt/ccC5NDjPjmjVRxDmt0RSyXs
         LOUf0iUAXBnLt+g+yXTMWGENyb6zl1IGwoOZq9C8PP5c/y0KUu5QWeWXX4FW8rEK7NjT
         sXUQVyy31PedYYAxHnTDnpUsBzC6vDAHgo1CVSKKZmKAVM6D71KhtQsKua/1D5A7/cw0
         2tolZjinrr8OQHQlJqQaLjBreYilojxRkgZnT0F5mfyUIFmAJPPLfVaB3jqW0YICeKbs
         7gErTHh3Th5fFjypGx4Sf1KwTA2+K5nKDymy8FiCXcQH2GbVR+mLwYhPh5pqDUG6so3u
         6mQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750896173; x=1751500973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lM1GTPPHV5WCR55djJT3W1q00iOrpCxrYOZ6QlrYZ6A=;
        b=UAwMgPjesmd17CoKS4ixaJzovbOGQvnjckgivGqPmeWEleVXDzU0Z+T+D6C0ZK0dTU
         frh3LkU5OEeM0Cm7Ciqj/vGsi7AT5Yn4EiUul70M5VFlcEcQz1jeYCDaKVi4y9SJ/bdN
         EquS45FiIvxApYqsGUoK6/gUzztrF1jlE5NzzG0rHEcSPjXfSnMEJ1frBuTBgnEQRcb4
         ktocTObTDcyTvPjCnxiN/0+2pI+Gc1QgUQPF1UIECuY/VtRMc+Aha258WiATm8yB2kyr
         dCraZHLS+omyW0oP1TNK5pBbYSHTf5iNnBCl+EK/ejmCKIS3/w6hFYZpjYCdFlXa6C3C
         v2WA==
X-Forwarded-Encrypted: i=1; AJvYcCU0bs/XhtjPRtyb7/ODqU96YUBlCXSPeCJVbJXgCA/samzbLvEuIGRumq33cTbAAro2KcPzzTuRHioXt94=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdwTBQi6Y5ZpB3erDq4FsvKQRPXlmDw6Xe0Ms00FifKSykf0bL
	qrmb6w35hR73wXmGel1oRepUAa3OS0sY8+NFUDa4WcrJ5/3KANTTKQAO
X-Gm-Gg: ASbGncviWZO4KPdCl4BxyVaACsm9ExrxiCIu9CKg7zgRhuQQJl8pUjyvES5PNIVn6gp
	kGm4d3GBGnvxHYSjGm5lIXULLQ6YHFYy8GrX9qBhLWPfLAciuM+gWuzu/ydBOP2CE8AwXPzvsl+
	PG7lior/coWtlw1y40F82cbRf/B/uNLX/ebMZpAM8836qe/xsEGXVoTnaFzMXbTvqlpbwo4XBru
	Ggn1I7UUNewOw3nj8T3wkftjCPAb0scqgXpjJdJm0rCxe1BoF/v30Wxf56RPoiQQ6kKqmQQADwt
	X3g+jVEBh+nbOImXjOAJt6Ms/bgcdTyEubUQYtrS6ZPzQA3OBvkL4eZMYl4+Ew==
X-Google-Smtp-Source: AGHT+IHBlphPYG0R+Ezs3voKgmJntm9TCYEj5igU5EvDXw9i4W7TFCoT1JCE5a9iA/KumVZ68cBqOg==
X-Received: by 2002:a05:6a20:d74d:b0:21f:f0b6:3d6d with SMTP id adf61e73a8af0-2207f19208amr6650183637.10.1750896172980;
        Wed, 25 Jun 2025 17:02:52 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c88722e7sm5414333b3a.166.2025.06.25.17.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 17:02:52 -0700 (PDT)
Date: Wed, 25 Jun 2025 20:02:50 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tglx@linutronix.de, maddy@linux.ibm.com,
	vschneid@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	kprateek.nayak@amd.com, huschle@linux.ibm.com, srikar@linux.ibm.com,
	linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu,
	linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
Subject: Re: [RFC v2 4/9] sched/fair: Don't use CPU marked as avoid for
 wakeup and load balance
Message-ID: <aFyOITguo83GdxKv@yury>
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
 <20250625191108.1646208-5-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625191108.1646208-5-sshegde@linux.ibm.com>

On Thu, Jun 26, 2025 at 12:41:03AM +0530, Shrikanth Hegde wrote:
> Load balancer shouldn't spread CFS tasks into a CPU marked as Avoid. 
> Remove those CPUs from load balancing decisions. 
> 
> At wakeup, don't select a CPU marked as avoid. 
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> while tesing didn't see cpu being marked as avoid while new_cpu is. 
> May need some more probing to see if even cpu can be. if so it could
> lead to crash.  
> 
>  kernel/sched/fair.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 7e2963efe800..406288aef535 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8546,7 +8546,12 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  	}
>  	rcu_read_unlock();
>  
> -	return new_cpu;
> +	/* Don't select a CPU marked as avoid for wakeup */
> +	if (cpu_avoid(new_cpu))
> +		return cpu;
> +	else
> +		return new_cpu;
> +
>  }

There are more 'return's in this function, but you patch only one...

>  
>  /*
> @@ -11662,6 +11667,9 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
>  
>  	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
>  
> +	/* Don't spread load into CPUs marked as avoid */
> +	cpumask_andnot(cpus, cpus, cpu_avoid_mask);
> +
>  	schedstat_inc(sd->lb_count[idle]);
>  
>  redo:
> -- 
> 2.43.0
