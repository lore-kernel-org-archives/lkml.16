Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE15229E0EE
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846315; cv=none; b=ogRuJn83YCtcsFrVJI3WXXUM+wH8SYLsuDX902rR85UjJ42+YayViERcv5zvwN+SUFUyovBD17WfBfpwnq58KbFvohma3Eo44NMSY63ujYRqfEx2ej0wOCF7jIINfQrrMblzXLWmPT1yGQB7qmwZTnESA0sgoyAaxcnsSb7TSYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846315; c=relaxed/simple;
	bh=+FdDhCCHBeq3vov71X2qyD0HCjqCdqZF2v7NZkR5tUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8Kb+rqjI3GTAWcABKlupm0Zv18UwNDATDHOnySzAqi16Wpl8h2uj/IV4D66cj4+68oxA3HGWe5Bta9BOtbWzJYJLaPZWvdPo4XJds1rHORrjRGkP6b1Emy9sG345ou7koVeoS6DgdLG+X6awqeJS2zpn/zHBrBtRQBfnd/dYnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FxwpQ/HN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FxwpQ/HN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750846312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O5fQ+1cM66WYzA39tSYPjHw4lVDQMD4648GeAmWGhqU=;
	b=FxwpQ/HNHurT2yJUONj5JwP1lsFgn7oOIK1ZEYK2cZ12fB4d6wNbcI8LLNQky3xkipzWLN
	mY+4oLYfuP8AbG+J4V3gk6ljWOcJyjuKFy6obIHhS5hg7hJ6r6htm/iq8z8fpEm6+m+BrS
	frRfv6CCrY8fb92agMYDCbC4ioKK1KI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-vCJ3LmJePpWkqE4VJNbWBg-1; Wed, 25 Jun 2025 06:11:51 -0400
X-MC-Unique: vCJ3LmJePpWkqE4VJNbWBg-1
X-Mimecast-MFC-AGG-ID: vCJ3LmJePpWkqE4VJNbWBg_1750846310
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a6df0c67a6so2523773f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750846310; x=1751451110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5fQ+1cM66WYzA39tSYPjHw4lVDQMD4648GeAmWGhqU=;
        b=Ie/+xpbodpSFakVR17+VueRfAIzDOJIFzTO/n0vzzdFfrDD2oqmBIAmfLYQmgZXhAy
         pI2NVZmKQaHh8cbZm9GAX+hfmQ88AERQkL8kL9WYuJSldXgFabVeNJWOCDuEnb6LR+gz
         qgBqAv8/akmjGBBEv8p6tNJbHo6ksqCbRoEIb+RQqKJY5zk0SXy7aOWFgCOrDp+Pk1E/
         Iudnc+DwYa3d4EqS4oZWH+c9MxaYTOCnR8fbSMQW0dThmEBeyYi8/6w7ACht/V6TyShp
         V+lMBeTli5jVPU5byorI/FieIZOzHyGLvK5OXJIFgQ1gZ/5yBNS+RyBGonBbL9qIVK5S
         yLRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm7/7sSN+6qU+bAwrSbGuUGTn9B28uUWReI06TGocw3uEM6j+Qku03MG3JN5ioatpnfpWT2yrJFbQ6ezY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKC/VZ1AqjR4dbvN89cztyKxTuBhe8tU04HKkIJALsKsXnyjbX
	7xSu7UWJdcOmWJD2pc7N7TLM3JTYTPMbPkY2pS2xJOx6tqLqcpYspxtgzbfPL5pMlWkf2hpx+ER
	Hv69yxKrmmZB64etoLuPvnVmQSzSIQLUufbatqeGpshX65ixbrWOyKh+r0gYC7qN01kTsRvtB2Q
	==
X-Gm-Gg: ASbGncvyV0hf44+RBow3ehcnhfv3vRzfADDBjro14AdwOoTBzvV+UEgCzWT+t42O0Dv
	0xbNWF78lAX6kbZZmurSCNKKVQbamQNTFq+jtZM4SsXgVM2aiW/0pV+C++GmH6XVTeVkyNiTAr2
	LqYwnEd35/DWqOmwL9yH+u1770dmPKPcMS7fOTpCPt4iboszDKuhKTu1hSt3rj2f/ASCkDHENPo
	/eOEN/CJH+C08wp99akBXlCerQI1GnNdxrdbQoFGSGmS8BtPnVb213ZjRCygUFHjA2azY41R0Fw
	a//u5hfW7MMw9Frz9V7NNk4NPjyOBVn6YgzvERed0ugGev4bc4GP
X-Received: by 2002:a05:6000:4310:b0:3a4:dd16:b287 with SMTP id ffacd0b85a97d-3a6ed5f3acemr1551380f8f.19.1750846309694;
        Wed, 25 Jun 2025 03:11:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlvU/aBx4iNvbVVoMSC9jrMuTIL3u7ONJpUK04b/hHE6zP/NG/Ix0jrkyrr4YCDBaw0QSMog==
X-Received: by 2002:a05:6000:4310:b0:3a4:dd16:b287 with SMTP id ffacd0b85a97d-3a6ed5f3acemr1551358f8f.19.1750846309277;
        Wed, 25 Jun 2025 03:11:49 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.11.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233a895sm15507465e9.3.2025.06.25.03.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:11:48 -0700 (PDT)
Date: Wed, 25 Jun 2025 12:11:46 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: luca abeni <luca.abeni@santannapisa.it>
Cc: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vineeth Pillai <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <aFvLYv0xSXxoyZZ8@jlelli-thinkpadt14gen4.remote.csb>
References: <880890e699117e02d984ba2bb391c63be5fd71e8.camel@codethink.co.uk>
 <aFUqELdqM8VcyNCh@jlelli-thinkpadt14gen4.remote.csb>
 <20250620113745.6833bccb@luca64>
 <20250620161606.2ff81fb1@nowhere>
 <aFV-HEwOTq0a37ax@jlelli-thinkpadt14gen4.remote.csb>
 <20250620185248.634101cc@nowhere>
 <aFpYl53ZMThWjQai@jlelli-thinkpadt14gen4.remote.csb>
 <aFqhId-qMFNyPD1s@jlelli-thinkpadt14gen4.remote.csb>
 <20250624170030.4e5b440a@nowhere>
 <aFvBvxhw6ubpBefm@jlelli-thinkpadt14gen4.remote.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFvBvxhw6ubpBefm@jlelli-thinkpadt14gen4.remote.csb>

On 25/06/25 11:30, Juri Lelli wrote:

...

> It looks like (at least at my end) it comes from
> 
> task_non_contending()
>   sub_running_bw()
>     __sub_running_bw()
>       WARN_ON_ONCE(dl_rq->running_bw > old); /* underflow */
> 
> I would guess the later initialization of dl-server is not playing well
> wrt running_bw. Will take a look.

I pushed another fixup adding a check for dl_server_active in
dl_server_stop(). It seems to cure the WARN here.

Could you please pull and re-test?

