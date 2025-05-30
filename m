Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3982DCBE6;
	Fri, 30 May 2025 15:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748618197; cv=none; b=f0+v/9QlqsnLspU+K0S4jlLuZ0xu/UPXxE3WEm7lLrGPJULo2z0t6wx3s7dFY0RR22/DQJjbkY2aTwfkV9nRO2sQLIxlUDAo7Q7UUe46DtZKVlyWX99vH5ZcceyI8wu2X1HV/77G+DGxBcv4EpwKzQBW9bjFFkUvyOwyN/m+54I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748618197; c=relaxed/simple;
	bh=cyw5tno9obutu/J4MpIzIqSU+Ug6eSVNEkh8j8zPwF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f3Ujacymz+ydkeNVrpL9vkcOa+6JQ/dYme3DJMvQnzrdVdVU1xARA4nle+HZduMVaAzJjefhTFSS5Pm1IrIz6pJIZOLHloBSoAnhjTA7fhrTpLXbANd31zFr7+2japn/45hWCL2+k+ydwe2tZHY7D0d/6zsAnqv3ILAk4IwSviQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Paf6zHqx; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Paf6zHqx"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4074997ce2bso112676b6e.3;
        Fri, 30 May 2025 08:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748618194; x=1749222994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2+Uub0514mnhBSVCW3kcL16XPntIR+dCEVeuWClenCE=;
        b=Paf6zHqx1DKEiZF9O+G+HkPPp/lmGWXp4Zjt+zGqeMQxR1nFerEHZIiNKsyIONcpsV
         3cjwdcN0VmohFkJGL0n3U06f5qHO0yj79CWW8o5gtiKWX0WaJkOWx55FWvvj/4yrXpnL
         t3V6VkY6YqoYGiH3Xbv94eGwB1pJx5r6RvJ5DxjF7B37LS2hbe/8/M5OF20OmtrNRrNc
         rood1BLBVt0q+dOPLcvDGLmIB/d9tlXOLIdwEZDBtNB/HIgEBRXDMNnT3K1Y8+VytACk
         7dPnIeMHXR3ZMy71JFdFapyZPfo26ppqQdACtUa/mPigq4khY7THUkmw8HXOE/pWcCiA
         QHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748618194; x=1749222994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2+Uub0514mnhBSVCW3kcL16XPntIR+dCEVeuWClenCE=;
        b=FbjT/vMyvZmlLOAn2eK33menGkD0uuKzRr2rUUb87u9YDim//nbEUUp1uOqZLcXL+7
         dph8UQkQ7TmnTW++9F0CO0E0Sq8euvv2jaPiFFbfaZNVNctInWwxf786lQnzb5aID0cP
         4uvnNOig4N6JyMUUeY5Pak2O4vyroc3bXX+hpL7YmZ1lvsV4tOovi7Tz1mBihvaBPo1e
         SWFZq/qKi5A1b3kDhflZ11ToP7FvBgiwZmVVxjh1kuRBTbI8O3elrdHNp9NaB/j4+lXi
         Q5MCfqAM/V1oX/9AiphhatbBXeICSQPl9d/XY+UiDwX512ijmeXXgeukPetgPHjk5LF8
         y/Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVYdfG+FZ0avnNfttTLKdxXFnwUTcjSJzUc7PeD8/XHAMgjyGEG1R8j89tpLlb60NV5mNrUwQl0BrnlZT7BkjcQ2ZlB@vger.kernel.org
X-Gm-Message-State: AOJu0YzY/QejiS8VNpfrugFOx4HWRqaWzd5XQi+gBH/mhI+WPYpnwjYm
	UBW8F7lP6fDRtH+a4j2dmLajrizsJMzfebJYIP4kRKdt3o7mDEUaI3SbPiC3oQ==
X-Gm-Gg: ASbGncu0WzoN76bK200hhd0kxMJOZh2AmVV5Xq5Ttgx20uhbOqPBs3Dz8/dCILHg8f1
	z710siRaWJtwG/0YgXgMnUwf6hCjCA/TBeDget827e30IE4KeGRCg1vyabyZr0Ilfj7iSHTX/+k
	0IrmGj5zpMC5R6uzepenVFu1T5e3zUWTwGPi4npjkl9jxU0evVWmU9BmQuxoVXdlfXp0xY9C1zu
	kxSvrcKpxJt1JglcKa93oTQI844YHxGYZ/lAPw5Vusr3/wHYhGwoqZWmoR4HxmbuaLcLR5LqbH8
	6Tkwr2yTjs3/LuW4rK57OLRi6lDxEV8uwIKhDK9bIrt0+ZZtoHz0Z9ms0e9XGXWPNxCYOKBrTgZ
	JaKw+85oKGu5sv5/o6g+wVR6idbNJlN6b09CK
X-Google-Smtp-Source: AGHT+IElXsuQQ5ptVckGIc7NK7RquBBZBE6s8fhdSvPlwZAareEXWJknvyah33PnOML1gl/1v7Mm3A==
X-Received: by 2002:a05:6808:6c8b:b0:406:6fd3:ff18 with SMTP id 5614622812f47-4067e6c47aamr1352387b6e.34.1748618194458;
        Fri, 30 May 2025 08:16:34 -0700 (PDT)
Received: from [192.168.1.7] (syn-067-048-091-116.res.spectrum.com. [67.48.91.116])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60c14c711edsm405713eaf.12.2025.05.30.08.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 08:16:34 -0700 (PDT)
Message-ID: <c213733e-e907-40cd-ab60-ec8fa0b15e4d@gmail.com>
Date: Fri, 30 May 2025 10:16:32 -0500
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
Content-Language: en-US
From: stuart hayes <stuart.w.hayes@gmail.com>
In-Reply-To: <d7adf2ca-0cd7-99eb-9be1-a2b37fa8445e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/30/2025 2:54 AM, Ilpo Järvinen wrote:
> On Thu, 29 May 2025, Stuart Hayes wrote:
> 
>> Stop using an entire struct packet_data just for the embedded list_head,
>> and fix usage of that list_head.
>>
>> Fixes: d19f359fbdc6 ("platform/x86: dell_rbu: don't open code list_for_each_entry*()")
>> Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
> 
> Isn't this just refactor so Fixes tag for this commit is not warranted?
> 

No. The patch that this fixes had converted the driver to use 
list_for_each_entry*() to loop through the packet list instead of a 
while loop. But it passed (&packet_data_head.list)->next to 
list_for_each_entry*() instead of the list head itself.

That resulted in to issues. In the function that prints the packets, it 
would start with the wrong packet, and in the function that deletes the 
packets, it would get a null pointer dereference when it tried to zero 
out the data associated with the packet that held the actual list head.

>> ---
>>   drivers/platform/x86/dell/dell_rbu.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
>> index 7b019fb72e86..c03d4d55fcc1 100644
>> --- a/drivers/platform/x86/dell/dell_rbu.c
>> +++ b/drivers/platform/x86/dell/dell_rbu.c
>> @@ -77,14 +77,14 @@ struct packet_data {
>>   	int ordernum;
>>   };
>>   
>> -static struct packet_data packet_data_head;
>> +static struct list_head packet_data_list;
>>   
>>   static struct platform_device *rbu_device;
>>   static int context;
>>   
>>   static void init_packet_head(void)
>>   {
>> -	INIT_LIST_HEAD(&packet_data_head.list);
>> +	INIT_LIST_HEAD(&packet_data_list);
>>   	rbu_data.packet_read_count = 0;
>>   	rbu_data.num_packets = 0;
>>   	rbu_data.packetsize = 0;
>> @@ -183,7 +183,7 @@ static int create_packet(void *data, size_t length) __must_hold(&rbu_data.lock)
>>   
>>   	/* initialize the newly created packet headers */
>>   	INIT_LIST_HEAD(&newpacket->list);
>> -	list_add_tail(&newpacket->list, &packet_data_head.list);
>> +	list_add_tail(&newpacket->list, &packet_data_list);
>>   
>>   	memcpy(newpacket->data, data, length);
>>   
>> @@ -292,7 +292,7 @@ static int packet_read_list(char *data, size_t * pread_length)
>>   	remaining_bytes = *pread_length;
>>   	bytes_read = rbu_data.packet_read_count;
>>   
>> -	list_for_each_entry(newpacket, (&packet_data_head.list)->next, list) {
>> +	list_for_each_entry(newpacket, &packet_data_list, list) {
>>   		bytes_copied = do_packet_read(pdest, newpacket,
>>   			remaining_bytes, bytes_read, &temp_count);
>>   		remaining_bytes -= bytes_copied;
>> @@ -315,7 +315,7 @@ static void packet_empty_list(void)
>>   {
>>   	struct packet_data *newpacket, *tmp;
>>   
>> -	list_for_each_entry_safe(newpacket, tmp, (&packet_data_head.list)->next, list) {
>> +	list_for_each_entry_safe(newpacket, tmp, &packet_data_list, list) {
>>   		list_del(&newpacket->list);
>>   
>>   		/*
>>
> 

