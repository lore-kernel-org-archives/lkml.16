Received: from smtp-fw-52003.amazon.com (smtp-fw-52003.amazon.com [52.119.213.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BE73C38;
	Fri,  4 Apr 2025 16:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743783347; cv=none; b=LgkQjcKNfd25rjCeVh5gPWFt4mcXdJfDiUQbYtsV5ebTlgTnuDpVssPOgGk+c4PKD49TAeCqE1k7BymjIcUjcOO3IAx6XNup7rnzYeWSLhPRdVxg8Brxw39O4f3a9rkWJthTyWmai0WtW8vgm6S8Vlu/wwjpK+/Ap7+gb4ecIdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743783347; c=relaxed/simple;
	bh=dmVtZM5UK8m+VA8tUcL/fjto9wQk0qaLwDUp7HO3HWk=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Mpsbn0yUnKxp9aDE8WeD33ReLJvklEBSe94XFNf5+Vx6SWQc6LP9zDYcA9wxKd9e8GDUr2ALtW7s1DyTXamHtmvtxt+Kda8NgqgaMYVgXifqy2qn5fpmm9Z8nWXJQ9aXlaJWwRzCFY1cutQwqnUWF5rAmijYoOCNJvD2JDFN3FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b=Oz9k30J3; arc=none smtp.client-ip=52.119.213.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="Oz9k30J3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1743783345; x=1775319345;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=PR+81n/7PE5GFJ2G42uL7koHAi23tz/7cZC1Tr5YEZ8=;
  b=Oz9k30J3lERgdz+rdh3uVGNhDNLQfxrlkAXHaUeVe45I4U8ba6vYGGJ8
   92cvJrux54dwdPE3pY9qGTGSKwFjtOs6xwEWkXnuZoHsijXPLzu3tcc7G
   yJJ5kOFqVCAprakIbpu/ZYO/2CElP1W6ROqrWu2/ShNqwZ6cGeZhtmMzs
   E=;
X-IronPort-AV: E=Sophos;i="6.15,188,1739836800"; 
   d="scan'208";a="80882244"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52003.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 16:15:38 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.21.151:44551]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.21.195:2525] with esmtp (Farcaster)
 id 199298bd-9d18-4877-a617-13ac25876d15; Fri, 4 Apr 2025 16:15:37 +0000 (UTC)
X-Farcaster-Flow-ID: 199298bd-9d18-4877-a617-13ac25876d15
Received: from EX19D020UWA003.ant.amazon.com (10.13.138.254) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 4 Apr 2025 16:15:29 +0000
Received: from EX19MTAUEA002.ant.amazon.com (10.252.134.9) by
 EX19D020UWA003.ant.amazon.com (10.13.138.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 4 Apr 2025 16:15:29 +0000
Received: from email-imr-corp-prod-iad-all-1a-6ea42a62.us-east-1.amazon.com
 (10.43.8.2) by mail-relay.amazon.com (10.252.134.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1544.14 via Frontend Transport; Fri, 4 Apr 2025 16:15:28 +0000
Received: from dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com (dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com [172.19.91.144])
	by email-imr-corp-prod-iad-all-1a-6ea42a62.us-east-1.amazon.com (Postfix) with ESMTP id 9DB8140530;
	Fri,  4 Apr 2025 16:15:28 +0000 (UTC)
Received: by dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com (Postfix, from userid 23027615)
	id 59B05157A; Fri,  4 Apr 2025 16:15:28 +0000 (UTC)
From: Pratyush Yadav <ptyadav@amazon.de>
To: Mike Rapoport <rppt@kernel.org>
CC: Jason Gunthorpe <jgg@nvidia.com>, Changyuan Lyu <changyuanl@google.com>,
	<linux-kernel@vger.kernel.org>, <graf@amazon.com>,
	<akpm@linux-foundation.org>, <luto@kernel.org>, <anthony.yznaga@oracle.com>,
	<arnd@arndb.de>, <ashish.kalra@amd.com>, <benh@kernel.crashing.org>,
	<bp@alien8.de>, <catalin.marinas@arm.com>, <dave.hansen@linux.intel.com>,
	<dwmw2@infradead.org>, <ebiederm@xmission.com>, <mingo@redhat.com>,
	<jgowans@amazon.com>, <corbet@lwn.net>, <krzk@kernel.org>,
	<mark.rutland@arm.com>, <pbonzini@redhat.com>, <pasha.tatashin@soleen.com>,
	<hpa@zytor.com>, <peterz@infradead.org>, <robh+dt@kernel.org>,
	<robh@kernel.org>, <saravanak@google.com>,
	<skinsburskii@linux.microsoft.com>, <rostedt@goodmis.org>,
	<tglx@linutronix.de>, <thomas.lendacky@amd.com>, <usama.arif@bytedance.com>,
	<will@kernel.org>, <devicetree@vger.kernel.org>, <kexec@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-mm@kvack.org>, <x86@kernel.org>
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory preservation
In-Reply-To: <Z-_kSXrHWU5Bf3sV@kernel.org>
References: <20250320015551.2157511-1-changyuanl@google.com>
	<20250320015551.2157511-10-changyuanl@google.com>
	<mafs05xjmqsqc.fsf@amazon.de> <20250403114209.GE342109@nvidia.com>
	<Z-6UA3C1TPeH_kGL@kernel.org> <20250403142438.GF342109@nvidia.com>
	<Z--sUYCvP3Q8nT8e@kernel.org> <20250404124729.GH342109@nvidia.com>
	<Z-_kSXrHWU5Bf3sV@kernel.org>
Date: Fri, 4 Apr 2025 16:15:28 +0000
Message-ID: <mafs0cydrq4wv.fsf@amazon.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Mike,

On Fri, Apr 04 2025, Mike Rapoport wrote:

[...]
> As for the optimizations of memblock reserve path, currently it what hurts
> the most in my and Pratyush experiments. They are not very representative,
> but still, preserving lots of pages/folios spread all over would have it's
> toll on the mm initialization. And I don't think invasive changes to how
> buddy and memory map initialization are the best way to move forward and
> optimize that. Quite possibly we'd want to be able to minimize amount of
> *ranges* that we preserve.
>
> So from the three alternatives we have now (xarrays + bitmaps, tables +
> bitmaps and maple tree for ranges) maple tree seems to be the simplest and
> efficient enough to start with.

But you'd need to somehow serialize the maple tree ranges into some
format. So you would either end up going back to the kho_mem ranges we
had, or have to invent something more complex. The sample code you wrote
is pretty much going back to having kho_mem ranges.

And if you say that we should minimize the amount of ranges, the table +
bitmaps is still a fairly good data structure. You can very well have a
higher order table where your entire range is a handful of bits. This
lets you track a small number of ranges fairly efficiently -- both in
terms of memory and in terms of CPU. I think the only place where it
doesn't work as well as a maple tree is if you want to merge or split a
lot ranges quickly. But if you say that you only want to have a handful
of ranges, does that really matter?

Also, I think the allocation pattern depends on which use case you have
in mind. For hypervisor live update, you might very well only have a
handful of ranges. The use case I have in mind is for taking a userspace
process, quickly checkpointing it by dumping its memory contents to a
memfd, and restoring it after KHO. For that, the ability to do random
sparse allocations quickly helps a lot.

So IMO the table works well for both sparse and dense allocations. So
why have a data structure that only solves one problem when we can have
one that solves both? And honestly, I don't think the table is that much
more complex either -- both in terms of understanding the idea and in
terms of code -- the whole thing is like 200 lines.

Also, I think changes to buddy initialization _is_ the way to optimize
boot times. Having maple tree ranges and moving them around into
memblock ranges does not really scale very well for anything other than
a handful of ranges, and we shouldn't limit ourselves to that without
good reason.

>  
> Preserving folio orders with it is really straighforward and until we see
> some real data of how the entire KHO machinery is used, I'd prefer simple
> over anything else.

-- 
Regards,
Pratyush Yadav
