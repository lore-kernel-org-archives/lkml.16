Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA8F288DA
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747400445; cv=none; b=SbuujFGXQugA2J31cTO0AFQEl269ogOLqUhUVixLJtb+ug5/RiaOMvdGslyf7rqCeaMsV218FB1LeagcUS8DRkda1bACiYrC+RimrF+IitdGcZcejsUFHb4FWQWslSzcHwk6SjrTwoPuCH0y4YlfASZhd+aelHoIgA5ez5hxOKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747400445; c=relaxed/simple;
	bh=PWP4LH9xR2HpDA5u4cqtd86qoVPk0fysIaqESMWoHhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tKzxjntrK4imH2pGJqebUq7d1+jpOKETwsQ/1AAbSOzQG5puub0H5bGgRlVSa6SS9dqW1iEYLIkd1ycOWS3I7SX7b64tLDdwVHomOQUKtKNsXTDx9feiDQPvJQ920EWQgUaODQiqAKuXFnubxenp/pqZi2CcSmfaq0p69yqF6Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=DKdO7lef; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="DKdO7lef"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JMlS1qozVnD4sPHAMw0lOaAueEL7RjhSNxCAWJP+y1c=; b=DKdO7lefgYrTwBrdVu74affOy2
	QljTpv79QeAX6xgsiIlsaRGkYgC4M8vmYuDy2KBRRlur6jXNv44aqDP/riAmLsUqC6fMdBe/KNDy3
	a+VfyJW8U4QG8JYwaDud9czsWwmO+kL4tENyDnMERd1BK4wYAZqOAkYO3myTcyyNXwGSpZ33RD6Xo
	qkLAI0fKZ+nnwAw6WRFUtTH6eu8crApFE/ZcV7OvpkIK2/07Bw8AqGeXgheCIc3yYW+tKXXJADxwt
	Q+YVkuNMEqP3ixj32CDm0BSd60Tnet/1jFD2kBP6QiF8yjLoBI/wsin+kOuBU/pc2pJFxJIUA6o7Z
	A5xjrNoA==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uFuaF-0095nh-Vm; Fri, 16 May 2025 15:00:38 +0200
Message-ID: <18c1df5c-4cbd-4f4b-99ac-ca7c87414461@igalia.com>
Date: Fri, 16 May 2025 10:00:34 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 14/21] futex: Allow to resize the private local hash
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-15-bigeasy@linutronix.de>
 <986dcbc0-0505-496a-ae75-e0c1bd7c2725@igalia.com>
 <20250516104921.sy7Z-oy_@linutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250516104921.sy7Z-oy_@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 16/05/2025 07:49, Sebastian Andrzej Siewior escreveu:
> On 2025-05-08 17:32:24 [-0300], André Almeida wrote:
>>> +			if (!__futex_pivot_hash(mm, new) && custom)
>>> +				goto again;
>>
>> Is it safe to use a goto inside a scoped_guard(){}?
> 
> We jump outside of the scoped_guard() and while testing I've been
> looking at the assembly and gcc did the right thing. So I would say why
> not. The alternative would be to do manual lock/unlock and think about
> the unlock just before the goto statement so this looks "easier".
> 

Ok, thanks for conforming it! I wasn't sure about the goto but now it's 
clear to me.
