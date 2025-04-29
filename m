Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC1E279780
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914538; cv=none; b=unSfBz2K0UGuxvIcW0WcaTjBgvCFXcrixPx6foQEx87rlM9JJpOtfLrGTTM+4iI/w/gCt2Sr6T4k0jqCH2ypgHCNKc9XQheotFlp4HTvqjbcdgQhPfoVEOfaY8ZRE7c7+qkm62ok0ulQuetzatwYLnlDsh9kAcKpqM6wzWPyNVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914538; c=relaxed/simple;
	bh=7fy6moOOambnFYILYkejWXutptF26xmphS+DWVN/iFU=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=NYR1bRuUbSlv4ZficEcPnP9YysYEhLo+IPj2ZwATRDrCxKgg1KT39laL6fcpcn3TARcQwiUc4dwxCXR+t0R7Rnr1Vl2Ux9wHKAQsRbSV1dDJsA2lqLiMS2moFzZqCd/wAfGxp0lL8TPR5nxvPvnWB31YE26BSROmf/J/Uh2nikI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUc6aeHg; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUc6aeHg"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22409077c06so91309345ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745914534; x=1746519334; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f6fYPjchEVexeVAt+waLr9ZsiEyyniHtVjEF0eju+hU=;
        b=PUc6aeHg5LA11zgDZzV+q9+ntxCyEEiq/Ql3u7S2xOIMtQmbQ0K7E8TnK9vXLagrKc
         S1tF3fRb7PYNiSQuXqE8eI27CK+SN+GspKcYTx14f/E11uyP3B90INq3IYo/EfPZnVua
         n2kuQh7ZwS5CdNY7ZQ+0Yf8fSYIL2UV8n540UQA18vty1BDHsMM+Z97DhrbuKEXIuj0c
         eye5pQdz7Ecifs6+b+uFYY48QgZi7VMjPtaOxHiGY3xPcn1YXNUTOKzaOMSX2qqrGAlZ
         HrOPWq5Q5oireAzci0gkOtGtgwqRx8hHQxLHE1Dbpto916ujvsAjuSEG/OwMp5MRUW+d
         L9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745914534; x=1746519334;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f6fYPjchEVexeVAt+waLr9ZsiEyyniHtVjEF0eju+hU=;
        b=pwiUJoufioV+XU6MkR60uGdkmbc2kXDLjC/4xRGdGf3IUwNNgk/j/rrHFJsOl/vZLJ
         7EkCpL6Sko7fV/+K+cXm7x3zNQe4o0qXZ4qzI1IE7k/2GJvPcyc2Klrs40vd4FaXlwzk
         05iKZjwocHSSMLYUbmNyLsSriz3bE5Pj/S8s7ro2HFfMuvaH4e9fX0jb8Oekar60tpPG
         /4/6XcIKGe6bO2orIs9VpTfNUT2MXS/rkV2ifYzHAUgyc22jrBwt1g9NGaT8Tx8Nr0pZ
         7B/4ExCYmTIZelB3s4VZHRxWReJ3uYylfIXTqUovyroUV0YmlqzkJPaxP3zyqpnESZgZ
         0HIg==
X-Forwarded-Encrypted: i=1; AJvYcCUcgRKclERG7S15965sOcoLNKeRtGVjqmsr/0mkcOmOi1g+GGxwKuFVLHyzLn6UXCjZxtKoz+MnV6KB1Gg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNI6HjRDeC8rC/+58E383tYkmdkRcOpYUzwWJrIcYBhOpE/xQX
	/agmaiQ/cUY+r2jwNqAHwJQRpkdhES1q9NfyPUA//tbXpiZaLpgN
X-Gm-Gg: ASbGncs5fFzJ7Z+f6vALw5jhVagHXtQCG8TOFwfvhenoG5GjKJL4FKlyUTmWdFKFX93
	Ju7KsVxN/hdGIvYPk796XgZRDq3tzMGphSKFiFmko7IFvQC7lWlvGQqrAPEhhHkjkl/spKHP/Dh
	7M+FdBVsGTGnS+OnDk7XwjRHUc1sLJBEHM/g/eQ9v10imxnk5u2CeI+qX39PF7Y9Ok4jIjNSc/0
	VVWtI264DVoCRkz7VqqxVcx+GrsCHRJF1ax2cUTh26fdhmyrGVfoZSBYigi4hi4DMod4bskgLnJ
	sBO5utDMs0ONs3sLWmHasShZzxjqQRNNlECsSO7xixrtXMKsVkGb7UgHBuGtjaEmrR/pM8OK3xC
	ZCC9ZlKB02xgZRTdLT82TlQ==
X-Google-Smtp-Source: AGHT+IHUQ1jABd3WZ2kcIyr8RG6NPr95Jt4svQvdQVTgytoHii8s0kMkD+dsZoe1QhqDgoj6m8xjCA==
X-Received: by 2002:a17:902:e804:b0:223:f408:c3f7 with SMTP id d9443c01a7336-22de5ed1414mr39005455ad.16.1745914534288;
        Tue, 29 Apr 2025 01:15:34 -0700 (PDT)
Received: from [192.168.1.105] (88-187-52-200.subs.proxad.net. [88.187.52.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7749938sm8703188a91.11.2025.04.29.01.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 01:15:32 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------02e6QfW0DSR3Gi4SiTtL2LoH"
Message-ID: <609e6fe5-2893-4c13-8e52-e9df05146ffb@gmail.com>
Date: Tue, 29 Apr 2025 10:15:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/topology: clear freecpu bit on detach
To: Doug Berger <opendmb@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org
References: <20250422194853.1636334-1-opendmb@gmail.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 WlfRzlpjIPmdjgoicA==
In-Reply-To: <20250422194853.1636334-1-opendmb@gmail.com>

This is a multi-part message in MIME format.
--------------02e6QfW0DSR3Gi4SiTtL2LoH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/22/2025 9:48 PM, Doug Berger wrote:
> There is a hazard in the deadline scheduler where an offlined CPU
> can have its free_cpus bit left set in the def_root_domain when
> the schedutil cpufreq governor is used. This can allow a deadline
> thread to be pushed to the runqueue of a powered down CPU which
> breaks scheduling. The details can be found here:
> https://lore.kernel.org/lkml/20250110233010.2339521-1-opendmb@gmail.com
> 
> The free_cpus mask is expected to be cleared by set_rq_offline();
> however, the hazard occurs before the root domain is made online
> during CPU hotplug so that function is not invoked for the CPU
> that is being made active.
> 
> This commit works around the issue by ensuring the free_cpus bit
> for a CPU is always cleared when the CPU is removed from a
> root_domain. This likely makes the call of cpudl_clear_freecpu()
> in rq_offline_dl() fully redundant, but I have not removed it
> here because I am not certain of all flows.
> 
> It seems likely that a better solution is possible from someone
> more familiar with the scheduler implementation, but this
> approach is minimally invasive from someone who is not.
> 
> Signed-off-by: Doug Berger <opendmb@gmail.com>
> ---

FWIW, we were able to reproduce this with the attached hotplug.sh script 
which would just randomly hot plug/unplug CPUs (./hotplug.sh 4). Within 
a few hundred of iterations you could see the lock up occur, it's 
unclear why this has not been seen by more people.

Since this is not the first posting or attempt at fixing this bug [1] 
and we consider it to be a serious one, can this be reviewed/commented 
on/applied? Thanks!

[1]: https://lkml.org/lkml/2025/1/14/1687
-- 
Florian

--------------02e6QfW0DSR3Gi4SiTtL2LoH
Content-Type: text/plain; charset=UTF-8; name="hotplug.sh"
Content-Disposition: attachment; filename="hotplug.sh"
Content-Transfer-Encoding: base64

IyEvYmluL3NoCiMgSG90cGx1ZyB0ZXN0Cgp1c2FnZSgpIHsKCWVjaG8gIlVzYWdlOiAkMCBb
IyBjcHVzXSIKCWVjaG8gIiAgIElmIG51bWJlciBvZiBjcHVzIGlzIG5vdCBnaXZlbiwgZGVm
YXVsdHMgdG8gMiIKCWV4aXQKfQoKIyBEZWZhdWx0IHRvIDIgQ1BVcwpOUl9DUFVTPSR7MTot
Mn0KClsgJE5SX0NQVVMgLWx0IDIgXSAmJiB1c2FnZSAxPiYyCgpNQVhDUFU9JCgoTlJfQ1BV
Uy0xKSkKTUFYPWBjYXQgL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUva2VybmVsX21heGAKClsg
JE1BWENQVSAtZ3QgJE1BWCBdICYmIGVjaG8gIlRvbyBtYW55IENQVXMiIDE+JjIgJiYgdXNh
Z2UgMT4mMgoKY3B1X3BhdGgoKSB7CgllY2hvIC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dSQxCn0KCmNoZWNrcG9pbnRfdGVzdCgpIHsKCWlmIFsgJCgoJDEgJSA1MCkpIC1lcSAwIF07
IHRoZW4KCQllY2hvICIqKioqIEZpbmlzaGVkIHRlc3QgJDEgKioqKiIKCWZpCn0KCmVjaG8g
JyoqKionCmVjaG8gIlRlc3RpbmcgJE5SX0NQVVMgQ1BVcyIKZWNobyAnKioqKicKClRFU1Q9
MAp3aGlsZSA6CmRvCglOPSQoKFJBTkRPTSAlIE1BWENQVSArIDEpKQoJT049YGNhdCAkKGNw
dV9wYXRoICROKS9vbmxpbmVgCgllY2hvICQoKDEtT04pKSA+ICQoY3B1X3BhdGggJE4pL29u
bGluZQoJVEVTVD0kKChURVNUKzEpKQoJY2hlY2twb2ludF90ZXN0ICRURVNUCmRvbmUK

--------------02e6QfW0DSR3Gi4SiTtL2LoH--
