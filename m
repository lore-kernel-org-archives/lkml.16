Received: from mail.mixaill.net (mail.mixaill.net [144.76.234.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C93287269
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.234.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751883470; cv=none; b=kxasNdUoRzUiz8j14N3gAgeG+VKass362oXyBdL/ksDw5eYb8E6GMP9VjVZTW/iz9d8zUIzWkcjqhQBNNl9RO9pEnCfM4diFQgg7Tm4hg5mYkvy0Jq2atsnEc/O1WsiVjmL1GNzrPFhjmAgAeyCQPFqAkpIasFiESFDxO1otr+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751883470; c=relaxed/simple;
	bh=v8/BKDcJdYMQxJ/4NRZR1mfLUsdGrnKeDTu7sEBujLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pnEMpMAPRR88squP524AK72m5SYuBuN4Vrccb0YxE7ZdT9wG2sonGlymRRNqNbk03m6DjHWYrCS01Wl0puT+KTJnrrPrxxHovElaq8z1iE4M/nR1rh40cXv7jbqIDcGqpuUpdKgND+wqLAMW03q3MC+hQk6CxW1lxYgIFZnRMrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mixaill.net; spf=pass smtp.mailfrom=mixaill.net; dkim=pass (2048-bit key) header.d=mixaill.net header.i=@mixaill.net header.b=KQb2FQd2; arc=none smtp.client-ip=144.76.234.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mixaill.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mixaill.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mixaill.net header.i=@mixaill.net header.b="KQb2FQd2"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD58B65640;
	Mon,  7 Jul 2025 10:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mixaill.net; s=dkim;
	t=1751883467; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=hccP9L6J8DHwJ1Cv+e9Lv1zeMOf0Pi3TNHzMO56DuTY=;
	b=KQb2FQd2zDHcLGPIJw/aT58wlV/UMe88QslXY4bMejSrQhnZLoss38xQ8iOsPPm8GIX4+6
	dPM90jcQcA8fUehFslvLGjOhJqEg2AJfY3ITEu3nCtqp/EN6Ie/H4sF7P3VWal3HjwYIJU
	DUyBdWFLptgZ+K/UAaAi/5EqYeYB5WYGf9uRDdBAWwfBT26RZnaWXPO4O6icsQFfkMc7Qb
	NestA3VqloZuYNlUOMj2HFGMtREc5YMcxCgUaRsaCnbKoV+NumHCsIPdGCxhwho3XtXx8R
	r+l6Oott+0ehNJHUKjLOv0Py9vEAY9CNsdiYnG/Dk3WMFREotTd48mhRfsAtuw==
Message-ID: <40cd274e-a02b-450d-88df-aa2b92b51b12@mixaill.net>
Date: Mon, 7 Jul 2025 13:17:41 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] x86/rdrand: disable RDSEED on AMD Cyan Skillfish
To: Dave Hansen <dave.hansen@intel.com>, Borislav Petkov <bp@alien8.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <20250524145319.209075-1-me@mixaill.net>
 <20250617200551.GIaFHKnyPV_XsSjlMP@fat_crate.local>
 <cfb12298-5214-4fc1-859c-2218c7da4ce3@intel.com>
Content-Language: en-US
From: Mikhail Paulyshka <me@mixaill.net>
In-Reply-To: <cfb12298-5214-4fc1-859c-2218c7da4ce3@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 6/17/25 11:21 PM, Dave Hansen wrote:
> Heh, maybe if x86_init_rdrand() did RDSEED too, this wouldn't have
> slipped through QA.

This might be interesting to you: in V1 of this patch set, there was an 
RDSEED sanity check, and Intel's CI detected broken RDSEED on Comet Lake:

https://lore.kernel.org/all/202503211421.fc83271a-lkp@intel.com/


