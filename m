Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D322EFD88
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750194847; cv=none; b=grqm1Evd4nT00RxF0+jPavaT23p43Tl7A359nnHYGPvQBS2M0EPaYZHmkqFyY8Hy3YdjqWdbgnFJvyowSEiVNnJ+LomdpDXxB+Ao9p2x+ymc+kwJo/tBxcPHMDaqutPYsUbpAH1FDZ56QDpnjrsSHvB/8rLyLSxTNry+alq3fDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750194847; c=relaxed/simple;
	bh=SrRpeaxXNGWfFb/1PTz2R6YEk4t6TG0fvw2R3i9KdSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADKREi8QCoDGjV1Xbty4AmgeQzw6IqdMLIPAXksEauiGF8jpWv+dFcJpwQiA5jw0D/NyoJdkRkqn/frQxd5KgbRzwGTYH4nSCCZxpnmPjzzoFgbEva6YiysBNgUqCDCuCmSHBjWFdMwxvIfc8RDyrGfTLFxSZiA9I7zZ78FF/2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WrI4WpNC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WrI4WpNC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750194844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5xyVcI21nsfxdfOvk8Q+hN3uxkhpR2sAV2MrhUYOX6E=;
	b=WrI4WpNCcLyDDcGVcuMCVmrV/PKgMJCmP7/Cjm/w3uoqZ5zDRQYrE6qmStP6ru23BI8Yhu
	gk9vrSIrOzkvP+KMC895E02pP4ZxPleazBTgisYjJ/sla/2FeTr+6XhcDd2nQvkZfFpCeH
	Y5J4yEV4cHgTMYv9LfLl0AT86/YfFnI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-iCaOQ-duMfmYCOppV-QCXg-1; Tue, 17 Jun 2025 17:14:03 -0400
X-MC-Unique: iCaOQ-duMfmYCOppV-QCXg-1
X-Mimecast-MFC-AGG-ID: iCaOQ-duMfmYCOppV-QCXg_1750194843
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb1c6b5ea7so94461876d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750194843; x=1750799643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xyVcI21nsfxdfOvk8Q+hN3uxkhpR2sAV2MrhUYOX6E=;
        b=XcWTKARhBFo0fwIxXci/XQp/SS7CW1JKBBzL8iq0vbr2WQVOxVgp5G/y9IoH7tswnR
         n1NXijXpUyaNbjSkLWGEOjhuwWC60+ThzNs58KTLKEuMaa3TX1ZFIYwoblhs6xYjIZCD
         6a/ML1QuopJPhcU1uOM212Bh3AYkbHUOecJLJbhdWmrFBUwPqperUJLkKwGw4b9gzmX4
         TabXVhmP5HZPVTpL1woDoWWm5c3fqjnH9tZybvA6hvK4qqisFbV4hNldgLSRtXrn7tvU
         hfblBZKxrfGQyKL0sCXrmTrk2qo8mFFybLPRD/40b5O6iOowEJiIv/KFGH2rxs8cpwRy
         FY/g==
X-Gm-Message-State: AOJu0YxxlYhRbuYM0xEM0XLsY1+dR4H3ZtIhuKH7I5bf+ODKp8mrjRIJ
	UIllzy+z+VEwwR1oJ/+5qSoVlzn4EjEthFHZPcsfm3uCB2SK2qY9anUKcopUVyE3CJYVii2cGb9
	vg6ArO/lCIKLBNsIWY2Kf0QCqklJ61zAAEx9ZzSw3kEwtzAf+Ni5RjtY3r8EZ1uM7uA==
X-Gm-Gg: ASbGncvxJyeEcO8nnDKfohYTKt/w1UlBDg+RE2hDrpR9sWApJQjAjh1CNm7kXEOJtev
	ZMzmLQMs3xdxkLi2jEqzKta0ziFIKjS2xLUZsHPJx03pyHExyHMiRZQuH3GCx5hgdRbI9+WTfdI
	ACTAwgnZiES0GrituH9SBH2rtr8N666RpuUlK9xZtPjHLP6Wl5IYieN0yx13bENNwJYyVSG7dtz
	gfRtLKQR4p/15TRi4MSeSRWm84tqXWszBMOH2VEo4dgrGg5qxPkpRnTQpF9IhzVBgCSq/p+ZE2g
	pCv5ul4Pd2c3cA==
X-Received: by 2002:a05:6214:5c47:b0:6fa:fddf:734b with SMTP id 6a1803df08f44-6fb47778883mr208411066d6.24.1750194842855;
        Tue, 17 Jun 2025 14:14:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd9iW2NHB23PfBNcvXV74RskpHtC25owk7vFs1c30i5QjvUnprzErLHz+PlrbZV3IBT1BdGg==
X-Received: by 2002:a05:6214:5c47:b0:6fa:fddf:734b with SMTP id 6a1803df08f44-6fb47778883mr208410726d6.24.1750194842564;
        Tue, 17 Jun 2025 14:14:02 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8f2c4d3sm690671485a.116.2025.06.17.14.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:14:02 -0700 (PDT)
Date: Tue, 17 Jun 2025 17:13:59 -0400
From: Peter Xu <peterx@redhat.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Alex Mastro <amastro@fb.com>, David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>
Subject: Re: [PATCH 1/5] mm: Deduplicate mm_get_unmapped_area()
Message-ID: <aFHal-sGQfrdpztL@x1.local>
References: <20250613134111.469884-1-peterx@redhat.com>
 <20250613134111.469884-2-peterx@redhat.com>
 <20250616090134.476427c0@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616090134.476427c0@pumpkin>

On Mon, Jun 16, 2025 at 09:01:34AM +0100, David Laight wrote:
> On Fri, 13 Jun 2025 09:41:07 -0400
> Peter Xu <peterx@redhat.com> wrote:
> 
> > Essentially it sets vm_flags==0 for mm_get_unmapped_area_vmflags().  Use
> > the helper instead to dedup the lines.
> 
> Would it make more sense to make it an inline wrapper?
> Moving the EXPORT_SYMBOL to mm_get_unmapped_area_vmflags.

Yes, makes sense to me. However that seems to be better justified as a
separate patch.

If you wouldn't mind, I hope we can land the minimum version of the series
first without expanding too much of what it touches.  I already start to
regret having the first two patches, but since I've posted, I'll carry them
as of now.  Please let me know if you have strong feelings.

Thanks a lot for taking a look,

-- 
Peter Xu

