Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CA920D4FF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743069612; cv=none; b=VhuHiKfloUOPGoX8o1VExt3vPtuYU7Mk4CJ/aVcmsyHFFNZzZYKNnAlYeqjKMgwQLOwMU5orbWkWSE+MDXgEBLHlScp1XykkQ2XEYxEgcxWGKIc7Mwt5QVGP83bEIWLkRU/gmfVYYHjqLWNQFyMkAlvgp83uXeO3x5/pdQT2s3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743069612; c=relaxed/simple;
	bh=cBmITgd0BnhOeJU68NrtesNuKx5saXHzao6d69yJrhE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f5dJucSJkbQDVIfcw3Bh8XYppw4HyvsEv+zE4NeW210FnMs6NS8P6TaRbHJszGv91g0lXsybJ84kHy6Nq3XTmTcjMA2BG1WDj9YSVpUTJh+KqdfZPG1sr2vcaePXtpLw/R/Zomq1DSIS7JR4ShKNc6LOSkv8BiSUCWqG3pBDwD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AY8OS+ON; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AY8OS+ON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743069609; x=1774605609;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=cBmITgd0BnhOeJU68NrtesNuKx5saXHzao6d69yJrhE=;
  b=AY8OS+ONfe4bbnMyNO4y9H6vS4cbiGW/F0r6PFHYlhIdybO49yx9YiQD
   0eMmQ3CBLMl1+acf+KfoK/Lj+pdfuPEy3qrsarM5piZARc4ridevKErvQ
   CxKP4CRPo7OyJYnnO04BEjY3B1uPE0qTjq4jd7nP3b3W/5bJJ+8AVCSf+
   IKFizzw5PUbzmxr8dExzgjGa3MXcHZG+nZ+vJzZW2TsyowevD/0mXaVAf
   kYEIlDu3pDuZmZpjgFP1FV9sMlHH3BGC/fo8Lgt+v8f3hX/mR9X0uW/WZ
   GJ10mCR6E6v+vTqh2qp6fqosa4jLLcbTZLkyuedERjbjuNtDTnNOI28rx
   w==;
X-CSE-ConnectionGUID: rcqWTh49TQGCg02Yl9xcag==
X-CSE-MsgGUID: b5i8KYPKQ+S11tKDyPjGvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44575485"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="44575485"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 03:00:08 -0700
X-CSE-ConnectionGUID: 0W3Bwvf7THuQHSh4MGswKA==
X-CSE-MsgGUID: cIW0X/V2SGi3pbBqoNmE5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="124855876"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.17])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 03:00:02 -0700
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
In-Reply-To: <a8599ca0-9a50-453e-8986-f8fae5aa9160@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250319032435.1119469-1-shiyongbang@huawei.com>
 <20250319032435.1119469-6-shiyongbang@huawei.com>
 <87frj8c9ol.fsf@intel.com>
 <ff11c8ac-7eb4-42cb-86d3-ad9924c9374b@huawei.com>
 <87jz8ea6zq.fsf@intel.com>
 <8ee961ca-0d3c-487d-a672-82714ee56743@huawei.com>
 <875xjw87dm.fsf@intel.com>
 <a8599ca0-9a50-453e-8986-f8fae5aa9160@huawei.com>
Date: Thu, 27 Mar 2025 11:59:59 +0200
Message-ID: <87v7ru6bfk.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
> =E5=9C=A8 2025/3/26 17:32, Jani Nikula =E5=86=99=E9=81=93:
>> On Tue, 25 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>>> On Mon, 24 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>>>>> On Wed, 19 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>>>>>> From: Baihan Li <libaihan@huawei.com>
>>>>>>>
>>>>>>> Add registering drm_aux and use it to get connector edid with drm
>>>>>>> functions. Add ddc channel in connector initialization to put drm_a=
ux
>>>>>>> in drm_connector.
>>>>>>>
>>>>>>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>>>>>>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> ---
>>>>>>> ChangeLog:
>>>>>>> v6 -> v7:
>>>>>>>      - add if statement about drm aux in hibmc_dp_connector_get_mod=
es(), suggested by Jani Nikula
>>>>>> I don't understand this, and I did not suggest such a thing.
>>>>>>
>>>>>> BR,
>>>>>> Jani.
>>>>>>
>>>>> Hi Jani,
>>>>>
>>>>> Is the modification of v8 correct?
>>>> I never received that for whatever reason.
>>> Here's the link: https://lore.kernel.org/all/20250320101455.2538835-1-s=
hiyongbang@huawei.com/
>> Thanks.
>>
>> The EDID handling looks fine.
>>
>> AFAICT you leak dp->aux.name though.
>>
>>
>> BR,
>> Jani.
>
> Thanks for for reminding me, actually the dp->aux.name was written becaus=
e I misunderstood what you meant in V7,
> and I deleted it in V8.

This is in the link you posted:

+	dp->aux.name =3D kasprintf(GFP_KERNEL, "HIBMC DRM dp aux");



>
> Thanks,
> Baihan.
>
>>
>>

--=20
Jani Nikula, Intel
