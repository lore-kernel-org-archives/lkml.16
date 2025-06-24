Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBBF2EBDCF;
	Tue, 24 Jun 2025 15:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777719; cv=none; b=P13YolriFdae853WsHd4jNFtaxPkEb/EqYnCoslZRBsMdC+uis7+RRi+W+gvK8Vz0wDKTA3hY6ew6KPruOTJWprORXaWyvNmFxboe0aGGI0/DynmSTjRTiMnAZmac21ETz1oVqQQS02MDruThrLdmbKHIuSXPvJLcFG2aI7RiqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777719; c=relaxed/simple;
	bh=NuFaFx/Jlrn7Uzv/YpfDCKRC95PSFqVCthK20kI/oQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GqAKfn3Bd1nmnpGdoMGjxVkq02F/Jd3GouM2QvQlKBEZv67D+0ExLD+gSEyQTVqHaWQQfmE4joDoZevx0ffeT1ZQiMU9LcIk7NTPfUR/AlDvQG1AvywOIJ6ATUmIC+YYUDt7Rnf5r/3gJHFHHmHXiTo2ekRZSlQAx0I8TxOrakc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cP2gGrpE; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cP2gGrpE"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so1170668a12.2;
        Tue, 24 Jun 2025 08:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750777715; x=1751382515; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NPe580k9SnUeLtOTdaxzcN6ec7qD36w8YTL5HYQln/Q=;
        b=cP2gGrpEk7CZLdQyXf3b25wyjbvblbEPkJokzOByA8+AFo0IMRcwmaeiSGIZIf6Lek
         z/ZACo0PNJCTpfbThiHNOSUp3OvRrLrCB8meXvNJQI+oGktuBDdeIRFXYy6u2FNqNpRJ
         n98XsKdxQiK0O/bnaBbieR8ifKsfJ0voeOTvlR7gUJc1B1yr2/knm0FtK47UeV5RSbBD
         VEYN0IKqhaDKSvyqdcClyN6JgX00e8KEtAgCqDujAlPS1dATi5k4DVdgem9Tu3L1ulDS
         vKdJZxFpuxPF/VEQzoxBWlqU4hTI90ZLXY2MPYuR8SsqhZ9dIot7/znizsNJbgD59d0F
         dzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750777715; x=1751382515;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NPe580k9SnUeLtOTdaxzcN6ec7qD36w8YTL5HYQln/Q=;
        b=N80Agk4bkOZ3so8KiUXdJ+vO2j6M48JaP4P4gZkgFYdSvVBaRe2oYhfu5EI8kxK4eI
         SsCEfpeTseWSaA1VmXF3ZdIjs7NgMV/z8BD1Sfb6h1NC2S46r4qoix7Okvq/lsee66If
         Le6P+/vS61+R1onDFyGqhFq4eD/t3th+RNFJOaMLZmFh5lVfW/kxt2s5nYs6hbezSJ+T
         RbKJX9YVc41t3ZVMPnQ7uVGGeL4Z3mqxbBUN/39U7j2HsFIs5BkR1/gtABoD83KmF3BG
         DsYS62B0Jc8uu7v7xbh9pHfuslS1NG2KZrv1v9ciRPPIH3Bkn19ZCLDLeAUJYBD8UCnc
         dpVw==
X-Forwarded-Encrypted: i=1; AJvYcCW4OSnujYxEJe1meEzqoeALMx92tYhPw5B1fPUz9RBL4TGsJ99Gsu3Llkb1q2TIfZFoGu99IIzaD1nv@vger.kernel.org, AJvYcCWBaOQ5qSFHAPHbxzO2N/AVhRh4f7C/kM459q3CHXS219hM9Fzt7C72B8IPvuGa/f2T2KOd9SqZKsKnEOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlkW38pIz5SQp8DneTa1PziYJeXQHKydiXSbRD5w3A3wsI8Qxk
	hEeVriCTJUG14tAZOJv1CmVaQNp2NXsnbZXpttu2SJkUPN/OZlljzlzp
X-Gm-Gg: ASbGncsBVjiqQ3uBGEACyMFXeDlGnXP81nGIV7pdAYaELyAQTtHhqBaybZZcNFF+fT2
	GXpUBrUBL/5nFcci1HTRDdTqIghlJPkKYHr+ZahcKH8W064lsey5dt0kbfQYJI2emJTeK1d5+Zp
	mNTp2PHGA62iOey9BlpFLkooH4D7VHFrayDFtLuyKADfAUy7m+VVVgK3DKd+OT73PoiA6AFfFJk
	odH4ZlKgkEBAV6ngpHU2QZv/oQU7GoFruY3k9GaeUjAv1IIKsEKuW5UMrR1eKl7TJGFsbNlRxTy
	CnPfvxpybWHWr0KHWJDVvM5SxPrPTTefPiXTXhgTyS2F9nuBE+4AwyjYk+B1QZumVYrGWb04qka
	/z6HVjti+38ob7N9C65DWtclJULHH18g8NPwlBVabYi/YUh+r2M8PyxNc7xKePw==
X-Google-Smtp-Source: AGHT+IHy5CQXuAwnEZr15uqPSOadrd6iZ0m9VPaArcL1biwJzP259ImtZVizKwEUiRu8h5CVftquWA==
X-Received: by 2002:a05:6402:2548:b0:608:f493:871e with SMTP id 4fb4d7f45d1cf-60a1ccb522fmr15773402a12.14.1750777714903;
        Tue, 24 Jun 2025 08:08:34 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f1ae73dsm1148911a12.26.2025.06.24.08.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 08:08:34 -0700 (PDT)
Date: Tue, 24 Jun 2025 17:08:32 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Roger Quadros <rogerq@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Chance Yang <chance.yang@kneron.us>, Prashanth K <prashanth.k@oss.qualcomm.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: dwc3-am62/usb-conn-gpio: USB gadget not added when booting in host
 mode
Message-ID: <taw2mvbj6a2lqwy5h3tuqeifqy2w4gt4pzh4uahxuw27yw64q2@koxg54wgp2a2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

On the TI AM62 when using a USB OTG port, I found some unexpected
behaviour when booting with this port in host mode.

This happens, for example, when booting with a USB pen drive inserted.
When the pen drive is later removed, the OTG port correctly switches
to "device" mode instead of "host" mode, but the related USB gadget
does not come up (in my case, a CDC NCM configuration).

This issue only occurs when CONFIG_USB_CONN_GPIO and
CONFIG_USB_DWC3_AM62 are set to m and not when these modules are
built-in.

I tried to find the differences in their setup using ftrace and printk.

When they are built-in, I can see that the USB connector module
(usb-conn-gpio) is always probed (usb_conn_probe()) after dwc3-am62.

When built as modules, usb_conn_probe can happen before the probe of
dwc3-am62 is finished. This is problematic since the USB Role Switch
device needs to be registered first by DWC3. Namely, `dwc3_drd_init()`
calls `usb_role_switch_register()`, and `usb_conn_probe()` gets it with
`usb_role_switch_get()`. When `usb_conn_probe()` cannot get the role
switch device, it defers its probe until it can. This logic seems to
be working well, so the only difference here seems to be probe order.

In both cases:
 * The (last) usb_conn_probe gets the correct usb role switch.
 * The dual role mode is the same, and switches as expected

When the pen drive is unplugged, the USB OTG port correctly switches
to device mode for both cases. `dwc3_gadget_init()` is then called, but
when built as modules, strange things seem to happen once this method
hits `usb_add_gadget()`. Ftrace shows that it is executed, and executes
its body and returns, but my printk's after this point don't end up in
the kernel log anymore.

Ftrace snippet in working (builtin) case:
[...]
     kworker/1:2-52      [001] .....    80.070233: dwc3_gadget_init <-__dwc3_set_mode
     kworker/1:2-52      [001] .....    80.073332: usb_initialize_gadget <-dwc3_gadget_init
[...]
     kworker/1:2-52      [001] .....    80.855694: dwc3_debugfs_create_endpoint_dir <-dwc3_gadget_init
     kworker/1:2-52      [001] .....    80.875767: usb_add_gadget <-dwc3_gadget_init
     kworker/1:2-52      [001] .....    80.896299: usb_udc_uevent <-dev_uevent
   systemd-udevd-132     [000] .....    80.898973: usb_udc_uevent <-dev_uevent
   (udev-worker)-469     [000] .....    80.899839: usb_udc_uevent <-dev_uevent
     kworker/1:3-53      [001] .....    80.900302: usb_gadget_state_work <-process_one_work
   gadget-import-512     [000] .....    80.963264: gadgets_make <-configfs_mkdir
[...]

Ftrace snippet in nonworking (modules) case:
[...]
     kworker/0:4-60      [000] .....   104.112791: dwc3_gadget_init <-__dwc3_set_mode
     kworker/0:4-60      [000] .....   104.115912: usb_initialize_gadget <-dwc3_gadget_init
[...]
     kworker/0:4-60      [000] .....   104.918814: usb_add_gadget <-dwc3_gadget_init
     kworker/0:4-60      [000] .....   104.939290: usb_udc_uevent <-dev_uevent
   systemd-udevd-127     [000] .....   104.943682: usb_udc_uevent <-dev_uevent
     kworker/0:0-9       [000] .....   104.944201: usb_gadget_state_work <-process_one_work
   (udev-worker)-417     [001] .....   104.944411: usb_udc_uevent <-dev_uevent
[end of ]

When built as modules, gadgets_make() is never called, and the resulting
chain of gadget events thus does not happen.

My printk logging after unplugging the pen drive shows the following:

Builtin:
usb_conn_isr
usb_conn_queue_dwork
usb_conn_detect_cable
usb_role_string
usb_role_string
usb_conn_detect_cable role host -> device, gpios: id 1, vbus 1
usb_role_switch_set_role
usb_role_switch_get_drvdata
dwc3_usb_role_switch_set, role: 2
usb_role_switch_uevent
__dwc3_set_mode: dwc->current_dr_role: 1
__dwc3_set_mode: desired_dr_role: 2
usb_role_switch_uevent
usb_role_switch_uevent
dwc3_gadget_init
dwc3_gadget_init: usb_initialize_gadget
dwc3_gadget_init: dwc3_gadget_init_endpoints
dwc3_gadget_init: usb_add_gadget
dwc3_gadget_check_config
dwc3_gadget_start
__dwc3_gadget_start
dwc3_gadget_start_config, resource_index: 0
dwc3_send_gadget_ep_cmd, dep: ep0out, cmd: 9, params: 0000000013236000
__dwc3_gadget_ep_enable, dep: ep0out, action: 0
dwc3_gadget_set_ep_config, dep: ep0out, action: 0
dwc3_send_gadget_ep_cmd, dep: ep0out, cmd: 1, params: 0000000013236000
dwc3_send_gadget_ep_cmd, dep: ep0out, cmd: 2, params: 0000000013236000
__dwc3_gadget_ep_enable, dep: ep0in, action: 0
dwc3_gadget_set_ep_config, dep: ep0in, action: 0
dwc3_send_gadget_ep_cmd, dep: ep0in, cmd: 1, params: 0000000013236000
dwc3_send_gadget_ep_cmd, dep: ep0in, cmd: 2, params: 0000000013236000
dwc3_send_gadget_ep_cmd, dep: ep0out, cmd: 6, params: 00000000c3883fbf
dwc3_gadget_run_stop: start

Modules:
usb_conn_isr
usb_conn_queue_dwork
usb_conn_detect_cable
usb_role_string
usb_role_string
usb_conn_detect_cable role host -> device, gpios: id 1, vbus 1
usb_role_switch_set_role
usb_role_switch_get_drvdata
dwc3_usb_role_switch_set, role: 2
usb_role_switch_uevent
__dwc3_set_mode: dwc->current_dr_role: 1
usb_role_switch_uevent
__dwc3_set_mode: desired_dr_role: 2
usb_role_switch_uevent
dwc3_gadget_init
dwc3_gadget_init: usb_initialize_gadget
dwc3_gadget_init: dwc3_gadget_init_endpoints


Logs before the unplug are identical to each other except for the
usb_conn_probe that can happen earlier in the boot and potentially get
deferred.

I will be investigating this further, any input is more than welcome.

Thanks,
Ernest
