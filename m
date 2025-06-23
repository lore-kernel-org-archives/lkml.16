Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0855629A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750706922; cv=none; b=Dff5oS08LkCaV1ORTDomh6TfxqDz+THQn1MbPGDlLA4u1C6zdDahrk3VkBsCvZegXd+1EGEptjv9BO4HQxdWSD0GLW5Sf2UwgG+18xlNwfh2t2zSIh0Q8DgEcVeGx0EM6PKxi0EG2r1KZ9S/IdufELoCt6thA0CfU3wZ5PW2Jnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750706922; c=relaxed/simple;
	bh=WRJhD+11S9GGLV+fipKxjCq+9EZNj/yOwmCQ0iZsxkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ertZKnrFfJ096bqM7POZqFrmuiggYZmSY6pvBWY4ZUtW3BiMZXk1FDHDySAe6g45PzxdXxqTIDpEC9+l4shwo0KXEqriqob/Rvgi/+aciSyLTDxu8QmNbGFB2JnT0iogayxEsuqJfbBwdB2G8doVVRYtERKsG1iaUxLq9GjBegw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=sV64ubD8; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="sV64ubD8"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6fabe9446a0so47140686d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1750706920; x=1751311720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MEleCZhv9arZ2pHi+mURkLxlUm45MBsyjbMIJWAnz4A=;
        b=sV64ubD8duIyd8psR2/yfHBqX9rDTf7WvLjYP6jucOKGAzH8Cy+oEm9w3AHZL3rO7w
         kv6tOHJ3Tb8yJs5lPmAdZX6oqXR+uPEADGyISoEKNBEsXbtKVG1y8d8il4AcvVdFxact
         q3YUamUdZJCs5lwZkjmtSALQH1bnW4unB2SIrvqDCXnlbMcScQ4x4ZyjE8H3XicRbg9j
         oCqhajEIkkvmk9U8A8deTHTXwc4Mzzo3BhkJhJDSUMaRXHhaTBPSbikG9VLevIWH+inI
         SkV/SR2OGyEZ2PY1ivZwQLgjW4cvWQprZMPyxVJZt2J5Nw1TmZGojQy6On8LlvFoE+tM
         SMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750706920; x=1751311720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEleCZhv9arZ2pHi+mURkLxlUm45MBsyjbMIJWAnz4A=;
        b=uz+MEIO8JQT2ppqdzFfvNSE+IRWK/9ApzwBDuC/aiPr4jyyb2a+6XBDFHFzmJdO1SW
         s0Z46AFnwFZXUWuA4KBkffIr48aabt27lmjMRuSe2dWf5AzI+mE5Nr8VTwxrGWb4Q8Hk
         k5//JKWgPT1vZFlyjhGUxvSKMNTlgaEzT4SKV7taWtkrkuS5Vh+Z4+T9AEDv0U2yGkDQ
         68+lmPR1jpkPCj8Zr8roSw88gfH/5R4DI2WZrPcgKSpwWdcCA88xlzfhCDxRbhY8k5rA
         gM/ENy+x8KTyfpbB8HO6mvO1xqclekzOwWqViHbvHX5gpPEFlNgC6iPcDjR6b/aTSRU6
         TPdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI79kZDvCrWQkYua2E3e85V5ix4X3qbIs8b9t88I4lYZy7LRbenioclUCaD3ZAFzXHQLwbWlGKIwXw334=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7VABh0zahiyqe/S+2Cl60eKOPDZOr906kgS9DwpjCI+u32ra6
	0IuOvgiCiu+I8HjjPdJ5NViDdaa3NONVXoHLjK/4eJEz2ftllJyMvEHs4bH3r2hOQqQ=
X-Gm-Gg: ASbGncvWFhlFiT9Cfo6Nr+PWvioseS6Isbc39kPwEm0wKYhV+MGj3JGysohVAecLadK
	XnhT4+PLrRN5Y2Nl7admTeFJbJ2z4YHvVWgI5ltunon6n1pmy3wkB8BIHg+kKXQWPmMOguZPe24
	5zoBbN1Wqxp6ehEbokK6S0oj/BPMVHCsz/GUIUziVXEYcPzEcb6gFzm87w7r0y1dAD8MQZzfdDS
	LdjkQK7UCZoMmmoVND2r01XG4B6goy0ENpVE7OVBm29p1/SGIs2O3MT2SL2Sr//JhSbSB/35fD4
	gFnZVXO1u17r1I9qrZQWxo5DxPI1Mhx4aJqA4Ua77yAf25fhSsU0NufAlw==
X-Google-Smtp-Source: AGHT+IFddekhlV21epL8woHsqfJs9UDhRue34bYoGICu7apONYW2ZhncpK6K5u+JV8Xd/GANARdn3Q==
X-Received: by 2002:a05:6214:500c:b0:6fa:ba15:e8a with SMTP id 6a1803df08f44-6fd0a468685mr246211096d6.8.1750706919931;
        Mon, 23 Jun 2025 12:28:39 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c091:400::5:e19e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd094330fcsm48301596d6.31.2025.06.23.12.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 12:28:39 -0700 (PDT)
Date: Mon, 23 Jun 2025 14:28:37 -0500
From: Gregory Price <gourry@gourry.net>
To: SeongJae Park <sj@kernel.org>
Cc: Bijan Tabatabai <bijan311@gmail.com>, damon@lists.linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
	byungchul@sk.com, ying.huang@linux.alibaba.com, apopple@nvidia.com,
	bijantabatab@micron.com, venkataravis@micron.com,
	emirakhur@micron.com, ajayjoshi@micron.com, vtavarespetr@micron.com
Subject: Re: [RFC PATCH v2 0/2] mm/damon/paddr: Allow interleaving in
 migrate_{hot,cold} actions
Message-ID: <aFmq5Y1zKov9__zh@gourry-fedora-PF4VCD3F>
References: <20250620180458.5041-1-bijan311@gmail.com>
 <20250620202155.98021-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620202155.98021-1-sj@kernel.org>

On Fri, Jun 20, 2025 at 01:21:55PM -0700, SeongJae Park wrote:
> Hi Bijan,
> 
> On Fri, 20 Jun 2025 13:04:56 -0500 Bijan Tabatabai <bijan311@gmail.com> wrote:
> 
> [...]
> > This patch set adds the mechanism for dynamically changing how application
> > data is interleaved across nodes while leaving the policy of what the
> > interleave weights should be to userspace. It does this by modifying the
> > migrate_{hot,cold} DAMOS actions to allow passing in a list of migration
> > targets to their target_nid parameter. When this is done, the
> > migrate_{hot,cold} actions will migrate pages between the specified nodes
> > using the global interleave weights found at
> > /sys/kernel/mm/mempolicy/weighted_interleave/node<N>. This functionality
> > can be used to dynamically adjust how pages are interleaved by changing the
> > global weights. When only a single migration target is passed to
> > target_nid, the migrate_{hot,cold} actions will act the same as before.
> 
> This means users are required to manipulate two interfaces.  DAMON sysfs for
> target nodes, and weighted_interleave sysfs for weights.  I don't think this
> coupling is very ideal.
> 

Just tossing this out there - weighted interleave sysfs entries *should*
be automatic, and the preferred weights shouldn't really ever change
over time.  Even if they did, if it's the result of devices coming and
going - the updates should also be automatic.

So, in practice, a usually probably only has to twiddle DAMON.

I don't have a strong opinion on whether DAMON should leverage the
mempolicy interface, but I think the way it is designed now is
acceptable.

~Gregory
