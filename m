Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD53E1D54EE;
	Mon,  5 May 2025 13:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746453141; cv=none; b=jHPgvvBaIvsZDbSp6JAjR/4MnHirJE2v3Xi5w+VgLKZxufPbEaAD1VOdcgTwS3NDTQkWwy1Z/d37YVk9rEPANArzNhMY6TGgdqaHclvOPT5AeXwfRXyx0rIKHXmSADNvaPlk9QpiJo7JS3OjqWBXICrzpbFdzH7jUYoTj826oOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746453141; c=relaxed/simple;
	bh=OqvAZIZ0hBBm8cCRD0Vz3cuo1pZmgtrL67uvLA9aScY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WOBMrIv8+tmWzdxVS3N/U8XEHYJ4UmWxNCH5d5WHk36OZVUyTIzmaldzAX2rp/vp7taFZjuyejZBxGETwNtTMhWIS0A0gzKW3zUMI8Bi9xWnj71SgJyTSQZlLsR9kLvqmX6kRc9CeG8RHWv1QlSk7wHuyMndbVFrb1i3e2XiiGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTvZtEaM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTvZtEaM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746453140; x=1777989140;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=OqvAZIZ0hBBm8cCRD0Vz3cuo1pZmgtrL67uvLA9aScY=;
  b=WTvZtEaM2o2AK/fk7Md+3gDTEr4HK6oEWKY7qrJy1DQwCqPUWqb5hxyQ
   2eVW5CmgCtUK2kNsSDikOCavpk/I/MMyD+LNKw0iuI3nHEzZFboGnom5k
   uansGbL2O6BwtM4e86JBkP7+n3Z/6aX6C/rqp9JfgeXqHh/Lwg8o+k/Q2
   0jdhB/LGGrfzSiT0yNZ9w79RhD36qA3SxNYaJ6b4FVgnx0XlRk8+nf3AR
   u54MQ2x7e08qonY5WJ9PvI3jPrQ2QrTrzFXEQ5hm79SFXdH9JulJ0Nb2Y
   PFFyhSio9ZJdzpgYzFKMy98mXQFlFU2Adx6v6JN7ApCadjXRwZVmcOrAN
   Q==;
X-CSE-ConnectionGUID: RTMhHpqoSKaJ0gZm5kS0lQ==
X-CSE-MsgGUID: waTd01oBSm+GJds9Nuc24Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="51868458"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="51868458"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 06:52:19 -0700
X-CSE-ConnectionGUID: XPjipUoCTN6Shp8LxJyffA==
X-CSE-MsgGUID: wfbHTAunRFywKjfvJuiOJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="140046204"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.68])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 06:52:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Antheas Kapenekakis <lkml@antheas.dev>
Cc: linux-kernel@vger.kernel.org, 
 Derek John Clark <derekjohn.clark@gmail.com>, 
 =?utf-8?q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>, 
 Hans de Goede <hdegoede@redhat.com>, Eileen <eileen@one-netbook.com>
In-Reply-To: <20250426172955.13957-1-lkml@antheas.dev>
References: <20250426172955.13957-1-lkml@antheas.dev>
Subject: Re: [PATCH v1 0/2] platform/x86: oxpec: Add support for OneXPlayer
 G1 Intel/AMD
Message-Id: <174645313180.23202.8023391383676730384.b4-ty@linux.intel.com>
Date: Mon, 05 May 2025 16:52:11 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sat, 26 Apr 2025 19:29:53 +0200, Antheas Kapenekakis wrote:

> The OneXPlayer G1 is a new clamshell factor model by OneXPlayer. The
> special quirk on this one is that there is an additional bit on the turbo
> button register we should not touch, so the first patch converts the turbo
> function to apply a mask instead.
> 
> Antheas Kapenekakis (2):
>   platform/x86: oxpec: Make turbo val apply a bitmask
>   platform/x86: oxpec: Add support for the OneXPlayer G1
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: oxpec: Make turbo val apply a bitmask
      commit: 7b81040f02d59156ba440ac837535901b89fc254
[2/2] platform/x86: oxpec: Add support for the OneXPlayer G1
      commit: e0fede5ff489be3ae30df7f0e0fda5395e364b34

--
 i.

