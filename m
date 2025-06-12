Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082A017A31D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749713383; cv=none; b=qi6VBozjAN9X0BAMSfFzFKtMKzfqL0foyGWzr8nurPnSAnUf/lUUodrJ5hJCt+ymHaifP/+6RmOoIfDthYvnxqK5wPiJVtelxK+Wb0AwPmHVfPgJNm5F64ZjsWnuVY/IC8fW5pQcfOQrzC/CSD/sm1HVXhfOLE9VqCLq1/WaFUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749713383; c=relaxed/simple;
	bh=zSlIbjxaW75NdtQMB+5uCdNGmRLfncsyMDDu8q/6d+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1isXkOGBhBjmd5talV7PZbvMlwW9tgZob11Se5eJ4F1AegE+2+s+PbJbCZhoqxKls0cIjkmf7Y0s+RqYOogPwDt0CMOI5l4Wht3UqF5KPrGFLeJNdxtZfKmMVkPs0n0D6ZqmfKhkGqNxO7zl6ganKFZDE5Kz2jfBpOFg0Nc37w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=obfUzTtq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="obfUzTtq"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235d6de331fso7515755ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749713380; x=1750318180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OY0OK186Eiy+kb3OI3njLLfZm61nlKnH95xfL7qAiAQ=;
        b=obfUzTtqrVVWwDUecdSHUoT23V33ZLhVIDXpdZWZkCNMoZug75fMeaEpCSUn94X3MQ
         IjfRF2dWBOMTSf4/p4l98k/nTv50vtWO59IWmfj3YhXmMNhMoZ7Wj9btQYARyujj4Al+
         hRgaO2xYHTyiXIpkDcjQFEjSsEn/BwWoPas4aGEALUh+jeg3Xn/ikrHITBFi9K/JffCW
         YmWnMBQ9lTUg5M2WQs2aXE0bT1cE0AQsPM4/0drchiTImxVbl17VorPxkk20zeKFuwmB
         4/1Srw7/9YftCK35A8+MOHGgcJsXE2L8sxyz+YURa2m+Ab2oV8seCHTuv5iyWI7LMHtk
         bgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749713380; x=1750318180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OY0OK186Eiy+kb3OI3njLLfZm61nlKnH95xfL7qAiAQ=;
        b=SJLlVUNqoFVmDoY4cMWGK1oDNrZx4bmoDwfMijA2LUNAyIjOCoZOFccrEeegdrye7h
         OTfdmVThpHsLK7Sz3774QhO0ii9t+rUFqlipMTLEWhl6nbIx64YwJjqwcjCfMdA/ap+5
         GQoXithoKEZBAQVvoN4CARNGSY4Nvah+N4sMprTYhlJyYedW8WikS2ixPMTCFrdLJ9Yh
         Pb5VT3WI6v7e1I3GGSN1hDNSLtpYgk7SkMGDLgrnNdvkt/JzXWPNouBHWBulruVZwf2J
         IDysqAbf2X/HNgtVEKeOdgsgafH7Ifjnae5BD3Eiw6xmFVCDqUrusq/bULj3q/mcJyHZ
         srAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPCBOgvD1E/Dd6ngyKJYqEkLTtXS+AV0/tlCu5Dc0ON3CHpWqtrPheACenS5292tWfOhZ5aLiGmk91zFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYI+wutzeBpDnKzBQqSp8V+VJq/islJc/LrI6yPgmRdSeqNx7E
	JwraulzkusL0jqVSxTScvtQSi6SGGUBJVLrE2g+J7AtyT7BgGX8bOUhVcKKe33UJmOs=
X-Gm-Gg: ASbGncsCShAkoJLDaK0pdX102VJYG0aroSESf/ikuI2LJlSZhCpodbiFAZkOmlDaeHg
	NqPAulTQ2WHQpofC6Rl4WNb9Lba5adAvWKZUCh1lPC77kMuKUyBTVNEXnUgfzwiFK0H3xQztTpF
	9tMGJS5voZzQawsEec3xlap6/xh4n11mvdh1Jv3nLAHgbLU/VV4lSE0ggXEVmGSbbhBV+x0lFWz
	22d4EXHosvQyRccxvA+k8iHTOlTglSgxqS24/Xk1Qz7GfX6uhE6EoNl8qZ+niZDPS0ii+hEk0Bk
	8vh/IxPKR6eWPMKIA1h1ZJK+awDfOspxz+NXFJufqr0x4gVPL2/8v9VszcyUnls=
X-Google-Smtp-Source: AGHT+IHSsq98Gwdk5JzoPA1cqT+FsUUn7tYinnnuONXeJ94UIXplKK2bd7jvRP2tu3UYegqm9ju+WQ==
X-Received: by 2002:a17:902:f943:b0:234:ef42:5d5b with SMTP id d9443c01a7336-2364c8d0c0bmr28410245ad.16.1749713380188;
        Thu, 12 Jun 2025 00:29:40 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e61b614sm7499335ad.13.2025.06.12.00.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:29:39 -0700 (PDT)
Date: Thu, 12 Jun 2025 12:59:37 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/opp/of.o: warning: objtool:
 _opp_table_alloc_required_tables+0x3b0: stack state mismatch: reg1[22]=-1+0
 reg2[22]=-2-16
Message-ID: <20250612072937.gb3n2mh34aivabt4@vireshk-i7>
References: <202506110656.WF6sPKbe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506110656.WF6sPKbe-lkp@intel.com>

On 11-06-25, 06:19, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
> commit: ff9c512041f2b405536640374ae3a3fe10efaf8b OPP: Use mutex locking guards
> date:   6 weeks ago
> config: loongarch-randconfig-002-20250611
> compiler: loongarch64-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build):
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506110656.WF6sPKbe-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/opp/of.o: warning: objtool: _opp_table_alloc_required_tables+0x3b0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-16

Hi,

I am not really sure what's really wrong with the change here:

@@ -201,9 +191,8 @@ static void _opp_table_alloc_required_tables(struct opp_table *opp_table,
                 * The OPP table is not held while allocating the table, take it
                 * now to avoid corruption to the lazy_opp_tables list.
                 */
-               mutex_lock(&opp_table_lock);
+               guard(mutex)(&opp_table_lock);
                list_add(&opp_table->lazy, &lazy_opp_tables);
-               mutex_unlock(&opp_table_lock);
        }
 }

Can someone help ?

-- 
viresh
