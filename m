Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C331221A44D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 22:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746570894; cv=none; b=mDeq1AQ09Yf1YJRkyVpEskacI1yR3P0tLuN+kiLDqIOAZY7XYveVOO/RIoMbe2P8RJiPjiHDxU3qJaxQqfA5dnxQoNewqRu+C4gyYHjjRdEoKXT4GvdeWXq91Bn2YPuXuMbQZM0/TsZX66HhiAro9q4VIK2p4abUAABRPZZf6pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746570894; c=relaxed/simple;
	bh=kQJwoQkOOuUv9ewP2W8k5Y7LcX3ISM2sAo09WLHBGYQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ecQpRKupRHMpR3BX9DZrSz3Hs5MLaWNwl080G599tDUFIfp/sbz+0mM8QkPJrndnouCWjXS2bR6ul9Zp//UEdgOT5lZqL8y5NZMjR9QJd/gyAuE++812REE79ReFbaHpZs9zg0jl/lRITk9tQIyKqy7UlnMQ0G7iu9HTxx//J1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C6bnK5U7; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C6bnK5U7"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736b2a25d9fso4018981b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 15:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746570892; x=1747175692; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vSYeF3NvdsfaujuW6koguR2ufsUfIh05BdXXiJcHll4=;
        b=C6bnK5U7I060NWou7N0vVTvHrrBPV27nGNc/k280ABr3IS7BeyJPMV8oO31sGZ9mkb
         P2WJXTAzmhqf+zn15OjuNPBjIVJtNXarSwADx5I2EzbC1XiGm6YV5KsdylwW8ZNyX8Hg
         Y4cYp5bJyTdiPoiSJOSE4FeqNMGDWx0nHn/k2cB8jualg2aNdVVubEodZlbfbKzLQtLg
         fLn2kLoghQGKO8SvjsBMdp6/KYQUbUaljpBE1nnzUCeEv/SyRkbG06nwvN1/WQPcUe1o
         /Aa/vI8w2QkmHNW7ohzvD344RbnXelJXINU3QBdhrSvQhpm5r0V+karZJ6Kai6xt99HG
         eQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746570892; x=1747175692;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vSYeF3NvdsfaujuW6koguR2ufsUfIh05BdXXiJcHll4=;
        b=QX1rJnSJtfbZjfwpZSFXvv7C5kQCIw/LO1I0+n8kvzCOm1JcYoI6GRCc+Yoa3S/JG2
         Qu3KOmwWI+zOAOm/i1jbmgEyGGYdMP/J+/rETf+ASFqDBm0N2rB1jVjOyWjDJR+Ky6Rr
         s9N6ipBdAvhW3dIE2LzJBsuB2NGSZeob273iMMZ4c1OPh2m8TAopsCnsxq3QVExSaM61
         /u52dRHzoOlTkfrDo8gXbbjqwEItuoUI9pxUbTa6k4xPHjIGZSJNvx2tbOtX+xAc/+mU
         E/n+4Bx6iDKKTdDI9WsXyU6+VTkQUP0KiG91rPSyVy8yFuPeycbQdyBuGs7LMYyQfl9D
         m0iw==
X-Gm-Message-State: AOJu0Yx8XEYhULNJRdmi4mP9u9gsCZxga4tGcpa+wHlVmEXoTJcIZqJK
	NfrFnGuxzoZPDA7HTtLetvvjq0l4Oe0RB6Q84Ij3sdz03gjD7t83WMjy7tN2G1JQjZ9yoKrTpQR
	Arw==
X-Google-Smtp-Source: AGHT+IHn4f2mqRKz/trSSnJUgBjvOKZ49UfTsHv5NeriPC5wpnzjyKNCvg7VysLzLScesoUU2LC0MTxehRE=
X-Received: from pgch12.prod.google.com ([2002:a05:6a02:508c:b0:af2:54b0:c8d5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6f05:b0:1f5:a577:dd24
 with SMTP id adf61e73a8af0-2148bffee52mr1185974637.25.1746570892059; Tue, 06
 May 2025 15:34:52 -0700 (PDT)
Date: Tue, 6 May 2025 15:34:50 -0700
In-Reply-To: <20250507073027.72fe0914@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250507073027.72fe0914@canb.auug.org.au>
Message-ID: <aBqOiq9frzCAkNm_@google.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the kvm-x86 tree
From: Sean Christopherson <seanjc@google.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, May 07, 2025, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   3813825ea6d5 ("tmp")
> 
> is missing a Signed-off-by from its author and committer.
> 
> linux-next is not a development tree, it is an integration test tree.

My bad, I fat-fingered a push.  The bad commit is now gone.
