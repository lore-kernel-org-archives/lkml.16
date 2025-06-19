Received: from ms-10.1blu.de (ms-10.1blu.de [178.254.4.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE95264FA0;
	Thu, 19 Jun 2025 08:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.254.4.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322037; cv=none; b=CuKQYqPRt8QAXn7vxMVYorMIvT3wKlct2cu3PBqiAVb75kgI4zzzxhNOdi4id+aFqATPyGVvha6Ir3Ry1bZJE9QeGhO+E3jDOvzxyzDVRkX4Ff6Pi5539AhsN57H2rCt/cZkVYxjG3ShSDXKlqJZFhrvIPkL6KIXIm33Md310Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322037; c=relaxed/simple;
	bh=TnutbrdDTFqTAJdAvKwHWum+J/G3rqx1TRNz/WW3H2Y=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wn99mo7P7ceOXtFHpDMfh/pd/aMprkRDkdbOr+W5l6zkNy9nJsAF0OAPCwagPuzM4qWawl9prEsfvyJiprRiTqsWgKoMPw9GtSLE9ruUpzc/2SqZVuwD/QK2ilIgV4VonD3sAG5mMxwdaGSKNb+VxFXGXjCb8jtRSh/XFTBrLTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mariuszachmann.de; spf=pass smtp.mailfrom=mariuszachmann.de; dkim=pass (2048-bit key) header.d=mariuszachmann.de header.i=@mariuszachmann.de header.b=WLJCOOYR; arc=none smtp.client-ip=178.254.4.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mariuszachmann.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mariuszachmann.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mariuszachmann.de header.i=@mariuszachmann.de header.b="WLJCOOYR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mariuszachmann.de; s=blu6948523; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=TnutbrdDTFqTAJdAvKwHWum+J/G3rqx1TRNz/WW3H2Y=; b=WLJCOOYRm7iSJRk9HXjqVCxXYR
	AaWHMtSh72s4laQkbikG+qgF3XFSWKogmwQdmayXzLWQ3rAvFRiJAMryAoHX9ZTIxYLwD4moAnDTa
	GqH8DnhjcSzIwUGK92y+x5lhsH6DD1b8u1S4JxM3pX6/6eSvwmBwWe2zh61J4+ZmEqkYJLcyjcbD+
	lLPmyjNc8drb59fiIWj7H6qSYCOrAdRUVUmh8rR7f7EthgjoGH/DRZwaYBQdxESYup2cU9SZQ8/yp
	h6PKBQri2i7hZdd2mPFp0aC3rNp1kh166NemSdmYpaL/F7CtVt2Fqj8DTp/vs89orm+bqE1OL1x6J
	1q2Sr+Pg==;
Received: from [2.211.115.98] (helo=[192.168.178.20])
	by ms-10.1blu.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mail@mariuszachmann.de>)
	id 1uSAD3-002afl-IQ;
	Thu, 19 Jun 2025 10:01:21 +0200
Message-ID: <fe5fe144dea8665f96b943e9abe58fc8be536d69.camel@mariuszachmann.de>
Subject: Re: [syzbot] [hwmon?] KMSAN: uninit-value in get_temp_cnct
From: Marius Zachmann <mail@mariuszachmann.de>
To: Guenter Roeck <linux@roeck-us.net>, syzbot	
 <syzbot+3bbbade4e1a7ab45ca3b@syzkaller.appspotmail.com>, jdelvare@suse.com,
 	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Date: Thu, 19 Jun 2025 10:01:21 +0200
In-Reply-To: <145b2916-830b-4654-84e6-3d5c356c6283@roeck-us.net>
References: <685392a0.050a0220.216029.0168.GAE@google.com>
	 <145b2916-830b-4654-84e6-3d5c356c6283@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Con-Id: 241080
X-Con-U: 0-mail

Am Mittwoch, dem 18.06.2025 um 22:56 -0700 schrieb Guenter Roeck:
> On 6/18/25 21:31, syzbot wrote:
> > Hello,
> >=20
> > syzbot found the following issue on:
> >=20
> > HEAD commit:=C2=A0=C2=A0=C2=A0 4774cfe3543a Merge tag 'scsi-fixes' of
> > git://git.kernel.or..
> > git tree:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 upstream
> > console output:
> > https://syzkaller.appspot.com/x/log.txt?x=3D10e3f10c580000
> > kernel config:=C2=A0
> > https://syzkaller.appspot.com/x/.config?x=3D61539536677af51c
> > dashboard link:
> > https://syzkaller.appspot.com/bug?extid=3D3bbbade4e1a7ab45ca3b
> > compiler:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Debian clang version 20.1=
.6
> > (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian
> > LLD 20.1.6
> > userspace arch: i386
> >=20
> > Unfortunately, I don't have any reproducer for this issue yet.
> >=20
>=20
> It doesn't need one: The problem will be seen if the data returned
> from the
> power supply is shorter than expected. In the example below, the
> problem will
> be seen if less than NUM_TEMP_SENSORS+1 data bytes were received.
> One possible fix would be to record the returned data length in
> ccp_raw_event()
> and to have each caller of send_usb_cmd() check if the returned
> amount of data
> is sufficient.
>=20
> Guenter

The device should always return the same number of bytes.
I could zero-initialize the buffer at allocation. Then there should
be no uninitialized values.
Also I could check the number of returned bytes in send_usb_cmd()
instead of having each caller checking it, and return -EIO if
it is not correct?

Marius

>=20
> > Downloadable assets:
> > disk image:
> > https://storage.googleapis.com/syzbot-assets/0cb38ba04f99/disk-4774cfe3=
.raw.xz
> > vmlinux:
> > https://storage.googleapis.com/syzbot-assets/ff376a7ba200/vmlinux-4774c=
fe3.xz
> > kernel image:
> > https://storage.googleapis.com/syzbot-assets/570051315dbf/bzImage-4774c=
fe3.xz
> >=20
> > IMPORTANT: if you fix the issue, please add the following tag to
> > the commit:
> > Reported-by: syzbot+3bbbade4e1a7ab45ca3b@syzkaller.appspotmail.com
> >=20
> > usb 7-1: New USB device strings: Mfr=3D0, Product=3D0, SerialNumber=3D0
> > usb 7-1: config 0 descriptor??
> > corsair-cpro 0003:1B1C:0C10.0017: hidraw0: USB HID v4.06 Device
> > [HID 1b1c:0c10] on usb-dummy_hcd.6-1/input0
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > BUG: KMSAN: uninit-value in get_temp_cnct+0x1f3/0x3b0
> > drivers/hwmon/corsair-cpro.c:497
> > =C2=A0 get_temp_cnct+0x1f3/0x3b0 drivers/hwmon/corsair-cpro.c:497
> > =C2=A0 ccp_probe+0x458/0x790 drivers/hwmon/corsair-cpro.c:622
> > =C2=A0 __hid_device_probe drivers/hid/hid-core.c:2724 [inline]
> > =C2=A0 hid_device_probe+0x539/0xab0 drivers/hid/hid-core.c:2761
> > =C2=A0 call_driver_probe drivers/base/dd.c:-1 [inline]
> > =C2=A0 really_probe+0x4d4/0xd90 drivers/base/dd.c:657
> > =C2=A0 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
> > =C2=A0 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
> > =C2=A0 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
> > =C2=A0 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
> > =C2=A0 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
> > =C2=A0 device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
> > =C2=A0 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
> > =C2=A0 device_add+0x12a9/0x1c10 drivers/base/core.c:3692
> > =C2=A0 hid_add_device+0x5ed/0x7b0 drivers/hid/hid-core.c:2907
> > =C2=A0 usbhid_probe+0x1fec/0x2660 drivers/hid/usbhid/hid-core.c:1435
> > =C2=A0 usb_probe_interface+0xd04/0x1310 drivers/usb/core/driver.c:396
> > =C2=A0 call_driver_probe drivers/base/dd.c:-1 [inline]
> > =C2=A0 really_probe+0x4d4/0xd90 drivers/base/dd.c:657
> > =C2=A0 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
> > =C2=A0 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
> > =C2=A0 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
> > =C2=A0 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
> > =C2=A0 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
> > =C2=A0 device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
> > =C2=A0 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
> > =C2=A0 device_add+0x12a9/0x1c10 drivers/base/core.c:3692
> > =C2=A0 usb_set_configuration+0x3493/0x3b70
> > drivers/usb/core/message.c:2210
> > =C2=A0 usb_generic_driver_probe+0xfc/0x290
> > drivers/usb/core/generic.c:250
> > =C2=A0 usb_probe_device+0x38a/0x690 drivers/usb/core/driver.c:291
> > =C2=A0 call_driver_probe drivers/base/dd.c:-1 [inline]
> > =C2=A0 really_probe+0x4d4/0xd90 drivers/base/dd.c:657
> > =C2=A0 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
> > =C2=A0 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
> > =C2=A0 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
> > =C2=A0 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
> > =C2=A0 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
> > =C2=A0 device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
> > =C2=A0 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
> > =C2=A0 device_add+0x12a9/0x1c10 drivers/base/core.c:3692
> > =C2=A0 usb_new_device+0x104b/0x20c0 drivers/usb/core/hub.c:2663
> > =C2=A0 hub_port_connect drivers/usb/core/hub.c:5535 [inline]
> > =C2=A0 hub_port_connect_change drivers/usb/core/hub.c:5675 [inline]
> > =C2=A0 port_event drivers/usb/core/hub.c:5835 [inline]
> > =C2=A0 hub_event+0x5588/0x7580 drivers/usb/core/hub.c:5917
> > =C2=A0 process_one_work kernel/workqueue.c:3238 [inline]
> > =C2=A0 process_scheduled_works+0xb91/0x1d80 kernel/workqueue.c:3321
> > =C2=A0 worker_thread+0xedf/0x1590 kernel/workqueue.c:3402
> > =C2=A0 kthread+0xd5c/0xf00 kernel/kthread.c:464
> > =C2=A0 ret_from_fork+0x1e0/0x310 arch/x86/kernel/process.c:148
> > =C2=A0 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> >=20
> > Uninit was stored to memory at:
> > =C2=A0 get_temp_cnct+0x1ec/0x3b0 drivers/hwmon/corsair-cpro.c:496
> > =C2=A0 ccp_probe+0x458/0x790 drivers/hwmon/corsair-cpro.c:622
> > =C2=A0 __hid_device_probe drivers/hid/hid-core.c:2724 [inline]
> > =C2=A0 hid_device_probe+0x539/0xab0 drivers/hid/hid-core.c:2761
> > =C2=A0 call_driver_probe drivers/base/dd.c:-1 [inline]
> > =C2=A0 really_probe+0x4d4/0xd90 drivers/base/dd.c:657
> > =C2=A0 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
> > =C2=A0 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
> > =C2=A0 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
> > =C2=A0 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
> > =C2=A0 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
> > =C2=A0 device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
> > =C2=A0 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
> > =C2=A0 device_add+0x12a9/0x1c10 drivers/base/core.c:3692
> > =C2=A0 hid_add_device+0x5ed/0x7b0 drivers/hid/hid-core.c:2907
> > =C2=A0 usbhid_probe+0x1fec/0x2660 drivers/hid/usbhid/hid-core.c:1435
> > =C2=A0 usb_probe_interface+0xd04/0x1310 drivers/usb/core/driver.c:396
> > =C2=A0 call_driver_probe drivers/base/dd.c:-1 [inline]
> > =C2=A0 really_probe+0x4d4/0xd90 drivers/base/dd.c:657
> > =C2=A0 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
> > =C2=A0 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
> > =C2=A0 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
> > =C2=A0 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
> > =C2=A0 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
> > =C2=A0 device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
> > =C2=A0 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
> > =C2=A0 device_add+0x12a9/0x1c10 drivers/base/core.c:3692
> > =C2=A0 usb_set_configuration+0x3493/0x3b70
> > drivers/usb/core/message.c:2210
> > =C2=A0 usb_generic_driver_probe+0xfc/0x290
> > drivers/usb/core/generic.c:250
> > =C2=A0 usb_probe_device+0x38a/0x690 drivers/usb/core/driver.c:291
> > =C2=A0 call_driver_probe drivers/base/dd.c:-1 [inline]
> > =C2=A0 really_probe+0x4d4/0xd90 drivers/base/dd.c:657
> > =C2=A0 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
> > =C2=A0 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
> > =C2=A0 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
> > =C2=A0 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
> > =C2=A0 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
> > =C2=A0 device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
> > =C2=A0 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
> > =C2=A0 device_add+0x12a9/0x1c10 drivers/base/core.c:3692
> > =C2=A0 usb_new_device+0x104b/0x20c0 drivers/usb/core/hub.c:2663
> > =C2=A0 hub_port_connect drivers/usb/core/hub.c:5535 [inline]
> > =C2=A0 hub_port_connect_change drivers/usb/core/hub.c:5675 [inline]
> > =C2=A0 port_event drivers/usb/core/hub.c:5835 [inline]
> > =C2=A0 hub_event+0x5588/0x7580 drivers/usb/core/hub.c:5917
> > =C2=A0 process_one_work kernel/workqueue.c:3238 [inline]
> > =C2=A0 process_scheduled_works+0xb91/0x1d80 kernel/workqueue.c:3321
> > =C2=A0 worker_thread+0xedf/0x1590 kernel/workqueue.c:3402
> > =C2=A0 kthread+0xd5c/0xf00 kernel/kthread.c:464
> > =C2=A0 ret_from_fork+0x1e0/0x310 arch/x86/kernel/process.c:148
> > =C2=A0 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> >=20
> > Uninit was created at:
> > =C2=A0 slab_post_alloc_hook mm/slub.c:4154 [inline]
> > =C2=A0 slab_alloc_node mm/slub.c:4197 [inline]
> > =C2=A0 __do_kmalloc_node mm/slub.c:4327 [inline]
> > =C2=A0 __kmalloc_node_track_caller_noprof+0x96d/0x12f0 mm/slub.c:4347
> > =C2=A0 alloc_dr drivers/base/devres.c:119 [inline]
> > =C2=A0 devm_kmalloc+0xd7/0x2f0 drivers/base/devres.c:864
> > =C2=A0 ccp_probe+0x114/0x790 drivers/hwmon/corsair-cpro.c:596
> > =C2=A0 __hid_device_probe drivers/hid/hid-core.c:2724 [inline]
> > =C2=A0 hid_device_probe+0x539/0xab0 drivers/hid/hid-core.c:2761
> > =C2=A0 call_driver_probe drivers/base/dd.c:-1 [inline]
> > =C2=A0 really_probe+0x4d4/0xd90 drivers/base/dd.c:657
> > =C2=A0 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
> > =C2=A0 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
> > =C2=A0 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
> > =C2=A0 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
> > =C2=A0 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
> > =C2=A0 device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
> > =C2=A0 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
> > =C2=A0 device_add+0x12a9/0x1c10 drivers/base/core.c:3692
> > =C2=A0 hid_add_device+0x5ed/0x7b0 drivers/hid/hid-core.c:2907
> > =C2=A0 usbhid_probe+0x1fec/0x2660 drivers/hid/usbhid/hid-core.c:1435
> > =C2=A0 usb_probe_interface+0xd04/0x1310 drivers/usb/core/driver.c:396
> > =C2=A0 call_driver_probe drivers/base/dd.c:-1 [inline]
> > =C2=A0 really_probe+0x4d4/0xd90 drivers/base/dd.c:657
> > =C2=A0 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
> > =C2=A0 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
> > =C2=A0 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
> > =C2=A0 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
> > =C2=A0 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
> > =C2=A0 device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
> > =C2=A0 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
> > =C2=A0 device_add+0x12a9/0x1c10 drivers/base/core.c:3692
> > =C2=A0 usb_set_configuration+0x3493/0x3b70
> > drivers/usb/core/message.c:2210
> > =C2=A0 usb_generic_driver_probe+0xfc/0x290
> > drivers/usb/core/generic.c:250
> > =C2=A0 usb_probe_device+0x38a/0x690 drivers/usb/core/driver.c:291
> > =C2=A0 call_driver_probe drivers/base/dd.c:-1 [inline]
> > =C2=A0 really_probe+0x4d4/0xd90 drivers/base/dd.c:657
> > =C2=A0 __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
> > =C2=A0 driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
> > =C2=A0 __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
> > =C2=A0 bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
> > =C2=A0 __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
> > =C2=A0 device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
> > =C2=A0 bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
> > =C2=A0 device_add+0x12a9/0x1c10 drivers/base/core.c:3692
> > =C2=A0 usb_new_device+0x104b/0x20c0 drivers/usb/core/hub.c:2663
> > =C2=A0 hub_port_connect drivers/usb/core/hub.c:5535 [inline]
> > =C2=A0 hub_port_connect_change drivers/usb/core/hub.c:5675 [inline]
> > =C2=A0 port_event drivers/usb/core/hub.c:5835 [inline]
> > =C2=A0 hub_event+0x5588/0x7580 drivers/usb/core/hub.c:5917
> > =C2=A0 process_one_work kernel/workqueue.c:3238 [inline]
> > =C2=A0 process_scheduled_works+0xb91/0x1d80 kernel/workqueue.c:3321
> > =C2=A0 worker_thread+0xedf/0x1590 kernel/workqueue.c:3402
> > =C2=A0 kthread+0xd5c/0xf00 kernel/kthread.c:464
> > =C2=A0 ret_from_fork+0x1e0/0x310 arch/x86/kernel/process.c:148
> > =C2=A0 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> >=20
> > CPU: 0 UID: 0 PID: 5855 Comm: kworker/0:3 Not tainted 6.16.0-rc1-
> > syzkaller-00203-g4774cfe3543a #0 PREEMPT(undef)
> > Hardware name: Google Google Compute Engine/Google Compute Engine,
> > BIOS Google 05/07/2025
> > Workqueue: usb_hub_wq hub_event
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >=20
> >=20
> > ---
> > This report is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ=C2=A0for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> >=20
> > syzbot will keep track of this issue. See:
> > https://goo.gl/tpsmEJ#status=C2=A0for how to communicate with syzbot.
> >=20
> > If the report is already addressed, let syzbot know by replying
> > with:
> > #syz fix: exact-commit-title
> >=20
> > If you want to overwrite report's subsystems, reply with:
> > #syz set subsystems: new-subsystem
> > (See the list of subsystem names on the web dashboard)
> >=20
> > If the report is a duplicate of another one, reply with:
> > #syz dup: exact-subject-of-another-report
> >=20
> > If you want to undo deduplication, reply with:
> > #syz undup
