Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E6A14B086;
	Wed,  2 Jul 2025 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464378; cv=pass; b=dBJztGQDbk7Y+ljhEcYM6+5MGf1qN34p7DHRvOuZNSpruAhLAtuHvRnvk5YCMjQiL+iIqFOS7w1OzkfD4ckXF1U0A2yE9bYS1noj3uID8FWeevNGadSPnog8uGrv6wysCEucCJ9tQMRydaeWgNP1uSl90xoPp+dAo+6QNC4+5jE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464378; c=relaxed/simple;
	bh=WWdH9Rg7mU10Jv5ogO33/OWhvr6bytpFbwhDBwLFXSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NXxmyMZPwbROPj9ttOwkJYMcjj2AAM6Z/A7CzeWPkRoi81D/Z+BgsePRHLqrXUUeu5ZdooguAd43Uc3uVtm3cz5CY1wu/YJGqVDq/RGwbyd/C9fbOSLyLMxed6uUrMH6oVpgDWPeeg5GevXXc/OOBbymbm3rT1DvX06O/PLMI8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=usama.anjum@collabora.com header.b=IHSgeDF1; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=usama.anjum@collabora.com header.b="IHSgeDF1"
ARC-Seal: i=1; a=rsa-sha256; t=1751464354; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=COZR+/xkzqEj1RABaicuY/8T1zPmqotCQzMCaKFLGravjvW0y1DoA+f13S2RRSI88LjKHGzhDmf7gNSjgUwUNnAiHah5U6IeG2XAl0gwypkDeNed8ulY3p8HdYq2gXTZIXLC1BkgELblQXYMtSLdg8EZWxhTN74Vm57YXiVxz10=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751464354; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WLop5YRYnvk33yfjiMinSUU35LkJkYkPTMm6xoYpTH8=; 
	b=hzbJra6e/ITbMa4/vW9G46syohTHyLepEZQhDQpVPWLetntW2wXLtfikySwUL+PoiVRJ8trEtlTRpaOSL8Dl/l7yg9uiNIGaHPm5sVulNLG4w1n752M5X6ds1CMHL6+wNqO0ublRIVInGGtdlRxBYeZ/BtXKOEEAWUKtIkPvSmM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751464354;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WLop5YRYnvk33yfjiMinSUU35LkJkYkPTMm6xoYpTH8=;
	b=IHSgeDF153RnX53qjHTW6p/HUKgisTXQY09YQPRA6suBtQwJFIkoAkhd5ryO63sR
	qF5jyjQUbDheEcitvEq+YwOlmaOdZidMSqy1aZWqqePLl+kWpJCJpj95v4Xda7D7af4
	Ql5O5hGBIdoQutH+t966LOxKp0dp769j4wrvNkeE=
Received: by mx.zohomail.com with SMTPS id 1751464351413899.9669762890401;
	Wed, 2 Jul 2025 06:52:31 -0700 (PDT)
Message-ID: <063b278a-ab6b-4c10-9ecf-f4ad7dbc8c14@collabora.com>
Date: Wed, 2 Jul 2025 18:52:28 +0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: pagemap_scan ioctl: add PFN ZERO test cases
To: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: kernel@collabora.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250630102443.137809-1-usama.anjum@collabora.com>
 <20027e0c-f43b-4d10-a4d6-41dcc38145bd@redhat.com>
 <6846faf7-20b5-4f08-a8f0-9946f993b0e9@collabora.com>
 <f474ef7b-71f3-4169-ba30-74f4afbaeee6@redhat.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <f474ef7b-71f3-4169-ba30-74f4afbaeee6@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

...
>>>
>>>> +
>>>> +    free(mem);
>>>
>>>
>>> Shouldn't this be an munmap() ?
>> free() is being used to free memory allocated by memalign().
> 
> Oh, I missed that detail.
> 
> I'm afraid memalign+free that might not be what you want: there is no guarantee that what you are getting hasn't been used before and is not already filled with other pages?
I'm not sure I've been using memalign() to allocate aligned memory and
the using madvise().

I'll switch up to mmap() for this test. I'll send v2.

> 

