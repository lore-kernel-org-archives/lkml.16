Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E276919C540
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745514769; cv=none; b=YEv4aJI0PQ4jm85nmmAHEfjLq3x3nGjxNO+mbUyBXCQsrujxjRuaGx3JbsuCN13JCTLX1SRBmacK/7uAdC0alhaZxo86clVsFaB0Zg3TLp1C8X6LwdV6glhlM/GTAySOiEGIRBsRBQvH0biPwE1lU2N/9UXzGcu1qxoVjeUqEhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745514769; c=relaxed/simple;
	bh=3bGT6R+gy3jk2qRiAm1IbTqLGp/6S2bVkJcXJzMq2FU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YADxDzkQQxRssG0XZcX35FASduoA/5v0iZKipSYlHm00YGfdp/8/5jQPw/qEiwl4zPYU70SYxlVuEveEtoMSODZNXFH3Y6IralAH7kY7RFW/J5Uadxm1ShIxgBmtlk3Sj6aXOisw2LQ4StYzCdONocR9Xp8LTYGtbQDVjoQWPCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 723B01063;
	Thu, 24 Apr 2025 10:12:42 -0700 (PDT)
Received: from [10.1.196.43] (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3BA43F66E;
	Thu, 24 Apr 2025 10:12:44 -0700 (PDT)
Message-ID: <30ff132d-f630-4362-bb50-ecd7548833cd@arm.com>
Date: Thu, 24 Apr 2025 18:12:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] cpumask: add missing API and simplify
 cpumask_any_housekeeping()
To: Yury Norov <yury.norov@gmail.com>, Tony Luck <tony.luck@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, x86@kernel.org, linux-kernel@vger.kernel.org
References: <20250407153856.133093-1-yury.norov@gmail.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250407153856.133093-1-yury.norov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yury,

On 07/04/2025 16:38, Yury Norov wrote:
> From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> 
> cpumask library missed some flavors of cpumask_any_but(), which makes
> users to workaround it by using less efficient cpumask_nth() functions.


For the series - with the unsigned/int thing Reinette pointed out fixed:
Tested-by: James Morse <james.morse@arm.com>
Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James
