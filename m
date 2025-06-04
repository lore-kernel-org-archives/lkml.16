Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0999333DF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749041696; cv=none; b=CY1rX+B42qLMUUZUm7QabPh6nfkDvOCpyr3j2Jx89IOQXW7sVN56VWhNC7wLtv5E0K14vZBvi+835zpTu+98H4Exqbp2jxyALKcGXECYXbsTjHo1wx/MvStZzP/pt03q76w2PJBgm8y42ZcaBU67Sd9Nd+yv1+9jdMXUy14/BAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749041696; c=relaxed/simple;
	bh=INwy6LZxuX1AbPHLzx6aiRllCElXrw/mrvB9bQcaRo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ajC10PYVkaIXFAgBzZz/dY2BXQnWIlCnhgG2y7H0MVhZ/2XRUz6pnYzh3/5/Xjf51hxBo4IMOEhtVh85uTdtRz2iB+QYDyfkUXiZOBlCPLr4tdpMZvUUfi2X16QamImVINko0sJvgCr719+EU5lVAueiQcv8rLDS4bsh0tgeuSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06E1A1758;
	Wed,  4 Jun 2025 05:54:36 -0700 (PDT)
Received: from [10.1.27.175] (XHFQ2J9959.cambridge.arm.com [10.1.27.175])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA0ED3F5A1;
	Wed,  4 Jun 2025 05:54:50 -0700 (PDT)
Message-ID: <bced1b03-1a74-48f9-a4c9-c7feaf9786df@arm.com>
Date: Wed, 4 Jun 2025 13:54:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] arm64/mm: Optimize loop to reduce redundant operations
 of contpte_ptep_get
Content-Language: en-GB
To: Andrew Morton <akpm@linux-foundation.org>, Xavier <xavier_qy@163.com>
Cc: will@kernel.org, 21cnbao@gmail.com, dev.jain@arm.com,
 ioworker0@gmail.com, catalin.marinas@arm.com, david@redhat.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, willy@infradead.org, ziy@nvidia.com,
 Barry Song <baohua@kernel.org>
References: <20250510125948.2383778-1-xavier_qy@163.com>
 <6f9842a2.7c3c.19734ce1860.Coremail.xavier_qy@163.com>
 <20250603193124.347804cb5a19c9941a354ff4@linux-foundation.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250603193124.347804cb5a19c9941a354ff4@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/06/2025 03:31, Andrew Morton wrote:
> On Tue, 3 Jun 2025 16:00:11 +0800 (CST) Xavier  <xavier_qy@163.com> wrote:
> 
>> It has been three weeks since the submission of Patch v6. I take the liberty of
>> asking whether you still have any comments or suggestions on this version,
>> and whether the test data indicates that it is ready for merging. I sincerely
>> look forward to your valuable feedback and guidance.
> 
> It was late in the 6.15-rcX cycle and I was hoping that arm people
> would handle this.
> 
> It would be better if the patches had cc:linux-mm@kvack.org.
> 
> I'll grab it and shall include it in -next after -rc1.  If ARM people
> want to grab it, please do so and I'll autodrop the mm.git copy.
> 

Appologies for radio silence; As Catalin and I both said before, the arm email
servers drop all mail from Xavier <xavier_qy@163.com> on the floor. I'm not sure
why, but any chance you could use a different email account to make this smoother?

I'm doing some testing of this now and will respond properly in the next few
days. But I don't personally like the complexity of the patch and am not totally
clear on if this is likely to show a real benefit in real-world use cases (as I
commented previously).

I'll respond properly once I have some results.

Given this is only touching arm64, I'd really prefer that this go via arm64 if
at all.

Thanks,
Ryan

