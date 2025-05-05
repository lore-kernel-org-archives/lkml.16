Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C47E1E5B79
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 09:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746436941; cv=none; b=aQPfI8UU2kJCQiXJdy25sT5peCxNtq0kQPLJrhO79VFEuteznFg3Guaj/6GtrNaSFpZWUkHOWdbEoiVfwUPGNE2Lb5o39+qFw1V6r3BeNQ2TTzEteupEoj/xHkb4TyNM6ks+lgRRKJKM4adc7Ob/np6zJrSCfc7sudyNIcOs+yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746436941; c=relaxed/simple;
	bh=4sQqcy2p0pt3UAfM4uBSQVQYIRhRYnmuavp+vDr/gB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6ytEMIoDp0PnajIWPqGcPPVFH0IeVgFslAC7wVa7MJ/OoYrfsCF9r1SePXVaC33g+vI1OAvizXztpfhYRfd1JncKoUkYLxiVIsyRw4F6jGtvLb8F4gPKdr4iyWj32G0I8I14S4b6+wG9xP4p+YNiklNhdX+xXYBkzHg5liC7MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EwEf6HEE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EwEf6HEE"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf680d351so26381945e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 02:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746436938; x=1747041738; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=inI9GMkDBxanfHSwJyNgWA+Q2rZ3MijFvHjmvFwTGLo=;
        b=EwEf6HEEFgeKFiSG/GtJJdTlBa6RTUiTxNrQl/lkDR4JBtWIHntiEXO1mtS2pkH0iV
         oAdiNPnX8J12ShPPQW0sbOdDKVU8C2nZJ7iiYN7uOvlx8jzs1+jFP8oVlDJ/L7I+DnrP
         GfIpUKuKy7w9YObWHVHRmesVcvqc3y5pmlqvggsbEWws4qhdjQekvcegvTqe70tRLwl4
         i7lDln6Qf5sGoh8xgGp22EsFn4o80i1KWigcKfH8OGhpaOiye3M+ilp3dlD9/ubz6jqe
         cjsgu0QBG3L3x0amGE5rgLlwSxMRM54ITNfVZpcYgxwtdPx5i0bDWqcGd3/GRZt0DkeN
         HHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746436938; x=1747041738;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=inI9GMkDBxanfHSwJyNgWA+Q2rZ3MijFvHjmvFwTGLo=;
        b=ms8APQojIyn9rOSXloI3wFDhs9q8SgEr3HMfu0XHgVkHYnbqBJq2Zj5YuL4SIN2U6b
         ZL+5pKKp3ww6kj0rA0ziGMos6ebVsD3P614EMkV6OCjnr07c7u2qXUZcU8FSAu7Z312V
         LsfGRa43K+GG1T5FjdNsNjAmBw2f97TzJsh8k9rUztKIOOnjW5TvJprSY6JyjbB5V94f
         ImZ/82WuNifNnJ5eumz/XMgEZHbZG5ZXyTvmyfXqJAuZLTcagifHd8iFrmcqZhNH0jB5
         ByAq7+RGLy5WyT4HbIvzfdNxLhROOLEPzhjCfnt726shEIH5i4udyTrNApltJ5WseAT3
         facg==
X-Gm-Message-State: AOJu0YzUlg560KB8A9R61D+pUHZhOgR4j81gMJo5bWOi8DEoiipIj7aM
	YtFZzuaN3lRGJ7y/Qtpsd5e4nCIMMYcOgM9uGFQnTRPuXFsQLhmE71GzHW/NlG8=
X-Gm-Gg: ASbGncswLQTfnSzZGEON9hNuIz33/pt871vejnkmt9rZRR95elrvHpu4AzUwiNj3EbT
	lqLQDAAZrr0F3ULWu/VhknxH3Q+/j9hyYEXtCY4f3+aLaL8FsHUnHJusMyo6bisaHC+aoUAEO9b
	UIx8Ok2nS2ZuSeSQudTDnO0OcIzb9NL3NgK8Y34wLkLaoGGaGBBu3gX5jgS0zURLuTetG1ISEfz
	G9PpyinwvvCgfzOlZMM37PK8OPFEMbPqPCMmiCQxehwgpKvLawMmaAaOt+yXwhzp1t51vWl58u0
	ReHCW64L8DIIctupvD5zstPzA6wLe8C7sv7/GGhiSt8TxTgoooc=
X-Google-Smtp-Source: AGHT+IGOZsSEc29CR+NS+fqhBMKzCbpKWrfuPlz33u/HY6AhDAwcicgTYTSAe9J/cXeNom0tvwUc5g==
X-Received: by 2002:a05:6000:178c:b0:39f:ec:d4d with SMTP id ffacd0b85a97d-3a098258dfbmr8897531f8f.12.1746436937595;
        Mon, 05 May 2025 02:22:17 -0700 (PDT)
Received: from localhost (109-81-80-21.rct.o2.cz. [109.81.80.21])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099b17017sm9934096f8f.92.2025.05.05.02.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:22:17 -0700 (PDT)
Date: Mon, 5 May 2025 11:22:16 +0200
From: Michal Hocko <mhocko@suse.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 4/4] Workqueue: add WQ_PERCPU to every alloc_workqueue
 user
Message-ID: <aBiDSHee4TKs8HF-@tiehlicka>
References: <20250503082834.49413-1-marco.crivellari@suse.com>
 <20250503082834.49413-5-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250503082834.49413-5-marco.crivellari@suse.com>

On Sat 03-05-25 10:28:34, Marco Crivellari wrote:
> By default, alloc_workqueue() creates bound workqueues
> (i.e., without WQ_UNBOUND).
> 
> With the introduction of the WQ_PERCPU flag (equivalent
> to !WQ_UNBOUND), any alloc_workqueue() caller that
> doesn’t explicitly specify WQ_UNBOUND must now use WQ_PERCPU.
> 
> All existing users have been updated accordingly.

I assume that the next step is to drop WQ_PERCPU when it is not strictly
necessary, right?

Looking at the huge list this will be a huge undergoing. Is there any
rule of thumb to tell whether WQ_PERCPU is required or not? Maybe
something as simple as - if the worker doesn't use any per cpu variables
then it is highly likely that it doesn't need WQ_PERCPU? Are there other
useful hints?
-- 
Michal Hocko
SUSE Labs
