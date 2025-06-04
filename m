Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906191DB546
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749055339; cv=none; b=NoqzELU7ChKHWBKc4Ii7+yWXHCDEIYhmXu/F8Zv1lijczxHZMylj/JYxTm/MmDrig1CXkkCmpHWVzDaD3D1FwX43We/n0Gz/X6e5ywhd3TEpzAWwb/SD3xPRqtATkZ+7PudrDYTIltTtqyd35HMVlO9GpiRubCLBkHRWmI0iUBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749055339; c=relaxed/simple;
	bh=6oDaVMR5T7a4UGEhgBoYgoqpmln5pkjysQIFT94z3lA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E96Wj2rVHtw+T+7nqlMNvQrYlroFwaBSKCzmOH+rtTVifWEMCwC1LZyVrW+BL62Ym83OhwoOSaOHJgnOK+xFLuzZ26vXyhoPAdZKqJNicoLsl58pGUFcmfBkzeMjCs9i+c6RT7IQkD4Bb5eCHdJG3Lp2hREtKSOIK3z5SoCAEeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396C3C4CEE4;
	Wed,  4 Jun 2025 16:42:16 +0000 (UTC)
Date: Wed, 4 Jun 2025 12:43:32 -0400
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
Message-ID: <20250604124332.5291e30d@gandalf.local.home>
In-Reply-To: <20250604123837.0603354d@gandalf.local.home>
References: <20250604085121.324be8c1@gandalf.local.home>
	<6b3a37712330ec4b17968075f71296717db54046.camel@linux.intel.com>
	<d996ffad-42f1-1643-e44e-e837b2e3949d@google.com>
	<20250604123837.0603354d@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Jun 2025 12:38:37 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Wed, 4 Jun 2025 09:26:21 -0700 (PDT)
> Hugh Dickins <hughd@google.com> wrote:
>=20
> > > Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>=
   =20
> >=20
> > Acked-by: Hugh Dickins <hughd@google.com> =20
>=20
> Thanks Thomas and Hugh,
>=20
> Now the question is, who's gonna take it? ;-)

Never mind, I see Linus took it.

-- Steve

