Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B56D13AF2
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938329; cv=none; b=Rxu7fB0xCa9QMiFl5AKF+72JKe1GDxKWpNV2Vrl6I7t7iT3MgqPxwPM9ICt4WZv1hk7z+EDaa9weqVk3fvXsMYI5ajbXCXjaK0nDgOHYhsesB+rNJqq64nMUEW4o8axbQryxk2Z2fDIeSDEwUGjp7Ti3wrvUl4YV1TGf5HGGap8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938329; c=relaxed/simple;
	bh=2TQSgvPLFAjkK5aamynpET+MsFs7w6QX7YOD445+2MU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fX+PYhY/WH+KbfckSuS/3LqU0nbrB9UTn7v6N7has8VzjD8lytFdWDGNbZGdD229Ng0ABCnyEEWmKRS8Uy80d+9AKxoiRx3Pn27M9eqCPaUZ3EOEorr8XwG8BGKbrf7qtbUslLrAqUs+6uhGy6cau84hLqylYLdfgBMfpLnqvBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TYAwqPuM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TYAwqPuM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750938325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VuoFEKCsbRX53p5DNB7jHlEcmyNue0LfFnIhnZM9CJs=;
	b=TYAwqPuMva6NubsIZINc1GvU5mbx1JcRy/79JloY9hYeWcCr5Sej95tTcNuviFTRg3LGNb
	cnn9o/7r1RF+RvtfUXx3bN3vxi/cCgZIGUFQqSko+CDKdMLptBgIr6e6knEQB2Ps5ijcP4
	KHzW2IWCKzpT7ATnJXWHzunTCXO3Iuw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-LY453ydRMO6FQOftgrK3zg-1; Thu, 26 Jun 2025 07:45:24 -0400
X-MC-Unique: LY453ydRMO6FQOftgrK3zg-1
X-Mimecast-MFC-AGG-ID: LY453ydRMO6FQOftgrK3zg_1750938323
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45311704d22so5362305e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 04:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750938323; x=1751543123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuoFEKCsbRX53p5DNB7jHlEcmyNue0LfFnIhnZM9CJs=;
        b=S+A2j8JCFcN/I/qh6hV7s0RyHhftgybxv0yIlYDPgRzHZg7wRKVhijAqgzcwbjoL4P
         HsOIg8wZK1SRARGNyO9+eVIkKMkcAaqyu+uTLSLcBwGRwEytwlce/MAmWhl1CbN3qp4z
         ynhwSuntE2ISpA+qILV5Im8X8t4hpI+QQHRVLVvJ3heADXj+1/8p+dfUvzJbCyJSOCch
         fNRBCPPyTieWK6Bn//6GFjiYmiVTemqab5TOymcf/4NA5OT3XDfh8oHuk6mdsms43Ah4
         X9PpkZRRff2rDEf2MsRfL9gNTuRgxaMvEiQPcvppwe6PuIsbicwr3WfK5l1EgjG/0n5m
         zR6A==
X-Forwarded-Encrypted: i=1; AJvYcCWxNAq7+Nz+MmyVMSxCkdSDWGVOv8xQQYptSpov0h7CVy3CRN/uGma3nIoZAxDtRUXyLKpS9QgQdTO9U4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBrADS6Z3r14lT0B9sEB/3k+A8MDlzlX6siU3rPipEOYgGvxuM
	7gi2PWLccUaPSPI4oelI1n621u8VZ0ayGztXYpocThNYOlUxt6Ffb3uY08FUvNbSwYUmUSAyNd8
	qkoQf4SoAVmwgeraUWnrupXKhrJj17ior9OBsIXMybS7dabU+7QkwwumVevu5SOglNQ==
X-Gm-Gg: ASbGncsF9eoB4HI8Ydu4IPAAvZxpboPwvlDD/8Dlby36twy+X1EYRYJ1143kJG25K5a
	zwHykyzk1msE3hJfK+PzQYKsVXt4KZgSzAKQqodpTwzJcJ8MF3FwQoZNtz4RkUjUUnoOokYI+3E
	naJHrsEMBRi4E3vgpcsAGIZGKNu/itpQAwfb4mR7dJi/ra/zhC0DSN0W4fR4E/io8+zMet4AetL
	NaCYrsEbS9j3qtvCTYzTr5Sb+UWjFixjVrIHTzYuIqR+lvq6OiBilK2YD37Bxt+s9W97jeEEtCi
	qjj/nnnWwJmB4CbplJGh+uurWjPgp3WPg1O9QoXqlEHiRi9qgHLc
X-Received: by 2002:a05:600c:444c:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-45381b1366emr63916385e9.25.1750938323255;
        Thu, 26 Jun 2025 04:45:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ+2/Alx77fQuVYxk65rY8Ce18JLV17E1gGvWy6VbK7kWB1blblZGorXQzOSKk8/yLc344WQ==
X-Received: by 2002:a05:600c:444c:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-45381b1366emr63916095e9.25.1750938322753;
        Thu, 26 Jun 2025 04:45:22 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.11.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a4215dbsm17251465e9.35.2025.06.26.04.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 04:45:22 -0700 (PDT)
Date: Thu, 26 Jun 2025 13:45:20 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
Cc: luca abeni <luca.abeni@santannapisa.it>, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vineeth Pillai <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <aF0y0G4eJZtnMALp@jlelli-thinkpadt14gen4.remote.csb>
References: <20250620161606.2ff81fb1@nowhere>
 <aFV-HEwOTq0a37ax@jlelli-thinkpadt14gen4.remote.csb>
 <20250620185248.634101cc@nowhere>
 <aFpYl53ZMThWjQai@jlelli-thinkpadt14gen4.remote.csb>
 <aFqhId-qMFNyPD1s@jlelli-thinkpadt14gen4.remote.csb>
 <20250624170030.4e5b440a@nowhere>
 <aFvBvxhw6ubpBefm@jlelli-thinkpadt14gen4.remote.csb>
 <aFvLYv0xSXxoyZZ8@jlelli-thinkpadt14gen4.remote.csb>
 <20250625145001.7709b647@nowhere>
 <d70bdffe973d1d4b951af3f12d3a5a1e77c879c6.camel@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d70bdffe973d1d4b951af3f12d3a5a1e77c879c6.camel@codethink.co.uk>

On 26/06/25 04:59, Marcel Ziswiler wrote:
> Hi Luca and Juri
> 
> On Wed, 2025-06-25 at 14:50 +0200, luca abeni wrote:
> > Hi Juri,
> > 
> > On Wed, 25 Jun 2025 12:11:46 +0200
> > Juri Lelli <juri.lelli@redhat.com> wrote:
> > [...]
> > > I pushed another fixup adding a check for dl_server_active in
> > > dl_server_stop(). It seems to cure the WARN here.
> > > 
> > > Could you please pull and re-test?
> > 
> > I added your last 2 commits, and tested again; it seems to me that
> > everything looks fine, now... Marcel, can you confirm?
> 
> Indeed, our CI run now close to 220 mio. tests on NUCs and 190 mio. on ROCK 5B and so far it didn't miss any
> single beat! Also the statistics around those tests look very good. With reclaim enabled one can now truly get
> very good real-time performance. Thank you very much!
> 
> We will continue to exercise the Linux kernel scheduler to the fullest and report any inconsistencies we are
> seeing.
> 
> Just let me know if there is anything else we may help you with. Thanks again!

Great! Thanks a lot for testing and the patience. :-)

I will be sending out a polished version of the set soon. Please take a
look and add your reviewed/tested-by to that if you can. The changes are
the same you have been testing already, just with changelogs etc. Let's
see if people spot problems with the actual implementation of the fixes.

Best,
Juri

