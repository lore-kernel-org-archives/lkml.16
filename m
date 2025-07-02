Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10092F5095
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751477943; cv=none; b=n2eB5jQ621ru57JhLr0ifpNhl2Qm4RiGp3BI1FUUEOGA9eoOlVREuWssPJk/6+sJhMptRq1wRRjfzARGsk9JW9etZ56Cqtbsw8rUBrhp0NttQlHir39Qjw+6yvyCxubwomkKu/Ujbaa8aA0UgRW2bDaTb/QAO4vkzAmiRQ0/CFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751477943; c=relaxed/simple;
	bh=PR5n+2aQcD9TCkCHsh6GGkhAHVo6Tzk+C893LlE59JU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ldIEckJzGYrKz6Cl65Umkxv5QT7qpnnb2S+8BHup43f0vKNe09kd9faVOvt95RI+xabeXxIamBEZcTGW5Ouizsye3p8JtafXgu4rt2EFYm1HjwydczGAt0QAUlnWnJ/aq/1NNhOf79hdTudRigkJ7MVXHRqpE1X5fkhhmWp2mOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rrh1pLch; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rrh1pLch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751477940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t5kc7QGkeiDNyd1vpvu2YlBzltMT97zD9Hu2apFeViM=;
	b=Rrh1pLchY2/QZ8tovuh20noI9lm2yGKgXz0n3uXo4SEFFMQjeSVnPbB6kCjKu2YRwc5MVR
	f7U5pn4e90YfBDGeIshf86601LLzvaMxjMrXHx10hSZsJCe7nv2F2taCMVwJjhpZMqyv4b
	kphaTgnQgyWx/LEEzntSosgpxEn+4n8=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-YkbrSJ_XObezkLbNJwRkCQ-1; Wed, 02 Jul 2025 13:38:59 -0400
X-MC-Unique: YkbrSJ_XObezkLbNJwRkCQ-1
X-Mimecast-MFC-AGG-ID: YkbrSJ_XObezkLbNJwRkCQ_1751477938
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-73838f64415so4870218a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751477938; x=1752082738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t5kc7QGkeiDNyd1vpvu2YlBzltMT97zD9Hu2apFeViM=;
        b=oOuelD4+eVXDE6xuoQRwBk3LrMoDDjgw7W717nwfJMJ7QCJC9gEvusJQiWy1OcRh0K
         CgVhXPYDPCqwGDZ7a+SF3tbH4HVNj7r1uVr7WNN0xlz8LqvVgiCk7cVthDPNCxjeK3dP
         Rr/akYkmE7+xaPXgmElYAzD3D9B553ZFtfbHr/yix3Jdgf1gbLh92bMJ3gii68Gi3l8g
         9AGY8DghCw/v5UGON65/ydLq+LbQqYFL6LDMgRFPW1qfI5mBjzMHTc06/o1vTzpwtf1g
         yUMKH8USDmQyucxOIS9+JltxnpbENYl4PvQ+/eKkT/exKXovbS0TgIYO+CniZQDWZBgT
         PnDw==
X-Forwarded-Encrypted: i=1; AJvYcCWcs+n9Q9VZbHYyEG/muSURce8LhJ8eVQAYUiJjchciqoDnykFPB500Vno+zAiksn65j7Ts/qLUvt+rc3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2i6K4afCjaBHQUISAuJRru0BW6XOHtIVKYux/wP5G0GaFoMSZ
	49Lz+cy+3a0APlbdsUCs7W/qiGRsfwbC6y3HmGn0M5QKopE01buV54/vzrC3M1fJIXB/qhwNkiM
	hu/GlgWO6900MXkGgdOVeeI5rFqwScM0LWs5MKgyKQIVAOTNOdtalrWVxGkvB+wDgdA==
X-Gm-Gg: ASbGncvVCszMauNsA15T1HeTMDoYnX3NkGrPhz9UKSa0Hcq+6RYbdncaqjPHlDRC/gZ
	jt+tzPLdRR3SoFY4sWG/VPE6k3XnIx+zivVZHu24GW6QW6sgRcZZ/kUbUXX3V/MmJloMdkn36V+
	Bb/vVZLXyQZ9iUKQWb2bO1HKFKi+2bVFr+74DpeEKYu2tVze+e1nJcxu1tWsbIyB+ZI7OsXw7Zy
	364CFwDwaHvlYhPpaYXkaaOMSVfSb3XpZjgNgRdECVUcIs5j9vM5bCelDmrUzmBbhxMPkaAH6vf
	hRlYDyhRx+BZt/zLmjD0/YdA
X-Received: by 2002:a05:6808:1a17:b0:40b:4436:46b6 with SMTP id 5614622812f47-40b8911280cmr2880856b6e.37.1751477938263;
        Wed, 02 Jul 2025 10:38:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdmoKE0spR7/KmpsUBXOZZSNIqASQZlCpgekGVNMtn3ZdZbAeHx4Uw+Ze21QoFB0abDOfubQ==
X-Received: by 2002:a05:6808:1a17:b0:40b:4436:46b6 with SMTP id 5614622812f47-40b8911280cmr2880834b6e.37.1751477937870;
        Wed, 02 Jul 2025 10:38:57 -0700 (PDT)
Received: from [192.168.2.110] ([69.156.206.24])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b3241f829sm2629594b6e.35.2025.07.02.10.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 10:38:57 -0700 (PDT)
Message-ID: <3c0eb35d-86e2-45ea-b933-32989c28963a@redhat.com>
Date: Wed, 2 Jul 2025 13:38:45 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] proc: kpagecount: use snapshot_page()
To: Shivank Garg <shivankg@amd.com>, david@redhat.com, willy@infradead.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, lcapitulino@gmail.com
References: <cover.1750961812.git.luizcap@redhat.com>
 <5e94d287b6174098938ddd9959cf3c0619fb610a.1750961812.git.luizcap@redhat.com>
 <3ee3adfc-5efc-43dd-9c75-23564fade7b3@amd.com>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <3ee3adfc-5efc-43dd-9c75-23564fade7b3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-02 02:25, Shivank Garg wrote:
> 
> 
> On 6/26/2025 11:46 PM, Luiz Capitulino wrote:
>> Currently, the call to folio_precise_page_mapcount() from kpage_read()
>> can race with a folio split. When the race happens we trigger a
>> VM_BUG_ON_FOLIO() in folio_entire_mapcount() (see splat below).
>>
>> This commit fixes this race by using snapshot_page() so that we
>> retreive the folio mapcount using a folio snapshot.
> 
> s/retreive/retrieve/
> checkpatch.pl would have flagged this.

Thanks for pointing this out. I do run checkpatch.pl before sending patches,
I don't know how I missed this.

> 
> Rest looks good to me.
> 
> Thanks,
> Shivank
> 

