Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02781E9B3D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998063; cv=none; b=brVjAaPeMu3BGa2LoW+ZoRcOJLdrSEiv/RwulUAg1Uwz1yeTaHqn01t8NiE4WxO4SnROJyo5crJgpZfbZ6rK0HiQuM8vy/MXV6HOYhVWaDxw57VgEyIocrlZW2opA5qBqh0S/e14t6lb/gzOo8+MlTU+sFMP3DzifvNFizoUQYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998063; c=relaxed/simple;
	bh=zDGaPsNn+sHsyuMSVVCvcKEN9xOybH1pQe4tKyhYIbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpFXQSr+qD10ELc3JXCtInBWMSASUZLz6poqjXnlaJadMBQna60vU3teHGpUWjby6r1ZzPLcSnPfSDMYhtzrSn8ZtndUYUcP5mHfOoOasKGjzgDhtge/c+3LwM5Io91Vb5qvvu9wlSqLTQNaHD0Fct4mtYe+oFCdperUJQI0BoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AMMURuwr; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AMMURuwr"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acacb8743a7so112849666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745998060; x=1746602860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TlBz7iF1hek+FTGw3X4aAHw5f1S4jYqTggUPhRMIVXc=;
        b=AMMURuwrJ5A5njlldNIV6popjXuhXpRp056f0DCoCYg9aodP5BPku5C/GCqupBLy9w
         tBc/YDVjDSrWikWqRLwE+RwIf6hWyuc+8vCSP6Rio0NJ/U6Nfd3WfVUJ0jil/NVHMyhX
         0L5M2GSlcu8/Z0v0B0xzPAEwmqgCynZY38GTwp+tDDH59OLoCKyYqns7UAVgWS7bY+Ei
         qjdXntdbDuwuoTMRBt/W9J4ZuZL7ddTWeuQ3uDMshqPGmssBIblLBTNu40IG5cE9YIvh
         +qg0zhgayhMexJOuFwiBd9o2fUUUSMCB/XaZVe20s99v7bUH929ZWpqw+83QqALJN4mr
         avbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745998060; x=1746602860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlBz7iF1hek+FTGw3X4aAHw5f1S4jYqTggUPhRMIVXc=;
        b=d7OhfF+F3FlTKETXo0p5QmxMVAYOcMX6jIOV46w62e/UnDQf3bUGjGzFw8gPNZzxkW
         wTDacOqc86m7vkrwYe0Qb5OczrdOH0PBRZ/cdW2W06Wj/qL9SVTrw4qaoe0Df/Ab7x17
         qjN0mnsRit2KQjzAzctFfmk/sY3K4OFBAa52fQYpVtb/NuFdCY/aeB+JH6MQt6xDfDd1
         zlFNf/sM4Gpl5B4ga11teF2JjVTShJ4Ii8429KAzpxaKGntSQSBIBS+N2HYfA80VdI9E
         eySBmA5cf8/4FdCgRaOyQ7DSnB6a9TUv4yT7xN1k93fMVZ6uZBN+U6/yPuVbw7lPGwGu
         vOLA==
X-Gm-Message-State: AOJu0YyDtBvzsxNuc0UCrAswVkmzUnD3Ve/66t2tnIpDnyw15Q9pyi9h
	XivCsZAzzhvWxMsyryO+eXll6YtWt0UlAqlp2/xMuiVyGF9TrDa5YRiV1eyUuAU=
X-Gm-Gg: ASbGnctPtZ/JtturM+VmgFvSlIrcQS9RVOjOroB5FKfHkBdb8rsdpH7EkjTRi1SrjK5
	mIMz650HMSg5DK2TCWcK2pVjM742JydiOzkOdQU4hgRIspHLedbHjPr2Bs/w+zsYe4Ss582FGny
	RfP+bz3D1k7gyojf4ZIefCxKrOFcvsunCc7xC3Gl11vaUwreMSSYb7Pg5hiwjNMWEOrhMbictXD
	PGL0o9VkeCo9E6w4x1sLBbZ4f0nGdDbrufTPg2orwbdAl9jcNBbqOdfk8jzmgeT2ky/X9eTYkkd
	Msm5LFT4jF13H4T0MMdsMXi9pZMruM8=
X-Google-Smtp-Source: AGHT+IGHXR5iYRXyJph1iKrCVhcSCgbOSnDW32/4au9VmEwpUAXHvuV7+98LviohpFzXoUW7wi3S0Q==
X-Received: by 2002:a17:907:f495:b0:ace:4ed9:a8c3 with SMTP id a640c23a62f3a-acedf68c196mr173112266b.7.1745998060149;
        Wed, 30 Apr 2025 00:27:40 -0700 (PDT)
Received: from localhost ([193.86.92.181])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6ed6affesm884107766b.130.2025.04.30.00.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:27:39 -0700 (PDT)
Date: Wed, 30 Apr 2025 09:27:39 +0200
From: Michal Hocko <mhocko@suse.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	David Rientjes <rientjes@google.com>, Josh Don <joshdon@google.com>,
	Chuyi Zhou <zhouchuyi@bytedance.com>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, bpf@vger.kernel.org
Subject: Re: [PATCH rfc 10/12] mm: introduce bpf_out_of_memory() bpf kfunc
Message-ID: <aBHQ69_rCqjnDaDl@tiehlicka>
References: <20250428033617.3797686-1-roman.gushchin@linux.dev>
 <20250428033617.3797686-11-roman.gushchin@linux.dev>
 <aBC7_2Fv3NFuad4R@tiehlicka>
 <aBFFNyGjDAekx58J@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBFFNyGjDAekx58J@google.com>

On Tue 29-04-25 21:31:35, Roman Gushchin wrote:
> On Tue, Apr 29, 2025 at 01:46:07PM +0200, Michal Hocko wrote:
> > On Mon 28-04-25 03:36:15, Roman Gushchin wrote:
> > > Introduce bpf_out_of_memory() bpf kfunc, which allows to declare
> > > an out of memory events and trigger the corresponding kernel OOM
> > > handling mechanism.
> > > 
> > > It takes a trusted memcg pointer (or NULL for system-wide OOMs)
> > > as an argument, as well as the page order.
> > > 
> > > Only one OOM can be declared and handled in the system at once,
> > > so if the function is called in parallel to another OOM handling,
> > > it bails out with -EBUSY.
> > 
> > This makes sense for the global OOM handler because concurrent handlers
> > are cooperative. But is this really correct for memcg ooms which could
> > happen for different hierarchies? Currently we do block on oom_lock in
> > that case to make sure one oom doesn't starve others. Do we want the
> > same behavior for custom OOM handlers?
> 
> It's a good point and I had similar thoughts when I was working on it.
> But I think it's orthogonal to the customization of the oom handling.
> Even for the existing oom killer it makes no sense to serialize memcg ooms
> in independent memcg subtrees. But I'm worried about the dmesg reporting,
> it can become really messy for 2+ concurrent OOMs.
> 
> Also, some memory can be shared, so one OOM can eliminate a need for another
> OOM, even if they look independent.
> 
> So my conclusion here is to leave things as they are until we'll get signs
> of real world problems with the (lack of) concurrency between ooms.

How do we learn about that happening though? I do not think we have any
counters to watch to suspect that some oom handlers cannot run.
-- 
Michal Hocko
SUSE Labs
