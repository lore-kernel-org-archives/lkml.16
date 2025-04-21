Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454B5264A9E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 13:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745240855; cv=none; b=VxIY3gPGUy7vT0qXeo5v0qPmOjfTWlbE57+WNEsI4uLniz1cJGP/iOlxmo49xA+Jar09rV5215EdqLLuK5qJdV94egk/Zg+/wOuuMmZXbuOXVakOz4bwWeRHmsffaHt2QFQZmf3XLmbAIaQJec114UFg32iZaUo/9zhn8lwCEbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745240855; c=relaxed/simple;
	bh=SlLdaMxcYIQqr0TfdBgzYc7asASKlMl93hbYkq5Xd2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5REB2Ev0tOdou4hKGnJ9g4lxLL4tRIRc2sK5AXpZPBdcJvYty0OAJuNRztuytGkyEU4ICAlz7dtUkQdxuA7+1jaZv4+j/TEwrmHbWiEiHozXWKNzgqKI2QQh03uc+rmy4ewHc8smq1lTzmLGYegZTrdG31XeWzt505XhgXqiwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=dcEeqfWQ; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="dcEeqfWQ"
Date: Mon, 21 Apr 2025 09:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1745240841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wTozYi6D8Lh0GMP5y3aPKcTP9nDmVxr+Gndx4+CY6oo=;
	b=dcEeqfWQIqSbJYQWk2BH9IgHv1DIGiprzUF5xfwHQE9hgZOgGJF0Ej1rfiQg5QvtSJGot7
	WC2mJjHK8hP7GYpP+Ztd3i95JFCaTPslPmYqk+Z9ZBnNGyiMdh25MFG27IbWRFLq6bZkO7
	tuxKKs/V1RRUh7/xaD1ey33Y9MMrsl548eTAWnNeQtzK/cIowmlLAc2tW0yssTGXOn0cJN
	fzL17h3OjKCHGUTnIY4cIoPDeJBgigW42p4np3qtK8Rf+Ldk8JxuH9zl6FkdcmhQxco1cc
	Sfe51i2ERIV8Fi8vDNucDwFo8r8J+VDYfIodlcML22zYFRuiwSZlJJpRTQwpGw==
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
Message-ID: <aAZDApE-Wm_NlbMx@blossom>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597D506487C3133B0358CE5B8BC2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <aAY0hRvNCi0y6rlt@blossom>
 <PN3PR01MB95978C5635B676286A9F0EB7B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB95978C5635B676286A9F0EB7B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Migadu-Flow: FLOW_OUT

> On 21-04-2025 05:35 pm, Alyssa Rosenzweig wrote:
> >> Can I have a feedback from some DRM maintainer on this? AFAIK merge window is over for some time now. It's been more than a week and last time when I submitted, it just stayed in the mailing list without any feedback.
> > 
> > DRM hides the merge window from committers so that's not super relevant.
> > 
> > I am a DRM committer and can pick this up if necessary but it's not
> > clear to me what's going thru with DRM vs elsewhere.
> 
> All the three patches are intended to go through DRM. IIRC Petr, the vsprintf maintainers had requested for that to be done.
> 
> The relevant patches have been Reviewed-by Petr as well.

OK, will queue this today.
