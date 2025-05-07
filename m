Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0028B214A70;
	Wed,  7 May 2025 10:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614242; cv=none; b=Tr/Oa4vue2GRJvf+/1kPLjN1aV1gct3HWebrE5Vgssr7Dqwvzwxzl9mhJmhxAmBABHKLPyZx/Hq7Ugo7z+zwlBfza+XSMPZ9Qp7vgGmESUdJLq57eInxNJoK7kUefB+/P1JM9ozI90e4qBuh8b+Z1Q6bPH9flk9WAA+sd/Hjz3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614242; c=relaxed/simple;
	bh=k/vSSFO8ETsWcvkA620pjbWTYpx6nFHbCXw821Dk3r4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qm+Ice5nphfwm9LiFPE1g4WQRnRA40zpuVGeDurBvHGQPrI4pMJAIzK/0SrKlmBg/h7pZMvmqzOx5DH574L35IeD6skE08FMAGCorUyqcCzgGnAknbJBw3ix5RnieTN27S8rdn78fOGyVsi1AWNnvPcvGqYoOeq6HB+R7ESPOxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6BcJdJc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6BcJdJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746614241; x=1778150241;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=k/vSSFO8ETsWcvkA620pjbWTYpx6nFHbCXw821Dk3r4=;
  b=B6BcJdJcwsCGTxZImk2OYOc8nZ0muLSNF+uH+2nUIIGDME0gB8rQ1k8J
   7pk/NipoLiA1t9tP8T43JLumOknhhqwXgf2XSJMkPGYCvXAqg/V9wv4Wq
   i5MdXXk2IHrZBeskqs1JQJRMuh148/N0CDKTtGT7t8oXDXfuYzLie4qSW
   uZKH1nWZfisCVQzVUXA6Weg1UDNMmfTCsQygV8IL+je4yCvECOz/+87Hq
   mW5hJZVWh48muyshs/RUET+ZsRP89Sc7R1Mx+CW+KZsqRNJBSJ9RPX97O
   /m0k6Owo16QziC8+wCt26r32tcR5Oe1v5y7D69+2Xk1WhafADPBER6LM9
   A==;
X-CSE-ConnectionGUID: HkykIqmpQ2+l9pTlFkPQjA==
X-CSE-MsgGUID: nfBlG3yOQ6i1LGyS+ddg1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="73724291"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="73724291"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:37:20 -0700
X-CSE-ConnectionGUID: 758hDG68TZyrfNR03NflwQ==
X-CSE-MsgGUID: EQO69+FTQIGXkZb2gj22FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="173110900"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:37:17 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250505202722.1048675-1-srinivas.pandruvada@linux.intel.com>
References: <20250505202722.1048675-1-srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH] platform/x86: ISST: Do Not Restore SST MSRs on CPU
 Online Operation
Message-Id: <174661423219.2744.949615861915039788.b4-ty@linux.intel.com>
Date: Wed, 07 May 2025 13:37:12 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 05 May 2025 13:27:22 -0700, Srinivas Pandruvada wrote:

> During CPU offline/online operations, the hardware retains MSR settings.
> Even if all CPUs are offlined, the package does not lose its MSR
> settings.
> 
> Therefore, it is unnecessary to restore MSRs which are modified during
> the online operation, and this extra step can be removed.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: ISST: Do Not Restore SST MSRs on CPU Online Operation
      commit: 68ea978fa096dd62aed386b384e3bc7e713d3b79

--
 i.

