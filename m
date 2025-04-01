Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBCA1F03E0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 23:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743551549; cv=none; b=nn2l0NY8apYFUSk/BoxejGmESwre4+3Drrakbn1spbPHiiqYMi0J9htPFen/8H2KeT0nXYWX6svqhKpsBhajBAc73oN+6UXpScKYIJZZyLl14nBaOFQLR4iOSZ72qCI5/byhAmLw6fGIbrrHefXB8TPvW+LSlhgn/In67Ry9Ad8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743551549; c=relaxed/simple;
	bh=YYL2PomV7Wu38rtkFqtGhC5SoQ4c0BSU2ef03OWtv58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRFJM4RK4ubx1u1conS9GEb06Q0Tn66ugBZOWlFAOatnZzHd5+mhxB8O1zEFRMCRC/t4y4Ro45D390O20lkTf3ER6e8/F5U2+4LK71ZvTvYqR6UnPBjY4mKXnQmcj3k2GvPqbQIEKty199R9EieIUIWROvk5gFPYaxVXwUAu1Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=KBWz3dIa; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="KBWz3dIa"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c54b651310so771379785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 16:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1743551546; x=1744156346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uyEGExp4aQ8ye3lQnl4hQA9KbHk9+lBhnfulegXkqOo=;
        b=KBWz3dIa2nCqcVFohXYGlA+K5gYapTEjnW/Wd/Q1U4hL9cFrb/thmOquVaJOTYO2sC
         EV1RmrTAqRxqaNklKCLonfasjbYV2e3+w3MhmnFtuGCjkUJK4zklYzsg6Q3fUbTkOzLs
         pr+OVNaQF7TDQqn1HG1B4I1BMO/byBGsRpxDf0qQJfsDvHqAcFqfXivlRHFIqKmhoXGW
         2j+N2GlqTYjF5OG4/7/p/dwqqB9ZBOFUlxIhQ5DWEcxIaWvGyDB7ZcfHLPZXelOqmi0N
         UfoxHK5T3VwgsLS/d6OEVlH/Wj8MSNmVKg/90pbhbgO80KVymQw74waCbjl7uStSzlJ3
         rn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743551546; x=1744156346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyEGExp4aQ8ye3lQnl4hQA9KbHk9+lBhnfulegXkqOo=;
        b=wyuVqbzvJjIz4xvhVNKfC+ClOzJZixxxiA1Q+2PUHjVVfilub9Fs/OLdD6blO9mv/q
         Gjo96N8+8YWuOY0hMtrZx0WEcs96yScDZrOv+2BxKYetyFHbyFHvREpVlFWU4lhZ+VRP
         1fplqZYII/QOElk2WxGu7tKqnuT9kJBTn3BcdopOU9wjDpc5qwp+AgmKrgQ3OGifIJJ8
         0IbW1QcbZbVKYhkp/7XCCY08OoL2vpKKHkEdgxwXmhgP0iY306SILngbi68SkL0KC17Y
         s/LuCfsvBGSC0IuBuSkDNj6SMlnpp/nY8KdYKrMPFiolaZzXPvGNpgOf5ibQaKFx8X8C
         teHg==
X-Forwarded-Encrypted: i=1; AJvYcCXz5pfNVzOO2dAHEmP5JrB15GmOhWYJNcG/ZVoKxattgQmvzOpPebxO7G0gRIGhlTUcvhDs5bK47JpoU3M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2THigUAqXi1Kh0+CwBGMYjFVU5x5fYy6gJr5Do5CE9+MmRTeE
	1S2KVa2WJCYsNTh/TvNfma8fgjywRtyRuYs9F8jmqw/yahZti5Mg4ydiC0TuWhk=
X-Gm-Gg: ASbGncvxji5PtaJJ8dn/AMPUtE2CRxMPbLsUeoeFTYueglET6DrA6Z2aJGf/eZGo8BP
	bHS9LXhflk2gzTg7SwBBi51gBS5O1+1fnVoEbK+FFwMUt1xONlkh6tIU7VZPh+Wkv6MPefaQBVq
	+U0rzTeH0xwG4M352y8N8xrZTtqi3oEmRK1jJbwMuXxVzwzurODCiK1bQltwoWnzijaD6sGC2wh
	lAig9ZGDbpoBY9nt0VVHHouu5G/H5NSyzFxQCouZk16Bf4e9lS/+XdhdpcFw85Qhg4MM8qLYp2W
	vh3Yp1kij4V12XSGFN8uGES5fmazqh/YDS2MtRAoRP9MqtzV1wUfA5082v3YaeBzXnoxffmKdtX
	38aVc/RlhDQkVI5DwQdH0mGg=
X-Google-Smtp-Source: AGHT+IFJv2VKJVF3sJgYhhzA9FBYArmfZ7PXOj7cyhcrSMi7zm8et7dAkTfcteGLdGyLQRUjbmM7+w==
X-Received: by 2002:a05:620a:4452:b0:7c5:6140:734f with SMTP id af79cd13be357-7c69071a80dmr2026357485a.18.1743551546641;
        Tue, 01 Apr 2025 16:52:26 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f777e02bsm720145285a.110.2025.04.01.16.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 16:52:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tzlP7-00000001SiZ-1Xz1;
	Tue, 01 Apr 2025 20:52:25 -0300
Date: Tue, 1 Apr 2025 20:52:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Wathsala Wathawana Vithanage <wathsala.vithanage@arm.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	nd <nd@arm.com>, Philipp Stanner <pstanner@redhat.com>,
	Yunxiang Li <Yunxiang.Li@amd.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	"open list:VFIO DRIVER" <kvm@vger.kernel.org>,
	Dhruv Tripathi <Dhruv.Tripathi@arm.com>,
	Honnappa Nagarahalli <Honnappa.Nagarahalli@arm.com>,
	Jeremy Linton <Jeremy.Linton@arm.com>
Subject: Re: [RFC PATCH] vfio/pci: add PCIe TPH to device feature ioctl
Message-ID: <20250401235225.GA327284@ziepe.ca>
References: <20250221224638.1836909-1-wathsala.vithanage@arm.com>
 <20250304141447.GY5011@ziepe.ca>
 <PAWPR08MB89093BBC1C7F725873921FB79FC82@PAWPR08MB8909.eurprd08.prod.outlook.com>
 <20250304182421.05b6a12f.alex.williamson@redhat.com>
 <PAWPR08MB89095339DEAC58C405A0CF8F9FCB2@PAWPR08MB8909.eurprd08.prod.outlook.com>
 <BN9PR11MB5276468F5963137D5E734CB78CD02@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20250401141138.GE186258@ziepe.ca>
 <PAWPR08MB8909781BE207255E830DE1589FAC2@PAWPR08MB8909.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAWPR08MB8909781BE207255E830DE1589FAC2@PAWPR08MB8909.eurprd08.prod.outlook.com>

On Tue, Apr 01, 2025 at 11:38:01PM +0000, Wathsala Wathawana Vithanage wrote:

> > Really we can't block device specific mode anyhow because we can't even
> > discover it on the kernel side..
> 
> We cannot block users from writing a steering-tag to a device specific location, but
> can we use a capability to prevent users from enabling device specific mode on the device?

qemu could do that, but the vfio kernel side really shouldn't.. There
is no reason vfio userspace on bare metal couldn't use device specific
mode.

Jason 
