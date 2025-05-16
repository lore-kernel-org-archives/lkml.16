Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4FC221FC9
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747421228; cv=none; b=TUzstTLwMDSqSoca6SWCJgLuG6CRr2R5gIuanUvN/VUL6PKFtrgzOoTZQx8V1TNaDRwayF//fyWa8ip6E6Yqb7aqzc33j02SEnJoshPidX8m03DDSWNc86uDd5ZbS/qkk5DGN3AsJdNffhLZ5kGyKyGbcZISVvzoBsqcIjMZ2LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747421228; c=relaxed/simple;
	bh=XQzr/P8LSzc1fGmKf5TzJFNWuKpMYhmvBe/dgZKthmA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cNamipeSbHn2mVtilvz6hk7zUQqdFW8fOoCdIKtOMhUcND8MEbAs6k1njZhPlEoViOfqNH6VLQO6F8cRoXHKvXD3OQ1VDjEFuThVKWbvBIraSqz/lASfOaPiVbopRWZ1qPasb4bp880nmZkbuYlF4WcKF/Df3aZyQSL+v6DcjYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xmoktlVs; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xmoktlVs"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-231e8ec895bso5155275ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747421226; x=1748026026; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qmq5yOzKEYHGMlWUHQrdCglzBtv7bOn/Y4UXiljdeIs=;
        b=xmoktlVs5hMz9PDKC8NIaTrKDZRwzdbCk4gj1oH3op/wJ9crQFte+iJl8WtOSDuW13
         j+55aZFs4lVQU9VNhg7Puk38H7HQzqFnYeE/flXuxOqrx44kNm5juM/5NumeacWOgIUn
         h5w8RJVRgSd1/7WYX2PNff7ySpEYsZLkqPMIO0LVRl1yQVaOkQKHX3Ttq7vE0mKBSER7
         YQ/blYHQtfhLUMod6mfVDb+/Ls8SdB2zAlLvc2HjnyiNMtZcBCRmJe5VGxotqkF+JLGV
         RYRB55wwxrqy7yCl+RzR9g84g0pObt5boQBp8jfig4xSZqf/PHZCuKpc0UaIIJjp33kY
         K90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747421226; x=1748026026;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qmq5yOzKEYHGMlWUHQrdCglzBtv7bOn/Y4UXiljdeIs=;
        b=dXDdbiHqcFY673Qutn/n8FzPjS9LhJfu/q1kaM62xs8DGEIK1oBqL1bf7WEpQuh41U
         EBmZbuO1DADaIdBziObmGsG3xRU/KDOtP+cdqedrX38PylKGvKuIh3ilHMINMG0M+Q0M
         NqN55KHuYzHVDhP/QRkiW7jYGbwmXYghYNw5st9H+TUsvtm3jSK5ebRVrpbnYKuLbVFw
         E4bjPXPepRMCk998TEUDGXQzymQwarT9h/n8LWNx3hMmALOshIXmaAExC19wzb0mI2Hs
         zG0TV/uwEJ+ZQAj6HRPFJYi0NMOIVydkzEgOU5VexK1u6KJSVsF7Oa3Y6tq4iDGHPgAi
         UWvw==
X-Forwarded-Encrypted: i=1; AJvYcCV6do6is6MEenNxVTfpY5MLbfG9BdEh3otqWGWGek1J5iI4Wukj2PHAONsGr7q45HxdbVR1+fopOjJzhY4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu2MwLEzC7ATn3Jxs1IPK7ec12EAXtAUBjjuoqacl7eRorDG0U
	98UYGPkzTg9iKs8xxAPlQ8gbAtTPaxqufUWR+l/WaWTv+GrzTnThhQwL/xI/Av0GG7DYi4VAcET
	y1Frwpg==
X-Google-Smtp-Source: AGHT+IEoABAHTdXlaeskcgYJu03drz+RNn79bIJemm7dWQc6taI6oQUGfiZBOrFd1GdJMi2Hp8JwioagtxQ=
X-Received: from pllb5.prod.google.com ([2002:a17:902:e945:b0:231:e3f0:e373])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d4d2:b0:231:faf5:c1d0
 with SMTP id d9443c01a7336-231faf5c3ecmr19177195ad.24.1747421226086; Fri, 16
 May 2025 11:47:06 -0700 (PDT)
Date: Fri, 16 May 2025 11:47:04 -0700
In-Reply-To: <20250508184649.2576210-8-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250508184649.2576210-1-jthoughton@google.com> <20250508184649.2576210-8-jthoughton@google.com>
Message-ID: <aCeIKDbwVIlBLtGz@google.com>
Subject: Re: [PATCH v4 7/7] KVM: selftests: access_tracking_perf_test: Use
 MGLRU for access tracking
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: kvm@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, mkoutny@suse.com, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Yu Zhao <yuzhao@google.com>, David Matlack <dmatlack@google.com>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, May 08, 2025, James Houghton wrote:
> @@ -372,7 +501,7 @@ static void help(char *name)
>  	printf(" -v: specify the number of vCPUs to run.\n");
>  	printf(" -o: Overlap guest memory accesses instead of partitioning\n"
>  	       "     them into a separate region of memory for each vCPU.\n");
> -	printf(" -w: Control whether the test warns or fails if more than 10%\n"
> +	printf(" -w: Control whether the test warns or fails if more than 10%%\n"

This belongs in patch 2.  I'll fixup when applying.
