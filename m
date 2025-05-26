Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581A07E110
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 14:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748270991; cv=none; b=uUC040uAmyqSnR2HJMjjB4Dztb3qx7J7vTHBsrOv/dTjb+xZoTkJwhAhLft1tP17LBEL3FY5lepuHAVpyLkVxjF5G12RRBMs2QD1yvNDzwq9Kb4bz9pgNQzV8Afnq6kT9FEHm72pjH8NfEPWCFzlJ4j3yd4q+mnJeRiB32AiRx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748270991; c=relaxed/simple;
	bh=W0/hyEwuqgPFvCrdO4dCJvxI2sNISkt+32J7IVABea0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nq1UW02+IZYYNVehI4HU+LDJmyHSFcasTk0a8kfy0B2xhTL6/dzJrDmaGmP1O1fLP0TJIew9eTtMk18vNdcWpZM8j0MIcsK6znAG+GoxWMd9b+V/jH9grwFlGt0ctXb2dzwgQ/5QWxjyef2Zd8VYBCS8njEj72LZeehwzaVaKco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G6VzZtRL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G6VzZtRL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748270988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tbRsQjXJhtCNd3c3uCPjlNU72gknC55NyPzUX0RnmC4=;
	b=G6VzZtRLDoyRQPlSxefVuDcufTXeR9HMecn7B212BckD+Soq8G1NXQUDuHhpjHGqbOCZJV
	xGv8OwzUJgWk3h1MPbaZeSdbW0vDvt+w3IaSgQThAEVErfvGkTxgCCvDF2saT5cOJkcOLi
	BYM6AR1tcdU7aK5Uc9P4eah085dSapY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-YH9Uur0zNc2cnP83a--nrg-1; Mon, 26 May 2025 10:49:47 -0400
X-MC-Unique: YH9Uur0zNc2cnP83a--nrg-1
X-Mimecast-MFC-AGG-ID: YH9Uur0zNc2cnP83a--nrg_1748270986
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-445135eb689so15354985e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748270986; x=1748875786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbRsQjXJhtCNd3c3uCPjlNU72gknC55NyPzUX0RnmC4=;
        b=O9a1KycVc5zVgGFf7H5LKsZOW5ZkPfi03BwFn8x/2N88IhAYwOYlBq5I7WBqCAaFFi
         HRLFL1oOVzJb52VORbHAIj44Z3gpggTo8oNMDq5gd8C3vDs4ksAQbJSK7gzooT5UKNKx
         WC/TqJi6EJWYe2N0iXi/B8I3XeN2R0iQG1OcHWIdNvTDabCI161hN4GRoqierYHxFsom
         89eHpHAOw7NTBdxjlWL0E7Z/lV1yLamLtFU15+yLZ4qbxOZ77oFxdviaApq+V4Du9Ufd
         +r5saRkbJQtWcLq486mYKQRc+cvDCDWh9+uS3LWPbwqGK3yR2f2KybO757ZgzO+/9HGv
         yL5g==
X-Forwarded-Encrypted: i=1; AJvYcCXAaIRLnrIpSEmkvpiAATHL8W1a2Ldy8N6gvuYllhTVSzthJUSV/VTFOtc7KyG+OsItPT5ftsYuYouj3Q0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeuzXshafL9VGqJWGHE1kuIwPuasv9UUttwAHp4S4T2Bex4H4J
	/V0xio/YW/855wI6g2zoCYRp+AEdbqTQu/4NAIbhrPH1HVy27UL1aN25iCcrug0FFDxOoCmfv/q
	daPjE3EO2SRBJHsfXHfpKHgwFceB/L4c/gW7WdRpLA3PPYcsVOjI0mY3Jj46TfD/avA==
X-Gm-Gg: ASbGnct+fk4qeLiKbO2e590pCbKSdIlh9cclEWZ9yqFVFvM9nk2vHDb4SVHLah36ESx
	xDqDitFgp5eeq6UDTJNrwevO9IkbShzl4gtjkwU6Vv3+kMdqnlQYH+RPhYHQPJQ90iPQZfzrt/C
	pPApojfr1vw6SJNpv+nou3c5snZNAdxc1paJXamug98nRztPDkmh7eun6AZPBsCvuoVWsltCo5A
	JjEh+hnfh3i/MehkLGM9nZHh1/oMtgTfPa+Am5FCy6HoxQsSPNgs5X4PdDwKnPSxsXCt8KCOuCC
	TjWh12oqQVDPkAdaQoPEwnYSme9sn7huJ5bQib+8gA==
X-Received: by 2002:a05:600c:3c93:b0:43d:fa58:81d3 with SMTP id 5b1f17b1804b1-44c933f0edfmr65831305e9.32.1748270985829;
        Mon, 26 May 2025 07:49:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEquk3MK1EwO75qTut3w5b91J9jZc5mObLtXUOPqbGkVkc0NrRzBSxJyEDfbLBKJarvXMNWxg==
X-Received: by 2002:a05:600c:3c93:b0:43d:fa58:81d3 with SMTP id 5b1f17b1804b1-44c933f0edfmr65831105e9.32.1748270985456;
        Mon, 26 May 2025 07:49:45 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.57.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44804e89c42sm247878465e9.21.2025.05.26.07.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 07:49:44 -0700 (PDT)
Date: Mon, 26 May 2025 16:49:42 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, rafael@kernel.org, viresh.kumar@linaro.org,
	mathieu.desnoyers@efficios.com, paulmck@kernel.org,
	hannes@cmpxchg.org, surenb@google.com, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, tj@kernel.org
Subject: Re: [PATCH] sched: Make clangd usable
Message-ID: <aDR_hptEDqSxf112@jlelli-thinkpadt14gen4.remote.csb>
References: <20250523164348.GN39944@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523164348.GN39944@noisy.programming.kicks-ass.net>

Hi,

On 23/05/25 18:43, Peter Zijlstra wrote:
> 
> Due to the weird Makefile setup of sched the various files do not
> compile as stand alone units. The new generation of editors are trying
> to do just this -- mostly to offer fancy things like completions but
> also better syntax highlighting and code navigation.
> 
> Specifically, I've been playing around with neovim and clangd.

Me too very recently. :)

> Setting up clangd on the kernel source is a giant pain in the arse
> (this really should be improved), but once you do manage, you run into
> dumb stuff like the above.
> 
> Fix up the scheduler files to at least pretend to work.
> 
> (this excludes ext because those include games are worse than average)
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

This indeed works for me as well. Thanks!

Tested-by: Juri Lelli <juri.lelli@redhat.com>

Best,
Juri

