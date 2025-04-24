Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4691F4188
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 22:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745533115; cv=none; b=PyQil95mLzlXUwvBAsl4PFEzP6yAUO0hefpmrHd4JtmX1dLqns8L/5j74KqfFXo2e8MfqsNHhlzUlgw7vb5tJf/PzZgJPivKWUd/KP389XNWk5QWCETZS1VStAra5wQrnarL+4NqyiT/tGekYm82kwRiKExDQKEZqX1Os3WAoss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745533115; c=relaxed/simple;
	bh=l4f1xNB2dwWSdrG9upCnzaeNTP8GCePr0kItE5AT2h0=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=Zzbiqf5N7ktR/0E5C5G0p6my7kK4PLKQhRMRD1VDtCm1yrsgsVESsJQoaN2B2M4XJM8Wd+bGcNkuyBs0CiMn3oRBTf82S34/sIvUJBuBerrLhMbB/Kf5mgDrgJCQ+tll9yBSCBhJQ3OXWJfBpD5xuTavBXwPialhe3KKcGfzm6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=UPnInYH3; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="UPnInYH3"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c5ba363f1aso219147485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 15:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1745533111; x=1746137911; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=251+9C3n6HOhFKPLs3FnNVOnITQVSwoWuSTYkyfbN34=;
        b=UPnInYH3rId+B5sBPw0zXA8lCBZADPzWSRyQqsf5t8lwYqvuQVvPuReZ0XNwcfAlmx
         rCXglJDkAkBuHXRon4A4TNs4GnrOrq3LfncNhcKarTW9D2x3aRwoNJZZ2aOUpYf0Sd98
         doUUeaWtNBE1IS8yTA+GaNzXMA3y6PcwpCZJMtPxOtXL42SrwfTE/ngEUZ0SsFdTfd3u
         +yPiGM4ByJH++mMyC4h4lMCJGLYcfvOF0N1WJf86DibbP/Z478gJnF9fFojlwSHMPQ0j
         IFp4EvF3f/Y4OV+GJOrPMFoR2qQP5a2JRFIhFqw1jLEh6lxyIjR0VsAfTdk8Q1xyK+qq
         +hMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745533111; x=1746137911;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=251+9C3n6HOhFKPLs3FnNVOnITQVSwoWuSTYkyfbN34=;
        b=Lid8rUAzfuPDXUb5ZBp+li7UdDyDjKHqgGh4N6/psoqRcrKyPLHHxup3easyhpeUMr
         H+3b0VXTUpH19fhLquE39PZrjXuOKweFQWSgOIq10dMEONmwmMzmKsmDTxtnFG1Dta9f
         udA4AvAkkCz9zLOlhqMIzStAxDS4dZ6FS9sw0w6kYEfvvN4zKOoWzPyCPY30swZvT9Dv
         Yhl7yxTONyKhzgRPOul/ZFGh34jv6KG3PTNQ8g/Ps8tVmtJrpJaDkcfA5qfrPdrHF4QB
         YusJFcU1n2r5voOuczeNL2Dgr4/uctw8dauq85n2xaBX7TkTXq5jmHQU7PyCzXHzpG8k
         fO+A==
X-Forwarded-Encrypted: i=1; AJvYcCUKnW9NbWLD5gSUw/2AQwDTrIH3dZdFtOtBgwak/M5lwL9H+pvSSVDf91TRs3VWfmCy+QQXEcPkYfthCiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO66VXW4b8jb9kARp8HRGHYNBRAwYo08ECAzTKGWit1vZc9RBU
	QLRkqcF9ZRnodvoe2bcEZQX/ktK13E0v0zVoDeVAv+E9FWByFYpkFjhib8V4Yw==
X-Gm-Gg: ASbGncsLHyWw+V+H1bz10Dokj5kVLihgiBcUuT5AWxJpcsjco8gtUeGuPFQaYiYFfHu
	FdFklapit67RInk5Q0E/CRAmzmlTddmSnzuhuiPbuLE26m5PA3qWkBfdXkv09KOcrtFOzJSyNVF
	CGNQWKNwf4qUs63V8oZfV7+ghAF/CtxLPuRQSQcLSaMWfqS889j0SlejoRuywRie8u0XyZ13enf
	IFibTatgNFdbe4+fIMoEkFkNI9sqxwfbapOCLrBJ+Bsj6VmPX5kdmuy7PsFXenHV/BYu58p1b68
	XanX99WDzPbMCug1RsOY+wUd/Hz+0Nk16kGfVj5TeNlq+plyleyS2ldd/iNARtRBFvNkVbl2xon
	gjuCFJL+5nA==
X-Google-Smtp-Source: AGHT+IGCkjp7bhibsegJvEnhEdx+029sejsn8em3hGJ2OLmGOtsJSHM7xFwZ7JdT+eFzXvq5AWacag==
X-Received: by 2002:a05:620a:430f:b0:7c7:5ad8:aece with SMTP id af79cd13be357-7c960719efcmr44339385a.25.1745533111053;
        Thu, 24 Apr 2025 15:18:31 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c958c92193sm141850185a.10.2025.04.24.15.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 15:18:30 -0700 (PDT)
Date: Thu, 24 Apr 2025 18:18:30 -0400
Message-ID: <a64a1877ac344c22b3c86058e97d1d33@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250424_1707/pstg-lib:20250424_1742/pstg-pwork:20250424_1707
From: Paul Moore <paul@paul-moore.com>
To: Casey Schaufler <casey@schaufler-ca.com>, casey@schaufler-ca.com, eparis@redhat.com, linux-security-module@vger.kernel.org, audit@vger.kernel.org
Cc: jmorris@namei.org, serge@hallyn.com, keescook@chromium.org, john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp, stephen.smalley.work@gmail.com, linux-kernel@vger.kernel.org, selinux@vger.kernel.org
Subject: Re: [PATCH v3 1/5] Audit: Create audit_stamp structure
References: <20250319222744.17576-2-casey@schaufler-ca.com>
In-Reply-To: <20250319222744.17576-2-casey@schaufler-ca.com>

On Mar 19, 2025 Casey Schaufler <casey@schaufler-ca.com> wrote:
> 
> Replace the timestamp and serial number pair used in audit records
> with a structure containing the two elements.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  kernel/audit.c   | 17 +++++++++--------
>  kernel/audit.h   | 13 +++++++++----
>  kernel/auditsc.c | 22 +++++++++-------------
>  3 files changed, 27 insertions(+), 25 deletions(-)

Looks good to me, thanks for moving the timestamp and serial number
closer together.

--
paul-moore.com
