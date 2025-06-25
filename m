Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F4A25D1F1;
	Wed, 25 Jun 2025 12:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750854994; cv=none; b=pUlDc+A3cGYVy9Gzn3c6RFsJmaJGTeMZyTLFmHlPCikn17n3ddM10S+lw9eL3UlfhDpkBxvj67naojFj6RvwgtUfjEe7rHPd+pMvO8SCn0q3F4oKrsUhqhN5Zc9HeXbrdxg1lgfpB62STaNJ22fmn/XEg6C4Z+/SkXkn9OCHAik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750854994; c=relaxed/simple;
	bh=e9CudshOQPC4nd+M+TnQLZ1u162DySaMmKeXbl8oGVs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hJzmvuqB/O6fijVq5DPihbGHe85lylXYU0+SnBd3ij9K7y7rffx2OLCNpPPlJLO4HWvtAOrwP6AhPisyZgRtN9jCg/LuajUDGYQjxO8WqaSL3YlbLlnZzk9BoGpmIPVuN2dvn7o1oLFkTPyNdciGx82Kl/5Thl9s2pOHPHhsmmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZgLWh/Kt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZgLWh/Kt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750854994; x=1782390994;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=e9CudshOQPC4nd+M+TnQLZ1u162DySaMmKeXbl8oGVs=;
  b=ZgLWh/KtUCBIXr9SwT0tROTs5Z+W8cZ0PPMyWoDvFBimiGzDkReaNkoA
   Q0iDoCFlKn+pDkcvWtZLvLTVi0PHyO8lFP7Kua3XbYVbdWWMGyudnS+2T
   2Jidjj14TXC33sjJkjq3I9jP95KNz4bYZvDEQ5CqU+K7qCsXQup96mfuN
   1Ni9woN+OLA8H49Yew9lQcNDmKszodZfZGl2FSPQxMKkSOFNjixhBwIPv
   BtXjDFrN1OSOnjfah264MnAtqfldZaRKF8HdqthypM79U4RebZlISz1SJ
   ly83yqIWtjaJeg+Ftnt1YfR19aXrqzBVitNU5S/j0gTobQbwFcSH8ZrRD
   Q==;
X-CSE-ConnectionGUID: Wl4otzUmSNGuWFJekEhQJA==
X-CSE-MsgGUID: xDDLJsEcTgiyVNDx26dZRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="75660933"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="75660933"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:36:33 -0700
X-CSE-ConnectionGUID: 3qYUeyW3Quu7rBwIOvV3Nw==
X-CSE-MsgGUID: ffGbyOsfQda3WI+0NqNGww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="152698653"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.13])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:36:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Jun 2025 15:36:25 +0300 (EEST)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Alok Tiwari <alok.a.tiwari@oracle.com>, 
    "hansg@kernel.org" <hansg@kernel.org>, 
    David Thompson <davthompson@nvidia.com>, 
    Michael Shych <michaelsh@nvidia.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] platform/mellanox: Fix spelling and comment clarity
 in Mellanox drivers
In-Reply-To: <PH7PR12MB66686B87D8572B5812A1402EAF78A@PH7PR12MB6668.namprd12.prod.outlook.com>
Message-ID: <96280bbc-c20d-430c-493b-35d883e4622d@linux.intel.com>
References: <20250622072921.4111552-1-alok.a.tiwari@oracle.com> <PH7PR12MB66686B87D8572B5812A1402EAF78A@PH7PR12MB6668.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Jun 2025, Vadim Pasternak wrote:
> > -----Original Message-----
> > From: Alok Tiwari <alok.a.tiwari@oracle.com>
> > Sent: Sunday, 22 June 2025 10:29
> > To: hansg@kernel.org; ilpo.jarvinen@linux.intel.com; David Thompson
> > <davthompson@nvidia.com>; Michael Shych <michaelsh@nvidia.com>;
> > Vadim Pasternak <vadimp@nvidia.com>; platform-driver-x86@vger.kernel.org
> > Cc: alok.a.tiwari@oracle.com; linux-kernel@vger.kernel.org
> > Subject: [PATCH 1/2] platform/mellanox: Fix spelling and comment clarity in
> > Mellanox drivers
> > 
> > This commit corrects several minor typographical errors in comments and
> > error messages across multiple Mellanox platform driver.
> > Fixed spelling of "thresholds", "region", "platform", "default", and removed
> > redundant spaces in comment strings and error logs.
> > 
> > These changes are cosmetic and do not affect runtime behavior.
> > 
> > Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> 
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>

Okay folks, this was easy to review but what about the second patch which 
does a real change to code (albeit only printing related)? Could somebody 
review that as well? :-)

-- 
 i.

> > ---
> >  drivers/platform/mellanox/mlxbf-tmfifo.c |  2 +-
> >  drivers/platform/mellanox/mlxreg-dpu.c   |  2 +-
> >  drivers/platform/mellanox/mlxreg-lc.c    | 10 +++++-----
> >  3 files changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c
> > b/drivers/platform/mellanox/mlxbf-tmfifo.c
> > index aae99adb29eb0..6264379d96907 100644
> > --- a/drivers/platform/mellanox/mlxbf-tmfifo.c
> > +++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
> > @@ -1287,7 +1287,7 @@ static void mlxbf_tmfifo_get_cfg_mac(u8 *mac)
> >  		ether_addr_copy(mac, mlxbf_tmfifo_net_default_mac);  }
> > 
> > -/* Set TmFifo thresolds which is used to trigger interrupts. */
> > +/* Set TmFifo thresholds which is used to trigger interrupts. */
> >  static void mlxbf_tmfifo_set_threshold(struct mlxbf_tmfifo *fifo)  {
> >  	u64 ctl;
> > diff --git a/drivers/platform/mellanox/mlxreg-dpu.c
> > b/drivers/platform/mellanox/mlxreg-dpu.c
> > index 52260106a9f16..39f89c47144a2 100644
> > --- a/drivers/platform/mellanox/mlxreg-dpu.c
> > +++ b/drivers/platform/mellanox/mlxreg-dpu.c
> > @@ -483,7 +483,7 @@ static int mlxreg_dpu_config_init(struct mlxreg_dpu
> > *mlxreg_dpu, void *regmap,
> >  							  mlxreg_dpu-
> > >io_data,
> >  							  sizeof(*mlxreg_dpu-
> > >io_data));
> >  		if (IS_ERR(mlxreg_dpu->io_regs)) {
> > -			dev_err(dev, "Failed to create regio for client %s at bus
> > %d at addr 0x%02x\n",
> > +			dev_err(dev, "Failed to create region for client %s at
> > bus %d at
> > +addr 0x%02x\n",
> >  				data->hpdev.brdinfo->type, data->hpdev.nr,
> >  				data->hpdev.brdinfo->addr);
> >  			return PTR_ERR(mlxreg_dpu->io_regs); diff --git
> > a/drivers/platform/mellanox/mlxreg-lc.c b/drivers/platform/mellanox/mlxreg-
> > lc.c
> > index aee395bb48ae4..8eef3d990d1ae 100644
> > --- a/drivers/platform/mellanox/mlxreg-lc.c
> > +++ b/drivers/platform/mellanox/mlxreg-lc.c
> > @@ -57,9 +57,9 @@ enum mlxreg_lc_state {
> >   * @dev: platform device;
> >   * @lock: line card lock;
> >   * @par_regmap: parent device regmap handle;
> > - * @data: pltaform core data;
> > + * @data: platform core data;
> >   * @io_data: register access platform data;
> > - * @led_data: LED platform data ;
> > + * @led_data: LED platform data;
> >   * @mux_data: MUX platform data;
> >   * @led: LED device;
> >   * @io_regs: register access device;
> > @@ -171,7 +171,7 @@ static int mlxreg_lc_chan[] = {
> >  	0x4e, 0x4f
> >  };
> > 
> > -/* Defaul mux configuration. */
> > +/* Default mux configuration. */
> >  static struct mlxcpld_mux_plat_data mlxreg_lc_mux_data[] = {
> >  	{
> >  		.chan_ids = mlxreg_lc_chan,
> > @@ -181,7 +181,7 @@ static struct mlxcpld_mux_plat_data
> > mlxreg_lc_mux_data[] = {
> >  	},
> >  };
> > 
> > -/* Defaul mux board info. */
> > +/* Default mux board info. */
> >  static struct i2c_board_info mlxreg_lc_mux_brdinfo = {
> >  	I2C_BOARD_INFO("i2c-mux-mlxcpld", 0x32),  }; @@ -758,7 +758,7
> > @@ mlxreg_lc_config_init(struct mlxreg_lc *mlxreg_lc, void *regmap,
> >  		platform_device_register_resndata(dev, "mlxreg-io", data-
> > >hpdev.nr, NULL, 0,
> >  						  mlxreg_lc->io_data,
> > sizeof(*mlxreg_lc->io_data));
> >  		if (IS_ERR(mlxreg_lc->io_regs)) {
> > -			dev_err(dev, "Failed to create regio for client %s at bus
> > %d at addr 0x%02x\n",
> > +			dev_err(dev, "Failed to create region for client %s at
> > bus %d at
> > +addr 0x%02x\n",
> >  				data->hpdev.brdinfo->type, data->hpdev.nr,
> >  				data->hpdev.brdinfo->addr);
> >  			err = PTR_ERR(mlxreg_lc->io_regs);
> > --
> > 2.46.0
> 
> 
