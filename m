Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335ED19D8A2
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866191; cv=none; b=qGJclquxMyL1V1voXfQMXnwW9gr5QOvkTq17jpQBtui9nC1suRucfasF0/b2C0bqqfEono5ABD89FgfsInijtjSfADf2Wpz95DGV8wi4raPEDiErbFvM2oukzeLDozJSDgSZ+DDgQkNdsKx8EJZg/l3ptIgmGF1kRkRNT78yFGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866191; c=relaxed/simple;
	bh=RB5S7l28UXc9And1zyALFzQbtmPuGbZefkMtKIUyJok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKMMTG4aywzyvMxgm3pZsPn19CcD83SVTBvbe3ANi+KsQoDYkhH+gNeYVLwEqlY00dakhSkGbMaYPLmfz/1WOJ9rqyG4bHshhtQ2nJt420ChPHoF3yLH/bLQQOV6160u2UgjGAwRdBcvItH7c2CnbXW8J6+hZVVVmoD3ivgLI4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=dRB+TxJB; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dRB+TxJB"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5440f22aabdso1150390e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738866187; x=1739470987; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FaWi/YnzY95lROKf2CwCpRvuE6G7FKaiSuyKKiOmjq0=;
        b=dRB+TxJBQL4XlUqobO6z5dST5Xe+Oobl9AyHHuuVcrrHqp9o992z2/a9+yfyZOG+y4
         IZ3JYlgtOh5zAfbbJNGb4kUiPxb7nZymvL5y6O2pwP1plFKFnYUgE/gqCVgrz0ZCe+Jn
         NEpI+lCUXUeYndauL6e88c/tdev8KWQwiCUhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866187; x=1739470987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaWi/YnzY95lROKf2CwCpRvuE6G7FKaiSuyKKiOmjq0=;
        b=K9pYY9k/mjJ2xbzaWx6+Nz+hN3xsbl1749RPhWDKIb2SzXmeSghw3TUfJ/V9Q3oggM
         Aod7eT4HrtmLq+yE1ZuJeTk5KrHOxmhsU6G3kVh1KZecTc0adLSsyt/z8o3BaP/eAQqr
         El9YViEJX+BJRRQIXh97ELNUi4xgKXYJS6pFWlZE6fzgZRRs9fl260UYh5hTyhsCSx7u
         hXskFDFKI8kdLkcBqBgtc3GvOmJj9p1165yuTYEPPdOxBLvH5C4+ynmX9mJJEBtAH9g1
         ZrnJxR/em1g3EHQrnHY84Q47V6cwSzYUcyFHxICU1BLaizqN2aTL7t2dnS3PPhGRX45S
         kVBw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ5z1eJMp9ycK2qGGpajmq0e5NlBa/dEtwNOvmdLnk3GDwhLEj9eEb5z8/GfjUVXDj6YukR5qXrekHJ5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOPrSgDZ40o/tUVP+NUPnjXnwI7Up5n6sXG13QQpVeR8QIJJKW
	DEhCPtOoHCEYEAfmQy9KPyfFvZBgfZp3zvlzN7p86SiQOTjp/Yq6q8KKNJXpbD0qIywpuWWJ6q4
	TIvXhFfYzFQLrD2Tiz245qUTKsJ9d0Y0s/Ttn
X-Gm-Gg: ASbGncvgVPEmXFIyL3hFUO/GGxDQLfo/a4gPlnleFNY8TDSNoeX0HFyU/M8f+9ffZbA
	QdILCKwvHDtVZmvv3Q3NwsGaZ6PrVmKqeiJTXl02PW/Skff8buEK6b5CCbdCcAwUswrDc27RTgg
	==
X-Google-Smtp-Source: AGHT+IHi45XGnqX4UCmHmYEXTyMJIB46zws7U31zlWlfnvQXRYTq6GAaiEPh+osfqQE8zZtk5vst6LTN7WXrkMMPnKU=
X-Received: by 2002:a05:6512:318f:b0:544:b5:7487 with SMTP id
 2adb3069b0e04-54405a17a44mr2833383e87.17.1738866187202; Thu, 06 Feb 2025
 10:23:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205191213.29202-3-james.quinlan@broadcom.com> <20250206172935.GA990026@bhelgaas>
In-Reply-To: <20250206172935.GA990026@bhelgaas>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Thu, 6 Feb 2025 13:22:54 -0500
X-Gm-Features: AWEUYZlUMeWB20WhMn5B_gHFzQh42jgGcqDP6fch1EzD4_oaIIn7aQjExWD8WrY
Message-ID: <CA+-6iNwws3On9-VJ-vF55o5LwKYpOHtfRYLtoQ5=bh7uGTfYkg@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] PCI: brcmstb: Fix error path upon call of regulator_bulk_get()
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Cyril Brulebois <kibi@debian.org>, Stanimir Varbanov <svarbanov@suse.de>, 
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000006d08ee062d7d55a7"

--0000000000006d08ee062d7d55a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 12:29=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Wed, Feb 05, 2025 at 02:12:02PM -0500, Jim Quinlan wrote:
> > If regulator_bulk_get() returns an error, no regulators are
> > created and we need to set their number to zero.  If we do
> > not do this and the PCIe link-up fails, regulator_bulk_free()
> > will be invoked and effect a panic.
> >
> > Also print out the error value, as we cannot return an error
> > upwards as Linux will WARN on an error from add_bus().
>
> Wrap all these commit logs to fill 75 columns.  No point in leaving
> unused space when most things are formatted to fill 80ish columns or
> more.
ack
>
> > Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators =
from DT")
> > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > ---
> >  drivers/pci/controller/pcie-brcmstb.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/contro=
ller/pcie-brcmstb.c
> > index f8fc3d620ee2..bf919467cbcd 100644
> > --- a/drivers/pci/controller/pcie-brcmstb.c
> > +++ b/drivers/pci/controller/pcie-brcmstb.c
> > @@ -1417,7 +1417,8 @@ static int brcm_pcie_add_bus(struct pci_bus *bus)
> >
> >               ret =3D regulator_bulk_get(dev, sr->num_supplies, sr->sup=
plies);
> >               if (ret) {
> > -                     dev_info(dev, "No regulators for downstream devic=
e\n");
> > +                     dev_info(dev, "Did not get regulators; err=3D%d\n=
", ret);
> > +                     sr->num_supplies =3D 0;
> >                       goto no_regulators;
>
> I think it might have been better if we could do the
> regulator_bulk_get() separately, before pci_host_probe(), so that if
> this error happens, we can deal with it more easily.

Hi Bjorn,

Keep in mind that brcm_pcie_add_bus() cannot return a non-zero error
code, as it will get a WARN() from the caller if it does.

Would you  accept deallocating the "sr" array and setting it to NULL
like the following error condition does?  In that way we would not be
invoking any regulator_bulk_xxxx() functions with nr=3D=3D0.  I'm really
wary of moving things around...

>
> Setting num_supplies =3D 0 is an unusual way of handling this error, and
> if this pattern of managing PCIe regulators spreads to other drivers,
> we might trip over this again.
Understood.
>
> Not asking for a redesign here, and maybe it wouldn't even be
> possible, but it kind of fits with thinking about splitting Root Port
> support from the Root Complex/host bridge support.

IIRC there was a submission having custom/modified port drivers owning
regulators, but I don't think it got accepted.  FWIW, we were
considering  switching to that.

Regards,
Jim Quinlan
Broadcom STB/CM

>
> Bjorn

--0000000000006d08ee062d7d55a7
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
mOAplh6h3nMZUZxBguxG3g2p3iD4EgibUYneEzqOQafIQB/naf2uetKb8y9jKgWJxq2Y4y8Jqg2u
uVIO1AyOJjWwqdgN+QhuIlat+qZd03P48Gim9ZPEMDUCAwEAAaOCAdswggHXMA4GA1UdDwEB/wQE
AwIFoDCBowYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUuZ2xvYmFs
c2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggrBgEFBQcw
AYY1aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAw
TQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2Jh
bHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4aHR0cDov
L2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmwwJQYDVR0R
BB4wHIEaamFtZXMucXVpbmxhbkBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYD
VR0jBBgwFoAUljPR5lgXWzR1ioFWZNW+SN6hj88wHQYDVR0OBBYEFGx/E27aeGBP2eJktrILxlhK
z8f6MA0GCSqGSIb3DQEBCwUAA4IBAQBdQQukiELsPfse49X4QNy/UN43dPUw0I1asiQ8wye3nAuD
b3GFmf3SZKlgxBTdWJoaNmmUFW2H3HWOoQBnTeedLtV9M2Tb9vOKMncQD1f9hvWZR6LnZpjBIlKe
+R+v6CLF07qYmBI6olvOY/Rsv9QpW9W8qZYk+2RkWHz/fR5N5YldKlJHP0NDT4Wjc5fEzV+mZC8A
AlT80qiuCVv+IQP08ovEVSLPhUp8i1pwsHT9atbWOfXQjbq1B/ditFIbPzwmwJPuGUc7n7vpmtxB
75sSFMj27j4JXl5W9vORgHR2YzuPBzfzDJU1ul0DIofSWVF6E1dx4tZohRED1Yl/T/ZGMYICbTCC
AmkCAQEwazBbMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UE
AxMoR2xvYmFsU2lnbiBHQ0MgUjMgUGVyc29uYWxTaWduIDIgQ0EgMjAyMAIMSO43VW7D5NP1X/KD
MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCCgZzsC3VOqsHE0KWAhLhZy0CRYLwru
xuG1ZHEsrqcZUjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNTAy
MDYxODIzMDdaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglg
hkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsGCSqGSIb3DQEBBzALBglghkgBZQME
AgEwDQYJKoZIhvcNAQEBBQAEggEAcz9IOOntn6Nc2+COHv5rCC7OnMuT6jiKNfV+qBdUvSuiNQfe
f5cejJIDd33747YbAS+znx8LLmTKar+Gp89b9ghBVdRTXqPLl5gPYnfD2QIun6AxDG0KO3Ha8Ptz
xtfkAMdscDgGg/UGpKGTkvdXYLZpVo3yzfv0r6CtLW5H24HR/dD38KEPwr4luh/lFjEoBVPB0HBg
IrrCCKpISnfsEBAeCsF4PvLv0WPnYqTbDtpBOez0VxK+pFLkOwHgyyge5NPXHdPzpy51II9QkQdO
P1YY6yNMlaxFRLjQGKOm5eXhShCf1YuCBWNyzLkDaXcd4v2JWgQHpgXcAultfiLSLg==
--0000000000006d08ee062d7d55a7--
