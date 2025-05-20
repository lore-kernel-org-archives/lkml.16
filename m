Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869E11D5CFE
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747750612; cv=none; b=juE5wENesjZx34Vfrcaq+2XhTBliQsxTl2bZ0ID9WnE01dLIeDZorVWKqzXwEt/C26DFIHHg/Nqon4XIjbQuxnZAnT8b1C5+KBZhodrilHl2MYrrrB4X8pfRrlximppaAcJGCtLTXicNSQ4LqweNHvRzNUwgpLVI+tCiB6BuWhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747750612; c=relaxed/simple;
	bh=M0pNFlay5hgmHd4G9vpxXMlNbzz6ICDKPmbFCUwPiPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHb9a2oDsIFORN69J+yWkqusSwG4XWlS8xOCCKlfZ6qdunSId1wlLmtYBlBDkj0DEq0Rk9J/CIp5qUy6chgOH0RV1gv0lkG9y2YE2uTfNIO/LfZAk6D6f7vv2C1jEQbASW3alrdOLCD5F7+0KxwiMv+ZL1DzbEw2UZb8v/6OVTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+8IDAm5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+8IDAm5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747750610; x=1779286610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=M0pNFlay5hgmHd4G9vpxXMlNbzz6ICDKPmbFCUwPiPg=;
  b=d+8IDAm5vcrZU/HEo7w0bCKGnLGrtmPdAFyJbDsL4KpL1C1k9SoqxMSy
   4zfJfhnNrcK9/7cZrP+16syXPqy8LALBIPmtm2Nq0mcTpN1ffwqGWakvd
   zBGREPLOh1gaqTyN8xjdcYCE3hICxXuxubOyVTuoTShH+KKAaz/TegvH+
   EDCwH+k2KeDhT3zg31z3+bPuhg2eTMxA1AzBLAPWw+FZOH91aKhhRmsLc
   tWBwKeU3h2yLhCIkVQHzCdmHAgRK8dl8HfkCCj594hk+KrJVq8Jj5e+Oo
   pL3jIMo5YisaPl8/m/X6kLN12kwmxPyEXu3doU88hVbZ5eV7Z1DT281OK
   A==;
X-CSE-ConnectionGUID: 2fpOgYppQHSyy/O/8bk15g==
X-CSE-MsgGUID: KPbU2GXWTqmXuoJjn00gyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="75089328"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="75089328"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 07:16:50 -0700
X-CSE-ConnectionGUID: sOk0Q7p1SKG5aaq8NPm2bg==
X-CSE-MsgGUID: QXhUWdU4REGANJ270QQr7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139418130"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 07:16:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uHNlu-00000003LNg-0aVT;
	Tue, 20 May 2025 17:16:46 +0300
Date: Tue, 20 May 2025 17:16:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] container_of: Document container_of() is not to be
 used in new code
Message-ID: <aCyOzUIIvMk6Gp8o@smile.fi.intel.com>
References: <20250520103437.468691-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250520103437.468691-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 20, 2025 at 01:34:37PM +0300, Sakari Ailus wrote:
> There is a warning in the kerneldoc documentation of container_of() that
> constness of its ptr argument is lost. While this is a faible suggestion
> container_of_const() should be used instead, the vast majority of new code
> still uses container_of():
> 
> $ git diff v6.13 v6.14|grep container_of\(|wc -l
> 646
> $ git diff v6.13 v6.14|grep container_of_const|wc -l
> 9
> 
> Make an explicit recommendation to use container_of_const().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Hi Greg, Andy,
> 
> I guess we generally agree the additional constness check in
> container_of_const() is useful, but adding the same check to
> container_of() generates warnings -- there are some errors, too -- such as
> this one currently:
> 
> In file included from /home/sailus/src/linux/include/linux/bcma/bcma.h:14,
>                  from /home/sailus/src/linux/arch/x86/kernel/early-quirks.c:17:
> /home/sailus/src/linux/include/linux/ssb/ssb.h: In function ‘dev_to_ssb_dev’:
> /home/sailus/src/linux/include/linux/ssb/ssb.h:291:14: warning: assignment discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
>   291 |         wrap = container_of(dev, struct __ssb_dev_wrapper, dev);
>       |              ^
> 
> As noted above, 646 new missing constness checks were introduced through
> container_of() macro use during the 6.14 cycle alone. Most of these are
> likely harmless, but with so many new users some are bound to be ignoring
> constness.
> 
> Once the warnings from bad container_of() use are worked out in a way or
> another, the constness check could be added to the container_of() macro
> and the current container_of_const() be dropped altogether.
> 
> If this patch is accepted, I'll see how to add a warning on container_of()
> to checkpatch.pl.

Hmm... Wouldn't be better to fix non-const cases and add the const check, etc
to the container_of() instead of doing these comments?

-- 
With Best Regards,
Andy Shevchenko


