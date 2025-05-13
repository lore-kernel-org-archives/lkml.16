Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FFE1A23AD
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747151050; cv=none; b=LWlr3a65T5s50Sz19ksw0U7WBs4toPWP8HJRuvkHsaGx0JU13Muk139V+EQvzsX8WjhCsWAoC6RaOayAigsC/mtMK7DSsabsQOijnSXzufzc5HeM5pqxIAdMNc4QMmrURnd/31lcDshoQFUWhzR5PxK0pxl7ZJp3fpwujPb6tp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747151050; c=relaxed/simple;
	bh=nqt2Ina9hhP/vWSgsCY5gvZ0l8zuVZGeh93z30wzrrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ErGJmgAZuQXmrbXmWbq6SVXTrkFAo+aYZQOXiJHuIKTiDdqt1j1ss9FfVaMVxFfy+M4n84Zia3LGJSshCJVYSAtnOHqV7KHKKiaDjbGqzhBb/fZEGocI7TBNfZ0sKlqusVY9pWEULPSoY+fJD31KHAMqavWULn7nyCjU/GLbEdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JLBpMCIL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JLBpMCIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747151047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nqt2Ina9hhP/vWSgsCY5gvZ0l8zuVZGeh93z30wzrrs=;
	b=JLBpMCILPyvKbFOTONL+gybGq9bmVHfnL9BHZPyTWeUN+GsMfL76yqPJ3oH+rdoFOg7Ibs
	hx/U5DKTOaTVLOglI1fHvr2V4KhGM3XN0RhH4+aghzMpZYjhCETL0aRetzwx8SqlQHIknT
	0xck/5TepnAoovYY/tFATMJFPon7Rfg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-0o1_9nLQMQeLrzfyEO_MMw-1; Tue, 13 May 2025 11:44:06 -0400
X-MC-Unique: 0o1_9nLQMQeLrzfyEO_MMw-1
X-Mimecast-MFC-AGG-ID: 0o1_9nLQMQeLrzfyEO_MMw_1747151045
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a0b394504cso2817711f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747151045; x=1747755845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nqt2Ina9hhP/vWSgsCY5gvZ0l8zuVZGeh93z30wzrrs=;
        b=Pig3gYPeliGazbXsRwu2hTZ3HRy3hYtrRdwrRIthTQRnNk33YvvFQYKFZSLeSNH+cz
         pl5vCHpYttz2B7VsYH7rCXf2eWkXeBNG4FFAMKldER/+XDpVbpBVFFf4Q//rNbtcCt6j
         B3MYiYcRwSUnwyqNzpOd5VgWQwaDQz4uBoS+3mew8fmcLDp1AVh7Ij5yVm6kTmsibuW/
         4DGobU3/lEtOJTsyRwzOYz4vHpIMi/mBSBTVNCEJgpejNmiTaPG9d2J6ToLIC/LHT+0I
         v/o4E2XJPbDTjFq4ItdcBL3uRiteuvw5QJN2rlV6oSSoDC8mJOQBQ2YoiDQDHLHBGPJM
         GJFA==
X-Forwarded-Encrypted: i=1; AJvYcCXMBe0Q/o+8hz/KtmIq3OZfP3/Y67xUXPkcQQtivRhxPZY4OLK7XSWwoIBiHGRmKaf/1z94Yga5JQ83PCw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Xa+F9JWEuPoOmbfvGpKUi4/voYqdEGmexZPsLmiX43g7Hot3
	46AzrKj4td4d3u9qH3IZv9Uoq02AEvfnXf5HKpgLKkkqgiFDJ60jTs9NQkBvIZWgYEvJb5OAzSZ
	5dhCST6c9ge0af9ASJSzwViGFAnTl7rAuOo8ko3A6eT4EoqCd7uucRne3Xfae33baA3lQMU+tYo
	wZm+jCvhpt0RalmiHkWGLofvt1ZlKtq+OLXkqA
X-Gm-Gg: ASbGnctA9KJQV0KLvs2wN+w2ntoOnzXLZ1AtbKyqtFxQ97tDyfG0oYaP0TzR50fttwT
	wlLb7QMS+IK7BGhRNc/eflyvuL7D3KjDTIe2MWaFycaaA5LszbQizzjzX51exHM0hGolA
X-Received: by 2002:a05:6000:1847:b0:3a1:f538:d9d5 with SMTP id ffacd0b85a97d-3a340d345f1mr2995164f8f.28.1747151045077;
        Tue, 13 May 2025 08:44:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzriinXgwjHvFWuNfUGHv2r/m8gmMx/xvKUzWgBUAB1+4y/S4PULfXfFGW75D7NulwMZfp+3czSstEhHReWb0=
X-Received: by 2002:a05:6000:1847:b0:3a1:f538:d9d5 with SMTP id
 ffacd0b85a97d-3a340d345f1mr2995139f8f.28.1747151044751; Tue, 13 May 2025
 08:44:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429165018.112999-1-kwolf@redhat.com> <47dd225b433b0df585a25084a2e793344eeda239.camel@suse.com>
 <aCIRUwt5BueQmlMZ@redhat.com> <aCLe5UT2kfzI96TQ@infradead.org> <aCMQ5S-gI6vZJxmq@redhat.com>
In-Reply-To: <aCMQ5S-gI6vZJxmq@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 13 May 2025 17:43:52 +0200
X-Gm-Features: AX0GCFs5ctnR_6RM007F1jT--qYEdX3jyJPWCfe6TcIZho0MVhrPaY3oY8CHQvI
Message-ID: <CABgObfavvrMiVKp2boCJ9fp5PwOrhmNaicY1_kJjN_D27af2uw@mail.gmail.com>
Subject: Re: [PATCH 0/2] dm mpath: Interface for explicit probing of active paths
To: Kevin Wolf <kwolf@redhat.com>
Cc: Christoph Hellwig <hch@infradead.org>, Martin Wilck <mwilck@suse.com>, dm-devel@lists.linux.dev, 
	Hanna Czenczek <hreitz@redhat.com>, Mikulas Patocka <mpatocka@redhat.com>, snitzer@kernel.org, 
	Ben Marzinski <bmarzins@redhat.com>, 
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Il mar 13 mag 2025, 11:29 Kevin Wolf <kwolf@redhat.com> ha scritto:
> QEMU's scsi-block device actually started off using normal I/O for reads
> and writes and using SG_IO only for things that aren't covered by normal
> I/O. But then those had to be changed to SG_IO, too, so that the guest
> would actually see the full SCSI status. Things the commit message
> mentions are unit attention codes and handling RESERVATION CONFLICT
> correctly (which made me unsure above if the more specific interface for
> reservations could actually be used to fully get rid of SG_IO). For more
> context, I'm adding Paolo who actually made that change back then. He
> may remember the concrete bug(s) this fixed.

The original reason to avoid SG_IO for reads and writes was purely
performance (using the host scheduler), but it turned out to be a bad
idea.

RESERVATION CONFLICT indeed was one of the reasons why I moved QEMU
away from SG_IO. It has since been fixed, because these days Linux
uses EBADE for it and likewise there are errno values for some other
statuses or sense codes, but it helps more in general to have the
precise SCSI status and sense data. Having the real status and sense
for example lets QEMU decide which errors to pass to the guest and
which should be handled in the host (for example by pausing the VM).
Some HBAs also have equivalents of Linux's host_status, and passing
that down also makes for more accurate pass through.

Also, specifically for reservations, I also didn't like the idea that
a guest command could be split in multiple host commands and the
reservation conflict would appear in the middle due to a concurrent PR
OUT command. To be honest I don't know how physical disks and
controllers handle that, but I didn't want to make it worse.

Thanks,

Paolo

> So if you want the guest device to behave mostly the same as your host
> device, I don't really see any way around SCSI passthrough and therefore
> SG_IO.
>
> Kevin
>

