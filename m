Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310452C327E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749039711; cv=none; b=LCY5Bs/dRENqPltbRdRn8HcDJET8EZdJW0B8uSvKSRVoh02EQSKOB3EAjnJ/sChW3W5u33D23GktIPl7w1jmAJ8t/lxCKHpnCDWzmvCPfBxraWixEBX76uL3E84+jbheP8SX0oo4wBayaHJbkScSQ8Nuwc1M5s/x9MF02HXGNUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749039711; c=relaxed/simple;
	bh=oOm+H4FXm5gkLeMJjwvfvPYmhfu0ZnBEppOkxKmLUjo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kw8z/VpbsqVk3mI5Vbzb/WP7HiqZssxsi/qsDvgQdyonY0fSDQPpz4/0l9rFixaJtkmtrPWNJCxcG3/YyqKgHwjGu3dKjBCZiFKCtca//Bo2L8LmdtXf7ZG3MKHvpNdV8RaBnGbLAn4XMQCT27dFxuGGds0yd0ALnXr+xygj8gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB936C4CEEF;
	Wed,  4 Jun 2025 12:21:48 +0000 (UTC)
Date: Wed, 4 Jun 2025 08:23:04 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>
Cc: Hugh Dickins <hughd@google.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Matthew Wilcox	 <willy@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, Andrew Morton
 <akpm@linux-foundation.org>, Christian Koenig <christian.koenig@amd.com>,
 Huang Rui	 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost	 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] mm: Fix compile error when CONFIG_SHMEM is not set
Message-ID: <20250604082304.6f13e9c0@gandalf.local.home>
In-Reply-To: <3262455c0ac3bff64522fff47c0281943c9f76ea.camel@linux.intel.com>
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
	<3262455c0ac3bff64522fff47c0281943c9f76ea.camel@linux.intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 04 Jun 2025 14:18:06 +0200
Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:

> Let me know if you want me to send a patch for that.

This is a simple fix. I can send the patch and make sure it fixes my builds.

Thanks,

-- Steve
