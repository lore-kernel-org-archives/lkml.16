Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F34F2EA158
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751042332; cv=none; b=jF8AfWJvX0H59f+odKRYt9CCwA1yyMIROsPz6Ydn49YX9UWJMRmUbXnl7vW0PmBLJTpAbkEl/pQNclI02gpBAI/No9qtQ2pq7Amqco5Gdik3qjsNJURTTu6lVz8nHNgtekxDa+7o+/sfjxQydB7B2RAw4rzjqqvT70+jTLyODf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751042332; c=relaxed/simple;
	bh=iOtJHZThmQLek/V6yjvlXjjZGtd8xIGZ2ZdwDQ6A7Uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V9MiU8gD+iuV/fXkYoRZ7bcNhD8wjz7ao4GHGudP2i6mciqynCxBUOB/JYC+vntl0WkklrzH/SU99Koa+N6tQrg35hL2yHd5eIB1rTgPaFsHOuDZ1L7JOXUWuWHnI2FQh6G6ZpSB9ubmXgfRCobUWWvEj+079balbwXZXszinYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 093AA1A00;
	Fri, 27 Jun 2025 09:38:33 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08C023F58B;
	Fri, 27 Jun 2025 09:38:48 -0700 (PDT)
Message-ID: <efa92bef-8bfb-431f-ac9e-048041ff13f6@arm.com>
Date: Fri, 27 Jun 2025 17:38:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] cacheinfo: Set cache 'id' based on DT data
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com,
 Ben Horgan <ben.horgan@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
 <CAL_JsqKD7yOxSnfnah2gE0EodtQ4KyJ2_qXmMu2oK9i6numzwA@mail.gmail.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <CAL_JsqKD7yOxSnfnah2gE0EodtQ4KyJ2_qXmMu2oK9i6numzwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Rob,

On 23/06/2025 16:05, Rob Herring wrote:
> On Fri, Jun 13, 2025 at 8:04 AM James Morse <james.morse@arm.com> wrote:
>>
>> This series adds support for cache-ids to device-tree systems.
>> These values are exposed to user-space via
>> /sys/devices/system/cpu/cpuX/cache/indexY/id
>> and are used to identify caches and their associated CPUs by kernel interfaces
>> such as resctrl.
>>
>> Resctrl anticipates cache-ids are unique for a given cache level, but may
>> be sparse. See Documentation/filesystems/resctrl.rst's "Cache IDs" section.
>>
>> Another user is PCIe's cache-steering hints, where an id provided by the
>> hardware would be needed. Today this expects a platform specific ACPI hook
>> the program that value into the PCIe root port registers. If DT platforms
>> are ever supported, it will likely need a kernel driver to convert the
>> user-space cache-id to whatever hardware value is needed.
>>
>> Rob H previously preferred to generate a cache-id from the information DT
>> already has. (Rob: does the PCIe cache-steering use-case change this?)

> I don't think so because who knows what values the PCI root port
> needs.

Some hardware specific value, that would have to come from the DT...


> It's never going to be the cache id directly since that is per level.

Can re-used across levels, but because they can also be sparse its equally valid for them
to be unique. This is what is happening on arm64 ACPI platforms.


> So we'd need some sort of mapping. That's going to be something
> like this:
> 
> Userspace level+id -> DT cache node -> PCI RP value
> 
> So the first translation is the same as you have here. The 2nd
> translation might be something we put in DT or could be in PCI host
> bridge driver.

ACPI currently requires some kernel interaction too as the value gets written to some
platform specific register. Even if it did get standardised, I guess something like VFIO
would manage access to that register to fix up the values.


Thanks,

James
