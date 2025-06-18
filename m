Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2652EE5FF
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750258680; cv=none; b=FzthoJyJNKvog7A8nFPc6RuoIw85W8WQ88pf0II227osW5jtrMRTiz1x9FLXiryLNdPqro6zOuzJtW5blHZgSPUOStaNHKme3Rp6DNgKJQH3l/7eE/LK3wQp/iS1ITQybvtXx3fKPWggHJrVn7qiGYZkoV93TPAcNAPvH6rlA44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750258680; c=relaxed/simple;
	bh=1m/+T4+vx617IGk8hjSzrJjN12aZQVypS3e7wSQm8gY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=cEn+zsLi2KOhKspjfYElhFYoN0yiE+sSWSg7fWiYVdt5Dt4U/yl+PJrcky0NXShhQcLMTVsndeLbeYBbatnqrH5+E8WFdCc5vD1gswt+7Z38q+jt/niISEuZ+qd1zaDkX3PQQHbGiTYm4qaVf39bCOyGntwiDv/Mp80Hul8Wjw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iHpcRnSH; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iHpcRnSH"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750258672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=67e6PeVrKIA6KSw9CZ20Rq2vBMCRdc1PG4Rn4V4b9wc=;
	b=iHpcRnSHYGgFi1kYHphUvXGI1TQf3seqs5fyy5lbnkDsfYtcg9PfR8ijbbWgPo70AS581Z
	D1GMG9S+0169pVR0jboh/FiWXlEvDOVwImssviwVmcBhXFl1u6ISjwnlFUCiww7CQsjB2a
	riJfpdYP4GmHn4kkuZApctB3VzV5EWc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH RESEND] mux: Convert mux_control_ops to a flex array
 member in mux_chip
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <20250610104106.1948-2-thorsten.blum@linux.dev>
Date: Wed, 18 Jun 2025 16:57:38 +0200
Cc: linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <DE85FD8C-CA6B-4231-9B5E-7B6BEAFA3594@linux.dev>
References: <20250610104106.1948-2-thorsten.blum@linux.dev>
To: Peter Rosin <peda@axentia.se>,
 Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 krzysztof.kozlowski@linaro.org
X-Migadu-Flow: FLOW_OUT

On 10. Jun 2025, at 12:40, Thorsten Blum wrote:
> Convert mux_control_ops to a flexible array member at the end of the
> mux_chip struct and add the __counted_by() compiler attribute to
> improve access bounds-checking via CONFIG_UBSAN_BOUNDS and
> CONFIG_FORTIFY_SOURCE.
> 
> Use struct_size() to calculate the number of bytes to allocate for a new
> mux chip and to remove the following Coccinelle/coccicheck warning:
> 
>  WARNING: Use struct_size
> 
> Use size_add() to safely add any extra bytes.
> 
> No functional changes intended.
> 
> Link: https://github.com/KSPP/linux/issues/83
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---

Hi all, since Peter isn't reachable, could someone else take care of
this one? Is there anything else I can do to get this merged?

I also noticed that Krzysztof recently changed the status of the mux
subsystem from "Maintained" to "Odd Fixes" in ff91020412085.

Thanks,
Thorsten

