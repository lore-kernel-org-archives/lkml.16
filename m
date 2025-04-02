Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD1C1DB13A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598840; cv=none; b=PnS2aFVRIqe5u+CJDJp35bcRhZ2b6f28kgM5Ow/bg5SLBNYg9hYOma2yS5q0v+BVCz5pt7epHkse9Gd0uRTrFLWol+Vec2sfO9Zd1kjA5F7utgR0B9fKpXIbYrUoQJO+xNVePOX2ojXHRte+8mgiG8G6lOK1ZD+HczkedfTB2FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598840; c=relaxed/simple;
	bh=x+IoBLuVA0H/up1jHiIASga2/T/EYTYb7rDbGXD9P0w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cXicCNSyEwh28ugIrvxCKc3No4f2f+zvhvy/RTlJoM5pGPXZul60dA/4Xlbu+x/4n1iFM2B5u6ftt3LcVybgmNk4npyDqO3BZdjKH2RRqNCjLiqR4f1HisUbzoPPzN7Ah8GHp2uEtj44BSw6x11fGbmKt1erBJPXE44idKqcmBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6Lpik8k; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6Lpik8k"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso66933395e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 06:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743598837; x=1744203637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngxDFq1nGLdsrKZFLcmh45jEs49yfqhaJP1grV4jxpE=;
        b=i6Lpik8knlJErJG9LpAujzp+P5joXLBVWNzwuf4W0Y4yHrSznsp7ALGyiSqLGfrvRT
         wCRaOKpL9GVFj31z7g/k9BGMyh4oPT28P1bQdkVfTat8eYeGX39vTE49WkSGkwJSI7An
         ziLS2PHgOe6Zvea/zioqs2q0RAT/JOKFfuzAOUEYKcB3L/JMHfMXcOjd+NzpHoP9jJkQ
         8S3bwlHV3deAnJIwqEPZfYz/dVrmSjykIiON3OaksJVL3Xtuvqy7SUIW6lLo6p9UYg79
         jd/5uOgnNnt+fCGKB1fgsJE2wb2R7ySEij9KrOglr3Yc3GW5PdMIsV7yKXFk58gWR+7G
         76Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598837; x=1744203637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ngxDFq1nGLdsrKZFLcmh45jEs49yfqhaJP1grV4jxpE=;
        b=IKsbXQYbVw0wsDa7TDzcLkT4n5OohqckKxz1CocAFup4IqQSev9Ky7U7W3IzEYIjz5
         NkNJKstj0tWuTkdTDgoqujkYS/t+OVHQiszuj2Kb5eGF7W53zKRInpieJXi05WrFFo5x
         9xV1DfOwEiCGARbclkgIcnYVDvLBh4oZ2QaEuVGILFeBnmEt2vjcI+xFZ5YIoJcI2vkx
         S5MDZH/jyAieTOJeoddDcg5v8VGKHzsga+zcADyPdRcGxN+vukAb6KRgOv4j8XtlJxql
         SkYSkolEnVvvtjOC7gYwyy62OAZXmSRx/S2tFbFAtiMsmBqd2KpdHEHkyGXQc5guogsz
         BqfA==
X-Forwarded-Encrypted: i=1; AJvYcCW+s2CbCZLltIggMGz7lp9VPXUs0Q6/BNpNCdaf12No4iOJc3ygV8Hlp8M39mRRHPvS2/NrNkNwMdRW0+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVzYlavlXgqZeI+ihIFhJ9zSeK/h2DWmp1yaIFccHemRSOPnGJ
	GIBnA8U+8oqeminbIZSsp6D1L/gwlaLe26/38gCQttx/GLPxAAfx9xJiBA==
X-Gm-Gg: ASbGncsgA/WYl1ar5AUNSbIAoPn9PX6+ROkhHcUg0ZVsG4TZ7AKEiSH7LxYMSJq7AXS
	Ac/vSU4bhR1KB2m3KC0F925ReSUA5b44SvF377X3D4u3iDkVx91qRQhX0MxmmoFmQtZZu2KVSYW
	vB74szcHS6smA5ptZECwIZ1Mt2pps7o39jciEA4wHfVNTAc9YNr/dyfYs+PgIW+SaXIdCVeJYyp
	j8I08wP63MkLEpUHHd8elYfEsEKEzlpistG+XMQZHJd0ZEV+netl/5sRCTaEA0AURw6lG3Ln9Ws
	FOa30ez9o7dp3BruQsdqgH+mhxtgcyT/WJrGmiOs/ClI8fsRxFCM+r/nY/wuOFQnE/ph5L+18mo
	SStz5i5o=
X-Google-Smtp-Source: AGHT+IEicv5KsZA/zLNoahNekdHnYAFlpnVcWaBREtvGIuqd11qcLb81th3r38X1cJ6IPJ8qdCPrVA==
X-Received: by 2002:a05:600c:4f43:b0:43c:fad6:fa5a with SMTP id 5b1f17b1804b1-43db62b77acmr152520745e9.24.1743598836578;
        Wed, 02 Apr 2025 06:00:36 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea8d1673dsm41466725e9.0.2025.04.02.06.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 06:00:36 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:00:34 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Xu Lu <luxu.kernel@bytedance.com>, tjeznach@rivosinc.com,
 joro@8bytes.org, will@kernel.org, alex@ghiti.fr, lihangjing@bytedance.com,
 xieyongji@bytedance.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH] iommu: riscv: Split 8-byte accesses on 32 bit I/O bus
 platform
Message-ID: <20250402140034.0fc4cbac@pumpkin>
In-Reply-To: <8cfe938f-5eff-483e-95a1-c4029993e287@arm.com>
References: <20250325144252.27403-1-luxu.kernel@bytedance.com>
	<8cfe938f-5eff-483e-95a1-c4029993e287@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 2 Apr 2025 12:28:54 +0100
Robin Murphy <robin.murphy@arm.com> wrote:

...
> It is not, in general, safe to do a split write to a running counter 
> either way - low-high vs. high-low just moves the problem around, 
> changing *which* combinations of values are problematic and capable of 
> overflowing into each other between the writes. If the PMU driver can't 
> write counters atomically, it will need to ensure that it only ever 
> write them while stopped (at which point the order surely shouldn't 
> matter). Conversely, though, reading from running counters is a bit more 
> reasonable, but it needs more than just hi_lo_readq to guarantee it's 
> not got a torn result.

Or have hardware that latches a value waiting for the following cycle.
That could be done in the bus interface logic.
In which case the cycle better come from the same cpu, not another
cpu accessing an entirely different register.
That requires a global lock for the device.

	David
