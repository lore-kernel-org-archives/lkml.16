Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCD913C918
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 12:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745237146; cv=none; b=ohmFQqa6RjmzllybCpyhUZIgnx+G5CXcSkCtQauWL2thDhDbx3QTc1ZeCZ2is3sAuuX/dUFIa8eUGpDc/b5ECCeVwUqa/4Ow9eNA+NRsXPass71tlWgPzYkzIcL8NNcK9C2k/ggUJElTomVKhYH4lBLYKSmJ2uYjt/yo/73Oonk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745237146; c=relaxed/simple;
	bh=2PHBdSKyaQPqlbSM8yTXUcYGGEk2cPFa1bPGHgLQCq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXXLs+6eE8bziBnw96tc8Ne2sMwSTRDgD5eNS1bx/YwANycr8fXqqi4v6lv+Qsx6ab5dOLjD+CGdpeO/CQWyY3X11cTudQeqgbY4uKNcy53VCTwOXzReZTI2JgoYvIys2mG3fyS+ZPJo+X0i6T0AcwH5wzUF6HFrkjr8/PZzK/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=yY26akcF; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="yY26akcF"
Date: Mon, 21 Apr 2025 08:05:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1745237132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2PHBdSKyaQPqlbSM8yTXUcYGGEk2cPFa1bPGHgLQCq4=;
	b=yY26akcF3YSEbswfNsM1neBZz9PdHg6FanKmv3WRpHj5kqVxQU/52gQm+0XFOpgHPlWl3j
	55keSs8zD4EcgGpUIwE7T8pI3cumhjd6NDlEKluh3T6w72pxICvZHPuKMyF1kbORFC+lC6
	aXGa8V1pJVPF2NXWhXbJAs5WMeGlKpbbR3kYvgO6p5u1ls9PFWTLxTfPNE/wo/gMVOkBuI
	EgHrQNaY+ZZ+S8N0adh6tEikecCYBQo7webOJ9l+jqft2lxi1YzB27OUKb1ta/fpx4PiQX
	QS6W+ZimsdM3EBpXZ/g5a53FXN1kB006Jb5Doz8tKY33vGppRjcEW6wjb8uHlw==
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
Message-ID: <aAY0hRvNCi0y6rlt@blossom>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597D506487C3133B0358CE5B8BC2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB9597D506487C3133B0358CE5B8BC2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Migadu-Flow: FLOW_OUT

> Can I have a feedback from some DRM maintainer on this? AFAIK merge window is over for some time now. It's been more than a week and last time when I submitted, it just stayed in the mailing list without any feedback.

DRM hides the merge window from committers so that's not super relevant.

I am a DRM committer and can pick this up if necessary but it's not
clear to me what's going thru with DRM vs elsewhere.
