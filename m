Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C724716FF44
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296966; cv=none; b=nFdlTfB20qEDYelUdHV3YB4EujPtMQOe222A32v6RK8gaYKsd+8Vc0B2IsL+uw2HNKqDi9+aHsnOguqK+Wb9si+tZXStpryJSaaERrTSHD/SEFzLPUim+o0FzpvVDF96++5C/ShgXhfxncRuHurU4ebbdCbqUhgZG58CHttSdMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296966; c=relaxed/simple;
	bh=Qr10PsFwMZMIQKfsiG8JcKSYrrwUNy/ayK2O7SatkDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNSZEZXwEs6AFMj0KenfSXgdEn64NkW8eIc0EJG/tfln2RsmQ2xPVm7hepnca8OdeEhqsSZTDXwziC9GNWXuffv29sxX8oL0jenYt9CXqQTwYf739rAfxZcg7fegcB/H0BBcm5ie8y1l7EGmx12DPpQdsOb8lDponch2YM0yjJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lA2RE0ji; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lA2RE0ji"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F6BC4CEDD;
	Thu, 10 Apr 2025 14:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744296966;
	bh=Qr10PsFwMZMIQKfsiG8JcKSYrrwUNy/ayK2O7SatkDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lA2RE0jioY9lVnnxXBuOtbqvgKR/Smjn5wbCBJNUVeuhdIzvuP6YbpqsjxNt9zXtO
	 DS3nejaXKLWireAUZxY4TJxWj+ThfiEDKoUC0brNFgizGxN02t54ddhFv4k8ilk8Rf
	 +x1dpMfXstyS6DVEr383JuUIQCgFsJZdmEnzSXh0SgMg1js05eZO22umiTIyb4Rq8v
	 fBRrOUW7xvC1DFRPXM64PkS5KAUFMtgg3u3Z1Bf3L1u6XtRDKes11wEf19qehqbAbO
	 085R53XkYhlQWY/wSqeXgfsvkrT9kp7CkcjwRMLktlaPwjG7Dmt0l/OV+Qp4ppgc5d
	 3R9Aeg0d45UsQ==
Date: Thu, 10 Apr 2025 16:56:03 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Waiman Long <llong@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
Message-ID: <Z_fcA2uxfp52eez-@localhost.localdomain>
References: <20250410065446.57304-2-gmonaco@redhat.com>
 <87ecy0tob1.ffs@tglx>
 <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
 <Z_fBq2AQjzyg8m5w@localhost.localdomain>
 <77988036-7550-4ee2-a738-9f9bd4417001@redhat.com>
 <Z_fZJfgwzpz_ccny@localhost.localdomain>
 <a2d6f50e-8f65-4586-b7df-20609bdc111e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2d6f50e-8f65-4586-b7df-20609bdc111e@redhat.com>

Le Thu, Apr 10, 2025 at 10:50:39AM -0400, Waiman Long a écrit :
> 
> On 4/10/25 10:43 AM, Frederic Weisbecker wrote:
> > Le Thu, Apr 10, 2025 at 10:35:55AM -0400, Waiman Long a écrit :
> > > On 4/10/25 9:03 AM, Frederic Weisbecker wrote:
> > > > Le Thu, Apr 10, 2025 at 12:38:25PM +0200, Gabriele Monaco a écrit :
> > > > > On Thu, 2025-04-10 at 10:26 +0200, Thomas Gleixner wrote:
> > > > > > How can that happen? There is always at least _ONE_ housekeeping,
> > > > > > non-isolated, CPU online, no?
> > > > > > 
> > > > > In my understanding it shouldn't, but I'm not sure there's anything
> > > > > preventing the user from isolating everything via cpuset.
> > > > > Anyway that's something no one in their mind should do, so I guess I'd
> > > > > just opt for the cpumask_first (or actually cpumask_any, like before
> > > > > the change).
> > > > With "nohz_full=..." or "isolcpus=nohz,..." there is always at least one
> > > > housekeeping CPU. But with isolcpus=[domain] or cpusets equivalents
> > > > (v1 cpuset.sched_load_balance, v2 isolated partion) there is nothing that
> > > > prevents all CPUs from being isolated.
> > > Actually v2 won't allow users to isolate all the CPUs. Users can probably do
> > > that with v1's cpuset.sched_load_balance.
> > Perhaps, and I think isolcpus= can too.
> 
> No, I don't think so. The following code is in kernel/sched/isolation.c:
> 
> first_cpu = cpumask_first_and(cpu_present_mask, housekeeping_staging); if
> (first_cpu >= nr_cpu_ids || first_cpu >= setup_max_cpus) {
> __cpumask_set_cpu(smp_processor_id(), housekeeping_staging);
> __cpumask_clear_cpu(smp_processor_id(), non_housekeeping_mask); if
> (!housekeeping.flags) { pr_warn("Housekeeping: must include one present CPU,
> " "using boot CPU:%d\n", smp_processor_id()); } }

Ok, good then!

-- 
Frederic Weisbecker
SUSE Labs
