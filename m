Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B065A1D31B8
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 10:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738922846; cv=none; b=JxTKTeWl7NPULVBmCdF5DF4LBFwlbvVpNAlSCqM4/hhZHt8JTAw2nwM+xq52yTiUTBupzdtRaVshdnFcwV/tP4MMCGjBe+nnrnc17+2Rrc02whMmp9UW4UGS9R5aYiI2ctxHzrEBIFo7XrSq9ms3d5yawSYCJ27mzpLtey1Urpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738922846; c=relaxed/simple;
	bh=GT+XXJMNXbLhJ8TICBhxkuKrGMJnMpv9dew+cLQhPbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s58z0la17L79vnC3f1dEsSU4JEK/xMl7o8Vaqb+sti2anrkmsvLxW8qw4Bh5FXASuIfoUAE3v8rqp568gk2PDqMv4K1BjgChXT49955vHag8NWCkb6/gZCpjOjhKwph0tQPddZfPy28JyMqr79aTtG3ikxshso3tKSj2yGV4h04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab2b29dfc65so306896466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 02:07:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738922843; x=1739527643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3iWmvu/OmKCcytvFJIWWLBL2bG2167P2E3oWjA2zDQ=;
        b=XJM84mFsFxsZ8NIiRJpQaXZs8C+bkLUk1JWMxOlH0W1Sp3OCERoOTY6lXY9EWjr7AB
         1hL5U0YqhkysbUYLMEeFmSIaLn+AUvcqu5cQeXpxMosPRRpS/VRE17bnWoXt2yq4Cnrb
         1I0u/1wShvvFFnzduToPMxYWjL05eBdeZ6WoAv9yCmpBjxtwPh0C989ohSsn/SYw95qd
         QTFgBeP0cqaQUbGCtwPRgNNweSQ2F4FVh+WRyLT+Z+3P6adn5Eqyer/BOr9SBuFXSZRe
         is1ajzt1bM/bGtDBxyTetAZbVsW0CHluYeB9e64wxmSHh/9mzWS8J1cjHQWsG0gYQekr
         gAcw==
X-Forwarded-Encrypted: i=1; AJvYcCX/n03yr3wA9A17HDV4l1CIRZg3uPTPw414uMpVR7l8hX6iw8Um84+yEzR2P4oVv0sYenw8t9D5Nnmk/mQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN2xitnEikxujPVXKMIOakdRdTWuxGuV2lbgO6+jfJb59XwzcT
	ZbBHNzUbYfQIb/UWSwv4320uBdNT0rU+CrsQ/bjbnXru5BC2KCVZ
X-Gm-Gg: ASbGnctd2IYmcHXMwwZ8puKgHrlJQpkwJRmjE1sp2ngzgfo26xODNIE7Bpodt/KYiPw
	E1TfN3ONnaIM3UHFMN4dXdOGs9MNVCpZEwMzcqUYS5nrhW/OYE87beqr/JC/1bwtVMvt57SCSSd
	7T5WReDTGay/GQkzXJv0z5FICsCsRoi+Hn02fgN8nAVz2UkLoiwg1EmFiem3sP5MSfSkFc4+M3C
	+DoYjF3PMIAiwD5aIqcOSEjyK9TJMI9noeMCech1qCvguh03bluHyxNwAlGQAWATfZW9jWttfaZ
	856SDxg=
X-Google-Smtp-Source: AGHT+IGmLM3v9GshB9fjOvCfj8EJ7zshJat9r7kz88enMZaHEy5nG7w++XtnS4gLKZ9hfRNQcf/NzQ==
X-Received: by 2002:a17:907:d204:b0:ab2:b77e:3357 with SMTP id a640c23a62f3a-ab789b34e3emr222927466b.18.1738922842710;
        Fri, 07 Feb 2025 02:07:22 -0800 (PST)
Received: from gmail.com ([2a03:2880:30ff:72::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b80fa5sm2266800a12.34.2025.02.07.02.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 02:07:22 -0800 (PST)
Date: Fri, 7 Feb 2025 02:07:18 -0800
From: Breno Leitao <leitao@debian.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, corbet@lwn.net,
	qyousef@layalina.io, chris.hyser@oracle.com,
	patrick.bellasi@matbug.net, pjt@google.com, pavel@ucw.cz,
	qperret@google.com, tim.c.chen@linux.intel.com, joshdon@google.com,
	timj@gnu.org, kprateek.nayak@amd.com, yu.c.chen@intel.com,
	youssefesmat@chromium.org, joel@joelfernandes.org, efault@gmx.de,
	tglx@linutronix.de
Subject: Re: [PATCH 03/15] sched/fair: Add lag based placement
Message-ID: <20250207-petite-eminent-husky-7d1704@leitao>
References: <20230531115839.089944915@infradead.org>
 <20230531124603.794929315@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531124603.794929315@infradead.org>

Hello Peter,

On Wed, May 31, 2023 at 01:58:42PM +0200, Peter Zijlstra wrote:
>
>  place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int initial)
>  {
<snip>
> -		vruntime -= thresh;
> +		lag *= load + se->load.weight;
> +		if (WARN_ON_ONCE(!load))

I have 6.13 running on some hosts, and in some cases, where the system
is getting some OOMs, I see the following stack:

          WARNING: CPU: 29 PID: 593474 at kernel/sched/fair.c:5250 place_entity+0x199/0x1b0

           Call Trace:
            <TASK>
            ? __warn+0xd1/0x1b0
            ? place_entity+0x199/0x1b0
            ? report_bug+0x140/0x1c0
            ? handle_bug+0x5e/0x90
            ? exc_invalid_op+0x16/0x40
            ? asm_exc_invalid_op+0x16/0x20
            ? place_entity+0x199/0x1b0
            reweight_entity+0x188/0x200
            enqueue_task_fair.llvm.15448040313737105663+0x28c/0x560
            enqueue_task+0x30/0x120
            ttwu_do_activate+0x99/0x230
            try_to_wake_up+0x25a/0x4a0
            ? hrtimer_dummy_timeout+0x10/0x10
            hrtimer_wakeup+0x25/0x30
            __hrtimer_run_queues+0xf1/0x250
            hrtimer_interrupt+0xfb/0x220
            __sysvec_apic_timer_interrupt+0x47/0x140
            sysvec_apic_timer_interrupt+0x35/0x80
            asm_sysvec_apic_timer_interrupt+0x16/0x20

I am sorry for not decoding the stack, but I am having a hard time
decoding the stack properly. The values I got was misleading, and I am
working to understand what is happening.

Anyway, I don't have a reproducer and this problem doesn't happen
frequent enough. I have 1K hosts with 6.13 and I saw it 5 times in the
last week.

Also, this is happening in 6.13.1.

Thanks
--breno
