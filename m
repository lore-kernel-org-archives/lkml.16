Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35E117C2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 00:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744070588; cv=none; b=CeovIpQlNCP8wGKkNhD9LMNINfv+pe1T2EMIvYGRhrY8M5S87pcmJAcB+INmu6kDZPJVQN60Mb+E9C4oVakpwAx86jIWJYneBjXvuZpxx53F/7V4102OeTIxu4N7sCM7qy1vM++xsrTu9XDeZT5+n5fvKF50KHGfHi5xzHQ/N4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744070588; c=relaxed/simple;
	bh=hsLgQYSvjOdzJXWdYqzBXca9hWM+lwBSlt/w5O3DlNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p45OBKWUSpdZWWGFJG+W1bWqgxhfl3s/xNHF6pipazBfUU3nfbqU8Ttzs9Cv76ndSET9LtO6aesPociIKEwSCwbXPtdwz7VTNe2Bdjl/ycVNf/hIdI/6nr/05qWLvbpidcUXgwoYq3zW94ISJGWXJ7Wg4zddIjJdy+1Xd6w8+eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=TMmok4aM; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="TMmok4aM"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5e39d1e0eso479775785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 17:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744070583; x=1744675383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kdYPNBOdCkdpUNjtde82AFcxfWzr1Kaf/k9vmv5kSGw=;
        b=TMmok4aMDbn2pqR8a4PsD/AXdDiYcDHFKb0Bb1k4CQOZrlAicoFxNTmZUVncys9K+T
         NeI7VM/X5R7BqW0MeMHk0e+Wr0j2ymJqPK10ehBSdPG+Tnsdv7jsWnXkRTMhpcwpnjMU
         fqW4MxdrwluByhPCfrWXL8ue2udfX/f0ffESh5xtFmsOuDrCji/jNmV7hHfh+BY94c0i
         DNbZJZcfA+ws/I18Gm11UwcJU3FVykGTN03syZ76qnz0XosZU/jTUFryTJqXQyyyvGCH
         m2887ZEpj8RhMIvrIq1PbZC3BC6oT1Ju+GwtP/A5KxfD39s50znOKIvMLDU67y/Eei8w
         uHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744070583; x=1744675383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdYPNBOdCkdpUNjtde82AFcxfWzr1Kaf/k9vmv5kSGw=;
        b=m12/kDiH7otrDOB4Hr+kyQwNlK+sHRuXpCAedaSHmJNSo4otSdBgtVIcHAuzb8SuWf
         PLCNP8vw27pKop/pBgURWZWI+3/B/C3Ech6gei1iIAzzfwAmIW8dMJear+FVWNqRZ6ln
         h7QKmIS/NbArBbX3qahVKhewgm8YRFKkCFcMAPEvJI0hM1EJflQw8HOE3UvDAPs4IC7Q
         qXJlf5dtUWhdko+d7nA+j3NrzuyV3SC/SBzA5DDsB2gWB4XTBNey6Pei4BsljXzE1f3i
         /XQ/98afRtWDf4iPIQRlbCX1NZ5c+2Ji5gyeYBB4grjqEK3eCjOuwViMAp2XHe3+AbTD
         IkqA==
X-Forwarded-Encrypted: i=1; AJvYcCVkIeutVhB32uftZEwBCDTZqJMpQFRnyST1VcV+/OOEDGHGA1sCfnv5kRwGKv+SBD7/GVjATZn3aFm3ANE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWmjvsqFYn2pKHBbik1UKANTui6W8JZrRCfW1MfwnwUqEaReOQ
	XXVUv0AEjdWsTD8h52CCJbMoSY4Yt3YcvqwZ0l5kFI+mTE1XkTt4jvfBCZD6m6M=
X-Gm-Gg: ASbGnct32sIORdLi/dJGt8sid2g/raefhz/zslPRBZwUyYc3h5V2IO0rNsLbJgs7GBM
	rfTlm74bLAqdUkgOh9fbXMxvp3bYvc/7XPNcaVaNW9jH23OUVig+nWh4becR+kIpQlp1bnw8Zdr
	VIu+zsuljk4zYSnp+ujJTXIkOUJcTldi85KLOxMO0VUAkiKGFNCIUw5ID/Glphg6WFHWhcFSUIR
	M9ra8AkB/BFnWT7FOjzU95XXJC1p3cEgOsBiaWYea+cuDccDSglbdaUFHWdj0daN02YplTq2thB
	X6YYnyX7upG/Oqgv5VrH42m9wQbSl9cUkU/Eoov9nEI=
X-Google-Smtp-Source: AGHT+IHKTKgC/tTQpHZWwfrSdql45T85g+gHDDSpqTa0Jcy9A7+YTBLmLSmvDIZT9rURXS8hn2xDaQ==
X-Received: by 2002:a05:6214:cae:b0:6e8:fde9:5d07 with SMTP id 6a1803df08f44-6f01e7724fdmr164498126d6.26.1744070583416;
        Mon, 07 Apr 2025 17:03:03 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f164d49sm65390186d6.122.2025.04.07.17.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 17:03:02 -0700 (PDT)
Date: Mon, 7 Apr 2025 20:03:01 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>,
	Brendan Jackman <jackmanb@google.com>,
	Michal Hocko <mhocko@kernel.org>
Subject: Re: [RFC PATCH 2/2] MAINTAINERS: add MM subsection for the page
 allocator
Message-ID: <20250408000301.GA4545@cmpxchg.org>
References: <20250407200508.121357-3-vbabka@suse.cz>
 <20250407200508.121357-4-vbabka@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407200508.121357-4-vbabka@suse.cz>

On Mon, Apr 07, 2025 at 10:05:10PM +0200, Vlastimil Babka wrote:
> Add a subsection for the page allocator, including compaction as it's
> crucial for high-order allocations and works together with the
> anti-fragmentation features. Volunteer myself as a reviewer.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Mel Gorman <mgorman@techsingularity.net>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Brendan Jackman <jackmanb@google.com>
> Cc: Michal Hocko <mhocko@kernel.org>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Thanks, I would love to help review allocator patches. Could you
please add me as well in the next version?

R:	Johannes Weiner <hannes@cmpxchg.org>	
