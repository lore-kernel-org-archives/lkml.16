Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27BB26C381
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745405544; cv=none; b=SjjIvOBlsTMIAosZn5GjzpPF9nJQ3J2c2gDgdCuFem+lxSrfBoZ9r9ApuvsC9GxO4Tvjs2HY7FL2d8/sy0bP+KpRseLpSNhh/lUYZ5NrApOdfS8EGcRbQYw8Q3qd0RKqsFqYFA/lwFEO60bgLsDFzVWg/LZNkLz46D2hYmCBSoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745405544; c=relaxed/simple;
	bh=U3wzNp/NwHoqYYZjs0ZiVLFiY3SDynRcynk9vCv22hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gS5kIZr5lkXZQkBn3WRzukxkeZr3dhyinXU8ZC7P1Vj8senpbKmq0MqUpcwU4O9QHrHLrBThFljxd/Fo8fCyg1+lEo9qTDkAepgtO5bluX17s6MeZ6+7n5LNVR/hcVH9cK0kF4BECHpDNikO34LZ3s0S1ofVv25k/Fo2XpI/8Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=VvJat+yN; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="VvJat+yN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=J5kO8HOcTIEVYwvohRyo6zyhFztvJgpIS0+e5/7HALg=; b=VvJat+yNygjhbneEzwboF6I8hh
	bFTLP43ULTlE6/FTi+JXvWGVjk2DoAVxQbqCoReoAqSFhM7f3arueKj+42VtB5Umg6pOG00Fhs4gD
	2e7EFwVjF7c3CKqMdwMKeP0BcxYBPuYSvvF6Zk7EZrGBWBvTCrWJFOAOv5T77DWJHz6vqGAtPfHLM
	nVdozT3kTu8UrWwauMaKJVb3jtF01sNAcqbQ+zQ/YrBYYVyFJaGiLzLGZQzq8ATDms+nJ0qzOmoD9
	WeQt2beE0vYp1S2hoheFgJuVZ5Bs4ftCQpANOProNLVvlUhLYfe4Uvpd81uu+NQWzjLq1o8BiOUpu
	lSI0TU+A==;
Received: from [189.7.87.174] (helo=[192.168.0.224])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u7Xhu-006sMM-Db; Wed, 23 Apr 2025 12:51:58 +0200
Message-ID: <a6c2baa7-521f-4c9f-b6f8-ff18e35dd941@igalia.com>
Date: Wed, 23 Apr 2025 07:51:50 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/1] drm/mipi-dbi: Use drm_device for debugfs, drop
 drm_minor
To: Jagath Jog J <jagathjog1996@gmail.com>, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250421085907.24972-1-jagathjog1996@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250421085907.24972-1-jagathjog1996@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jagath,

On 21/04/25 05:59, Jagath Jog J wrote:
> This patch updates the MIPI DBI driver to use drm_device.debugfs_root
> instead of drm_minor for creating debugfs files. The debugfs setup is now
> done earlier in probe(), before drm_dev_register(), and the drivers can
> avoid using the .debugfs_init callback.
> 
> This is an initial version, and only a few drivers are updated for now.
> 
> I noticed that some newer drivers or patches still use
> drm_debugfs_create_files(), which relies on drm_minor. I was wondering if
> there is a specific reason for this, or if there's a plan to switch to
> drm_debugfs_add_files? I can send patches to update more drivers if
> that helps.

Yes, there was a plan to switch to drm_debugfs_add_files(), as it
centers the debugfs files management on the drm_device instead of
drm_minor.

But, in the end, we concluded that we needed a few more changes in the
infrastructure to make things more generic. Here are some discussions
[1][2] and this was my plan to make things more generic [3], which
needed some improvements.

It would be create if you help us to cleanup debugfs and feel free to
use my patches as a base for it.

[1] 
https://lore.kernel.org/dri-devel/20230209081838.45273-1-christian.koenig@amd.com/
[2] https://lore.kernel.org/dri-devel/87eds0gm9b.fsf@intel.com/
[3] 
https://lore.kernel.org/dri-devel/20230131195825.677487-1-mcanal@igalia.com/

Best Regards,
- Maíra

> 
> This patch helps move toward the debugfs cleanup task listed here:
> https://docs.kernel.org/gpu/todo.html#clean-up-the-debugfs-support
> 
> Looking forward to your feedback.
> 
> Jagath Jog J (1):
>    drm/mipi-dbi: Use drm_device for debugfs, drop drm_minor and
>      .debugfs_init
> 
>   drivers/gpu/drm/drm_mipi_dbi.c        | 8 ++++----
>   drivers/gpu/drm/tiny/ili9163.c        | 3 ++-
>   drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 ++-
>   include/drm/drm_mipi_dbi.h            | 4 ++--
>   4 files changed, 10 insertions(+), 8 deletions(-)
> 

