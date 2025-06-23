Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A477163
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687412; cv=none; b=dBMYhO5OZe4qt71iIjuPFPf+WIi89i22+LxuYNcJn3qg2VaSnrIMMBut/tIoq3cnXv8ElrhfBlFa+vkPD3458F0sULRjVi1088MljAmwwyjE3VJFnjj4GmfFCelNgqGBd3OgLFFYpNew0Mg661f6+Gf34th2xffAy5cTtQ8qeSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687412; c=relaxed/simple;
	bh=vx1K4qKQZ1DteZ5J0H6N54934o4J8mjSRBbMleFn/9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fV7urBHCUxTFzGJrxVh8KS7wdoYqsgKaZdiAfjrnq2o9sgGVIOe8DjlHcLk0YWEVYwuqNcQNSdXtR2Jt/7098C4Db6RaQm0fL5N9n0MgxT1WIBonyTednJD0dmgsBRJT8Oxj83HYQatuAEyyAJsUVg+dDZQF3ItIF2U+t4U5HRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=aCKMsV68; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="aCKMsV68"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fad4e6d949so22460396d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1750687409; x=1751292209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oHQvKS3TWKn2OxZSW1oU1l5YoOyNfHzqUoMyvQKiXDk=;
        b=aCKMsV68qMXBc1IMOcZWSdZ5FDIZgx1wX0QgtCB0tcTP0jmOuRVN1m3Pel+iRQm6aZ
         QzPAyZP2UqTnLxvpKxdp3M+5PnNHDvbgdFxmJYB9ooDJOAJgRmKgpsjxSEsDEwa1CRws
         a+pST7SPp/aqrwCo4Dd28XS741kdcbxMdTtkR5DAnhkmxOh3oq6sootQSms17SibLlcq
         k8XmZUMY293CfEkvMaq2vFC0VqLOpJOtAjPEmnmi5feo1W1Q9FXEam5NTf6w0GrIFx8R
         /6wKyrOorWt3AYp99h6GG+PSSaM3eo1/lwYUlxzDXTBC7xIHXIfpA7i7LIgwzmpavvji
         4VIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687409; x=1751292209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oHQvKS3TWKn2OxZSW1oU1l5YoOyNfHzqUoMyvQKiXDk=;
        b=oQI51B7eNT2kiley4EKVUTwfYAnD9I3GyjlDh9VBL8B/GbCyEBMuU4Fr01yWGgrgFq
         7ZEt+1bwTsnJJiGHkXJb4tvnhUSJcJu3jXb0ASm57LOmXSaE1oRd6t22BElU39UiPaHv
         BF9OkiLByJHEdMdc8afbiqGPaps8PVU9lfER294ckzNNedccaixtPY2J3+MR6lxCGuKV
         AAnOW/TwCfVHdvcu2vnc5shhiRcxT+aHzUBdz9QxfYC+2kmNBwoKmduiIOjE2ksRU9P7
         CF1KwJVCKe1OU+dNAfrtDH97gSTDiSdoVjW+tcARYM2rqBrWRjPGu377BJ5WTVe6nAOQ
         WqSg==
X-Forwarded-Encrypted: i=1; AJvYcCVNtUkxKJPXsBaPZRuuQqn6/0xd3FQ7t5kknHW0iy8gV3IvNunR4ij4vb2ml3OhbBVpuu7k8JAaNdkidmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaLzBbCJSaXOHawPJmcEioWxnJH+b6NdzArMoGHKy0e66VHmyn
	RYAAc1aG5mjwmnbHub7H6qoF2+FMgg+hEaiCMaxXh+p7ld8TkqHpiAP7QERWmuz8q43hGIVMyu4
	lF6kA5cM=
X-Gm-Gg: ASbGnct/WyLAlCrScGGBpHVPPjgMaTzq6uOl/bsAEy5Fl0bu+TCuszsyLqoKliyP7K6
	rJwL+W7+LiHqM1ko/vLDj20XJWG1sPomh8umwomI9xbZcPQDwv8+WY9R3ys4WH+BYztEac74gLf
	tnddgTqW4SGiZ96IHGwG1iqbqiOIY142B0wpLZa7Ws1ervjQmpiFfj2DyebzmzBm9iBp8XPJ5mF
	JkCoS2oMqUhhCN/brNFZmmLcEAjzhOUsnR20Ez7uvTX4ULSNpWGOosNesWHED/+FjPOYpLEeGiz
	QoUQ6P3jZ8Ih152uBhon0MkKHT8JPdEi/XsebV5e1n3HhNbfGJLtba/vcbUvNy1fIuX2gIb9FGc
	qohDmnf2VofiU21UKNLA=
X-Google-Smtp-Source: AGHT+IHV2G54kD9pRv09My18az6RnUtamNkzetpd9U2aimjaqJNjn9lxVwmwJSl2uRadS7czP/BLFg==
X-Received: by 2002:a05:6214:568e:b0:6e8:ddf6:d136 with SMTP id 6a1803df08f44-6fd0a5dd8fdmr213376516d6.45.1750687408570;
        Mon, 23 Jun 2025 07:03:28 -0700 (PDT)
Received: from localhost (syn-067-251-217-001.res.spectrum.com. [67.251.217.1])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fd095c7fe4sm45030926d6.121.2025.06.23.07.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:03:27 -0700 (PDT)
Date: Mon, 23 Jun 2025 16:03:21 +0200
From: Johannes Weiner <hannes@cmpxchg.org>
To: Tejun Heo <tj@kernel.org>
Cc: Jemmy Wong <jemmywong512@gmail.com>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Waiman Long <longman@redhat.com>, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] cgroup: Add lock guard support
Message-ID: <20250623140321.GA3372@cmpxchg.org>
References: <20250606161841.44354-1-jemmywong512@gmail.com>
 <2dd7rwkxuirjqpxzdvplt26vgfydomu56j3dkmr37765zk67pd@aou7jw4d6wtq>
 <9BDD726A-2EAE-46C3-9D00-004E051B8F5B@gmail.com>
 <aFYeU_dL0VOvyeYs@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFYeU_dL0VOvyeYs@slm.duckdns.org>

On Fri, Jun 20, 2025 at 04:52:03PM -1000, Tejun Heo wrote:
> On Fri, Jun 20, 2025 at 06:45:54PM +0800, Jemmy Wong wrote:
> ...
> > > Tejun:
> > >> There are no practical benefits to converting the code base at this point.
> > > 
> > > I'd expect future backports (into such code) to be more robust wrt
> > > pairing errors.
> > > At the same time this is also my biggest concern about this change, the
> > > wide-spread diff would make current backporting more difficult.  (But
> > > I'd counter argue that one should think forward here.)
> 
> Well, I'm not necessarily against it but I generally dislike wholesale
> cleanups which create big patch application boundaries. If there are enough
> practical benefits, sure, we should do it, but when it's things like this -
> maybe possibly it's a bit better in the long term - the calculus isn't clear
> cut. People can argue these things to high heavens on abstract grounds, but
> if you break it down to practical gains vs. costs, it's not a huge
> difference.
> 
> But, again, I'm not against it. Johannes, any second thoughts?

Yeah, letting the primitives get used organically in new code and
patches sounds better to me than retrofitting it into an existing
function graph that wasn't designed with these in mind.
