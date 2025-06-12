Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321AD2288CB
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749720531; cv=none; b=VQrOyCZDwcUnOmFn4td4wZsZJSyS1okyofh/6mUyJuhgtJYpKFPLeE2pehUB0lcGQcbl/J+Uf3KXzDvxYQH4ypUpWFt2h48h9ssoqfPvdda1sXItSIT+c5+0YwJ0kliy01eFZF7wSt4kfRc67lDBhQyav4fLaRcfLHFg25LesV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749720531; c=relaxed/simple;
	bh=15A+Jq7bf64Y0Sob0l+shkxqSMyV+klxuzTzYl+nPwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GDyKPEZwfLBVUEo3DIMMsT8HqzdgtLSgSDSL1RYNMq5qC63tnjyJDH0YnPJCdFmQ5RUs7rd0wkPBg0trLTDxSoVHsnVoq0BiQdGqApetKrIZhLD5xXP8n7f9DvrqsTMxy9RFL0f7IRTo1P9qSyanu7nKCnNNmGTAm7KFXL0hklk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q94Z/Ayl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q94Z/Ayl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749720528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eFdgvb/gxCfOxh7wiM2uvpJKoACuWo2ZO3Xgqk/MBn0=;
	b=Q94Z/Ayl2hF+khK59GEGt3s8LchhTuD+Zeoa9chTXIs0wZyZH8Q+rFW8e2HuB9N/3lZg7h
	sLkZo0GVRa5nP3Wq+K/DPZMoj4T305QgCzfxAf9NFjZCVrWD3w0JpgQByy2uU5Nw7t5Vyn
	5sNdmNzMesk7j8nKWNu/4yxpkpTRD6Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-kj7aqRDmNkyS14xQgbufMg-1; Thu, 12 Jun 2025 05:28:46 -0400
X-MC-Unique: kj7aqRDmNkyS14xQgbufMg-1
X-Mimecast-MFC-AGG-ID: kj7aqRDmNkyS14xQgbufMg_1749720526
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d64026baso4317625e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749720525; x=1750325325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eFdgvb/gxCfOxh7wiM2uvpJKoACuWo2ZO3Xgqk/MBn0=;
        b=PBfClckBFaw2zrT5N0kJmUPoQMIam2FVuDYYmYgtErYfb5joAe22kedwnYPpM0YcHp
         0/O+7mRU5WoU3SxoTUA73g4mdYK8oNoeu9kVC5izColRuNGyrQK/iAr7L9ZeHKjPwKM2
         2BYCWntZkfqMY9YhK/1e2mvSuZq3jA+1ZzZLK13TtmjYusrdB1k2igIRvTjkmzwy7dLG
         F+ZEeMTwnqwIYzm1+xudTwoBZ9A7x1vkQz+hz03Xsc9ZPHe0eLCaaJWXC+MOqWF8DvRk
         PeKjH6fiRLd/tqdc8nB5NTbD7RyLEaDcmPGKnSmQKF2G3VXOl6sIcvL6VYC3C4AHJ6ZI
         abXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/uDX/EDMYEkA/WwxULOLAvN/DxTtpWz0RXkhbHfUPpQ0GYXxs0JF8PQY5em9krX7K6CidLRbirXb7ctY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg89do1srhv2MDi0dUtZ9kmEZx4lYzS35lEYx568HvVOnjZ9PY
	8Utqmin1SvIlya55OY3eNF51lckoDU2wfxM56BpASbTj7uMIrwaG1kXrnqDD5XEcUKw94pamwrC
	UxinVxq+QTSnu5Yh4+yFAVpraS50c0FDtOo9RwUsVaWj5CVJkBP1h4Hvy4RKVlRkGkg==
X-Gm-Gg: ASbGncswGTy4i3NqMlruGvHFC18xfojG2q7NA5BkEFeyMNBiv0MhXAFREj4KCJMRVSF
	3dB27pejLy+r3Pe4vRtt2t9CzPJqMCNXeOLRwpW+9o0RJbJKxAhGviWrvYQurQqUMUHgXKd9IqH
	KLczhTnRDc99PPoH5Pc4wi1LVZTpVBU0TO3Ok4VBXbLQTNmk0hvqufgJ++Xqnnwsmxt6Z5KYomc
	5K9dqe7QihJl4bbBbYH+nA2L06EEXvdKrKPML4FbKRd3EZegRBW/5QoiWwrLGq5f0f7CJgrsFz7
	ucb79WuajdGkhf0tmdlA3mCE4p+ekV7zHem68pQjEh5YI3gYOxXxaYle
X-Received: by 2002:a05:600c:4f95:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-453248dbf28mr62663465e9.29.1749720525537;
        Thu, 12 Jun 2025 02:28:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdhTavuGh0Cum2rAbeyftkpMyPY9J+DGmx0/nwN3QfQd4jm1p2rE5yEec6J7zmpY7sb/Fe0w==
X-Received: by 2002:a05:600c:4f95:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-453248dbf28mr62663255e9.29.1749720525187;
        Thu, 12 Jun 2025 02:28:45 -0700 (PDT)
Received: from ?IPV6:2001:67c:1220:8b4:8b:591b:3de:f160? ([2001:67c:1220:8b4:8b:591b:3de:f160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm53511295e9.1.2025.06.12.02.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 02:28:44 -0700 (PDT)
Message-ID: <9c2fca05-baa6-4da5-ad9f-df3361356db9@redhat.com>
Date: Thu, 12 Jun 2025 11:28:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: sysfs: Implement is_visible for
 phys_(port_id, port_name, switch_id)
To: Yajun Deng <yajun.deng@linux.dev>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, horms@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250521140824.3523-1-yajun.deng@linux.dev>
 <10a15ca4-ff93-4e62-9953-cbd3ba2c3f53@redhat.com>
 <be52bdf3f1f4786f73b618369f63ce035ce8b955@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <be52bdf3f1f4786f73b618369f63ce035ce8b955@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/25 10:51 AM, Yajun Deng wrote:
> May 27, 2025 at 2:08 PM, "Paolo Abeni" <pabeni@redhat.com> wrote:
>> On 5/21/25 4:08 PM, Yajun Deng wrote:
>>> phys_port_id_show, phys_port_name_show and phys_switch_id_show would
>>>
>>>  return -EOPNOTSUPP if the netdev didn't implement the corresponding
>>>
>>>  method.
>>>
>>>  
>>>
>>>  There is no point in creating these files if they are unsupported.
>>>
>>>  
>>>
>>>  Put these attributes in netdev_phys_group and implement the is_visible
>>>
>>>  method. make phys_(port_id, port_name, switch_id) invisible if the netdev
>>>
>>>  dosen't implement the corresponding method.
>>>
>>>  
>>>
>>>  Signed-off-by: Yajun Deng <yajun.deng@linux.dev>
>>>
>>
>> I fear that some orchestration infra depends on the files existence -
>>
>> i.e. scripts don't tolerate the files absence, deal only with I/O errors
>>
>> after open.
>>
>> It feel a bit too dangerous to merge a change that could break
>>
>> user-space this late. Let's defer it to the beginning of the next cycle.
>>
> 
> Ping.

I was likely not clear. The above means you should re-submit the patch now.

/P

