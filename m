Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E678123ABA3
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750409089; cv=none; b=pqNChEWn/6kpxEGkMlMKKHcC5pvg1+pu47t3xqnTTq8t984pII1XfXbKzTr6bK/R2AYt8O9iiTq72L4uf8kwpHlQIb0YQFFqtxNIKf3bQD6VTBQko+6FkJiSclNGlB2U+qk4md9tVBM6V5+H+k1Tikkdjk31r1n9F3Snhp5KocI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750409089; c=relaxed/simple;
	bh=O1uqg9NwSbzeIw2lb8hAr7/+RNfd/v25wGjZEozZeNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sgk3QrPZ5i5X6Ic9Z2MX8ls663Smf4JUepP4og01m7SeK3dAPY1X68cvaeEeBYOUkKhBs+qX0ssKYjZGkpEsEb6n6Xeu4kG28hEDGo7u4p8Mcmw9OQOeGIhVNVgpekdyxDJpvDYB75qrepbZmDWS797hdCQcNlS9MzGfqvlU4VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 883EF176A;
	Fri, 20 Jun 2025 01:44:26 -0700 (PDT)
Received: from [10.57.84.60] (unknown [10.57.84.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0EEC03F58B;
	Fri, 20 Jun 2025 01:44:44 -0700 (PDT)
Message-ID: <9c5bf40a-b0d8-414c-a0c9-f5da5d9b612d@arm.com>
Date: Fri, 20 Jun 2025 09:44:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] CoreSight: WARN_ON in coresight_disclaim_device_unlocked
 due to register reset on CPU power-cycle
Content-Language: en-GB
To: Keita Morisaki <keyz@google.com>, linux-kernel@vger.kernel.org,
 alexander.shishkin@linux.intel.com
Cc: Yi-ming Tseng <yimingtseng@google.com>, Eric Chan
 <ericchancf@google.com>, Leo Yan <leo.yan@arm.com>,
 James Clark <james.clark@linaro.org>,
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
 Mike Leach <mike.leach@linaro.org>
References: <CAGo=-X1K1qZ_p9X0yeKy8Wm4QMDs2+4VE08LUNKOCrA15KFLTA@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CAGo=-X1K1qZ_p9X0yeKy8Wm4QMDs2+4VE08LUNKOCrA15KFLTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Cc: coresight lists, Leo, James, Mike L


Hello !

Thanks for the report ! In the future, please use
scripts/get_maintainer.pl for the clear list of people/list
for reporting issues.

Response inline, below.

On 20/06/2025 08:21, Keita Morisaki wrote:
> Hello folks,
> 
> I am writing to report a WARN_ON message I'm encountering in the 
> CoreSight driver on a multi-core ARM system running a 6.12-based kernel. 
> The warning appears consistently when disabling an Embedded Trace 
> Extension (ETE) source after it has been active. The issue is not 
> reproducible when CPUidle is disabled.
> 
> The problem occurs because the driver assumes the CoreSight claim 
> register is persistent, but it could be reset by the CPUidle power 
> management flow. The section B2.3.2 of Arm CoreSight Architecture 
> Specification v3.0[1] indicates that the claim register must reset at 
> “reset”. A CPU power-up from an idle state can trigger a Cold reset, 
> which might explain this behavior.
> 
> My ftrace analysis confirms this. I traced the only two functions that 
> modify the claim state: coresight_set_claim_tags (which sets the claim) 
> and coresight_clear_claim_tags (which is the only part of the kernel 
> that writes to CLAIMCLR). The trace shows the claim being set, followed 
> by a CPUidle transition, but no subsequent call to 
> coresight_clear_claim_tags.
> 
> Here are the steps to reproduce the issue:
> 
> modprobecoresight_etm4x
> 
> # Enable any relevant sink
> 
> echo1>/sys/bus/coresight/devices/ete0/enable_source
> 
> echo0>/sys/bus/coresight/devices/ete0/enable_source
> 
> 
> Here is a relevant snippet from the ftrace log that illustrates the 
> sequence:
> 
> #tracer:function_graph
> 
> #
> 
> #CPUDURATIONFUNCTIONCALLS
> 
> #|||||||
> 
> 0)|coresight_claim_device_unlocked[coresight](){
> 
> 0)3.750us|coresight_set_claim_tags[coresight]();//Claimissethere
> 
> 0)+20.260us|}
> 
> 0)|/*psci_domain_idle_enter:cpu_id=0state={Our PSCI parameter value}*/// 
> CPUgoesidle
> 
> 0)|/*psci_domain_idle_exit:cpu_id=0state={Our PSCI parameter value}*/// 
> CPUwakesup,causingColdreset
> 
> ...
> 
> 0)@309346.3us|coresight_disclaim_device_unlocked[coresight]();// 
> TriggersWARN_ON
> 
> 
> The following WARN_ON [2] is printed because the CLAIMCLR register has 
> already been reset at the time coresight_disclaim_device_unlocked is 
> called, contrary to the driver's expectation.
> 

We have the ETM driver performing the save/restore of ETM context during
a CPUidle. This is only done when the ETM/ETE is described to be loosing
context over PM operation. If this is not done (via DT), the driver
doesn't do anything. This could be problematic. Could you try adding:

"arm,coresight-loses-context-with-cpu"


property to the ETE nodes and see if it makes a difference ?

Kind regards
Suzuki

[0] 
https://elixir.bootlin.com/linux/v6.12/source/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml#L79 



> [416.354181][C0]WARNING:CPU:0PID:0atdrivers/hwtracing/coresight/ 
> coresight-core.c:187coresight_disclaim_device_unlocked+0x84/0x9c[coresight]
> 
> [416.535454][C0]Calltrace:
> 
> [416.538606][C0]coresight_disclaim_device_unlocked+0x84/0x9c[coresight]
> 
> [416.549359][C0]etm4_disable_hw+0x2d8/0x374[coresight_etm4x]
> 
> [416.623310][C0]do_idle+0x1d4/0x264
> 
> (Note on tracing: To get this detailed trace, I made two modifications 
> to the kernel. First, since the trace_psci_domain_idle_enter/exit events 
> are not available in kernel 6.12, I cherry-picked the upstream patch 
> 7b7644831e72 [3] to add them. Second, to specifically trace the claim 
> functions, I temporarily replaced their inline compiler hints with 
> noinline.)
> 
> Given the evidence, it appears the driver's assumption that the claim 
> register is persistent across CPU power states is incorrect and may need 
> to be addressed.
> 
> Could you please provide your guidance on this?
> 
> Thank you for your time and assistance.
> 
> [1] https://developer.arm.com/documentation/ihi0029/latest/ <https:// 
> developer.arm.com/documentation/ihi0029/latest/>_
> _[2] https://elixir.bootlin.com/linux/v6.12/source/drivers/hwtracing/ 
> coresight/coresight-core.c#L187 <https://elixir.bootlin.com/linux/v6.12/ 
> source/drivers/hwtracing/coresight/coresight-core.c#L187>_
> _[3] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/ 
> linux.git/commit/?id=7b7644831e7276f52a233ec685d13c965fff09d9 <https:// 
> web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/? 
> id=7b7644831e7276f52a233ec685d13c965fff09d9>
> 
> Best regards,
> Keita

