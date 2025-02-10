Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3711CD1FD
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739183710; cv=none; b=LFhZA+7Xu2Yv/jwyO2nSof+HoAvraRooQ/4n6yusfrKMclBn8BXFvGBGHn2JowCBXatAPw5O4W/4Gs4wJPguak1IMHGuqYl6oRO54H3KJrKGS/wMlTzmJMdQU7d2FjV0AR39V7QJL3IT1JLcDZYhGHVzU2CmwiiGb7Elew2SfmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739183710; c=relaxed/simple;
	bh=q4Br+Rdm3YDg3/jP6dwAVME082OQYdoI5VwxT/1x1kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkXkLKud3jR9W3UDyaLqplVT4ZrjqrBS0kozxAm9Gx8/wZ3xsUI/ZvHM0h+8jzlDQDHHOeL9rg88pJCnWv+m3ofFazcupngCIbEy3A8qCE47dlcBWSH6EC45e8hj71Umx/OC9pnt8JKYmZIVEfqsOuJrPOZW29eZJaItRBgpYUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rbj9c2Q9; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rbj9c2Q9"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38dc33931d3so1714090f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739183704; x=1739788504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FKHQGiz4NvdJKvoQkxoIKdTM8jzHy4P7c1SlQXpBIUo=;
        b=rbj9c2Q9Q0+J+03pSDfJ+6Dp5VPSNd+x8Le2fG/EQqTydADmTS58tvF6g7ozUMJzaH
         uOIXgm9B7AzODC3xnMeefRsR4x4B/dTZIxiArWrtiDPWINxERAwj/0OGXs/5nSicnTmj
         j0aUDlHXJL/wUs4dbiTV6t03uoppeUPJCuC0fyOnDckOyiL3kxtIDo/1xc3VIDuwBWiM
         LYcVN8B7F7ifmEZvWldg9R7RRGFvlaSBsWI/EKTlZUK/WdwwI9lceyitbbiN3D5YjrBi
         oJtmNZdd5bqdzqu4UK0D5b1f5o8MaWp6U67dQ1M0rYbp2StmvDW31+Or0fzCv2yRXibh
         v0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739183704; x=1739788504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKHQGiz4NvdJKvoQkxoIKdTM8jzHy4P7c1SlQXpBIUo=;
        b=wGHaO7xwq86kOIpA5vg0e95TXUiQv1JAvKEMCLYCD9McS1crilYp1u0uso9c4rsjoy
         7kK+5Ikc7Z/KChZePFHcit8VBE2mDW0LaSA6HGHORzfNpY7AgEK40lb76Vw4+vgCC7Aq
         PzFrgjb4JXxDH/6w9F/fTlsbFIFDK2pcC8IiiXNh4r908ONf9cIda3nvykIbpXcMsxAo
         zZLdU6+jVcHaz5P9QFqtppZGfYXd6inJqMUdcgO2WjIDoA9W7jwHXQDNTorzdQJbwyOL
         trTO1IPgDm9+PsQnySnocwEMoJTGdZfUnF95gMCX2ab6FTU5fcuHBcPi+QomLsyzeDbQ
         MaQA==
X-Forwarded-Encrypted: i=1; AJvYcCXdpCHGEa7HUnZj5wyLqwoZJVdV+18eVNx2ditfdBVf9cc/eP+1+5n1CaJv1Voieg4m4Jk1sVuRa0Kglro=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuSyYdP+YILXIdW63aX9HsKLnkI6ZeuZ07mWgL7Pz7TgQKZgUX
	7RpzvEnB0sZuFvQmJj26uL5kfjExeThjXghiyodboF9AVWJ2w4PC0zd2MzXIBdE=
X-Gm-Gg: ASbGnctG4Z8ih3TbfnSF4UR/4Fhpq0DNY3JfAIXHoWr7SyfJWsdDjCP5WXBqktKMKXL
	gepQCpxwF1n+5k+LDYnztbqomMxA6MRTZ5FSVGdgdfRcDnfdfkaJBtMXTf7aIGQY/CvYp/mO2Xx
	qUh5JtieXFWKOQ4sZyW1YVrUu0rmGjo8jNuCfqtrlWefv2Xm0c8DFLUX3KQlo4qnsLwDiW/KYIx
	ubOTjJhwAUkZE8fASw7GVgmt9DuJxoqwutuWESaXkizq64b5phz0nZ4T6zdfDneKMPbUVAQNj+T
	ltIkkJGnoxs=
X-Google-Smtp-Source: AGHT+IHKim6S0iEjpZOEjy3a/KC7HiRIjGC/bGpVkjiZAMbE9UQaktsqw2nc2F1sjGddVlO41Rt5wA==
X-Received: by 2002:a5d:64ef:0:b0:38d:e078:43a4 with SMTP id ffacd0b85a97d-38de078468amr1563145f8f.31.1739183704186;
        Mon, 10 Feb 2025 02:35:04 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:3b5a:db2d:b2b7:c8b4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd8dee385sm4753869f8f.61.2025.02.10.02.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:35:03 -0800 (PST)
Date: Mon, 10 Feb 2025 11:35:02 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andrew Davis <afd@ti.com>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
Message-ID: <qjwlppsq4eorzepvjsgjjyyaddouo5w2rjguu5c2mqesd6luwp@f426xeghy2ht>
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
 <20250122-topic-am62-dt-syscon-v6-13-v1-2-515d56edc35e@baylibre.com>
 <20250124-heavy-jaybird-of-vitality-4cbe24@krzk-bin>
 <20250124-able-beagle-of-prowess-f5eb7a@krzk-bin>
 <mocfnpebc67xegcis6tx3ekhsjcsqnvhwtipufycrtq2be4nbh@pmxhir5gmkos>
 <639b4e3a-3f68-4fba-aa33-c46dcb6fc88f@linaro.org>
 <d6252b73-0bcc-4724-8144-d6a98c8980f8@ti.com>
 <74ee6d9b-fd78-4d8a-a94f-b2c4dc794b60@linaro.org>
 <ebsbaaxyatrcikoem75t2blkhhceuidq3wnj3r2hbezfcmtc3u@ptffexrigbff>
 <f9a2247e-e0eb-4e22-8626-80e87afa9386@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b4zifexupykrpb7u"
Content-Disposition: inline
In-Reply-To: <f9a2247e-e0eb-4e22-8626-80e87afa9386@linaro.org>


--b4zifexupykrpb7u
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
MIME-Version: 1.0

On Sun, Feb 09, 2025 at 01:21:27PM +0100, Krzysztof Kozlowski wrote:
> On 07/02/2025 15:40, Markus Schneider-Pargmann wrote:
> > Hi Krzysztof,
> >=20
> > On Mon, Jan 27, 2025 at 01:09:49PM +0100, Krzysztof Kozlowski wrote:
> >> On 24/01/2025 23:35, Andrew Davis wrote:
> >>> On 1/24/25 10:48 AM, Krzysztof Kozlowski wrote:
> >>>> On 24/01/2025 17:05, Markus Schneider-Pargmann wrote:
> >>>>> Hi Krzysztof,
> >>>>>
> >>>>> On Fri, Jan 24, 2025 at 09:22:54AM +0100, Krzysztof Kozlowski wrote:
> >>>>>> On Fri, Jan 24, 2025 at 09:19:49AM +0100, Krzysztof Kozlowski wrot=
e:
> >>>>>>> On Wed, Jan 22, 2025 at 11:24:33AM +0100, Markus Schneider-Pargma=
nn wrote:
> >>>>>>>> Add compatible for ti,am62-ddr-pmctrl to the list. There is a DD=
R pmctrl
> >>>>>>>> register in the wkup-conf register space of am62a and am62p. This
> >>>>>>>> register controls DDR power management.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> >>>>>>>> ---
> >>>>>>>>   Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
> >>>>>>>>   1 file changed, 2 insertions(+)
> >>>>>>>
> >>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>>>>
> >>>>>> Un-acked, I missed the point that you really speak in commit msg a=
bout
> >>>>>> register and you really treat one register is a device. I assumed =
you
> >>>>>> only need that register from this device, but no. That obviously i=
s not
> >>>>>> what this device is. Device is not a single register among 10000 o=
thers.
> >>>>>> IOW, You do not have 10000 devices there.
> >>>>>
> >>>>> Do I understand you correctly that the whole register range of the
> >>>>> wkup_conf node as seen in arch/arm64/boot/dts/ti/k3-am62a-wakeup.dt=
si
> >>>>> should be considered a single syscon device?
> >>>>
> >>>> I don't have the datasheets (and not my task to actually check this),
> >>>> but you should probably follow datasheet. I assume it describes what=
 is
> >>>> the device, more or less.
> >>>>
> >>>> I assume entire wkup_conf is considered a device.
> >>>>
> >>>>>
> >>>>> Unfortunately wkup_conf is modeled as a simple-bus with currently 5
> >>>>> subnodes defined of which 4 of them consist of a single register. M=
ost
> >>>>> of them are syscon as well. So I think I can't change the simple-bus
> >>>>> back to syscon.
> >>>>
> >>>> Huh... Maybe TI folks will help us understand why such design was ch=
osen.
> >>>>
> >>>
> >>> Many of the devices inside the wkup_conf are already modeled as such.
> >>> Clocks and muxes for instance already have drivers and bindings, this
> >>> is nothing new to TI.
> >>>
> >>> If we just use a blank "syscon" over the entire region we would end up
> >>> with drivers that use phandles to the top level wkup_conf node and
> >>> poke directly the registers they need from that space.
> >>>
> >>> Would you rather have
> >>>
> >>> some-device {
> >>> 	ti,epwm_tbclk =3D <&wkup_conf>;
> >>> }
> >>>
> >>> or
> >>>
> >>> some-device {
> >>> 	clocks =3D <&epwm_tbclk 0>;
> >>> }
> >>
> >> How is this comparable? These are clocks. You would have clocks proper=
ty
> >> in both cases.
> >>
> >>
> >>>
> >>> with that epwm_tbclk being a proper clock node inside wkup_conf?
> >>> I would much prefer the second, even though the clock node
> >>> only uses a single register. And in the first case, we would need
> >>> to have the offset into the wkup_conf space hard-coded in the
> >>> driver for each new SoC. Eventually all that data would need to be
> >>> put in tables and we end up back to machine board files..
> >>>
> >>> I'm not saying every magic number in all drivers should
> >>> be offloaded into DT, but there is a line somewhere between
> >>> that and having the DT simply contain the SoC's name compatible
> >>
> >> That's not the question here.
> >>
> >>> and all other data going into the kernel. That line might be a
> >>> personal preference, so my question back is: what is wrong
> >>> if we do want "1000 new syscons per each register" for our
> >>> SoCs DT?
> >>
> >> Because it is false representation of hardware. You do not have 1000
> >> devices. You have only one device.
> >>
> >>
> >>>
> >>> (and the number is not 1000, scanning the kernel I can see
> >>> the largest wkup_conf region node we have today has a grand
> >>> total number sub-nodes of 6)
> >>
> >> But what is being added here is device per each register, not per feat=
ure.
> >=20
> > The register layout is like this:
>=20
> The register layout of what? How is the device called? Is datasheet
> available anywhere?

Yes, it is available here: https://www.ti.com/de/lit/pdf/spruj16

14 Registers
14.2 Device Configuration Registers
14.2.1 CTRL_MMR Registers
14.2.1.1 General Purpose Control Registers
14.2.1.1.3 WKUP_CTRL_MMR0 Registers

Each domain has their own set of general purpose control registers,
CTRL_MMR for the main domain, MCU_CTRL_MMR0 for the MCU domain,
WKUP_CTRL_MMR0 for the wakeup domain.

So I understand this to just be a collection of general purpose control
registers. If you go by feature, then many of the registers can be
grouped into units with a specific purpose or controlling a specific
device which are also grouped by the offsets they represent. I assume
this is why the other nodes in this wkup_conf node were created. Also in
my opinion this makes the relation between the original device and this
general purpose control registers better understandable.

For this patch the ddr-pmctrl regsiter is just a single register, but it
has the purpose of controlling the DDR device power management.

The other patch I posted is a collection of registers for the
CANUART_WAKE functionality. CANUART here is a group of devices CAN and
UART devices. Thes also have a specific purpose for a specific part of
the SoC.

Best
Markus

>=20
> >=20
> > 0x8010 - 0x803c contains 4 clockselect registers
> > 0x80d0 is the DDR16SS_PMCTRL regsiter
> > 0x8190 - 0x8600 contains another 7 clockselect registers
> >=20
> > I see the feature here in the block being clockselect registers. But the
> > ddr-pmctrl register doesn't fit into this so I opted to describe this
> > single register as one node as it looked to me like one feature. Of
> > course I would have preferred this to be different but it is not. Would
> > you prefer the clockselect registers and the pmctrl register to be
> > described as one syscon?
> No, because all the time you speak register=3Ddevice and all the time I
> was explaining that this is not correct. Device is the collection of
> registers. I already said it - entire block is the syscon, not one
> register in the middle, not 2 registers in the middle, not even 4+7
> registers in the middle.
>=20
>=20
> Best regards,
> Krzysztof

--b4zifexupykrpb7u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd8KHufh7XoFiu4kEkjLTi1BWuPwUCZ6nWUQAKCRAkjLTi1BWu
P62YAQC5oHGYjbucmodxxZp43puq++YDD8IuLKHSlRmG3XZyVwD+O7zUo7ZPRJN3
lAswQmm8oSeEBuky8oFV5/4ybaApDAE=
=siEO
-----END PGP SIGNATURE-----

--b4zifexupykrpb7u--
