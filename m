Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32330241CB5
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 19:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744141274; cv=none; b=aeRCiwfAW/3/n4SWCAQUfDD1RyQKphupse2rcAxM8p3l74GrgC1fqStj+dXiWoM6TFqVh7ziY42Zu8AOydeDjB9vMX5fYHTrNvXIdGau8wCYPZ5gGbqY9DI6yIGxPBXB/tcwJsYsOSAC8VGM6mpJkYm5NV2ZmlCe/ho6afTUorw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744141274; c=relaxed/simple;
	bh=WvyOxFcjnEQDjoY5VZPTMKfsaOU7pDlNTjjExeRbJ74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+BAGPGFjy/A5bYJVQTLYU+b0AEQcN9xLloclbqV2HmwVzR7kMX7+Q+47iqqzZmWsj8YX8fg0PohdMRinkZJ5MW49olzg84AIBRG2BqxvpmEHDlwUhd25ngv2emN5IWW7qBXfNkplx4vO9gcRVl36yjpxTWGXavDGMg6F1LHn78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: EFsOEqfsTpuDpCIBHc+1Vg==
X-CSE-MsgGUID: t0j2mlb5Sd+72jKyvemNXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="68071126"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="68071126"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 12:41:13 -0700
X-CSE-ConnectionGUID: sX2Fs3fhT6eBZGugaCpGcg==
X-CSE-MsgGUID: 6EeWdHeHSJWq7OkGLUhRgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128701364"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 12:41:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u2Eol-0000000AVBT-34ii;
	Tue, 08 Apr 2025 22:41:07 +0300
Date: Tue, 8 Apr 2025 22:41:07 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v8 0/2] staging: rtl8723bs: Improve readability and
 clarity of sequence number wrapping
Message-ID: <Z_V70-9Bk-aZ914y@smile.fi.intel.com>
References: <cover.1744126058.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744126058.git.abrahamadekunle50@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 08, 2025 at 03:41:55PM +0000, Abraham Samuel Adekunle wrote:
> The patchset adds spaces around binary operators, breaks long lines to enhance readability
> and provides clarity on sequence number wrapping by using a modulo operation % 4096u, in
> place of the bitwise AND(&) operation & 0xfff.
> The patches are required to be applied in sequence.

You missed my tags I gave in a previous review round.

-- 
With Best Regards,
Andy Shevchenko


