Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D441E7C02;
	Wed,  2 Apr 2025 07:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743578987; cv=none; b=iGJ6i1/8dakR00cBr95uYWG39Cc6WbXJ+/Pbv5x3D3Y9VQDCq7TQkNePz4gIOQtCx2nAYv2CzKGirY/CgqWuCNf2qFGErqu8lWVgDm30A/E1zvqJ9jCA6Uf04O5mc3aphbHGTD8RrwMuo20dsBx+ez2+V6JFx2ew3zsqclxskiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743578987; c=relaxed/simple;
	bh=usOYs71EVRwET8DRul2z/o7eI2PPzs9KfwwYn5Vohgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s4BmA7wzljAMqIBx2B/X6H4QMau22ORK6fW5lhw8RPFKzThXCtGRIghX5Jdh3S5VoZWYqbjr+hF4cBN74pHcOEsDTyGHyeJeD/aMTqGpbmbP+5oDb5rx/Z80y45XK8cx1ie/0oIrsu2aLYV6TOeynF+pW0G0XPVGnL7SQCuCq5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CPgxWjGe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPgxWjGe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743578985; x=1775114985;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=usOYs71EVRwET8DRul2z/o7eI2PPzs9KfwwYn5Vohgg=;
  b=CPgxWjGeqNLGE85NjeYAwJsfID/UmKiNxyAtOviyQbnZRbP48EBBRteu
   +Xef/+iCwMPPxd6Tf7R0JWpVSOeT3yls5iqQfhZSpYK2NZhIeD0xwPn8O
   /S3uJYBzEsQ3JEEVCFx4CX6X624u/JfLH++pts9VGSxBN4nSHatt6Wd/q
   nOtVQ4NYY+DfusoV6mOB2c5kx6I1TPUISCTaR38Ku/ChMBGkw4x3wrD6O
   5yFZ7PhDkPYgc+VitQWiqQcwKp/RH88dHEumsacHeSRgktE9q93gOZMEN
   xDROMYy+ZZTmokqLx0A3gSrVuA2kD6ZC7mXU8seyEUpTm+zXXfUqAscL6
   Q==;
X-CSE-ConnectionGUID: BiW+96NBSrSDuZAhg+B6eg==
X-CSE-MsgGUID: pot1kmUTQ5qFsR+OGQ6Tvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="70289056"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="70289056"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 00:29:45 -0700
X-CSE-ConnectionGUID: UPVDciK2RB622J31kC/G6Q==
X-CSE-MsgGUID: JxOeqwSqSRO9wzUxvRmQ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="130733562"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa003.fm.intel.com with ESMTP; 02 Apr 2025 00:29:42 -0700
Message-ID: <93950cc2-3b9a-422c-a139-f09dd5ba8d52@intel.com>
Date: Wed, 2 Apr 2025 10:30:52 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH V6] usb:xhci: Add debugfs support for xHCI port
 bandwidth
To: raoxu <raoxu@uniontech.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 wangyuli@uniontech.com, zhanjun@uniontech.com
References: <20250402023047.26719-1-raoxu@uniontech.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@intel.com>
In-Reply-To: <20250402023047.26719-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 2.4.2025 5.30, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> In many projects, you need to obtain the available bandwidth of the
> xhci roothub port. Refer to xhci rev1_2 and use the TRB_GET_BW
> command to obtain it.

We are currently in the middle of the merge window.
I'll try this series out on top of 6.15-rc1 once its released, and
then send it forward if everything works as expected

Thanks
Mathias

