Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED775BA4B
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 05:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738300136; cv=none; b=pG6JtsbcIvjvC25hfs3UU9LJ01kie5T2obmLsXGNESglafqNBIbAVAJ5p8LDJDIS8MWGtLpvBYssGhZ5tBvvLwg34MPBPjhfxdIMrWZf4dAAiA6l+Hrms1ijf/TRQRRE3uNBDH8cbZ78vaeE/EJbcLciaBbXSkRxUPseonTfmRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738300136; c=relaxed/simple;
	bh=/h67jHK1llFod+55Grj2UdY1TtIg/nzLGcQvP4Bfffc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/M8OGvkPlaTfpVfxti2ZD+QaNkKNarz4PfOhtn2JIesdq4k6C/kK71DRmSX2lPWIjPEC/pmcRBqdLv8O2GoXCnfx7ZmiFyJRfohHZ/V+yPsTMODX9BF6JsJyhxqCto00ynvYS7uAkY5YqSWEj8ndhxBXP7a02CNIXibG/39Hpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NQQRzQwm; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NQQRzQwm"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2161eb94cceso19050375ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 21:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738300134; x=1738904934; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0RM1tUSuNCnllkvRNHONUGOjOBTzrfgAw5YZHNLGX4=;
        b=NQQRzQwm2v43+OFBMrJ3wTgmBEgoP8KvftgvaDG3KKz/+/r73TRcN3d4LARhhd+i0a
         BhhDSu1lOeIgXk4c88dJVtbujXOv1bPyVTEenGrvLmGawcY1Ik2Cx0cDEPGo9tLm91S1
         FCR7eihap+i26XG62RjFZUcM6C82bMI7Bibt+NMAlXSOmp0ejQyOYMSn7+QRBRaKn+EZ
         uwUf8dvkF7euhzICW7dM/pCjVbKMDZ8rNOzdTw4ul81QFPIGI0vBZNROmu8+/uzRnqS7
         3mhwJtHIRJmr1qR4gUS/gbVY4QYt8+rlLoiGbEYMhUjWwEnr542qzQUaypMApCsZ99qS
         aCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738300134; x=1738904934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0RM1tUSuNCnllkvRNHONUGOjOBTzrfgAw5YZHNLGX4=;
        b=AqUubzDdSxp+vO+Sk8ZEfz/8Ejgrj094DQb2+f93z+1R8KBUGah/Hx9NOOXbi/8sxQ
         10ftyXf6/UIEVsD+CwOQHjxEdOKXrMYb6KBtCic7BS8z96EgHmXzPGz3ybH3wIEx4xAS
         YVNFyIEBbfLU8RhzKCRm2yJF9d8GY3EqzI6Qf8Yp5NV85lYhPCAwKJqPVCd+pWFbCZWC
         pAIgEf6Idghqy+FwtTDjI6feqUAPVpy0rftQKGeK3T50SlbXARX1dyoj0pvIcj5BdMkL
         7gJeZhATTsaYD3q3c2Sdw4qvrKZayNjHpeG/FNL5iz8/n34fkzM5Ia7cWMdPjTQaOCDK
         3fcw==
X-Forwarded-Encrypted: i=1; AJvYcCUtSvTGsLCW6wDSpSiBbBFou6xxAeRGqcj3KFHi7oCHYVeI+vvK2hgp7b/3nU9qJ6LvbFaMkDRaNCCwW8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL2OoJ8zyIhiT/98ff/rcYjJic1ZfCGeG0YJO/B1xeHwaTsHLf
	3iOK6Hn3YM+cSRFtfQBBwmbGZV4r5LJ0HjWU5znDHBnMbD1ILY+AyoymKOLfkqg=
X-Gm-Gg: ASbGncuZ41ODHyYJ4FPP9rNha55UsPZmqe15OI+iGJ46IY/1t9bicI81fimhVelbQMi
	shaSdHmwTZ2rB8lSkiClwr2ksOpLTN2y41f+DVrGrYLi2EHJuS5k58T9oc1QZmhOpVlxaovVcB6
	O9gnHF0WxAflVgR5+2YsZ7SdXxUwGfrrjYQvCg7nfvuh/gnWdqM/ZmsEFkI+MsaX5ZJkqjwurbk
	nQb8Vxt6TrLRvAOv9sWBuxgz9P+mED3F14VMgidxdVbPZmmhsSuyIWePC9I7wcGUcU3AVm1hWYD
	jpOAQzce+1p1PFDQIA==
X-Google-Smtp-Source: AGHT+IEC3ww0r8QRW+a6btmpKJJf+PSATOYvFliOp4lwrITNggyBPL2vRRp5D/mtRXbcT719OdHweg==
X-Received: by 2002:a17:902:ef43:b0:216:45eb:5e4d with SMTP id d9443c01a7336-21dd7c3d30dmr123313215ad.6.1738300134193;
        Thu, 30 Jan 2025 21:08:54 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea80csm22514295ad.140.2025.01.30.21.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 21:08:53 -0800 (PST)
Date: Fri, 31 Jan 2025 10:38:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Gautham R. Shenoy" <gautham.shenoy@amd.com>
Cc: Dhananjay Ugwekar <dhananjay.ugwekar@amd.com>,
	mario.limonciello@amd.com, rafael@kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] cpufreq/amd-pstate: Remove unnecessary driver_lock in
 set_boost
Message-ID: <20250131050851.uhe3sc2pnvrcsx2k@vireshk-i7>
References: <20250130085251.155146-1-dhananjay.ugwekar@amd.com>
 <Z5xaXwMNXQc+qbqq@BLRRASHENOY1.amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5xaXwMNXQc+qbqq@BLRRASHENOY1.amd.com>

On 31-01-25, 10:36, Gautham R. Shenoy wrote:
> On Thu, Jan 30, 2025 at 08:52:52AM +0000, Dhananjay Ugwekar wrote:
> > set_boost is a per-policy function call, hence a driver wide lock is
> > unnecessary. Also this mutex_acquire can collide with the mutex_acquire
> > from the mode-switch path in status_store(), which can lead to a
> > deadlock. So, remove it.
> 
> Looks good to me. The driver lock should only guard the state
> changes. Everything else is a per-policy change and is better guarded
> by the per-cpudata mutex.
> 
> Once Mario acks this patch, please respond to Viresh's series and let
> him know that this patch needs to go in before his series. If he is ok
> with it, he can include it in his series.

Yeah, I will apply this once rc1 is out.

-- 
viresh
