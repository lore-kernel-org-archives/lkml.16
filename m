Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5111D21348
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 00:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750896733; cv=none; b=gLT88WU1V1x5CreicLL09GPXe+92Gh1Ah4TdFP0Cg7ooXCqrbtgFmyrd/8iHbad0VFO7WJQ6FFizoU0GYs997jcMvMwJAPENVHtiiIkxTPdRrHEBkZV7cbDK0MC9dpmb3T0gKfP5vbhyXJBb+Tef47bEkfKlGml5OSdWgd8cbF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750896733; c=relaxed/simple;
	bh=Cj62ysRWbXSDFq4t1u2DHssSYBYXcPif2HzglPUYpr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjlXdeN+XXIY+gFy4ls40w+pCCIR56ARP2QFPa7/Y2Fo3IrraRdIfGsErPDNNZt6tnk2rWpw6HWdRsy1Ikl85deoL88hp9enfYcSt0Q6C1SYlGgSL5h1yN447OjPMRJ/S9eKaU3ttSI0P9KCuiLF4CCFfgVlD9R71fvSz4ULatc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+uzW9OL; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+uzW9OL"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2350b1b9129so3663195ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750896730; x=1751501530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lowV/nKzWTvWfWNiFO0HDvMPBtQosk45w4ddFI+eEJ4=;
        b=c+uzW9OLbAlUqB0VeyoINvmqMyFrdLjlFDLo2Kr3mHEtXexqQXTncp8E0+GTlO3xqk
         J9UqvaiFtpfW6c2Ff2TLdx2cU8QIg68MN3jOhvUJcmiTrwNcGJVn1lg0y4bTfm/B/g+O
         gKLzCQk+sFw8reWappGUtlM84CkX6RC71ZrTzHGFxrEo9HI5w11IO1cRwj2sO9VHIpAK
         yNYWZPh33CZbGBAuT3rhH0io1JSWes228EXHDmRyZoCcabJ79C/WzqI1vecLnbsPA7/U
         Uy3+l6tnZbjsEWINdjUq14QE549bYX7LXJP70ezjHJVyx4UjzDMix4Eh/g8NVPedIHl/
         SLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750896730; x=1751501530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lowV/nKzWTvWfWNiFO0HDvMPBtQosk45w4ddFI+eEJ4=;
        b=AFKA6ZrX1UvFCO97CN1tiM3tJYqAtYDcqMltnp8rqYjnB5QDVF1jLvVng9YiqsTIgv
         bNdBqHLinGnE5PDJJvuqY9LgZMu391rzW1wzIildH0kWzzdi1SnSeILhcjAxVjsL43W2
         uIuUNSFDHIbR7ghFwqaPPLSTIUbwkl3Am9AyPx/znDa755iZSZRrvRF4I+mfEAtNfWln
         KSIJXSdXr63SGCwru2Up1/U8z0JvqVGbvVJ4+D40m1AOJYHnaisZwrS1uus/cT2znLXT
         BXBZ0AaW76cCwmkPXT2C+gCp05m80xYhZD9m8HcdybWmz/Mq01nATDeYrEpP679d3YBB
         ZAOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8M8ogWiTp8wWCWrhdSJRjCkgt5CLUU/8dCX41ELoRV/OAXAfXBmHlGYV3bOJYjzcX6Unjbng863XmAcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKFgtlnfZnE0EzQMlk8CN5VyODHQz0SLz3Bzha+BU3eH5DiSTO
	zIun7MGBJX7c56lEsh51hhec6QMO8HXMrh2dr9WtaP527DP38Pm6Lz5h
X-Gm-Gg: ASbGncuTpYp/hQl446ugnxd745Q9wdXkbTsYG3Ef45CFpinI9BOT5Ob2LqmbEy9Uavw
	jsc8XODf5Zu22YRftTaoERtEZ+rSbGSjd52TKSY96nkCWEG5peqgx93OBY+eOYhlV8VOOAVKo9h
	gnARp+N3eiAwxSi923I7KLnpr11mJ2Ta7pu8Y77gwBLBTwkZ/p+F5mfkzO3nGFRo45YB1tclSVu
	TSpeshBxG9ytOXxGqqyw6HEjZZJr0kVmLE+WMlzFOSWechaJTFDnUzT/V7cgGxwQbWdB54DTcum
	Nwvo0kIXOZrgLtXVbX1tqjJRqWlhtjK4ZhXfZfwP36eHFmkWd3+DqDHlH0syKA==
X-Google-Smtp-Source: AGHT+IFdjaJJtcu1Ur4K2yZ0JHexKIy67/OGUnCR0lz66MZ8PefNDV+iP31fY0J968Af1oTeT5n7Nw==
X-Received: by 2002:a17:902:f681:b0:234:9670:cc73 with SMTP id d9443c01a7336-23823f65de5mr93831885ad.5.1750896730581;
        Wed, 25 Jun 2025 17:12:10 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d869fbfcsm151610165ad.194.2025.06.25.17.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 17:12:10 -0700 (PDT)
Date: Wed, 25 Jun 2025 20:12:08 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tglx@linutronix.de, maddy@linux.ibm.com,
	vschneid@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	kprateek.nayak@amd.com, huschle@linux.ibm.com, srikar@linux.ibm.com,
	linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu,
	linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
Subject: Re: [RFC v2 7/9] sched: Add static key check for cpu_avoid
Message-ID: <aFyQWLpI8B8B1AoM@yury>
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
 <20250625191108.1646208-8-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625191108.1646208-8-sshegde@linux.ibm.com>

On Thu, Jun 26, 2025 at 12:41:06AM +0530, Shrikanth Hegde wrote:
> Checking if a CPU is avoid can add a slight overhead and should be 
> done only when necessary. 
> 
> Add a static key check which makes it almost nop when key is false. 
> Arch needs to set the key when it decides to. Refer to debug patch
> for example. 
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> This method avoids additional ifdefs. So kept it that way instead of 
> CONFIG_PARAVIRT. 
> 
> Added a helper function for cpu_avoid, since including sched.h fails in 
> cpumask.h
> 
>  kernel/sched/core.c  | 8 ++++----
>  kernel/sched/fair.c  | 5 +++--
>  kernel/sched/rt.c    | 8 ++++----
>  kernel/sched/sched.h | 9 +++++++++
>  4 files changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index aea4232e3ec4..51426b17ef55 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -148,9 +148,9 @@ __read_mostly int sysctl_resched_latency_warn_once = 1;
>   * Limited because this is done with IRQs disabled.
>   */
>  __read_mostly unsigned int sysctl_sched_nr_migrate = SCHED_NR_MIGRATE_BREAK;
> -
>  __read_mostly int scheduler_running;
>  
> +DEFINE_STATIC_KEY_FALSE(paravirt_cpu_avoid_enabled);
>  #ifdef CONFIG_SCHED_CORE
>  
>  DEFINE_STATIC_KEY_FALSE(__sched_core_enabled);
> @@ -2438,7 +2438,7 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>  		return false;
>  
>  	/* CPU marked as avoid, shouldn't chosen to run any task*/
> -	if (cpu_avoid(cpu))
> +	if (cpu_avoid_check(cpu))
>  		return false;

Here you're patching the code that you've just added. Can you simply
add it in a proper way?..
