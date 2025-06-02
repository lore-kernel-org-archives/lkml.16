Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FFA2C325F;
	Mon,  2 Jun 2025 02:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748832570; cv=none; b=AyHB5+JWjE3aHvsfIch5Z9HI8qsBfWHiySTl/2rd2Z/8oa9RLhCOjnI8RbgVD7w6VTlxkxQmWrowhLTIEjTAWAcFumHdoEN3E5HPhNjLgrEBg39jgUj8ENVdvJVPjrzOSzPJXFqwIBaMeEKPjPGW2EyQBiB6vmTuCJXtXv49lGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748832570; c=relaxed/simple;
	bh=7jtOMQnE4k7Ptb1rOSgSxx3tJE8kSt7sImdIjPXZZ0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lKX+EY5H0jmAxNDv8/5SxAA2EnWC1hMlix8ngylj6dGKKbvBnR/bGnjBIXYthUI3UNuDMa5dLyDzJwnd2pxnAc6KWz7dpfg0xjdQ5CC/zuCNpAEEHg4Q1Inq57rtTbfmJONAIHZqiXbNf7ugSSaQj9091X4jn7LR/g0EZJLqDjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kJMUxVer; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kJMUxVer"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sR0r0ubGCSVcvnMxMB6zdK1pyNoMsW+qrdvloib0VMg=; b=kJMUxVerQGn+6t5BoPSzjjZvEx
	Fa7l6xpdBugk/YctOzx7zaQNuEF4ZCNKps52crZm74CcduywrKbtVeBfHDpRo+Xy97seLQQcAa7FR
	/dclnz5OUJUEFoPalXRyYLPAr5MCIbn/c6ZYb8AtfeDq7nQG+Md/xueBwcWKPxaCGv0uTGNYBBpI5
	ffVI130IUIMQcG57r12rwhbsTxe4oCJDkR2eiHq8ZetMO6dIkxd+DC+ySBseCbh0nt2TTwV5evDLV
	gHbLg8YSytYJ3DLfV0mESmJ0PGdu8ibWY8S3VpjfGi3A5HyIW968xEKz1/mnetsLKCZvP23reAe/n
	D6+sNOqA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLvEc-00000000Zzi-3ovo;
	Mon, 02 Jun 2025 02:49:19 +0000
Message-ID: <6459566b-bf9f-4e07-9290-41853cdee9ec@infradead.org>
Date: Sun, 1 Jun 2025 19:49:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: Add a source tree map overview
To: Bagas Sanjaya <bagasdotme@gmail.com>, William Raezer <wraezer@gmail.com>,
 linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net
References: <CAKg96b=n1pZi4FUBqe+puUJo9ndRfU8npvo9w6fE6Enshe73Hg@mail.gmail.com>
 <f882f6d9-c914-48af-97b7-0aad6d995819@infradead.org>
 <aDz92QNc3ZSVkdx3@archie.me>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aDz92QNc3ZSVkdx3@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/1/25 6:26 PM, Bagas Sanjaya wrote:
> On Sun, Jun 01, 2025 at 09:50:14AM -0700, Randy Dunlap wrote:
>> Hi,
>>
>> On 6/1/25 9:22 AM, William Raezer wrote:
>>> Hello,
>>>
>>
>> Please wrap email lines at around 72-75 characters each.
>>
>>> My name is William Raezer, and this is my first contribution to the Linux kernel. I'm submitting a simple but hopefully helpful addition: a high-level map of the Linux kernel source tree as a new document in `Documentation/source-map.rst`.
>>
>> This looks somewhat useful, although I was expecting more of a graphic presentation
>> of the tree structure. But that would cause trouble with the role of each subdirectory.
>> (and one can always use `tree` for that)
> 
> I was expecting tree output either.
> 
>>
>>> As someone beginning to explore the internals of the Linux kernel, I noticed that while there is some documentation available that describes the subsystems in principle, there's no centralized overview of the source tree structure itself. This patch adds a basic source map that describes the role of each top-level directory in the kernel source.
>>>
>>> The goal is to assist both myself and others in navigating the codebase, especially new contributors who may be overwhelmed by the kernel's size and complexity. As a follow-up, I plan to add subsystem-level maps for key directories such as `kernel/`, `mm/`, and `fs/`.
>>>
>>> I hope this addition is seen as a positive and useful step, and I’m open to feedback or suggestions to improve it.
>>
>> Patches should generally be inline as email text, not as attachments.
>> This is up to the maintainer to decide about...
>> and gmail is not good as maintaining whitespace in emails.
>> (I don't see any whitespace problems in the current patch.)
> 
> tl;dr: see Documentation/process/submitting-patches.rst.
> 
>>
>> I get a warning when building with this patch applied:
>>
>> Documentation/source-map.rst: WARNING: document isn't included in any toctree [toc.not_included]
> 
> make htmldocs.
> 
>>
>> Also, when I look at source-map.html with a web browser, no parts of
>> the source-map are shown. (tested with multiple browsers)

No, I mean that what I see is mostly a blank/empty page.
Other that the sidebar, it only contains this line:

©The kernel development community. | Powered by Sphinx 8.2.3 & Alabaster 1.0.0 | Page source


-- 
~Randy

