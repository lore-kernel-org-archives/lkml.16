Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0CB1F0E23
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 21:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744322091; cv=none; b=DCYz15j5QiVO8tiyBjhKGQK7vUvfLsF0m5w/n+x12Sq+zYGUMMWj1iuJ1cWN0hoiuVK27K9CtvSCPdH7sflq7AdgZmUvL98RldFOl9meJHKHiBgeujGTj4T83p8hsyB04fODjPIQcXQnNG4wmuFIl5s/wsj1BqthIMYKCodPFcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744322091; c=relaxed/simple;
	bh=fta3R4t40tTXB23G6QY7NjF/Qlb0isrhbuKlqi8dmNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afc6u+XOgBGhUFrdPR6syWd4Up/MUYj441IBzSvYRvNBu8XEZ8KMq3LAlgeNqnt62OQwI+lGCerzuakz2iyCDPqc1HXU9RzX/1hwXIVlaO9LQ8Ga+PLEdM4qWWz+PwTRN16pth1h+3UBURWVKMW55GautsWDM8MjxG2zmBzd+Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1u2zr6-0005Z1-IA; Thu, 10 Apr 2025 23:54:40 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mgr@pengutronix.de>)
	id 1u2zr4-004Kdv-2Y;
	Thu, 10 Apr 2025 23:54:38 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mgr@pengutronix.de>)
	id 1u2zr4-00ATw4-2E;
	Thu, 10 Apr 2025 23:54:38 +0200
Date: Thu, 10 Apr 2025 23:54:38 +0200
From: Michael Grzeschik <mgr@pengutronix.de>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] usb: typec: mux: fsa4480: add regulator support
Message-ID: <Z_g-Hl-G9IwRZmqF@pengutronix.de>
References: <20250404-ml-topic-typec-mux-fs4480-v1-1-475377ef22a3@pengutronix.de>
 <aiechdq62mjgta5p5g3s33okgnp56fe5ing2va7vaaf74nerug@nvrwrgnoyp7g>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fcBZ+xgpOmCxkGr9"
Content-Disposition: inline
In-Reply-To: <aiechdq62mjgta5p5g3s33okgnp56fe5ing2va7vaaf74nerug@nvrwrgnoyp7g>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org


--fcBZ+xgpOmCxkGr9
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2025 at 03:18:14PM +0300, Dmitry Baryshkov wrote:
>On Fri, Apr 04, 2025 at 01:02:20AM +0200, Michael Grzeschik wrote:
>> The fsa4480 vcc lane could be driven by some external regulator.
>> This patch is adding support to enable the regulator before probing.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> ---
>>  drivers/usb/typec/mux/fsa4480.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa=
4480.c
>> index f71dba8bf07c9..c54e42c7e6a16 100644
>> --- a/drivers/usb/typec/mux/fsa4480.c
>> +++ b/drivers/usb/typec/mux/fsa4480.c
>> @@ -12,6 +12,7 @@
>>  #include <linux/regmap.h>
>>  #include <linux/usb/typec_dp.h>
>>  #include <linux/usb/typec_mux.h>
>> +#include <linux/regulator/consumer.h>
>>
>>  #define FSA4480_DEVICE_ID	0x00
>>   #define FSA4480_DEVICE_ID_VENDOR_ID	GENMASK(7, 6)
>> @@ -273,6 +274,10 @@ static int fsa4480_probe(struct i2c_client *client)
>>  	if (IS_ERR(fsa->regmap))
>>  		return dev_err_probe(dev, PTR_ERR(fsa->regmap), "failed to initialize=
 regmap\n");
>>
>> +	ret =3D devm_regulator_get_enable_optional(dev, "vcc");
>
>Missing DT bindings update that describes this supply.

Looking into "Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml" it
seems vcc-supply is alread documented. Is more needed?

>> +	if (ret && ret !=3D -ENODEV)
>> +		return dev_err_probe(dev, ret, "Failed to get regulator\n");
>> +
>>  	ret =3D regmap_read(fsa->regmap, FSA4480_DEVICE_ID, &val);
>>  	if (ret)
>>  		return dev_err_probe(dev, -ENODEV, "FSA4480 not found\n");
>>
>> ---
>> base-commit: a1b5bd45d4ee58af4f56e49497b8c3db96d8f8a3
>> change-id: 20250404-ml-topic-typec-mux-fs4480-392407f94f84
>>
>> Best regards,
>> --
>> Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>
>--=20
>With best wishes
>Dmitry
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--fcBZ+xgpOmCxkGr9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmf4Pg8ACgkQC+njFXoe
LGQMCQ//anu/yApazaQv7M3ivouebs1Zozc2yhZYcrZvNZWAkqltbU3h1tV5uGyZ
slQJemSkuXpI4kQOs0l4ExZup+qDudlYetr0w7VrrttgsW5dQVVE5+HLUwL25c3d
NkwuXPAi/JlgX7K/coxHo8ztoHZviZ1BbN1rn+/MIMUdAEg+eDchLdthUJ2ZcoAH
BQKf/29NRrDKrwvfJFA2BHzbxzyFxod5NIt+4oVmk2S+9mZgtotHLgGx/1Y19vEG
mkPLJ1wcc196Te4s6RtH1FS0SG+OIniZuw6gQ0+zpL1L7CUIc9QAZfwSqwzc1Hk4
h8M7nUeYQsLMpNlXayAXCA0L12aITJbzYYj+bXi36LWQUPFl8lHoSEan4cIVDzFO
aJJoqef+OxhSB9R607kFttXBLPgdXzlv3b2IZU7IahjZYuzaAL+yQJQB+qx2L7yh
zQDtj21keMTbsT1GU+BWg7mgv7W3MOWVpJ+mb5uY6ON5X8xPg7/N3TGZROobU4eu
YJ9N6MvTfemJnuenBngnQ6fjlu5EpjnNxGZ5dy45zeVzsO1jNiBQtzoISA+SPDcR
H4SlWtNt2hrozIDmEOFusSySGRSGzJShQrgw0I1my3oMMqdJjKZK0khYqAh2zMPd
MMnGGqvsEG59wal+LRCNRMLdolrG0XAyUd1AhxV5VKAKZUEqC+g=
=IbVA
-----END PGP SIGNATURE-----

--fcBZ+xgpOmCxkGr9--
