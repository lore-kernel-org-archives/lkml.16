Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EE11A2632;
	Sun, 25 May 2025 21:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748208044; cv=none; b=qpzjpzN0+eqlyTAcuqF+SXVjdlEtphSwAvjOKXwc+gR0z/xIaJ4BPtjTi2JvhryBRM4yfii6wexM/CPG0AAr3FTKo0eaMMiZ+78A39tEaabOwPHKdoAVzRzm2dMlvQMQDQwq4HvveX1ljpZ7zyA5rUgoatMiY99x96GaWj25Oug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748208044; c=relaxed/simple;
	bh=Fv2JPWhFxkcprKWaTl1yJGPgfRQn+nlh9JjQNuIjjG0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LBlZ7sOV9L22LbSCu+uOVVR+FvRCit40J7qgUaUfCSlH9fl/KloucMkcj2DNA49WvCFU7OtlaZOX5XuG9H60DU1oOsO6WSlMOjLvfmuuGJDgWUUtTdSLGdbTrVQVS93lCjrG3olpP344XhcQMBTQMHS8Kl9d8B9VYiRg+TCN7VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LL11bLeu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LL11bLeu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748208043; x=1779744043;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Fv2JPWhFxkcprKWaTl1yJGPgfRQn+nlh9JjQNuIjjG0=;
  b=LL11bLeu4wg+3EPVodruun9pMsszc/ummucEiHQXYIRt9yGCveD4wqJs
   apdgCGgX1hdKKoCClMSih7xEYl9ZiDOqN7Tcjf0WQcZjBNsm9/5H81V9a
   q/GCj3ZldOUfUz/JeBHygYhzz/ZctKaGdbhb+58rx5c+kSswqjwZKJHuA
   XJu9HVsLjRwbISXE00N0vHjGmYRXoKDayEnPGEH8pHgR/7qoI+C0Ncvmx
   KxF4C3ZYW9ph7V7NNyG5/RVWcIoWqjIF12qXBizYWZ4uKkjku5h70wwHW
   if4va2eOSb1R95YYMfe+IpEE7tAJjZCWgyJnvCfwMvl7e/PCGi2WjFgVZ
   w==;
X-CSE-ConnectionGUID: 66k43YCXSpuGuNmSKKbHTw==
X-CSE-MsgGUID: Pap+ROxhQueqeB8IE9ANsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="50105249"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="50105249"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 14:20:42 -0700
X-CSE-ConnectionGUID: opfalbv/SVGEXxrWQC7MRw==
X-CSE-MsgGUID: agfCF+MSTv2sHSWQA+lv9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="147244070"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 14:20:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Peter Kaestle <peter@piie.net>, Hans de Goede <hdegoede@redhat.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <e502fadf2c6b24fc4ec3a7880533f7ca68429720.1748177235.git.christophe.jaillet@wanadoo.fr>
References: <e502fadf2c6b24fc4ec3a7880533f7ca68429720.1748177235.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] thermal/drivers/acerhdf: Constify struct
 thermal_zone_device_ops
Message-Id: <174820803446.8751.6742325795914152145.b4-ty@linux.intel.com>
Date: Mon, 26 May 2025 00:20:34 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sun, 25 May 2025 14:47:35 +0200, Christophe JAILLET wrote:

> 'struct thermal_zone_device_ops' could be left unmodified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> While at it, also constify a struct thermal_zone_params.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] thermal/drivers/acerhdf: Constify struct thermal_zone_device_ops
      commit: f38af24df7426c088a5b09c9228ed2646a79edc4

--
 i.

