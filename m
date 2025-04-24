Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BB219F422
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745501883; cv=none; b=fY6a85rLScHRSj1vk1YrKms9o2xp2Zu27WM0gkX3dv8Q1rnqP+XOr1ULBoNBF1Wy27sNwShBqxeq7ENuR+V/hmwvSazj/9YRfFxs5YhX8u/UnyQzmEsI3oHwgL8Jl2J8lrAX+mnDaymNK6aosXoUK7uURKcESaQoK21E6xhcuks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745501883; c=relaxed/simple;
	bh=D/eBCecqGJOsPMhoyOTAom8n4mwMCJ8cEqE7fC+WqRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdzet4XxgNMLRd7R+UFSx58ENO0/nXHq/uNqnXZIiZlJ42NHI0OPPtBisN73Gq5DlHoaQ23EN90I66r9msWRudBUUBDxut475gZ0eI97nf+XfhiPr9Ats2MWp1tUP7cHCHNF8PHW4amkNJss6QAxcW0mc3SZlIQC9Qk9UPtyNKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=S0EIKPw7; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="S0EIKPw7"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6eaf1b6ce9aso12554836d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745501881; x=1746106681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U/W3GC3oatAl2njW4tqC6hVInIU5fJ/grm/o1CEX900=;
        b=S0EIKPw7Sx6dOPkPXEYxxenV+AJPQ7ez+emvKZsmH0K6+D8WxpKQjfkQAP0u80ZXS+
         4LisAYHfaqzmpaQ/mm6rM6NjPdCVuliEiDtZs62w/C5LD1NGMRmUHM2+tj4MR1Ue8+83
         MCRXFLNkBFjAZK+2TRn2kvebwjTMcIbFBqqYhNDeL+1fbDVGdktReNREduybgEsd7KyM
         LEML0lZdoRLxH1EeFsMhcnCD35qokLOB0JxvC6cwxfBByhFIJvMy4mEVMS/PIMiLgOTw
         tqA8EBGqx6p6HIZvMBRCzo72qrHEihSONvVEtf+55T8ND1dMs7kUWXmJH9hf44/+NU/i
         HFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745501881; x=1746106681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/W3GC3oatAl2njW4tqC6hVInIU5fJ/grm/o1CEX900=;
        b=EDTOB/CeG2SQvqY5SsQkNBjF3hANpU9zv6Qe2stwzLv4iZiNlCdOmDX/bQk9mpqTXT
         pvkbqX/TQBDodC9ojGl1/88Xj19KjqyPfqJ+NPerRBBwF6jBx++PoRksMM/cpzLKh0mj
         YvDCT/0IqxjQ4xMz5xwzd5avwrrYYw6xuM38Vc/srevb0gDzi964j4jfss+CtU73XN+Z
         WEgwjf9M2qac+Sq8/97ZN3V8HLq2LXyFgEXJlD69o+lZUBOsBzEdo0MNY/pjxU3u7v/V
         HIat6S8Jqd12xh5SLHWpyaKMPcTZLF9OWzQjbO+iW7mZUhvIUKpKUqXfj11jPD59gijq
         /dsw==
X-Forwarded-Encrypted: i=1; AJvYcCWotxPAWbPCFQaGtmDMoVQD+oXmGyOvFBnErs2azB5u6oRnbVHIDTuIRev/u/sjbPrhWmZGKBt3J8t3frc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAHmzodO/OdbOprSsLni6/Fn+1KjEYCsHEAj5oLycy2XeCJFM9
	EK8gKNhXptXhvhkiOroSZMxiF7gpmDAP8OORoxvtXxo/I1Ja69Ml/yHTQBq52wc=
X-Gm-Gg: ASbGncskkXUfZanaxhQlRFq57r7obcu6zMTnWH4WjMP47f+W8dLlSq4j7LO3GdpWS19
	CShdNapkC6DHADzQZ5Ugj9aOJQ4turvaMNW6GlYFDUK/yfloavv4+tl9P+Mq6saJtJ8tqJczDam
	kA1qzcmJTmmD8VmhZW+g0i4/4unweTd+dLwDnikuiTrG4mdUO6tNKHHyTI+jgVy3iR9GL1DNDEI
	w9loHP0TKJ7hfqSknUPlILt4xVg8OzshWftXICr61ZYH48yTMDRS7bArr+K2VPGMODZLbTHpaxo
	ooXSfYsbx9SZn7DNWCFvX0kyRX4sa1uHy1h4KUJMg1DjoaTaFIQMqU/YBk8b/ERohtV9lBq7lT1
	S5lBheaOoWQXWJQnk5zw=
X-Google-Smtp-Source: AGHT+IE64NqIpTP8d6nXJqLNWT3jPXbllYrtohUGLpe1Dgn/vUIkQeRm20MtXG4dpykW621IkSP7/A==
X-Received: by 2002:a05:6214:2aae:b0:6e6:6599:edf6 with SMTP id 6a1803df08f44-6f4bfc742a1mr45162376d6.34.1745501880600;
        Thu, 24 Apr 2025 06:38:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c093452fsm9500826d6.44.2025.04.24.06.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:38:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7wm7-00000007UU5-2Apr;
	Thu, 24 Apr 2025 10:37:59 -0300
Date: Thu, 24 Apr 2025 10:37:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] iommu/vt-d: Simplify domain_attach_iommu()
Message-ID: <20250424133759.GA1213339@ziepe.ca>
References: <20250423031020.2189546-1-baolu.lu@linux.intel.com>
 <20250423031020.2189546-4-baolu.lu@linux.intel.com>
 <BN9PR11MB527619613B8615A94A01FF598C852@BN9PR11MB5276.namprd11.prod.outlook.com>
 <42e8c668-e72d-490a-8a5e-8e94af90fda4@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42e8c668-e72d-490a-8a5e-8e94af90fda4@linux.intel.com>

On Thu, Apr 24, 2025 at 05:22:48PM +0800, Baolu Lu wrote:

> > > -err_clear:
> > > -	ida_free(&iommu->domain_ida, info->did);
> > > -err_unlock:
> > > -	kfree(info);
> > > -	return ret;
> > > +	return xa_err(xa_store(&domain->iommu_array, iommu->seq_id,
> > > +			       no_free_ptr(info), GFP_KERNEL));
> > >   }
> > 
> > no_free_ptr() should be used before successful return. Here xa_store()
> > could return error but at that point no auto free as no_free_ptr() already
> > changes 'info' to NULL. then memory leak.
>
> Hmm, I've considered this. My thought was that xa_store() failure only
> occurs due to the system running out of memory, and the Linux kernel
> can't recover from it. In that case, the system is already broken;
> hence, handling the failure case here doesn't make things better.

That's not the kernel pattern, you are supposed to unwind correctly in
those failures

I think you should not use cleanup.h for something complicated like
this..

Jason
