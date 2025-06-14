Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0C478F2B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 06:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749882216; cv=none; b=T78hN1Ub6utxOUlYR6lO6bGDMAM9DLYd223WxTP8kfQWI6C/ZFvOOkQnXbjhqHHYMiK58HPYAyaQ5pDh84C1zTvNeatqR4FQSTLIbzTQJEpKCjODCf0PEzKd+T87Ug8jjOG2Yww9Ckd6pXnBq8ymu73ThAk88lcbCYA5V6n3Gqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749882216; c=relaxed/simple;
	bh=3rpU6la+xrJicpxEm3jMyvl5BgRvps0Bplpf9eNf1Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zh4EKXS5AfYvZKnLRxJwL6Z6b27ZKiQHx+g+3ESAWgCX0dWpJICLA57WMvPN51YG920Cx7P6lvyVMwaUFgBpEG+NWdvB0UJvCfr65ktTvv0mFB9Ati9nMxF/Qs+iM+IfKbFcArqqepdt0iEjxdQlkSMe0hBeEANwwDps8iAWy+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=icYdkj6P; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="icYdkj6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1749882205;
	bh=3rpU6la+xrJicpxEm3jMyvl5BgRvps0Bplpf9eNf1Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=icYdkj6PF6Oa4Jk/UmLBS9sXd8ZpKkL1M3mkdyP0G73SHFygX6HTvY5BANV8jddqB
	 j6PNZ6Gg0pvfL08o9nq/HaUePEdjqPQD0dZYQIothWvkfNXc1bLEqdWjYzH4tIC7JK
	 BDaznOCzIzjBX2OHD3x/53ZJFDPhA3IsvPm9c1ns=
Date: Sat, 14 Jun 2025 08:23:24 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] sysfs: finalize the constification of 'struct
 bin_attribute'
Message-ID: <fa9b1cb8-28a7-4ae0-89c8-8e3f9f149c56@t-8ch.de>
References: <20250530-sysfs-const-bin_attr-final-v3-0-724bfcf05b99@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530-sysfs-const-bin_attr-final-v3-0-724bfcf05b99@weissschuh.net>

Hi Greg,

friendly ping. You wanted to send this to Linux at around -rc1.
The changes should now apply cleanly to mainline.

On 2025-05-30 05:54:34+0200, Thomas Weißschuh wrote:
> All users have been migrated to the new const types.
> Change the types of the normal fields, switch all users over and then
> get rid of the transition machinery.
> 
> The treewide changes have been done with sed/grep.
> Based on top of next-20250528.
> Meant to be applied around the end of the merge window.
> As it is not clear what goes into the merge window this is done on
> linux-next. Applying it will probably create some trivially to resolve
> conflicts.
> 
> After applying, make sure no leftovers are left:
> $ git grep bin_attrs_new
> $ git grep read_new ':!drivers/block/swim_asm.S'
> $ git grep write_new ':!drivers/cpufreq/powernow-k8.c' ':!drivers/s390/char/monwriter.c'
> 
> I'm only sending this to the sysfs maintainers. The treewide changes are
> purely mechanical.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> Changes in v3:
> - Drop already applied patches
> - Constify internal references in fs/sysfs/file.c
> - Update const_structs.checkpatch
> - Rebase on linux-next/master
> - Link to v2: https://lore.kernel.org/r/20250313-sysfs-const-bin_attr-final-v2-0-96284e1e88ce@weissschuh.net
> 
> Changes in v2:
> - Rebase onto current driver-core-next.
> - Remove prerequisites list from cover letter.
> - Link to v1: https://lore.kernel.org/r/20250219-sysfs-const-bin_attr-final-v1-0-02828d86af3c@weissschuh.net
> 
> ---
> Thomas Weißschuh (6):
>       const_structs.checkpatch: add bin_attribute
>       sysfs: constify internal references to 'struct bin_attribute'
>       sysfs: treewide: switch back to bin_attribute::read()/write()
>       sysfs: treewide: switch back to attribute_group::bin_attrs
>       sysfs: remove bin_attribute::read_new/write_new()
>       sysfs: remove attribute_group::bin_attrs_new

<snip>
