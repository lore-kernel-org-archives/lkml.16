Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D3024501D;
	Mon, 30 Jun 2025 10:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751277725; cv=none; b=WFQePYlQ8I860ODqDmpvAvlM1J03CjoJZ5c+2WmNdspfBClfFj+Z5Gf+dwCbUEX4KfP1GUlAHnLCZ4w3QfRb9gz6YJoX4FV1IfTRyMSKWYIf3llCPIMCuCKPHcvijo1uqEioXzpLxFMR8gk3MY0qR+aOzvBjc7PqOoGa5NPwfYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751277725; c=relaxed/simple;
	bh=bfjuw9gXAYyPF7VQZoSgZnNTMnWd678yVZRGAvIW96A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YDFG2o3ATczwyS0MVFLOQC0fC2/8G1tgkCUsspMZX3W8wiuh8GL1flH+tGcb4ItodGT7R1KefHf/3iYfxO4b+RHxDBDUGXhfHdl1CIJ4+1ShdJa6wnOG2rfg8GHdr3/+g2wexnd5CzLw4qlPh3X/PI1OFkk79KL7NbXmbXWfLg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nkLJPpGn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nkLJPpGn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751277724; x=1782813724;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=bfjuw9gXAYyPF7VQZoSgZnNTMnWd678yVZRGAvIW96A=;
  b=nkLJPpGnTGVAVbj3m4r2ydKLmg2RsJNNZhHHDawFU3vq3k7oh5b/cKyy
   12DKTkLp4ifcizpARpXuqLZ0VBRZY7fNH8SLs6gQtG4IUwI0rXjpdRrtY
   I5goyw3AO9t37D0+Eb4V/5knmd+IREE51ADgyt21Acg6e50uW7fO92QUw
   aORXwiWtVd9wA+8hbbG1JkT7JldJQxuqCTX13YjO+NQcLo++ZBO1wtn8P
   EyhOaLVFBT6ZBzeMRnF8W40gjHStVtO9kuKtNKZLS2IwWbPmMYuCYZERX
   nQ0K33KSQpowM/CoX3EOOyjyOPZ1V4rNzzsbS4UC6E1WC5mZO1TYUBmj+
   A==;
X-CSE-ConnectionGUID: oz5nxvp2R3KZC9IzvZ15TQ==
X-CSE-MsgGUID: MHPj5nVVRaug42t7VSxFEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="57277422"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="57277422"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:02:01 -0700
X-CSE-ConnectionGUID: gx+DFMCRQLifpuG30/l9/g==
X-CSE-MsgGUID: DVrlXRpKSkKD3jGYQ9DL7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="190587470"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:01:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 30 Jun 2025 13:01:54 +0300 (EEST)
To: Alok Tiwari <alok.a.tiwari@oracle.com>
cc: hansg@kernel.org, vadimp@nvidia.com, platform-driver-x86@vger.kernel.org, 
    darren.kenny@oracle.com, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/mellanox: Fix logic error in power state check
 in mlxreg-lc
In-Reply-To: <20250630095001.598061-1-alok.a.tiwari@oracle.com>
Message-ID: <8e86e409-0a19-ec74-f126-2e5315e3dc0a@linux.intel.com>
References: <20250630095001.598061-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Jun 2025, Alok Tiwari wrote:

> Fixes a logic issue in mlxreg_lc_completion_notify() where the
> intention was to check if MLXREG_LC_POWERED flag is not set before
> powering on the device.
> 
> The original code used "state & ~MLXREG_LC_POWERED" to check for the
> absence of the POWERED bit. However this condition evaluates to true
> even when other bits are set, leading to potentially incorrect
> behavior.
> 
> Corrected the logic to explicitly check for the absence of
> MLXREG_LC_POWERED using !(state & MLXREG_LC_POWERED).
> 
> Suggested-by: Vadim Pasternak <vadimp@nvidia.com>
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Makes sense but please add Fixes tag and resubmit as v2.

> ---
>  drivers/platform/mellanox/mlxreg-lc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/mellanox/mlxreg-lc.c b/drivers/platform/mellanox/mlxreg-lc.c
> index aee395bb48ae4..8681ceb7144ba 100644
> --- a/drivers/platform/mellanox/mlxreg-lc.c
> +++ b/drivers/platform/mellanox/mlxreg-lc.c
> @@ -688,7 +688,7 @@ static int mlxreg_lc_completion_notify(void *handle, struct i2c_adapter *parent,
>  	if (regval & mlxreg_lc->data->mask) {
>  		mlxreg_lc->state |= MLXREG_LC_SYNCED;
>  		mlxreg_lc_state_update_locked(mlxreg_lc, MLXREG_LC_SYNCED, 1);
> -		if (mlxreg_lc->state & ~MLXREG_LC_POWERED) {
> +		if (!(mlxreg_lc->state & MLXREG_LC_POWERED)) {
>  			err = mlxreg_lc_power_on_off(mlxreg_lc, 1);
>  			if (err)
>  				goto mlxreg_lc_regmap_power_on_off_fail;
> 

-- 
 i.

