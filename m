Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB5426A08D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750863451; cv=none; b=kiU+dM0ekG2l2RUJ6G66X7yrc3oNrJH5m6g7AijixuUyClld+IozBSJlS6IhKSZXOe8vij3MHDXezR8Dan+Qf6lTzgLSSJWTawUaHR7xgCyPa5bkcPicD/W1pQYhcAKQIov26sNfIeebjmF4GbuOn5Gd12VpmkjmRbr+a+q8Pw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750863451; c=relaxed/simple;
	bh=6iSzehWoTHVyeQxesBFCxQRrKMbrXfVuUiuOpiJ4JEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h0p+/cHy8UPVj6WNXKsf/L3dk+xGu4bozcnNHsQCqNl6zpO3U4XeqPD94piNd2FtPOPQx1eRSQaGmDbvTx8eZqCEg2Wx/1ryGIoTNaM9QgoTztcvquhdQOUdEqkOGolgSpwqHBKX9AbXjcAUSZStuWaz5CcuWbU983fwDqwUOw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dA58910S; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dA58910S"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4537deebb01so12116495e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750863447; x=1751468247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LSi90OIRx8GZ4oJfR5Vxf1riNSe655/76/rDu/OIIZA=;
        b=dA58910Sc/o/6u3p3lFJhi9aIkpqzgr0zbKBDMh+8T3yP++tcxuR78ou+6Y3AUKExd
         D/sOjXYhJyG0pHT8ZkCMHtc3CXqn8cjATzYXW5oDlZLSBgaomdS0rCTNR7rZBwpgXfVh
         Gc8ArYrFOJg4smZ1buft5oS4AWelFLm+3PpBJaYrDzPERsGo63QY/DlRstPYVt2p8gip
         +hrr4n4+2+OOGopHyrWgj1unT0nWkJLSZFJgFT6TxG0OK4sJd7J8TEVp9d4Lg+rDDj1J
         QnYyd9azMoKyT0VOg6Th6zsrLMGeznh6UiH8TZsKsIc3gZhUVbYIPYSqWub77ZUcRdvI
         jAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750863447; x=1751468247;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSi90OIRx8GZ4oJfR5Vxf1riNSe655/76/rDu/OIIZA=;
        b=ETWVNX6vpV29hX4aHq676vuJDfkDBqC4QJrdnfDAwVFcPgXzzzFQ+kCY72q21opFj1
         6ix2RrCJB4zPvZFku73B9xGZuTwxXR3dIA9ezFxSlrF8B4W+4XfS1EXZCMdQOFHiF6vy
         WhLkkusS/oIC7WmlIkoWaA58MTkLVDrEawRBo6WFHYAgwahNlCLdYeFIgq345GNPuctZ
         X2b7OhH7ag+LbBhzL5IbPgBnxK09sGnP+G/ZM2SQYR9wpFHzu4bRyIfa8zocmn3LrpYX
         Bxuze400rfnWaha4lFC1S156fnEWXS4ZaayAM/dlqVAeiuIzVngGLy4PppEC4gskI7g1
         uDtg==
X-Gm-Message-State: AOJu0Yx8UsCK7Q5hIeyIskVcBVGJ9yL32RD1wFKiAqYVFRj5OoUz/7EL
	hqMO3gFSb/91J/f2/CWBPuHHrMyw4QEBD30B92OGymLpFFPLSVJnm855WNPJ+f6NHMI=
X-Gm-Gg: ASbGnctItHxlWsox/llL2XiXwgKXCowKZ1TE+5TlAb2JfCzhkFNySNbxNavoEiL57p0
	rNQ2XOw8jpFbRWqU/d+4BRxxTXpA8+d9pl4CH3hiF7p5E7XHtB8kgqwH2R40iMaUKJfAVR7GSIL
	gOaP32yWpcJS8W48i4rK0Q8CPfp7cjPoeZ2Z1EP1UC2VgHDaJsgkC/0cOgKiA5bsqZgmVse5hzJ
	LxRN3d6Uc9N5PUrgu7+FSqSVvUr9Jrz9+ZCP6j2okvP7JliVBHjuej4vuZ1LVklBhTvyLClRNuR
	/ZD4OnqVA81gKtzw/MS10OEzodeVGE/CwSNeITMvw5PIH8138LsELkFPk1udYM5/mqRo/lhwxJc
	x
X-Google-Smtp-Source: AGHT+IF4cN+cvVz7u4r/wbfdCLEbIdMuvkJLi/cxJbKmyFzQOksWFSFIcelmvAiiPaA4gq9HbjH5lA==
X-Received: by 2002:a05:600c:4686:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-45381b132e7mr31382335e9.23.1750863447287;
        Wed, 25 Jun 2025 07:57:27 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538235600csm22448775e9.20.2025.06.25.07.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:57:27 -0700 (PDT)
Message-ID: <7d96064c-1198-4de6-b0b6-1107a9ef229a@suse.com>
Date: Wed, 25 Jun 2025 17:57:25 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/22] x86/mce/amd: Remove return value for
 mce_threshold_{create,remove}_device()
To: Yazen Ghannam <yazen.ghannam@amd.com>, x86@kernel.org,
 Tony Luck <tony.luck@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
 Smita.KoralahalliChannabasappa@amd.com, Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
 linux-acpi@vger.kernel.org
References: <20250624-wip-mca-updates-v4-0-236dd74f645f@amd.com>
 <20250624-wip-mca-updates-v4-6-236dd74f645f@amd.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20250624-wip-mca-updates-v4-6-236dd74f645f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/24/25 17:16, Yazen Ghannam wrote:
> The return values are not checked, so set return type to 'void'.
> 
> Also, move function declarations to internal.h, since these functions are
> only used within the MCE subsystem.
> 
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>


Realistically the only case when this code can fail is if the machine is 
tight on memory and a cpu is brought on. So the wider question is should 
such a situation fail the hotplug event? Likely something else in the 
chain would have failed up earlier, so I guess the answer is no.

In any case LGTM:

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
