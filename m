Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B292DCC00;
	Sun,  1 Jun 2025 16:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748796631; cv=none; b=NrWv3NE2Xe+7FTTtXPgRQr8knzERk5Po0039LHRUg+oBkAtFjEcIXL/hBVcXtRfZYnl6hNLK/7Z+SamsVPUKwKF1jgY05DkZdm2xayl15KX8lkd9U1ZwO0T8fxmzKGfq7q2rLUU1T9kHJhfBX+hYAR3KgSdiBRg3i+v2l5QSVao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748796631; c=relaxed/simple;
	bh=XtyfWp/wwepmMnTH8hcfXlMPyhZQfBLz8v8PdbI0e80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kbtagzmxGSIGKPLSPs/jjjGXoq4tuCwbdj2J/+NlqCA/IWZ86TndUiQjTcTn2cVF591ZXBR7s+T39GTf7Godj/qjWzVZm//FbCzttr833VdcKoojLm5NiQKONfK+HX3mEgNkNmXxKbsEbPLFb7cMZJGs0sAhxjZlSghdGpA5k4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VxwUlgTR; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VxwUlgTR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yCslynMl/1e9xhbSijf5k3MejTUp+QTHpISTVQ74ygs=; b=VxwUlgTRkSEATSb1syYPMdoPW6
	vObTUxo7gkUnbAt0VnjpcUbQyTs8k4qqXyRn+QIbnBe+8GY1AJ2kuCUgHWDt/UNxhvhARlKrTEaA6
	IQETfR2Uw4yzHYiiZuENI9io4KIuwQl5uXmq3LFQMu/KaPSz218dUmUPE0OlUiQEzyhg1LbfZMeQk
	cV4XO9e0nogpGfAtnJTMjlti89Gz1yRqufF+FqFusIfH6F/qF2io0ZbTrERp2lrjbiuOIM2iNXIyZ
	bc8JzDcyHEDYXnNSWipDr+rJqLnNtOdBj0hpzQ0Kfr58eegLTXnhpDbXJk29xRq6FDLqH7SXP1OLf
	Ak41X0bg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLlt2-00000000Uf1-26ss;
	Sun, 01 Jun 2025 16:50:17 +0000
Message-ID: <f882f6d9-c914-48af-97b7-0aad6d995819@infradead.org>
Date: Sun, 1 Jun 2025 09:50:14 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: Add a source tree map overview
To: William Raezer <wraezer@gmail.com>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net
References: <CAKg96b=n1pZi4FUBqe+puUJo9ndRfU8npvo9w6fE6Enshe73Hg@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAKg96b=n1pZi4FUBqe+puUJo9ndRfU8npvo9w6fE6Enshe73Hg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/1/25 9:22 AM, William Raezer wrote:
> Hello,
> 

Please wrap email lines at around 72-75 characters each.

> My name is William Raezer, and this is my first contribution to the Linux kernel. I'm submitting a simple but hopefully helpful addition: a high-level map of the Linux kernel source tree as a new document in `Documentation/source-map.rst`.

This looks somewhat useful, although I was expecting more of a graphic presentation
of the tree structure. But that would cause trouble with the role of each subdirectory.
(and one can always use `tree` for that)

> As someone beginning to explore the internals of the Linux kernel, I noticed that while there is some documentation available that describes the subsystems in principle, there's no centralized overview of the source tree structure itself. This patch adds a basic source map that describes the role of each top-level directory in the kernel source.
> 
> The goal is to assist both myself and others in navigating the codebase, especially new contributors who may be overwhelmed by the kernel's size and complexity. As a follow-up, I plan to add subsystem-level maps for key directories such as `kernel/`, `mm/`, and `fs/`.
> 
> I hope this addition is seen as a positive and useful step, and I’m open to feedback or suggestions to improve it.

Patches should generally be inline as email text, not as attachments.
This is up to the maintainer to decide about...
and gmail is not good as maintaining whitespace in emails.
(I don't see any whitespace problems in the current patch.)

I get a warning when building with this patch applied:

Documentation/source-map.rst: WARNING: document isn't included in any toctree [toc.not_included]

Also, when I look at source-map.html with a web browser, no parts of
the source-map are shown. (tested with multiple browsers)

Thanks.
-- 
~Randy

