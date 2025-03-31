Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AC514A605
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 06:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743403008; cv=none; b=Gi8J/pqUFsz6YqGFLXDcAsHuh6QE7Wha2jEslk1sxM5kbjGeeQung/R9yba9meBjQ8UrkLDY7X4Vijhme603wQDJG3Czdx+cgT6bfd5gLp8c3D1CnIfj/JQd4zoxi0BFl/1Raqby3hfqr5t8XT8FDx5tr+/lnj5IZqFaCn0m1rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743403008; c=relaxed/simple;
	bh=jK0oGXhrf5LXZEVNPGJCQLLKJrWimxnnj+AVi+TagaE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Gm5mlkwRia+vCw/wvb6PO2F+yxtIBl7qt2FYdLcNwZQibYAsH1z+QhawHIQTprFtr0phjvSR3uyAONYsFz2YYpSvrnMjJP5X8WYt4+FhrM1NTHBgbTneSRUwbtyd/NNhfE3flmITZpa8C+iorCchm3TwnS2HQoohjzhMRkAxgYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ex+ZMpLe; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ex+ZMpLe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743403007; x=1774939007;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=jK0oGXhrf5LXZEVNPGJCQLLKJrWimxnnj+AVi+TagaE=;
  b=Ex+ZMpLejbYrv+DcnYRPS5rxdVLPaEgBDtfCIXtHhpnffqIHfKMTdPTx
   87AxKoQtp8F9p0opmGZisF+q8oHj9zUDG7nyBph/Ivt4pURc8/9axIQ8p
   5EPGb5PsYGftf7JivjLetzWJOusv/u8UeWp6QIaE9Pib+o+FN0R2g+ZrR
   9FwTM02ZN3U9O8zSKmHdzOr24k2tYKRKC3uTH6cEa5hjyZKMQ5lGI5ZbW
   AHBjrb5VsXhVVN96EEAtQuW/vy8uVWMmNP58tOkY7ScHbrSw9h5Kh0O6A
   Z6dRy8an3j0g92r22lLzGb26T5jUjeNj9TS2lNgCAviIYtSHtJDIqYcOw
   Q==;
X-CSE-ConnectionGUID: mWKC37uQSyqdve+ipRzhnA==
X-CSE-MsgGUID: sbRUi1LqSJSnn9c5KRAtHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44684536"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="44684536"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 23:36:45 -0700
X-CSE-ConnectionGUID: X26YnpM2Rj+DnKgOvXmVrg==
X-CSE-MsgGUID: nwoXTBqST9SHOLS9cPeytw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="125993544"
Received: from unknown (HELO ubik) ([10.237.72.184])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 23:36:43 -0700
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Matthew Wilcox <willy@infradead.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>
Cc: alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] intel_th: avoid using deprecated page->mapping,
 index fields
In-Reply-To: <Z8drzoRVJL3P1jlN@casper.infradead.org>
References: <20241203080001.12341-1-lorenzo.stoakes@oracle.com>
 <0fcfc239-19c7-404f-bbc5-70a29ccf6ec0@lucifer.local>
 <87v7tyyrvb.fsf@ubik.fi.intel.com>
 <64514bd2-0271-4b2e-b1f5-a35520fae4ff@lucifer.local>
 <87sep1zw6d.fsf@ubik.fi.intel.com> <Z8drzoRVJL3P1jlN@casper.infradead.org>
Date: Mon, 31 Mar 2025 09:36:40 +0300
Message-ID: <87frityadj.fsf@ubik.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Matthew Wilcox <willy@infradead.org> writes:

> On Wed, Jan 29, 2025 at 01:39:06PM +0200, Alexander Shishkin wrote:
>> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:
>> 
>> > Thanks very much! Yeah just keen to get this in as we are moving towards
>> > removing these fields very soon.
>> 
>> My understanding is that this is a part of larger effort to reduce
>> struct page to 8 bytes and an optionally dynamically allocated slightly
>> larger structure, is that correct? Just curious.
>> 
>> > Could you take this in your tree? I think that'd work best.
>> 
>> Sure, will do.
>
> Hi, this doesn't appear to be in linux-next yet.  Could you confirm it's
> scheduled to hit the next merge window?

Yes, I'll send it to Greg once -rc1 is tagged.

Regards,
--
Alex
