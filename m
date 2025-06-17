Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D9B28FFE1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750201419; cv=none; b=kakkoAGFEMC45YHNEV3zkgs7nsP1kz2tsD1TtMLBSOMtLbLUFI+Wkqwgm2iykVefnUo8JdURIyUd2Ka6z2hNzgOMXMn64LIT6flX/rwiaXD3KZMpQu4avQuysGh9NrNKY+PKadNd2d9vBOpOnhCaSilbZHGWX7aY1qtf2TaurWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750201419; c=relaxed/simple;
	bh=7yQyAg9QQkikdevayCOR4HwJNpcyiWJT9okKkefa+HI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4JHC1b+ImMK/MoiYcp7ibhk2xxq0+GCtTskYp7GR8FWBH12tIBXNBVk88KJbtw0xwwW96/JgmprN+xjXBEtTDyP2yOvB5t6vqdcMyKDGCbyfKkRi+6BHPetp77Cf+raL5mshjFgK8PUAruq5F9MgPLAhrsgnpuBfHFHn1uCwCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Wa0KdzYe; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Wa0KdzYe"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d0a47f6692so696126385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750201416; x=1750806216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qeHg/OOZNjjpk2NyiVqmd4EaAAlIU7s30yRkT324JII=;
        b=Wa0KdzYeeAAOrbOYnin1foa9ylkbMquO1MYxtMBS2ENoxCtC3AIivyFCq4qWUEV3c7
         QAx0TO/J/BmMewyj4tEKatX2OFMKqmR+uOBDUXNoDlzG2A2vwH5INLhDZ7hgil4Q2w0Z
         JPTywtK/MlvSlCrGgwUZAVDgMXX8H/T1H+zFDm9FkY2hkUogXo55N5Mfv/oCRCkGqcG3
         Bmjk3mWdJI+JT2U6uq0blT+wTrU1XWfiAs5KujFBZEtr2RwPGp3W9zkWI47NIzO0O+6G
         O2+H/FOz+OSYzs1D5Wib7fcIf0KTRn1Fpz+LAByWy2h6nujBu/uMh6FrgPqFlNrI1TGP
         6xdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750201416; x=1750806216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qeHg/OOZNjjpk2NyiVqmd4EaAAlIU7s30yRkT324JII=;
        b=UxXWkpiOnojeQ49dAEVnDjFkKl3nSpXV2jcDOu95ICK1VcVQB1Z5KGHBOSTjNwDxQw
         Iw1lb+yrLEMLupibk61/g+FUKmgUciKz0UdPcLndNQlW9h+FCFT3FMft26Fx9AkAtYM+
         MK+JP3N6zteNTQzgNLpcloqdo+c+1W96F++Iq4vlcRLF6xvuQY69OJCfFs0Ad9fOH/CQ
         Ll2yRKgO0+kQ/oBhNXomoltMwkQPYyoJMr8AHL2p/VGJh/LjolxLXixYIIdqPDFUtcx3
         ylva1bDkNNNVSvlJLnLXMpGL4NDqEqBpvxMJqt5rpR/xtUJOJyshdXwku+fzB1pdwdaS
         XemA==
X-Forwarded-Encrypted: i=1; AJvYcCW5cs5kGLHRv32foYkt3PGiyjGGk17K40XMTXo7UoYuoo9Y5akT06ZPOBM3YDqsE+pb4IoU1Lj6ur9prNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXbp/Fx8MY5lIAm8pkwuR1EmsmA1/n+noKo6WUTq2HnZVvUnv8
	G6Buu9DBvXU8xanrY9POBn6INyGyur1P9Ir/NEzczIB6eAMQe5cAU2B+0Pp84Jda4xY=
X-Gm-Gg: ASbGncvrtg3CHhbIXWxwR87kZ0/eq6Zxrz7mqz931qHvFnOesd8SDoy8ybMOvsOY4iM
	4XjKkmbRDfyKB1iJ4V0NCXVYPI8aXRrn0mEBB5Oi4Px6WGTU2JBbZAIDzJzh+P7LbSfe0L8Mgbx
	TFw7uSR6rXAugeXGnpz8Z3oWzhcdPsdVOyIReKYO+3qrDE25YzEuvVoBiOMzBXcmKWBiuUizv+u
	GcHc0h6cLVd9oIw2J+9NOkh8Q6DtCH7p1jDDNf//hWMqhgIDx/6FhnpKtb/x3unJ0TO+i4DXIUS
	tT2lJg6bHU4hOlTsveMDrU/ZQMKI1t6XpfweTduDX8Su1NlL3XfICS8jFAF7QnU7CFkwRWhSQhf
	KHbrVFDxsYoHCaScuU0dG/ztmiOSFX+PkQ9BsHQ==
X-Google-Smtp-Source: AGHT+IG5E4/SL5wvb+OTW2Z6g1HmGu8oKyQFTaoQSeLjiG0Pk8NLxhD4sGUeZI2iyMgdjVlOfelwLQ==
X-Received: by 2002:a05:620a:404b:b0:7d0:9519:8329 with SMTP id af79cd13be357-7d3c6c09cb8mr2841621585a.8.1750201416029;
        Tue, 17 Jun 2025 16:03:36 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8eaca05sm705183585a.73.2025.06.17.16.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 16:03:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRfL4-00000006eJX-07UY;
	Tue, 17 Jun 2025 20:03:34 -0300
Date: Tue, 17 Jun 2025 20:03:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Alyssa Ross <hi@alyssa.is>, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev, x86@kernel.org,
	Spectrum OS Development <devel@spectrum-os.org>
Subject: Re: Virtio-IOMMU interrupt remapping design
Message-ID: <20250617230334.GJ1376515@ziepe.ca>
References: <>
 <a65d955c-192b-4e79-ab11-8e2af78b62af@gmail.com>
 <20250616132031.GB1354058@ziepe.ca>
 <20250617154331-mutt-send-email-mst@kernel.org>
 <20250617195720.GI1376515@ziepe.ca>
 <20250617160103-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617160103-mutt-send-email-mst@kernel.org>

On Tue, Jun 17, 2025 at 04:01:53PM -0400, Michael S. Tsirkin wrote:
> > On x86 you also need to use remapping to exceed the max CPU count that
> > can be encoded in the MSI, no iommu required to need this.
> 
> More of an x86 quirk though, isn't it?

Yes, but so is bundling IOMMU and remapping HW together <shrug>

GIC fully integrates it into the interrupt controller architecture.

Jason
