Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD2E19DF41;
	Fri, 30 May 2025 15:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748619362; cv=none; b=r4YF50njjFI4lqkEMrBJ3a6tYUdas+Y5/MMzNSCy6jhRXN5BLY06q875GrGcHn7CGZBzBkeU0SEYkzkotJNll5YbPtQkKC+O6zCfhbz1BYYvPk6lUho9v23RRlvrBtZ8g+Oo9SDg1EOWVUAOnUQ+GuCa0RvIroLsuYSryyGQa3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748619362; c=relaxed/simple;
	bh=lGI7Ml61Bx/0vKqhUITDjPdL59+Gud4yiPqB0I/lT6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z6CFWlOh76du19A78Gn2n48CME/STl4qKNOTcCtHQuFk7J4eobnywcIshSR1cV0Rf4u3tXQ4iOy9axfZNqVF+vymXw6g1AuliUVKFSyZCEv2Ym8re9SHaGE5+8kiPzhiqC5euwqK77oBN18TlqHlvSQXt/NiTnIyuvEc2xXE7CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZz0K2va; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZz0K2va"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72c27166ab3so1584343a34.1;
        Fri, 30 May 2025 08:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748619356; x=1749224156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ECfivYZ85+kkXqokUDM85sc8NAUi1hs55XP9K+BfhRo=;
        b=NZz0K2vaZoOZyXfqBzXZy2O+vDBsf12eDccEJUM/5edPKqKhccKcBNceD7BAts/nwY
         u1Yic2nZ0/n+/BXGFBKamuDf9VqlLajAo/y5eZiFsiBF0jLicg+AbSHp05DPSPpCvusM
         WVv5XByMUtewc9Gp55tJmDo8uG2FX/z4dNUBDJr/3QeontE0N8LTFh/V+1tqBTvl7Mjw
         NHZ6s9yNM7PqFRTRpbaUdWiwi5MGLmc+Dzspez2MbUGZtSCB3L0/yXIQGVK+Vw8Ky9hc
         eHk8NgKelosoNJeO/E4OR0nghEoSKPpSlg/PojKGET9UsywV0Zjgcer/XbI3E7IXZy0e
         iH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748619356; x=1749224156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ECfivYZ85+kkXqokUDM85sc8NAUi1hs55XP9K+BfhRo=;
        b=mAaMzoxTeKN1yEoVxie/cKAd/qPJi87y/tVgOshvmqXB6KwWzc7TvIKEz93ZJuCTua
         dXIY/h0yzLJrH5y7F8h/URV+5B8I+j3kOYrdoD/ADjf2tKoxYaYdSvnsuNBgQTElc4aq
         C2lF5ZiIzJ05cqIH1N4uL/qR12wc33KFMCK3+0gtCyOaC/brbWaY4Tcnz7theOb9MvS4
         d5NX44q5g9+FTPMp01P8PcgYnz74MTSBOm/RafXjyp5NFoj+oyrlI8Az6uWP6P/FGMqN
         ydd6XRhDgNSjK665QVa0kv7MQlsoPTFw4Fwf5TTL5E4zqzzk8jojIwsytqtmviUVQbLK
         jxKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW22oJTclBLin/ZdKphG1dwr+R8SGXTqpaFhDF7HuI6KZx/yj32mzRj50dk/4LYeyrMnHFSW+rzbkgEN15P91WSlOsf@vger.kernel.org
X-Gm-Message-State: AOJu0YwoErYclaSaGxxOb+2ywiwYyeFBXkOp0TJFwKJEkli0y7PGIM8+
	rikJhgdx0CvyO2D/KeDqiTZxItX2R8XljwoseKKwGhry7YrZqs7NlTqA
X-Gm-Gg: ASbGncvJoq/eKQ4cwcYvJzIggzC/nPSecXVbX2IT+qHS9aT9kS6wQ+w8b/OiEr+z7K/
	qP+sOJltSXAHQdDZFzRSCHtlpVtUaq619bnZs5zmsXJkbAFbcD5HM0qOvh60vl6ZXludJnCVHE+
	mSIH7oQ42z+b/WWk7KfF6I0Ioxd3R4oLtfy5Y1thHTLKCSCSCGuY5HhTyieN+TqazjeKobFo5q6
	w6Sb23DaT/AK7w6xmAn9JGtGqu6pPYTVCCnN7z4Zugp1vFii6UQFf9OuVsAKBrjn2OIa3R+IbP8
	zKIpnEjS4P/dnJdq0AZAEa0XJ/7OAa3PswvVgTf32nuCRmHlejaxeEf3zporyHsp2/lVYCNU9QK
	7SxTt+E/YTtt81NdWYthc+m0I0D9L4NRN1Dr0
X-Google-Smtp-Source: AGHT+IF3vqo9sjX+GZp3WsEU1iC+kTjPy0F5RxoHM7U3v6JS34r2Xh1CgHa6Mth4nj0/KB6o97Yaag==
X-Received: by 2002:a05:6830:6b07:b0:72b:a5e0:f76 with SMTP id 46e09a7af769-736ecdde735mr1508551a34.4.1748619356620;
        Fri, 30 May 2025 08:35:56 -0700 (PDT)
Received: from [192.168.1.7] (syn-067-048-091-116.res.spectrum.com. [67.48.91.116])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-735af9bc906sm622694a34.48.2025.05.30.08.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 08:35:56 -0700 (PDT)
Message-ID: <04ba20e6-ce2c-4e47-8884-c563b931cd66@gmail.com>
Date: Fri, 30 May 2025 10:35:54 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] platform/x86: dell_rbu: Fix list usage
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 platform-driver-x86@vger.kernel.org
References: <20250529202758.8440-1-stuart.w.hayes@gmail.com>
 <20250529202758.8440-3-stuart.w.hayes@gmail.com>
 <d7adf2ca-0cd7-99eb-9be1-a2b37fa8445e@linux.intel.com>
 <c213733e-e907-40cd-ab60-ec8fa0b15e4d@gmail.com>
 <54523dfb-e1ff-fa55-0628-0a8377457f0d@linux.intel.com>
Content-Language: en-US
From: stuart hayes <stuart.w.hayes@gmail.com>
In-Reply-To: <54523dfb-e1ff-fa55-0628-0a8377457f0d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/30/2025 10:25 AM, Ilpo Järvinen wrote:
> On Fri, 30 May 2025, stuart hayes wrote:
> 
>> On 5/30/2025 2:54 AM, Ilpo Järvinen wrote:
>>> On Thu, 29 May 2025, Stuart Hayes wrote:
>>>
>>>> Stop using an entire struct packet_data just for the embedded list_head,
>>>> and fix usage of that list_head.
>>>>
>>>> Fixes: d19f359fbdc6 ("platform/x86: dell_rbu: don't open code
>>>> list_for_each_entry*()")
>>>> Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
>>>
>>> Isn't this just refactor so Fixes tag for this commit is not warranted?
>>>
>>
>> No. The patch that this fixes had converted the driver to use
>> list_for_each_entry*() to loop through the packet list instead of a while
>> loop. But it passed (&packet_data_head.list)->next to list_for_each_entry*()
>> instead of the list head itself.
>>
>> That resulted in to issues. In the function that prints the packets, it would
>> start with the wrong packet, and in the function that deletes the packets, it
>> would get a null pointer dereference when it tried to zero out the data
>> associated with the packet that held the actual list head.
> 
> Oh, I see that difference now. Good catch.
> 
> However, that also means the ->next part is wrong and there are two
> independent changes here, one that fixes this ->next problem and then the
> refactoring of packet_data_head to packet_data_list?
> 

Correct. Do you want those as two separate patches?

>>>> ---
>>>>    drivers/platform/x86/dell/dell_rbu.c | 10 +++++-----
>>>>    1 file changed, 5 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/dell/dell_rbu.c
>>>> b/drivers/platform/x86/dell/dell_rbu.c
>>>> index 7b019fb72e86..c03d4d55fcc1 100644
>>>> --- a/drivers/platform/x86/dell/dell_rbu.c
>>>> +++ b/drivers/platform/x86/dell/dell_rbu.c
>>>> @@ -77,14 +77,14 @@ struct packet_data {
>>>>    	int ordernum;
>>>>    };
>>>>    -static struct packet_data packet_data_head;
>>>> +static struct list_head packet_data_list;
>>>>      static struct platform_device *rbu_device;
>>>>    static int context;
>>>>      static void init_packet_head(void)
>>>>    {
>>>> -	INIT_LIST_HEAD(&packet_data_head.list);
>>>> +	INIT_LIST_HEAD(&packet_data_list);
>>>>    	rbu_data.packet_read_count = 0;
>>>>    	rbu_data.num_packets = 0;
>>>>    	rbu_data.packetsize = 0;
>>>> @@ -183,7 +183,7 @@ static int create_packet(void *data, size_t length)
>>>> __must_hold(&rbu_data.lock)
>>>>      	/* initialize the newly created packet headers */
>>>>    	INIT_LIST_HEAD(&newpacket->list);
>>>> -	list_add_tail(&newpacket->list, &packet_data_head.list);
>>>> +	list_add_tail(&newpacket->list, &packet_data_list);
>>>>      	memcpy(newpacket->data, data, length);
>>>>    @@ -292,7 +292,7 @@ static int packet_read_list(char *data, size_t *
>>>> pread_length)
>>>>    	remaining_bytes = *pread_length;
>>>>    	bytes_read = rbu_data.packet_read_count;
>>>>    -	list_for_each_entry(newpacket, (&packet_data_head.list)->next, list) {
>>>> +	list_for_each_entry(newpacket, &packet_data_list, list) {
>>>>    		bytes_copied = do_packet_read(pdest, newpacket,
>>>>    			remaining_bytes, bytes_read, &temp_count);
>>>>    		remaining_bytes -= bytes_copied;
>>>> @@ -315,7 +315,7 @@ static void packet_empty_list(void)
>>>>    {
>>>>    	struct packet_data *newpacket, *tmp;
>>>>    -	list_for_each_entry_safe(newpacket, tmp,
>>>> (&packet_data_head.list)->next, list) {
>>>> +	list_for_each_entry_safe(newpacket, tmp, &packet_data_list, list) {
>>>>    		list_del(&newpacket->list);
>>>>      		/*
>>>>
>>>
>>
> 

