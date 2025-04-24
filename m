Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E347081F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745459204; cv=none; b=mtjR/uU0ZRyvH4E+VnzR2hEhYax0F7ZALsDY5mIfR2AzXeCqDEqBqotomhU1gEAmnyeqrQmaqgcczYFx0pEB8gxQPidLQJRzHxkwhjp1rbn7KhRwckQZ0ymWdoKkHc+7aXVPDLGDSQcwEzXBqqQCTZ6SDi+4Es/YziZjXHxkvZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745459204; c=relaxed/simple;
	bh=aFQjLq3v1ZoY2ArJKrMrerGSi46opY/pVlQhdenyVFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QaHGOsZpexUTAuVd65Xg9BUyFAFeEO24XgLOdLp+cbRptW0wLLsLcBL/UyVbOY6RfAMgClKby98e/Feg8lCJv01EJWaELmNbmFANwi+g/fv+Ld7aFzNCGcJKLTatyK13eGwXF8YDjSjLmukwvhAd+DWuswACoTeUHRLIHo8x1Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=tN7ecxxE; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="tN7ecxxE"
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7092B419F4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745459197;
	bh=UuCqSIBOgUM0+SxD7TNjr2/v5wc8XU0CKviIzFCsTaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=tN7ecxxERTJOWQZJPgC4NDVfSVrkqA9LxL7bBA92wM/p6U+5LCgvVCsXE6dlnm/nz
	 8wRk1q12H2B47GdtbprS7Lnna8At5iwGGlpSZpKlJittfnrPEvZAjOApYt7oa7Zil4
	 ROIHJHNjpfUVFxS9eGTUw8J1Mznc/Zoi4hM6HLr/dPmlOEn6tIqa4kQ0Tc2hZosajD
	 SgXNYhblgDkO7mvb4dH3UoOt/cpyxl8cb2n2ELQeDHBcx0MCzD3rFb6zvB2Rv59TvX
	 OB5mtugZShjKgM+OydYPoj3eidav+IJBCSVYBM91R3Fl64IoMjUyEriKiI1eCAbqVj
	 LLUJPuVFDmM9A==
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a064c45effso232695f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 18:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745459197; x=1746063997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UuCqSIBOgUM0+SxD7TNjr2/v5wc8XU0CKviIzFCsTaw=;
        b=eOELUDx/y68FvtHZHYlztykd0fR56g5c5re+XpEm9RLVFlmBN8LR2w6iyjFXnR6Y2a
         T72lJQVpbYWwiUV7ZRJcoZaHpyi7ghBquJJXe5sYdBevL0FkxNVjPP2avQAU6V0LH6ab
         SlPuJKrs9abd62xdIrg0BXOu06PQScGS+KmyaM9iADaIhwwGT9oHFot8ic/lhqokUKUK
         l63BZU/wwj9d4FenQEZKi9/zL6YlKKGsXXVUPQtWaOOPqjsGUPFBhKPx/WD6rpXmc6NR
         puiiMWrhBW+DV8gGmZU7U2PvtqfGeuqfyGc84FwTsFiJTZZRdWMvekm4zMUk19HZnzSL
         S1yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyeEh2Tjl7lua0L3TgoxsdfZ8wVHEdsmgBsPgzNzmsPRY33JWS7b5EqeYqkmlx3zHBmHNabMJf58XM9yo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Hg2bKgo0U48TE0vnf4iwZhMjbNSdotMXfPJch8vKKSAl1b9L
	YMNWAADrePxJDIeMxCsUWrQRBx66tqujDluLy4jU9Jlh22bZbyND1yms9OgXVZIpacdnIjICeCM
	TMLUUdvVZo6LpPI/JICTcQ7HpWNRTczkLsMuOCiqsijymayakYbPG75lT1syyJsZcRmDm8BgUFW
	tFs3AEtUuvZXJoAM8B2AfwgT1cuJodOHi/doF1UT+hBqbjaGmFoV6M
X-Gm-Gg: ASbGncsFiHypNv078iSBN/d5kejEijHiwJITbM+bYusXb7Huc6A8SeA0KDGVSm01nXG
	awpyNvvRajdq+Qr2DzjG0p8CBMEEEMW4p43DbRkFnjhL8CoEstC+h3i8fJM/tQZrePVF/XA==
X-Received: by 2002:a05:6000:1843:b0:39c:223f:2770 with SMTP id ffacd0b85a97d-3a06cf563ecmr398764f8f.15.1745459196931;
        Wed, 23 Apr 2025 18:46:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLRcMDK2HCugZ4bfenIKQ3T92UUPIhLg0kxR+BCF68PyCCPMSjuezdAt+kNnhGdXyOwEOJKGnabG+WT5zKXjI=
X-Received: by 2002:a05:6000:1843:b0:39c:223f:2770 with SMTP id
 ffacd0b85a97d-3a06cf563ecmr398751f8f.15.1745459196524; Wed, 23 Apr 2025
 18:46:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421130038.34998-1-en-wei.wu@canonical.com> <CABBYNZLXd3EzMhf41wJg93jNp7DWQK7oHOnHGv_ThZJ7yMXTGw@mail.gmail.com>
In-Reply-To: <CABBYNZLXd3EzMhf41wJg93jNp7DWQK7oHOnHGv_ThZJ7yMXTGw@mail.gmail.com>
From: En-Wei WU <en-wei.wu@canonical.com>
Date: Thu, 24 Apr 2025 09:46:25 +0800
X-Gm-Features: ATxdqUFNUQ7rBVQQUGy0CyNbqvzQmO9HxVJrYe78XujRQ_dhn72R_iBn-jbg7_I
Message-ID: <CAMqyJG08e=-7GTmJjvFi_=YTFupabDBAnSGNmhG+SX1F9z=PTA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] btusb: fix NULL pointer dereference in QCA
 devcoredump handling
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: marcel@holtmann.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pmenzel@molgen.mpg.de, quic_tjiang@quicinc.com, 
	chia-lin.kao@canonical.com, anthony.wong@canonical.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luiz,

> While at it, please move this logic to qca specific file, there is no
> reason for this logic to remain inside btusb.c
I'll work on the v5 soon. Here is what I plan for v5:

[PATCH v4 1/3]: Move the device-core-dump logic of QCA from btusb.c to btqc=
a.c
[PATCH v4 2/3]: Fix the original NULL pointer dereference as in [PATCH v3 1=
/2]
[PATCH v4 3/3]: Use skb_pull for safer skb access as in [PATCH v3
2/2], and use skb_clone to avoid directly resuming skb->data and
skb->len

Many thanks,
En-Wei.

On Tue, 22 Apr 2025 at 03:17, Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi En-Wei,
>
> On Mon, Apr 21, 2025 at 9:00=E2=80=AFAM En-Wei Wu <en-wei.wu@canonical.co=
m> wrote:
> >
> > This patch series fixes a NULL pointer dereference in skb_dequeue()
> > during QCA devcoredump handling, and adds some safety checks to make th=
e
> > parsing more robust.
>
> While at it, please move this logic to qca specific file, there is no
> reason for this logic to remain inside btusb.c
>
> > The first patch fixes the logic bug where dump packets were mistakenly
> > passed to hci_recv_frame() and freed prematurely. This was caused by
> > handle_dump_pkt_qca() returning 0 even when the dump was successfully
> > handled. It also refactors dump packet detection into separate helpers
> > for ACL and event packets.
> >
> > The second patch adds bounds checks and replaces direct pointer access
> > with skb_pull() and skb_pull_data() to avoid accessing invalid memory
> > on malformed packets.
> >
> > Tested on WCN7851 (0489:e0f3) with devcoredump enabled. Crash no
> > longer occurs and dumps are processed correctly.
> >
> > Changes in v4:
> > - Fix unused variable error in the first patch
> > - Refine commit messages
> >
> > Changes in v3:
> > - Use skb_pull_data() for safe packet header access
> > - Split dump packet detection into separate ACL and event helpers
> >
> > Changes in v2:
> > - Fixed typo in the title
> > - Re-flowed commit message line to fit 72 characters
> > - Added blank line before btusb_recv_acl_qca()
> >
> > En-Wei Wu (2):
> >   Bluetooth: btusb: avoid NULL pointer dereference in skb_dequeue()
> >   Bluetooth: btusb: use skb_pull to avoid unsafe access in QCA dump
> >     handling
> >
> >  drivers/bluetooth/btusb.c | 120 +++++++++++++++++++++++---------------
> >  1 file changed, 74 insertions(+), 46 deletions(-)
> >
> > --
> > 2.43.0
> >
>
>
> --
> Luiz Augusto von Dentz
