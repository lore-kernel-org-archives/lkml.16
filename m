Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960CE1DDA0C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749055043; cv=none; b=QzGDn09poundHCVwlBJg/9VfPnIIhpkLhZGkcGHGUTT+MADoEv9p7R2gJuzbBCTeJvx7PoN66J2V2jcodvPpcEISEXiEScypVk8V9bjw7Rq+rPRndWdYgWe4ErG5Lxhg958sdsav3YKCmzX/a7+Xfb7LpEipHqGl/FnycFl0dRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749055043; c=relaxed/simple;
	bh=jC+2l4bpQLFniTd2XMMKy3YMABlelBNu/BiI4joa0Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eYah8PnLOeG9SYWjzJ68RrqTjKToDYaCNOZfbhIxu3S7aY5+7TnYlbcJ+O6ImLzAZHiFiE5cDGyq9mRG+kZqE/IkyVY6TtZ0r/PdN54fPI94HNYW389RZfcHPyVWkdjtRXlkoKkwALVVKMA5kq8H3e8v1S9ZSItCiAtNie0ftzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A3AC4CEE4;
	Wed,  4 Jun 2025 16:37:21 +0000 (UTC)
Date: Wed, 4 Jun 2025 12:38:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Hugh Dickins <hughd@google.com>
Cc: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Christian
 Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, Matthew
 Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2] drm/ttm: Fix compile error when CONFIG_SHMEM is not
 set
Message-ID: <20250604123837.0603354d@gandalf.local.home>
In-Reply-To: <d996ffad-42f1-1643-e44e-e837b2e3949d@google.com>
References: <20250604085121.324be8c1@gandalf.local.home>
	<6b3a37712330ec4b17968075f71296717db54046.camel@linux.intel.com>
	<d996ffad-42f1-1643-e44e-e837b2e3949d@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Jun 2025 09:26:21 -0700 (PDT)
Hugh Dickins <hughd@google.com> wrote:

> > Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> =
=20
>=20
> Acked-by: Hugh Dickins <hughd@google.com>

Thanks Thomas and Hugh,

Now the question is, who's gonna take it? ;-)

-- Steve
