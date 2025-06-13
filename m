Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8849524DD1A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749798320; cv=none; b=WIMFTgpItd83a5E3+vtPVKlZfOWpx9vr8U1UJqckPfvT5XRC486d0dXZYkvLslOyJlsGgStqygi3eR7tdh8UYkgD4L02LDjGzJ8mE9xWo72DworxuZwbJS3izrtEGNchUbB3m/n4Qex3/ReSJp6OeBCQF/9X3dSHJJIWo0b1I9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749798320; c=relaxed/simple;
	bh=1Ml41e/iRFBQdoQFJtk0Exdme5nWC3PBdmBfD9gfcA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q5bz/fLV/Msp2oLxKP8aMdEtq7KGHwz0yDkSUgJ0HzmDJSWum4PiElXVEYO8ICQMVKJQIWVkLGnudmMukQi9NUm8B8HoiVraj0j3MFdlzjqYecXnEqB+6s9ZOOpkHarg1UDm/EPLeb2JilEkxxu0d2Zo7F08QTGQnNIgvDCic+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=c8W+YGyX; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="c8W+YGyX"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so2694425a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 00:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749798315; x=1750403115; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vts8efAArosuOokj2P4hje3a/RKrGpboAfdZMgKD5Zw=;
        b=c8W+YGyXPaRhHiF9sG617lywwE4VbVEAiOP9HBb0gwTaKX4eg+X9fD9XvC7o3zwW53
         fYIe+joe+ZXatmAjseewHNPoeFDBHBNuL4fIxBkA3wrAScaXKRy2RzggprQ24nLDD/4n
         dmA0STSrgBRhaa/CZATOA0F/nuJB0a8voK3wg1PlwwyglNo839jGO9dbXzvNtJ6YVUgI
         KpATMzyPbtTqjOXK+xEfXRgxgLwrUA7kkd6mPZ4dpqgKWDBkLNbd1K12kibuCq8ptHxn
         e3XbVhWwLm+5AKo/2z0hsNIiudBbAXLgq+q0Fh1MpRCWCZNTq+dn01zc/xVm0fspnGz3
         DwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749798315; x=1750403115;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vts8efAArosuOokj2P4hje3a/RKrGpboAfdZMgKD5Zw=;
        b=FXR+x4KyIEfog/mFRJxREFSY/fqijl642Xozgznmi14oAWytKS2FwCEULh0ndKdYwK
         fbsOxG9iF04/im/JLEeADbhMkn8F+GL/R2JHxhFJ/CXsTvMG/J270nXO6lEpGtaYb+Yr
         4ZX2JEXmxnw2pghqGA/LgsM528EkX/LQBfj9/zWWcrdMp9z+jHm2J40fN/i3OJ+cBzb3
         tEcwutWSHFCC/728QwV37nS+lryM0tp9j3wRRbfY4nOAEGXB0UNhQNroTfH5IqcvD20z
         3WXb1K3ODpqCoqa3Gxp8+kZrNa1tNIibVA2WucJh1lxXLzdByUxotZjGGlkQxSMVSJqz
         xNjw==
X-Forwarded-Encrypted: i=1; AJvYcCVDd/SxfVHoUN+ny2Lzyxr0EjXRBj6UPM26691KMyvqBX4mdQ0kEBLxSoRJZ/nRKJ0iDIle5sKDvEcmi1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD+Dbbd+gmHvOC0OAj8oSv8CLujzm/uh61Arnrbuqhabo2hLNg
	wf8V3nbv40BAcg36Mj88rdNzQdRDxB+K1YYO1ACWV310DOQf5H+oqxTwKl8ad4mpYQQ=
X-Gm-Gg: ASbGnct2KT50nhkKenjv70wULVq3yofRJ2hSL18eOyIEA9DAIoy3UHtEFa8qmssDbLR
	nLLbRWJIyrycIK11sK9gpqoBLNrjdNss8a9mBDMz3FeFyTXkAjR3pXOdzpRZReRrXzrEHjpfqSy
	+G6HmewOvlc843b+2oLCnLfFaGxVKRAi7g/eXLmjbmtIRhyZwMvy+RYNMfLeSyGy0egIRNgz24H
	XmL+DTkPbGOLO62Vdx1WNnmLoG0dncDO5cdMx1bK5WDeTxKEJmGvFlsNmygRvnPZUmHFUgS0QaZ
	MRdAgJPuRRdnqNTvj7SkmECUcddIz/WUlzJtxV0WSKz0oiGcs5wUG5KnBm91s0Lt4DkVfZR6tW8
	=
X-Google-Smtp-Source: AGHT+IG8YEcfhRX4lkBSHSbJmFvftKfBrPCbvmRh2jp4NPPsHt14FnfRQE8a8YxmjsTAhMXqtAdJ2A==
X-Received: by 2002:a17:906:d555:b0:ad2:417b:2ab5 with SMTP id a640c23a62f3a-adec5d97debmr151980466b.60.1749798314776;
        Fri, 13 Jun 2025 00:05:14 -0700 (PDT)
Received: from localhost (109-81-85-139.rct.o2.cz. [109.81.85.139])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-adec892b90csm81370566b.142.2025.06.13.00.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 00:05:14 -0700 (PDT)
Date: Fri, 13 Jun 2025 09:05:13 +0200
From: Michal Hocko <mhocko@suse.com>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: David Hildenbrand <david@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, rafael@kernel.org,
	len.brown@intel.com, pavel@kernel.org, kees@kernel.org,
	mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, akpm@linux-foundation.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH] PM: Optionally block user fork during freeze to
 improve performance
Message-ID: <aEvNqY5piB02l20T@tiehlicka>
References: <20250606062502.19607-1-zhangzihuan@kylinos.cn>
 <20250606082244.GL30486@noisy.programming.kicks-ass.net>
 <83513599-e007-4d07-ac28-386bc5c7552d@kylinos.cn>
 <cd548b13-620e-4df5-9901-1702f904d470@redhat.com>
 <a4370ebc-b1ce-46ba-b3a4-cb628125d7d0@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4370ebc-b1ce-46ba-b3a4-cb628125d7d0@kylinos.cn>

On Fri 13-06-25 10:37:42, Zihuan Zhang wrote:
> Hi David,
> Thanks for your advice!
> 
> 在 2025/6/10 18:50, David Hildenbrand 写道:
> > 　　　 　 　 　　 　 　 　 　 　 　 　 　 　 　　
> > Can't this problem be mitigated by simply not scheduling the new fork'ed
> > process while the system is frozen?
> > 
> > Or what exact scenario are you worried about?
> 
> Let me revisit the core issue for clarity. Under normal conditions, most
> processes in the system are in a sleep state, and only a few are runnable.
> So even with thousands of processes, the freezer generally works reliably
> and completes within a reasonable time

How do you define reasonable time?

> However, in our fork-based test scenario, we observed repeated freeze
> retries.

Does this represent any real life scenario that happens on your system?
In other words how often do you miss your "reasonable time" treshold
while running a regular workload. Does the freezer ever fail?

[...]

> You’re right — blocking fork() is quite intrusive, so it’s worth exploring
> alternatives. We’ll try implementing your idea of preventing the newly
> forked process from being scheduled while the system is freezing, rather
> than failing the fork() call outright.

Just curious, are you interested in global freezer only or is the cgroup
freezer involved as well?

-- 
Michal Hocko
SUSE Labs
