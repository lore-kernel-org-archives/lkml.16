Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB721A704B
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 20:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747426440; cv=none; b=Xcp6XL7OyNyjQQc84gKE2+i9VCKSDz70JufIYH2pJfjVSiwUeg6x+U1TawInolyqvs9lpcqtVQE7t1yr0RF372qACeElpn3nTGWIKb2Bo1oK2LAJ6/RSXkbdESMr9xbq8I9hb9gIcQPH0JfcqAjx5GH0rWnlnoacEN1Fz+1BsAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747426440; c=relaxed/simple;
	bh=MDcSzkqhc+uupgqjf6x+wJl30j3h3JVgcrG8uMivN34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJQtLmfbYLkz0HYBgBCS9CpFZQkUlM1yexgx54asTn8VhEB2pCrIQ5vvnPhNk9kP27zA6MBGeTiEIe/L2FuTvnuX5c3yie5s+TUqkHTd+tAvEPriXUAqwX+TyzykcXHtwBLT2L8OQsXOj0sViSjmq9wabe3AYcr5YoiinVcKC3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=npTpxYGA; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="npTpxYGA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C6wHRJOd+zyZK8Y2kGV8x2oebbYnCbgNySLihj4Ucr0=; b=npTpxYGAGPKv0I+PIwOGwCdL9x
	5AX4Z2TAd6kqZv01z6yCMwjPLpjg5WjwYql8VUbAUBlXLWOQyPd25Swfmcv47CXNvydmvhEcvF1KF
	c47VmyA+nmCFKNgonYwALMXd2xb0cUbvozOOazTyYZB5t+m4X9fbrOBQM0h9Tw13rKcWk563So8Ji
	HVJHpluGTtmNwG65HF2hC79fXERxxwEOoxLqvVg/PZhYoZtNNfzakzk+FAuZSAGezCqgxmfkghBz9
	nFFJm6lvmm++3+H2hTaMrU8SABlCjFwoh3gCEHSZzpgPwVl9cB7kUdwsTtJWGwMOjN3/0Drov1LlF
	uqF8hiGw==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uG1LY-009ESy-1y; Fri, 16 May 2025 22:13:54 +0200
Message-ID: <1b9b4083-9e09-4499-aa84-1d39f1d3cb19@igalia.com>
Date: Fri, 16 May 2025 17:13:50 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] selftests/futex: Use TAP output in futex_priv_hash
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
References: <20250516160339.1022507-1-bigeasy@linutronix.de>
 <20250516160339.1022507-2-bigeasy@linutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250516160339.1022507-2-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 16/05/2025 13:03, Sebastian Andrzej Siewior escreveu:
> Use TAP output for easier automated testing.
> 
> Suggested-by: André Almeida <andrealmeid@igalia.com>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: André Almeida <andrealmeid@igalia.com>
