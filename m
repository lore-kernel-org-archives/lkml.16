Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A44265633
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 13:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745243840; cv=none; b=FrqYdYf1SLY018wxU61D35GyrMzSrMb5gwZZ5aXVur5WeFcuxzRHUeE4/KkgNY3l5UhWEwHEAbK51fca+NAm9D5KVJqPbFp4ZYtUs0CR6gur0OyTnP0TF4EGq2qbOA/IjXUkYmUaXxosEwSBhBCqyEX+kutW9Or78CCsrYCZdx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745243840; c=relaxed/simple;
	bh=pJd8WsxtAYkHwS8ClpQ3xqwdhETlXCk5deE+sz8qGtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CkvpVh/fWBHdbMg7O8L0uPXX8Uu2+qGAk3JvOCTJnlvxoIAAi59TLcruMDoyFcm3VevKlwTpLkYWv4eEf6s4Kjg5f+tdEyIiUcmm6jy+fuYU3utN4IJUtfnqqS2ZVr4hCeNv14RvA5kuuWfyZXbpNsOIPD56ecZ9OQYhc49Kwkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=IKnYMhIo; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="IKnYMhIo"
Date: Mon, 21 Apr 2025 09:56:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1745243826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pJd8WsxtAYkHwS8ClpQ3xqwdhETlXCk5deE+sz8qGtA=;
	b=IKnYMhIo3I397WCqX+KqiNcubIvRK/YQxQCvQRIp7b2/5IU8k4Fc8nZBsAONLPIRZdezi6
	Zjl+bUVpO1RbP1hEJvwg/kruiB3I342cu0emyGn+XeC9I8/wMrPR5Obrevpj2XoZQy42+X
	GAaUWnyBOIPc7HbcGAovNUhbs+nZFCvMzSqp8t/CreBHxRLolMlT1KzMT8gjzJywUt9/OT
	HQG8P7/RstCG5cHFe5MXFBTgU0knd2JYY3ksGYBhsyLZsRGdw+AUej+HcStXnPPBwY59Y0
	9Iu4QFTerpHxwKY3my+gSB4x9zgPtCKEI5Husu7WnavpT+/iELXPkycMIqvHiw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Aditya Garg <gargaditya08@live.com>
Cc: Petr Mladek <pmladek@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
	Simona Vetter <simona@ffwll.ch>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com,
	joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
	Kees Cook <kees@kernel.org>, tamird@gmail.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	Asahi Linux Mailing List <asahi@lists.linux.dev>
Subject: Re: [PATCH v4 0/3] Use proper printk format in appletbdrm
Message-ID: <aAZOpLeqBeeZ-4mG@blossom>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597D506487C3133B0358CE5B8BC2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <aAY0hRvNCi0y6rlt@blossom>
 <PN3PR01MB95978C5635B676286A9F0EB7B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <aAZDApE-Wm_NlbMx@blossom>
 <PN3PR01MB95977FDD2F4DF6D9E198C516B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB95976BAC455F10F6D75B9C84B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <aAZM0svrO2MiNAdg@blossom>
 <PN3PR01MB95973648BB4FECBB2E24C5C7B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB95973648BB4FECBB2E24C5C7B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Migadu-Flow: FLOW_OUT

> Any change needed or just because some other maintainer manages this? Although Tbh, I really don't care about backporting since T2 Mac users are still using patched kernels provided by us. I'd rather free my mind in getting this done.

I'm just too new to kernel to do nontrivial merges. Either I can queue
this series to drm-misc-next today (no backport no changes) or we can
wait for someone more experienced. Let me know which one.
