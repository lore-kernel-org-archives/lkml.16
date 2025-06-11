Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE8A6FBF
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749660191; cv=none; b=rj7SHDnVzARLk1LGgseV60RZXwTj74n6ttcqjXwAI0gtnyOTbEzbmXI9aL6TjAo0jX5H0OzqctyHvjtjQfSkyE/KgvD4uCOp/kW9IfK2s0NrP/Jvxp/qNPantvY1oPeVfeB2gmwvegX7G8c87tbX+WcoHjlqhsjMDX7KbR9KfS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749660191; c=relaxed/simple;
	bh=XBy6TWrbodNTS9535rwE9b0+N++Ty4f5tYf9WwjxQI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fq0iA3wOBsQ1SAQrT66S0WFeKQ3lSgJ7VZYex6xMDt0jFnXECpvV4LJU9C74KiSMr8bCB/881XmCqt3nYEcv1e/RKD63ZX4JYItmC5WztydfvxvnxPRkH83RQrxAOTDknIK4g7qLP+GzhyM6d9uFDeyybnpUQF4NfSdyiTPFQdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pfyu2jEF; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pfyu2jEF"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22c33677183so340995ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749660189; x=1750264989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3B1izCKjelEWkn7gYbH8LQnICjsHfsRoxM+9/DEX5c=;
        b=Pfyu2jEFP+AfpKII3bKGqv6/stnL7bTp1ogD6yZ5iK5ypTQgLx+rVKY3fCNIDeR6PN
         TtWEFcfwMXHmFPoWA0IJ1++0+tO35r2Z2psHqjun0w7sdKgu7S/+mT1AtCo0k/5HQ1Js
         yVpP6Iadmv0d6FSY/QvwwJPPejTsPLu8Fh0sZbqKY4HmQCXnYYaB34Wcw4GGFzWb0Ftz
         HRmdgLy7ybkkF6Tqqngzjmc63c75zps5Qv7OqgQebnP3j8zZu7q25eT/hoG4IajlBTuw
         07bfKkYqfQODwudqMjx7nvOJLzJYhmrsfbn5L/VmhhPwupnRdYaz6aV8h45dGlU9hHSJ
         5mOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749660189; x=1750264989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3B1izCKjelEWkn7gYbH8LQnICjsHfsRoxM+9/DEX5c=;
        b=VNQFNZkwAgqr0j24zzoPf844Pe53rjXY2E9Ypdm5oUTINfRm6kHwfsWyqgHp7LHm9i
         Dc4yh7/OFItetPf+17shiXLTs+tnY+L2Re+vXJpeLYO7MIEJ34TCj+yMTANj9nTPedlJ
         4Bhg1CjF75GWqEGd/L5flS+dtzL5jb8paefmpzpluzM+2PweB3xVgPIT4wKgKMBblxe2
         Hh33SzCwwidpfSAkhqiMuSMjZk6OApuAa/srTxr22lQgieiBQEHu2yzwgbRMbVf1+gi7
         WNOEambLj7baUb57UVI/T1lSVKZ5GRhX7xGgc3VXUDxkDTr92q6v63acXqRHKpe9kCkV
         V8rw==
X-Forwarded-Encrypted: i=1; AJvYcCUD+jXyDUyoGWgHltW4kqMzprHNUzHb3okaPvT3lOWi9ffCOkW1k+PpXv75OGHrqPuf+q8QodQ1VPoD4/g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Qj1x9wOcdmw072VUDbveIIUWU9fC0oO8PBbseRKhm7uEkts4
	mmYI/eThQ4DobAIR1W7oHSyd4IS+A0sqFSOdZPxdK1Jke+FUZB9xspV4
X-Gm-Gg: ASbGncvZ0xB+GxL69q7ldbyhl/9Q/kbcPEdgBprdgoqpL4gEaP0DK8vYwvp3oAHEGA3
	TZrkjGelrw4wsdPz5CVKamPsm/bLqYQzAa/6V072cDUvVc2br1t+CRPXy9mrhfUlhPM6cbi+/r9
	XUZDyqZX4tzUwt/XgLZ4D6nwfl/6JxFaw0Y8NsJ/LITLoUm2OgZWK66PvktVDygDUEWhFu8IPMS
	DeRjhY3CxUz01Vzjdlh5Tg/I5tmEIILGxkxxWCrDgPDANEQpcUldEWYvqQIRjN9/AgSN6QJkZUV
	OHes2N3nLWPEVdxZh1CXifYbsgAeelMB4FHt/GzV2iESiO3dNLp9BNHAUxh1p3FiQnX1Sqcu
X-Google-Smtp-Source: AGHT+IEC5LOBvzRmSLLFKZVPb4e8XgHVmRxkPqYxTsAg5vw9PXSPzLe8pnw0sLpPVh+0ZGfODA5JEw==
X-Received: by 2002:a17:902:d54e:b0:234:d292:be84 with SMTP id d9443c01a7336-2364c8e1b03mr3681335ad.10.1749660188889;
        Wed, 11 Jun 2025 09:43:08 -0700 (PDT)
Received: from jemmy.. ([180.172.46.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030969ebsm89260545ad.72.2025.06.11.09.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:43:08 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: kprateek.nayak@amd.com
Cc: jemmywong512@gmail.com,
	bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH v1 0/1] sched/topology: Add lock guard support
Date: Thu, 12 Jun 2025 00:42:57 +0800
Message-ID: <20250611164301.116984-1-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605120424.14756-2-jemmywong512@gmail.com>
References: <20250605120424.14756-2-jemmywong512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jemmy Wong <jemmywong512@gmail.com>
Subject: Re: [PATCH v1 0/1] sched/topology: Add lock guard support

Hi Prateek,

I hope this email finds you well. 

Following your feedback of v0:
https://lore.kernel.org/all/20250604185049.374165-1-jemmywong512@gmail.com/

I submitted this v1 of my patch:
https://lore.kernel.org/all/20250605120424.14756-2-jemmywong512@gmail.com/

I’m writing to kindly follow up on the status of this submission 
and check if it’s being processed or if there are any updates.

Please let me know if there’s anything I need to address
to help move the review process forward. 

Thank you for your time and guidance.

Best regards,
Jemmy
