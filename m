Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DA122D7B5
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 20:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747428782; cv=none; b=jhqjM9SnBLq13u4twknzRzGMsO8RSCjbfmxgxNEu1pXLFpd2I6QJXxflKG7+e9YNvJfieeVVuh+FJ75RcxDcd6Fdz0fm+JmANao/12bHfZ65fmI+6T3TbM55Y3cYjFF4ElCu9ccw985UyZ3q+/uRkNTxDbzggQMw5D97BLLF46I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747428782; c=relaxed/simple;
	bh=m3S0XpbiaHEmOTQFd7wsSo1Y7TTbUT0TtuI2heJSPvI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NxPTUGEbqFyp/bGLr6PJH/i3Oj3xt2aJwwJVEf6d/n0oLyFZhNVVIdXAhTq9C8nJ8/oubFd5Ku9S1FyuKs70reqx6CGOthRoh3KbFTQZ5sj5RhN9ZmMhJ3KO9TDG1JWTO0e/1Zc/UE9P1lrPoaSfrzg19tpwZiI1k8dsPcfahzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ImvYb2ur; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ImvYb2ur"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
	Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=p7hZMnAjaDBzYbpb421535ssCDDcfVd9fB504+oCGGA=; b=ImvYb2urvm0sH43X1efYjAxBqA
	e+NCvqV3M4dE1Fire7Oy18DnAqz/8hSIXcNQoCP6R6sVz80cJoDh2zZd8udz47S+e93fMSVUfisae
	QTluJmNHBdLZoNYH9qaXUx5aMExVAy15fvEXqdQN90KUQwzKXKS375PK4kdFXKfT2isaIglxaTFQy
	a1cD2WDzJoxE+u0/8SNnaHwr80iRFcCroNnRgcuD3b09smwIW02f5OiV73IKz9RDlowVnSCP7EDDr
	ci4lxHO9QCUJErA6EWh6wgnJazPsNfH9vwzimNEcXqUOUBI+jUQJ/evlCUDYZcI0gJyVb47bmMLAp
	xqV5hHlA==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uG1xK-009FB6-3O; Fri, 16 May 2025 22:52:56 +0200
Message-ID: <6f47c731-47dc-401a-9337-013f5f96ab1c@igalia.com>
Date: Fri, 16 May 2025 17:52:54 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Subject: Re: [PATCH 5/5] futex: Correct the kernedoc return value for
 futex_wait_setup()
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
References: <20250516160339.1022507-1-bigeasy@linutronix.de>
 <20250516160339.1022507-6-bigeasy@linutronix.de>
Content-Language: en-US
In-Reply-To: <20250516160339.1022507-6-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 16/05/2025 13:03, Sebastian Andrzej Siewior escreveu:
> The kerneldoc for futex_wait_setup() states it can return "0" or "<1".
> This isn't true because the error case is "<0" not less than 1.
> 
> Document that <0 is returned on error. Drop the possible return values
> and state possible reasons.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---

Reviewed-by: André Almeida <andrealmeid@igalia.com>
