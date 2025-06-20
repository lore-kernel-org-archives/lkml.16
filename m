Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7103253F34
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750414770; cv=none; b=gldO1JMyMvYwAvxqPypZQj/aq7gOAcOnurflIYpJkri5dkns5GeWsT/MjA1b/GybiPqhnsnOUwbrlx0GG3he0SU5gbHcLxFbHIylsWldQEnTfqdeHlHtEDG0VGl8UN2NZ8uTGRGbbtm0WbAFRCGuCYi7qBKscUk6F77+v7ppNnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750414770; c=relaxed/simple;
	bh=DxrLCeFew/xFBCDGGWMC4qBb/cJm1gUAJglWWJFeAic=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PGCBzjUu0yw67hjVlqFek8fcJdX+nKVjygyiw28dz3YYI8U5w/nSogJkRbWaGn15yfDueWRMPBrF+5rOTy+pEPBH/ReqHnTaT4CSEsSin4wX/nhRbiTAHghI0d+JVpI2ZsYrroMsVkUtfeulSgdnewOLQtox98MracVxyUnlWeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--keyz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XHc2T41D; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--keyz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XHc2T41D"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2fa1a84566so1056643a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750414768; x=1751019568; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DxrLCeFew/xFBCDGGWMC4qBb/cJm1gUAJglWWJFeAic=;
        b=XHc2T41D+1nj0JFQVEwzmhB4Y/rlD81gwEQPR0HE+GqJ9EjtEEjAcy3+gxDv+pM0Gg
         hE2mhlfdbWBpTkaCMO2rtKGjtology5AyTUMoxfFBW9vDBLk74lKGfwOZ/VX7x0lEPZk
         ojsUA58enOJzrxE13wG7113xNuX6GAK1Iena1NpEbGZFPMciRmr+8JnDrpP+jG+E37Oi
         L4M9+8n5bCcn7WJiNYFlpcYvx3HeEu2uV7fhKK3n9/e2sTycbsWT0MgsxHuUm1AUimrn
         W03W+8LmHOZzCJROeXAa5tW7m0EvWGHR2huyZTX9y9+BfP+bxGBifZQlC/E6A1uNB3zj
         KmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750414768; x=1751019568;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DxrLCeFew/xFBCDGGWMC4qBb/cJm1gUAJglWWJFeAic=;
        b=VyIgCjQCNmNe9hq2kX7HFy4hz3gxIKV4Ghbi3dJGYwBmPb7O2Ax09yLGEP23/kSYYw
         TVqulFdCM4ENPRMj5xraBR5fLABXrFYEB++pJXfjs7HAbyrb0U6X/X6IPERt9oXYsFc1
         +H5MBkgOL5hm0Od7+fXEJNLj4X5hVT8gSO59XHahnKpIgCPEV6smY3Bu/9VPrlloThYG
         MkqHE+z9TfiqoiisJnP5ds8+rJPdi22jcXRQjD+dgWbpE/c4wd6RHmhDW3wwesgvq/Iw
         /20LScCZgQBMdpYcfTCQILXIk97gxmKqymSYTtmbOjONS7b+qU0VVH6dnaDznn10PPVd
         LBoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+zafj2YhHX6S5MzatavZ+Sp2QkRMZ1/oy+JTB7nF/NJ8840IGelYehRUA58JyfMj2R/mOhiL4YkLjpIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdATIfPuuPV3Jfj47xrQgV/TzUO8JJVaCPCly027wIrpE8cpAp
	tSxK0rgEiSN5D2SrIZAfsqLONqmHBSgAiOR1zm6WMpta3Dx0Doeq9FHKmdfWp9eZ5/s3jmdNQQ=
	=
X-Google-Smtp-Source: AGHT+IF4QE/1koWWFJGv2hBaG+9336BI0T4zncUNQdaG85+in/0i4XLuTIW2hEYCLo4JAsGfasFiTKRr
X-Received: from pge25.prod.google.com ([2002:a05:6a02:2d19:b0:b1f:9534:4f55])
 (user=keyz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9f05:b0:215:dc01:8b1f
 with SMTP id adf61e73a8af0-22026f9c61amr3796326637.32.1750414768159; Fri, 20
 Jun 2025 03:19:28 -0700 (PDT)
Date: Fri, 20 Jun 2025 18:19:06 +0800
In-Reply-To: <9c5bf40a-b0d8-414c-a0c9-f5da5d9b612d@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <9c5bf40a-b0d8-414c-a0c9-f5da5d9b612d@arm.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250620101906.3762866-1-keyz@google.com>
Subject: Re: [BUG] CoreSight: WARN_ON in coresight_disclaim_device_unlocked
 due to register reset on CPU power-cycle
From: Keita Morisaki <keyz@google.com>
To: suzuki.poulose@arm.com
Cc: alexander.shishkin@linux.intel.com, coresight@lists.linaro.org, 
	ericchancf@google.com, james.clark@linaro.org, keyz@google.com, 
	leo.yan@arm.com, linux-kernel@vger.kernel.org, mike.leach@linaro.org, 
	yimingtseng@google.com
Content-Type: text/plain; charset="UTF-8"

Hi,
(Resending the same message in plain text (no HTML). The previous message was rejected by the mailing list because it contained HTML.)
thank you so much for the quick response. Really appreciate it.

> Thanks for the report ! In the future, please use
> scripts/get_maintainer.pl for the clear list of people/list
> for reporting issues.

I will do that!

> We have the ETM driver performing the save/restore of ETM context during
> a CPUidle. This is only done when the ETM/ETE is described to be loosing
> context over PM operation. If this is not done (via DT), the driver
> doesn't do anything. This could be problematic. Could you try adding:
>
> "arm,coresight-loses-context-with-cpu"
>
>
> property to the ETE nodes and see if it makes a difference ?

Noted. We will try this and get back to you.

Best,
Keita
