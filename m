Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E8B1DDA14
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744661497; cv=none; b=V5R6vTX7b2NlnYu1MbWrY//xqItvPcR7xYVfvSFuZkFoC0frrPjBwr9o7Pxyn4J38RXCTwmBJrvcgCD6+i7fsCwEonEezp845OyGI40QPyYV6I5k5ODXby8CvdTE7gtbJrvNlVwt8N5hHwNI1PBZwYgf4FUdBu0QrDtA3v8tfoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744661497; c=relaxed/simple;
	bh=m9JPGoRtrzFiXzQ5JxSpphBesKZxdOJFyE2RAQr2itw=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AeH0qliuADkJo3j4NcO4ec4gGtaSRMlV4RVEWax+jmSWlJSt8o5KVCQUjQk7DQ3O3ARMHEkyltlegbgaZRYkFSeF6sQrY2S5tjM4yMvSy2rg24iaXTKm7QukP1tl63inE1fqbk1RSZFoVA8La2UNjPeSPWeLy5TX97IhBsB64K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DD0AHe1x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DD0AHe1x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744661494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nXBMNalW9AKD2lIVI1ITSnwY/4rOc9i7I/RBVDU4908=;
	b=DD0AHe1xhyWsF8fWQxDP5j1PYEHsokeYdso/IizpypA1vgkTfej3cjXl9b8sVqJ1I61mAp
	L12oqzgbPXkS2lb3KIY/PPc/xQopTkuCY7o59TM73d/CbZahgtFEdy2WwbGktq7VT6Xyn3
	YZinXTkN+NvGp/gj3BGH+jxXDARTHIU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-YyQQ0k6oPRKv17yPQ_at_w-1; Mon, 14 Apr 2025 16:11:33 -0400
X-MC-Unique: YyQQ0k6oPRKv17yPQ_at_w-1
X-Mimecast-MFC-AGG-ID: YyQQ0k6oPRKv17yPQ_at_w_1744661493
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e916df0d5dso73947246d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744661493; x=1745266293;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nXBMNalW9AKD2lIVI1ITSnwY/4rOc9i7I/RBVDU4908=;
        b=Z0w4zaGZySHtEfXvqbWDftqX0XAVxKZEsaxR9K1q2O6EkwQw22UarsBNP7lyXi1wBa
         dLoc41lkhADmV1HYbhvDUKzQM5wDqvDNOV421CUnbPa+QjeYVHzgSNX4rqr+XyMrIz1z
         gS7JGVaAOvP5wq97Eb/1Tq9Rj8/VtIBCUe0NRyHQ8Gsn+CHFJPeRuVEBYIfJ2GjEEOGV
         s0qc6NIlGfzy+owfNKxyNTbVp4xffGX9DWrgNXUSrk2sAEK4Ly3yK+DWbSOk8mPoN8aG
         G4Qq50TVeTuvSsqF7BGHYavZrZhoTWl6L9tEtR01WfCA9W/JmfHZCGakRXhiI/Y04e2s
         3BRA==
X-Forwarded-Encrypted: i=1; AJvYcCXqbAITrkXlkxxv1f6tkpkKUkjUHndBdFFc+KCvmTU5PA0M3XRjpho8lXWMHSOIPH6HIvRpBKkKaQgK0oU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ9UFTR9vWBpmIETGY65Wf2vBU3gfKM6az6pNgCimL7wpc938L
	i9tuvtU+UTyKJkSRwT1GT7Suurb1ovrEIvMu35Kl7JqVc2ECZNvU8IXPt7W9++jlAh0FPMFZsSP
	7EFPVYf43tg4JR2JAiuPG6vxAKumcgWwIq7JoC5mozwbDVlOiFNq7u7KDsC3AAQ==
X-Gm-Gg: ASbGnct0gWEJc+SZQ8av7i7mufNoayxIU94j0rGucpDqKWOH1IetVv7dnI4T0qEUGvK
	GXVIRgf/6m6NjTUNVmM83JdVG/q/zrzWEXqqD9oJ/ij2NU4p8KVubID81B26DzKD+vxjDBZPVt4
	/G1IVW25IfGEnLMYaDaERZNZ+BOOSETr1bFZQuXY7BTCLExmvjMdCfQDcCjJCNThVZ33O8hub7k
	GgF7jV9IjfVues0xvqLxymTKgiQf5iX5mLDKh06JlL+zdNfMGrcL6Ox4ZiuT1T5T3bOUA53hroM
	0ZURIpYzrWvf9+BYOLioJZRBK87+ilvqRbg6ygHISBbm6uVaFSaNxBngnQ==
X-Received: by 2002:a05:6214:1311:b0:6e8:f433:20a8 with SMTP id 6a1803df08f44-6f230cbd3b4mr196025406d6.9.1744661493097;
        Mon, 14 Apr 2025 13:11:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/AFC0dXfa/KAZ1s693oa/ZDYO9eQoMkKLPILSuBvxvLvl1Rt7HkM7Cdfsi6cJATP+A6fq6g==
X-Received: by 2002:a05:6214:1311:b0:6e8:f433:20a8 with SMTP id 6a1803df08f44-6f230cbd3b4mr196025126d6.9.1744661492722;
        Mon, 14 Apr 2025 13:11:32 -0700 (PDT)
Received: from ?IPV6:2601:408:c101:1d00:6621:a07c:fed4:cbba? ([2601:408:c101:1d00:6621:a07c:fed4:cbba])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0dea080d5sm88501366d6.89.2025.04.14.13.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 13:11:30 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <8ba51391-d4fc-41e7-8d71-cebc0feb6399@redhat.com>
Date: Mon, 14 Apr 2025 16:11:27 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cgroup/cpuset-v1: Add missing support for cpuset_v2_mode
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 "T.J. Mercier" <tjmercier@google.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250414162842.3407796-1-tjmercier@google.com>
 <ysc4oguaisa7s5qvdevxyiqoerhmcvywhvfnmnpryaeookmjzc@667ethp4kp4p>
Content-Language: en-US
In-Reply-To: <ysc4oguaisa7s5qvdevxyiqoerhmcvywhvfnmnpryaeookmjzc@667ethp4kp4p>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/14/25 2:26 PM, Michal Koutný wrote:
> Hello.
>
> On Mon, Apr 14, 2025 at 04:28:41PM +0000, "T.J. Mercier" <tjmercier@google.com> wrote:
>> Add cgroup v1 parameter parsing to the cpuset filesystem type so that it
>> works like the cgroup filesystem type:
> Nothing against 'cpuset_v2_mode' for the cpuset_fs_type (when it's
> available on cgroup v1) but isn't it too benevolent reusing all of
> cgroup1_fs_parameters? AFAICS, this would allow overriding release agent
> also for cpuset fs hierarchies among other options from
> cgroup1_fs_parameters.
>
> (This would likely end up with a separate .parse_param callback but I
> think that's better than adding so many extra features to cpuset fs.)

I concur. It should be a separate cpuset_fs_parameters() to handle it 
instead of reusing cgroup1_fs_parameters() to allow so many other maybe 
irrelevant cgroup1 parameters.

Cheers,
Longman

