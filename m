Received: from mail.cab.de (mail.cab.de [46.232.229.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFB73597B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 11:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.232.229.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743680925; cv=none; b=CVOT+oYQpyDQxC1o9DCanbof/LeZKhUX3G6YmccE5mIKTqa/gQjEAlkRDNp4qSpMVwsxJulvaCULT+J0HIMMKswWtblhePwjldMhIxyqhUxm88q5uUrIHdsq9DxKViT6jDhHfkOVFW+65qfEdBBVECdxTkgGCHubgm5tfGyj1gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743680925; c=relaxed/simple;
	bh=ibdwsjBsdXifOEzZI7wf3thLOsCm+G2z9JrJk0nAzT0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W449vhv6C4ZUT689V5r7VZGYTKVEAzw10YrXxshhwN/NxcClrf6qb3IUJnC1z4BqSV82rN4T2S5GpXh3VWuRZD6RY7qsK+lyGH2VB3zS/2yhfszFU5DyKHKv3gtOLbB2Ims7JY0lnvdbi1FRjD/Af+/UHKIPXr8LkgY92Njjr+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cab.de; spf=pass smtp.mailfrom=cab.de; dkim=pass (1024-bit key) header.d=cab.de header.i=@cab.de header.b=MttoAoSJ; arc=none smtp.client-ip=46.232.229.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cab.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cab.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cab.de header.i=@cab.de header.b="MttoAoSJ"
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.cab.de 4ZT0PH49bgzMvb0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cab.de; s=default;
	t=1743680915; bh=ibdwsjBsdXifOEzZI7wf3thLOsCm+G2z9JrJk0nAzT0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=MttoAoSJwAfmQa5jIBGVuQIqOowG2rsEcP6ovgJU3PyHrhUTGbTqxg38NKkXPM+RT
	 dVioakVFNDoG3UX++tXsBLJ7Rjni9wdceraIVNNO1KiNJMvwlHPEvXRyUcVjvaUvDG
	 OGQqYuvBvHAVYb8X2TbgbReTxcqNnny4l+CvEdCM=
X-cab-MailScanner-Watermark: 1744285714.50276@owngj8hKnBo/Eh4J88041g
X-cab-MailScanner-From: m.heidelberg@cab.de
X-cab-MailScanner: Found to be clean
X-cab-MailScanner-ID: 4ZT0PD1wl6zMvb0B
X-cab-MailScanner-Information: Please contact it@cab.de for more information
Received: from Adranos.cab.de ([10.10.1.54] [10.10.1.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(no client certificate requested)
	by hephaistos.cab.de (MailScanner Milter) with SMTP id 4ZT0PD1wl6zMvb0B;
	Thu,  3 Apr 2025 13:48:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.cab.de 4ZT0PD1wl6zMvb0B
Received: from Adranos.cab.de (10.10.1.54) by Adranos.cab.de (10.10.1.54) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 3 Apr
 2025 13:48:40 +0200
Received: from Adranos.cab.de ([fe80::9298:8fc8:395c:3859]) by Adranos.cab.de
 ([fe80::9298:8fc8:395c:3859%7]) with mapi id 15.02.1748.010; Thu, 3 Apr 2025
 13:48:40 +0200
From: Markus Heidelberg <M.Heidelberg@cab.de>
To: Christian Eggers <ceggers@arri.de>
CC: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Jiri
 Prchal" <jiri.prchal@aksignal.cz>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [RFC PATCH 0/2] eeprom: at25: support Cypress FRAMs without
 device ID
Thread-Topic: [RFC PATCH 0/2] eeprom: at25: support Cypress FRAMs without
 device ID
Thread-Index: AQHbowqgaLSFUZ+nPkiC1HgANtwlcrOOsPoAgAEuuYCAADJ8AIABotmA
Date: Thu, 3 Apr 2025 11:48:39 +0000
Message-ID: <Z-51jz_A73rHq1w9@KAN23-025>
References: <20250401133148.38330-1-m.heidelberg@cab.de>
 <2759958.vuYhMxLoTh@n9w6sw14> <Z-zr2oj-hD28ccy3@KAN23-025>
 <2293994.vFx2qVVIhK@n9w6sw14>
In-Reply-To: <2293994.vFx2qVVIhK@n9w6sw14>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C1E143F82CB89145973F6CA8C66C00CE@cab.de>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, Apr 02, 2025 at 12:49:24PM +0200, Christian Eggers wrote:
> maybe the "EEPROM" protocol used by at24 (I2C) and at25 (SPI) EEPROMs is
> not smart enough to provide really useful detection of device capabilitie=
s.
> At least I remember that I2C eeproms of different sizes require a differe=
nt
> number of bytes for addressing. AFAIK, using a wrong number of addressing=
 bytes
> may accidentally overwrite data on the device. If this is the same for SP=
I
> eeproms / FRAMs, reliable auto-detection may be impossible or require
> at least knowing the vendor in advance.

The "read device ID" command works without address, so it can be used to
determine the memory size and thus the address length.

If the response to this command is similar for various devices/vendors
(in consideration of the variable length manufacturer ID using the 0x7F
continuation code), auto-detection should be possible without having to
know the manufacturer in advance and without having to interpret it from
the read ID.

But the maximum possible response length increases by one byte with each
new manufacturer bank of up to 126 manufacturers added to the JEDEC ID
list.

> Flash (MTD) devices provide much more powerful methods for enumerating th=
e
> device's geometry/capabilities than eeprom/fram. But even for ONFI there =
are
> extra tables for vendor/device specific workarounds. I am not sure whethe=
r
> adding such stuff for at24/at25 devices is really worth the trouble...

I feel the same that this wouldn't be worth it, but I guess it's
avoidable if further auto-detection should needed by someone.

Markus=

