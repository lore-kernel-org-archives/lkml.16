Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558CF2580D6
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205409; cv=none; b=UWq6rZ7CcDnaiNBqess4toymzgk2HBGCXUCZrhdW+dl5xgtBkjVMWBIKlw+Z2DryQHfr8fGlVBP4qjhhPXO4xWo5i+dT/b2wVQ4QDz6/b0ReIckw+GPw/SohNZKPgSmOXNnqhngaTGrF0C02w9WO1LBz9A7180sSpiFL3GtDQyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205409; c=relaxed/simple;
	bh=SZpHciN/vra1qgjlq2N/I116fAj16TIxGXtrqaH0H2c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DR+dRdMN23nbLTWnq8xy1LsYk+rH3vfcNFEwmiZa148cjRxgUU81DcHS/IvaIyG29aZu+0FZ6C2ftVWrcUVa7OaqGvfdgOSJ1B7aYuvWM/4UXQ9E+M6S+T2hLPDNSkGuSWdj8cIVLGJJSJTYaNQIiYp/uYq5bqqSIh6RcMtKr1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KELOZZRb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KELOZZRb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739205406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4fnD7VJVCXYOV9Bma2SXbyYmBE+oALQ693M8QQFnzSI=;
	b=KELOZZRbZqN3kN+s3foSFWbQqj4NyeT41Mf7gf1yRqTBhmO9XTBDleV974x41T1t6STCPz
	50cNdTAluPuPw7OvCUFJCSJXBv9A7qAEE1deG9TT2VIm1mYWaabQavTMZVywTgA6ueWbqK
	lIksmn7jFnimw+xxlaM08ioS4T4YZlY=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-DngJrqMVPsSCJht2jd4vuw-1; Mon, 10 Feb 2025 11:36:44 -0500
X-MC-Unique: DngJrqMVPsSCJht2jd4vuw-1
X-Mimecast-MFC-AGG-ID: DngJrqMVPsSCJht2jd4vuw
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85534e45380so2193539f.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:36:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739205404; x=1739810204;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4fnD7VJVCXYOV9Bma2SXbyYmBE+oALQ693M8QQFnzSI=;
        b=tbDAMVdinILKln/l3ulNHxGpaKtwq2e2wMeKML/BqHP3/4HUcDpVF6S7ltdG/xMUNL
         +obFvo3tyi6gFKO5AD0Ql/+ehcdxSQrAD9uodwe3mZCV5wTb9vGtbmamddPJX68zksRW
         uOd6Y1Z/M7XaPiGdsIUwOT0lJ5aIzp41HZHp1fPabpGmM7OIJrW0aaFgOb4OmX6EBuBC
         s+xXgsFxuyMalbT/tUTn8WAH6kKSMOTbQWHlNFZz+UTxSJ24dxXixWUBBBflDdnjU/Vr
         LO2trdwlmvyrqDgl5uIBG11n84kVzucQVcbneamtuaObB4nej2G9/+LbC0JEag+nr/iN
         +ChQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaHKWyv8dNrKNg4eCCX6pYXfSAE26fbno/OmonIxvD1MQud6L/s0mgiLMLPSjfk9sa4Xp3Zu3XXLER1f4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc+fkaXxcLoVpZuRKlVFgvJ2/Kj9ENSw7TGj86eHj/W2dcwQ6K
	F+95smePU1+NfEzZOEtQiZACt5ASSQiKkdzpY0OGVRqAUFG7Zo8H3lNWrbp6TaYcsGs26K/UOF6
	0vOcEt2Pve7HRZwVafyQLZ/i0eaq4ySpUOZ5lZJj61noXGlgZiWVXqER0xKBsQg==
X-Gm-Gg: ASbGncsPoIT8E5PIz4vBiBy9syXmy/YxKIHSv+inlTQcCJ76aE4yxE5Ukfjjcdcwh7h
	yb0SPNaG4YSXGW0YT7HygzxIiBFFLG5/7YIbf1OTkAwZ3aJBbej4131Gsei63mEfp9eDqdaZ/Zt
	uvC/mPsOqLA6QzDbBd89VRNIHqbB0bnw2vZjewwp67vYT5gNpLfzjN67Nr+TCWUUrDtp7hec3uo
	6gGCvGDf0J0QzlVBv2Q2eRTGsp+g8WIGSElxAzaLBkaE0HBg51wB9KWX1RmEFj/q9OTa7a5+jqN
	bDos0tAr
X-Received: by 2002:a05:6e02:13ec:b0:3d0:4db5:cd1d with SMTP id e9e14a558f8ab-3d13dec320cmr24801475ab.3.1739205404073;
        Mon, 10 Feb 2025 08:36:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRk8NJl73TmUwUC+h3niqjf0Ri2nfIXsthmmINyfXdYM6EHo7T7KYqjOFeUHPdp1FrFbaTGw==
X-Received: by 2002:a05:6e02:13ec:b0:3d0:4db5:cd1d with SMTP id e9e14a558f8ab-3d13dec320cmr24801435ab.3.1739205403770;
        Mon, 10 Feb 2025 08:36:43 -0800 (PST)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ed08c21f5fsm69458173.49.2025.02.10.08.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 08:36:43 -0800 (PST)
Date: Mon, 10 Feb 2025 09:36:41 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, mitchell.augustin@canonical.com,
 ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH v2] PCI: Batch BAR sizing operations
Message-ID: <20250210093641.0be242ae.alex.williamson@redhat.com>
In-Reply-To: <20250209154512.GA18688@redhat.com>
References: <20250120182202.1878581-1-alex.williamson@redhat.com>
	<20250209154512.GA18688@redhat.com>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 9 Feb 2025 16:45:12 +0100
Oleg Nesterov <oleg@redhat.com> wrote:

> On 01/20, Alex Williamson wrote:
> >
> >  static void pci_read_bases(struct pci_dev *dev, unsigned int howmany, =
int rom)
> >  {
> > +	u32 rombar, stdbars[PCI_STD_NUM_BARS];
> >  	unsigned int pos, reg;
> > +	u16 orig_cmd;
> > +
> > +	BUILD_BUG_ON(howmany > PCI_STD_NUM_BARS); =20
>=20
> FYI, I can't build the kernel after this patch:
>=20
> 	$ make drivers/pci/probe.o
> 	  UPD     include/config/kernel.release
> 	  UPD     include/generated/utsrelease.h
> 	  CALL    scripts/checksyscalls.sh
> 	  DESCEND objtool
> 	  INSTALL libsubcmd_headers
> 	  CC      drivers/pci/probe.o
> 	In file included from <command-line>:0:0:
> 	drivers/pci/probe.c: In function =E2=80=98pci_read_bases=E2=80=99:
> 	././include/linux/compiler_types.h:542:38: error: call to =E2=80=98__com=
piletime_assert_338=E2=80=99 declared with attribute error: BUILD_BUG_ON fa=
iled: howmany > PCI_STD_NUM_BARS
> 	  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> 					      ^
> 	././include/linux/compiler_types.h:523:4: note: in definition of macro =
=E2=80=98__compiletime_assert=E2=80=99
> 	    prefix ## suffix();    \
> 	    ^
> 	././include/linux/compiler_types.h:542:2: note: in expansion of macro =
=E2=80=98_compiletime_assert=E2=80=99
> 	  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> 	  ^
> 	./include/linux/build_bug.h:39:37: note: in expansion of macro =E2=80=98=
compiletime_assert=E2=80=99
> 	 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
> 					     ^
> 	./include/linux/build_bug.h:50:2: note: in expansion of macro =E2=80=98B=
UILD_BUG_ON_MSG=E2=80=99
> 	  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
> 	  ^
> 	drivers/pci/probe.c:348:2: note: in expansion of macro =E2=80=98BUILD_BU=
G_ON=E2=80=99
> 	  BUILD_BUG_ON(howmany > PCI_STD_NUM_BARS);
>=20
> Yes, my gcc version 5.3.1 is very old, but according to Documentation/pro=
cess/changes.rst
> it should still be supported, the minimal version is 5.1.

While I try to setup an environment with an old gcc, can we do something
with __builtin_constant_p() to only evaluate this on versions of gcc
that can determine howmany is constant?  Ex.

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index b6536ed599c3..c70cb480125e 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -345,7 +345,8 @@ static void pci_read_bases(struct pci_dev *dev, unsigne=
d int howmany, int rom)
 	unsigned int pos, reg;
 	u16 orig_cmd;
=20
-	BUILD_BUG_ON(howmany > PCI_STD_NUM_BARS);
+	if (__builtin_constant_p(howmany))
+		BUILD_BUG_ON(howmany > PCI_STD_NUM_BARS);
=20
 	if (dev->non_compliant_bars)
 		return;

I welcome other suggestions too.  Thanks,

Alex

