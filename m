Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB2E1C1F0D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744771612; cv=none; b=rTp18SOAVcAK+4XHGfuAUXDnSKtTrrPi7XFfEVpeeqPFhDkXoedS4FFXlCazdsla8uODMXueVmPT2YO63NNEbg3Dxdq9aMqDzUS3z5T36gdbt6/NTtwkULBaILr5ycTu12OEtK6MFoErhhEPxacHPjKPmGzoz9QNf5ibAmyI0N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744771612; c=relaxed/simple;
	bh=NwnHFUHGu0Ukw6pd+RdichgPWY68DblXO/DH1ivtXyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XhO9hML7ssp2oSJCGn9ZsDe4krrHISO/HZmvV9NwyT6a+2SRAKypFY1ddGhzmqlDWaEH6hrIFFSL3BPxETzE6XoLqp4DEO0/PJNYaG7Az5Lye/0FEsKTHdZoHzzYRrjSAJC+QqCrCwkbxei3LnVyiHHd+EVjdINwMlXh6qA0gdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RTbOEzEN; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RTbOEzEN"
Message-ID: <42f50a48-10da-4739-9e51-f865fbf04bdd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744771606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zKNA80bkmOUbGQd7eLuCe99IW8eUEuynOpxX8hdXuuk=;
	b=RTbOEzEN6p0BhdG0iklps9OmRtwuJcgSU6PPsX/9pns6GEIlAwN9T+9idU4POvtvhGJxy8
	A8331249QTYo90yCf4CFzKIqC4I/khIEvEtGUysgKq/QDSQnyieH9fyvVDH/6IHQaga4h3
	eCqqaVd7SvRymnH8DP3MgPXaAuD6v7I=
Date: Wed, 16 Apr 2025 10:46:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] tools/drgn: Add script to display page state for a given
 PID and VADDR
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org,
 linux-mm@kvack.org, Ye Liu <liuye@kylinos.cn>
References: <20250415075024.248232-1-ye.liu@linux.dev>
 <20250415191414.a64de2d228ab5f43a5390acf@linux-foundation.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <20250415191414.a64de2d228ab5f43a5390acf@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/4/16 10:14, Andrew Morton 写道:
> On Tue, 15 Apr 2025 15:50:24 +0800 Ye Liu <ye.liu@linux.dev> wrote:
>
>> From: Ye Liu <liuye@kylinos.cn>
>>
>> Introduces a new drgn script, `show_page_info.py`, which allows users
>> to analyze the state of a page given a process ID (PID) and a virtual
>> address (VADDR). This can help kernel developers or debuggers easily
>> inspect page-related information in a live kernel or vmcore.
>>
>> The script extracts information such as the page flags, mapping, and
>> other metadata relevant to diagnosing memory issues.
>>
>> Currently, there is no specific maintainer entry for `tools/drgn/` in the
>> MAINTAINERS file. Therefore, this patch is sent to the general kernel and
>> tools mailing lists for review.
> Help.  My copy of linux has no tools/drgn/
I noticed that the current upstream Linux tree doesn't contain a
`tools/drgn/` directory.

I'm interested in contributing a drgn script tool as well.
Given that this directory does not yet exist in mainline, where would
be the appropriate place to add new drgn scripts? Would it make sense
to create a new `tools/drgn/` directory, or is there a preferred
location for such debugging scripts?

Thanks,
Ye                                                                    

