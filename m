Received: from mail.actia.se (mail.actia.se [212.181.117.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4439C25C6EE;
	Mon,  9 Jun 2025 14:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.181.117.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749478656; cv=none; b=G5S+0i96Klq0JvL9cL2iKhzjeBS93gTWtilL+67rH9/wbYACBhdMFNYLm/FfNW8dqjn4AASWng5V3DL1g5kI2vjzHyulxBCjUy2TuDgB7EiX2ekc/7yW6iPx/zXaq9gHuML9gai4uToDF/KV5zWsgl6hdlW9K1C+U6M492oHPW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749478656; c=relaxed/simple;
	bh=spCiITol/T3YPIXtPcLRoLDm7XQ4E9EShIs4M4QO0nU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GqebeSufWKYdlvoQMOjLsIthxUTf0VfHx0L7DrUEJRCrhQPEPVWtR1EuM9L9CMp7LdReUB7q4MF1kwHdMLPPvJuIjb9O8i9EwDYeH2wtd/uN+oufzuc1Fj3s5yAvudxJiJBfnzzTRAsRCk9H7PdMcS4npf5hjJLhZgIMO1gAwnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=actia.se; spf=pass smtp.mailfrom=actia.se; arc=none smtp.client-ip=212.181.117.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=actia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=actia.se
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 16:17:30 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Mon, 9 Jun 2025 16:17:30 +0200
From: John Ernberg <john.ernberg@actia.se>
To: Xu Yang <xu.yang_2@nxp.com>
CC: Shawn Guo <shawnguo2@yeah.net>, Peter Chen <peter.chen@kernel.org>, "Shawn
 Guo" <shawnguo@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Thread-Topic: i.MX kernel hangup caused by chipidea USB gadget driver
Thread-Index: AQHb2Uk8r5zPXewyY0SsDNZZa8wLoQ==
Date: Mon, 9 Jun 2025 14:17:30 +0000
Message-ID: <aEbstxkQmji4tfjf@w447anl.localdomain>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
In-Reply-To: <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-esetresult: clean, is OK
x-esetid: 37303A2956B14453627762
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C384F9501CD5A549AF8E3FA58E3FA47D@actia.se>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Shawn, Xu,

On Mon, Jun 09, 2025 at 07:53:22PM +0800, Xu Yang wrote:
> Hi Shawn,
>=20
> Thanks for your reports!
>=20
> On Mon, Jun 09, 2025 at 01:31:06PM +0800, Shawn Guo wrote:
> > Hi Xu, Peter,
> >=20
> > I'm seeing a kernel hangup on imx8mm-evk board.  It happens when:
> >=20
> >  - USB gadget is enabled as Ethernet
> >  - There is data transfer over USB Ethernet
> >  - Device is going in/out suspend
> >=20
> > A simple way to reproduce the issue could be:
> >=20
> >  1. Copy a big file (like 500MB) from host PC to device with scp
> >=20
> >  2. While the file copy is ongoing, suspend & resume the device like:
> >=20
> >     $ echo +3 > /sys/class/rtc/rtc0/wakealarm; echo mem > /sys/power/st=
ate
> >=20
> >  3. The device will hang up there
> >=20
> > I reproduced on the following kernels:
> >=20
> >  - Mainline kernel
> >  - NXP kernel lf-6.6.y
> >  - NXP kernel lf-6.12.y
> >=20
> > But NXP kernel lf-6.1.y doesn't have this problem.  I tracked it down t=
o
> > Peter's commit [1] on lf-6.1.y, and found that the gadget disconnect &
> > connect calls got lost from suspend & resume hooks, when the commit wer=
e
> > split and pushed upstream.  I confirm that adding the calls back fixes
> > the hangup.

We probably ran into the same problem trying to bring onboard 6.12, going
from 6.1, on iMX8QXP. I managed to trace the hang to EP priming through a
combination of debug tracing and BUG_ON experiments. See if it starts
splatin with the below change.

----------------->8------------------

From 092599ab6f9e20412a7ca1eb118dd2be80cd18ff Mon Sep 17 00:00:00 2001
From: John Ernberg <john.ernberg@actia.se>
Date: Mon, 5 May 2025 09:09:01 +0200
Subject: [PATCH] USB: ci: gadget: Panic if priming when gadget off

---
 drivers/usb/chipidea/udc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 2fea263a5e30..544aa4fa2d1d 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -203,8 +203,10 @@ static int hw_ep_prime(struct ci_hdrc *ci, int num, in=
t dir, int is_ctrl)
=20
    hw_write(ci, OP_ENDPTPRIME, ~0, BIT(n));
=20
-   while (hw_read(ci, OP_ENDPTPRIME, BIT(n)))
+   while (hw_read(ci, OP_ENDPTPRIME, BIT(n))) {
        cpu_relax();
+       BUG_ON(dir =3D=3D TX && !hw_read(ci, OP_ENDPTCTRL + num, ENDPTCTRL_=
TXE));
+   }
    if (is_ctrl && dir =3D=3D RX && hw_read(ci, OP_ENDPTSETUPSTAT, BIT(num)=
))
        return -EAGAIN;
=20
----------------->8------------------

On the iMX8QXP you may additionally run into asychronous aborts and SError
due to resource being disabled.

> >=20
> > ---8<--------------------
> >=20
> > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > index 8a9b31fd5c89..72329a7eac4d 100644
> > --- a/drivers/usb/chipidea/udc.c
> > +++ b/drivers/usb/chipidea/udc.c
> > @@ -2374,6 +2374,9 @@ static void udc_suspend(struct ci_hdrc *ci)
> >          */
> >         if (hw_read(ci, OP_ENDPTLISTADDR, ~0) =3D=3D 0)
> >                 hw_write(ci, OP_ENDPTLISTADDR, ~0, ~0);
> > +
> > +       if (ci->driver && ci->vbus_active && (ci->gadget.state !=3D USB=
_STATE_SUSPENDED))
> > +               usb_gadget_disconnect(&ci->gadget);
> >  }
> > =20
> >  static void udc_resume(struct ci_hdrc *ci, bool power_lost)
> > @@ -2384,6 +2387,9 @@ static void udc_resume(struct ci_hdrc *ci, bool p=
ower_lost)
> >                                         OTGSC_BSVIS | OTGSC_BSVIE);
> >                 if (ci->vbus_active)
> >                         usb_gadget_vbus_disconnect(&ci->gadget);
> > +       } else {
> > +               if (ci->driver && ci->vbus_active)
> > +                       usb_gadget_connect(&ci->gadget);
> >         }
> > =20
> >         /* Restore value 0 if it was set for power lost check */
> >=20
> > ---->8------------------
>=20
> During the scp process, the usb host won't put usb device to suspend stat=
e.
> In current design, then the ether driver doesn't know the system has
> suspended after echo mem. The root cause is that ether driver is still tr=
ing
> to queue usb request after usb controller has suspended where usb clock i=
s off,
> then the system hang.
>=20
> With the above changes, I think the ether driver will fail to eth_start_x=
mit()=20
> at an ealier stage, so the issue can't be triggered.
>=20
> I think the ether driver needs call gether_suspend() accordingly, to do t=
his,
> the controller driver need explicitly call suspend() function when it's g=
oing
> to be suspended. Could you check whether below patch fix the issue?
>=20
>  ---8<--------------------
>=20
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 8a9b31fd5c89..27a7674ed62c 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -2367,6 +2367,8 @@ static void udc_id_switch_for_host(struct ci_hdrc *=
ci)
>  #ifdef CONFIG_PM_SLEEP
>  static void udc_suspend(struct ci_hdrc *ci)
>  {
> +       ci->driver->suspend(&ci->gadget);
> +
>         /*
>          * Set OP_ENDPTLISTADDR to be non-zero for
>          * checking if controller resume from power lost
> @@ -2389,6 +2391,8 @@ static void udc_resume(struct ci_hdrc *ci, bool pow=
er_lost)
>         /* Restore value 0 if it was set for power lost check */
>         if (hw_read(ci, OP_ENDPTLISTADDR, ~0) =3D=3D 0xFFFFFFFF)
>                 hw_write(ci, OP_ENDPTLISTADDR, ~0, 0);
> +
> +       ci->driver->resume(&ci->gadget);
>  }
>  #endif
>=20
>  ---->8------------------

I tested this during my debugging and it doesn't work because suspend/resum=
e
callbacks on the gadgets are designed for USB triggered suspend/resume and
not system triggered suspend/resume. Meaning that the link will just be
woken up again by the next USB transfer.

>=20
> Thanks,
> Xu Yang
>=20
> >=20
> > But it's unclear to me why the hangup happens and how the change above
> > fix the problem.  Do you guys have any insight here?o
> >=20
> > Shawn
> >=20
> > [1] https://github.com/reMarkable/linux-imx/commit/0791d25578cb0e46fd93=
ae7a3c36ff7a424f3547
> >=20

I didn't find the missing lines of code that Shawn found and instead ended
up looking at why the UDC core isn't suspending the gadgets when the system
is going to suspend. Because to me it feels like a job of UDC core.

I ended up with the monstrosity below that I have been intended to send as
an RFC when I'm done thinking about it. It currently applies on 6.12.20.

But since Shawn also ran into the problem I'm including it for the sake of
discussion about what the correct path of solving it is.

Best regards // John Ernberg

----------------->8------------------

From 3c1d167f1eff0bd010b797530e3d03f6939db322 Mon Sep 17 00:00:00 2001
From: John Ernberg <john.ernberg@actia.se>
Date: Mon, 5 May 2025 09:09:50 +0200
Subject: [PATCH] WIP: Suspend getherlink on system suspend

---
 drivers/usb/gadget/composite.c        | 68 +++++++++++++++++++++++++++
 drivers/usb/gadget/configfs.c         | 53 +++++++++++++++++++++
 drivers/usb/gadget/function/f_ecm.c   | 22 +++++++++
 drivers/usb/gadget/function/u_ether.c | 34 ++++++++++++++
 drivers/usb/gadget/function/u_ether.h |  2 +
 drivers/usb/gadget/udc/core.c         | 29 ++++++++++++
 include/linux/usb/composite.h         |  4 ++
 include/linux/usb/gadget.h            |  2 +
 8 files changed, 214 insertions(+)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.=
c
index 8402a86176f4..f1ed1db1e1d0 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -2669,6 +2669,72 @@ void composite_resume(struct usb_gadget *gadget)
 	cdev->suspended =3D 0;
 }
=20
+int composite_system_suspend(struct usb_gadget *gadget)
+{
+	struct usb_composite_dev	*cdev =3D get_gadget_data(gadget);
+	struct usb_function		*f;
+	int				ret;
+
+	DBG(cdev, "system suspend\n");
+	if (cdev->config) {
+		list_for_each_entry(f, &cdev->config->functions, list) {
+			if (f->system_suspend) {
+				ret =3D f->system_suspend(f);
+				if (ret)
+					return ret;
+			}
+		}
+	}
+
+	if (cdev->config &&
+	    cdev->config->bmAttributes & USB_CONFIG_ATT_SELFPOWER)
+		usb_gadget_set_selfpowered(gadget);
+
+	usb_gadget_vbus_draw(gadget, 2);
+
+	return 0;
+}
+
+int composite_system_resume(struct usb_gadget *gadget)
+{
+	struct usb_composite_dev	*cdev =3D get_gadget_data(gadget);
+	struct usb_function		*f;
+	unsigned			maxpower;
+	int				ret;
+
+	DBG(cdev, "system resume\n");
+	if (cdev->config) {
+		list_for_each_entry(f, &cdev->config->functions, list) {
+			if (f->system_resume) {
+				ret =3D f->system_resume(f);
+				if (ret)
+					return ret;
+			}
+		}
+
+		maxpower =3D cdev->config->MaxPower ?
+			cdev->config->MaxPower : CONFIG_USB_GADGET_VBUS_DRAW;
+		if (gadget->speed < USB_SPEED_SUPER)
+			maxpower =3D min(maxpower, 500U);
+		else
+			maxpower =3D min(maxpower, 900U);
+
+		if (maxpower > USB_SELF_POWER_VBUS_MAX_DRAW ||
+		    !(cdev->config->bmAttributes & USB_CONFIG_ATT_SELFPOWER))
+			usb_gadget_clear_selfpowered(gadget);
+		else
+			usb_gadget_set_selfpowered(gadget);
+
+		usb_gadget_vbus_draw(gadget, maxpower);
+	} else {
+		maxpower =3D CONFIG_USB_GADGET_VBUS_DRAW;
+		maxpower =3D min(maxpower, 100U);
+		usb_gadget_vbus_draw(gadget, maxpower);
+	}
+
+	return 0;
+}
+
 /*------------------------------------------------------------------------=
-*/
=20
 static const struct usb_gadget_driver composite_driver_template =3D {
@@ -2681,6 +2747,8 @@ static const struct usb_gadget_driver composite_drive=
r_template =3D {
=20
 	.suspend	=3D composite_suspend,
 	.resume		=3D composite_resume,
+	.system_suspend	=3D composite_system_suspend,
+	.system_resume	=3D composite_system_resume,
=20
 	.driver	=3D {
 		.owner		=3D THIS_MODULE,
diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 29390d573e23..e0d2f0998e86 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1962,6 +1962,57 @@ static void configfs_composite_resume(struct usb_gad=
get *gadget)
 	spin_unlock_irqrestore(&gi->spinlock, flags);
 }
=20
+static int configfs_composite_system_suspend(struct usb_gadget *gadget)
+{
+	struct usb_composite_dev *cdev;
+	struct gadget_info *gi;
+	unsigned long flags;
+	int ret;
+
+	cdev =3D get_gadget_data(gadget);
+	if (!cdev)
+		return 0;
+
+	gi =3D container_of(cdev, struct gadget_info, cdev);
+	spin_lock_irqsave(&gi->spinlock, flags);
+	cdev =3D get_gadget_data(gadget);
+	if (!cdev || gi->unbind) {
+		spin_unlock_irqrestore(&gi->spinlock, flags);
+		return 0;
+	}
+
+	ret =3D composite_system_suspend(gadget);
+	spin_unlock_irqrestore(&gi->spinlock, flags);
+
+	return ret;
+}
+
+static int configfs_composite_system_resume(struct usb_gadget *gadget)
+{
+	struct usb_composite_dev *cdev;
+	struct gadget_info *gi;
+	unsigned long flags;
+	int ret;
+
+	cdev =3D get_gadget_data(gadget);
+	if (!cdev)
+		return 0;
+
+	gi =3D container_of(cdev, struct gadget_info, cdev);
+	spin_lock_irqsave(&gi->spinlock, flags);
+	cdev =3D get_gadget_data(gadget);
+	if (!cdev || gi->unbind) {
+		spin_unlock_irqrestore(&gi->spinlock, flags);
+		return 0;
+	}
+
+	ret =3D composite_system_resume(gadget);
+	spin_unlock_irqrestore(&gi->spinlock, flags);
+
+	return ret;
+}
+
+
 static const struct usb_gadget_driver configfs_driver_template =3D {
 	.bind           =3D configfs_composite_bind,
 	.unbind         =3D configfs_composite_unbind,
@@ -1972,6 +2023,8 @@ static const struct usb_gadget_driver configfs_driver=
_template =3D {
=20
 	.suspend	=3D configfs_composite_suspend,
 	.resume		=3D configfs_composite_resume,
+	.system_suspend	=3D configfs_composite_system_suspend,
+	.system_resume	=3D configfs_composite_system_resume,
=20
 	.max_speed	=3D USB_SPEED_SUPER_PLUS,
 	.driver =3D {
diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/funct=
ion/f_ecm.c
index 6cb7771e8a69..4df67d5ee0fa 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -892,6 +892,26 @@ static void ecm_resume(struct usb_function *f)
 	gether_resume(&ecm->port);
 }
=20
+static int ecm_system_suspend(struct usb_function *f)
+{
+	struct f_ecm *ecm =3D func_to_ecm(f);
+	struct usb_composite_dev *cdev =3D ecm->port.func.config->cdev;
+
+	DBG(cdev, "ECM System Suspend\n");
+
+	return gether_system_suspend(&ecm->port);
+}
+
+static int ecm_system_resume(struct usb_function *f)
+{
+	struct f_ecm *ecm =3D func_to_ecm(f);
+	struct usb_composite_dev *cdev =3D ecm->port.func.config->cdev;
+
+	DBG(cdev, "ECM System Resume\n");
+
+	return gether_system_resume(&ecm->port);
+}
+
 static void ecm_free(struct usb_function *f)
 {
 	struct f_ecm *ecm;
@@ -961,6 +981,8 @@ static struct usb_function *ecm_alloc(struct usb_functi=
on_instance *fi)
 	ecm->port.func.free_func =3D ecm_free;
 	ecm->port.func.suspend =3D ecm_suspend;
 	ecm->port.func.resume =3D ecm_resume;
+	ecm->port.func.system_suspend =3D ecm_system_suspend;
+	ecm->port.func.system_resume =3D ecm_system_resume;
=20
 	return &ecm->port.func;
 }
diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/fun=
ction/u_ether.c
index f58590bf5e02..d4f0e28ffd4d 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -1078,6 +1078,40 @@ void gether_resume(struct gether *link)
 }
 EXPORT_SYMBOL_GPL(gether_resume);
=20
+int gether_system_suspend(struct gether *link)
+{
+	struct eth_dev *dev =3D link->ioport;
+	struct net_device *ndev =3D dev->net;
+
+	rtnl_lock();
+	if (netif_running(ndev)) {
+		netif_tx_lock_bh(ndev);
+		netif_device_detach(ndev);
+		netif_tx_unlock_bh(ndev);
+	}
+	rtnl_unlock();
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gether_system_suspend);
+
+int gether_system_resume(struct gether *link)
+{
+	struct eth_dev *dev =3D link->ioport;
+	struct net_device *ndev =3D dev->net;
+
+	rtnl_lock();
+	if (netif_running(ndev)) {
+		netif_tx_lock_bh(ndev);
+		netif_device_attach(ndev);
+		netif_tx_unlock_bh(ndev);
+	}
+	rtnl_unlock();
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gether_system_resume);
+
 /*
  * gether_cleanup - remove Ethernet-over-USB device
  * Context: may sleep
diff --git a/drivers/usb/gadget/function/u_ether.h b/drivers/usb/gadget/fun=
ction/u_ether.h
index 34be220cef77..ffd023b7be7b 100644
--- a/drivers/usb/gadget/function/u_ether.h
+++ b/drivers/usb/gadget/function/u_ether.h
@@ -261,6 +261,8 @@ void gether_cleanup(struct eth_dev *dev);
=20
 void gether_suspend(struct gether *link);
 void gether_resume(struct gether *link);
+int gether_system_suspend(struct gether *link);
+int gether_system_resume(struct gether *link);
=20
 /* connect/disconnect is handled by individual functions */
 struct net_device *gether_connect(struct gether *);
diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 4b3d5075621a..1e4ee5ffcfbf 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1683,6 +1683,30 @@ static void gadget_unbind_driver(struct device *dev)
 	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
 }
=20
+static int gadget_suspend_driver(struct device *dev)
+{
+	struct usb_gadget *gadget =3D dev_to_usb_gadget(dev);
+	struct usb_udc *udc =3D gadget->udc;
+	struct usb_gadget_driver *driver =3D udc->driver;
+
+	if (driver->system_suspend)
+		return driver->system_suspend(gadget);
+
+	return 0;
+}
+
+static int gadget_resume_driver(struct device *dev)
+{
+	struct usb_gadget *gadget =3D dev_to_usb_gadget(dev);
+	struct usb_udc *udc =3D gadget->udc;
+	struct usb_gadget_driver *driver =3D udc->driver;
+
+	if (driver->system_resume)
+		return driver->system_resume(gadget);
+
+	return 0;
+}
+
 /* -----------------------------------------------------------------------=
-- */
=20
 int usb_gadget_register_driver_owner(struct usb_gadget_driver *driver,
@@ -1896,11 +1920,16 @@ static const struct class udc_class =3D {
 	.dev_uevent	=3D usb_udc_uevent,
 };
=20
+static const struct dev_pm_ops gadget_bus_pm_ops =3D {
+	SET_SYSTEM_SLEEP_PM_OPS(gadget_suspend_driver, gadget_resume_driver)
+};
+
 static const struct bus_type gadget_bus_type =3D {
 	.name =3D "gadget",
 	.probe =3D gadget_bind_driver,
 	.remove =3D gadget_unbind_driver,
 	.match =3D gadget_match_driver,
+	.pm =3D &gadget_bus_pm_ops,
 };
=20
 static int __init usb_udc_init(void)
diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
index 6e38fb9d2117..f42ba1cfd181 100644
--- a/include/linux/usb/composite.h
+++ b/include/linux/usb/composite.h
@@ -226,6 +226,8 @@ struct usb_function {
 					bool config0);
 	void			(*suspend)(struct usb_function *);
 	void			(*resume)(struct usb_function *);
+	int			(*system_suspend)(struct usb_function *);
+	int			(*system_resume)(struct usb_function *);
=20
 	/* USB 3.0 additions */
 	int			(*get_status)(struct usb_function *);
@@ -522,6 +524,8 @@ extern int composite_setup(struct usb_gadget *gadget,
 		const struct usb_ctrlrequest *ctrl);
 extern void composite_suspend(struct usb_gadget *gadget);
 extern void composite_resume(struct usb_gadget *gadget);
+extern int composite_system_suspend(struct usb_gadget *gadget);
+extern int composite_system_resume(struct usb_gadget *gadget);
=20
 /*
  * Some systems will need runtime overrides for the  product identifiers
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index df33333650a0..8cdfdece1561 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -744,6 +744,8 @@ struct usb_gadget_driver {
 	void			(*disconnect)(struct usb_gadget *);
 	void			(*suspend)(struct usb_gadget *);
 	void			(*resume)(struct usb_gadget *);
+	int			(*system_suspend)(struct usb_gadget *);
+	int			(*system_resume)(struct usb_gadget *);
 	void			(*reset)(struct usb_gadget *);
=20
 	/* FIXME support safe rmmod */=
