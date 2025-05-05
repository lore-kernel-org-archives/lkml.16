Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA4A4A1D
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 17:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746465053; cv=none; b=dS6rMLHk8K2+TR0GHS6yMOvuRs/5nOY6R5KQBbTDyhb5IffTzJR9gXrr1J9D4j0TCSCYDLyWM49BH0mALxDmUtqa2e1kZnjKe/LvQ5rNH05GYd1hmge4+OjCCGTK4iz7Wop7nZv/bOxaN1srFINK+ljYhYQBOhS0gVfRm64x0cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746465053; c=relaxed/simple;
	bh=Sasdi3q+u/iymFuaxnhwUfAiuQtB3EZOdlaDKY6dI/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=Tzr1lSxVsXTwnQlu/LvFtBUw2SqBqB6bhk0nZwX8owL99vxSN+ssQDgIeD8eWd8r0orfVTAyYl7VYyxWuz8LhtHqcECqF9o6Os01qWzK17PVluIHdaFVGXZ6V+j7s68fUzXzt65WFhreoRwn8xVWrk6Tq3p4s+UoQTy4suRR060=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N3k2M1ld; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N3k2M1ld"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746465050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MlJbDsdaB8Fb1yKGoymOdOJ1VOHTg0tyH8YwvVKsoE0=;
	b=N3k2M1ldox3EOUJbkYttnn2jm3q+AjxtpCbOBNMBvkICYxRyaeedMSHOWJvn+h9YG99aKs
	0TiAfUDwjSN6b0UElKD+U+vDkXscc3m8B54DkWeFulaDylpeSE/tzl0i0mU4sfFr0gaQb9
	pDIxqsf3xZfsEo5gBKsL17fvpS0LXCg=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-FasjuwAxOS2E01vG40Ml2w-1; Mon, 05 May 2025 13:10:49 -0400
X-MC-Unique: FasjuwAxOS2E01vG40Ml2w-1
X-Mimecast-MFC-AGG-ID: FasjuwAxOS2E01vG40Ml2w_1746465048
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-308677f7d8cso3829210a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 10:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746465048; x=1747069848;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MlJbDsdaB8Fb1yKGoymOdOJ1VOHTg0tyH8YwvVKsoE0=;
        b=AEZQOzWhybSUs++W+/r2woAq27ZDxzQY+j0agvt9mtjHXl9UtcdYfbfy+/QmDoCXLo
         i+lN/xPMrNv38H3XNXvWLbYff1lcmuWya8M13Oq4Qkac8GZMZjk6NDi3NmVhMUFpOofD
         09MZx6aFNXb9pZAe5fLayFW26i9+6xfFyLMxRxIfg+LeS6HQoS880MrxDM1ruBApc+2R
         e5qgz+SUb53NMtU476OAjDl/UenPh++RZ0cZ1DYaHyr9L0u7rtUrawfm0w44JVfy5k9q
         Ak5p2DU5V3Bsj1yQ5uzKezSvtRbTgr3V0pnfX2kLrhPNbI96UBChmMSGbNm1rgMMoc+G
         idaw==
X-Forwarded-Encrypted: i=1; AJvYcCXMjqybzhXl2YYC6pLMd+v2uPBtWlsASGzqqXrMFFRXFemVmFU7d9l5dcAnniG8gw02UCGE+/m69Hhq8+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzovtaQsbPX82TB7K8Ydtj8bLTVez/UDrwqHcxJEyOvCG5suP+r
	OMpOmJHoKh9vUu+zQ3fNPoQPIEyeZ/OGhTe3Wdx91n4JfFFIC8rbRnxusiWmqeGmEZswAcR5OYE
	sc9YQUWxWdoWDeyeN5afim0VXujI6ft4MYAynGoGTvqHPiSN+EajGzspAd/XE9XfklySZzkXY
X-Gm-Gg: ASbGnctaMZnHT67wGUwAfOWspF0BpiKgjlQaSlA5+0CEyIiD2nw8aFyPnTp7q2qd58F
	HWDle6dmCRlj+srdZPpKVNsXSp8Nsw57Og1c6iwDNpNjEV5/60GlagK0A5i5D1DOJs7H/B7ikoA
	/iYvPNJTEalOILtVaA7XyQjdAAAOVHE/TKyveZVaDYGIaCEyS1urO2FnNMLPmYMxvZTy8Xwd3gi
	ph2UF+tvHifdlTVqYEzb42At+7O+X8HQ6laCHoym6I67pXOX9ZsudwzM0vSKOxYSdxmIGAFiMXB
	lc+iI+ErcQEiYxuAWSE2Jef0
X-Received: by 2002:a17:90b:4c84:b0:2ee:b875:6d30 with SMTP id 98e67ed59e1d1-30a6197c311mr13359016a91.9.1746465047903;
        Mon, 05 May 2025 10:10:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH51KvBw9yt44q1kcfyx01eUKobHfX75XFh95fpL2csSqejrwEVmDZLpOQc/a1L2g368qyjBQ==
X-Received: by 2002:a17:90b:4c84:b0:2ee:b875:6d30 with SMTP id 98e67ed59e1d1-30a6197c311mr13358966a91.9.1746465047527;
        Mon, 05 May 2025 10:10:47 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a800:6188:b6d7:24aa:ba3f:6cc2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3464e830sm11965000a91.0.2025.05.05.10.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 10:10:46 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Leonardo Bras <leobras@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Alexei Starovoitov <ast@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/1] local_lock: Minor improvements of local_trylock*() documentation
Date: Mon,  5 May 2025 14:10:33 -0300
Message-ID: <aBjxCZEnqWuKJw3I@LeoBras>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <1a679bb9-b701-47cf-83a5-b0f5cc4a5eaf@suse.cz>
References: <20250430073610.163846-1-leobras@redhat.com> <20250430145954.hsnIXmYO@linutronix.de> <1a679bb9-b701-47cf-83a5-b0f5cc4a5eaf@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, May 05, 2025 at 10:01:32AM +0200, Vlastimil Babka wrote:
> On 4/30/25 16:59, Sebastian Andrzej Siewior wrote:
> > On 2025-04-30 04:36:10 [-0300], Leonardo Bras wrote:
> >> Fix local_trylock_init() documentation, as it was mentioning the non-try
> >> helper instead, and use the opportunity to make clear the try_lock*() needs
> >> to receive a try-enabled variable as parameter.
> > 
> > Maybe replaced "try-enabled lock" with "local_trylock_t". "Try enabled
> > lock" as mentioned in the documentation or "try-enabled variable" as here
> > in the description does not really fit.
> 
> I agree, it's more clear that way.
> 
> Thanks,
> Vlastimil
> 
> >> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > 
> > Sebastian
> 


Hi Sebastian, Vlastimil,

Thanks for the feedback!
I implemented the suggested changes and just sent a v1 for this patch, 
which can be seen in:
https://lore.kernel.org/all/20250505170244.253170-1-leobras@redhat.com/T/#u

Thanks!
Leo

