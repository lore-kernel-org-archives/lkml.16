Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C147207DFE
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748612381; cv=none; b=pX0FqHi/36dKWYCdKrmr5Xsk18hAwCRTRjvDqn5bl+73/0WruVBJ29lafdZ2elkc6BNYP/ZqHaZCBZLMJcAe7MJOAOxtVBc40XPwGAEHpJ0VZLSbZazIvJeGjniyiVGknlIdvSdb0num5nM1rqrFWPeuJ5ty6VeqBTBeMOprCu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748612381; c=relaxed/simple;
	bh=uiPnWYUvBr2dZYGj5pih1313yI+zbVEDfWOn2toitH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lES96Bop3xLYSlkbuKlUCf+CtCvlhRQaEYVpmhVwF5pPOunQVoD+963ANHfJaVtx1zLSL3ntYlOY6C0Wr8/vdk6UGAZ8Sod/1dS8tG6L9lptgmwipxAVCMwpQ8uB5WVHqHrqBNf1w8+ose2nk0/UsNhl9zCQR/fiJG5FVfZO2yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gRZv1CZI; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gRZv1CZI"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a363d15c64so1363074f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 06:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748612377; x=1749217177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yRGPAlzvwqw6A1h+zbYAm+4VpblGusAQkDYaKOqoOyw=;
        b=gRZv1CZIaX9Fxcw+R4Tf0ekRuSPTNaLzyEAFo50pWgQOQhpdikQ6kL5n8i/oRcMNQw
         n3d3d//y8Qyfmm6CC/K6NBnJgeKaSo17W14tVHm4uGTF/3hPFdMvXqL7yZp3l8jxspmQ
         OIHOyw6OJVUoM6HQ9aIg6i4+kfLv0BmnGePFcEP+AEOTgYB571VmDN36l1qxUVdlLpHw
         DdAAlZEl7LIQJo6gdSgsbdV65kFGs6yVa56pzSqcy1ZV65lr6eVkkUL5HBtYEVL+siua
         my4PZrVr/pTkM3TZk27ZGBuTbwYyjeCYGfdHQ0TIkQs6LEqQRgXtuO89YCdOqBaVB5LS
         aDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748612377; x=1749217177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRGPAlzvwqw6A1h+zbYAm+4VpblGusAQkDYaKOqoOyw=;
        b=SvnyuQLxb4VLbif+NfSpr6tABcdVAomJ2IiXg9SbgSShc4CBGkQL6I3LT4oNlaJIFH
         vXsSMOZUfhldXNyrBBP0nBMVNZTXGNMdYYUWZWbsNZQYYWkJ+AAurmPC9PX4E0WKFxL6
         Nr+Ovt6VywblMuRqvRvthpo8KvLvL1XdflzZm+klWUowz+lV+vidUK2nIJFli8vm7oXV
         +dgSuBNlVYhhhM9dTwiobMiqB5QtLzOCBDBku79VZCxqdr+e3HzDPmIB3Gd4UNH2X/qj
         uFsH90Rjqj61m0IESeaXVEfx+lOV1cHQRfbUpfzAZ38TYkhELrvPioMQmIvOmcWa9B37
         +pVA==
X-Forwarded-Encrypted: i=1; AJvYcCUG22KeR1cYF+64kHSb7x79DMRxoX+hawv2rJiSCb1nvFMwYlUbzGmrX7Q7iQLp54RTSgvLciTVd/9DheM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3HMyB9hxd4WCMKGVoFfZIt6sujCwPfTFZNYZiVGtX9Sff32al
	7JR1pUQDLv4r6ZAk0xvcuZgOls+b0B+Tnc0OXr8UTQ6Br+xKgisqruIWgf00xEX8XRA=
X-Gm-Gg: ASbGncsQBikW+OjToXZygcAl2ijKxPaCJYGc3mufb3eZqNId8eT1LjL7NVFtNiTHgxH
	abBfH52twMhp8PKS/9kbpoJb1EDoAkfVhG1NHXb4udMLNfrRmGweG0erbpu1uGzjSwmGjO33qD0
	F0eZDzfZL9gZkxrERApUzDWm2VcSg3clQwK1U9/RqmSinVcDC6bbQHuSLrPE8P7s2jzU2Srq42Q
	qeNXTjEcG8uio0pNG21B4SV/RksEubfUPz++WzAZqFQB2iv0+KazseMFTpxod0leoY+4AKkIe9y
	8qqMEmAzbgZoqODfjzIKFi51aTe6rV5Bd827mrdC4oqphd+W4JwwuYx8mqNNNs+D
X-Google-Smtp-Source: AGHT+IEo9kE2Be7pLGHE2XuA9AU0Ju3nckFIvGlZabjJ2oxMPb3m4OllHxVr60DZeTamXlijFKgeCA==
X-Received: by 2002:a05:6000:24c8:b0:3a3:55e6:eaaf with SMTP id ffacd0b85a97d-3a4f7a1cda7mr2695435f8f.24.1748612377483;
        Fri, 30 May 2025 06:39:37 -0700 (PDT)
Received: from localhost (109-81-89-112.rct.o2.cz. [109.81.89.112])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4f009748fsm4788637f8f.80.2025.05.30.06.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 06:39:37 -0700 (PDT)
Date: Fri, 30 May 2025 15:39:36 +0200
From: Michal Hocko <mhocko@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, david@redhat.com,
	shakeel.butt@linux.dev, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, donettom@linux.ibm.com, aboorvad@linux.ibm.com,
	sj@kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: fix the inaccurate memory statistics issue for users
Message-ID: <aDm1GCV8yToFG1cq@tiehlicka>
References: <4f0fd51eb4f48c1a34226456b7a8b4ebff11bf72.1748051851.git.baolin.wang@linux.alibaba.com>
 <20250529205313.a1285b431bbec2c54d80266d@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529205313.a1285b431bbec2c54d80266d@linux-foundation.org>

On Thu 29-05-25 20:53:13, Andrew Morton wrote:
> On Sat, 24 May 2025 09:59:53 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
> 
> > On some large machines with a high number of CPUs running a 64K pagesize
> > kernel, we found that the 'RES' field is always 0 displayed by the top
> > command for some processes, which will cause a lot of confusion for users.
> > 
> >     PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
> >  875525 root      20   0   12480      0      0 R   0.3   0.0   0:00.08 top
> >       1 root      20   0  172800      0      0 S   0.0   0.0   0:04.52 systemd
> > 
> > The main reason is that the batch size of the percpu counter is quite large
> > on these machines, caching a significant percpu value, since converting mm's
> > rss stats into percpu_counter by commit f1a7941243c1 ("mm: convert mm's rss
> > stats into percpu_counter"). Intuitively, the batch number should be optimized,
> > but on some paths, performance may take precedence over statistical accuracy.
> > Therefore, introducing a new interface to add the percpu statistical count
> > and display it to users, which can remove the confusion. In addition, this
> > change is not expected to be on a performance-critical path, so the modification
> > should be acceptable.
> > 
> > Fixes: f1a7941243c1 ("mm: convert mm's rss stats into percpu_counter")
> 
> Three years ago.
> 
> > Tested-by Donet Tom <donettom@linux.ibm.com>
> > Reviewed-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> > Tested-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> > Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
> > Acked-by: SeongJae Park <sj@kernel.org>
> > Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> 
> Thanks, I added cc:stable to this.

I have only noticed this new posting now. I do not think this is a
stable material. I am also not convinced that the impact of the pcp lock
exposure to the userspace has been properly analyzed and documented in
the changelog. I am not nacking the patch (yet) but I would like to see
a serious analyses that this has been properly thought through.

-- 
Michal Hocko
SUSE Labs
