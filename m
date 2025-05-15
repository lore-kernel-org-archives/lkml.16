Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620292980D2
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747306281; cv=none; b=hbJcp7facYshAy2P++il2+vfj1Z3JzDDLy3uK9swq5MEdAIYpvY741oxveli/ZjrjbTV3sgGCrF3NATstOWa/bOopq6gc/8MTiyR+d55i1N8IShKofTx0P/ThKpUpWffdWUsrmRzA2m/FDjkEeUF5GwFNW8mlBQKRvgwI/FTlEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747306281; c=relaxed/simple;
	bh=AnnU3LMpl5hAn3J5YKjudejZV9W0hvWD+BxGwylCrSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h6zbYpbD7AEXTN8nGXGm5KZRDWQY2ED0BOrNYBaBsXx1vAxrrVswt23grRQr1xesv+2r8Gj1DRxRu3K6NwhRkyUc/6vhK0HEmBGYMvpFqrOdWsNN3Bx3YwHeRqQykpXDSQPkGaAAXfB4IzvdNG8OCfj0C3uEO8NrTPJKEuIxBCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S1ZXJC8j; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S1ZXJC8j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747306277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AnnU3LMpl5hAn3J5YKjudejZV9W0hvWD+BxGwylCrSY=;
	b=S1ZXJC8j4ZYMEATj6EwztLELr4LKay5f6Tt1wMg4fUIR2DKyiboi3Krp7MTEuD19Douej2
	aCOXVJhwslonQe7/GpjEAwoSO8rKnP6L7KGU1folXpvKEmSGyk4nuI3Mxy5azY5CvO0mRK
	MBBwOlFMohuLKh44JHGnSx4cfcAbLg4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-Il0-daBUO7SJu1uC6xnmhw-1; Thu, 15 May 2025 06:51:15 -0400
X-MC-Unique: Il0-daBUO7SJu1uC6xnmhw-1
X-Mimecast-MFC-AGG-ID: Il0-daBUO7SJu1uC6xnmhw_1747306275
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a35bf8377fso90727f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 03:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747306275; x=1747911075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AnnU3LMpl5hAn3J5YKjudejZV9W0hvWD+BxGwylCrSY=;
        b=hYgz3LVZ2drWDFG+1T/d5/PIqZTt6LV5iBeGpHA9ojJ3DjeH/480jpoUsOU9VGX/dQ
         epjLOV7/vWZgCvzTt4jUL/bwkSClhJoZiDx+8zpjKQqSongVMWzEZAwylhGylLzlQ+83
         loZR6oW5jT2CgFNwuCEWae0XEgIQJGWslQV902yQC9YX3JoRkKx0tmCM02FXW0/kz9Em
         hGBPTPvzC6CCF2SmWu3QMEEmdXJFlrWO0ND1vnjS+yeis6mg1gwrt5ejgkpB27mRFLAB
         H6bGz2bdkYTmWwJUeKjY39oDJ0nltzjyT7nPNnK/Q+dqMDLY4/Nyz2dK9sJUVTTVKZe8
         3FtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEpF9b73g4FmtVz1cMPo6HykwhswdxGBx397HPxsPyKbLY2uCSxuxRtQEGp6er3CuFF0i4udHyg9u363Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFmf3dn1ZV/Cgqm8jl4yLZDAod5J1l9m8Qv0+wFUsoatq6cyeC
	9CzRz4vzdXhthUZktfqAbJYmzhRoJ9mdIROgG3rv663zs73nOpbLAqtatr1SbDrH3IuLXuWtQOR
	6AZ6sKLojm5e/fKnoy/8w612iwTDt6uNC6T+nbwd76kWfbmuYfuo4rP/u5kT81mDKAcE044EOlr
	ZPV08MZXwqOPE2J3Ct/IKeclzs3GFKuInmGqrJ
X-Gm-Gg: ASbGncvvJrTC+XMczu8pwi0xBuC1sjnlcjNYPnNGkzRAg5J+apxA5yLgr0E2NvgoC4E
	UJk29y4RP4qj/77nnQBWmTchA+KvjsMSUe+1sPaQo7K97CjJEkPKgrD2kgePfXK9mBG52Lw==
X-Received: by 2002:a5d:4e8a:0:b0:3a3:592d:21b6 with SMTP id ffacd0b85a97d-3a3592d2310mr955263f8f.15.1747306274684;
        Thu, 15 May 2025 03:51:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2JuuaqLPcVrNMU2tKqzE3FnfEFbJyyrBqjO7QtZCsTyzkpYvx/DeqzxIsGQwmYUSuVIl1ksSfIrz86qaed68=
X-Received: by 2002:a5d:4e8a:0:b0:3a3:592d:21b6 with SMTP id
 ffacd0b85a97d-3a3592d2310mr955248f8f.15.1747306274267; Thu, 15 May 2025
 03:51:14 -0700 (PDT)
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
 <CABgObfaEiMN=YANk02EWini+jAXU1MxSvo8_jYWaMiu3ds7hgQ@mail.gmail.com> <2f0fc8ef7d04c590893bd6d54a6c0c842c4b21d7.camel@suse.com>
In-Reply-To: <2f0fc8ef7d04c590893bd6d54a6c0c842c4b21d7.camel@suse.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 15 May 2025 12:51:00 +0200
X-Gm-Features: AX0GCFvGwWrUeVYJp0osm4NobblV0XdonG1jUigrUVjlVR-98uQyDG2aNENpGNw
Message-ID: <CABgObfZVbKcAua_=+C_0eC5Ec2ZDY4Bsz_b1memF1KifVGhoQw@mail.gmail.com>
Subject: Re: [PATCH 0/2] dm mpath: Interface for explicit probing of active paths
To: Martin Wilck <mwilck@suse.com>
Cc: Benjamin Marzinski <bmarzins@redhat.com>, Christoph Hellwig <hch@infradead.org>, 
	Kevin Wolf <kwolf@redhat.com>, dm-devel@lists.linux.dev, 
	Hanna Czenczek <hreitz@redhat.com>, Mikulas Patocka <mpatocka@redhat.com>, snitzer@kernel.org, 
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>, Hannes Reinecke <hare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 12:34=E2=80=AFPM Martin Wilck <mwilck@suse.com> wro=
te:
> On Thu, 2025-05-15 at 04:53 +0200, Paolo Bonzini wrote:
> > Il mer 14 mag 2025, 13:37 Martin Wilck <mwilck@suse.com> ha scritto:
> > Yes, as usual things are a bit more complicated. First, a handful of
> > commands are special (REQUEST SENSE would be for HBAs that don't use
> > auto sense, but that is fortunately not something you encounter).
> > Second, there's already a filter in the kernel in
> > drivers/scsi/scsi_ioctl.c for commands that are allowed without
> > CAP_SYS_RAWIO. QEMU is subject to that so the commands you'll see are
> > mostly I/O, INQUIRY, TUR, MODE SENSE/SELECT and that's it.
>
> Thanks for mentioning this. However, I suppose that depends on the
> permissions with which the qemu process is started, no? Wouldn't
> qemu need CAP_SYS_RAWIO for PCI passthrough as well?

Generally you want to assume that the VM is hostile and run QEMU with
as few privileges as possible (not just capabilities, but also in
separate namespaces and with restrictions from device cgroups,
SELinux, etc.). PCI passthrough is not an issue, it only needs access
to the VFIO inodes and you can do it by setting the appropriate file
permissions without extra capabilities. The actual privileged part is
binding the device to VFIO, which is done outside QEMU anyway.

> I admit that I'm confused by the many indirections in qemu's scsi-block
> code flow. AFAICS qemu forwards everything except PRIN/PROUT to the
> kernel block device in "scsi-block" mode. Correct me if I'm wrong.

Yes, that's correct. The code for PRIN/PROUT calls out to a separate
privileged process (in scsi/qemu-pr-helper.c if you're curious) which
is aware of multipath and can be extended if needed.

> Anwyway, let's not forget that we're talking about the kernel here.
> While qemu is the main target application for this feature is created,
> any application can use it, and it may or may not run with
> CAP_SYS_RAWIO.

Yes, but once you have CAP_SYS_RAWIO all bets for sanity are off... it
even lets you do SG_IO on partitions.

> > .Of the ones that aren't simple I/O, mode parameters and TUR are the
> > important cases. A TUR failure would be handled by the ioctl that
> > Kevin proposed here by forcing a path switch. Mode parameters might
> > not be shared(*) and would need to be sent down all the paths in that
> > case; that can be fixed in userspace if necessary.
>
> Passing TUR from a multipath device to a random member doesn't make
> much sense to me. qemu would need to implement some logic to determine
> whether the map has any usable paths.

As long as one path replies to a TUR and the host is able to
(eventually, somehow) steer I/O transparently to that path, that
should be good enough. If the one path that the kernel tries is down,
QEMU can probe which paths are up and retry. That seems consistent
with what you want from TUR but maybe I'm missing something.

> > Yes, the kernel filter is a PITA in the normal single path case but
> > here it helps not doing something overly wrong.
>
> This seems coincidental to me. Filtering by permissions and filtering
> for commands that make sense on multipath devices are orthogonal
> problems.

I agree (it helps, it doesn't solve the problem), however there is a
large overlap between the two.

Paolo

