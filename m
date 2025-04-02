Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3BF194091;
	Wed,  2 Apr 2025 16:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743612466; cv=none; b=UcF1I0zdo0ZaDpN93xuN0O3pLFtrHxxEJAzrrAuvT403W7CE2NYpbmbHN+T8A27FdAHK26KaLQJdtQGY2S0SpfQRHN/AzmYwHOL5dbeDtxKiaUuVZLDtaW39f/uJq3ZpSySrxY1cv5Te9mtAB0qu5iJHX8Qyw1h0R/JLOdFa5Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743612466; c=relaxed/simple;
	bh=/njLYSlB83nQFCUBUb0CqikWRPbHI9ox9CSW5GtdKuo=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nuekZKqFHWZLdz6BNAxINlUxAS+P4ubUiJ9CzAYSTzgwjd0k4W0F0BvtriAigWCMqwg2ZfNNjaSAKZ3YG3raX3II8lwFlhHTmKgW4lt6zm/EKm0IxACy9W4ubwtmJDj0+HBFNGxbpeQY26bZAMQ1fjqoH5jcm2DklYS59Pfc5jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b=mjZ2l3oU; arc=none smtp.client-ip=99.78.197.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="mjZ2l3oU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1743612466; x=1775148466;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=OOFyG8Kd6+HeZN8MQhF4S2SXZyJjo0p9QJnhgx3PboY=;
  b=mjZ2l3oUKtULOdStKON38+YVp4u11StwkKC7tvsEceOj1s1cIFbNwSDa
   d0OwFjEwMlPjEKg3Fno2qq47qODuiauYtG3aH+tX8OhlMbspPVBFcoiXF
   inEZ+ZABbS5edIzMHiDX4w+Wa4Jvu8XM7sQbpmQ/3y7CotNugTM1l+x1V
   4=;
X-IronPort-AV: E=Sophos;i="6.15,182,1739836800"; 
   d="scan'208";a="37483382"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 16:47:43 +0000
Received: from EX19MTAUWA002.ant.amazon.com [10.0.38.20:63428]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.57.231:2525] with esmtp (Farcaster)
 id fb8b30c2-4f1e-48a1-bd68-83c73817fafa; Wed, 2 Apr 2025 16:47:42 +0000 (UTC)
X-Farcaster-Flow-ID: fb8b30c2-4f1e-48a1-bd68-83c73817fafa
Received: from EX19D020UWA002.ant.amazon.com (10.13.138.222) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 2 Apr 2025 16:47:39 +0000
Received: from EX19MTAUEA001.ant.amazon.com (10.252.134.203) by
 EX19D020UWA002.ant.amazon.com (10.13.138.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 2 Apr 2025 16:47:39 +0000
Received: from email-imr-corp-prod-pdx-all-2c-785684ef.us-west-2.amazon.com
 (10.43.8.2) by mail-relay.amazon.com (10.252.134.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 16:47:39 +0000
Received: from dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com (dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com [172.19.91.144])
	by email-imr-corp-prod-pdx-all-2c-785684ef.us-west-2.amazon.com (Postfix) with ESMTP id A4539A03AB;
	Wed,  2 Apr 2025 16:47:38 +0000 (UTC)
Received: by dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com (Postfix, from userid 23027615)
	id 3863F4F35; Wed,  2 Apr 2025 16:47:38 +0000 (UTC)
From: Pratyush Yadav <ptyadav@amazon.de>
To: Changyuan Lyu <changyuanl@google.com>
CC: <akpm@linux-foundation.org>, <anthony.yznaga@oracle.com>, <arnd@arndb.de>,
	<ashish.kalra@amd.com>, <benh@kernel.crashing.org>, <bp@alien8.de>,
	<catalin.marinas@arm.com>, <corbet@lwn.net>, <dave.hansen@linux.intel.com>,
	<devicetree@vger.kernel.org>, <dwmw2@infradead.org>, <ebiederm@xmission.com>,
	<graf@amazon.com>, <hpa@zytor.com>, <jgg@nvidia.com>, <jgowans@amazon.com>,
	<kexec@lists.infradead.org>, <krzk@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <luto@kernel.org>,
	<mark.rutland@arm.com>, <mingo@redhat.com>, <pasha.tatashin@soleen.com>,
	<pbonzini@redhat.com>, <peterz@infradead.org>, <robh+dt@kernel.org>,
	<robh@kernel.org>, <rostedt@goodmis.org>, <rppt@kernel.org>,
	<saravanak@google.com>, <skinsburskii@linux.microsoft.com>,
	<tglx@linutronix.de>, <thomas.lendacky@amd.com>, <will@kernel.org>,
	<x86@kernel.org>
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory preservation
In-Reply-To: <20250402164453.2470750-1-changyuanl@google.com>
References: <mafs0tt7eqt6f.fsf@amazon.de>
	<20250402164453.2470750-1-changyuanl@google.com>
Date: Wed, 2 Apr 2025 16:47:38 +0000
Message-ID: <mafs0ecyaqzmd.fsf_-_@amazon.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

On Wed, Apr 02 2025, Changyuan Lyu wrote:

> Hi Pratyush, Thanks for suggestions!
>
> On Thu, Mar 27, 2025 at 17:28:40 +0000, Pratyush Yadav <ptyadav@amazon.de> wrote:
>> On Thu, Mar 27 2025, Jason Gunthorpe wrote:
>>
>> > On Thu, Mar 27, 2025 at 10:03:17AM +0000, Pratyush Yadav wrote:
>> >
>> >> Of course, with the current linked list structure, this cannot work. But
>> >> I don't see why we need to have it. I think having a page-table like
>> >> structure would be better -- only instead of having PTEs at the lowest
>> >> levels, you have the bitmap.
>> >
>> > Yes, but there is a trade off here of what I could write in 30 mins
>> > and what is maximally possible :) The xarray is providing a page table
>> > implementation in a library form.
>> >
>> > I think this whole thing can be optimized, especially the
>> > memblock_reserve side, but the idea here is to get started and once we
>> > have some data on what the actual preservation workload is then
>> > someone can optimize this.
>> >
>> > Otherwise we are going to be spending months just polishing this one
>> > patch without any actual data on where the performance issues and hot
>> > spots actually are.
>>
>> The memblock_reserve side we can optimize later, I agree. But the memory
>> preservation format is ABI and I think that is worth spending a little
>> more time on. And I don't think it should be that much more complex than
>> the current format.
>>
>> I want to hack around with it, so I'll give it a try over the next few
>> days and see what I can come up with.
>
> I agree with Jason that "nothing is ABI at this
> point" and it will take some time for KHO to stabilize.
>
> On the other hand if you have already came up with something working and
> simple, we can include it in the next version.

I already have something that works with zero-order pages. I am
currently implementing support for other orders. It is almost done, but
I need to test it and do a performance comparison with the current
patch. Will post something soon!

-- 
Regards,
Pratyush Yadav
