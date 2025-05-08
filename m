Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB97A2AD20;
	Thu,  8 May 2025 14:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714570; cv=none; b=rJbD4mNq4YiKfDZi8U1DhsdfzfcXpxKJOR6FG4toWOpR31xPQ2kTtxBd3KnLTDPwGLaFu5hKAaw3Gyafm7IjY+O1+hn/OF3Msd98yswyZoIuFY3SZ+JV3ItWQyhKgy7elcxCbrPCx1n0Sju9nDlPYvMtDLDKf9zbcToxxhRXXos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714570; c=relaxed/simple;
	bh=W6JOmhmDyfPqPFSYQOBYwQNFj1DkKPisOWKe00hmnlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owoP98JkV0Siv1bHX43FfyFT2HHnBqxXGEIWYJVGqDfVu6/EOD9uJuoQeHZflrGNPPfIKdLurn5Y1jlGZDDr3O7DlKhBzFeE/X0K6BIzT9tnw4ErgkqsIr3lxzQ01LR1EV9Je4LC8x4rqtkMa1G4fzbm9zR9Rb5E5WQIo0U+M2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d5aFi3tW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d5aFi3tW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746714569; x=1778250569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W6JOmhmDyfPqPFSYQOBYwQNFj1DkKPisOWKe00hmnlU=;
  b=d5aFi3tWbNYP/k9vxouSpftrDg0tL6fID5u0HBdCk6GcFwdzLtXcQibP
   ooBUh9ZRiYjG284jeN2GQtlJ0N6lWNmgXl5IOnTprR/n+iTmbcQsm8plS
   7lD/6awhjcT5a6q2Aonrljyf3guS8HMnJMCAHDToQjoAePQjGeyq1bEfI
   fs3S1E9rXX7sUv9OMb9IkJNfyDvCSMjrFz3cRb8pwLBX76Xd7o3EAEVkA
   IY6zFHJyux/Q510w6jNuR+rJqau3P9gE3Wnam2KkMxZIX0QMvMwX9E1PO
   8qaAnAPBV8HA6VNP1U+j9WbdKbUxTBHCufl6HE6m6mmJjdFU5US6ntONP
   g==;
X-CSE-ConnectionGUID: 9CqDSIbLScm7dDwC/JKxlQ==
X-CSE-MsgGUID: Q5toD32VSmWPyeiz782j/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58711036"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="58711036"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:29:29 -0700
X-CSE-ConnectionGUID: emiuuaYYTdOAQc3k8ld2Sw==
X-CSE-MsgGUID: +wzcBO0sR8O4NeZ8Np7T8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136022167"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:29:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uD2FX-000000048QW-1SJc;
	Thu, 08 May 2025 17:29:23 +0300
Date: Thu, 8 May 2025 17:29:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, ikepanhc@gmail.com,
	W_Armin@gmx.de, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net
Subject: Re: [PATCH 1/2] platform/x86: Move Lenovo files into lenovo subdir
Message-ID: <aBy_w42MapjiD6al@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250507190456.3004367-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507190456.3004367-1-mpearson-lenovo@squebb.ca>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 07, 2025 at 03:04:34PM -0400, Mark Pearson wrote:
> Move all Lenovo specific files into their own sub-directory as part
> of clean-up exercise.
> Longer term goal is to break-up thinkpad_acpi to improve maintainability
> and perhaps share more functionality with other non thinkpad Lenovo
> platforms.

...

> Some questions that I didn't want to put in the commit comment:
> 
>  - I didn't know if now was a good time to propose this change. I
>    realise it could cause headaches for anybody with patches being
>    worked on. Please let me know what makes it easiest for maintainers
>    and other developers. If there is a particular branch that would be
>    better to do this against also let me know.

For me Git handles renaming very well.

>  - Should I be updating the MAINTAINERS file? I'm still not sure what
>    the protocol there is. I'm very happy to help review anything in the
>    lenovo directory, but I didn't want to make assumptions.
>  - I have tested on multiple platforms but I don't have any ideapads I
>    can use.

-- 
With Best Regards,
Andy Shevchenko


