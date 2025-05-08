Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96271E3DDB
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 11:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746703752; cv=none; b=KRbTs8BF6HCtpnq9VXmAvoIB9BP0w4p+/n4J6sCsO7/kvF5RhK0cqXOm7N8HMHIPis7L7jMl8tbwc0PiX8KINFXkSXBzrH+vtBX/d74z34KvnhA4ljUmt7RrT8BRAtIUjBWDqhkvFe5ts46yQZccV/xodjtGcE7dL9a5krzU32I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746703752; c=relaxed/simple;
	bh=xpYchZCplIfg8HKrEsPwShb9bi/+ZGA67nS38hZDn9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RI3kRlIVcFLxHwCdXOW/Gt7bBParWJeoU594IlnWZz25xVQiMybR2eSz5DLhQbd2p6xbme0MoRDpn09KQPs2B5nBbK5alqEuD1efbaf8bwRMDPUpeC8dsisgaJnGp+OiMTK2UF+nrQmxI3yGUlCWJPfBh3Ag4Go4UQf5mZ6ZTlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fzxtI8BI; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fzxtI8BI"
Message-ID: <60686dc1-5b8b-47c8-b7b6-2348f2ce58c7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746703747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e/v6JeouaMEXInKNfep2mCJjgolN1hc+ZaO0xsg6Qxc=;
	b=fzxtI8BIBjMo7V0ZmhsLACfkwzJHyViZBBfjOtJJ5Z+Dq1HV+Zlo+y/i+/jCTtkOSG6tMt
	aPP4JyIyjVw1gQMRWoa49KFE+08w1rrOfhxGXQUxzaAERbAjcVbuCn8wSqSm3vCGfV27ia
	MCgXQ+Kvn7QPOKxxRB6kpfGAQc3RRos=
Date: Thu, 8 May 2025 12:28:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] ptp: ocp: Limit SMA/signal/freq counts in show/store
 functions
To: Sagi Maimon <maimon.sagi@gmail.com>, jonathan.lemon@gmail.com,
 richardcochran@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20250508071901.135057-1-maimon.sagi@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250508071901.135057-1-maimon.sagi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 08/05/2025 08:19, Sagi Maimon wrote:
> The sysfs show/store operations could access uninitialized elements in
> the freq_in[], signal_out[], and sma[] arrays, leading to NULL pointer
> dereferences. This patch introduces u8 fields (nr_freq_in, nr_signal_out,
> nr_sma) to track the actual number of initialized elements, capping the
> maximum at 4 for each array. The affected show/store functions are updated to
> respect these limits, preventing out-of-bounds access and ensuring safe
> array handling.
> 
> Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
> ---
> Addressed comments from Simon Horman:
>   - https://www.spinics.net/lists/netdev/msg1089986.html
> Changes since v1:
>   - Increase label buffer size from 8 to 16 bytes to prevent potential buffer
>     overflow warnings from GCC 14.2.0 during string formatting.
> ---

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
