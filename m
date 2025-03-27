Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171C520C01B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743067678; cv=none; b=AVTTxmlYXfhRL/fJREg86hyntHlcfXzJt0bAiz97rodTV9JzzeJvhNwraG4QXxe5fAssL+Ifj6ntwxNXRTA2NjmnAm622OdGM6vMz868SnSDxT1HuQZ6TXj3dzzPCunrs520cOnvuXMBZqGzImi312aJaoGMJgLp+LNjKn2z6ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743067678; c=relaxed/simple;
	bh=VYJm25E5SBfgKsJrKUJDhLPg0lXKBEdFQtY15OzbjLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s55whalC5GKpXN25C0anCDJHIh1w48oEE3LDWh5TfIzG0UpLzoixwW+CcbWJ4jqHo9MzYzOfOjQ6LjFuis9o0p0Sr2pb36L4qsBkYb9o9tNPD3DOQVKI8nVZDGhuREADYfNxwEjVOfTYFXeSmUChmnJSjSHsKkK6+5iwEPqq4SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VkrssFUj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VkrssFUj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743067676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fb5rn7gLPo3ygp5MY8ecDAB9dNjS1ERzuhzJpEg3ERw=;
	b=VkrssFUjGubQIVgNysowq4/Ka9loWVQz24WwvzzjvcK756GpJd+T1VT0FRfnTLvsuHZYXP
	Bi+iSH7ummS0lTooCH1y5WbMgnzrDG53JuFzN2LK1Tysuqx8d07/EJCkEseUu21NAbC80r
	5QFyjNqT5940mhWX6CrQ001gyuMO2NA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-AO-ftOmDPym_xURK5nuEtw-1; Thu, 27 Mar 2025 05:27:54 -0400
X-MC-Unique: AO-ftOmDPym_xURK5nuEtw-1
X-Mimecast-MFC-AGG-ID: AO-ftOmDPym_xURK5nuEtw_1743067674
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5e67df8c373so848892a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743067673; x=1743672473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fb5rn7gLPo3ygp5MY8ecDAB9dNjS1ERzuhzJpEg3ERw=;
        b=aiPRsnfK0RaEx+wrUzvU+vJ1DMNNYTMNtScy8Xmw4l/XKNf/SYJOmoUW5CJNV38ntR
         YrIx47oJPCurpN8KxEdXR6gumf5bIbRub6r/66eq2RPY2CDp+Ekw+FcPWW0PYZFdkpKS
         NoV6dqSLvBlNmtKd/cQff07JUAhvDeyREQt9h5uW9JSdLGjhCB7W9/Z2UtRxWDuaPn5F
         GHcWzWI3/izA0RjoUQ1VnhtPh8fyeRiX6oQXITGBO8YLUmTMe8J1v3mah0192YIYZtc1
         BDk0PJrM927jTdYoxhk1NqgPd0MLm/UBKM9E3E3d5PnW0RbSILfiHJh6Q2Knof6wZFSk
         YCwA==
X-Forwarded-Encrypted: i=1; AJvYcCXyxxOdN6i2GdZQhjKP/tARWdHy/Kozz/HCtFkzTTBvRxBtv3SUSnHefbX4XpNnrV53VM6nKvVrjrCLHKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO7SIG99UXY7w0rCZNITwtGN4kKC/SowNW+prfiIwSBdhpAKSe
	US3mRf6WId72Exyb9WxRWKii1p+Ot12lBhY5JxKDCWjxbUT/tosSH1vfPA8CSQkek67dYkzkB4C
	GDY1fqDCB2G8wbeN00n2pcZcb7II6a1c2BJoy2yW+Ib4RaoT9iIxe3978z8000Jw8CgsGTfIu
X-Gm-Gg: ASbGncuIypZBuBt7KZ3UMLyHTZ6MKJ4qv6B4PdhAilSV+kEIOPaQHOevRsIa72Y7fpB
	HvFLoaTV46Kzn8wG4hiICADskeYtASQW73HsB148VNRRwQZ7smX/nVfZ7rwHVmKczYg9ht3tKUq
	ziBolZJgEi09sh1Awie8Rp0CR2aASlh9JL7cNc8xdjv2ZRepIt4WQg+5ZLSbZbKwUzaH9A6hhpf
	2GT8gbcq1dlQyvI/L+wctlftj0l680iLd9Gv6druAui0WirS8bYOCzIPhFi95xsK+2FyqEnK7E2
	XYIwJzHMSlgv3rOJQNH3MSYQGcQdlOjAmJwaZu5z+0cWTI/knEi0R9PKn2yrzk/J
X-Received: by 2002:a05:6402:354f:b0:5e5:bb58:d6bd with SMTP id 4fb4d7f45d1cf-5ed8e27e417mr2747653a12.10.1743067673031;
        Thu, 27 Mar 2025 02:27:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvTN/A/WKtnLN9cOk1VAV/IoHZ/Wxw0yKAUmRflhbh8sggckBhsPUWwhNfAktSzO/FSF0l+Q==
X-Received: by 2002:a05:6402:354f:b0:5e5:bb58:d6bd with SMTP id 4fb4d7f45d1cf-5ed8e27e417mr2747630a12.10.1743067672368;
        Thu, 27 Mar 2025 02:27:52 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccf6797asm10811435a12.16.2025.03.27.02.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 02:27:51 -0700 (PDT)
Date: Thu, 27 Mar 2025 10:27:48 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Sumit Garg <sumit.garg@kernel.org>, 
	linux-kernel@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>, linux-integrity@vger.kernel.org, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [PATCH 2/2] tpm/tpm_ftpm_tee: use send_recv() op
Message-ID: <6mpece5tkoie6ngv3j3xzjkotn6x6wu2vjs7pc44ns76z6v3d2@c6jinanngw5o>
References: <20250320152433.144083-1-sgarzare@redhat.com>
 <20250320152433.144083-3-sgarzare@redhat.com>
 <Z-I86tWMcD6b_YeM@sumit-X1>
 <Z-Pu4FhcntnKii61@kernel.org>
 <Z+QQWe/upJuVpU8r@ziepe.ca>
 <Z-QV5y1JGBDpsPuH@kernel.org>
 <Z-QkGUenPAMid63l@kernel.org>
 <Z-RlbEN9BoKnTN2E@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z-RlbEN9BoKnTN2E@kernel.org>

On Wed, Mar 26, 2025 at 10:37:09PM +0200, Jarkko Sakkinen wrote:
>On Wed, Mar 26, 2025 at 05:58:33PM +0200, Jarkko Sakkinen wrote:
>> On Wed, Mar 26, 2025 at 04:57:47PM +0200, Jarkko Sakkinen wrote:
>> > On Wed, Mar 26, 2025 at 11:34:01AM -0300, Jason Gunthorpe wrote:
>> > > On Wed, Mar 26, 2025 at 02:11:12PM +0200, Jarkko Sakkinen wrote:
>> > >
>> > > > Generally speaking I don't see enough value in complicating
>> > > > callback interface. It's better to handle complications in
>> > > > the leaves (i.e. dictatorship of majority ;-) ).
>> > >
>> > > That is very much not the way most driver subsystems view the
>> > > world. We want to pull logical things into the core code and remove
>> > > them from drivers to make the drivers simpler and more robust.
>> > >
>> > > The amount of really dumb driver boiler plate that this series
>> > > obviously removes is exactly the sort of stuff we should be fixing by
>> > > improving the core code.
>> > >
>> > > The callback interface was never really sanely designed, it was just
>> > > built around the idea of pulling the timout processing into the core
>> > > code for TIS hardware. It should be revised to properly match these
>> > > new HW types that don't have this kind of timeout mechanism.
>> >
>> > Both TIS and CRB, which are TCG standards and they span to many
>> > different types of drivers and busses. I don't have the figures but
>> > probably they cover vast majority of the hardware.
>> >
>> > We are talking about 39 lines of reduced complexity at the cost
>> > of complicating branching at the top level. I doubt that there
>> > is either any throughput or latency issues.
>> >
>> > What is measurable benefit? The rationale is way way too abstract
>> > for me to cope, sorry.
>>
>> E.g., here's how you can get rid of extra cruft in tpm_ftpm_tee w/o
>> any new callbacks.

Yeah, I agree that your patch should go in any case, with send_recv() or 
not. It's a good cleanup.

>
>Measurable benefit: no need to allocate memory buffer.

That's right, I read the whole thread before responding, but that's 
exactly what I wanted to highlight. Implementing send_recv() we could 
completely remove the buffer for the cache here in tpm_ftpm_tee, 
simplifying it quite a bit.

In tpm_svsm instead we allocate it while probing anyway to avoid having 
to allocate it every time, but we could potentially do the same (I don't 
know if it makes sense honestly). We do this because for SVSM any buffer 
is fine, as it can access all guest kernel memory, whereas IIUC for ftpm 
it has to be taken from shared memory.

>
>Let's take that as a starting point ;-)

Yeah!

>
>On that basis I can consider this (i.e. something to measure).

Okay, I explain this better in the commit description for the next 
version!

Thanks,
Stefano

