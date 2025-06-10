Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EA2280327
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549202; cv=none; b=B3OTmz7L/tztFZ1PdqbKMRw31FA5MJzPNR1TEoxJF+JysZhjdmvZTkF+10hWvImv2b0lOzHuPhRprhzdidpJ0kQXZ0c7CBHduOORccXJLNch6agyOrP62tm1P+SsjoyClRGl5WW9IpjB9cDfCdNjd08CrblbvPaPKOAaZlDkAUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549202; c=relaxed/simple;
	bh=lf/Q0CP0+3JGF8skn4vJN8mCuS9rEjV0RqPQBwzodGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQmyathWlMhDpmkZptI1Na68YGzMUQq8guZc08ONB5U1FJY5bjd39EJx2WEsCy6FyQyXbe++rti46bMsOgQuuLiiMWzHvbrRJnG9qXYwYKPwA6reTnboNOtEgGgOOfIjohbEMtLPVnZ+vOmwZ0prPW/kYY74zq/hHTuMozvvrvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Pkud2SEv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Pkud2SEv"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so65889585e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749549198; x=1750153998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9IEkGDFBIs7IrBtufGEQ1UvIq45B77cgWp5iZKKgIpk=;
        b=Pkud2SEv4d5Zd8qEFxIsJJyS650FzgonHEnjoeteyOCLnwMNXSRVlxKjWX785MUMpd
         ISwCy07c2Xyt+xs2SKBEEBUXnSVsPFYI7QMzwMvP1hoDyWgDIDTSTXsgvj2vHiKkzleE
         6NYiFsKvp8XmTcSDh8RII1yggx0PS0yJ9tSlfOI1dmHE6UhO7VCYQ5yB72CJZZmQ/BFx
         dwi7ZZOtTRTNU5P8XdKAXRDPJvJEb8vnlPmLoTvj2TXv07o2BA+i/q1VQ2fvYVid3loJ
         exsJETJ1B+e6wctTjXtPfHGUv6Gm9NiTOe97p8WaLIBFxBvaGaQgABKn+nRHz71tgGdf
         N2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549198; x=1750153998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IEkGDFBIs7IrBtufGEQ1UvIq45B77cgWp5iZKKgIpk=;
        b=t7iJZWKZBIzu6WBr/onqW7Wf4P6+HrK/k4Z/XEY+uLgoaTOsV4HPvk5Is44e5rdTu/
         PDDqmJHBDM79YvltfEpGlBeOlmB5dq3BdmOAGUYTy9tiJdBGdt+/AWfp3imS71wc6HgP
         37JOhseyDTqSR0oA6qH2QF+rOX2+4GoeN7l2gUTg3hyuDfVRLp3QUY4DsUQWKC22/bOF
         mzGhMxtPuI04k3dt7aoS67rJdcHqFgAaBtQ+ctkAujibtGvC/0RSX34bDRyiKl6cCJvk
         HQxPFvp0T5A2P69hZDg2YXsCffgYXCAAhPzNKv++NI6gri2oM4iHylXSWmHd9xr2zrJB
         r46A==
X-Forwarded-Encrypted: i=1; AJvYcCV6zNw7nKtKbl4Mu0TP1xWOqfjZT0fQ8akbp4zBY12sYqw/DxjGxckDZ1cJmwV+1N9RL5HVUrx/615VN28=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt6Ku4cLIU81WzgG0FgISr5WFCe25To0v6lkzb9aXhKcn22E5f
	z6c9tdud5nneWc1nEtpBfE3er5GBBz93AP28UywbzC0iCMqcjp91keEPALIgDkxbgnk=
X-Gm-Gg: ASbGncuzamMYywvto5xrShirJWxA+MuWuWrZAAG4EdaIuZH359BueomjRVGOnfyCQvy
	PJA93UjUCc8DAh/8ugb6Yigs9mPBYXA5/fXySZGUlkTb4keJUsy3kKmnQjGlq9GUL3dmopXtwk3
	NUrwjEo/M0oXdSB7XKqY+wNWwfc15fTZNsqDlGi4pBYcNlfPhVOPGH5l173JltblPs6qFN4G0W3
	grRLBj618PBifziVe8/lnAJ2yp6M2yj2gyDKyLVeQCW9Jfh85raGL87+eZiiirW3+8E8f9AdWU8
	jcs8Z5yTGjrj63Gk4l6SFPYPbQFhe1tuhNpHsawpNAINkOv0MMjWwtbJWUzwLI/tMnJBiCF+mGe
	AbHOKJRFdqopHl14cVblxdrB6Whyr
X-Google-Smtp-Source: AGHT+IF43HoF+ckI+JNZf8sM8mBLEsIZIzrQldZAYBnhq+ZWk+6w2oq6oTjq3frqJQUO14CjjL46AQ==
X-Received: by 2002:a05:6000:40c7:b0:3a4:f430:2547 with SMTP id ffacd0b85a97d-3a55226cd6amr1466032f8f.6.1749549197729;
        Tue, 10 Jun 2025 02:53:17 -0700 (PDT)
Received: from ?IPV6:2001:a61:1316:3301:be75:b4b4:7520:e2e4? ([2001:a61:1316:3301:be75:b4b4:7520:e2e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532131df6sm11612214f8f.0.2025.06.10.02.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 02:53:17 -0700 (PDT)
Message-ID: <dc4e3500-b5fb-4aa1-b74c-c37708146c3c@suse.com>
Date: Tue, 10 Jun 2025 11:53:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usb: Convert tasklet API to new bottom half
 workqueue mechanism
To: "Miao, Jun" <jun.miao@intel.com>, Subbaraya Sundeep <sbhatta@marvell.com>
Cc: "oneukum@suse.com" <oneukum@suse.com>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250609072610.2024729-1-jun.miao@intel.com>
 <aEajxQxP_aWhqHHB@82bae11342dd>
 <PH7PR11MB84552A6D3723B68D5B83E4BE9A6BA@PH7PR11MB8455.namprd11.prod.outlook.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <PH7PR11MB84552A6D3723B68D5B83E4BE9A6BA@PH7PR11MB8455.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.06.25 11:53, Miao, Jun wrote:

>> You can change it to GFP_KERNEL since this is not atomic context now.
>>
> 
> Thanks,  the usbnet_bh() function only be called by usbnet_bh_workqueue which is sleepable.

Yes, but it can be waited on in usbnet_stop(), which in turn can
be called for a device reset. Hence this must be GFP_NOIO, not
GFP_KERNEL.

	Regards
		Oliver

