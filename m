Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9081E1DE8B7
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 10:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738925755; cv=none; b=QbXEqUDs8Gz4N5GivaFzFmaU5HH5kQ2T6lmYzaIkp0PMxT3s8KaPM6p0a9/7tUPjwKInsksR/sB5w8/9YS7Mxhd464avPqF05PQi3B7Z2UwTauNVNYNMzWuz7xReYFDOk/IDNNxZMJZ6sU6QI2Fy4iq77MSYWunl0K+yGjUYsG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738925755; c=relaxed/simple;
	bh=ehXyueAFki8jwecE85SxuxxW2eG13J2pRWWxP6G8NT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GjVFByDaSroAoAKebHiMsIklzkNA5/RMXjsk2GxIXTcNvwZGW3LyXGIodMfcE3nvQnYubj0UfrJg5YLXzw89K0PmBkd9BPkrN7mZ4BAGoteUtaJGNtRhDbKUNQm/IACPcls1axWHJJNqfjDl+arskQEbH2KwRNfvImR0IXv4Edo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NsqTyD2f; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NsqTyD2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738925751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bk8HYGDotJpHAOYNSGDnghbePbc88+YfjSADOoDlOec=;
	b=NsqTyD2fdTJBtpnb43X3qKH9nc+s2e1b4usOa8s/6krCFYVj0DA7nXioscY5lieSFzzYTj
	Zfapt+teDCnAZYtPFkouuAIaDjenrG6nL8ORvbmPoJJuPtG6qkEvKEPvzw/IM6I8J5Wl6e
	wNkBKEOhGOmQUQjako7E3V6QFqBbFKo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-_9jn02_GNoqIwsapsIrD7A-1; Fri, 07 Feb 2025 05:55:49 -0500
X-MC-Unique: _9jn02_GNoqIwsapsIrD7A-1
X-Mimecast-MFC-AGG-ID: _9jn02_GNoqIwsapsIrD7A
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38dc6aad9f8so482635f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 02:55:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738925748; x=1739530548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bk8HYGDotJpHAOYNSGDnghbePbc88+YfjSADOoDlOec=;
        b=uj/4rI30RS5YftYBSw8WhsFpLhl75SDUbco6XTzEZqhB02NsIyTgBM36TdE23e6AmS
         d/WisPuuo/UapmQ+pXT0T/bh2sKL8I008JFeO6w+i1SfUMEBJlGIRXe54iElyhal71KB
         rZUEdrPtHMXjUBU/9jzMAyLMn/KVcrs8VQFIb1L+H1Qj8au3/C0XNT3/eI89lEsp6mWS
         BE12oV/nsb7qBgB/0yhBEM+1M83O+1w3odOuOjeWVG4xe22UwM923M4qaNVKCj7eGEVy
         yspE1kmDBchQtkEe7quWf8G7OKITreHc1lj5gHAsPCxkKYTZKN7to6KYNKjy94n3j+oP
         UOIQ==
X-Gm-Message-State: AOJu0YwgFjnGz3PI3rPL9yJ+bhwgdqXvSCT4Evk8UyVuEQyz91Y82xT+
	fMxAiAavNZq4cZLVSvFS/ZgFIuKHcqrmsif0dR5KUko8o6H457MoyDiC+U+ukKuZASze+fi7/8L
	iX4jaSFwMNB7U8rSfymHeRmOZahGrx1r4szFHCJl6pilehiaBX4kBuIKPbMOWgw==
X-Gm-Gg: ASbGnctjbDV+N5fBm07rhCds0rOstOS7dRNdPi37jSCDfSS73/NIi5wX/2sLj8LMe36
	Dd6bDqNdr/pY0N6SQH8ONn0DXUJjbg8XYJygvOHTZJYFTQXi1HhhZa4hdFlkFKlF3otSY0qwQFN
	EsjK+Bzuor4pGwUnuOWVtUVNF8CPhK06wS68/jn3VZ6Y5PGyArOcogOZz9xXH4IybL9Lac0OXBs
	nBcU3Xu+N8Kr7nsNbz6KEQBKB8QT+7mwdcAXC/c2P+YnZwR3D6QaOsQZXY+zo49UeDIm/Z6YQai
	McWbpBz4BksX0k1HnvddQmjS3b19DfNDmBPL
X-Received: by 2002:a05:6000:402b:b0:38d:afc8:954e with SMTP id ffacd0b85a97d-38dbb251e08mr6092698f8f.11.1738925747991;
        Fri, 07 Feb 2025 02:55:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESzdNKp6zRUwMogCn//lKykey9oFJeFZgS6oz5DUJn7qbjka4YyR98B1rDBiQT4tA/U/OomQ==
X-Received: by 2002:a05:6000:402b:b0:38d:afc8:954e with SMTP id ffacd0b85a97d-38dbb251e08mr6092675f8f.11.1738925747580;
        Fri, 07 Feb 2025 02:55:47 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.128.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc627fecesm2469143f8f.77.2025.02.07.02.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 02:55:46 -0800 (PST)
Date: Fri, 7 Feb 2025 11:55:44 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-trace-kernel@vger.kernel.org, John Kacur <jkacur@redhat.com>, 
	Clark Williams <williams@redhat.com>
Subject: Re: [RFC PATCH 00/11] rv: Add scheduler specification monitors
Message-ID: <czykavxpz46nwnelml6yorg3tvmyjvczqogeuqzji6qrfd2peu@qxr6wucv6mrj>
References: <20250206080952.98478-1-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206080952.98478-1-gmonaco@redhat.com>

Hi Gabriele,

On 06/02/25 09:09, Gabriele Monaco wrote:
> This patchset starts including adapted scheduler specifications from
> Daniel's task model [1].

Thanks a lot for working on this. Apart from being cool stuff per-se, it
means a lot personally to see Daniel's work continuing to be developed.

> As the model is fairly complicated, it is split in several generators
> and specifications. The tool used to create the model can output a
> unified model, but that would be hardly readable (9k states).
> 
> RV allows monitors to run and react concurrently. Running the cumulative
> model is equivalent to running single components using the same
> reactors, with the advantage that it's easier to point out which
> specification failed in case of error.
> 
> We allow this by introducing nested monitors, in short, the sysfs
> monitor folder will contain a monitor named sched, which is nothing but
> an empty container for other monitors. Controlling the sched monitor
> (enable, disable, set reactors) controls all nested monitors.
> 
> The task model proposed by Daniel includes 12 generators and 33
> specifications. The generators are good for documentation but are
> usually implied in some specifications.
> Not all monitors work out of the box, mainly because of those reasons:
> * need to distinguish if preempt disable leads to schedule
> * need to distinguish if irq disable comes from an actual irq
> * assumptions not always true on SMP
> 
> The original task model was designed for PREEMPT_RT and this patchset is
> only tested on an upstream kernel with full preemption enabled.

I played with your additions a bit and I was able to enable/disable
monitors, switch reactors, etc., w/o noticing any issue.

I wonder if you also had ways to test that the monitors actually react
properly in case of erroneous conditions (so that we can see a reactor
actually react :).

Thanks,
Juri

