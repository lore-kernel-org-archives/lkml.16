Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F0C2397B9;
	Mon, 10 Feb 2025 14:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199435; cv=none; b=pymYC1SLPb0zZ/OzA/75kCETjEAkUa6VK6yrvMe7Jaf/0be6i7zOHgZXaoJOKWMbwauRh7aVOSTsnvnCgvzbZExwA2fYaElSo9ToWe0JdzJpvscK2fahZe4k3h1a+g8H8VsX38a0vZILzkMB6VaSJDXcLFW/VcBJ/TxqsB9z9Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199435; c=relaxed/simple;
	bh=4ICcj8QdOWU1kXHtu8nmsMNpiM1O67Af20gHNKdHi/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fWU5VDcHeJzZVyyNAXTxTcKhD2O0lZbpl6KpDFMdJ20U17pD1dzHw/CMmhyTr3tA/chOzn5wP+nLQN8G80SbnIy3M5VQwWqD1l6ZFwKOiYBCYGNyHqsNHCAcLOO7B2UuR+iDLy1cyXsiYa3l2EDZD2zR15EhRR4fB+fAWx1F9N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTSh+rMO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTSh+rMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739199434; x=1770735434;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=4ICcj8QdOWU1kXHtu8nmsMNpiM1O67Af20gHNKdHi/s=;
  b=XTSh+rMOxRvOA8sdeEZ12wgvLaIO3zFVzvGbbuvZpBFfltGPw29YrFpw
   oQWsd+ht2L7BwWGxeOk58xTZ7jyy8z1rRivpn+5LARINsgsISvs2MB4Pf
   ycMLcNJqR4GDor23p+oQATaE981DPTpXaiLXnBqViTrVjlB/V1dNrUU3l
   uwuzXCvL42FPGLvnefTfq5Mv9FWcSZviX+a9Qm9nl0Q6jrwTH2MSOS8yk
   rRocHPeBFrstILAXBiHJMkpWVrzI9LhWI71YCv6eecflAcNILzW6SEs9U
   5xCb+ATBPHOTSyizT57OrCnsAAr7KN881uWLe4H88xLGV9ScbqpIngI9a
   A==;
X-CSE-ConnectionGUID: LIONdeNYQjSyO6hhUNLwXg==
X-CSE-MsgGUID: 2pt8J8FlQ6yonNGpnwRVug==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="65134915"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="65134915"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 06:57:12 -0800
X-CSE-ConnectionGUID: INQMVpnbSk2zCSi368zCmQ==
X-CSE-MsgGUID: 0YminiqsT+euDpMsEd701w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113089551"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.72])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 06:57:06 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Sybil Isabel Dorsett <sybdorsett@proton.me>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Hans de Goede <hdegoede@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250203163255.5525-1-sybdorsett@proton.me>
References: <20250131203854.6608-1-sybdorsett@proton.me>
 <69e279a3-7fd5-9dc3-680d-7415022dc5e4@linux.intel.com>
 <20250203130232.3481-1-sybdorsett@proton.me>
 <d20f933c-8041-bc8d-13c2-98d89ccfa524@linux.intel.com>
 <cc7c8e94-4340-3d1e-03b4-2f738067d24f@linux.intel.com>
 <20250203163255.5525-1-sybdorsett@proton.me>
Subject: Re: [PATCH v3] platform/x86: thinkpad_acpi: Fix invalid fan speed
 on ThinkPad X120e
Message-Id: <173919942123.8268.13577857743094201898.b4-ty@linux.intel.com>
Date: Mon, 10 Feb 2025 16:57:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 03 Feb 2025 16:33:15 +0000, Sybil Isabel Dorsett wrote:

> On ThinkPad X120e, fan speed is reported in ticks per revolution
> rather than RPM.
> 
> Recalculate the fan speed value reported for ThinkPad X120e
> to RPM based on a 22.5 kHz clock.
> 
> Based on the information on
> https://www.thinkwiki.org/wiki/How_to_control_fan_speed,
> the same problem is highly likely to be relevant to at least Edge11,
> but Edge11 is not addressed in this patch.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: thinkpad_acpi: Fix invalid fan speed on ThinkPad X120e
      commit: 1046cac109225eda0973b898e053aeb3d6c10e1d

--
 i.

