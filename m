Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B132262FFC
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691963; cv=none; b=gP2yWpFoI3rgDyFjC1p9gJ1Qxl93p3ygG+WjmwCLdtcWQQRCo1w3cNrkX/8/KKGVjvgvzwp7CLX61q7UIQytLy4tBHNKolD/zyJ7tpsvpBvPbMd8tUPUvB7drZsSaQDKS6HfYEnnTG5cyAeUW/KJvOT3LBc/9AipGzW6XRDbl9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691963; c=relaxed/simple;
	bh=HBw0K/pUsw1EWG56SkWes9oFBlpMVWFaZ/mSZ8nJ9QI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pr/s4QKP6LZdXYVvzU2J5b7HXbBID4DtNqB1YOvBoDSssc/9uXeCh4aMD3/r6jEVXhk+xJ99ir0aCNwz66/K/FjbX+M2884yam5gGSdsagvdloCcyZMGsuC1jk8EUlDfmCzsnFGbhbJcxOJkt0TmND6FoRT9AhPCBFJCw2wIeoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aRPxdJXP; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aRPxdJXP"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74264d1832eso5470789b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750691961; x=1751296761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L68Vj+wf1vgLbRjfDcJXU/lKgR6YpK6+gqGtt65WWyw=;
        b=aRPxdJXP2X5iWOucqliAjwNfKcAWLJpcHfv2NYFnAkMNT396gdFHyRJgqD5P7/SGdt
         ryYKvqrnK4I5I1X5wBdtiWKYaMbT4XtwvqqgBaOqeVgZzn+PkllGEnorz4VT2xXZbyPt
         Qfv8eMbazJ49r1reS5961s+zvQ4EPpnxGykZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691961; x=1751296761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L68Vj+wf1vgLbRjfDcJXU/lKgR6YpK6+gqGtt65WWyw=;
        b=JpLmIWTkv9IcsF6Iw9iD4X1pRBbmzQvePYxgTbp7Grres+hek+Uov24dv2FLc6qgED
         RDGwcq90+p2XYPhOPfDRYlJwqU3THatJiKPNyXRtweYXnChlE2U137a4cvcWcrbWig7I
         3SqbZMVatzozBCsW7h7hG5bwHnYe3k9iFMhq+WHevq9RIAdVAK/mV8oSNiY4/80+iqVN
         1WyR+zIii2JuDYfcc0927s4O8ObbX/gg7MaC7G767DTaNggTELT0PvJ33OUr8vU9XgHx
         oRCA+VpF8NfiycH91JP91NGEC5i6u0v78s4h861fC6IP39nGO7HgmudW9dKf15UIiccs
         CEZg==
X-Forwarded-Encrypted: i=1; AJvYcCUOuT/LGG2EVBs2LLlVGOwH9BQaJUPzWtOdCPj8B0QLoyYD7LoANp5CeRXsxU2w6YSBfFYpl2Ox7oQcLSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YysAifCVuiYpdpyu8JPFw8U1t90Suh79WGm3BBEcykTBKjj8ILX
	IZPCWVbAOlKkmLwIMm+mq3DMhLWP6Ha0JKKxz+VMGh0GZG4bvGQW14XSbOdfZYDiRQ==
X-Gm-Gg: ASbGncsKmcoeK2fuFbsQdpuZ23U9b20uP1rcVwMdaYj8E9MTKJRJDro/KPLDGUsLPnB
	++4u+dr7WkCyLYmkXxT//BZaSrtPHP5ChxIn0L1AZ6i5Kx70VoNrdHg/UawuYO24EODNAwtvpHG
	X6NFrOFcqixJv6DF+4ahGywHmN9auA9iX2/ZHyLAS/6zPoHFg+VKxUxmDda3xVdWA1xHR1wbe/N
	gSZjmY2lHnVFw+IRK6P43QPfoVuMQl09MejsSYUNn4I6WOcK+ozldawYPTAwd6dzNEp1Aqb4Srh
	biHKxL/uxYBzRstyrmPjRnrJIYToFjDlf4x3GRDJuIa5c2zEJpvLil1KyvS5Oi57vUzDuWRufcl
	f
X-Google-Smtp-Source: AGHT+IHAMFoKpPGAioWNon4dgwC7NQznCbRRLsGkn80N6ybTcgYj5QZYHqUWMxOi+WYf3I1+C3k/cg==
X-Received: by 2002:a05:6a00:3d01:b0:746:3200:5f8 with SMTP id d2e1a72fcca58-7490d6911fbmr17161484b3a.22.1750691960094;
        Mon, 23 Jun 2025 08:19:20 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:ba03:6e61:74a5:ee9f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46e5fdsm8590527b3a.10.2025.06.23.08.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:19:19 -0700 (PDT)
Date: Tue, 24 Jun 2025 00:19:14 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jan Kara <jack@suse.cz>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Amir Goldstein <amir73il@gmail.com>, Matthew Bobrowski <repnop@google.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] fanotify: wake-up all waiters on release
Message-ID: <4f3vsaxp7q5nm4byfp5b4cbtmwphqozqmtvtncagwehfu3omc3@txrarl2xglia>
References: <3p5hvygkgdhrpbhphtjm55vnvprrgguk46gic547jlwdhjonw3@nz54h4fjnjkm>
 <20250520123544.4087208-1-senozhatsky@chromium.org>
 <bsji6w5ytunjt5vlgj6t53rrksqc7lp5fukwi2sbettzuzvnmg@fna73sxftrak>
 <ccdghhd5ldpqc3nps5dur5ceqa2dgbteux2y6qddvlfuq3ar4g@m42fp4q5ne7n>
 <xlbmnncnw6swdtf74nlbqkn57sxpt5f3bylpvhezdwgavx5h2r@boz7f5kg3x2q>
 <yo2mrodmg32xw3v3pezwreqtncamn2kvr5feae6jlzxajxzf6s@dclplmsehqct>
 <76mwzuvqxrpml7zm3ebqaqcoimjwjda27xfyqracb7zp4cf5qv@ykpy5yabmegu>
 <osoyo6valq3slgx5snl4dqw5bc23aogqoqmjdt7zct4izuie3e@pjmakfrsgjgm>
 <lzvbms7m4n67h46u6xrp3nvdpyoapgghz4sowakfeek44bjndn@kgamxd67q6cd>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lzvbms7m4n67h46u6xrp3nvdpyoapgghz4sowakfeek44bjndn@kgamxd67q6cd>

On (25/06/23 12:52), Jan Kara wrote:
> > My another silly idea was, fsnotify_put_mark_wake() is called in a loop
> > and it tests group->shutdown locklessly, as far as I can tell, so maybe
> > there is a speculative load and we use stale/"cached" group->shutdown
> > value w/o ever waking up ->notification_waitq.  Am running out of ideas.
> 
> Well, but atomic_dec_and_test() in fsnotify_put_mark_wake() should be a
> full memory barrier so such reordering should not be possible?

You are right, as always.  Generated code looks fine:

...
     61f:       f0 41 ff 4e 6c          lock decl 0x6c(%r14)
     624:       75 1f                   jne    645 <fsnotify_finish_user_wait+0x55>
     626:       41 80 7e 44 01          cmpb   $0x1,0x44(%r14)
     62b:       75 18                   jne    645 <fsnotify_finish_user_wait+0x55>
...

->shutdown fetch is always done after atomic-dec.
