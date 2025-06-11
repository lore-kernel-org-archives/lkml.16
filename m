Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBF2271459
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749643420; cv=none; b=HwcCJcE+fIxKt7zitI2lRyuQen4X2wPY1no8Z4onLjfaOSLZulRBFh+P0VPeeyy9Zx3iE4Mng3LsmCqHXtShm/5EP/JWSc7jsQNOCeRIRgy/VOqzav8iY6VSnomw8k4r93ouNhbrSrOkKGerKEFv/scFdR8hAdxVDnteDuJTJ+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749643420; c=relaxed/simple;
	bh=xQMpjsktnyBqwJyTyTMGWZcU/UY4zIxoDnp1RwTjwK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHcwjEJpGoFljYxzGEZ3XDu7WUns6eAzd9jv9WPl0QgMunrsvf85QBY/u/uNsEPjbmhV2kKRuqL3hwKHqGJV5u7j1qfkxRl6skA/yY20daepnln2O3vKZ9HRGavYZiIvlTkHyXp3VmH1ZkZjaWMAu1LW2e+i663guRvC6+ko6VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Xhi5nb3p; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Xhi5nb3p"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7306482f958so4281419a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1749643417; x=1750248217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xQMpjsktnyBqwJyTyTMGWZcU/UY4zIxoDnp1RwTjwK0=;
        b=Xhi5nb3pWQ4E7oorY/8hOzkDSvL55t8iZBU82+v/Rgh9Buw00pDcel6xcTzsXLoSgG
         KkYDFASQR6jMcHDB77Y+AEZYbskbdXahW/272v9+rFsHOHUHDPCu7NYvUpujLF8GMoVo
         9xV95TV0hWQ8s3RJ6OnT3mmxn18gt21P4sj6gg7NqRrAD+UwFLvuGGJOAy8YHVMCHdgu
         +vR4GAfw8ajbJq9x5fwbh4vhwgheSjkQBvyz4En0+HDH1CPTQbySqMrTqTI7O5MIrQ72
         XfpRBvYCL00DdTpgmGc2MypBmBJqYD6sbc+36/QVN/k1pUJGgSUdPmr0tkDCWHxT5OOK
         Wpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749643417; x=1750248217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQMpjsktnyBqwJyTyTMGWZcU/UY4zIxoDnp1RwTjwK0=;
        b=eoYC79rieSyJSW2w3P1OijwbFvRliJwhnFdRE7s6XWjALZ0MHg77Us8VuYRyod261u
         pp+4MlGbAwE7lK4WNKXtEHUCmB/bTvBq/uquTlbqbTgylTlDpYiaVYFwYbpTt4dGM018
         o6MxV+1f7qOT8VTOEQvD6qU6tBeA2A+g3dFWVi6In82GcbSxgRoC2ghy8fYkifdIPR8V
         0oAMw5BuYtvOqXOehqVFRvd7MqZ/o6b/MXUjKdGa4ys7a2mExRrk3l3u34QDxWWDlazW
         L1Ks4Ca1w4l6VF5dEejPYjaYNwS3b9bFxw5bfoTtXNxUhuW0BPTTZ9X/1pjo91eruM+P
         bzYw==
X-Forwarded-Encrypted: i=1; AJvYcCXQHrQ6YrfPNGzIY8rkdzjhSjbEQYv5WAesbVEtVub0Jk1jSsniOSdnYZUhkiOqiPSdZzPrgPEhATRHRNA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrle4ADaZ+utCsqsxQQUHhZabkPFgtlWiyobzdAdS6RxtUlFqD
	XqbZUTh3bWC37dDnsVr6TI8Jd6okz/9z9SccFjojqDpcn/8MCELy+x63Im239C2JcEDcKDUbs/0
	Elnn8
X-Gm-Gg: ASbGnctxhKuBWs6xezM0udSr7Zqk/IcVmlsZWCdO2VsSqmFzIC12GzCOUmrsaAwXQdA
	pc0NtsJxFj6aMSnWtiY8mUl+juIg1CNiKYuJ9rOe4lMU75woQhR2//g1vClQsqkWR6Qhi4NYITl
	DGzEqD9IXr2gc0r15X1CefiCajqOREvENG958717OQ/FmpFHYEDQdCLfayZnFIDtk+AtZcEAyxo
	hrYdN2tJW/UW3f0a1ByE4c82NpfPheQW+Xcwlp+0MnYNt9lt8yC9m4lWwOur7p8h/yD72hEEGQ2
	zMbe4TxaPvvlrp/kMQc5d469KzJQ3pK8rvQ+DW6sPZSUwULqPJtQ5XPN0gCxsvdKcUIm4SrXtaf
	VpQ3NzcoAPcK7rvKDyxyqB7Pm9DDKvigbAUbO7g==
X-Google-Smtp-Source: AGHT+IEnr+fiJk7dhtgZbqikdIKoOTlGysdeSZ3Xak/GfADFbwPPEfbGKf49WwpKDrwYETdyC+3P7A==
X-Received: by 2002:a05:620a:4587:b0:7ce:bd05:83ed with SMTP id af79cd13be357-7d3a95470a2mr417094885a.7.1749643406465;
        Wed, 11 Jun 2025 05:03:26 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25a6198b3sm840832685a.81.2025.06.11.05.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:03:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uPKAu-000000045Df-2IPu;
	Wed, 11 Jun 2025 09:03:24 -0300
Date: Wed, 11 Jun 2025 09:03:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Cc: John Hubbard <jhubbard@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <20250611120324.GA858324@ziepe.ca>
References: <2f866f12-2aa0-4456-b215-08ddc9b13b1e@redhat.com>
 <3dfbbd63-697d-42aa-8906-539d74df9123@nvidia.com>
 <44af8f5a-2d94-498b-a3e0-31f5dde74538@redhat.com>
 <20250606184212.GB63308@ziepe.ca>
 <f2d8febc-cf95-44dc-9f01-b28151fe1282@lucifer.local>
 <e5e88da7-d7c5-4a10-9318-76c1e38dd0a6@lucifer.local>
 <20250607134214.GA158671@ziepe.ca>
 <04f52d21-baeb-4286-99eb-99edead514b8@lucifer.local>
 <8ce6c104-d2fb-4fed-a108-224a6113c227@nvidia.com>
 <e3db61eb-6dda-44f7-94a7-97f43c19093e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3db61eb-6dda-44f7-94a7-97f43c19093e@redhat.com>

On Wed, Jun 11, 2025 at 11:32:07AM +0200, David Hildenbrand wrote:

> Later, we can do more advanced stuff, such as storing them in some other
> buffer to persist them etc.

Yeah, you should go ahead with this series, and hopefully someone will
be inspired to separately do some work on the WARN framework..

Jason
