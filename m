Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823297263D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687695; cv=none; b=ZYujcRGjc2iwyWTu97iKoHeFNrqyMd9Uj8vLMFRrMwcNVRcNtLKj59CS+TUXaJsRF2rQB1zLxpkfR+OKaD0nUHYz0WdddF2elBy9gf6WCTzGDy4wOfFVkYWqEIUR5rxze/BrenNezbLRYNoQi6FFmbU0F505v3m+6h5StGpDyWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687695; c=relaxed/simple;
	bh=j2NwLLP+tVUQU3le2CHeY5WKItpY+MEWflBE5zdlwgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1vc29pz25QCGrRH7nVePV64je62XyAXxpiGC0FYVrOVFpG49VMwJh5nkXHWdSJbjwkxITeYMd1yy/wdilQhurKYKXhI6K9MgUzytNc1rSwkpxou9ZvaATkhyVn+Ex+AGUsjLImgj1XewgT2IRq28VFyKg8EqCHNcIhxy7ME46Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUn55GyP; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUn55GyP"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e818a572828so2990630276.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750687692; x=1751292492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EowSWZHgBam44vNn1dpUDGU5HPdMXeRQtrflhATFszk=;
        b=lUn55GyPBGxUmCgqCPXxuLMnOg6UMcJHIcA5o7I9E43J2GEjrSnL7nGW6ro3JG7cdq
         /2IqzqG+9FFKhCkme3LQ2Lh/06La+tA+kFWZ+uow5NiAjF4PU1tMLUuNAl4R4Ae0KgZ4
         hMOW7NMO/Yzjtd4XSvy+5UmBspm7AKCI0WDZwq0dp4jnxuDhJTYfIkVeumTBUSPWl0UE
         9lENKJKO9lsoyNPlLs7VZpymXDBOkL+GaFIoIeFon5IZTT6papS2NFTClXS5CHbvXu0R
         wzdMcsNvE3ZxahIlK1X4HGqp0Jy82u0igfgHvxUjTVt6iozrd8w3bIkXtlKqNxPBv5Tx
         +9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687692; x=1751292492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EowSWZHgBam44vNn1dpUDGU5HPdMXeRQtrflhATFszk=;
        b=nEAeqR7Pj17yPenE0hkuuDL1MrXD+i4UEPOYVTVhfmA77wh8lJQFQcPYGVaUsN2pzC
         /Vvfp/lpyZMi2dpmS8AIvsxjhb4WyCEkHAm7WeZsMnEDLnw6Q/STWpwDf+10Ns9YaqHO
         5Vaq+/Az9lo36H1y45P3wTdG1UMMioQnh6XcyCD3odUW2FccBfR3ytKZBf+Ij0IuPotH
         mbbIaAWMl0pqFAXFhFA3Qg3w7D5jqkLjQMwf1xbSfzvsQ0a6b+GpLoeEH/U+cMjZvn7m
         gPV6jc4LPF4q7A9hVm1Uf8PjPTKE3XdU37nmBJhDEZFPo4HH0S5tC4vr/9JdDTOgNAPB
         qALg==
X-Forwarded-Encrypted: i=1; AJvYcCV40ZWvIAxDNVQNETiqTiZ9pmah3r3Qn18nZSku42aVyKnI/San+jR3WwJuxH9tQUfZq/d57Pbl6YIs3SA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4xXn5WVfvN/PpnViqZWZDGHQBM/9oDCIXEzWuvwaknKpahSFb
	YIe2BGMYMyJfTLTplD0cxc0eRj+qwogzlBtjt33Wdbho6fHCm36iVrf4
X-Gm-Gg: ASbGncuSX0V99+pfLG3NPmrOHHYVeKn74JyT9Epdh6rksbpBUfe/ddzVoiXB9IMXndE
	Ziae3IC+0Tn210q2N9EZmsmgx3af57VH1WPkF8+pfej9MuaXI3OvkZLNwcyCKouA3G+9UJ8P3sl
	RvR307chb+J2w93s05n9++XbElDmCIvQgJxbSGgrJwRgY8+sCHl6jwTRD+whf5dwg7+VwGHHCrd
	LAkJP4q1Q6HJQucPV97qoP3GBD/S0hfPwJ5M6pYVbxJ28AnQ74KA4uu54Spw8i8MiEB2kRLnqoY
	mHzh0asKg8Pk49By+GFaYH5fWGb8UzYq3py60h2ommHqOIXAHdy76pAfQ0piaQ==
X-Google-Smtp-Source: AGHT+IHYE3nYS125xTmonu6rlnXOXYSJSgL5k5E0ktAjTh63MUDrmHzRWNjGR5ZWVHUoeEPNQJRVuw==
X-Received: by 2002:a05:6902:72a:b0:e7d:cbd0:66a3 with SMTP id 3f1490d57ef6-e842bd078c9mr15228034276.35.1750687691448;
        Mon, 23 Jun 2025 07:08:11 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:40::])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e85e70124e5sm341310276.11.2025.06.23.07.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:08:10 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: SeongJae Park <sj@kernel.org>
Cc: Bijan Tabatabai <bijan311@gmail.com>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	david@redhat.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	bijantabatab@micron.com,
	venkataravis@micron.com,
	emirakhur@micron.com,
	ajayjoshi@micron.com,
	vtavarespetr@micron.com
Subject: Re: [RFC PATCH v2 2/2] mm/damon/paddr: Allow multiple migrate targets
Date: Mon, 23 Jun 2025 07:08:07 -0700
Message-ID: <20250623140808.2479244-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250621181127.36394-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 21 Jun 2025 11:11:27 -0700 SeongJae Park <sj@kernel.org> wrote:

> On Sat, 21 Jun 2025 11:02:15 -0700 SeongJae Park <sj@kernel.org> wrote:
> 
> [...]
> > I'd hence suggest to implement and use a simple weights handling mechanism
> > here.  It could be roud-robin way, like weighted interleaving, or probabilistic
> > way, using damon_rand().
> > 
> > The round-robin way may be simpler in my opinion.  For example,

[...snip...]
 
> Actually, probabilistic way may be not that complicated.  Maybe we could to
> below here.

[...snip...]

> But damon_rand() might be more expensive than the roud-robin way, and arguably
> roud-robin way is what usrs who familiar with weighted interleaving may easily
> expect and even prefer?  I have no preferrence here.

Hi SJ,

If you have no preference here, I would like to add some thoughts : -)

I think that code complexity aside, round-robin may be the better choice for
a few reasons. Like you mentioned, I think it is what users might be used to,
if they are coming from weighted interleave code. Also, I think a round-robin
way will prevent worst-case scenarios where we get a long stretch of allocations
on the "wrong" node (but maybe this isn't a big deal, since it is so unlikely).

Finaly -- If we run workloads with mempolicy wet to weighted interleave
*and* with the weights already set, then pages will be allocated in a
round-robin fashion. I think it may be best to try and minimize migration costs
by trying to keep these weights in-sync. That is, if we have a 2:1 ratio,
we will have the following allocation:

node0 | oo oo oo oo oo oo oo ...
node1 |   o  o  o  o  o  o   ...

Using a probabilistic migration, it might change the pattern:

node0 |   oooo oo o ooo oo ...
node1 | oo    o  o o   o   ...

That is, the ratio might be preserved, but we may be doing unnecessary
migrations, since a probabilistic allocation isn't aware of any underlying
patterns. With a round-robin allocation, we have a 1/total_weight chance that
there will be no additional migrations, depending on where the round-robin
begins. I also want to note that weighted interleave auto-tuning is written
to minimize total_weight.

I'm wondering what you think about this. Perhaps there is a way to know where
the "beginning" of round-robin should begin, so that we try to keep the
allocation & migration pattern as in-sync as possible? I have a suspicion
that I am way over-thinking this, and none of this really has a tangible
impact on performance as well ;)

Thank you as always SJ, have a great day!!
Joshua

> Thanks,
> SJ
> 
> [...]
> 

Sent using hkml (https://github.com/sjp38/hackermail)
