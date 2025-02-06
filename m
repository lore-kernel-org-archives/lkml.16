Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E557200108
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865921; cv=none; b=hJopdCNU3zH7PQUF/ircTPWuUBm+HSjxccM458RgRG4IZ4q5V4Kvf4BCZLQ5xhmU0LQOvhU/+WqoEPMWMaNQTYxe8ZHP4pOU/KSzbVF5MdVR3whxJUOVeI77tkKMVYkz0n++F2MCQVr+s/Op6xpY2sZgCrIoeOKTLggGS1nNXXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865921; c=relaxed/simple;
	bh=svxamlkxBUKcTv2w6ZafIS1La0uoCbSywKilubANIRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bk9VBxJ8aIIOoM5Frqppf3L4ny3kq5tUVc0Rd9AycX4nPQak4SfnVc2ky4dBh8OupO2TTzf+WYZvpscPAKNlJE+BrZHdC+M3amj34ymPHHgJi8Rvzs+69VdTZvhga4KTDlbNOl63G9maSqyOXhmKKJxfwMOnvAjfh4i5j4Drny0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mbSs+E6K; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="mbSs+E6K"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7be8f281714so104958785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738865918; x=1739470718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sUG6NzheiadFCQgj6TrWOr68/8bmtDa4jtIU00ptXAY=;
        b=mbSs+E6K1mng+bdaDcGEHpilu6UD9hQ+MzTDmdB0rMQViksbRMFL5Y6WlrW2SA2tA+
         K1mjJ2eoEShi78wee1z1RUpdF2a/WvieNFxjY6ZM74woVzYTmvesov0oCDwoUJAaRAOT
         Zbsx5jvu465jpl4LQUWVy5K96G32hhd6WjZJJMLYRVrjbHQ4/1Jr9mofTXMfyyACkWOS
         TUvPkB0eaTxJnAwmUS0kLy/rnHZi+32AcOoyF5RRQeOtfhPjV+vtRP1ge6PrWk9fdpQt
         Yf9l2/+bFZ+bTJN/wHbGRyioUtpupBCAX3L5YWRvWA81YZlIRaExlWC1R4ti/TytXugZ
         8tUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865918; x=1739470718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUG6NzheiadFCQgj6TrWOr68/8bmtDa4jtIU00ptXAY=;
        b=XkSx6W7EFjw8Udx6NusHF8HkyCqJgWDg/vfvLOWODy0F4DzrVAAa/PHm4psssMg66P
         2lHYctIzzRKRl0Lpdc9aIFnfvMr7gyPvNA5aX4i+JG+go4+7unwEqbTCGfx3WQzJpON4
         vX91jcNWJcho3jbA70a+6mCPgf1M5Wa5SVCvESmXZY5b/YeIHqq8tWt1w6SkQiicTXWM
         WKSYxGSslHdFL7bl0Kj34C/l0X0xI0NdyZjaboPsmTYaKolXvOmtYDmbb/ie/WBJ1jOR
         RU2jvBjx40LcL+NwzoSZzmWvl9VStcKxTXOEmrzAsuc8vB8WpsRwvEm8BmQsPE5w4b91
         BN1A==
X-Forwarded-Encrypted: i=1; AJvYcCWwvRifj4ox1vqaEdRwJqlYePL4lq4rHlaHSSJMEzK/8M0Z6EKhaOdhrP3GW3SqAMuKuNd1OMWW+jvHUxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpSucOEylsL8/adpIrDtzFwF+k4zSKIB16eHh5VcuE0mf1q+qH
	bR5EBpiZIoAUCsxkMpyQxqGuXrSN/5H0pWz9jdUOK9xSThslpH8jrwlSj41OTR4=
X-Gm-Gg: ASbGncvn5VaVNW80xvXMLi10VJJTmMxAcOiHD64YdaMZGhbmLQw+uYsr/0V2jzL496F
	IBBEn/C9Wc2IoqXAIEMSSFpA2ETbJ9YjnhJVS4w/ja5AJiFBnP7WoHaNWtLbCMAiH//34nG8ynG
	aLwbvAZDphu2XOqhdYuQPky4/0NRwkO4J7WBUAn0Rj5vk5kNPxK8X6P/UZn2kE1ByW9wHf8yMQ4
	BU4FOaTNpxbU8NKToCNf2u9aVgAuirMB3KaO3J8GENYSTySSegwxkd/9AebHSawzYOh7APLyeCK
	XtJCsUkOJdSuwL8WQDv+IQuQ/IDEh+QBR/9OA+bAih9ny17PDtH3+x49h+pS1Hr6bQPdWfTtFw=
	=
X-Google-Smtp-Source: AGHT+IE0GG1TtDuISiUGDhpqfV/qZ02GwpSV6gJbe4kGblMEMNURq4Dlgd839ByGnXLwhq51VKDVqg==
X-Received: by 2002:a05:620a:43a1:b0:7b6:d6dd:8826 with SMTP id af79cd13be357-7c047c9512bmr16375185a.55.1738865918192;
        Thu, 06 Feb 2025 10:18:38 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041e9f94csm86724485a.78.2025.02.06.10.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 10:18:37 -0800 (PST)
Date: Thu, 6 Feb 2025 13:18:35 -0500
From: Gregory Price <gourry@gourry.net>
To: Terry Bowman <terry.bowman@amd.com>
Cc: linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, nifan.cxl@gmail.com, dave@stgolabs.net,
	jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	dan.j.williams@intel.com, bhelgaas@google.com, mahesh@linux.ibm.com,
	ira.weiny@intel.com, oohall@gmail.com, Benjamin.Cheatham@amd.com,
	rrichter@amd.com, nathan.fontenot@amd.com,
	Smita.KoralahalliChannabasappa@amd.com, lukas@wunner.de,
	ming.li@zohomail.com, PradeepVineshReddy.Kodamati@amd.com,
	alucerop@amd.com
Subject: Re: [PATCH v5 04/16] PCI/AER: Modify AER driver logging to report
 CXL or PCIe bus error type
Message-ID: <Z6T8-zXvcdQrCWdu@gourry-fedora-PF4VCD3F>
References: <20250107143852.3692571-1-terry.bowman@amd.com>
 <20250107143852.3692571-5-terry.bowman@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107143852.3692571-5-terry.bowman@amd.com>

On Tue, Jan 07, 2025 at 08:38:40AM -0600, Terry Bowman wrote:
> The AER driver and aer_event tracing currently log 'PCIe Bus Type'
> for all errors.
> 
> Update the driver and aer_event tracing to log 'CXL Bus Type' for CXL
> device errors.
> 
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> Reviewed-by: Fan Ni <fan.ni@samsung.com>

Worth a macro/static function?  Wonder what else could use this.

Reviewed-by: Gregory Price <gourry@gourry.net>
