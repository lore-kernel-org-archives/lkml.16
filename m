Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF7C2505AF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 20:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744144055; cv=none; b=FT9kJ3jPoKIF/4QEFPOnTkNwS2vPWU8jBjopnJd4jDcp5gs4M2JqwJDQ7sCBNZCRrsR8U0hFfHHROkT/ggsqSroKowRJ88YecH8mFvtLjYHYHBbkgufoaVeHS+rXqvuTwBSTFrzcOEHlEYPgRuebK0fKWYkUt2hjXZyUipruqvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744144055; c=relaxed/simple;
	bh=++qzM9pZTYWM+BnyPIWIoUaaUk2WFwLNWQkAezs1dho=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TZpGZNQVuQpULSbSOGRghS7Y7vS7IySf2jkpmy44fhDBv3XG601ck7qzN9T3xO8SONgPz+/XLKMHBUSsenWfLn3lPS98vXoOsr6NmF/WoID0ZVPy4XbuC9h4IcL2mX8Ga6Q6+9VBbC5sZwZhNsYpfXvQw1+px60vM6VpZwH/CmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oYoPaLa0; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oYoPaLa0"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2263428c8baso10455ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 13:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744144053; x=1744748853; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zl9eXElVYvC/d08LUxLapHLfK6yOmAPuCukaZLlYMGc=;
        b=oYoPaLa078mVbTFgaV1ZrI5nllq37LeNUA8e6z71UMEXtYRu3Ub7wFTBaJ3Ktr6IiP
         4wQFnHoTMzvqj1yq/25Z5CAi0wg7A/UIVKzDQqVCfdi3mgJ84hJnJmSNhq0hilSD+JTj
         H2KlqR8WUCPk2L7dUM7ECk9ZSpj8aa17E3dD/2EQvgYraDwFdVeQd2t2d9z9W1dlW52r
         4mkuvfIzomBW2RpjJ7r0MJ17ZyG9Btkc9pUBNdtknodFCxyBanV02yoSBGR7nXtHWZ4L
         681cVr2MkE4BtzBjVgSJmW4xEC+pyY4ncvQCiBejLH+P1HGKL4a4uB+3E9lw23aNG4UD
         4uBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744144053; x=1744748853;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zl9eXElVYvC/d08LUxLapHLfK6yOmAPuCukaZLlYMGc=;
        b=URJiqg+rtyhV21E6aofPvzNFmkI7tCuqGleN//MqEnNd0EL8XeetgQm8c9srfNLiHK
         m/r+RuRWl9jBN8wGYBGVCqjeSb9KIf7rweNKS0rkmTj/kG3brgsrrLRHj1FB68wmw/rj
         4biaKqUSa/VpvbGjC8XEt0QmFkwsJN4FKclSIAZkLrM0KDlJhQvB9el7EKfXH5LPtEax
         DNAhww4Wwhk0NVuoSXsNLWILI7P9RXkC10n0NkOBIBQptKLz+4awTl7sbBxbCCKoUdMe
         viHNsTEOQWTD8W1VjeebJQvEsLBouiaWqNAXrQsVPOmJiwx+C1IZ5yXoY2UBxwWaa5L0
         Ajlg==
X-Forwarded-Encrypted: i=1; AJvYcCVtHw7Fqs4wHZesU/llQW0xZnQ+2oj3Hp7kGGCARKZQ1/1BLS59j3+qxg3jKn313K+MnS7nIosZH6obQ6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRMZlNUufJxc1feKRT+d7feL5poSOlkND+5LJBUUSIctk/QaKB
	xwJoICnn6Ty3zxrSg6IaURFCoOdyRe8SpjPOwL7jwUoH7PjPHTWY7opdaoC0IA==
X-Gm-Gg: ASbGncs+wTTzmkwT8bmDsWHFTaZReGgohORgQgV3zHu/1NbA3NlIpa8GkOrW6kN8pwt
	jDkNC3TQWkQeWy3nTrVXA+fKrQcN67IjFf/VlUP/RA2ikTYQc1aO5UZni+xuBSL0tmXQs76+sSu
	wuKzFEFJl5o6V9ROiEp9WqyNLV/+sfjGe0xSe0XCuFaGHSEWLKAq9YWwi9sFhNk5j+pjdqZd/KH
	tLUKNw/rktYq4k0ShF3FxnAU9joULu0zkPoEBxnQXNri2kPWApBsKf4P5ywbojmwIAW215gNnUm
	qMO8euDSR8lIZFhQWW2UnGOmBtexeqiyh3fDHqeP8rPoOo+PWy2Assoux7cU3j4CEj7Qyrbm5bx
	Ugz1G8Rz24Y0x05Faq1FAflYrOVrh4x7TYI6j/W0=
X-Google-Smtp-Source: AGHT+IGaP1tt5XEyPUt0p5S4YVh9UW+3H3LMheFD+j349byeR79n33slYeHHkSlxeDJqUXSafc4QvA==
X-Received: by 2002:a17:902:bb81:b0:216:201e:1b63 with SMTP id d9443c01a7336-22ac4626b25mr11015ad.11.1744144052977;
        Tue, 08 Apr 2025 13:27:32 -0700 (PDT)
Received: from [2a00:79e0:2eb0:8:85ad:f0c6:8d52:20df] ([2a00:79e0:2eb0:8:85ad:f0c6:8d52:20df])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057ca1eb89sm11664405a91.5.2025.04.08.13.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:27:32 -0700 (PDT)
Date: Tue, 8 Apr 2025 13:27:31 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Harry Yoo <harry.yoo@oracle.com>
cc: Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org, 
    Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    patches@lists.linux.dev, Pekka Enberg <penberg@kernel.org>, 
    Joonsoo Kim <iamjoonsoo.kim@lge.com>, Christoph Lameter <cl@linux.com>, 
    Roman Gushchin <roman.gushchin@linux.dev>
Subject: Re: [RFC PATCH 1/2] MAINTAINERS: update SLAB ALLOCATOR maintainers
In-Reply-To: <Z_Qz55SbnHK9LoW1@harry>
Message-ID: <839394bc-cd6c-4d34-2f85-8aabf7712459@google.com>
References: <20250407200508.121357-3-vbabka@suse.cz> <Z_Qz55SbnHK9LoW1@harry>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Apr 2025, Harry Yoo wrote:

> On Mon, Apr 07, 2025 at 10:05:09PM +0200, Vlastimil Babka wrote:
> > With permission, reduce the number of active maintainers. Create a
> > CREDITS entry for Joonsoo (Pekka already has one). Thanks both for all
> > the work!
> > 
> > Cc: Pekka Enberg <penberg@kernel.org>
> > Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> > Cc: Christoph Lameter <cl@linux.com>
> > Cc: David Rientjes <rientjes@google.com>
> > Cc: Roman Gushchin <roman.gushchin@linux.dev>
> > Cc: Harry Yoo <harry.yoo@oracle.com>
> > Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> > ---
> 
> Thank you, Joonsoo and Pekka, for all your work you have done!
> 
> Acked-by: Harry Yoo <harry.yoo@oracle.com>
> 

Acked-by: David Rientjes <rientjes@google.com>
