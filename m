Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED9214AD2B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359446; cv=none; b=uNG3+S/KS9A0RVLfmP9ganJwU0QHAe199kpOFtUUj/S8kynp393sT8C6hA8/aEeXNYEthUFzg7gLIgXKXzBiwPv1I4EnqdnolJczvsPBUOUypUjWz6rNUEqdrqK9qhxC/B++JsUC2/UmUGF3TWq+bmKGEZa51gsFb9f9uZhujLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359446; c=relaxed/simple;
	bh=GHFKB1QUQJNQTrqD2WwkKwhukhmmQnO6znL7tsSrETk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qoCx/WlnXXFhk6pqKEx9dDoZg/NMHqa916Bm1udBboEEMvhnVoMyZkcLZSN30tLTEDFhSegZGiv3VLl24Sh4thO74f476goru1eyrRj2Kkq+bzjUDbAKEF/X3ce5cWMQIMDIKJ7pbErpPcFKhuqLDTEIntXfWbCnC3LWDuIKaO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ea9Wl5HR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ea9Wl5HR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748359443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I9jwVu8HrDPFPJMGQ2KQGHA1uhYe2Oc6mR5giQLGgIM=;
	b=Ea9Wl5HRbZEAxLaCeF9J0GUdnsU5R/V675CBlxHBRyMEQTRkuBWxjhIhsK0GAxpnIdvSUr
	fhkmh1k6MSFtPuVBZVOKAfT6OnHec9rsqDn46uBH4Ra+vcYNqdrv6qbHWHdtwEm472NklN
	8AG0CstBr718hx3LMrZEQkVSradbl/0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-y1OhgXCrOeidMIEGEIIHGQ-1; Tue, 27 May 2025 11:24:02 -0400
X-MC-Unique: y1OhgXCrOeidMIEGEIIHGQ-1
X-Mimecast-MFC-AGG-ID: y1OhgXCrOeidMIEGEIIHGQ_1748359441
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4cfda0ab8so1222708f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748359441; x=1748964241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9jwVu8HrDPFPJMGQ2KQGHA1uhYe2Oc6mR5giQLGgIM=;
        b=g/bEe0tcAHUZ/2e+U6ISzMTQzPX6aFo7KarCSfjQ+uY6aYvR2J+MbwdYhplKeDFdDi
         g3YjPmooGuAfnJv198kVvtoRjEX8qf/x7Mo5LeNNVVX503pOBIkYmCObsv0cpiwbFbHW
         hva6abByfi4mDfY7HfjgIXXvPNzYhPHLtpXjkdnx8ZjZ+lvVI2wRx0UxrpDXW66UhyGT
         nYx7W2g9adDh+aiX/UuzBSUUeSAPnqgR7zS1KGJZ4+fZMhxuWzYED5EeaWZXgHTOCZYI
         hnpPmrhXed/MuU3rKpsywtKRFLjmtpnle0tZqutJ+X1XADYeDLusuoNtJc2ScafWIIhf
         MGRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5I7pzu1cciRbYg18/m8Xj7dN+onfON60/of+sPstob4E67vn/Sh4k12In0ZhYJu+lSO99v2joY0Nc8f0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8hTdZAzoAdbSgJ991mFD0uIC031At8GonqPQMfp5UNtZB32ZD
	7J8QxWSHJEoJ787oZ3at4HFjAcCAd7FcLAOfl3SmuJjEHJqE/HDVq41VoRLihHy7tl/0Ho20mZe
	I2J1AAfYCP4Fe1e4Diao/r9w7xfdcwJ4xlWX4SE6ODO3W2FfseMFQRZf2bZAhwFOZ3Q==
X-Gm-Gg: ASbGncsYU025nYmqMDW1sz2PdouO9nS+n7rUBXJEAPM0tSgrgbfIANoZN6EvJ4EIswG
	LswLrmETEwqgvwGHYRWaJ/SXm1zstSte+zPxbP4FXHO5iTClgX27WNqKPLmHFDQHNmSmNq+XOkk
	KsSWAQKb4tbNZUeP9pZSBPvpxQ5jqILQeRaDQRbDqrCH3XJBI5Syp8SpaIJMA7djrUgGhLCqhBi
	eMr6n4onVYNIR3qeWKTRvNVcIvN6FpBsVJoLAEKmOKkYw5beMMr9x3f/jqj+6luDSjeELj8BBud
	jd4w2JbRvzwsF6WHR4ym84wlqhSrvLLKzzQU66WCKA==
X-Received: by 2002:a05:6000:1a8d:b0:3a4:c713:7e6 with SMTP id ffacd0b85a97d-3a4cb40911dmr11430887f8f.11.1748359441169;
        Tue, 27 May 2025 08:24:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHRVmqgl3pua6Auz/RYFYwGKLeA+VXh5dWAlPWu0bWW36b7NjZ8rN7M3F6n2Wa8Dc6jXSsuw==
X-Received: by 2002:a05:6000:1a8d:b0:3a4:c713:7e6 with SMTP id ffacd0b85a97d-3a4cb40911dmr11430867f8f.11.1748359440792;
        Tue, 27 May 2025 08:24:00 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.57.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4e6934f30sm307781f8f.18.2025.05.27.08.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:24:00 -0700 (PDT)
Date: Tue, 27 May 2025 17:23:58 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shinya Takumi <shinya.takumi@sony.com>
Subject: Re: [PATCH v2 0/2] sched_deadline, docs: update rt-app examples, add
 cgroup v2 cpuset HOWTO
Message-ID: <aDXZDvzghkimV7A4@jlelli-thinkpadt14gen4.remote.csb>
References: <20250527-sched-deadline-cpu-affinity-v2-0-b8b40a4feefa@sony.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-sched-deadline-cpu-affinity-v2-0-b8b40a4feefa@sony.com>

Hi!

On 27/05/25 23:55, Shashank Balaji wrote:
> The main goal of this patchset is to add the cgroup v2 cpuset controller HOWTO.
> In v1 of this series, Juri commented that rt-app no longer takes command-line
> options. So I ended up converting the rt-app examples to either use chrt instead
> or use config.json.
> 
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> ---
> Changes in v2:
> - update rt-app examples to either use a chrt example or use config.json
> - Link to v1: https://lore.kernel.org/r/20250522-sched-deadline-cpu-affinity-v1-1-2172c683acac@sony.com
> 
> ---
> Shashank Balaji (2):
>       sched_deadline, docs: replace rt-app examples with chrt or use config.json
>       sched_deadline, docs: add affinity setting with cgroup2 cpuset controller
> 
>  Documentation/scheduler/sched-deadline.rst | 77 ++++++++++++++++++++----------
>  1 file changed, 53 insertions(+), 24 deletions(-)

Looks good to me, thanks!

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Best,
Juri

