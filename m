Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8C722489F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 05:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744005494; cv=none; b=kwhKOdgvW3RIqmUhQ9QM3uQfE0w9tlI4L0vhojdKHH5UBh5/xIAezE1rFbN0JqiRVTc4B6T/yYpryUv5eZVEDV7lGQ2K0s1YjSCBZbKT+Pkdwz3/v0lBtg8j2AYNjBwWX1ZPPG3SiocNNauC72QKUoN9ZIVn1P7CJrDj70tI9lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744005494; c=relaxed/simple;
	bh=ZiKQU7+ZTag+PkDiP21DOnNU/DfFeWSpZpnHSsouA8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5axfswOpLBiZMP8Pw9ueKeJ4LBEqYypxvAG/E7qo+mHZtI3hF2efW+dGdfpxYUwCv4cmnUhE86G1usKUNAuEKb9Q37B33ZUYU0r1mvaS+BbCw7inA1xY7yBJmEwiGj+ufVL+Syd4S4EVddCuLIDm7W1XQuych5FIyVFICfqdtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GQtxjEcn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GQtxjEcn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744005490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FdrgDYCSpZrgshUK0dQhM1SIggYbKVgzDdGuPaZZJ44=;
	b=GQtxjEcnOnOLPa0trT9vskhqe5BKI9jhJbce+f8bTAF9IIcv/cfp/0Q0oS5GpwzcF0g0o7
	BfUNugSPWhAx3KeUjPU3c8xc7x6aGAi3eud9YobU3OCAwUso/y2vGOMSvq96YqzrHFvfZU
	/9Cu55uK05+xiSHS/iNHMX8f2O54Tqk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-yZwNoCgzMMabAHjVcoJ90Q-1; Mon, 07 Apr 2025 01:58:09 -0400
X-MC-Unique: yZwNoCgzMMabAHjVcoJ90Q-1
X-Mimecast-MFC-AGG-ID: yZwNoCgzMMabAHjVcoJ90Q_1744005488
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf327e9a2so33500605e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 22:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744005483; x=1744610283;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FdrgDYCSpZrgshUK0dQhM1SIggYbKVgzDdGuPaZZJ44=;
        b=PqiG5gqKAEsXTkqhgiQ4ZHpKxXThLUtXr+dFsEIr+og14Dq0CTA185YrpcX+2gv7RH
         KxWXcQNxfGEBCL5xhj8ugA7ikYtdyry6h09apA5EcbGAemfcdpL4PmLjf2ceRrldR2Ec
         J//4pfqJYmHD8689tPWO+HgvE5067kl7IgkJizyrKW6tMA3HNIOofCTLQc4ohH8shNcM
         +OgowGXTVawBqBwQRBuQZTp1+Kx9dNIQhzv4YGqbflA/kXRsZiUiy7G1rEogs6NaqwSj
         rxH1v+fexLYXA2tYA73ski+1PKbmijlJtWEa8gb9Y6eaA8+XDg27i/rwhk2VwIK/b5k7
         DU2A==
X-Forwarded-Encrypted: i=1; AJvYcCWlT3yZMLDscrhjIDsg1LQAvep+MwzT060gkdnMHu5G6vcxT7BUmxcRRfq3dEQjBJumt/HLwoM2ICwCrBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNXjK26PM+3oRLs/f+u/FVYFr/KWM5dyj+k5s79Jrwqqb0bzOx
	JyPHoRsdK57rO4k4AvyDDADwRPZf+nP4ceF1xKnWaaedj/0RNYMDh1sjjFD1jCgCjeGXb7Q+rv/
	Ze4lXfafaCiXAaV/wQ3oeWLCEBmZzr1TYpQ8y4o1iKZRGsG8RIVV1UoOx/YXg7w==
X-Gm-Gg: ASbGncshMi6A5ogbSYjJUqA/qD9fkUG3e6VQfV5D4DmewpUdSjGcLiJjhZaNagjglBL
	B0muIdZ6KkiVFIq8FzO+6tLFfFtoolnwUXQizEU5Oj0p8sYp2DXHvXHR/thmwtu/ImrhDUPm/HD
	kT3LssHSK8CNlUhOMQV/AFzHvFyAlSmiPP4GIFZgFXAy4Vf/gkG21GXM6PcyPN+Is1JEKFyLSVG
	JQQ4/4Qn1XowVoBfuyLTS14Awf7Ot9uynwvrA2/Hbhk9O7iPY+GHp1avGiRE/Btdx4xLSQRX5XR
	XyIypw+kxS26W1j/IHvOOXtMyVP3UY0+DfUST1E3Q9KUJs39/hXYUKbhKbqDoAnxAyrQKAv2knA
	=
X-Received: by 2002:a05:600c:4754:b0:43c:eec7:eab7 with SMTP id 5b1f17b1804b1-43ee0640054mr69945375e9.11.1744005483407;
        Sun, 06 Apr 2025 22:58:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCJwfJe9itIXh2LQ8CDQGreaVbRslAEp7rsJUnOQciHmPEfLvp8ZVDzU2l0AkPqAUjuQP5rw==
X-Received: by 2002:a05:600c:4754:b0:43c:eec7:eab7 with SMTP id 5b1f17b1804b1-43ee0640054mr69945155e9.11.1744005483064;
        Sun, 06 Apr 2025 22:58:03 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb (rm-19-1-30.service.infuturo.it. [151.19.1.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342be6asm122527675e9.5.2025.04.06.22.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 22:58:02 -0700 (PDT)
Date: Mon, 7 Apr 2025 07:57:58 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc: Peter Zijlstra <peterz@infradead.org>, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Frederic Weisbecker <fweisbecker@suse.com>
Subject: Re: [PATCH v2 00/10] Add kernel cmdline option for rt_group_sched
Message-ID: <Z_NpZmfeHMwa6cQH@jlelli-thinkpadt14gen4.remote.csb>
References: <20250310170442.504716-1-mkoutny@suse.com>
 <20250401110508.GH25239@noisy.programming.kicks-ass.net>
 <s2omlhmorntg4bwjkmtbxhadeqfo667pbowzskdzbk3yxqdbfw@nvvw5bff6imc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <s2omlhmorntg4bwjkmtbxhadeqfo667pbowzskdzbk3yxqdbfw@nvvw5bff6imc>

Hi Michal,

On 03/04/25 14:17, Michal Koutný wrote:
> On Tue, Apr 01, 2025 at 01:05:08PM +0200, Peter Zijlstra <peterz@infradead.org> wrote:
> > > By default RT groups are available as originally but the user can
> > > pass rt_group_sched=0 kernel cmdline parameter that disables the
> > > grouping and behavior is like with !CONFIG_RT_GROUP_SCHED (with certain
> > > runtime overhead).
> > > 
> > ...
> > 
> > Right, so at OSPM we had a proposal for a cgroup-v2 variant of all this
> > that's based on deadline servers.
> 
> Interesting, are there any slides or recording available?

Yes, here (freshly uploaded :)

https://youtu.be/1-s8YU3Rzts?si=c4H0jZl4_5bq8pI9

Best,
Juri

