Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0A513C3F2;
	Thu,  8 May 2025 05:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746683333; cv=none; b=Mt3z2ywP+ZaNYT9TXNv29dcINXGAbf0ko3+DOpU7z44e9eMQMxW7JA2Hh7QCLDJPx652GMNMHsZS1hZdvEi4qjThNPV8UiIRG0RV0wbLS6wifn6gB9ouz9vrB8WGd/dTX3aYtYF/uj0q2J0sc4OEJ0YY24S0mCsHe8aGkH1IDRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746683333; c=relaxed/simple;
	bh=WTLxIZISKQ6r/iRWMpniCKmmt76wtZFqrwv2HUarfMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Td/2PaKolYuoKg/FOmxnTxUpljUiGRysuVvb2h2FOBFIsevdPyT0KDxU0km+e99Ru2njpix9HhY8cMpAYPHLvdFfR1A97NRLNNYLVa2SOJH7Lkycs6dmR8aopCHAhZ844OQiTKGnU1qYJUi5T5xzYbUYKiArBKWWo4k1eSI9+54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YqOJ6Iw1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YqOJ6Iw1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746683332; x=1778219332;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WTLxIZISKQ6r/iRWMpniCKmmt76wtZFqrwv2HUarfMo=;
  b=YqOJ6Iw1Ay3bIfkvRbYSwth2SKb6pRlndd04Z1843Q1Y8prkgJXraudD
   kbSJGgO49f2E7DmtGUStYb75pOG2OgczJs6KYGDLINWykt8nUiKSPZ0pj
   VlfpuwA9BLb41cDRKTeW6st/96oI8A4/osN42XbR0E10Xf/5DI5R4zaxm
   6U6a2tfeAgZe65rooOCdmsfRIT1EqJgtEcAhO52epUxxYLxCgufMlfJSw
   FHd//UlI8bDlJg7Sh5SV1UOS6z3gdJopY9UK0oE7nEReziYhgG/KU710X
   DX0uQZkbko41aaOL0j7BOaz8en4J4iL0QCh2rcFUk9nxqAWXneN8waAjI
   A==;
X-CSE-ConnectionGUID: DJiH6/O4QGeLNLH3eodJ0g==
X-CSE-MsgGUID: rFqQbI13RJylGGdOP/SlPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59799870"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="59799870"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 22:48:51 -0700
X-CSE-ConnectionGUID: 7cR3leNdS2quoRx2H/Z67A==
X-CSE-MsgGUID: VM2nM5rmRLqeNp0tkRjgVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="136700143"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.107]) ([10.245.246.107])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 22:48:47 -0700
Message-ID: <71d1f2a1-e2ab-4327-bc6a-ff0aa7dbc19c@linux.intel.com>
Date: Thu, 8 May 2025 08:49:59 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: SOF: Intel: hda: Fix UAF when reloading module
To: Tavian Barnes <tavianator@tavianator.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org
References: <fb47a18bdea9e9f86d6fccf1d881434cda3cd5f0.1746627007.git.tavianator@tavianator.com>
 <40ac692b-2a97-4b4c-a9f5-47601571f6f3@linux.intel.com>
 <CABg4E-moQf62Mm+Dv62yLwQaHfKHcrH54Gud1vj6bn6D7mvKJw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <CABg4E-moQf62Mm+Dv62yLwQaHfKHcrH54Gud1vj6bn6D7mvKJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 07/05/2025 20:06, Tavian Barnes wrote:
>>> -                     hda_mach = snd_soc_acpi_intel_hda_machines;
>>> +                     /* make a copy so we can modify it below */
>>> +                     hda_mach = devm_kmemdup(sdev->dev,
>>> +                                             snd_soc_acpi_intel_hda_machines,
>>> +                                             sizeof(*hda_mach),
>>> +                                             GFP_KERNEL);
>>
>> We need to copy 2x the size as the snd_soc_acpi_intel_hda_machines[] has
>> two entries, the second is the sentinel (all 0).
> 
> Do we?  I recognize that snd_soc_acpi_intel_hda_machines is an array,
> but I don't see anywhere that hda_mach or *mach are used as an array,
> at least in hda.c.
> 
> I'm no expert though, if we need the sentinel I can send a v4.  Thanks
> for the review!

Yes, we need to preserve the sentinel. When dealing with the
snd_soc_acpi_mach all code looks for the sentinel at the end to break
the loops. The size of the arrays are unknown outside where they are
defined.

-- 
Péter

