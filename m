Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB321F542B
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 17:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738517653; cv=none; b=DI1WCf4pcRgoYrr9we6JBGh54SB+4NV/C9Ez4ertnz2DYv5UKRx5LnkgL5OoFOQ8o86MWGvJU+nuVivp7uKcHbPfRurtoQQ0kjeCT4R86gmufE1CdzJHilas3tPJGxbriaAoWk4CmZ5a4KnFpndmG2+cNznOAnJOjWxGil/KaMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738517653; c=relaxed/simple;
	bh=NpLX7ZiN1NGlNEzDq3es2iIM70bUmkPAU/sr/Px6TGU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=YfW2dwHEDAY2yTONDXMEw5XfSrzpsCWGVrcVIUgHxNxX9btbD9Nq9vVIIA5sd0UrDmhsc3TyEsq2cpEppYGASJAtOGieViCSi5xaNa5BnKJ3OzHiNSe9EpmUIDj3YgMpRgCQESp3z1q5A/rQ59vqtk89SFpTalEuAcs8l3zo76c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Q8FKRIOO; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Q8FKRIOO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1738517648; x=1739122448; i=markus.elfring@web.de;
	bh=rxE2olFG+D1+I2QqmDH2mfMygRSJg0O19kpMIsqwIUk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Q8FKRIOOqGdn+l6RnQQNSWJ+f1S42vA1bgLRw03DjErMhvRsbZzErAr/ggj8IXGi
	 Ks9Pvh6Ct7fz9YWSVdneGuRpo0nbxMXJbMSlLVSXu3dCpi0ltXXSsda82568er1Wp
	 GQ1aXpLfx/lIN9Kn3gVexJITXAVbUIx00HzPi2E7umiqcfm7Ei7UsoAfb8WmYD0cF
	 DRr9XOc0IFNgbUWiolQZIttH5wkmxtZ9KT+J8F9MQ1vUVEYvuW/OZRCSqyJQboBey
	 s42nnHnDDrarZjpIQYG8DilY0SKSaESL1wxI8/6srwfz93UFV4/932VSyyf3deRSN
	 /Vs3Ndx39OXejcdrpQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.26]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MzkOR-1tIJkH28Rt-00tcMV; Sun, 02
 Feb 2025 18:34:08 +0100
Message-ID: <92dcd1f4-b4d8-4072-be27-b873b47c162b@web.de>
Date: Sun, 2 Feb 2025 18:34:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fred Treven <ftreven@opensource.cirrus.com>,
 patches@opensource.cirrus.com, Charles Keepax
 <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Simon Trimmer <simont@opensource.cirrus.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20250131195639.1784933-2-ftreven@opensource.cirrus.com>
Subject: Re: [PATCH 1/7] firmware: cs_dsp: Fix error checking in wseq_write()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250131195639.1784933-2-ftreven@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8QJ3xGxQall8YZbS7XbUl7OFJ942BT9WokhB+RTOmcNsSiUhzRg
 U3r58UNOXuDplyBDFrlDUQl/MmKneaHZ7VNtnVAJkyM5pK8AVlrYfwm/XF+w1uvMsEt8l2B
 XdDLDHbj7i1TgOdP5sO8+b2xN/MPQVzes0bwytmwzEFXWAR8Mj+BMURSB4ZEe0Y8s1BdYfJ
 2ge+6R81EjrZ7HIouLGJQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2PfOyPOSrHI=;7YMWHScYk3NbGdO7zLNr0Rm10dv
 QOCvW+GqjqMqgyEuSofUaULFFQqtLyV+2E1HV1rbbVMYkbJ5B3UGJ2ofF/SNnI8x9dAyvkQOB
 doN5mLThrhXnf4nCjRltuKkRiLoRKcdWdyddivpsPDc3eSAnTnMyxUHZaQOJvj4FQBwGQ0hBS
 7tUAGRxGtwlus/gVBcONBJcCKZ8sSJZWUyP1uJL70CuYc2MYA9kP5wlaXRzBzOiB4FSAbkvqr
 +EuJV+uFUA8iso2IkZDp+n1KsuyBCdahQdOXzN17eYjLR6yASpGTWxCQKWSW9vphM9Ry/L54W
 K1Jj1ZaVGlbgYujDlu4/5Bv3SKVCVSYkcGED2XMRfatER9X9YyUNLHxeipwOMDhVfO/kary4Z
 PAzkpsNBTlJtIsdNX5u9hG1hjcrGF6gZjOnYppnNEErGcxAGNVpJ95nh1FFSG+aJwYHCy0Ldk
 u80iBwUH1aaEnUypCXPo4KBZI/4WPGabP1+mdL5OOyd95oE77JvsjTEoStsIJobz3kGjFhvn8
 E21EKl4ViM4Ui/tdLcAR6zh/jRDvvN3PJr0tOfSODrIfcN8CnwU/c8N+TSS5N0Z2LhZKK38i0
 XWpRQYp4p8inNCR4FReeEgHVy/OTs6MkubOeRt6jD/uWNcZljoPFBmO+gMAh0rrn749aeXR2s
 VqoMoCQW9vvoaqVVETMOtLGWCqXpI6V9x84LWfyPxlYqBiT9AzhxuwcnEkJq9f7kbPaHakV/x
 /1g24MOhQingdSBc5BVROrqHX8tUaW3ynd2TsvAZk18bNhC7JsVA0aBjrA+LlAtEXBDsYm5Cl
 vREUc9AEbI5u+cyl2/0rpVYUQZe7b/JOs51cv6y3NfLZSnwaAecN4BkRA3B/8iNQWeYbTN1SJ
 W0TDzlEgsIhbLnspuSwF6yi01oKRLdAu2ww8L37seC2t/VgM6IGXR/GCXy/Kw8h6X8nYI4YO4
 4R1olWAmFapn0ZleYWkFN+exI93kdHsLuxcjPR84dU9+i+ZejwyY4JreAjd4DDXuVcY0nygvY
 lnN3qjekZhS9Z2Ohb58GTV8oxshAYvfzWeOpMOEXCO5HzFDznr9q15FFTmzTzRQd0sCgg3Vab
 jgwNhkOxaplu7aE8+84HxCBsWIeqj16KBFHyt/ON6FT+YTMszsKkIPymAi5UpsTdMyJZgeZS+
 jSd1w46Bsj1+r8tPxJ1ieGNjAcCRhIEKlXca6pQ0SzY7qRgl8DPNQoS2SPcUNZCuPeiN8au/3
 pdTPiTbop8vaxBIohnCa1n8AP2EniL4+Yu683YDRBkyThGlCGaLj5ZYHzj/nL36lRT5QHmcZP
 2P3RJP3pUHqRHalEcjYBwUJnIWG2/Gr3ZcOuzpJ7mYUrT+OFJCO12xTh+MCG4AUdWLY

> cs_dsp_coeff_write_ctrl() may return a non-zero value (1)
> upon success. Change error checking in the write sequencer
> code such that it checks for negative errnos rather than
> any non-zero value when using this function.

* Please improve the change description.
  https://elixir.bootlin.com/linux/v6.13.1/source/drivers/firmware/cirrus/=
cs_dsp.c#L786

* How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and=
 =E2=80=9CCc=E2=80=9D) accordingly?


Regards,
Markus
