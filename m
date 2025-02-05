Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5679115FA7B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738769502; cv=none; b=E2GY21d7VJhQ+yugmqGfOydTzql+jGvNAH2LQO87wnIo3Foc0sQm/BJJm9MDlgCcWzQL67RsZm5aMPeaH7Qs8L/sqLvtZLjGOQVGCE95YN3P+R6M1gIY4Y7BrASsEvPZUFNbmMNo0sACcGArXJHvgFNLbUBaHOQpC2C9IE5YWLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738769502; c=relaxed/simple;
	bh=W5uGk1r6vFZmCjIotT9heokHOld87wIreyUWeeOuqeQ=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=G/jSS6Uk/+R9GzLiq+1Fu1dRgWL6QLcu6RK+UxCs9ySIogDdCl8Txj5LA0WlRNGnH752QdsrwBzzjlOQy0ALR8AjXLRa0+pxJ1CKr8UXsRLCPviVXZv5fqV+YSgC+2nzFhE5wnxDSlF6rvnkcRna8cH4NEFccPtd4skFl7jLs9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=yzi4Uhem; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="yzi4Uhem"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2f9c3ef6849so3656513a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 07:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1738769499; x=1739374299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UatWkuu9Qgwg8ANhzy8M4m7Rk1sE6deB/rTA3GCn9Gs=;
        b=yzi4UhemFC76J7KgHDoGzqEp7z7lHdfGi2IoZpOHahIEy8MG2GlfxvR5B8EtWmnA56
         YvRZqO9ugLZQsi0SiodmQFKej+iV/Deo5BA0rytW0SnFUCEGq3TD1JTQgyfrPqcPD3bq
         6x8CEEvhtzm9DUEh8Q8QskTDJa5onq8r3rwLUSGKjfQCa4PdbX7kp+OpGTLBMQL9aogI
         FmR46eEE5BPOMhH8OD3nAYs659rh30LHrFgABxEqpyaTZcpDZFl452X6RwmcKpR7c3dh
         6jWFzSNzeaySJEXV4AcopSJgJfz8fv2DAo7TjLTLj83MInnXRMIHoNbImsj0vXdSElXs
         AwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738769499; x=1739374299;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UatWkuu9Qgwg8ANhzy8M4m7Rk1sE6deB/rTA3GCn9Gs=;
        b=r2GsbbqXileJj7lGWmlYzEllPHLn5JYFgWoMjSE4HH0PSiHLd0/OmSk8wtWvlz6u9r
         33MmJ4q3w9V0vuBwwhL49fQiffHXmyM2K9CpKSJlU9esj64/dQ7XTIA7zBCZ96nD38Bu
         QTBFwI8+TMx2wgqEkspqUbUX3GR/yFlwCQ9hctx1W1MKGxotdPcLQpqUbuDBnCsWuXn2
         VHb4xo35g0rZMhlTImFaLXWmXgHD0Hg6ANWDlCyA1QrhMGnPi/EJNtqlYS/uIS6A+3t9
         /kJTK0WCKbOdrcE9KlznJPXAEHcfEoM26b3V//O63q74LYm7yasvhwbVvj+cuWz7aT6u
         Tf2A==
X-Forwarded-Encrypted: i=1; AJvYcCUGS8t0WRoPCfa56gIitwjMuO1zaDc/D0vndW4iU/4jBCUUES1tIPGYd1oklGWM/0/LX5Uk/QNvzSrkGaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YySq4s3dthQ6NdmxyS2H1II9AsEHEVYexzi6fMM3O9tpbtgVrtT
	RNYHRf+CSh2l2PsR4fsOfwCliepWPmkPm9ZVLiI7v5o5QGTO0RCyl0bI66n8U8s=
X-Gm-Gg: ASbGncsDlUZuD1jDioG/t1qyvk9fOvDUHGuoxFcLVp21k/1sLmpOodKo/U8WjpVMRlV
	qevwCqUrjxmMm+y8TumpEQS6fAa/iSIV185TC7BXyYJHw8jmOw5oPLwFeBQ826EZzrI/tpVWXbv
	aJEpkR4BpprHmLputD/xgn+Av79JUILxHlv2EhS9aWYnTONDJ/uBHsnBrTgbZKhnZrgj0gc8gA1
	/n7OdY6urTlBL3dES1AaBCQCt61oYJ+Kr7YrJiB2qnlR2xiKsFzz8J/3e24/uBgFNc8cj1PFKol
	eIccuSpoo9sl
X-Google-Smtp-Source: AGHT+IFlrEqpwEqQKJm6jVKLRHs/j3zsT8RciURX3ceRV8XojffKvUsKNIOJn3B1ftJERTOXTnJITg==
X-Received: by 2002:a17:90b:5288:b0:2f9:bfda:49b0 with SMTP id 98e67ed59e1d1-2f9e079b72cmr5022165a91.20.1738769498039;
        Wed, 05 Feb 2025 07:31:38 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9e1d60aadsm1723134a91.9.2025.02.05.07.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 07:31:37 -0800 (PST)
Date: Wed, 05 Feb 2025 07:31:37 -0800 (PST)
X-Google-Original-Date: Wed, 05 Feb 2025 07:31:33 PST (-0800)
Subject:     Re: [PATCH] riscv: Access time mmio instead of rdtime.
In-Reply-To: <20241229-cogwheel-kebab-3cc2b21096c8@spud>
CC: arikalo@gmail.com, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, daniel.lezcano@linaro.org, tglx@linutronix.de,
  djordje.todorovic@htecgroup.com, Dragan.Mladjenovic@syrmia.com, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-2dc5552b-3c35-4469-b511-3c6dc257b610@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Sun, 29 Dec 2024 07:09:13 PST (-0800), Conor Dooley wrote:
> On Fri, Dec 27, 2024 at 04:00:56PM +0100, Aleksandar Rikalo wrote:
>> +#if defined(CONFIG_RISCV_TIME_MMIO)
>> +	if (!of_property_read_u64(n, "clock-reg", &mmio_addr)) {
>
> This is a non-standard, undocumented property. reg & reg-names are what
> you should be using here.

We were talking some in the patchwork meeting.  If this system has a 
CLINT then it's probably best to refactor the timers such that MMIO 
CLINT access is independent from M-mode (as there's some patches 
floating around to make M-mode use rdtime on systems that implement 
rdtime).

>> +		riscv_time_val = ioremap((long)mmio_addr, 8);
>> +		if (riscv_time_val) {
>> +			pr_info("Using mmio time register at 0x%llx\n", mmio_addr);
>> +			static_branch_enable(&riscv_time_mmio_available);
>> +		} else {
>> +			pr_warn("Unable to use mmio time at 0x%llx\n", mmio_addr);
>> +		}
>> +	}
>> +#endif
