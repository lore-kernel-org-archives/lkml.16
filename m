Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EBB295D89
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 06:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747289679; cv=none; b=tonEE2ZbnkDQOGKeowk561wI4cgTDBMJ723h0ZG7VX1VawS+s8nZ3ub9lScH1H8hSE6UmpOpq4/pEAT2Xb+gpRubSln8IVgqOEb0k48jN4HmCyKiBpeb4ThI/giEaRaudmcVlt/UuAERD05CvoMuMXigL/Bbs6pGmq/4GW3yOYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747289679; c=relaxed/simple;
	bh=GHX8SKnuRhPHg4JVM24oLTd/BzpBHMkfXNZOoDsAupc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4W+km5NAraLQ6zznDtBB2bC/PWDUYGUG5EqIb7hQxwM9k/BeJLEp7nMaeVy1XJ8o/dycGRjEn43xlU8Hm1JCZ5o7oE9ZETW6dDViBcwL+ijXZtzrh+PucYEIrL+6jJUdfVUTUO2lWj8AebmpOHudYI0oFA9MxbwYyg9WNeqIz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JjiT3WgD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JjiT3WgD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747289676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O0+9WuDoVK7seiIekMPOn5cFsp2sTkD5ZfvmbgrYAn0=;
	b=JjiT3WgDVFVylFVRhxTCCWIFpZTWFnNZfOiVQH5cF9SF12jYaCAhgoUO1dE0o6RopSZr1B
	ZzuJTJz5lQrsvYMmfmeI+Canam9WLNPZMeyo7cVH1ArD/wzMstywH/BLIhSVzbnvn0m93M
	IlOjnWZGLp9x1zVDhP0NMezoMRNKCb4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-MF-wgKswPtO8f7zm10Iutg-1; Thu, 15 May 2025 02:14:34 -0400
X-MC-Unique: MF-wgKswPtO8f7zm10Iutg-1
X-Mimecast-MFC-AGG-ID: MF-wgKswPtO8f7zm10Iutg_1747289673
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-442cdf07ad9so3001135e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747289673; x=1747894473;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O0+9WuDoVK7seiIekMPOn5cFsp2sTkD5ZfvmbgrYAn0=;
        b=QITBhprHEfx2jTVqMynwXc8wa10lRQC3lRVLTPC9dqaX3GdPuzX90Ct/R2JW8DYWnd
         x5YdrY80ad4SPPT4jTJmCfcWaw2SR2MIx0Udk/pIwghubFa4ufly91y+2VYrcsh5ltRT
         Ep2eQKkFahvWIsbePIDW9axtZIew9zVKY8qpnZIonOfnei0agkmrc9Gcq/sIpVWZu8L+
         HkbRFAaxDu7DrRurBZ+pxvsIit5Lztb2CzW8U3xQvqElu7FxCtr2kEDSBY0W//ZxlUlV
         SkPEz+BsMQhID9YtLRCr7uXWsh0PWzHlY2eX1OYqVnreDYRm9JVqagfu1oU0KiWOLU1X
         f+Og==
X-Forwarded-Encrypted: i=1; AJvYcCWE+xCd9DBQGHMrgYIa4ge5S3p3fPJf01yoB4cvTdNPYPciMHutx1Bu2NuOoE4ixpFW4fhoDqHDdH5cy30=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4tBxaOjOdgttiFfUVwE6hIsHuLAX/ppkzpSeffDKeATHSmQ1j
	iz8lQvIhaUVoTEs1uSw4KYDmrJ+R1aWplUP/zgAiP+qz5Rxz26yDXLnkcj3gxzBsdq5mwssprVf
	nWtg68EPRXGzxp7396zDE+XsDgS53EwZ2M53oxHq/6IzFaYMtiObXnMP2ZyojeQ==
X-Gm-Gg: ASbGnctPLje5ObsixULwg7W0k6VDp5OyWR9+KAz+8qw4LBYU3wjuVF45F+lhJ3MHmOf
	S6gkleS06Md8S2JWUHYrN70xGk08AVSvLnNtYn6JPnUUsW1pzzHmp/lC2xxPFZF7CntT388rL7M
	JJEO/d4kQYittI61WnWxyFI4DzDFwsXCOUYrA3d4X7HcArwzqjr9k0+GHr1xx45gMM2gyFC8lcs
	sUdw05Q48rSMlS1nbxENzfYyYROJhFIBrn7pNYuTFTHgvMz+yvqE2maR9jRz5loqnwEL4kJ8n7G
	nVAmwQ==
X-Received: by 2002:a05:600c:8289:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-442f96ebbdcmr9335005e9.14.1747289673391;
        Wed, 14 May 2025 23:14:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3PEe9C8rgBo0TvQnY3+NCOLyFxB24dQVnG16aVk1y3CI+MSZSiHnCWnpwcLn7wNlLIVXpyg==
X-Received: by 2002:a05:600c:8289:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-442f96ebbdcmr9334755e9.14.1747289673051;
        Wed, 14 May 2025 23:14:33 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39e8578sm57255445e9.29.2025.05.14.23.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 23:14:32 -0700 (PDT)
Date: Thu, 15 May 2025 02:14:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Cindy Lu <lulu@redhat.com>, michael.christie@oracle.com,
	sgarzare@redhat.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: Re: [PATCH v9 4/4] vhost: Add a KConfig knob to enable IOCTL
 VHOST_FORK_FROM_OWNER
Message-ID: <20250515021319-mutt-send-email-mst@kernel.org>
References: <20250421024457.112163-5-lulu@redhat.com>
 <CACGkMEt-ewTqeHDMq847WDEGiW+x-TEPG6GTDDUbayVmuiVvzg@mail.gmail.com>
 <CACGkMEte6Lobr+tFM9ZmrDWYOpMtN6Xy=rzvTy=YxSPkHaVdPA@mail.gmail.com>
 <CACGkMEstbCKdHahYE6cXXu1kvFxiVGoBw3sr4aGs4=MiDE4azg@mail.gmail.com>
 <20250429065044-mutt-send-email-mst@kernel.org>
 <CACGkMEteBReoezvqp0za98z7W3k_gHOeSpALBxRMhjvj_oXcOw@mail.gmail.com>
 <20250430052424-mutt-send-email-mst@kernel.org>
 <CACGkMEub28qBCe4Mw13Q5r-VX4771tBZ1zG=YVuty0VBi2UeWg@mail.gmail.com>
 <20250513030744-mutt-send-email-mst@kernel.org>
 <CACGkMEtm75uu0SyEdhRjUGfbhGF4o=X1VT7t7_SK+uge=CzkFQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEtm75uu0SyEdhRjUGfbhGF4o=X1VT7t7_SK+uge=CzkFQ@mail.gmail.com>

On Wed, May 14, 2025 at 10:52:58AM +0800, Jason Wang wrote:
> On Tue, May 13, 2025 at 3:09 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, May 13, 2025 at 12:08:51PM +0800, Jason Wang wrote:
> > > On Wed, Apr 30, 2025 at 5:27 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Wed, Apr 30, 2025 at 11:34:49AM +0800, Jason Wang wrote:
> > > > > On Tue, Apr 29, 2025 at 6:56 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > >
> > > > > > On Tue, Apr 29, 2025 at 11:39:37AM +0800, Jason Wang wrote:
> > > > > > > On Mon, Apr 21, 2025 at 11:46 AM Jason Wang <jasowang@redhat.com> wrote:
> > > > > > > >
> > > > > > > > On Mon, Apr 21, 2025 at 11:45 AM Jason Wang <jasowang@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > On Mon, Apr 21, 2025 at 10:45 AM Cindy Lu <lulu@redhat.com> wrote:
> > > > > > > > > >
> > > > > > > > > > Introduce a new config knob `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL`,
> > > > > > > > > > to control the availability of the `VHOST_FORK_FROM_OWNER` ioctl.
> > > > > > > > > > When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is set to n, the ioctl
> > > > > > > > > > is disabled, and any attempt to use it will result in failure.
> > > > > > > > >
> > > > > > > > > I think we need to describe why the default value was chosen to be false.
> > > > > > > > >
> > > > > > > > > What's more, should we document the implications here?
> > > > > > > > >
> > > > > > > > > inherit_owner was set to false: this means "legacy" userspace may
> > > > > > > >
> > > > > > > > I meant "true" actually.
> > > > > > >
> > > > > > > MIchael, I'd expect inherit_owner to be false. Otherwise legacy
> > > > > > > applications need to be modified in order to get the behaviour
> > > > > > > recovered which is an impossible taks.
> > > > > > >
> > > > > > > Any idea on this?
> > > > > > >
> > > > > > > Thanks
> > > >
> > > > So, let's say we had a modparam? Enough for this customer?
> > > > WDYT?
> > >
> > > Just to make sure I understand the proposal.
> > >
> > > Did you mean a module parameter like "inherit_owner_by_default"? I
> > > think it would be fine if we make it false by default.
> > >
> > > Thanks
> >
> > I think we should keep it true by default, changing the default
> > risks regressing what we already fixes.
> 
> I think it's not a regression since it comes since the day vhost is
> introduced. To my understanding the real regression is the user space
> noticeable behaviour changes introduced by vhost thread.
> 
> > The specific customer can
> > flip the modparam and be happy.
> 
> If you stick to the false as default, I'm fine.
> 
> Thanks

That would be yet another behaviour change.
I think one was enough, don't you think?


> >
> > > >
> > > > --
> > > > MST
> > > >
> >

