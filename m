Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EC42749C0
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222044; cv=none; b=Y3XxTilIgrOOnGjffZ8Bi3gH+tbWOyUEuEdb3rdej0cR5RpyeFeHxd5bcuZ2fcDBC2aAOTRYVtHhsHLYlJYeygonAzaZlhNMGdJCqWBOXE7Lbcc2MTE8Hl4U3/r9Unpdy1fYbELKzbjflsEhk46XUBj9r3RC5to+/qmhxdXA51w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222044; c=relaxed/simple;
	bh=af/G9WTfMF23Jy4En+6bEXKIOPkb9aB3nfmPTx6hg7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hj873j367gv8QHfBXRQhRT9FbWryWf4POOa5bTdXbs5tQiNTLEh1splhsZ/oRvSIACLA4KW/fmU3qBJU/x5QORmKIvadbXqFlEsyHMs+0wsHMBhj4GmirQPLzFyyNLihFeVzPgKD/f4T0j2FKJiutraW5TO7qy2QTr/o1cm13+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fg6kBvOf; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fg6kBvOf"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5fbed53b421so10749898a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 04:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747222040; x=1747826840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sZDaDYhFbMcyrsLhuZ6zLqO4Xp55KCZvGoT+6gmy9YU=;
        b=fg6kBvOfadLWQDVSy9KTR1mS58el9Z/A0+K5KnVIIuHCAQYtJ8gKowsqBadhzyysr3
         AQL8+e7GtYMj5c47gXPgOyWuweYmIFxM9q5Z4xHPR42aS4VikntMh4cobzAqhb2FqzQu
         De7qBmXVASH6KjvmoRKmub72eTCDQ2vK67KosTEFH4ygTIorgj3cf8xmXIxJ0bYD6IDz
         0T4vnboOnaZiESNFQkQOPUSYVkOnqVtr4Fjl0XSajFjcCYxbFdzYeZUGxxOiP0n8Gw4i
         b5Gbz7wCrGrBLJ0YDMeMVoUZ0vY5bboK6PcZVgHUd9HIqHFwiFbn8CngGwhy/qeSEv8U
         qsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747222040; x=1747826840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZDaDYhFbMcyrsLhuZ6zLqO4Xp55KCZvGoT+6gmy9YU=;
        b=d4ktHaZSaN2UAOZxQwp9ak59oO1FZ2OhkHwE0bkbTWpb/33z9ZycKPLQ6DH9InifDH
         gqlODitAUV4leentXB8jI/XMNJrhhOmCRyifLCGj9cPW3aOyyuS3JTVSOrpGVGQpZ9R0
         pqatHO2BGMpe8h93/0dMEbsdLL4OC0yoNl+oqJ8V5lmlMKb0vUwlVAFQfZp5h2M3xXBQ
         Mvi53aRSOyHkeqnnVOSkNr9uB4x/ERlEqHqmIq/UXxLgpSfl6VO3qrCFmOXZvWpCpgtS
         8hDQ4CjxE4aX3p3Y34+8HEluZExXRkmw/MNN/bUBvsNh7NR7Bj9RDVBjkLUxEt6W5544
         7OCg==
X-Forwarded-Encrypted: i=1; AJvYcCUmmD+XnDqT4wYVyQjzjetFJj0IukGN+4WgAmKYpTVCBrxo0A86CUPmtmLSBMo90c+aoJ9i31v+qMj6arE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWdBiWn6MYLbwUDDuPQbfLhOVLb6NgpaoFVriVbXsn8uMu3Xv4
	mk760vwKvE0+bTMXCuyXmsMNMHkHsfgmBEf0aYX5n9nFS8CaWP4lTSMei3PTMXU=
X-Gm-Gg: ASbGnctF/X8me52B/4JmNts7SIhtJE/3jg5rxkO1nlj1ztuqoQeg9af6nK3ldE1JFS1
	v91oZ2Yy2nHtLwood4/2aL+yyO8mi/NXAbFJRC2VU0v4j8aNAI2o4njAEWRDnMkNBtXQ0bLWDYa
	sSwRTPXtTw1SI3C8S7cQ50aA4/q8oE/ZsJvpfjXEtOlKVUkkLBuyqFQrcQeGa770M4iOcfyFMow
	vk6u4QQI+PyjzJdbdYeUN1Agq6HTho9ZW7s1T4WPzY6pVpAVv1Jl87do5uPqB/22MdlEKsBq9P2
	RjWn2opAnA+BkIFveyUAIYY6ZddpbHj2jL4YXDA+mqzF+oXRPLiwUvV/8A4I8p+yk6WUkSMD1kd
	Ye5f9WH8sFX6BjI8IRg==
X-Google-Smtp-Source: AGHT+IEpsaX/cnJ6LSldGoemMCtF84xxBm+4NqJ/vWTxQbM4bwutDqFNHPwbHB9wTn9MjFgZGoVwmQ==
X-Received: by 2002:a17:907:2d21:b0:ad2:4817:6375 with SMTP id a640c23a62f3a-ad4f712a12fmr326543666b.15.1747222040313;
        Wed, 14 May 2025 04:27:20 -0700 (PDT)
Received: from ?IPV6:2001:a61:133d:b101:9ea2:16fa:3380:8e40? ([2001:a61:133d:b101:9ea2:16fa:3380:8e40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8508sm912627166b.9.2025.05.14.04.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 04:27:19 -0700 (PDT)
Message-ID: <29cc1ccb-4922-43fe-8d63-bc8333cc6049@suse.com>
Date: Wed, 14 May 2025 13:27:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
To: Alan Stern <stern@rowland.harvard.edu>, David Wang <00107082@163.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, oneukum@suse.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250512150724.4560-1-00107082@163.com>
 <20250513113817.11962-1-00107082@163.com>
 <8c963ad0-a38f-4627-be11-80ccb669d006@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <8c963ad0-a38f-4627-be11-80ccb669d006@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.05.25 16:25, Alan Stern wrote:
  
> Instead of having an URB keep ownership of its extra memory after it
> completes, xhci-hcd can put the memory area onto a free list.  Then
> memory areas on the free list can be reused with almost no overhead when
> URBs are enqueued later on.

The number of URBs in flight is basically unlimited.
When would you shrink the number of cached privates?
That would seem to be the basic question if you do
not link this with URBs.

	Regards
		Oliver

