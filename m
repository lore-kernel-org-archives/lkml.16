Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D57D1B85CC
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 06:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746428196; cv=none; b=Mo7R+ofPGCzvLxcTut1wVHmWi1RUitU/gGazalQJx9rj9v9AaA4nb10YNIExi7oTjXAEiZ9+igdjAh5wVPAk4OnH3b4djmzmERzAS2pho7UQIhXM9abMG0VGlOFTW3TTRjmVXlpGWfswmXYHpnczdVU6rC5NQx5Ih0Hv2ULYmfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746428196; c=relaxed/simple;
	bh=NmpMGrUecPPaiFhxxOgCqTp/KV5SsmZh2KQYe2xB9Vc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jZ3hCbvIkpWN7xMvXXBzAel8JXR+4CHNSZPn5PQGNFkr6uAPHW9OSoON/5fr3OwcMvIt6c18t/URq9aBC8eKnUel7dvH7kTgb8hIsNrReexMqviUcx6gLK7lDhAYq6KzxAKhJtEfSNZClkPApcAQEXHokTdggWmw+PV67LzPjds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id ea14cced-297d-11f0-acc7-005056bd6ce9;
	Mon, 05 May 2025 09:55:23 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 May 2025 09:55:22 +0300
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] list: Remove redundant 'extern' for function
 prototypes
Message-ID: <aBhg2i7k8ZprSkCV@surfacebook.localdomain>
References: <20250502121742.3997529-1-andriy.shevchenko@linux.intel.com>
 <20250503193542.bd707ba88b542bb797fa49b9@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503193542.bd707ba88b542bb797fa49b9@linux-foundation.org>

Sat, May 03, 2025 at 07:35:42PM -0700, Andrew Morton kirjoitti:
> On Fri,  2 May 2025 15:17:42 +0300 Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > The 'extern' keyword is redundant for function prototypes.
> > list.h never used them and new code in general is better
> > without them.

...

> > -extern bool __list_valid_slowpath __list_del_entry_valid_or_report(struct list_head *entry);
> > +bool __list_valid_slowpath __list_del_entry_valid_or_report(struct list_head *entry);
> 
> I'll apply this because you continue to do significant work on list.h
> but I don't want to spend the next 5 years buried in little "remove
> externs" patches!

Thank you!

FWIW, I made this change because (as stated in the commit message) list.h from
the beginning hasn't used that keyword and a relatively new change brought
this. It's not a part of any huge churn, and just a standalone ad-hoc change.


-- 
With Best Regards,
Andy Shevchenko


