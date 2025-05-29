Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0E28635C
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 04:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748493094; cv=none; b=cMPYO8Yp60XOTZLqMpWOZCkyO1I48w1dw90lJ5B3r1IBL5yNwEdz8SO855BLMhHcEzljAd7i5EM6fIVvIIo00kC306S513k/VpFlxUlsHR17Wi8/47NuP4HUzSWx6wlkErqhWnpwMcuyp22DdnsMkVQER01jv3zTMogdlw+UnmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748493094; c=relaxed/simple;
	bh=7zYJ5r2anCAN+UcUG4V3nTPVwMsW8DRoqrhx23/0IgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQEY8h8jHkck/vFFGEb4ZHp4kpsKQHL6IFL6vkw3Hrv7IwDe7VGMpCwfrNX+i+k2xMzaco7tm/maSZ4Tuor+t63HCzNOqUCB6IHAeSD2I1YpX/YvX+Gu3SiBEGvKvDS6sf5vm4/RkAhkLofqbf0Gv63H6X3Q/l1YeRF3AgLxyYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=iM8ZqWT7; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="iM8ZqWT7"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-742b0840d98so269083b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 21:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748493092; x=1749097892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2o+2tHrbcVdORj49S8NV86zMTS78meAi/ActS4n4zg=;
        b=iM8ZqWT7TV81QxxUFaZKVu9ot2sk4JPtGW8OumC9qshPX1HjoIm0hnUulOxX0tRDMc
         AavjXMVN3zlUAW7H7RoN8hReEFuO5dcZeeUCcTO7aTry+z1YdynvNjmepTXsZFwRlj5f
         R6AOoBohwegonF1EFXVOW7nVG8XBGCfeWQw7rPJnNv9vkESQHthFeljIwCJUPrBCE92K
         yOzv17e3Kp0ySqyfHrR9Q+EZeVEZbdfEZRIdt1eKzAWgmyliFpv0PS8ZWBMGCNgB7yxZ
         4LQTakiKuRE51HHyHUI7RxZqXHTu9g8cB2u83AAGHLgSTsrdlKVPYVM8wlUgnR86lJfh
         MlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748493092; x=1749097892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2o+2tHrbcVdORj49S8NV86zMTS78meAi/ActS4n4zg=;
        b=EZ8fsrXUL14yaaWW87OISw0D83duvME/1MzPrurXPs1S+1BNsrTGS1yjrjrQf+/bfw
         PwdthFgfU+t7mNtgnv1ZxWj/n8Urz7qLvdYbf4Qi5a484duI8cnR7edSRZ48oLroQTFA
         YHZL5VY7MEVtn8H3duhdaftwyjlqn7fqt3c4HJiFYB1z2Qr2ypzpAoIKbSEOywJUbij8
         Ktq7d7OATAgtXoHE1eqb4z6HAqz/AFmkEVjmbiGcLnSwsxPpitaoBByb5prxPXFkoA4I
         v9DAKjjDzWZUvC6FKrl7wcTj1E0AfIRsYFYYoql6DYKQ5j2HNveKY4+P4u3Ao/d0t2y3
         KHWw==
X-Forwarded-Encrypted: i=1; AJvYcCW6abK40b0paVCtb7VYkAAbz2sgvEBTJDCaM6i4fSbABDy5o4Qyv7lm7Ytv+K+M1sRhNf86nceirKrqq/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7k/Z2zEqPsSo4p8ikHESazUsuJ3dd6KQbT/3aa99XP0pKA0Ls
	lOmwtQFxsuXvcRgGjcdwq2F2TxobaNh9QJNXqKuTACDoHwCwwmxE3w03Dlw3QapGq/I=
X-Gm-Gg: ASbGnctCN3qkR4VmUt7w6hXzgEPB0zrALfZsQUgWyRFCFM2DkySUHm6TQTbPsq9RxQW
	mgjBH79fthCvL8KwIr3XR9MS1PMNkVPOnGFLERjgK+lRIU94XJWYU1qoxwMRfTu8C9SLWbPXaWw
	0bI7n37ODQ5k2vwvsWyBxbm9vZS2r6RzzxhmuGTZw1tWnhJcVvH7wTg81nvb/OaRTMxcVfpgeHa
	lxWtwzes1zDjhT5wDEWazBVRHUkc9FqqAAtNqPPKaPoF+EQ57HXmHkMdXDwl8TGuKsLd2enEmSa
	Nfa7F3/IALLzSfSODl30kSPEu5eajYmFdqG3tANQUmss3nTN1uVSrlTOJ5KB3BzSSqNQ0qdy0Hd
	HGlo=
X-Google-Smtp-Source: AGHT+IE1BY+5uXy2u0GwajwCh6OtDltmjtBMsqeuIsMxRA/YNF3XfoU+Uv4IEITyJ6u3Metnixo/xA==
X-Received: by 2002:a05:6a00:3c83:b0:73e:1e24:5a4e with SMTP id d2e1a72fcca58-745fe03d5c5mr33068343b3a.24.1748493091760;
        Wed, 28 May 2025 21:31:31 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.11])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2d99e1b72esm1650449a12.20.2025.05.28.21.31.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 May 2025 21:31:31 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com,
	jgg@ziepe.ca
Cc: david@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com,
	muchun.song@linux.dev
Subject: Re: [PATCH v3] vfio/type1: optimize vfio_pin_pages_remote() for huge folio
Date: Thu, 29 May 2025 12:31:25 +0800
Message-ID: <20250529043125.30478-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250528140941.151b2f70.alex.williamson@redhat.com>
References: <20250528140941.151b2f70.alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 28 May 2025 14:09:41 -0600, alex.williamson@redhat.com wrote:

> On Tue, 27 May 2025 20:46:27 -0300
> Jason Gunthorpe <jgg@ziepe.ca> wrote:
> 
> > On Tue, May 27, 2025 at 01:52:52PM -0600, Alex Williamson wrote:
> > 
> > > > Lots of CSPs are running iommufd now. There is a commonly used OOT
> > > > patch to add the insecure P2P support like VFIO. I know lots of folks
> > > > have backported iommufd.. No idea about libvirt, but you can run it in
> > > > compatibility mode and then you don't need to change libvirt.  
> > > 
> > > For distributions that don't have an upstream first policy, sure, they
> > > can patch whatever they like.  I can't recommend that solution though.  
> > 
> > I appreciate that, and we are working on it.. The first round of
> > patches for DMA API improvements that Christoph asked for were sent as
> > a PR yesterday.
> > 
> > > Otherwise the problem with compatibility mode is that it's a compile
> > > time choice.  
> > 
> > The compile time choice is not the compatability mode.
> > 
> > Any iommufd, even if opened from /dev/iommu, is usable as a VFIO
> > container in the classic group based ioctls.
> > 
> > The group path in VFIO calls vfio_group_ioctl_set_container() ->
> > iommufd_ctx_from_file() which works with iommufd from any source.
> > 
> > The type 1 emulation ioctls are also always available on any iommufd.
> > After set container VFIO does iommufd_vfio_compat_ioas_create() to
> > setup the default compatability stuff.
> > 
> > All the compile time option does is replace /dev/vfio/vfio with
> > /dev/iommu, but they have *exactly* the same fops:
> > 
> > static struct miscdevice iommu_misc_dev = {
> > 	.minor = MISC_DYNAMIC_MINOR,
> > 	.name = "iommu",
> > 	.fops = &iommufd_fops,
> > 
> > static struct miscdevice vfio_misc_dev = {
> > 	.minor = VFIO_MINOR,
> > 	.name = "vfio",
> > 	.fops = &iommufd_fops,
> > 
> > So you can have libvirt open /dev/iommu, or you can have the admin
> > symlink /dev/iommu to /dev/vfio/vfio and opt in on a case by case
> > basis.
> 
> Yes, I'd forgotten we added this.  It's QEMU opening /dev/vfio/vfio and
> QEMU already has native iommufd support, so a per VM hack could be done
> via qemu:args or a QEMU wrapper script to instantiate an iommufd object
> in the VM xml, or as noted, a system-wide change could be done
> transparently via 'ln -sf /dev/iommu /dev/vfio/vfio'.
> 
> To be fair to libvirt, we'd really like libvirt to make use of iommufd
> whenever it's available, but without feature parity this would break
> users.  And without feature parity, it's not clear how libvirt should
> probe for feature parity.  Things get a lot easier for libvirt if we
> can switch the default at a point where we expect no regressions.
> 
> > The compile time choice is really just a way to make testing easier
> > and down the road if a distro decides they don't want to support both
> > code bases then can choose to disable the type 1 code entirely and
> > still be uAPI compatible, but I think that is down the road a ways
> > still.
> 
> Yep.
>  
> > > A single kernel binary cannot interchangeably provide
> > > either P2P DMA with legacy vfio or better IOMMUFD improvements without
> > > P2P DMA.  
> > 
> > See above, it can, and it was deliberately made easy to do without
> > having to change any applications.
> > 
> > The idea was you can sort of incrementally decide which things to move
> > over. For instance you can keep all the type 1 code and vfio
> > group/container stuff unchanged but use a combination of
> > IOMMU_VFIO_IOAS_GET and then IOMMUFD_CMD_IOAS_MAP_FILE to map a memfd.
> 
> Right, sorry, it'd slipped my mind that we'd created the "soft"
> compatibility mode too.
> 
> Zhe, so if you have no dependencies on P2P DMA within your device
> assignment VMs, the options above may be useful or at least a data
> point for comparison of type1 vs IOMMUFD performance.  Thanks,
> 
> Alex

Hi Alex, Jason, thank a lot for your suggestions. I will try to explore
the usage of iommufd in our scenario. I also hope that the P2P DMA patches
will be merged into the mainline soon.

Thanks,
Zhe
