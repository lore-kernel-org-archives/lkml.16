Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EA8748F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 10:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749031449; cv=none; b=Ma/RpwR/NaOjoplm3rOT1Y9B/guVhMXtIB9IIDhFSAv1JdhoCHk0+nrV4+z1YK0+3nLVGYamqr1n3O2fHZdj5zMQAjk4/fTJRdWi06dpEMTOxufV9XfGdm72brEzeeS+y61mhh8ufoixkQ1wT/xShoZZszeq/M2jv+Zi93lD4/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749031449; c=relaxed/simple;
	bh=seIrY0Gby6UPJGXQDaLd+t1ObaudYSJ3nxhZrP8pwDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BEFC2Mko3M7N5eyx3qRZ31LuhRVie0PmsnvK2TUR+aA533eAVd/s2bmp67Ens+QkpHOCzeRuDmiTNMTBkMKRLVX+yRJEmSVExwfU9z/rINkpvv2Mxtm4QWsV6Cpa3R0a8W7+01kYvRxaodtZgf+9iB+JcW18wt/u/EteIttfKMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TdqsUA0A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TdqsUA0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749031446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XnIkrheePomCWgtSzx9cRRzzCoqZnIbbmr/u3ys8YZ8=;
	b=TdqsUA0AGRcFk/Y9TM+nlr1DSjCHTzMQZHHNLStKMaztAJTjHxnCLH9HRj3KHbnManhNhV
	F2bXbpU88HXC2vmgqBRwKFMRvn0l4sLoH252ic7SifgnKLZoXt3OceZHKRsI41j5zUWNAs
	TSq6g8rC/SI/QOybvt1ZF4ajjElog4s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-xJiOGo6cNt2zgbeHtccfuA-1; Wed, 04 Jun 2025 06:04:05 -0400
X-MC-Unique: xJiOGo6cNt2zgbeHtccfuA-1
X-Mimecast-MFC-AGG-ID: xJiOGo6cNt2zgbeHtccfuA_1749031444
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451deff247cso3686465e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 03:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749031444; x=1749636244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnIkrheePomCWgtSzx9cRRzzCoqZnIbbmr/u3ys8YZ8=;
        b=D8vsSPUMbREFrJdVk8PrJs1cL5CFYDl5XcqfCA/pxtfefWZM6T87m7D3OwQWfd/1CN
         YP8RfDxhjqlXabfiBEh8s4fH6e9xpIAqA72Jsnkv2xr24QzKKnBkNoIZEWR6Ll4Lp9tc
         giui4seRbO5xUNPtPAImEpXvIX5mf+KF2loQEyDiaWI1VkcfwnIZBUIQCghEvJafT6n8
         SXTfP12E4sjYK9O9oDJdqH9gNaKfQ4Yurk1nDJj27CuV7O9lq2LYXgUKlU0xE4oivyLn
         SYlT/Qm6H7/MsznvzQdJxINzHmQxMpn1uTABWYoBEIedq/MGpKL7tyS0KtnsbNdUDl/+
         CcMg==
X-Gm-Message-State: AOJu0Yx/gwn7FaZm2sZeqaq1/scYG3bBauV3+BVojfoitsO9AlXhtZRL
	d3qLfFeHs1x61jQoDUw44XkhiFCmaLGktWjlczzSNTZ3Dv9C8Q1Wbx70R0a+31/dwS2NGa1WPCq
	rmFseWenmupzqEm9j7VKXDmx4RnGqoZG18bKxNghG1Z5EChC/lfx9FSHqpg0s8JLwMw==
X-Gm-Gg: ASbGnct6/O3SXtsJucBgHxl/vEfURkzukpKVn9AUx/bN2bVHHLM17rMobiHsnTbOrB8
	/f5raEEmPnd3qE5UrTmAGaO8kptKc/bfOlhKHRvIejo3cW0QKPRBWVJBgylIylJQQNvaVFuLLQP
	XWJXrvIwGUaTb5EbDz68swEcJOlQt8l9rvpIMclimanzozGsW9A3up+245ctmYPRmHCVcq3YFAB
	B5V1X2dKfbKYQ3bgRPXpLQrtODlFPCoFvjJXR/HzWDbqZG7TUJWE9h7jKMBNmpl2XPdZrJpnLDX
	Js9Oh95MYGVla6rQCrWcHU5tBCJgralgQ1Ctd3tiiOPxXreOJ6G+
X-Received: by 2002:a05:600c:a4b:b0:442:d9fb:d9a5 with SMTP id 5b1f17b1804b1-451efe974c2mr18272245e9.9.1749031443833;
        Wed, 04 Jun 2025 03:04:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEanHcVyh1FY7biXgLM1BeG/aTZ81EZcXqzt0tAJ++LQpzUI+38SEUMpUWcen4rJLqfhMG5vg==
X-Received: by 2002:a05:600c:a4b:b0:442:d9fb:d9a5 with SMTP id 5b1f17b1804b1-451efe974c2mr18271985e9.9.1749031443438;
        Wed, 04 Jun 2025 03:04:03 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.57.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8000d8csm192945285e9.24.2025.06.04.03.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 03:04:02 -0700 (PDT)
Date: Wed, 4 Jun 2025 12:04:01 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>, Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: Re: [PATCH v2 04/10] sched/debug: Fix updating of ppos on server
 write ops
Message-ID: <aEAaEc0-WAnklXjh@jlelli-thinkpadt14gen4.remote.csb>
References: <20250602180110.816225-1-joelagnelf@nvidia.com>
 <20250602180110.816225-5-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602180110.816225-5-joelagnelf@nvidia.com>

Hi Joel,

On 02/06/25 14:01, Joel Fernandes wrote:
> Updating "ppos" on error conditions does not make much sense. The pattern
> is to return the error code directly without modifying the position, or
> modify the position on success and return the number of bytes written.
> 
> Since on success, the return value of apply is 0, there is no point in
> modifying ppos either. Fix it by removing all this and just returning
> error code or number of bytes written on success.

Looks like patches 04, 05 and 07 are standalone fixes. If that is indeed
the case maybe we could move them to the start of this series so that
they can picked up independently (or split them to a separate series)?

Thanks,
Juri

