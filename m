Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040E1255255
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151114; cv=none; b=W5GAQep21ScagA+0VB6j/5K7xBhQ95WlMNGFD96NW4NQcKPAJ6PYQm6iDyDuXbLGzehzo45hidxFey4grnBuW7TUAv4zaxqQgeWxtrChLOX1RgcdncLHhuJiH96OpJ8Q9t211povJBmRicbNo4CIp/Ho1+5+AB2HFK3Zj0bh7dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151114; c=relaxed/simple;
	bh=ccAlpK2GJ8AJvkq+fowLZF3c1eIeInVWDTpL7xW7Uc8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pnWk8pNxLZPe3PnYqAIMEibMj2LMhHUZ1NDs/o4b7+hJwUlnBL9IEREEKroUmMF/deovr9AjhLlC6/1L0FPaBTIaHk5WKqkc6Yo2QbwxOSVzTQ728pRq5y6sLqyKfJuVm0khndvjVVBZVtU26euFRoHrhhNo2/0WamB+VT1vgXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wrjaw6x0; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wrjaw6x0"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736abba8c5cso7641681b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744151112; x=1744755912; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sIgnrXOk29PXtGhJ0MJfZMA68k7F5ofitj+uGIUhqWQ=;
        b=Wrjaw6x00omrao10UBDcRJlfoaMd517VWRscD3ScHmWBgPMqMXnLrHjzO9N74dwjAw
         s15bq+kIXK0KF6piJWY3cokC4qV2rTgpMHXJ9gMjPJM7Mga7XqlOJY5g+/0IcrQWssWb
         XZ2K/Pll1oLkYIzDRYniImWUGXSPcFomXpDN6dkVQUCTqfbn3HbgwnylLE917Lpq8BLQ
         SiK7OPQpCZFdxRDHjt0x0Kb0LVhqfoP/0diR+ZNUl8XizImUlcgpLEJcilMtwblHI844
         9fwzQEqNlrsm4Ln373mmqAucLxT+MvGHEldwm3Gaxv+/wYdnAV8E7W9PBeXapI2P0pgl
         +7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151112; x=1744755912;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sIgnrXOk29PXtGhJ0MJfZMA68k7F5ofitj+uGIUhqWQ=;
        b=qsJqnKlBsx6xgnrsaoniTzaOYZmUCeNMjU8zEsFrX+H2wXgfVdF3wC4SBVcvzjyPeG
         46NYb+fjfePvktgOunvQNoffyfXSPdIPSoiU56l2QgKLCaaV+xjypXGSxZfa9TtuzDsY
         v5Nv5DJ6w0opbQGkQ/T4HWSXIjQ1/lmBqQazp9lluyx6t3NI2Fv6KPXTIR+J8ZbX1Qop
         x5wpnKy+tpCc9HZfInA+YsM6HYVKEu1tTXKNsJsedIUMY5SFWT1fi5krAit/O46u9Oa2
         Fh9iEeya7QuTBdd52M7UTsS8f9mA8IXZYHt6KleKPYpEwkLdCYgqLfvwfWkreiVFHUQ6
         pQOg==
X-Forwarded-Encrypted: i=1; AJvYcCXlcawTHNbOa+W9Rpw1VIWps94I2DvsDM3vLzU16KbN4WjIk1oO2MyaPosE7nKVOWpkzZIVyS1ZVdNtzVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdA/tcGzh9Lpoy4iAqR/IdJS8MglokRxN6mmVX4m1SPP+zZg83
	pRX7bhAAN/Hg4K0ZHO4XfE7cjH29vhBDBpQuvB2+P7jjtMQmkjnHHilLRy3QYUd/80pHb1f5Q3Z
	abg==
X-Google-Smtp-Source: AGHT+IHTqPfvPHA35LrKeVma6IN8V+jh3iCyiyfrKN6jlTE/sMMd957ClboQYBC0BvqEPRp7vq7SpPie8ks=
X-Received: from pfbef12.prod.google.com ([2002:a05:6a00:2c8c:b0:730:796b:a54a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2285:b0:736:baa0:2acd
 with SMTP id d2e1a72fcca58-73bae55297bmr811030b3a.20.1744151112304; Tue, 08
 Apr 2025 15:25:12 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:25:10 -0700
In-Reply-To: <8b061b2d-7137-498e-93b2-0cb714824d7b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com> <20250404193923.1413163-27-seanjc@google.com>
 <8b061b2d-7137-498e-93b2-0cb714824d7b@redhat.com>
Message-ID: <Z_WiRqRjNzmrh_YP@google.com>
Subject: Re: [PATCH 26/67] iommu/amd: KVM: SVM: Delete now-unused
 cached/previous GA tag fields
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, kvm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>, 
	Joao Martins <joao.m.martins@oracle.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 08, 2025, Paolo Bonzini wrote:
> On 4/4/25 21:38, Sean Christopherson wrote:
> > Delete the amd_ir_data.prev_ga_tag field now that all usage is
> > superfluous.
> 
> This can be moved much earlier (maybe even after patch 10 from a cursory
> look), can't it? 

Ya, I independently arrived at the same conclusion[*], specifically after

   KVM: SVM: Delete IRTE link from previous vCPU before setting new IRTE

[*] I was counting patches based on my local tree, which has three extra patches
    from the posted IRQs module param, and so initially thought the last dependency
    went away in patch 13.
