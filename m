Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DED42594;
	Tue, 29 Apr 2025 15:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745940264; cv=none; b=GF+abnB8ThHmvZzbG3FQSU5X8/Mk8wW5rv40kv0XknSN9iEqmqv7WizaomfBGUdOZI1QxN+gZMtjzrB4zR+KaOP29EtwBqQJvEo8+am/zwNngfkXMDEMOj3YNuhCdSiWi7NupC75j1BP0Josbwyskd63kpdwFePUUQNXRBQy49k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745940264; c=relaxed/simple;
	bh=xWFmWep8wq/2ahvRVQ4Q4kgybhqxGP9s17w9fhm930Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mb2wy/C8q6bYIW7nFlZ6ZEaBTPM8yPMLlN8AG8VGvLqWOkVBfPhsyGLr6qaVCpfHh2HGoQ4GuE/zC2mno0HmonZqfOL7BfSV81YaSXndmH+NJRlRUk3vG//Aibyi59gA4vda1ZeazXviShE2ATDdOCaK09Lk55YpKS3bUw7ewFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikMpymak; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikMpymak"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so436134a12.0;
        Tue, 29 Apr 2025 08:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745940261; x=1746545061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msGhu6fOF2oyCTN/tI7gZ7eRssIApKs0mAIDv15tSXY=;
        b=ikMpymakLRpfbdnB045RkDL6pCNmAvXrqRKeV2Fx+Bsr/z4NcQV+QoTmrDVHTrdq8k
         a2a3qMpTseZeshi9aa5E4tGU9R/T/W9WqQ0xDEjXm+s+Vw+urKvD2zogN+BdJ6C8FhUr
         yj5nypXsUa1GUHGU7NieextUkj1qul0XptqR5sc/Krv/AhvrrJ1g0Hg4EwadTWewFpMi
         VgiVPA8CqYlz2ng3/yOQT43M++xWx/prUKM74rB205IVurAzyeB4PLAsKqH1zPE9KIur
         M7CQ+l2VXAm5Kb8+w+DaaMLK6Ss7pAZPbZlwVG7zGO/55aetAxpKxvT1Dk/Xy7mkT1hv
         zxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745940261; x=1746545061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msGhu6fOF2oyCTN/tI7gZ7eRssIApKs0mAIDv15tSXY=;
        b=DG3zQZM+LcsNKmimXH+MJrN3W+dV9wZ4w2+xDXxMW0C8h7SgZBIl35Wp9yUIYsbHP0
         NZ/gSoT1c4WkGcJF9xJxOdZ2OMXiYlDqINufIgWa2OyVu1I3TOCwNWNmue3yPsanKzeN
         xDEK3QzJvFptm/s5ohKpAmBSzV0/RSNbu+TYPIrhmCJxMhfMNa1iQqFVrLyOp71VTfKH
         tij3vm9MEwXNXpPxkcLGk4MQMRksVbjAlfRpssPV7ZJVOLM2vdgB6LVRPh6PwCMa3mnx
         dZDrokqDrAksfm4xOZlxP90VN+rwdy9EVTam29YFNwrOmO/07p+CzgLVWYb6hdb28G7q
         NJMA==
X-Forwarded-Encrypted: i=1; AJvYcCUz0LxQ3HORW0xUuCy3BOBV1thErV3IBV96K+P7H5T/Eu9UF7Tjqg0Ivxm1YzukYOxcwOV4fHaA+g6R@vger.kernel.org, AJvYcCXVzq3iPnHOZK57/MsZnIHZIUFtckVcGbPGackWTrlNoPuH9qNT8oahpElzruA3mSPDmiFJnhtrEnwRwzSl@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh9tfpRollkYI+Y/insiy2htxvrUyMsxy6jt7WTBCikJ+OpJep
	Z3nwkjOUPllWzgluDtCSd+PAFb0qh5fWFPqeaQdyksbs5BpQjV8d
X-Gm-Gg: ASbGncvqUqyg/9fFAOz9gNm6zUSu+muJ96qJW1HH/ZxCuq7Orf8HMfZD2xD4iCuR0QF
	K+TOom9cvFp8GrVkDRMOPwGA7bNJX19Gf5tzEgSFZOGF58YU/lJTBLp98kMehVDV5xxrTnbIClu
	sY5ODs4vC8uc1SmULM+FvC+1G122MNr1OZf1/Y7lFBppYXAGEh0z1iB2MbnfDlpQECEKMfEEfZI
	OKgocuftg99AukO23D+9l5ZYiM4cgGbN0Sj7kJJy0xVw7AZqUVcnDHcVjVX4F71kfr30dknGvhE
	w3LMZadf2tKcOGL8WNunDXTD332gXKGuTKUL+NaTESgHWmK897E+A+GORXESFROzf2s/vuTmcg/
	vXtPMl0MYy5oSPNwm
X-Google-Smtp-Source: AGHT+IGoCpwI1mhzwqjMaKdTGw9O8H9V2Z9zrCizgtb+8WQLicqiFAzaOh+hZID1l+Pa03HZ4jDIZw==
X-Received: by 2002:a05:6402:3495:b0:5ec:cc90:b126 with SMTP id 4fb4d7f45d1cf-5f838862cd4mr3823949a12.19.1745940260576;
        Tue, 29 Apr 2025 08:24:20 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7011fc469sm7545748a12.7.2025.04.29.08.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 08:24:20 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andre Przywara <andre.przywara@arm.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org, samuel@sholland.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Date: Tue, 29 Apr 2025 17:24:18 +0200
Message-ID: <4645060.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <6a056bf8-9f39-4204-9378-8cc39be60038@lunn.ch>
References:
 <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <5880182.DvuYhMxLoT@jernej-laptop>
 <6a056bf8-9f39-4204-9378-8cc39be60038@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 29. april 2025 ob 17:09:22 Srednjeevropski poletni =C4=8Das je A=
ndrew Lunn napisal(a):
> On Tue, Apr 29, 2025 at 04:51:59PM +0200, Jernej =C5=A0krabec wrote:
> > Dne ponedeljek, 28. april 2025 ob 14:37:48 Srednjeevropski poletni =C4=
=8Das je Andrew Lunn napisal(a):
> > > On Sat, Apr 26, 2025 at 08:00:49PM +0200, Jernej =C5=A0krabec wrote:
> > > > Dne petek, 25. april 2025 ob 17:34:14 Srednjeevropski poletni =C4=
=8Das je Andrew Lunn napisal(a):
> > > > > > > +&emac {
> > > > > > > +	pinctrl-names =3D "default";
> > > > > > > +	pinctrl-0 =3D <&ext_rgmii_pins>;
> > > > > > > +	phy-mode =3D "rgmii-rxid";
> > > > > >=20
> > > > > > So relating to what Andrew said earlier today, should this read=
 rgmii-id
> > > > > > instead? Since the strap resistors just set some boot-up value,=
 but we
> > > > > > want the PHY driver to enable both RX and TX delay programmatic=
ally?
> > > > >=20
> > > > > Yes.
> > > > >=20
> > > > > There is a checkpatch.pl patch working its way through the system
> > > > > which will add warning about any rgmii value other than rgmii-id.=
 Such
> > > > > values need a comment that the PCB has extra long clock
> > > > > lines. Hopefully that will make people actually stop and think ab=
out
> > > > > this, rather than just copy broken vendor code.
> > > >=20
> > > > I spent quite some time working on ethernet support for this board.=
 Once
> > > > I've found PHY datasheet, I confirmed that there is added delay. So=
 this
> > > > particular board needs "rgmii-rxid" mode.
> > >=20
> > > There have been numerous discussions about what these rgmii modes
> > > mean, because DT developers frequently get them wrong.
> > >=20
> > > Does the PCB have an extra long clock line in the TX direction? That
> > > is what rgmii-rxid means, the PCB is providing the TX delay, the
> > > MAC/PHY pair needs to add the RX delay.
> >=20
> > While schematic is accessible, AFAIK PCB/gerbers are not, so I can't re=
ally
> > tell how long it is. But without this extra delay, ethernet doesn't wor=
k.
>=20
> You are not adding an extra delay, you are subtracting a
> delay. 'rgmii-rxid' says the TX delay is implemented by the PCB, hence
> the PHY does not need to add the delay.
>=20
> What is normal is that the PCB adds no delays, and the PHY adds the
> delay for both the RX and the TX. And you represent this with
> 'rgmii-id'.

ok, thanks for explanation.

>=20
> So what you need to find out is, where does the TX delay come from?

How to do that? Strapping show me this way and testing confirmed it. Not
sure what more I can do? As a hobbyist, I don't have access to anything more
than schematic.

Best regards,
Jernej


