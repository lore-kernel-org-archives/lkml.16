Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0348F49
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743157706; cv=none; b=A0+R8EdekjZKsHxuQKU/vXbWIDyoWfpVCN5sKuziPhwbIzSvmJUAJBQHbov2hVRO9qjmGUFfMxUNZ+Apcwyz57hF7djpxifyUf3Wm3EJc3zzBpUIfXesmMdi5ox0ppUen78DKF8fsenmAWMvN1iMTcVhpQfiuCgMKRGDN9x5Xqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743157706; c=relaxed/simple;
	bh=sZMiKU7x0+BMowQV4/xzw/6SsxoIkXIT8nD81qFL2wA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lLL7ZTgMT1kP4YPinB4alizEiOKa0J1ERHVfvb3Wcvy9j+bUKbFTaYu6blLloD3aSgRRTr91OGDDuFgYBZVmQPbT89/GdZjgRhvcFOObrrqBaxF+Meu9G1NZzqYXMguEq1t357A/+zCI0a4OqAzptLKPxII8C8T7bgH5bx+qmfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XuaJDFtu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XuaJDFtu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743157704; x=1774693704;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=sZMiKU7x0+BMowQV4/xzw/6SsxoIkXIT8nD81qFL2wA=;
  b=XuaJDFtu4PrM76Zcw2cqWnQuhoURZOzS/F7qkoujGMTYTBV27HcYslz1
   XRPnMltwb6h/z27Q2ED3ocnBHZGbhbo+5bkr878Fg3URRWujrKLRy614C
   sIBGir1e7RAVJGmbI4ipMy3aC7VeOClIb9CIKeGD4ByugmuhvL7ci6SxX
   qR8bcISbOSm1rmA31pEgxoOqRHLKvFEsuJ7lg8MmqP9ubxYlnKHGWu5C6
   dwNPj05KHJr9ssa7tkR7cvLRBUPDUgXg/mF2DMvuNLXHH+895ldW4GPbR
   pXxhtKEcXQ4OlWSDbR7jgPWZOCbxExPFEla+QxoHsXFy6d7Z4OzyF59IH
   A==;
X-CSE-ConnectionGUID: Xc3eySTBQbaBsyw/8OkHJw==
X-CSE-MsgGUID: SCvaAHhfS4Ok6Bf6bWXAFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44678476"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44678476"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 03:28:23 -0700
X-CSE-ConnectionGUID: Etlj5KfoQP2lLuGcQbJpiA==
X-CSE-MsgGUID: Qk1KpXzQSJiRPoEvUyFHFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="126331990"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost) ([10.245.246.94])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 03:28:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yongbang Shi <shiyongbang@huawei.com>, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com
Cc: liangjian010@huawei.com, chenjianmin@huawei.com, lidongming5@huawei.com,
 libaihan@huawei.com, shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 shiyongbang@huawei.com
Subject: Re: [PATCH v7 drm-dp 5/9] drm/hisilicon/hibmc: Getting connector
 info and EDID by using AUX channel
In-Reply-To: <51bae617-cfc7-43f9-968e-5f2a3ad9af40@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250319032435.1119469-1-shiyongbang@huawei.com>
 <20250319032435.1119469-6-shiyongbang@huawei.com>
 <87frj8c9ol.fsf@intel.com>
 <ff11c8ac-7eb4-42cb-86d3-ad9924c9374b@huawei.com>
 <87jz8ea6zq.fsf@intel.com>
 <8ee961ca-0d3c-487d-a672-82714ee56743@huawei.com>
 <875xjw87dm.fsf@intel.com>
 <a8599ca0-9a50-453e-8986-f8fae5aa9160@huawei.com>
 <87v7ru6bfk.fsf@intel.com>
 <51bae617-cfc7-43f9-968e-5f2a3ad9af40@huawei.com>
Date: Fri, 28 Mar 2025 12:28:14 +0200
Message-ID: <87pli14fgh.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 28 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>> On Thu, 27 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>> =E5=9C=A8 2025/3/26 17:32, Jani Nikula =E5=86=99=E9=81=93:
>>>> On Tue, 25 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>>>>> On Mon, 24 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>>>>>>> On Wed, 19 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>>>>>>>> From: Baihan Li <libaihan@huawei.com>
>>>>>>>>>
>>>>>>>>> Add registering drm_aux and use it to get connector edid with drm
>>>>>>>>> functions. Add ddc channel in connector initialization to put drm=
_aux
>>>>>>>>> in drm_connector.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>>>>>>>>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>>> ---
>>>>>>>>> ChangeLog:
>>>>>>>>> v6 -> v7:
>>>>>>>>>       - add if statement about drm aux in hibmc_dp_connector_get_=
modes(), suggested by Jani Nikula
>>>>>>>> I don't understand this, and I did not suggest such a thing.
>>>>>>>>
>>>>>>>> BR,
>>>>>>>> Jani.
>>>>>>>>
>>>>>>> Hi Jani,
>>>>>>>
>>>>>>> Is the modification of v8 correct?
>>>>>> I never received that for whatever reason.
>>>>> Here's the link: https://lore.kernel.org/all/20250320101455.2538835-1=
-shiyongbang@huawei.com/
>>>> Thanks.
>>>>
>>>> The EDID handling looks fine.
>>>>
>>>> AFAICT you leak dp->aux.name though.
>>>>
>>>>
>>>> BR,
>>>> Jani.
>>> Thanks for for reminding me, actually the dp->aux.name was written beca=
use I misunderstood what you meant in V7,
>>> and I deleted it in V8.
>> This is in the link you posted:
>>
>> +	dp->aux.name =3D kasprintf(GFP_KERNEL, "HIBMC DRM dp aux");
>>
> Hi Jani,
>
> I got it. I think I can change it to devm_kasprintf() in next bug fix pat=
ch, is that ok?

Maybe. I don't have the time to look into hibmc details.

BR,
Jani.


>
>
>>
>>> Thanks,
>>> Baihan.
>>>
>>>>

--=20
Jani Nikula, Intel
