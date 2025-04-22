Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768013D6A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745283654; cv=none; b=TyTgc515wLtossdtttg9abtlnou//LOqb8TTVx0c39eAZPZuJsOwyPsuuvDgz1Faqh3hDFhofttVcyCVfdstehnIcw0NGP6RLtCfTL7kMnGwPFOdKPR8v5V9b6gb6v3Wx5K7bQTYvR+0Hu2BQtRmF8iBrvoOu2ploAC03hCjEzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745283654; c=relaxed/simple;
	bh=FN7ge8ZWEGnky0XQuK3P4oUFlqdduIuV6SgS3RSb5/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ql940Mgr9Gf+/w4rmnH62lhzeVGeaAGrwC0B2xh0ODvgHKcOnVj+1deVFLlXYZK8x47m0p+UJSxXpN4Z7j8SiDDOLDvUMZpfiXlN94VnV+dtUsh0lCIKSjNNKXc2ibOQyS81FUqBoH2QPRrH2MnC2Rg/9fB8A4LhR6NERKmmeI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=BEwDMatC; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="BEwDMatC"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c53b9d66fdso626199785a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745283652; x=1745888452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=90WqYzTUohl7lOp7C5Tba3PcsVTn1W7MH0EIP3L7DLY=;
        b=BEwDMatCYp2bbPf6cZNS5KBBKX5WFqRArTrgCZTzeBvVWNW2ChH7ux1EQsAdv0vNmD
         sm/x5e3OJe2Ghxcr7rwbKN0DPa6eUAu4XBEv7bSGTOxlqQmeg0PPlDfANBmGxuEWIsTQ
         9nQbukoHnhOUrymCHXiC3EAnHDIRPJUwXahdQaMfIdhPzmjwZkCqwkP6pxvK7bDRuaDG
         xMASv/rYV+dmjr2NNnj+Vda7bBdSS149mW6SXnkfywY/YGLy8YsnS5u4zKTgnnEN5Yo8
         i0htkLtx9RHs02c/NkTKgXhmngXUlOTIx9gXKPqCeInggE45vvvbOKGUgZVMMlSIMp6N
         /fjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745283652; x=1745888452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90WqYzTUohl7lOp7C5Tba3PcsVTn1W7MH0EIP3L7DLY=;
        b=UDeQ8C++60MbcyKeJz3OkoKg3mSRI6K22YKwU+3T/TVpAY+6AfNM5imLFp3QB8vJoT
         9Mxmgg6jts7jR9wlSjfgd/wD1+EfwDArMjcDFBg1agUGcJ+o7m4o+Y4jXKgltUlO1KL3
         IHnVmWYCOWl8A7cx+lZDJEGcbm7Uc8/i17DVKvE6leiouLw8/svWA8U5jVscfVms8gsy
         LkOOdmVbYB+eHwW5tfoquFqkes6Eay1cCngS0+3SZKU1mIWX9XfweIRepZE9LDa1ggXv
         74sGJaPgsOp14MfKzhY/WM3Ly3ehn0FIu/dm5h8wfyUnr3CSyRPV+0CbeqCcjVxzjStF
         fEiA==
X-Forwarded-Encrypted: i=1; AJvYcCXfAM/lrm46yAkwIuFP5eSDOa9h4VLBoW6DoQyVHQic0YV6EcuyIpHPrPXlq9lOFoLQSINmE9/ueJaT3Ok=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEiDltTNE1DPQIwLB4BtunZiWdlemjL13aLYxPlWZOX4L5gCUj
	sxNSaEMM2YBjfiBq9NuEx14DrsojNbPgRzYctraAUywL6NHkM1gPz0tOXyu+zMw=
X-Gm-Gg: ASbGncvAEQ7G9OnGLa7enXZGoHNhDWmQ+LwTtGzG9sbtRx6mKLgzHrkh0ivC7raGv42
	rj2jRPHSaT9vkdiAP3AONijfnG5w8KXshiAKggnNjUWAWBd6njcBaGBSa6lhA0zCC/4DJhOtcHX
	rxgwXqxnIvS6Kl0Xe8ifGmTpPufxP0Mmr2acxrjG+oxHkNNOBRzvc6WBjHL+6kNSi1WMTyLnPws
	Np5dN8wsp8mjBSZpLIrZL57IBHbGtDVsV7mp82fJJwuuv7U2jeYXevaGvg/qgZ7tnXgK2lxd0a1
	bh/J3BQxJ3Jw9e3BVLHmM0aVbk9yYSY1BuXUegNi8QO9r/f2zuoBXKTc0rQ3OTNQMkuAG3orP1v
	e5yjEnBbqTEbaS4ThCaora9c=
X-Google-Smtp-Source: AGHT+IHiMCQ4CKaumf1ZfYJE8F7xvKHLhb4koX3kikt1CtQaYhbu+kCRWDD9oQA1oGd7re3S+fS3Og==
X-Received: by 2002:a05:620a:2588:b0:7c3:ca9d:210b with SMTP id af79cd13be357-7c927f67bedmr2112823885a.6.1745283651624;
        Mon, 21 Apr 2025 18:00:51 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a6e7casm486458085a.10.2025.04.21.18.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 18:00:51 -0700 (PDT)
Date: Mon, 21 Apr 2025 21:00:49 -0400
From: Gregory Price <gourry@gourry.net>
To: Waiman Long <llong@redhat.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, hannes@cmpxchg.org, mhocko@kernel.org,
	roman.gushchin@linux.dev, muchun.song@linux.dev, tj@kernel.org,
	mkoutny@suse.com, akpm@linux-foundation.org
Subject: Re: [PATCH v3 2/2] vmscan,cgroup: apply mems_effective to reclaim
Message-ID: <aAbqQXJFCIb3Mscq@gourry-fedora-PF4VCD3F>
References: <20250419053824.1601470-1-gourry@gourry.net>
 <20250419053824.1601470-3-gourry@gourry.net>
 <ro3uqeyri65voutamqttzipfk7yiya4zv5kdiudcmhacrm6tej@br7ebk2kanf4>
 <babdca88-1461-4d47-989a-c7a011ddc2bd@redhat.com>
 <7dtp6v5evpz5sdevwrexhwcdtl5enczssvuepkib2oiaexk3oo@ranij7pskrhe>
 <aAbNyJoi_H5koD-O@gourry-fedora-PF4VCD3F>
 <ekug3nktxwyppavk6tfrp6uxfk3djhqb36xfkb5cltjriqpq5l@qtuszfrnfvu6>
 <aAbbtNhnuleBZdPK@gourry-fedora-PF4VCD3F>
 <6e7806a7-9ffd-4c7c-b247-934b206088c7@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e7806a7-9ffd-4c7c-b247-934b206088c7@redhat.com>

On Mon, Apr 21, 2025 at 08:35:15PM -0400, Waiman Long wrote:
> 
> Your current patch is ignoring v1 as css will be NULL. It only works for v2
> with a unified hierarchy unless some users explicitly force cpuset and memcg
> v1 to be in the same hierarchy. You can certainly ignore v1 by using
> cpuset_v2() check.
> 

I'll whip this up and get it out this evening.

~Gregory
