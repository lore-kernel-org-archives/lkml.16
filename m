Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A777E221FD1
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 11:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746618131; cv=none; b=rQzQkC8xJDgc2T7zeN8V/75tpb7ezkSP2CQgPwX+ypP6EuC2JOfgvL2jlSAWaQU6Aq5f5eWhvIo3eW6CrDBAUEcicInV9a0qCG39HGaxz/3Iw4OT31PrG1ivIlUkSOsU0bGtoHarE32IOTeYa3BiIoyg6m8OxLAsGsyyLRodRsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746618131; c=relaxed/simple;
	bh=scmx9/CI8fIhmSsNVMG2OPZtZKYUEzWBeTPDd1j0hZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SeqqbXXP5Z9c9OcaNunE8utlZ87ZWIEQEta4TncH0Pyf7N+uXtGthBHvyQKSoA8PVpbQVaf1UEIZ2MK1npSL+rxEPjtbVwPm8lakppAwCRUbsdieuXgQUfd0lwojdiseS4wDZRXXzH6XPRQaI5Uw5X0UN3/r+/nidnGeQ1SwzIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MeB6AhQZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MeB6AhQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746618129; x=1778154129;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=scmx9/CI8fIhmSsNVMG2OPZtZKYUEzWBeTPDd1j0hZ4=;
  b=MeB6AhQZSrwpi6NIfV9MVQUPPF/BBsMco0oZkF4QYzu/fK88iHB9NUZs
   fOQB5fWEPV2QAUS6TaSMNXe8d5Ee3iI5jA6IrOyqVUCqYRgAkvv0bjiG0
   wOKfzrBRlkbprbjBaEFicZjzAQoKw1uoO07jTgdE8hlCeF3moZ847qWq+
   ebNAS8DkG2+SIoikgllBIWveoIb+S9Ucm+VO64jDJTjAfq2tbCt4cH7PP
   1IXlLpnaBLczrPpjtFZE1Xl2alSJyYZIBYtSl6fypR/I8pJv+SVS+irYc
   njXT7/KLVql//xWoiiTwF7+nnJufVAtlK8YMk3Un5zi/HM7yoW/qrN314
   A==;
X-CSE-ConnectionGUID: s4S8m6agSUqO0HPUCy/ClQ==
X-CSE-MsgGUID: f34pU5G0TXGOuPCcU6BEWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="58538576"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="58538576"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 04:42:09 -0700
X-CSE-ConnectionGUID: q9XSds6TQn63GLtMSGR/qA==
X-CSE-MsgGUID: AhP43ObISL6IHyWluqbCkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136447207"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.193])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 04:42:07 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B17C111F871;
	Wed,  7 May 2025 14:42:04 +0300 (EEST)
Date: Wed, 7 May 2025 11:42:04 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Wentong Wu <wentong.wu@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mei: vsc: Cast tx_buf to (__be32 *) when passed to
 cpu_to_be32_array()
Message-ID: <aBtHDKB6FbIkBS_J@kekkonen.localdomain>
References: <20250507090728.115910-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507090728.115910-1-hdegoede@redhat.com>

Hi Hans,

On Wed, May 07, 2025 at 11:07:28AM +0200, Hans de Goede wrote:
> Commit f88c0c72ffb0 ("mei: vsc: Use struct vsc_tp_packet as vsc-tp tx_buf
> and rx_buf type") changed the type of tx_buf from "void *" to "struct
> vsc_tp_packet *" and added a cast to (u32 *) when passing it to
> cpu_to_be32_array() and the same change was made for rx_buf.
> 
> This triggers the type-check warning in sparse:
> 
> vsc-tp.c:327:28: sparse: expected restricted __be32 [usertype] *dst
> vsc-tp.c:327:28: sparse: got unsigned int [usertype] *
> 
> vsc-tp.c:343:42: sparse: expected restricted __be32 const [usertype] *src
> vsc-tp.c:343:42: sparse: got unsigned int [usertype] *
> 
> Fix this by casting to (__be32 *) instead.
> 
> Note actually changing the type of the buffers to "be32 *" is not an option
> this buffer does actually contain a "struct vsc_tp_packet" and is used
> as such most of the time. vsc_tp_rom_xfer() re-uses the buffers as just
> dumb arrays of 32 bit words to talk to the device before the firmware has
> booted, to avoid needing to allocate a separate buffer.
> 
> Fixes: f88c0c72ffb0 ("mei: vsc: Use struct vsc_tp_packet as vsc-tp tx_buf and rx_buf type")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505071634.kZ0I7Va6-lkp@intel.com/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Thanks!

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> ---
>  drivers/misc/mei/vsc-tp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/mei/vsc-tp.c b/drivers/misc/mei/vsc-tp.c
> index da26a080916c..267d0de5fade 100644
> --- a/drivers/misc/mei/vsc-tp.c
> +++ b/drivers/misc/mei/vsc-tp.c
> @@ -324,7 +324,7 @@ int vsc_tp_rom_xfer(struct vsc_tp *tp, const void *obuf, void *ibuf, size_t len)
>  	guard(mutex)(&tp->mutex);
>  
>  	/* rom xfer is big endian */
> -	cpu_to_be32_array((u32 *)tp->tx_buf, obuf, words);
> +	cpu_to_be32_array((__be32 *)tp->tx_buf, obuf, words);
>  
>  	ret = read_poll_timeout(gpiod_get_value_cansleep, ret,
>  				!ret, VSC_TP_ROM_XFER_POLL_DELAY_US,
> @@ -340,7 +340,7 @@ int vsc_tp_rom_xfer(struct vsc_tp *tp, const void *obuf, void *ibuf, size_t len)
>  		return ret;
>  
>  	if (ibuf)
> -		be32_to_cpu_array(ibuf, (u32 *)tp->rx_buf, words);
> +		be32_to_cpu_array(ibuf, (__be32 *)tp->rx_buf, words);
>  
>  	return ret;
>  }

-- 
Regards,

Sakari Ailus
