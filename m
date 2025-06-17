Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA462EF650
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170255; cv=none; b=fs2p0v006multWdHIa8yDJZ5OSWsPT4RnqXb34/1M7kphqHtklKqvE+9gFMRdq5EsFknAUK56HKs5O4kUN0YWmvNebuNTstQUbAFeE0GH8gsf+fEC1MkrHRWSMaCK2Cq6DwblnvJ1rTqsYmIZrLkl85+xa8jP9pabGv4DEbyxHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170255; c=relaxed/simple;
	bh=pgRckujxifebMmqGjuPlksy5+XUQ//atvU7V5Z5Wnoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/rUBrxT0qXgpMWh3wPhrLVf9JrIezpklMo6zPI5sfEZq2PTmUaPigyjdg6+q9acn0vrWu8InAA8zEbZPmvT2T1rwKaup9+jVmoBeQblwi/cbC+XkRWN5OqXe336eFg5SE8Yn77dwHVazm/oN3Srxd56a9BsKapMIIs16BVrPwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YFeDjSQT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YFeDjSQT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750170252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8nZJ22rsS0RPWxh3ZE7aCZVwueQlyLoqt+SFU6IEEhY=;
	b=YFeDjSQTrqWCTahBS30hWV+IV7DHoV3tktIPAZK6D/rrVqcytVXp66Tc3bjOwCE1PcFNz+
	RM7s0ECJExLWvuR+IMvwIQoMytkFT+FC7oMWnPjyM4Z+GgORPhoASKBA4lutYjLVP97P5d
	/EAKX2khl6Z8YajtRZ/jErZe1k/9iRc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-6AcTJXLjOPu8zr1UEyeDMg-1; Tue, 17 Jun 2025 10:23:57 -0400
X-MC-Unique: 6AcTJXLjOPu8zr1UEyeDMg-1
X-Mimecast-MFC-AGG-ID: 6AcTJXLjOPu8zr1UEyeDMg_1750170236
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d64026baso40020835e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750170236; x=1750775036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nZJ22rsS0RPWxh3ZE7aCZVwueQlyLoqt+SFU6IEEhY=;
        b=gaQq8DSfuwlfjA7TInWrMzEHgTDgUpOpmRkdCdYgz4PVBOCTmBNFusXwGaCjkjiNDc
         O4Iksc19ygq05dABbHq2hmhy7by3adyKbE7ekTKvhxPsTzmCuxNi+uoE875awm/M/Eut
         ZKkw5AaNLOihwsqvYS5FFVP7TWUmXskXhGBNO0r6e23WWNFFLGT/yIlvWUOQ+KBkVnk6
         +Gw7n3EfSd1d638YvFixzp2ZuoT2D0SF0f+SMvnpsxSe03GjTXz8RKGbX55ASFIlmvkm
         DYFIS8JJjJHWDKLu+CYSM2IgGgv+O5tLusxDMOdorXQlnPW6P6SACrSFfI2fw7bEspwQ
         T+ew==
X-Forwarded-Encrypted: i=1; AJvYcCXwJKcJihoP6yk9fpLAYarhedT/6+863H3wRQJSTs9cypV6vQVXg8JT7i5WzLcx5OI5ggKJ8AORUPxLSc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoXIQqRfnsP5M4S2ZyzIOXbFJV3cH7Jz7TM+Nof1YTDYNS9vwV
	ctGouSqPA+PriPIRC3Ow/9B2YjaEmM7bh9eDEwZjW6bYgXVuofn9VKQ6yt4qsbh28rmjTH6Nqt2
	d1jQO7b2vMwToy0E1UcPVzYy+eZJd53XCY8j7VNC9fqCsxhScUH76A1D1W2q3DIVLdA==
X-Gm-Gg: ASbGncu1V8ZEx1232JxMKBjprM1OP3sJkC82xgiR4HYATB+y2hE14+4hGir1mZ/m1X/
	jzaTeJNvQSyHoeBJKwCUVRtQsh6ZWDeyqjFMuDfLgerse3bSd+deURPOMZhIE+3WisfWkvGCNYl
	UroGBbqH4rAZrYq/v55IoC5whp08mAByK7m3Ld0nrLilEfwO2UUm5dWjz44PXK+KA8oRvTJ9l+2
	kol6Co5GLwPgA6xEA0onf1aSg7REBE2BBD5qzO9DI+fpzedhvJiasV1WAYkaLMcrkFal02vyf5t
	8bjKKzgNqmZ6BPjdPVXzhl+WTA/cJoXT/xU3wA0Hn9XZLgJlFh5Dzw==
X-Received: by 2002:a05:600c:5396:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-4533cac8fdbmr122013185e9.29.1750170236073;
        Tue, 17 Jun 2025 07:23:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFXdSBOaD0bkiX6RgDIIItmoJz66Z98LumAPn/RVxW5in7JWmC1em46bTnPvZqEArSrV/R5Q==
X-Received: by 2002:a05:600c:5396:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-4533cac8fdbmr122013005e9.29.1750170235702;
        Tue, 17 Jun 2025 07:23:55 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.151.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25302dsm171997755e9.26.2025.06.17.07.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:23:55 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:23:53 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kuyo Chang <kuyo.chang@mediatek.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	jstultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] sched/deadline: Fix fair_server runtime calculation
 formula
Message-ID: <aFF6eYzMahzQ9sxE@jlelli-thinkpadt14gen4.remote.csb>
References: <20250614020524.631521-1-kuyo.chang@mediatek.com>
 <20250617085558.GN1613376@noisy.programming.kicks-ass.net>
 <aFFgi_9yxLN-auBE@jlelli-thinkpadt14gen4.remote.csb>
 <20250617141437.GW1613376@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617141437.GW1613376@noisy.programming.kicks-ass.net>

On 17/06/25 16:14, Peter Zijlstra wrote:
> On Tue, Jun 17, 2025 at 02:33:15PM +0200, Juri Lelli wrote:

...

> > To me it looks like we want this (no scaling) for fair_server (and
> > possibly scx_server?) as for them we are only looking into a 'fixed
> > time' type of isolation. Full fledged servers (hierarchical scheduling)
> > maybe have it configurable, or enabled by default as a start (as we have
> > it today).
> 
> Right. Then we should write the above like:
> 
> 	scaled_delta_exec = delta_exec;
> 	if (!dl_se->dl_server)
> 		scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
> 
> and let any later server users add bits on if they want more options.

Works for me. Looks cleaner also.

Kuyo, can you please update your patch then?

Thanks,
Juri

