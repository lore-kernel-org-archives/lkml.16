Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7F61E2607
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748597173; cv=none; b=u1xtArtkyauZst0jGYC7r/iAjOMEH2PwYheDVE0GpF0Zfcjhu7P4faxak4ivPeDPxeWHMlra16+f6cbpSmFHgNVrVz2HYsQjzg4l0f6z7HNXgtAIit6xmlX9HYngKlOMbJMl8ZAgEedBZSRYARXA930beFDR5aJ34ee3Yh5d9Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748597173; c=relaxed/simple;
	bh=/NFAes3Xowf8pKG8nRQbR/7RVUBFs50cJ5eGxmQ+XCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkT/I0nZeilOoEepacrqmk2fsKpBmQrYEuqmxwIcxFY6HTOTJ019RlyhLldh952RAgEDtpGN3zJ1VtXy8JvkSZsQNf1UdcNoFrTm8COCEU2G18A3DkSTbSO5FS7sqrqt6OElrqeyD5/bTaTW0DxF45LcU3kVnXOKdxHmN0lMKjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NbjyMilJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NbjyMilJ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-441c99459e9so11772055e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748597168; x=1749201968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WBD4FC4JP/aK9PaRJ0xxbq96AkGHxNwwAgjyDa2KnPU=;
        b=NbjyMilJHJQ2qlaSm7NcKt0tqpm9xhMc/08N64/B8zONv5yxkwUsnumTXY++wdcYn1
         24iUkWbXU6xdM9ttful4NtrEqsaACZwuUFpqWWr+bB5+evtC46KD/s5GSV2ep+PF/QRW
         Kj+j1Bl6l0vuxCMwb0YY5z1jIeHQ+hUbRTHjeTWgFAtOWb2WkXFLzhIpI//IlUHv0ZdW
         ppzLr1hPJjHF9ARSOUJfxFRFISIHfLs+jHwtpgaVUfIPQ8IgG4+gOqunVWE8jfoCowbI
         PYeSTlHf2ZMNZ/5XZmANaT8FB6JSmQuuWFj6WwXFepmcu9yMZmmGDSBUcXoshvm4fE75
         1Pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748597168; x=1749201968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBD4FC4JP/aK9PaRJ0xxbq96AkGHxNwwAgjyDa2KnPU=;
        b=NvqCfwPe1nOvPcn5n7o88NXZAQrgwvMxGnQCz3N50iHqRsEeqYlqQ3wAaaJMrQqHSd
         Zq8+WzPH4Kvpx122cEcaJZQd4+zHHB7RjbYfxFzeZwUrfCqulJ/YRtX0VRF7/lTGc/36
         W2gfMN16atyq6Nl2ZpYMKuxVyrrufkPzpMiMkL7MSNWtd1uU19/h8FFYRAKVS0PU/GuQ
         LRKcUVhuDUWRIjt2ddo2y13WI6ZrJBBbeSrLwyeCaZwUKntoMJ3dfUCEQbJbOou59JzE
         NsvyPxrmKs/Mimr98/6wS6bAAmAGCzZo3c+1/vz+As52lRKQ+P2d4vpKfRKdpiOUDRO4
         X9Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVWeA0NV7mGDHWUIGQwHDT+BE9+7hdaKENNfBQwuzntvFI814cPic524efy6tjiVsTb4/NZeRhVbfn5yvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfRU5EeckyrZQblCyGFEv72xgDoB9Ij42B87tWP39PZhHz7Lq1
	CAEElJS/WQx3+ul+VUWK3ceJILRt3+4MrNVN5BswkYkfkQ/7eBUVY1BAkXDeWmz2gGQ=
X-Gm-Gg: ASbGncu2rYJ0BlgHvNmUfEL8Iq46lZ8W/XIASu3y9uDSxKShx7LyrRZbN8mh2lf3VFw
	U9dFInoElqtsd3f1wf+g2XbFzfrBojPJi76nVxC6gn2u25UFHbVCT7QBWQw/MGp8NmGZBHgY4aE
	WHOsAfkgS0piLFDWf/NHHkNXnAgcWAhzfVVCUrG3Mb/69sU/FtYHo2v+oKjPXzssmnEzEWAYiAk
	xLjJo4dP4am7edliuDBOp9ZLJmTm2hBwl8U5MbsI6CUvr6TFtqLc5YNKmbgb0q4R9+tZDXc274k
	t99ejWIYlNnwbZct0x9UVcBh+XAP5GgVe+J5BfH4Qr/oF5t5GsvgPWtheyV9+law
X-Google-Smtp-Source: AGHT+IHy+f9++7ZGOrh9ZvJit3DYw9n8FLen71ac6q+FlrswfnOM19Wz+9AOWt0fC9IjOkvfOFAdwA==
X-Received: by 2002:a05:600c:5249:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-450d64d3fbemr26298075e9.9.1748597167912;
        Fri, 30 May 2025 02:26:07 -0700 (PDT)
Received: from localhost (109-81-89-112.rct.o2.cz. [109.81.89.112])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d7fa2278sm12794105e9.12.2025.05.30.02.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 02:26:07 -0700 (PDT)
Date: Fri, 30 May 2025 11:26:06 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Cc: Baoquan He <bhe@redhat.com>, Donald Dutile <ddutile@redhat.com>,
	Jiri Bohac <jbohac@suse.cz>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
	Philipp Rudo <prudo@redhat.com>, Pingfan Liu <piliu@redhat.com>,
	Tao Liu <ltao@redhat.com>, linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>
Subject: Re: [PATCH v2 0/5] kdump: crashkernel reservation from CMA
Message-ID: <aDl5rpqCUyf7nX2M@tiehlicka>
References: <04904e86-5b5f-4aa1-a120-428dac119189@redhat.com>
 <427fec88-2a74-471e-aeb6-a108ca8c4336@redhat.com>
 <Z8Z/gnbtiXT9QAZr@MiWiFi-R3L-srv>
 <e9c5c247-85fb-43f1-9aa8-47d62321f37b@redhat.com>
 <aDgQ0lbt1h5v0lgE@tiehlicka>
 <a1a5af90-bc8a-448a-81fa-485624d592f3@redhat.com>
 <aDlsF5tAcUxo4VgT@tiehlicka>
 <e0f7fc1e-2227-4c6b-985a-34a697a52679@redhat.com>
 <aDl1ViMpK_6q_z06@tiehlicka>
 <04a49de5-eb79-431b-ba5b-eae2536781c6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04a49de5-eb79-431b-ba5b-eae2536781c6@redhat.com>

On Fri 30-05-25 11:11:40, David Hildenbrand wrote:
> On 30.05.25 11:07, Michal Hocko wrote:
> > On Fri 30-05-25 10:39:39, David Hildenbrand wrote:
> > > On 30.05.25 10:28, Michal Hocko wrote:
> > [...]
> > > > All that being said I would go with an additional parameter to the
> > > > kdump cma setup - e.g. cma_sane_dma that would skip waiting and use 10s
> > > > otherwise. That would make the optimized behavior opt in, we do not need
> > > > to support all sorts of timeouts and also learn if this is not
> > > > sufficient.
> > > > 
> > > > Makes sense?
> > > 
> > > Just so I understand correctly, you mean extending the "crashkernel=" option
> > > with a boolean parameter? If set, e.g., wait 1s, otherwise magic number 10?
> > 
> > crashkernel=1G,cma,cma_sane_dma # no wait on transition
> 
> But is no wait ok? I mean, any O_DIRECT with any device would at least take
> a bit, no?
> 
> Of course, there is a short time between the crash and actually triggerying
> kdump.

This is something we can test for and if we need a short timeout in this
case as well then it is just trivial to add it. I am much more
concerned about those potentially unpredictable DMA transfers that could
take too long and it is impossible to test for those and therefore we
need to overshoot.
 
> > crashkernel=1G,cma # wait on transition with e.g. 10s timeout
> 
> In general, would work for me.
> 
> -- 
> Cheers,
> 
> David / dhildenb

-- 
Michal Hocko
SUSE Labs
