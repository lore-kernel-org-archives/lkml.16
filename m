Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD96742A87
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743628352; cv=none; b=eUHBUJ1OXMsS1Qw3vlN5iQDn7ugLN6TBLLmOkAp62k0QmBcQpiDnSOGaVolYUjuxTrJ4cmHzBI1tlkcrYEk9r4LEpWLeWFmARC1D8appdf9XKVBwRTDzNTkjTvj/Mkz6MCoxCmhCwQGqbbWgANQxYVkz+L9rcg0Rxpkj09g6xnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743628352; c=relaxed/simple;
	bh=SfCs2dFk9sj4rEfKUcEhZVANi/RKjAIx5Xg372hU3xo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RXiO7vrfEf03JDnJJ2LcH8PXsNF1IP5v8qECM1gP+LGDqcPXozeFICLBPnDPRQLCr16O19rQAIdGELj2BKtogIH6awU+n4H2++6pT7AT2TkEVcbPIbjxWXZ7vBMoYzJjwLus53QZL6f/gAtA127HVgf7RD9CqwfkaC15bkz2GCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=omvOSSVu; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="omvOSSVu"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743628347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9dCoGpCwH6RrLl/7QL1y9s7XKeVIbd2DmNC4uWlkFd4=;
	b=omvOSSVuBmj7jlYvpyMuRjtPDPyhP3FKDP04H1y2CgwawijSONQ8gZsXpybmYSqNUbAfA8
	geUJfJ4tVHct1UVuFAuPvbESC/LSlz6xeC5b7il+jDlPPtCyzWuUSOJ1kubQHdLAQKy6C6
	NsFUmYbbjSKkpqqTjfSKQY5XSOgsbfw=
From: Oliver Upton <oliver.upton@linux.dev>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@arm.com,
	Chen Ni <nichen@iscas.ac.cn>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] smccc: kvm_guest: Remove unneeded semicolon
Date: Wed,  2 Apr 2025 14:11:14 -0700
Message-Id: <174362825118.2996340.1658211451849411034.b4-ty@linux.dev>
In-Reply-To: <20250326040659.1190696-1-nichen@iscas.ac.cn>
References: <20250326040659.1190696-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Wed, 26 Mar 2025 12:06:59 +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> 

Applied to fixes, thanks!

[1/1] smccc: kvm_guest: Remove unneeded semicolon
      https://git.kernel.org/kvmarm/kvmarm/c/1f5bdd3b0c70

--
Best,
Oliver
