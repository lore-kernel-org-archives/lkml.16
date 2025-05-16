Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A597F23D29C
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 20:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747426450; cv=none; b=cRE3VoKgXZEO5eJ5aAXVwGArZ0j7THjkH43rOh6wRjXIhQXhm/gi1Lp1LeGc3wbvKJa+ULz9XOX63FQtZSmp4pnxpThHGelNmP32oa7Nf8yrbKjKm2sTgqxnxM17XkvrKUfhjcW8QltIUrmF2kL7jzvJ9G1b19vQcTqmSorA71U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747426450; c=relaxed/simple;
	bh=wJ1ERG124QZG1XZnrsmkBjdlWGpZ/g9ISa9QWkdBWtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Llsc6QJi09mnMRCAZRHBn9aD0nF5OytfQ9dqpSazBgM/A8QKr7285BS0Gr87O63HOE9ikxPxIBM5PlqiQMFm8lPCsydWWM8GSdDrzJ+GkS3OdLZoW7KfCONpdVgNhQMyGogjjneGptO42suS0LLDhE1q/6Y6XGXqeSvicJPx44U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=iuTZMVdn; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="iuTZMVdn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k8ERuPVKnZC8L4XvPy/SmAX2I4zqwTBXpjdkj+mNaGs=; b=iuTZMVdnq1JY0hGmiY0WZporOr
	FveZCylGAQAEsxxEXRg4WldotRDPfuYYFCCzK8nrOfcfEQEgpckzxJn2c85i9ReAieDTTDS/t5SQX
	KwHW2/dmBuTCBEkwpmtHrs4GHpU74sQ3X/0mPO/Ou/ZhBK10+o8l+/EpRCvdoVsHdcU6irdJTrNP2
	MdAOSNhRIdbuTJAR9dX9KHCv1Bf04wBR0bQmw+viy0bp0SL0B+fgAUmuqhrLIjbOkLn+QaRBO+D4U
	BSeYuaak5MN3N0sB7qrjL+fvbA+ey8a4qLS+J2AP5kLWwGY4Y9uEmVJicjbyF7/qBZw46BiEpVR6+
	u1eokfRQ==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uG1Lj-009ETH-I0; Fri, 16 May 2025 22:14:06 +0200
Message-ID: <fc2f8ae1-6760-4a62-9b69-7603b6dfb28d@igalia.com>
Date: Fri, 16 May 2025 17:14:02 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] selftests/futex: Use TAP output in futex_numa_mpol
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
References: <20250516160339.1022507-1-bigeasy@linutronix.de>
 <20250516160339.1022507-3-bigeasy@linutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250516160339.1022507-3-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 16/05/2025 13:03, Sebastian Andrzej Siewior escreveu:
> Use TAP output for easier automated testing.
> 
> Suggested-by: André Almeida <andrealmeid@igalia.com>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---

Reviewed-by: André Almeida <andrealmeid@igalia.com>
