Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A081FC0EF
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 14:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751812055; cv=none; b=iP2m7ZyzsDSSZmrqx1iG9ZMQjxKay1xBE1FmQOgdGddgylhStsTM0E4O39I72mSejb4j2g5nQy206wFKXz9WcsQBRY7Z7i5NRfzgUPqvbEZHZ4yp+gR9M8XqGuYrPbkK5Der6bGavq8jtwl14+3tP4T0KzBAdaPzMV2hhVdTVx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751812055; c=relaxed/simple;
	bh=BhUmY9kHnhRVcCamnDQw2g2rqE8D8vRQag5BL2/da4o=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UPy0Op7vfdbkRGOlkd6QXJrF/cdH1m5em4xWcDN4sEWJliwgYURecZ1k7+D0dJWHKq32E6bHmVuOUHNMPlUIjS1de0UG1aMs0HKcA32ibOQgZds3vzHNWAWaXAYUOzzND2+dvKQXTC91eAM9vgG8c3aGX6C3HVmnE2U+4eoV2m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=ld8yOhvm; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="ld8yOhvm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1751812050; x=1752071250;
	bh=FRrJ89J4W6TIxSY/jx6NlaFrxwomDhp65MsPGgnaL6Q=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ld8yOhvmLoizt1WyqoY+8p1GU3MOl94MBPeTLhS2PGF7bTjFpJKSBCbgEIl8QrhEc
	 cysQbfw+VQJv4/qoL8QPmGFEBvsg33n5WCvdl2+ULcRBAeCUI7HiLhAQjl/1KuMss/
	 Wg3N8XtUErJZdomopwLPx16ETwlxDf7GEqoUNJqYuR7/Xw/YeWBZwY5OIY4obrGRvD
	 l65nyHawzpSdRnRpZgsImUrdq0yGPT4Xf6iccHdjSaxHJumDvLzTUdG8hwFNGGcWva
	 u/8mSua07rl12wx9PyMoAIt0fCNmQzN2wbUpyV9mHEodfPo8RTGm8kQKm6+QplzWu3
	 IYq6Ra5rsQ94A==
Date: Sun, 06 Jul 2025 14:27:26 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Daniele Barcella <daniele.barcella@pm.me>
Cc: Daniele Barcella <daniele.barcella@pm.me>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: modalias: Added a manufacturer string to usb modalias sysfs output
Message-ID: <20250706142720.8596-1-daniele.barcella@pm.me>
Feedback-ID: 47372660:user:proton
X-Pm-Message-ID: 2f9f9178f7367d236861935ce7b321f173f1df47
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The patch improves the usb modalias sysfs output by including the manufactu=
rer string ath the end in the format 'mnf%s' after filtering the string, li=
ke how it is done for the dmi id device.

For example usb:v0483p5740d0100dcEFdsc02dp01ic02isc02ip00in00mnfFlipperDevi=
cesInc.

This change allows hwdb rules to target devices with the same vid+pid but d=
ifferent manufacturer.
For example, the STMicroelectronics Virtual COM Port (0483:5740) is widely =
used in both prototyping and production devices that don't have a unique ve=
ndor ID.

For further context, refer to the related discussion on systemd's GitHub: h=
ttps://github.com/systemd/systemd/pull/24869.

Signed-off-by: Daniele Barcella <daniele.barcella@pm.me>
---
 drivers/usb/core/sysfs.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
index 23f3cb1989f4..dc191fa94372 100644
--- a/drivers/usb/core/sysfs.c
+++ b/drivers/usb/core/sysfs.c
@@ -1154,20 +1154,39 @@ static ssize_t interface_show(struct device *dev, s=
truct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(interface);
=20
+static void ascii_filter(char *d, const char *s)
+{
+=09/* Filter out characters we don't want to see in the modalias string */
+=09for (; *s; s++)
+=09=09if (*s > ' ' && *s < 127 && *s !=3D ':')
+=09=09=09*(d++) =3D *s;
+
+=09*d =3D 0;
+}
+
 static ssize_t modalias_show(struct device *dev, struct device_attribute *=
attr,
 =09=09=09     char *buf)
 {
 =09struct usb_interface *intf;
 =09struct usb_device *udev;
 =09struct usb_host_interface *alt;
+=09char *manufacturer;
+=09int emit;
=20
 =09intf =3D to_usb_interface(dev);
 =09udev =3D interface_to_usbdev(intf);
 =09alt =3D READ_ONCE(intf->cur_altsetting);
=20
-=09return sysfs_emit(buf,
+=09if (udev->manufacturer) {
+=09=09manufacturer =3D kmalloc(strlen(udev->manufacturer) + 1, GFP_KERNEL)=
;
+=09=09ascii_filter(manufacturer, udev->manufacturer);
+=09} else {
+=09=09manufacturer =3D kstrdup("", GFP_KERNEL);
+=09}
+
+=09emit =3D sysfs_emit(buf,
 =09=09=09"usb:v%04Xp%04Xd%04Xdc%02Xdsc%02Xdp%02X"
-=09=09=09"ic%02Xisc%02Xip%02Xin%02X\n",
+=09=09=09"ic%02Xisc%02Xip%02Xin%02Xmnf%s\n",
 =09=09=09le16_to_cpu(udev->descriptor.idVendor),
 =09=09=09le16_to_cpu(udev->descriptor.idProduct),
 =09=09=09le16_to_cpu(udev->descriptor.bcdDevice),
@@ -1177,7 +1196,11 @@ static ssize_t modalias_show(struct device *dev, str=
uct device_attribute *attr,
 =09=09=09alt->desc.bInterfaceClass,
 =09=09=09alt->desc.bInterfaceSubClass,
 =09=09=09alt->desc.bInterfaceProtocol,
-=09=09=09alt->desc.bInterfaceNumber);
+=09=09=09alt->desc.bInterfaceNumber,
+=09=09=09manufacturer
+=09=09);
+=09kfree(manufacturer);
+=09return emit;
 }
 static DEVICE_ATTR_RO(modalias);
=20
--=20
2.47.2


