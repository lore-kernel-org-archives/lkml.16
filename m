Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBD44C79
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 14:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750515678; cv=none; b=SBzZZz/Njquqtnkbug9F7kpaYHJhJ1m/FQVWGPjyhVLVacDP4pbejwr+Zv3lIwpSyafkqdQi8GMaOI1nwlBQWWbZRjtGFvRZB7VPOO8mFRgVMApAdIKFn+k378o7PLjj36LtPtfKMmPEJgP5x4gHTs13QJGdhkEbmEzKn+rbNW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750515678; c=relaxed/simple;
	bh=f3bqyPYq4OSb8BiYibgksVDmuXeRha1XataRsCyi6qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSb53YVsA5CqeRu1jNEUHDqGqyOJhBJyFdhEFzutsce8c0Bc2a3qvYPgIb53zx1AXbMYYixJvsZz+0DbLU+fM1NYSNfcldoitVWDarxEpp70NgwF4A3ZppaO3F4uxEk4XURj/N1mY9t4kCZ0P5jFjNZcLRqxtsJEaW9PBo9zL48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCW3g4Dv; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCW3g4Dv"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7490acf57b9so1283030b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 07:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750515675; x=1751120475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7MjvapN54rNeMCYjquq8u8992nDUuMBEj0MvJ8MlqPo=;
        b=gCW3g4Dv0qIR09d4OW4XuTmM4JNBsiXQN3/nuYrT9KEa3b8gF+PLFdqeg/AfPfsFVJ
         0vyfGdRTWr88GKo0r1lUDTSta+6SuuVBTcDwdUMw8stq/THOH2PM5Y7w8c30F5bbsdLL
         srXfBdOgfklbfdHUsSnoJvANw3JBVswD4t12Idv/1IXiLXOx4MDaqO6mWizLcR3/YXny
         StyvouAn3LmENkhUVppwRN35yuHSOwE+f+/FLj/MY8+kb3zHvZGxCeYVVUTCux908dJJ
         /IJI4hmpYA4ssukC2ejoWPQhgj149bu3nzht+oGBwHCck+sss66EsCZNeeVO/oAFH6X3
         nGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750515675; x=1751120475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MjvapN54rNeMCYjquq8u8992nDUuMBEj0MvJ8MlqPo=;
        b=Wr9MU+ZxOvo9khTeH0iME6j0fhLFdeypGPmO1GwnoUPbBLZbo5HsmW+tayGi7VsHXR
         j5HacvmdzTtXp0JhOr6m9l9PKmlooWciRmbUw1GNIPWjXnfvaZpXzupxNKnuvalhDKhM
         9S5mH47eKVTFs/iTt/MNyR/oBZEUP8K4yByl8v5xTWprAnjqQDzIIAMNg9F4fQ0uIi0d
         yh0J5nSwjLq7SzbJfh2z+CUDKRum3tz7ysLBRIv3v2ibxQiI12tXnSpqOhOPV/g7KhzK
         OTLCCC/apb5niuuqRvXrQSuS62+4JN26wZqV3ra81lhVTOvFBAxIr69oWlaBEl3NIZPL
         a70g==
X-Gm-Message-State: AOJu0YyfITrz8W7UXMsuXbA0FG/d2NL8qaQyl0rr4tLp4lgZsEUENxWb
	+gzP5lh4jgMHiLl2Z/iAdBEOqQ9Z8KWnk5zI/Sq3+jdlEsHeHe1Rn+SW
X-Gm-Gg: ASbGncvYEE6MHTxsbyCrkbFFuhRC7eopMv8mmZI5N8pbmRCe9vs8Dcy86hEMJquYcug
	NpzgtSDAA6nYp7HfBOaQtDgysC25l9+nMKLsnw+Or4q/IyqXdNUnuu2vVv+LQ9P6H2P9jVWi3kQ
	zvXIM9ncOAptdZzI8fuKKNYimjV3qW+sSNj3JWrSnXLuNdj4cR+wMAF4VVRwJiz6b33yqWtau4C
	H5gI2ZztAu8Dz/xZIKOJrEnAuN87WyKiRjuct9TfikLRjHWh2CEBl5IpuUnfmB8Et9b4skXmLHF
	FOjC4lPw48XooNa7CBLjp7p5/VkO/6Dz3bp6z3kSgqdcL/5m0qK6/uLBEX1GOw==
X-Google-Smtp-Source: AGHT+IEHhFNHIuiJ3sNZkG5c7a54b6SumogdXtzQYqbPDasVuCzkxqoHLDOaCHur/rM2cd/Orl0JVw==
X-Received: by 2002:a17:90b:4d10:b0:311:abba:53c9 with SMTP id 98e67ed59e1d1-3159d62c2b4mr10335705a91.7.1750515675028;
        Sat, 21 Jun 2025 07:21:15 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df71ccbsm4090190a91.10.2025.06.21.07.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 07:21:14 -0700 (PDT)
Date: Sat, 21 Jun 2025 10:21:12 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4 0/3] bitmap: introduce find_random_bit() and use in
 clocksource
Message-ID: <aFa_2D584do5p8ne@yury>
References: <20250619182626.393541-1-yury.norov@gmail.com>
 <87frfup01o.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frfup01o.ffs@tglx>

On Fri, Jun 20, 2025 at 11:37:07PM +0200, Thomas Gleixner wrote:
> On Thu, Jun 19 2025 at 14:26, Yury Norov wrote:
> > nodemasks implement node_random(), which may also be useful for other
> > subsystems. Generalize the function, and propagate to cpumask API.
> >
> > v1: https://lore.kernel.org/all/20250604212125.25656-1-yury.norov@gmail.com/
> > v2: https://lore.kernel.org/all/20250608194536.28130-1-yury.norov@gmail.com/
> > v3: https://lore.kernel.org/all/20250617200854.60753-1-yury.norov@gmail.com/
> > v4: return NUMA_NO_NODES instead of MAX_NUMNODES in node_random() (Andrew)
> >
> > Yury Norov [NVIDIA] (3):
> >   bitmap: generalize node_random()
> >   cpumask: introduce cpumask_random()
> >   clocksource: Improve randomness in clocksource_verify_choose_cpus()
> 
> Assuming this goes through the bitmap tree, for the clocksource change:
> 
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

Thanks, applying in bitmap-for-next for testing.
