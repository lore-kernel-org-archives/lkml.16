Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD41286D6B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749205717; cv=none; b=g2bhwbYzOqFuihTAi0VeLqeDO6ST72KZEtOkQmd6HQ57POEu2hy7zVYI86BatDu4Wx3qSsUPX6qMLc66JvKVwfp8K+yckalswUZI9BdWI60gS/6cMeY+4w5Iwn6OhreYrm/P4TaLAv3vt6gqriW650Aoo/FfTjEv2yvAc7E8444=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749205717; c=relaxed/simple;
	bh=fb/cqwm8IPgZDM2BO5J8THRZMZ4T6ouGM/u2A4WTIyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBe9Fk1PV7LxJrEFldAkCaHP1OQJXqi4nt3HTkGIovqyT4ziQBkJgkAYQX+HZ6BXmT7DScrGKqb6neZ9h7NFu1kJC167+47HV+GlaE9oXTy9cINzGRXfJHS8Fk0EuzTCmIB1bqw6sX8+wEhKu2GU4qyQlFSenJulD6BXP4vQhYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JFGXqId6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JFGXqId6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442fda876a6so16303825e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 03:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749205713; x=1749810513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0y7ijdQypxqLTvbk+opJt5eDnn2DOdTCBFw/PW90tvs=;
        b=JFGXqId6voMsueIE1FRUlNIp4LyGKvnbrbefU0fkmx6M+Xrenk0IgjRLJUBU/J31d/
         VaDQOwRJJ+ARwSODvGMl87d8foVwXBTquNXnzOfGCRYCcv5+lzs527PQGmgwgCWZKhxk
         zg4rBl3kilCP3sm5YqEfWQSo/YllMOS/8LrxtR+OhPIDo+aYMF3uG9tYeg49qFIbkFyA
         RnWoBZCG7iqHRp2ufzkTIg5WraJL6s9NXdKUeFMLqu06PkxXp4XAgNbKy1uY4Ub6MlZY
         qbhsEE6ZvZO8uaU86r4x6qplZ1tWD6OxVYT1MXYUylrXrQwBaSbTU3OaAy+73G/KrBxW
         Ys5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749205713; x=1749810513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0y7ijdQypxqLTvbk+opJt5eDnn2DOdTCBFw/PW90tvs=;
        b=ogyRDCAP6ffEgPymAIIq78ZuiqIFs7bojaIgpRSIUbl0G9MPsOzsc6dGqL4d/HOmvx
         JOMSg2PMupcQC9He2MHXcVLGRH4GpKZ8fWHJetBXnSEXQ25vPH4Rmk0HT//mrgnlTplE
         i3vUwLe3nAlrUFmqgMybhSYkyKqaq9dXa4pLB32tJB3hXg/zo5P6wPoLGfbMXVSZwqzu
         akfZLcEPp4YEDtAhfdvOVZCrfd0uAZj2Qy3Hon7HXvF44/eM0v6a8WllIowTZu1F5IUX
         PrxavpB4XWONX4W9CrQ2w6fLlg4anVPVlfqs6Q9ROXLhQnD2y87Ye/UDK1Rw6VmcB3qz
         yESQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf/oEaM5wHEXaHMHe/+IP8t+JOogPfAeIzmAdY1Tj2jsitvPcxwSIflpCk1IC5QHB7m2oCbFXKu1iTnnc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yynt+LnEsn71C6NcGQXaYezTMWk9FUFDHFbXPMZ6KzpK8WMICqm
	3X4aQUbnSaZul5iLdy/AAd95DYxx8VHYicCMOjLqHp0bLMyZmmvc4EnoHKUa5tX2/2I=
X-Gm-Gg: ASbGnctEBHdwlE2SMY/ErCY6Ko63MVqZU9Cm+ptkh1/NRVzlJdndnGpGjy69bXxbeBp
	2zGAptyY88OmIjQqm/DHnxsye/fkGhqS3O+oeA2pRw32LSc+aoexLuAqkFcJesYoFTggesaCdJ/
	yDGj50O7qbn4Ad3xUmFS830NAp9vYQrhWZOvU8f+9OfLXOjwMxQlEPFYUkwSAhjqHgCITeb/3g3
	5GamaG8tH8avCBcceqLMyMbwC3shP1f8fo3w8Y0eE0nFnsHsfnKirHqO7aDFYEHlX1R8XINgxe5
	AMHRsYoux0dIfUatBq3fpcGNOiOOuN+NPAUbRZ2C0tdWnPeuruDDxbSZLUBCPzeWPDKxdHROpHQ
	=
X-Google-Smtp-Source: AGHT+IGCtW3+HsBx2trqj05+wy5vuf0bHkM0mnvh4NmRgCfrhoDGHG+3c937IQeNhCYs4Lgn9vMx7Q==
X-Received: by 2002:a05:600c:8b72:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-45201360d06mr30369075e9.14.1749205713596;
        Fri, 06 Jun 2025 03:28:33 -0700 (PDT)
Received: from localhost (109-81-91-107.rct.o2.cz. [109.81.91.107])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a53229ddebsm1474197f8f.17.2025.06.06.03.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:28:33 -0700 (PDT)
Date: Fri, 6 Jun 2025 12:28:32 +0200
From: Michal Hocko <mhocko@suse.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <aELC0KqiTttqJNs-@tiehlicka>
References: <20250604140544.688711-1-david@redhat.com>
 <aEFC_12om2UHFGbu@tiehlicka>
 <1a65d0e6-6088-4a15-9c19-537203fe655c@redhat.com>
 <aEKnSxHG8_BGj7zQ@tiehlicka>
 <e680a8f3-7b45-4836-8da7-7e7a0d2fcd56@redhat.com>
 <aEK_R93gihEn-xW6@tiehlicka>
 <50ff9149-2824-4e57-8d74-d8d0c063c87e@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50ff9149-2824-4e57-8d74-d8d0c063c87e@lucifer.local>

On Fri 06-06-25 11:19:28, Lorenzo Stoakes wrote:
> As the "king of churn" (TM) you'll not be surprised to hear that I'm in favour
> of us just doing a big patch and convert all VM_BUG_ON() -> VM_WARN_ON_ONCE()
> and remove VM_BUG_ON*().

Yes please! I really think this is the most viable way to get rid of
VM_BUG_ON which I believe is a generally agreed way to go.

Thanks and let there be a force with your boldness.
-- 
Michal Hocko
SUSE Labs
