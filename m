Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D262AE7C
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 21:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738185648; cv=none; b=koRTA+lQNFQx96buEdT4dXhUaAEu6ZPgvUEDI6o/gLUioV8uRObMQhurMhORAmj5rEX1ksvGjBvcfuCYh9sda17kD0BJxX2PCNDR536FwXW/8I/ANHfHPXHWBl0GNURZZ2sKHXFzEHXZnqsAjcIsCh6j16T4xkEEii+ISHw2jkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738185648; c=relaxed/simple;
	bh=X4Vt1hgB0RIXoAXaBj053a1Hzi/IcGW3aTYft6oZQN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c4zD1dgOhau/lO1Y+HVBBCxmCQdauindXIFQAOG2z6G6QYys7v/9YnqY30BQOlOm0FIP1tZEE3zfzC+s2/DtYxjfahxhcFWGZMiT8HntkGBCTK/KP4vkYmZYUT4VnMrWCuc2TRL7xYJMiSwxiAGzmJh3uF9roSGqXVrv9nqrVRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qCwBoij2; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qCwBoij2"
Message-ID: <bf0e9c67-b1c9-4e39-8af0-ff2bdc493359@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738185633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9huOPBN/p8VtKMZYUp1GteZOwJEA24wLhGfKuj4zrQc=;
	b=qCwBoij2yV+m3sYW9BABT7t8GyvT6DpFy2iGZxfnIlgGtLE1GuvnebkKWj6rW++k9ve0hF
	Qp+zloVlB7CI5tu/Kz/BhcHntAjhgzYibohhT0vXLWt5APetbeDagiPckx2l89jWVHMiC+
	FLn/amf8j8mMdUGJdyNkLdt5KA7rzMk=
Date: Wed, 29 Jan 2025 13:20:27 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ipv4, bpf: Introduced to support the ULP to get or
 set sockets
To: zhangmingyi <zhangmingyi5@huawei.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, song@kernel.org,
 yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com,
 haoluo@google.com, jolsa@kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, yanan@huawei.com, wuchangye@huawei.com,
 xiesongyang@huawei.com, liuxin350@huawei.com, liwei883@huawei.com,
 tianmuyang@huawei.com
References: <20250127090724.3168791-1-zhangmingyi5@huawei.com>
 <20250127090724.3168791-2-zhangmingyi5@huawei.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
In-Reply-To: <20250127090724.3168791-2-zhangmingyi5@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/27/25 1:07 AM, zhangmingyi wrote:
> Note that tcp_getsockopt and tcp_setsockopt support TCP_ULP, while
> bpf_getsockopt and bpf_setsockopt do not support TCP_ULP.
> I'm not sure why there is such a difference, but I noticed that
> tcp_setsockopt is called in bpf_setsockopt.I think we can add the
> handling of this case.
> 
> Signed-off-by: zhangmingyi <zhangmingyi5@huawei.com>

A nit that I found it useful to recognize different authors of the mailing list. 
It would be easier to have a formatted name. It seems "Mingyi Zhang" was used 
earlier, as seen by searching the git log history.
