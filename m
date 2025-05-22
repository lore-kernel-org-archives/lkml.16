Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EB7146D65
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747896818; cv=none; b=BFjmXhFOGU3jH2lgN3igG6VACube+1Sy7FzM/DcomPgmQ/OqlfTz17Yg9rRo1PfASwthFbneOSEIncL81mLsH69Pk8UbYiyD6Ic9GVF22O+2j9nLJD78cZvfBcpH/qPxuvb5PkHBm6k+XhzycsLvIac/3DkQP2rib1bHrAYoChA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747896818; c=relaxed/simple;
	bh=A4aq7rfJSbDi2ECwhOiqnmSsUJPsO9Fahi37lji8zdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UFDfcWtBhgMbFNBECNuDfadBrhrQmnu4tVP7FIc+pT2+234l/PwNRLDdWW8+5xjDgceaPuCz2qyHg0xQMzqHYph5N/v9akb6Sqa6s8djZv9Y7rj+UOSRyQB7dGnC6rrpMj8TVKOrF4Ecna7y/LfbGR0Kj23W6exb1gr4JqnfbLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZOT7iJcl; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZOT7iJcl"
Message-ID: <ac51507e-28ca-404d-a784-7cc3721ee624@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747896812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9iDfmp442exRibmgYm7jFqsHJ8k6DlxteDlGN/PmVPk=;
	b=ZOT7iJclIMgS6F0Xm4agKEsJ5wDbqoVQri7oVt4u5amMmn29VnjWfoLqimbAXTJNQe4NQQ
	2L1v7CelvTNxZ0FLM49kHMB85NpzNzWIIcfNCrocEcKFJMhZ+JTXgFBOK1mcPhBhbxn4mr
	M+38FoXZ+Rlj0/d4X45j+UVd3Uf2PpE=
Date: Thu, 22 May 2025 14:53:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RESEND PATCH 1/1] netfilter: load nf_log_syslog on enabling
 nf_conntrack_log_invalid
Content-Language: en-US
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Lance Yang
 <ioworker0@gmail.com>, kadlec@netfilter.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 coreteam@netfilter.org, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, Zi Li <zi.li@linux.dev>
References: <20250514053751.2271-1-lance.yang@linux.dev>
 <aC2lyYN72raND8S0@calendula> <aC23TW08pieLxpsf@strlen.de>
 <6f35a7af-bae7-472d-8db6-7d33fb3e5a96@linux.dev> <aC4aNCpZMoYJ7R02@strlen.de>
 <1c21a452-e1f4-42e0-93c0-0c49e4612dcd@linux.dev> <aC7Fg0KGari3NQ3Z@strlen.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <aC7Fg0KGari3NQ3Z@strlen.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2025/5/22 14:34, Florian Westphal wrote:
> Lance Yang <lance.yang@linux.dev> wrote:
>> Nice, thanks for jumping in! I'll hold until the helper lands, then
>> rebase and send the v2.
> 
> Please just add this new helpre yourself in v2.

Ah, got it. I'll do that.

Thanks,
Lance

