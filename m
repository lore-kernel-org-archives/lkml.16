Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F221D6DD4
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738785029; cv=none; b=iZ3BLOhrbOAU0+XFEF5YWZloVaoa1WhzWAiSmTcOjegrbU+w+Eh6IcHuE+7aUQqdTdwagXkAvwsbJpMqc96EFlBn/rNbbrDlJfhdDmIW1WqpzNpykhUdZss6HWwJQrVC5pNhI+KjoSptyiIXY2KHKkvTBQ2jlqxk3pKNNQ1dV00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738785029; c=relaxed/simple;
	bh=n8j3DGOLUHU7uRmc+FhLpi4ngVKHsDZJ/NqvWTWKGcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvGUZu1am8ShlBZbOU407qz9VPIPGwZRhPNzIaO0cnXJQ98gy+wULm5MqwYK7pzxCPVnAztXlZ7Rv8kjhvVEb+SOe1cnojltH37iy/YNdpfbjISdzSr9z+ZvnNVutX5GYOAA0U8izta2MidbmdZF2mDyFZ0hIGJQ6N879sxN5C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=q9k7rDL9; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="q9k7rDL9"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-46b1d40abbdso1848391cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738785025; x=1739389825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JB1QhklLlkYCU54lqW0Pm1NXVvCDDXyC2idxgwvRo9A=;
        b=q9k7rDL9USHXqJYagynqTeWaqNWXooVFaKv4xC8LkdZmIJ/DQHRzFAwuNo6xNgepDb
         Uj3oef18e/jHX/CQfS9WStux1RPBpIxiXz6FeDDIp/5zDrLIqk+BCRUuH89lXkfsyja7
         4fk1twEZBpwHepIzwizC89qadIImAsx1ddtPY9AolaDtPy4EPp2w5W/ZpeTc5RkarUH4
         mwGf5XGH4QAswMR4uLHfo4ffc70w4UXSN1JFgUfmjbwlLeRxXPnI14DaryOXKwpdZ19B
         04oo++rpYP11iN/6HnJ4exH0FThIKopmy6SomPBMtPuFmel1x94fho3NOrYXShmXnVRJ
         6HFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738785025; x=1739389825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JB1QhklLlkYCU54lqW0Pm1NXVvCDDXyC2idxgwvRo9A=;
        b=FhI0Ybe2YrQalXZDuQrjfW+IvDK0t16YG83Z9rYrn9p6ABq8sgC1K3X7NU0NoxyUAs
         m/CAz9H04C7zCJg+8/qNDdoe+kRjk/YuYprwQyoeyu3XgPQbNZJFt2chp00c+BnVZ6F9
         WUlf8vbI4dnlhtvpT2QuvILLur/venWZ/JHevfBsvASyDRJ349i0LGGDbjtWvRXBwasu
         oxKPYTyulXrs35Zj/0Wn9UrOSR+jGkgjLO5VTowyG+CFnGgDy06vIrpMTlzrLRGheAEm
         9XdLuq6l3tn+oHcdT8hPhTWba9r+vMQOZ+ZUBMtT9TBgSQTTkxJrNuYDekDC/Q18TGVX
         hRZw==
X-Forwarded-Encrypted: i=1; AJvYcCW0rJeYeW6R6x49SURS7R/YacHdBwpWVDOmuyX7UlBFgnBpBtvhf6KDndJ5/1WENnZlL6xJzzUwTJf6NVk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4eQT8ceLpmZVTzxThuwUh0cByDKjqmugu35cNMZVRly+s1Flz
	9w67CsoFSpacHotJPfE7nWDUy+U8GE+DFF61+ZxeFpikOffpp7U161JdewbZWAc=
X-Gm-Gg: ASbGncuNhULFVauekT9CY/I5U2iddWyGyRnMCuz5hNrlBCntzNsvRARH+mlQE2asHN+
	eD2aFztirsE6eEmOTPryyOXStm1QLNaQSrL9QjnXO8B7G4Fhk16iQ0UM8ixj8WhnTyPcVZROeTB
	2hKpbOFSltL+wAyGDSv0RxFwYONXjq0Y8zNPsb/GsbqESuJbobpdLOy0WuFWNU7JyMBftqghOWM
	SoQ3zXbpQ0SCjc/cPUC1rJIGEPaQii1lkLrB/WmtChmSnJkIihGqSyUCRnmiDI2Ocp1L94+SULQ
	ryNhh5DRLHXj4Xn6okZwloCVhs63Yrz9ZqnX9wfngNViYEwuyKqC1KhCmlsmLN/lfWxUijU6bg=
	=
X-Google-Smtp-Source: AGHT+IGcFSjOMu8RpqfHkHlk/VsaPfJwj2d6oLcZx7tPWUMVQrzAwbXbG3wdktaK5qXTF1GIr6IVqA==
X-Received: by 2002:a05:6214:21ed:b0:6d8:af37:ae5b with SMTP id 6a1803df08f44-6e42fc83442mr59146136d6.43.1738785025216;
        Wed, 05 Feb 2025 11:50:25 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e42169524csm23923566d6.125.2025.02.05.11.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:50:24 -0800 (PST)
Date: Wed, 5 Feb 2025 14:50:22 -0500
From: Gregory Price <gourry@gourry.net>
To: Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Terry Bowman <terry.bowman@amd.com>
Subject: Re: [PATCH v6 5/6] acpi/ghes, cxl/pci: Process CXL CPER Protocol
 Errors
Message-ID: <Z6PA_hN-3ZtWbhUh@gourry-fedora-PF4VCD3F>
References: <20250123084421.127697-1-Smita.KoralahalliChannabasappa@amd.com>
 <20250123084421.127697-6-Smita.KoralahalliChannabasappa@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123084421.127697-6-Smita.KoralahalliChannabasappa@amd.com>

On Thu, Jan 23, 2025 at 08:44:20AM +0000, Smita Koralahalli wrote:
> When PCIe AER is in FW-First, OS should process CXL Protocol errors from
> CPER records. Introduce support for handling and logging CXL Protocol
> errors.
> 
> The defined trace events cxl_aer_uncorrectable_error and
> cxl_aer_correctable_error trace native CXL AER endpoint errors. Reuse them
> to trace FW-First Protocol errors.
> 
> Since the CXL code is required to be called from process context and
> GHES is in interrupt context, use workqueues for processing.
> 
> Similar to CXL CPER event handling, use kfifo to handle errors as it
> simplifies queue processing by providing lock free fifo operations.
> 
> Add the ability for the CXL sub-system to register a workqueue to
> process CXL CPER protocol errors.
> 
> Signed-off-by: Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>

Reviewed-by: Gregory Price <gourry@gourry.net>
