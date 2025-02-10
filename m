Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B9B243374
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739190166; cv=none; b=RiKCTOwo/44PPj91ei1m7Ti1hUcqsAYIRjb2xMdiG8lMMkQsNZPeR/pRuBQ0eVKdfM8TtwD2A710fPneuLp1uVUouI9FvRkoTWvknnO1QTLx2SuUiPXXhKWOmgFDQayyjbhOjWvO16O/lsQQBw+sRDj7DtWrwKHB8Wj55cas/D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739190166; c=relaxed/simple;
	bh=D5szCVESMN9ourmiO6CU01qZfUnW6l4QuLPfuu1uUuc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sMzOJunYaPpjYLQU5vxqJd/gB091hSLl7A8JHVmAkd47hEhQMaZPZxWtNoR5mbqlhHSCFO0+NOh6RnF62kXOJWWIPbwkCOGaXaatO+bi8P9e+v77YjK6cM0OelIOFALs7zctlL50iBmzKAmIsvDsvtnllGY5z3IDqrwh04bkfWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxX0wiXI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxX0wiXI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739190165; x=1770726165;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=D5szCVESMN9ourmiO6CU01qZfUnW6l4QuLPfuu1uUuc=;
  b=KxX0wiXIcCBaKdfQyyi4cmEovmwFCtO95sMvebOBsJ69KYLFg80ZuMf+
   AMeEtmrDtR0T6P7kKVuNI4IKFJWklfIjDdZlpyBHRXCUfwebWA71NY/Jd
   tq+fzYJJX/hYDUF/ZR5dzu8+z/nhyExflG7qm3svX1SwofmFwZ5jdDpI1
   d1vFKWOqxKQQyEbgtc9trAp5bKyD25B3T+du/UloTxGQjK6UG0us3Bgw9
   DE00YiqN8fN+IIu4g58QPAPayzrkQuXFWlFo9p3vW8ugAC7c0Ap3a5Zbl
   LwgiJTcP+BOseBlitQSQFf3at65zXJwqKkoPh3jXqFrqONC/cgiqV4dFu
   A==;
X-CSE-ConnectionGUID: AvsAE7b/RmWPHfudXg8C8A==
X-CSE-MsgGUID: WNyROy5BR3OKNhWqFqui/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50752328"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="50752328"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 04:22:44 -0800
X-CSE-ConnectionGUID: pliT4yuvRAG2cNeKqxyD/g==
X-CSE-MsgGUID: VpMN6canQqaD3B0ni3pGCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112616824"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.244])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 04:22:41 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alex Lanzano <lanzano.alex@gmail.com>, airlied@gmail.com,
 simona@ffwll.ch, tzimmermann@suse.de, noralf@tronnes.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: lanzano.alex@gmail.com
Subject: Re: Maintaining Repaper and MI0283QT
In-Reply-To: <mubhrsqwsixflh5iagrtwsbup7nrnxkhwhn3nmqvmfhibwxauo@g3jvqxpo2fb7>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <mubhrsqwsixflh5iagrtwsbup7nrnxkhwhn3nmqvmfhibwxauo@g3jvqxpo2fb7>
Date: Mon, 10 Feb 2025 14:22:37 +0200
Message-ID: <87bjva3s6q.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 07 Feb 2025, Alex Lanzano <lanzano.alex@gmail.com> wrote:
> I saw that Noralf has to unfortunately step down from maintaining the
> repaper and mi0283qt drivers. I would be more than happy to maintain
> these two if need be. The repaper device is very similar to the
> sharp-memory display I currently maintain and I've worked with mi0283qt
> displays before.

I think please just send a MAINTAINERS patch!

BR,
Jani.


-- 
Jani Nikula, Intel
