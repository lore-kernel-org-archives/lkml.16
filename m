Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7105292901
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 02:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747277635; cv=none; b=UZoYWq0m/r/X+TRUVzOzg5iRZF2P8YLmLWW0NTVGavKAjBmJ0e8ldv8vJMjr/TuuxA8FudB197iwFLxQoecttR+0StorQ9ncRMWzlyCI+sBiOVVKlRgOqGvMuwFg6EKpzQyExaSP8H+mGGPxg4RZYT6OZfbpk2n0ZH8PtleSWjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747277635; c=relaxed/simple;
	bh=q12jZzf376ffdLkRqcNfDFxYC6noHOaDM9SLBX3Cpfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SGYZ1dPgXdY++BwYRuehDTNiiolPOET5kCO7dg9Afw55O47Qf0hqMoozC17s7OnH1hhdv7LRPVY63w/UyzPPkPTzl4Tf7mmbm2VaHC2SYLyp0MSIhRTSvuxmSveJcnKBOv5nHZdgj/PFTwWbVLkIEKKBLm7znucUWoMTAH7j9pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FJt3yfQ+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FJt3yfQ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747277632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q12jZzf376ffdLkRqcNfDFxYC6noHOaDM9SLBX3Cpfo=;
	b=FJt3yfQ+V6ACb63Xqi+Yx+9BEVWPgrBM9AsnC1E0kawni7byA0r1GmOHdlaAZPV9BDZqDG
	Ged4ZTBqDPrewc5B2no7vexzQEXBufkcySz0s1uBjvKFvkScKc00rMOiel/gVGBiHDvlct
	2Sama80zG58YUl3r/H7cwdJfHCY5/8s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-QLoDLax2N4KBwY7y9eOpVg-1; Wed, 14 May 2025 22:53:51 -0400
X-MC-Unique: QLoDLax2N4KBwY7y9eOpVg-1
X-Mimecast-MFC-AGG-ID: QLoDLax2N4KBwY7y9eOpVg_1747277630
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a0b7124b5fso279515f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747277630; x=1747882430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q12jZzf376ffdLkRqcNfDFxYC6noHOaDM9SLBX3Cpfo=;
        b=sCQUJo91vrq3M10xPxe9QNx8I6z4ptlhCYfgU0LI59YlBEmYTyuP5sVKoFoW0CYywJ
         2pU0cbIB5lnQeDkjE9KBhdEGKxregafF7esl+pZnN63yDOEgQFIz6g4S7A+oCOQfREst
         BCpVr07ATccvcOBv4jWp2O8fXlZ9z9J3h3M5MqYBy/GViUU3Qjrodi6bzSf8PEQ971sl
         Fd2C6FCKRhvlblURAqiXtPBZgyz7TXiFvhuBQf9OmxCuXbyw1gppmwv3IIXqmJh7s+CN
         J37I1AvDZUYVSuNZd2VbB8h8RmIjEwbId7Hq0zbFX3fWxHbMC3LxefCAaGx9Wx/D3juu
         20Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUl+cylCdMr5ip7pXmffrDBjeJxuqmC9ZHRcmuNKTN22+WCvoan57u2u0CnUtT4LtFlHsEq+veKSOz0ClI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCIM3qQTsHQtDG0p4V/6aDs9Ied5NEjJg9ZwOCXA1/73UzxaYZ
	SSeWGll6J2pijyoj4S4qkaOoscnrwGk1rw7VKIXmHLELsqRfIcl7ES4dZRuWw7PhENPg2Iw60pC
	/Em4xjo5D6lGdz9xztQzh7Hbxd1IDJvdH75rY9/47byNtdMPc1IWGk6NkIPf1UY6D4yXqEzZEja
	jkYDxuY4nX7fvoWdcweYxKq40Zs9X99CmRLWsZ
X-Gm-Gg: ASbGncvBOaA4/w3AzDgJCzdI7b7YMMFWPlIrqExHtQRorL8ag0fJy1nGuwCqUk+i3yY
	TqaNCOsBUj5pXUzOfDZaUqQq90fuXNHIY92s9dUYBOco2uG4o3Ngl8YWlHUfVRDbtIOh9Ew==
X-Received: by 2002:a05:6000:1a8e:b0:3a0:9f24:7762 with SMTP id ffacd0b85a97d-3a3496a3a96mr4942172f8f.15.1747277630244;
        Wed, 14 May 2025 19:53:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9IZ9Mn8+/PFqfgbQu1f0XDTJNKLuy4Jh6/XcvK4Q6rmMeFaFK+bsIgyF+xuruV1LHo9BO7J8jSam+bSy3TCU=
X-Received: by 2002:a05:6000:1a8e:b0:3a0:9f24:7762 with SMTP id
 ffacd0b85a97d-3a3496a3a96mr4942165f8f.15.1747277629923; Wed, 14 May 2025
 19:53:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429165018.112999-1-kwolf@redhat.com> <47dd225b433b0df585a25084a2e793344eeda239.camel@suse.com>
 <aCIRUwt5BueQmlMZ@redhat.com> <aCLe5UT2kfzI96TQ@infradead.org>
 <aCMQ5S-gI6vZJxmq@redhat.com> <aCQiz88HksKg791Z@infradead.org>
 <aCTDiHMuMncwdp_X@redhat.com> <50beb356b4dc000446fd186ab754c87f386eaeae.camel@suse.com>
In-Reply-To: <50beb356b4dc000446fd186ab754c87f386eaeae.camel@suse.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 15 May 2025 04:53:38 +0200
X-Gm-Features: AX0GCFvTEPU5IZpr4lmzI_rpOrj66AYnp0fHsjgkFGdjVSKfaoKh2h6IWIGfP7I
Message-ID: <CABgObfaEiMN=YANk02EWini+jAXU1MxSvo8_jYWaMiu3ds7hgQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] dm mpath: Interface for explicit probing of active paths
To: Martin Wilck <mwilck@suse.com>
Cc: Benjamin Marzinski <bmarzins@redhat.com>, Christoph Hellwig <hch@infradead.org>, 
	Kevin Wolf <kwolf@redhat.com>, dm-devel@lists.linux.dev, 
	Hanna Czenczek <hreitz@redhat.com>, Mikulas Patocka <mpatocka@redhat.com>, snitzer@kernel.org, 
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>, Hannes Reinecke <hare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il mer 14 mag 2025, 13:37 Martin Wilck <mwilck@suse.com> ha scritto:
>
> I'd go one step further. Christoph is right to say that what we're
> currently doing in qemu =E2=80=93 passing through every command except th=
e
> PRIN/PROUT to a multipath device =E2=80=93 is a dangerous thing to do.
>
> Passthrough from a dm-multipath device to a SCSI device makes sense
> only for a small subset of the SCSI command set. Basically just for the
> regular IO commands like the various READ and WRITE variants and the
> occasional UNMAP. The fact that customers
> have been running these setups in large deployments over many years
> suggests that, if other commands ever get passed through to member
> devices, it has rarely had fatal consequences.
>
> Nobody would seriously consider sending ALUA commands to the multipath
> devices. TUR and REQUEST SENSE are other examples for commands that
> can't be reasonably passed through to random member devices of a
> multipath map.

Yes, as usual things are a bit more complicated. First, a handful of
commands are special (REQUEST SENSE would be for HBAs that don't use
auto sense, but that is fortunately not something you encounter).
Second, there's already a filter in the kernel in
drivers/scsi/scsi_ioctl.c for commands that are allowed without
CAP_SYS_RAWIO. QEMU is subject to that so the commands you'll see are
mostly I/O, INQUIRY, TUR, MODE SENSE/SELECT and that's it.

Any command that the kernel doesn't filter would be rejected, or
handled specially in the case of PR commands (PR commands use a
separate privileged helper to send them down to the device; the helper
also knows about multipath and uses the userspace libmpathpersist if
it receives a dm-mpath file descriptor via SCM_RIGHTS).

> AFAIK the only commands that we really need to pass through (except the s=
tandard ones) are the reservation commands, which get special handling
> by qemu anyway. @Ben, @Kevin, are you aware of anything else?

.Of the ones that aren't simple I/O, mode parameters and TUR are the
important cases. A TUR failure would be handled by the ioctl that
Kevin proposed here by forcing a path switch. Mode parameters might
not be shared(*) and would need to be sent down all the paths in that
case; that can be fixed in userspace if necessary.

> I'd also be interested in understanding this better. As noted above,
> I'm aware that passing through everything is dangerous and wrong in
> principle. But in practice, we haven't observed anything serious except
> (as Ben already said) the failure to do path failover in the SG_IO code
> path, which both this patch set and my set from the past are intended
> to fix.

Yes, the kernel filter is a PITA in the normal single path case but
here it helps not doing something overly wrong.

Paolo

(*) in theory there's a Mode Page Policy VPD page to tell the
initiator whether they are. I'm not sure if anyone supports it in the
real world...

