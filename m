Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A5726771F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745397392; cv=none; b=n/3W2EhF1oN+We4iLJ4z+vWCWW5knZEHS77YGSZkrOMbMvgenhsx6AnpL41kHleVznmZMZGS+ZPi4dVDJX29sGpe9nnZKvNb8HDG7yic9920QCPplc0sk8P69WeMQUpbPmvhGGxIXackfGBFBpoMo1+Osl/elRLDOPvU8+xJzvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745397392; c=relaxed/simple;
	bh=CMgueHlFXZUotyZU8ge0rGS/3vwqIXsNLIe3dmF84Jo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LQpgtKwBjtu6CEoi2d7O4el1/xehb0bz3O6nj0LBTGKDVuZkwxh9w9sm2+1xVG8ktsDx8G1GMhlxqDDn8Hbw7X2iqZDYxVWJjP1rppYuLBg06lpGrsmdhSInJaF4mubVaiVEiHl8U5fOCWTqvJz+RavO/3qGoVEvANdOJ97gyd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NKA1Mh7T; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NKA1Mh7T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745397388;
	bh=CMgueHlFXZUotyZU8ge0rGS/3vwqIXsNLIe3dmF84Jo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NKA1Mh7TOAuUKbCkFN8QWi/M6JVhYLKcd1bas8iS7V6CX0kldmId9tCqrktVo8YSc
	 YpVHcf4Gklognd+mBjfqhIt+hmHDPcShgS09xIwpOvtRyiuQAe/WG8JRudaAMewEu3
	 LIskSJ+gNxWssehUQ6q5GtpnhTUHIuZBKZmdaZL3CS00+bbplQeRhby9nSa3fd3n/q
	 LSAAk84KyOERbUkjTrsk/Wq6+5WGHVcTlhZSoUti/nVT7aExX6rxp8c1E9CsnxAeMW
	 uHCfm9XofeRXlOZLanF9J5jdb3D1pUVpPgGEUonTtJAYS+zqxPSlQF0DJP1LwsaK+T
	 30vixbFDICojw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0EDBD17E0C96;
	Wed, 23 Apr 2025 10:36:28 +0200 (CEST)
Date: Wed, 23 Apr 2025 10:36:24 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH v10 0/4] Panthor BO tagging and GEMS debug display
Message-ID: <20250423103624.22d55b6f@collabora.com>
In-Reply-To: <20250423021238.1639175-1-adrian.larumbe@collabora.com>
References: <20250423021238.1639175-1-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Apr 2025 03:12:30 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> This patch series is aimed at providing UM with detailed memory profiling
> information in debug builds. It is achieved through a device-wide list of
> DRM GEM objects, and also implementing the ability to label BO's from UM
> through a new IOCTL.
>=20
> The new debugfs file shows a list of driver DRM GEM objects in tabular mo=
de.
> To visualise it, cat sudo cat /sys/kernel/debug/dri/*.gpu/gems.
> To test this functionality from UM, please refer to this Mesa patch serie=
s:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34224
>=20
> Discussion of previous revision of this patch series can be found at:
> https://lore.kernel.org/dri-devel/20250418022710.74749-1-adrian.larumbe@c=
ollabora.com/
>=20
> Changelog:
> v10:
>  - Simplified printing of GEM state and usage flags: now they're printed =
numericaly,
>    and their meanings given in the DebugFS file prelude
>  - Some minor formating changes
>  - Fixed all checkpatch issues with --strict
>=20
> v9:
>  - Added padding field to uAPI BO label ioctl struct
>  - Simplified copying and bounds checking of label in ioctl function
>=20
> v8:
>  - Renamed NULL to NUL in comments describing NUL-terminated strings
>  - Removed 'size' parameter from labelling ioctl() as max length can be
>    handled by the kernel itself
>  - Made sure to use kfree_const() everywhere labels are freed
>  - Replaced maximum label size with numerical constant rather than page s=
ize
>  - Added some warnings and checks in kernel BO labelling function
>=20
> v7:
>  - Improved formating of DebugFS GEM's status and usage flags
>  - Deleted some spurious white spaces
>  - Renamed usage flags setting function
>=20
> v6:
>  - Replaced some mutex calls with scoped guards
>  - Documented data size limits in the label ioctl
>  - Simplified GEMS status flags treatment (Panthor doesn't use madvise)
>  - Fixed some array size and string bugs
>  - Improved the naming of GEM status and usage flags to reflect their mea=
ning
>  - Improved the formatting of the output table
>=20
> v5:
>  - Kept case and naming of kernel BO's consistent
>  - Increased the driver minor after new ioctl
>  - Now adds BO to debugfs GEMs list at GEM object creation time
>  - No longer try to hide BO creator's name when it's a workqueue or modpr=
obe
>  - Reworked the procedure for printing GEM state and kernel BO flags
>  - Turned kernel BO flags and GEM state flags into bit enums
>  - Wait until BO state is marked as initialied for debugfs display
>=20
> v4:
>  - Labelled all kernel BO's, not just heap chunks.
>  - Refactored DebugGFs GEMs list handling functions
>  - Added debugfs GEMS node mask to tell different kinds of BO's
>=20
>=20
> Adri=C3=A1n Larumbe (4):
>   drm/panthor: Introduce BO labeling
>   drm/panthor: Add driver IOCTL for setting BO labels
>   drm/panthor: Label all kernel BO's
>   drm/panthor: show device-wide list of DRM GEM objects over DebugFS

Queued to drm-misc-next.

Thanks,

Boris

>=20
>  drivers/gpu/drm/panthor/panthor_device.c |   5 +
>  drivers/gpu/drm/panthor/panthor_device.h |  11 ++
>  drivers/gpu/drm/panthor/panthor_drv.c    |  69 +++++++-
>  drivers/gpu/drm/panthor/panthor_fw.c     |   8 +-
>  drivers/gpu/drm/panthor/panthor_gem.c    | 207 ++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_gem.h    |  86 +++++++++-
>  drivers/gpu/drm/panthor/panthor_heap.c   |   6 +-
>  drivers/gpu/drm/panthor/panthor_sched.c  |   9 +-
>  include/uapi/drm/panthor_drm.h           |  23 +++
>  9 files changed, 413 insertions(+), 11 deletions(-)
>=20
> --
> 2.48.1

