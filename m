Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CE2F513
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 00:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743555041; cv=none; b=fxW0lrcmklHWynGBDwrL810uFqBgS14JEDwtizRfTzi0/CkICVk52jgTiISavDJrcOE4ft3p4avhHJJg/Z/y1O2ndui8cemh9ebSvLI0H8wTScXNHI0urDRDilOXn2dNdF21JQTuWktAGezzaPfFK7sLzBc8fAtrMWfsZ3ro8vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743555041; c=relaxed/simple;
	bh=2HtuutMy+lDMR+2ROadl7v745BYRGRRdl+H5LeHcAUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCeerL47jlJvEIpC4d6IlpjT41T1R9j1ZR81JxBJRc12cG1laf2TBXHxHTKkktf6D5ud2jEYYMcBuOu65Bbp17eokA58T6gaKmhyxhH6H/sBdYEXWlPySxs3bqUb4kFElWjOJLwmapyG/WFRSr+wOnBDgZRDLKKoG+jzwsUBdmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VIjcC9ot; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VIjcC9ot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743555038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vJTNg57TpFxM6eiCchcjLRtnNvCRkiMrbkIi/jphXdc=;
	b=VIjcC9ot5+Hsk6T/ZkGtP92v3vWB5YWtyswTvKYmXEUyOc0/gHtL681VXzxGVMeYV/UzEm
	0a2tAiIMH4Ct0MkLO0oN0lobiWtPoQo0Md8QtqxZ27uCECf8OC+PsB2ZToea35dSOCEU8b
	4u5PUvC4+3/H7KV6iwR0nvymeHTQesQ=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-Wtan21V5P821LbLHOjiyUw-1; Tue, 01 Apr 2025 20:50:37 -0400
X-MC-Unique: Wtan21V5P821LbLHOjiyUw-1
X-Mimecast-MFC-AGG-ID: Wtan21V5P821LbLHOjiyUw_1743555036
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff605a7a43so17213681a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 17:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743555036; x=1744159836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJTNg57TpFxM6eiCchcjLRtnNvCRkiMrbkIi/jphXdc=;
        b=ae8j9ljWqVPbHO4pQ9OxXme4KuVb0YssYMkOur37SPYlY6/N/XF11PTjbM7nYhn64p
         gQFlD8ReEezq+wz6fzASe+snlg5vFpO1YF4F+onCRRv0ngaJ1kP2w3dBEv3WYlD59PGl
         uew5QdG47EkJPtjyeE6z185QRZX+bdNH/yWzVjDavL+qxs9DbZVogokh70uCMzjjQtWV
         fGTF8gTEdIwMLXpUwwQAZH8t5TdO19NTrDk4Q6nQtRkMzoefCEXDO+aYQwucovkUJQCr
         ZmZ1C+SKgD01ku3cO4NcawaKQ1gq472MkyRCPXTMY8nhpW+MqBSKfnOd9mN0GX7J3Oda
         CW4A==
X-Forwarded-Encrypted: i=1; AJvYcCUFoEBvEF7AcwU1PxDgBITahzOGgSyGHG41wG4R29BcnWeVoy9aevHXQVjOvPg1OicfVE81wfr614JqX/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxn2R0Vw6mNRqrp9DSL21UVKdkPd8utzvkPEcknvY3f0JlgXgW
	xKhEh3pvjNTqNXApyuUVYcfJE5kgZIF9uJNbv10gC5BCfMAfViz/ksTVNkqbvaqHgZsaA2faV5+
	k2uD9dYYH6fQ0lk7d7721AG0FUaRUbpMdu1jbCBHq/jd2pYlsZCqCZG+wdYNgiA==
X-Gm-Gg: ASbGncsXZPHUXxXYskgXAuMpjW03CGZHR18buEAUBRCD/GEZIs/E/p9KQ7OW2+Fz02p
	f1J28zpLDe/tzMOMpozRMYHkWSxeAOZnlXZmWEwZpDStIY8CaomfOE4ihFXB0P6QV3K4phCxbqG
	cG70YR6dIETKHwCXNNKmQKma1nUmRxcbRFmlxZKi7q+8+lT7XcQpKGsKamA74mugvSY4pRvLd5M
	UFIvvxj/nhoUZyyKfO4YIbc1SIY0GKLAaQ4pBnOvtT66EHFyxY9YzYCrk/4KebrVYCzUQ==
X-Received: by 2002:a05:6a20:d04e:b0:1f5:730b:e09a with SMTP id adf61e73a8af0-200e4c4f75fmr590022637.20.1743555036454;
        Tue, 01 Apr 2025 17:50:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdk1FxrJ+9cINgByDopFSozFjxckoY96NPi7m/sZgKLt5ACht/tUy31f50xwZLM8tQpD7l1Q==
X-Received: by 2002:a05:6a20:d04e:b0:1f5:730b:e09a with SMTP id adf61e73a8af0-200e4c4f75fmr590003637.20.1743555036171;
        Tue, 01 Apr 2025 17:50:36 -0700 (PDT)
Received: from jpoimboe ([2600:1700:6e32:6c00::1e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b8acb9esm8768221a12.54.2025.04.01.17.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 17:50:35 -0700 (PDT)
Date: Tue, 1 Apr 2025 17:50:32 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	Randy Dunlap <rdunlap@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] iommu: Convert unreachable() to BUG()
Message-ID: <6zzyjtvkqc4ipj7ngtkx3jithfwpwuxlix677urlehgdnljwbl@wfoa5futari6>
References: <0c801ae017ec078cacd39f8f0898fc7780535f85.1743053325.git.jpoimboe@kernel.org>
 <20250327123718.GB31358@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327123718.GB31358@noisy.programming.kicks-ass.net>

On Thu, Mar 27, 2025 at 01:37:18PM +0100, Peter Zijlstra wrote:
> On Wed, Mar 26, 2025 at 10:28:46PM -0700, Josh Poimboeuf wrote:
> > Bare unreachable() should be avoided as it generates undefined behavior,
> > e.g. falling through to the next function.  Use BUG() instead so the
> > error is defined.
> 
> Right; I did a pass like this a while ago and thought I'd removed all
> unreachable() abuse.

Any reason not to just "#define unreachable() BUG()" and convert UD2 and
similar to use __builtin_unreachable()?

-- 
Josh

