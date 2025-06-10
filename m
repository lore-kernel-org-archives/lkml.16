Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9DD28BAAB;
	Tue, 10 Jun 2025 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549696; cv=none; b=D7AFVGgFS+rOl4Bihf7QE4WD1jL9T0Ir36EYD2kggVXZyCyPYGAvhUrsp500/jgks0DpBhBcivp6CQivPukZ3cFSyIhDbDej34WXpm6ASpUdZB23RTlGDL07kBubsesteHXnpfdz3QbJnq9Pnx+d1+Vmdl3zB8MLQ0whP1Q4HqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549696; c=relaxed/simple;
	bh=0esks7NiXmflWu86rtyiHIstnvaZKrxBSy6l+qhJjF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jbJEQII4WYoObBtp3CJLJWjkvcEMsPm2GPtQFv0K2Tck9cOujhtqk4vkude60gL/wiXMyEOAYxW9Q4QBbHhqRMiJLmZewnqYcxWP1PdXFD8GlqWRD1O6glZ32OMF/aUJC5uzguJ8VHDg6g1+5fSE9U701G6ZGeMUvvUOmWptjk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBOCU2y3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBOCU2y3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749549695; x=1781085695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0esks7NiXmflWu86rtyiHIstnvaZKrxBSy6l+qhJjF4=;
  b=cBOCU2y3UIx/d7s4P9nJhJEHZNhRpgfd3Ur6fm9dPCkDeRmmg/WIFaCR
   ToZn9rMSjtRXhq0FNhGbY+ENlgcfkSTbneDG7wLTboL4fVs7xilgkYsaF
   QunxhmDrEMdzfCtb2vlGpW/AxazzmtAUS1CWl15Fg4xRydvlk9mNRvKkY
   nxRyZtbRiLmJ4UTtXOE9Q9Yebaoee6GVlLQGUeq6liX4elbSiPFdHlv3W
   Ef1UbS2Gs0FG8UZKqZrOZ3XRg7+plDKr/3EZoRIy+I6/LQ5a5M0wS0B4h
   CqpsTr8px3zm5Ht8RsAFo1yIYWUX/TdcSu0H9aPJ6XV0IfORcOAVf0yGq
   Q==;
X-CSE-ConnectionGUID: QT+QTfyhRVGlfCxCfvDzfQ==
X-CSE-MsgGUID: dIV1nNsIT1yzh3zak/LTPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51507604"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="51507604"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 03:01:34 -0700
X-CSE-ConnectionGUID: 7me+KZ45RwK1tv3QMP35qQ==
X-CSE-MsgGUID: SV1iRhpfTj+uJjkfSBuvIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="177720231"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 03:01:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uOvnM-00000005JbT-0JsS;
	Tue, 10 Jun 2025 13:01:28 +0300
Date: Tue, 10 Jun 2025 13:01:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, ikepanhc@gmail.com,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Armin Wolf <W_Armin@gmx.de>, linux-doc@vger.kernel.org,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] platform/x86: Move Lenovo files into lenovo subdir
Message-ID: <aEgCd7Z1rE6-K2Ac@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250609122736.3373471-1-mpearson-lenovo@squebb.ca>
 <aEdBWymLN7aYqkeB@smile.fi.intel.com>
 <33d3ea0d-161d-4297-9a99-9e7e129b31b1@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33d3ea0d-161d-4297-9a99-9e7e129b31b1@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 09, 2025 at 09:21:45PM -0400, Mark Pearson wrote:
> On Mon, Jun 9, 2025, at 4:17 PM, Andy Shevchenko wrote:
> > On Mon, Jun 09, 2025 at 08:27:24AM -0400, Mark Pearson wrote:

...

> >> -F:	drivers/platform/x86/lenovo-wmi-hotkey-utilities.c
> >> +F:	drivers/platform/x86/lenovo/lenovo-wmi-hotkey-utilities.c
> >
> > Is this correct?
> >
> Jackie is on my team, he wrote this driver originally (with some help) for one of the thinkbook platforms.
> If there are any changes he should review them as he has access to the HW, but I'll be helping too.
> I think it's fine - let me know if otherwise.
> 
> Just as background: We can't use our Lenovo email addresses for kernel
> contributions. They're based on an awful Outlook server that is incapable of
> handling text only emails, and also won't play nice with any other tooling
> (including git send-email). Not ideal but it is what it is, and I gave up
> fighting with IT about it (there are some workarounds, but they're arguably
> worse).
> 
> > Otherwise LGTM.

What I'm talking about is the filename.

-- 
With Best Regards,
Andy Shevchenko


