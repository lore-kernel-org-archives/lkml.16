Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED0C18DB21;
	Fri,  7 Feb 2025 16:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945787; cv=none; b=j6S/mvXCaw7g1O86nso3wNv/HGd1lLZw4gMuZcZ3rxl/ljKp0qhv8QIfpA2vtRKYxb7SYe8eLDrGzD8Dla0tsa36jIFeiloApOBZ8DfkIzSKsHJ7T81IoszQVk1l7PcL6UlyFvxXp/hRRgC69cN+yEQTTGJUAwy5WS62PQO7AFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945787; c=relaxed/simple;
	bh=CTg/oPt7b8oDc+wpDgmpUzTTliBbDj+D/KiMzWPe6wg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lKphFsLLsqdGDscdO+PbqSUEP30xEO3UqUORo9CwoRii6QW0pAAlmSwCRERMfKTUvaxfC2aIiZCt9qDtWw93vtp28QAecZCg3EQx7rqio7DhTooEi7iELSaQUJa63YCLGWCn76XlzryyRWNNJi2S0lbvvfSNCVqWn4eMg9gCc/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=m+l0jBJc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="m+l0jBJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738945783;
	bh=CTg/oPt7b8oDc+wpDgmpUzTTliBbDj+D/KiMzWPe6wg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m+l0jBJc2+iprI6Pu9oAN8vZvFcertgTLFqvOC1P0Cf9VU8moZlNVRZxTS+ML6aBh
	 G1pCo6/0HOXqFJxWmsDkvSkoTE03JlUCGl4Mb/oqTR1fEqyQTtvq23xAtTATRaDaO5
	 MJEDmnG2FxgwQjEX2QUP0rH/r2ZLN6TJy/mv1snvQP5kK9TNdsMR6M6cF5Dd0sCFla
	 EfOK4JfX3CzuSkoOnpwn/MhwtyrOPpWkat8fKqRZIoCiwJ+ZbLAdJ7MXmcgbvhtV0F
	 LHLnW5Vh17bwySYzpWPGmFgTs3tfTj9hIiYzyYg4SJafUiyZqFJRpEZPjqoXDM6lhD
	 P+7cCBNuAglyg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CF71617E1507;
	Fri,  7 Feb 2025 17:29:42 +0100 (CET)
Date: Fri, 7 Feb 2025 17:29:35 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, kernel@collabora.com, Tvrtko Ursulin
 <tursulin@ursulin.net>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/5] drm/panthor: Display size of internal kernel
 BOs through fdinfo
Message-ID: <20250207172935.2fa23902@collabora.com>
In-Reply-To: <20250130172851.941597-1-adrian.larumbe@collabora.com>
References: <20250130172851.941597-1-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 30 Jan 2025 17:28:08 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> This patch series enables display of the size of driver-owned shmem BO's =
that aren't
> exposed to userspace through a DRM handle. Also fixes a use-after-free bu=
g in the
> existing fdinfo implementation for Panthor.
>=20
> Discussion of previous revision can be found here [1].
>=20
> Changelog:
> v10:
>  - Simplified locking scheme in panthor_vm_heaps_sizes
>  - Fixed kernel test robot warning about documentation
>  - Added some R-b tags to patches
> v9:
>  - Added proper locking around group pool xarray to prevent UAF errors.
>  - Added proper locking around vms pool xarray loop for the same reason
>  - Added new patch that fixes UAF error because no locking when accessing=
=20
>    fdinfo group stats.
>  - Some minor cosmetic and naming changes.
> v8:
>  - Made print_size public and added prefix argument for drm_print_memory_=
stats
>  - Updated documentation commit to reflect new name tags
>  - Some minor polishing
> v7:
>  - Added new commit: mentions the formation rules for driver-specific fdi=
nfo keys
>  - Added new commit: adds a helper that lets driver print memory size key=
:value
>    pairs with their driver name as a prefix.
>  - Modified later commits to make use of the previous ones.
>  - Deleted mentions of now unnecessary memory keys in the old revision.
> v6:
>  - Replace up_write witnh up_read, which was left out in the previous ver=
sion
>  - Fixed some minor comment and documentation issues reported by the kern=
el test robot
> v5:
>  - Replaced down_write semaphore with the read flavour
>  - Fixed typo and added explicit description for drm-shared-internal in
>  the fdinfo documentation file for Panthor.
> v4:
>  - Remove unrelated formating fix
>  - Moved calculating overall size of a group's kernel BO's into
>  its own static helper.
>  - Renamed group kernel BO's size aggregation function to better
>  reflect its actual responsibility.
>=20
> [1] https://lore.kernel.org/dri-devel/20250123225325.3271764-1-adrian.lar=
umbe@collabora.com/
>=20
> Adri=C3=A1n Larumbe (5):
>   Documentation/gpu: Clarify format of driver-specific fidnfo keys
>   drm/file: Add fdinfo helper for printing regions with prefix
>   drm/panthor: Expose size of driver internal BO's over fdinfo
>   Documentation/gpu: Add fdinfo meanings of panthor-*-memory tags
>   drm/panthor: Fix race condition when gathering fdinfo group samples

Queued to drm-misc-next.

>=20
>  Documentation/gpu/drm-usage-stats.rst   |  5 ++-
>  Documentation/gpu/panthor.rst           | 10 +++++
>  drivers/gpu/drm/drm_file.c              | 27 ++++++++----
>  drivers/gpu/drm/panthor/panthor_drv.c   | 14 ++++++
>  drivers/gpu/drm/panthor/panthor_heap.c  | 26 +++++++++++
>  drivers/gpu/drm/panthor/panthor_heap.h  |  2 +
>  drivers/gpu/drm/panthor/panthor_mmu.c   | 33 ++++++++++++++
>  drivers/gpu/drm/panthor/panthor_mmu.h   |  3 ++
>  drivers/gpu/drm/panthor/panthor_sched.c | 58 ++++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_sched.h |  3 ++
>  include/drm/drm_file.h                  |  5 +++
>  11 files changed, 176 insertions(+), 10 deletions(-)
>=20

