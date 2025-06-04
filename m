Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0FF1DFF8
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749039494; cv=none; b=M+OHNSXkM5UJjunjvwuTuRcGIxAOJyz+d+FAslU6tMLI27KXOd+xB+GDzTZnQhfTjg+adH4CARLmE8YxaLbv7ARhqLpFxUzKmN/CMVm4gSJWBHqTVgprfegKm2VsHkVVX0wFsFL8/XB2JO5aoS3PvPvbW2xojest5TlrGfMkUYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749039494; c=relaxed/simple;
	bh=JfaoRG57LFIS/dd8Kog1/eQFr8Bx0dcUrQuHslbLOmY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XlOAQrL9lX4fi01Ij/yXtjBsgLdiiWt3SauGN+yN3zuqGY36wkfUU7HWPHoNbtV948s5VH5UvxDI+nxUQ1OQn9LajNnAOtI3b/OtIWvrdo2ONoG+yvbyA9jjZ8HgLXRzXLTq46mV+A6B3BCZ+cHmQ+O6xPmVNhP4ICSCWmF+zHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RnFsKzpb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RnFsKzpb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749039494; x=1780575494;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=JfaoRG57LFIS/dd8Kog1/eQFr8Bx0dcUrQuHslbLOmY=;
  b=RnFsKzpbKJohUcvz3prwX3oeZ2xjFZrgDRLurwQDX9/Lvd/m7NxLCvRb
   9CSOFjUWERbrTAn59lRz2ZBT8U4pfOKP4ev5xbvPYakkPBALglCfOuHtm
   IFCVDIgEyRnKMur09pW2UBvxc158xe9KGrbUBytdo+ACYWf1rDms91Q2w
   NrmsBoeP/+SP+2OwfyjUpGWl9vagYYE/sKcyJDT4k0sqIFISD8um+M02w
   3sKa5x/TzfIOcFMPZRVcc1ZWtaW4MMZ4LRrrzrWSwdT9ZygHtyFrR/VP5
   C5opfO1ziO2uaLNGdc8D1QexgZUw3/oD+u3xSfbXSMl7rQwXC+i8MU8aC
   w==;
X-CSE-ConnectionGUID: 44BJiRqrTt6YOaOEgI00tw==
X-CSE-MsgGUID: jB+jOGzqScuPPlhrFL+0rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51188742"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="51188742"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 05:18:13 -0700
X-CSE-ConnectionGUID: vUOPYx5oQuixYIIMdrWXhg==
X-CSE-MsgGUID: x63ZjyzkTBO+WtX82pS7Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="182345818"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.121]) ([10.245.245.121])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 05:18:09 -0700
Message-ID: <3262455c0ac3bff64522fff47c0281943c9f76ea.camel@linux.intel.com>
Subject: Re: [PATCH] mm: Fix compile error when CONFIG_SHMEM is not set
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Steven Rostedt <rostedt@goodmis.org>, Hugh Dickins <hughd@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Matthew Wilcox	
 <willy@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org,  Andrew Morton <akpm@linux-foundation.org>, Christian
 Koenig <christian.koenig@amd.com>, Huang Rui	 <ray.huang@amd.com>, Matthew
 Auld <matthew.auld@intel.com>, Matthew Brost	 <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Date: Wed, 04 Jun 2025 14:18:06 +0200
In-Reply-To: <20250604080409.448a27e4@gandalf.local.home>
References: <20250602170500.48713a2b@gandalf.local.home>
		<20250602171458.7ceabb1c@gandalf.local.home>
		<aD4boBrdZXtz_5kL@casper.infradead.org>
		<fc2b6a94-bd2d-a5d9-c935-381a1613f47e@google.com>
		<20250603102959.20c85adb@gandalf.local.home>
		<aD8iL4cFoXpIVK_0@casper.infradead.org>
		<20250603132736.554f611d@gandalf.local.home>
		<CAHk-=whb2rMUCGsaNQC4pkCikJ7iX2_Tc1ye5_a6R9-vAkd2Cg@mail.gmail.com>
		<20250603140632.168190f9@gandalf.local.home>
		<dca861b8-a29d-b2b3-eba7-32aaf2b8eff7@google.com>
	 <20250604080409.448a27e4@gandalf.local.home>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-06-04 at 08:04 -0400, Steven Rostedt wrote:
> On Wed, 4 Jun 2025 00:03:18 -0700 (PDT)
> Hugh Dickins <hughd@google.com> wrote:
>=20
> > I vote for the "select SHMEM", but Thomas and dri-devel and Linus
> > should decide.
>=20
> I only tried "depends on SHMEM" which did not work, but it looks like
> "select SHMEM" should.

I agree. The whole ttm_backup implementation is based on backing things
up to shmem objects so IMO it perfectly makes sense to "select SHMEM".

Let me know if you want me to send a patch for that.

In the very unlikely case someone would ever want a config without
SHMEM but with TTM, they'd have to live without the ttm_backup and we'd
create a separate config for that.

/Thomas


>=20
> I prefer this solution too.
>=20
> Thanks,
>=20
> -- Steve

