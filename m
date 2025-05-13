Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF97A2BE0E2
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747150734; cv=none; b=EA2+bcnbSCrGMfrYnyf0IHyquupavDUpSyrhPAOwhC3clGmZYwtbpVS5y65Se2aAwkgRK7cY13NKQUStVo4RIkuqm4wJvpEAk/7s2uFIZsEgOkBREjzNgNN2Rl3WkJykgj/ZsFI1fHhB6fjjrxjyLHsiGKXNuxUcBUJEoJvS7Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747150734; c=relaxed/simple;
	bh=HciUJ0DRc6VWbkLdkDFkjwk4jXmAZ2zaDmGvimw1ftk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKGqxWvqG60On3TmZd8j3wUtyoZtUPT728R7KKbIQInZiLAXL0fNdFl2iH8wAWznoj/N4sH7MICgiMPvvtQ0Ij5FQNccrKnnOcwJBDFQYHiPqYy0qu0p+E3RZyZ5/w/W010Bz0Kk83242LFtDEs6v4PJn+ulBHngcMQ7CBYGg54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNSC2bou; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNSC2bou"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7396f13b750so6405612b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747150732; x=1747755532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b01lqOj1Q00qoSQQQOxAByXZieMfhjS49oQuDICweyQ=;
        b=iNSC2boukHJMIOfjLbZ80Qeau8EvdHjraRSlKEPn8y0v0+N+fS4aVz6cIZTpOUz1LG
         3h1cRjnyXLgFYuPRgUPJRioXdEnHDQbxTZBeKSruHadG6YGA5D91IkVKOQnw4VRtCM/R
         deKeOtDtVpSkp7afTF/VcddFZzVCDeLkEtkyeNd4AF6UYu8jdWeSMuV+zt1yUu6BmMKq
         m2/WIVpsX6C2NH3zySmyjR0Fipg1jtSlKziHSlg2V4VJ2qJYwtPqS1tatzelq4XTF6Rr
         J6YYwAHpj0wd82UzzX0jVfvBPN3nXoTaPfwvfy3mmCofoTQVJ0dZrfVOEEZaSYDL/7NS
         p3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747150732; x=1747755532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b01lqOj1Q00qoSQQQOxAByXZieMfhjS49oQuDICweyQ=;
        b=i5G8lQR7Gx+1V68d/k+aDEHZRrQDNDbcGdwJE2xwoijfwljMrag3/XBFhIs3X2J9mu
         mdImLJUQ2TNof5kMrTndEwVrHNpiWgkkRCbbdt5zfzZ4iK3QbKz29JA/LOVOYCyKWPoL
         wD+s0k8tf/jwHqeIVmAaQgS8xLVJBbdMmeKmvICB9jaD7rcwEOvYCmE4hZYpIRdKhQ8n
         27R4675Gih0ZzX0KgQddpL5oXDnG0WWT3YVoBZHzPp3FW6iwXaUVGy+WzSgHBAo/nJlu
         QkjpZMAdFchbrTAZ9QHXjVam+RuTdfmuNkL7her3Q9DecUlGcJML2p5O3kb7YgyfBs2X
         okew==
X-Gm-Message-State: AOJu0YxuBAcr5d7qgI4UB1flKv5pEbaFsZmzKfRIbBGxvh6faYjbnxio
	FDuKrdTjvJ1IBPEGlpHquWBhXxKurCIyfGQvY5a0UC9//E59Isdu
X-Gm-Gg: ASbGncty6mwElfsJVQQIRGTZu8sLdpybywkCSLdLLDG0bW0t9AtomHufNan0AFwL8FE
	xGh7DNB6/kl3jKuJMPOpDAxhQviX5XUpqth9Yj5HP2FoV6HNoZk3MsoUkSfN9DcZNPzfaaki7B8
	SdialS/KlEQgJ0kP5zPuowlK3ZC9RKwktXn2ASMAwfVJa+Z7OnkEiY/8u2mR3cu2HL6P26Y7zJs
	gHCD/VKT0FkyURPxr8DzbzIReTnTNsEcSpXapyMXEfeI3OH/9dMBBjddBxkOal0HyK94tQMSVT6
	cT9LxUxkj25CHW06I8+HQIlGhqpsfhjUjQyjo2fo5vOsdKRPkoM=
X-Google-Smtp-Source: AGHT+IEhlY1+qEinI4hF7ZmWEnkpLawexR05Gigga7+soAtsGhsFTnlIcJGqvo3/htsCFQtIUb7PKw==
X-Received: by 2002:a05:6a20:c791:b0:20f:953c:fb57 with SMTP id adf61e73a8af0-215abc7accbmr23502249637.42.1747150731703;
        Tue, 13 May 2025 08:38:51 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237736db2sm8071748b3a.64.2025.05.13.08.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:38:51 -0700 (PDT)
Date: Tue, 13 May 2025 11:38:49 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yicong Yang <yangyicong@hisilicon.com>, Tejun Heo <tj@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] topology: make for_each_node_with_cpus() O(N)
Message-ID: <aCNniZdk-8JPBZpb@yury>
References: <20250509162009.540506-1-yury.norov@gmail.com>
 <aB41j_3g4KHnoXaz@gpd3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aB41j_3g4KHnoXaz@gpd3>

On Fri, May 09, 2025 at 07:04:15PM +0200, Andrea Righi wrote:
> Hi Yury,
> 
> On Fri, May 09, 2025 at 12:20:08PM -0400, Yury Norov wrote:
> > From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> > 
> > for_each_node_with_cpus() calls nr_cpus_node() at every iteration, which
> > makes it O(N^2). Kernel tracks such nodes with N_CPU record in node_states
> > array. Switching to it makes for_each_node_with_cpus() O(N).
> 
> Makes sense to me.
> 
> Maybe we should mention that previously we were only considering online
> nodes with CPUs assigned. Now, we can include also offline nodes with CPUs
> assigned (assuming it's possible)?
> 
> Semantically speaking, since the name doesn't include "online", it seems
> more logical to ignore the state of the node. And if checking the online
> state is required, the user can just use node_online() within the loop.

OK. I'll take your comment and move the patch with bitmap-for-next, if
no objections.

Thanks,
Yury
