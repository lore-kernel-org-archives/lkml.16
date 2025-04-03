Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A92E18E050
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743665495; cv=none; b=owG6/l1eJZORJmJDcJg2yQV2dbcMlbwfa/3Zz3VZb7NT5dY4eVfXwnfCAR1D9oSu2t6Vr3HAFBYsOt1e3xHjFET85BfltEikWp7N8Q148A7OzPJNZpDkTHf9yuRHu7PSJYzs1uF65KGGFKE+NtbiStrDh9SucAJTpC2BUzx27AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743665495; c=relaxed/simple;
	bh=gadWXU6eh61A4qPirA1UOUEnFFW8TKcydrcWHCVIMo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJu+ecxSawow91qudSNfFmyTcZAyYW+1HNlYG3aymABTTjU+9yAlDr5p10HKIUdr1rIOmEO4qqSFkqvvvnXwbElN1hGu/nre/aoz6VDOkntimzFs+51Er8lkOSODI1rYDnzlWlMSKB00uc+2zUlvPpxNNGRd5AJNDeQesw9mTS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IVeDKWEl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IVeDKWEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743665492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cqLi9hga+rUbDTsLYNtIpJzcY52jbaY8MlNYMQISxiY=;
	b=IVeDKWElhD9tc9P0WQxulYZlNQLGKzSpsgVYtkYBfR0KFE5z6sjl9ey+22s/u9C+sMuT+1
	yY6so4+abXXm0DdbnhaTkLCGJLPzNIW1vVO7UJ37XdbkUOjzlGwFWYUtpq4IMUJ6yodvrT
	gdS8O2LP+5QBr+kxSPH2Nlp3pJXlI2A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-ZPKCy5ESPlSdagP_mma8CA-1; Thu, 03 Apr 2025 03:31:31 -0400
X-MC-Unique: ZPKCy5ESPlSdagP_mma8CA-1
X-Mimecast-MFC-AGG-ID: ZPKCy5ESPlSdagP_mma8CA_1743665490
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39c184b20a2so293060f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743665490; x=1744270290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqLi9hga+rUbDTsLYNtIpJzcY52jbaY8MlNYMQISxiY=;
        b=aji9PSzoWU05YmfUMxbLN26yiUJF3/+FipMuHGm+0aC+kEe3e+x9644pus+6/pgRAs
         6iSArAZCA1oO72tWIDuAIbuYUdZIGrMGlBdtuOdmpP3nR5GMyW/5YDGlbYRbm7AtS45e
         sXewgTbUdRez+XI0yyXH+h01OnM69dycGWjrRCaK6Zg399RBUhJVeZg3zz574MRUZkFP
         HYb8qNl0NFJ7jBd2S1zmHsU/Dwq7yOo4JJDf464Ek1HDxcHIXFkvVNdmr9ty8iU7tiCM
         YzhvWUn875D3cnCuXxwmHiVLc9OX2Jiv46VmrV9b9WoOF4GESsccaigtGT9W1txX1+od
         TVNw==
X-Forwarded-Encrypted: i=1; AJvYcCVtNqrW9W/NHhqCH5PyDQ8cu7in8/OAjGI9/F+mQStl1/nl3LXTuwWaNm0umK9QZ6nMoPHwOagU6KHMWig=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA6HZ7wZQxbdOr8yt4wz6+FbeES5cNiIC9auC6SYqsIayial7D
	10DUp2FEKHLkK3hEuXCh+TUMjQTt/TYbVFQsG0h4Z8E/7BkFwozSw3cY2BJer5tCEqcqF0f3Wsy
	D7/XynNifPyd/t3UyaV5X/m3ZkHkn05xaPV3poIfvDYZGV6glaH9MpV8afxlW1Q==
X-Gm-Gg: ASbGnctLQHRujILFWWpxJmLtoK7Ez1eSOWg6dalohvxYYCzk9GBzzvL8c1/iGJRa+Zt
	vIHArVdaB2ZBKDPdjTfdyCyCo3ftEpAy/wlrkUatTDgLOjBmlTU1Ds/HfXO57kKfY2jjCk41hkp
	04vuUBVRv0aLU99flEajuxSqeRdPEdPQ+SE8E39Bmqr3p8GktV6sE6x5au/eD3mKnibfSJZ1n3Q
	BpmpM+7XTalphg/BXrraS0TnQrTQ+c0J1P6xneO0MDnY7CWZ/uj/1UjzZDSC+xymC+G4AduoFa9
	yJkUZpNHdA==
X-Received: by 2002:a05:6000:144b:b0:38f:3c01:fb1f with SMTP id ffacd0b85a97d-39c2f8e1d9amr1220398f8f.30.1743665489985;
        Thu, 03 Apr 2025 00:31:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwqYSQyMdV+bfQoHlJPQ9wPekLQ2x6Zs1CTechQHAMxVRhfrKQdBBHEB0GmCYDni6sWlkBDQ==
X-Received: by 2002:a05:6000:144b:b0:38f:3c01:fb1f with SMTP id ffacd0b85a97d-39c2f8e1d9amr1220371f8f.30.1743665489627;
        Thu, 03 Apr 2025 00:31:29 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096923sm1021344f8f.17.2025.04.03.00.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 00:31:28 -0700 (PDT)
Date: Thu, 3 Apr 2025 03:31:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: virtio-comment@lists.linux.dev, hch@infradead.org,
	Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <20250403032729-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <20250402105137-mutt-send-email-mst@kernel.org>
 <19ba662feeb93157bc8a03fb0b11cb5f2eca5e40.camel@infradead.org>
 <20250402111901-mutt-send-email-mst@kernel.org>
 <6b3b047f1650d91abe5e523dd7f862c6f7ee6611.camel@infradead.org>
 <20250402114757-mutt-send-email-mst@kernel.org>
 <965ccf2f972c5d5f1f4edacb227f03171f20e887.camel@infradead.org>
 <20250402124131-mutt-send-email-mst@kernel.org>
 <eaef09ab218900a53347987a62fee1787283d9ed.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eaef09ab218900a53347987a62fee1787283d9ed.camel@infradead.org>

On Wed, Apr 02, 2025 at 06:10:53PM +0100, David Woodhouse wrote:
> On Wed, 2025-04-02 at 12:43 -0400, Michael S. Tsirkin wrote:
> > 
> > yes.
> > 
> > I know a bit more about PCI, and for PCI I prefer just not saying
> > anything. The platform already defines whether it is behind an iommu
> > or not, and duplication is not good.
> 
> Not a hill for me to die on I suppose, but I would personally prefer to
> spell it out in words of one syllable or fewer, to make *sure* that
> device and driver authors get it right even though it's "obvious".
> 
> After all, if we could trust them to do their thinking, we would never
> have had the awful situation that led to VIRTIO_F_ACCESS_PLATFORM
> existing in the first place; the legacy behaviour we get when that bit
> *isn't* set would never have happened.

Oh, you are wrong here. It's not implementer's fault.
virtio just was not designed with real DMA
in mind, and micro-optimizing by bypassing the DMA API
was very much intentional.


> > For mmio it is my understanding that the "restricted" does the same
> > already? or is it required in the spec for some reason?
> 
> No, it's exactly the same. But I still don't trust driver authors to
> realise the obvious, or VMM implementations either for that matter.
> 
> I'm not sure I see the *harm* in spelling out explicitly for the hard-
> of-thinking.

I don't want people to make assumptions, like crashing if device is
behind an iommu or whatnot.

We can go with something informative.

"It is expected that for most implementations, when using this feature,
the behaviour with and without ACCESS_PLATFORM is the same"

-- 
MST

