Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053AA4D8C8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744263334; cv=none; b=CL6lrwwdP7kjiig1yBBKzEhhmoniR096irEd4mbLHI8N9Z4asHijZRF7FSblizWLxQcY2l5UdRrIXSBEC3lUmpjhGJ9VLvtE5jvdhBnjL7hdbBc/Egb6uRi1AmODQN3WpCyGSkEZ64hCrRuko8vlNTz2qeWeIk+Cs4G8qosf0ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744263334; c=relaxed/simple;
	bh=RwzQmGxf5fis8I8mmMVoEhGbayGYlF/LnPvHIDl9r70=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=JR6M5Fa89JBMMAX97WsMtZ+tNknZMr4ErpN0CqJ8LRFm1SIoQ/zyv+HE9JxlfmBBcCjpbnYtiu3O6EibX4aPFR0yppDKZI+Dw4geWroSOc/RlaneE/o0e/z65pcNEy8Gzd8Fqvzkl6yhtRE2ozschEWF6XMv9ukhYpvM09x7VUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NICPupdm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NICPupdm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744263330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1xMzIJORSOug+zzoBhLyGnQgmlgGuUBB6BukVUxfJXc=;
	b=NICPupdmbNcCdBmhJ5UEw/ckZkkxw3HtFt4+Iw88xYk8B8bcS8A1OitfmCToOAN6bYcDR5
	7q+EyWmXP0hD9/wo0008b+A7oPGe6pBHg6WglgdHLe+a9UGeD4L1h2dNTV4eLWMljlo2t/
	nR3fXousmWDmsNrYvXqVhRvHR2aotPk=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-IqWyRBDKPW-VBmo7JZQ2qw-1; Thu, 10 Apr 2025 01:35:29 -0400
X-MC-Unique: IqWyRBDKPW-VBmo7JZQ2qw-1
X-Mimecast-MFC-AGG-ID: IqWyRBDKPW-VBmo7JZQ2qw_1744263328
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-af2f03fcc95so563469a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 22:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744263325; x=1744868125;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1xMzIJORSOug+zzoBhLyGnQgmlgGuUBB6BukVUxfJXc=;
        b=KHyzWd2TrhFU1kfG0g5hgE2MUXa2Iud60U9IUJKKEbHiAyzzivRD8bpoStYaJuUa38
         AAFcWXiovrhlulWGMAg22Lu+FKFnLerC59p/CGX3qDo+/qLSFSgb1ADK56PWR4JHFen0
         Y1yq33+keVMSOtaKVAZSEKALmdChQK/ylL3ZQEAhviNIh+11UE+niJAk3Cwh6IlVW3SS
         Rjje7uzWvmuNriIMsNBW4RimRdDV5XsVzRcstSQ0yHSwFMheO8Yz+j06OsiiNPRGuRRf
         DhS34Hk+aA9kG2GOQz4xAoCnwiqnTCm8MufAEq1X8zk3sQ3tB3oFPq1KBttt0eMCfkJl
         g/Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXVDkLRUKE8ajAHCSmMFri7x5rh2N983of+8HkPOlSRLOwqUMa2ZDKPAwsVtDzrFvXLseopOdbevTVzZHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOdHWUEXk9H2ATr+ASHdrgJc3vN/NqO0+EoEsiDcqzjW5x0Qbl
	n4zi/FcCknHvNFaEOcqbmhJ8kZTRdEswW840cgCDOGN/uXJCm86lRB7Zy2YPvFo/EEsZVY/TZBg
	hPoZWkG0ht4j17FzZFqQlCZug67usX27wnW6bO9jRN26OhPPPU5WdHpDgCiyJew==
X-Gm-Gg: ASbGnctG0d7akzancF/KyExTtj5Q0n5rfNxM0j0Uob/8wPW8+PnZPcyeDTekvf46hrl
	k+wMiLqFsUGBrrM981BMoWJXxeieRYK+JI/z4TZVkTvM8pLwBIWnLXAFUmcxL0dvwE0eZnbLifG
	7gsdrmxKCAKTr5ZRm5IrLFX/RntXeqGg9xLiMpnPnaiHT88EfOiA0hP7xYHVQjmdPTvCu8J5Jtl
	wY6z3YEyXHRcmj2lHsaIhnpcr110L+7fgApPOt4QxaK22abOduL+5zQlOV65+RwaSXpkyf9pkFL
	jasenSeziHeP
X-Received: by 2002:a05:6a20:9f08:b0:1f5:837b:186a with SMTP id adf61e73a8af0-2016cc9e2bbmr1485526637.6.1744263325248;
        Wed, 09 Apr 2025 22:35:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbAfvqf9KTAXm8ZXaS+61WWvXVe2iFIQLdakw8AHvej8k792DdxPwkInMdteilS3JUzRwsTQ==
X-Received: by 2002:a05:6a20:9f08:b0:1f5:837b:186a with SMTP id adf61e73a8af0-2016cc9e2bbmr1485494637.6.1744263324897;
        Wed, 09 Apr 2025 22:35:24 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a2d3aa63sm1849549a12.50.2025.04.09.22.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 22:35:24 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------yA93nCaLSOuFbq850TxYzJ7D"
Message-ID: <dc4c0d4e-a9a5-4fa5-b39d-4248fba26043@redhat.com>
Date: Thu, 10 Apr 2025 15:35:19 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REPORT] Softlockups on PowerNV with upstream
To: Oscar Salvador <osalvador@suse.de>, Aditya Gupta <adityag@linux.ibm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Danilo Krummrich <dakr@kernel.org>, David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, linux-kernel@vger.kernel.org
References: <20250409180344.477916-1-adityag@linux.ibm.com>
 <Z_dWTU8UsvCHFMpN@localhost.localdomain>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <Z_dWTU8UsvCHFMpN@localhost.localdomain>

This is a multi-part message in MIME format.
--------------yA93nCaLSOuFbq850TxYzJ7D
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/25 3:25 PM, Oscar Salvador wrote:
> On Wed, Apr 09, 2025 at 11:33:44PM +0530, Aditya Gupta wrote:
>> Hi,
>>
>> While booting current upstream kernel, I consistently get "softlockups", on IBM PowerNV system.
>>
>> I have tested it only on PowerNV systems. But some architectures/platforms also
>> might have it. PSeries systems don't have this issue though.
>>
>> Bisect points to the following commit:
>>
>>      commit 61659efdb35ce6c6ac7639342098f3c4548b794b
>>      Author: Gavin Shan <gshan@redhat.com>
>>      Date:   Wed Mar 12 09:30:43 2025 +1000
>>
>>          drivers/base/memory: improve add_boot_memory_block()
>>
> ...
>> Console log
>> -----------
>>
>>      [    2.783371] smp: Brought up 4 nodes, 256 CPUs
>>      [    2.783475] numa: Node 0 CPUs: 0-63
>>      [    2.783537] numa: Node 2 CPUs: 64-127
>>      [    2.783591] numa: Node 4 CPUs: 128-191
>>      [    2.783653] numa: Node 6 CPUs: 192-255
>>      [    2.804945] Memory: 735777792K/738197504K available (17536K kernel code, 5760K rwdata, 15232K rodata, 6528K init, 2517K bss, 1369664K reserved, 0K cma-reserved)
> 
> If I am not mistaken this is ~700GB, and PowerNV uses 16MB as section size,
> and sections_per_block == 1 (I think).
> 
> The code before the mentioned commit, was something like:
> 
>   for (nr = base_section_nr; nr < base_section_nr + sections_per_block; nr++)
>         if (present_section_nr(nr))
>            section_count++;
> 
>   if (section_count == 0)
>      return 0;
>   return add_memory_block()
> 
> So, in case of PowerNV , we will just check one section at a time and
> either return or call add_memory_block depending whether it is present.
> 
> Now, with the current code that is something different.
> We now have
> 
> memory_dev_init:
>   for(nr = 0, nr <= __highest_present_section_nr; nr += 1)
>       ret = add_boot_memory_block
> 
> add_boot_memory_block:
>   for_each_present_section_nr(base_section_nr, nr) {
>       if (nr >= (base_section_nr + sections_per_block))
>              break;
> 
>       return add_memory_block();
>   }
>   return 0;
> 
> The thing is that next_present_section_nr() (which is called in
> for_each_present_section_nr()) will loop until we find a present
> section.
> And then we will check whether the found section is beyond
> base_section_nr + sections_per_block (where sections_per_block = 1).
> If so, we skip add_memory_block.
> 
> Now, I think that the issue comes from for_each_present_section_nr
> having to loop a lot until we find a present section.
> And then the loop in memory_dev_init increments only by 1, which means
> that the next iteration we might have to loop a lot again to find the
> another present section. And so on and so forth.
> 
> Maybe we can fix this by making memory_dev_init() remember in which
> section add_boot_memory_block returns.
> Something like the following (only compile-tested)
> 

Thanks, Oscar. You're correct that the overhead is introduced by for_each_present_section_nr().
I already had the fix, working on IBM's Power9 machine, where the issue can be
reproduced. Please see the attached patch.

I'm having most tests on ARM64 machine for the fix.

Thanks,
Gavin

> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 8f3a41d9bfaa..d97635cbfd1d 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -816,18 +816,25 @@ static int add_memory_block(unsigned long block_id, unsigned long state,
>   	return 0;
>   }
> 
> -static int __init add_boot_memory_block(unsigned long base_section_nr)
> +static int __init add_boot_memory_block(unsigned long *base_section_nr)
>   {
> +	int ret;
>   	unsigned long nr;
> 
> -	for_each_present_section_nr(base_section_nr, nr) {
> -		if (nr >= (base_section_nr + sections_per_block))
> +	for_each_present_section_nr(*base_section_nr, nr) {
> +		if (nr >= (*base_section_nr + sections_per_block))
>   			break;
> 
> -		return add_memory_block(memory_block_id(base_section_nr),
> -					MEM_ONLINE, NULL, NULL);
> +		ret = add_memory_block(memory_block_id(*base_section_nr),
> +				       MEM_ONLINE, NULL, NULL);
> +		*base_section = nr;
> +		return ret;
>   	}
> 
> +	if (nr == -1)
> +		*base_section = __highest_present_section_nr + 1;
> +	else
> +		*base_section = nr;
>   	return 0;
>   }
> 
> @@ -973,9 +980,9 @@ void __init memory_dev_init(void)
>   	 * Create entries for memory sections that were found
>   	 * during boot and have been initialized
>   	 */
> -	for (nr = 0; nr <= __highest_present_section_nr;
> -	     nr += sections_per_block) {
> -		ret = add_boot_memory_block(nr);
> +	nr = first_present_section_nr();
> +	for (; nr <= __highest_present_section_nr; nr += sections_per_block) {
> +		ret = add_boot_memory_block(&nr);
>   		if (ret)
>   			panic("%s() failed to add memory block: %d\n", __func__,
>   			      ret);
>   
> 
> @Aditya: can you please give it a try?
> 
> 
> 

--------------yA93nCaLSOuFbq850TxYzJ7D
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drivers-base-memory-Avoid-overhead-for_each_present_.patch"
Content-Disposition: attachment;
 filename*0="0001-drivers-base-memory-Avoid-overhead-for_each_present_.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBkNGM0M2Q1ZjZiOTYyMTQ0YzRmNDdkNDZhNjYyODRkZjkyZGEyODVlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPgpE
YXRlOiBUaHUsIDEwIEFwciAyMDI1IDE0OjQzOjQ2ICsxMDAwClN1YmplY3Q6IFtQQVRDSF0g
ZHJpdmVycy9iYXNlL21lbW9yeTogQXZvaWQgb3ZlcmhlYWQKIGZvcl9lYWNoX3ByZXNlbnRf
c2VjdGlvbl9ucigpCk1JTUUtVmVyc2lvbjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFp
bjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Cgpmb3Jf
ZWFjaF9wcmVzZW50X3NlY3Rpb25fbnIoKSB3YXMgaW50cm9kdWNlZCB0byBhZGRfYm9vdF9t
ZW1vcnlfYmxvY2soKQpieSBjb21taXQgNjE2NTllZmRiMzVjICgiZHJpdmVycy9iYXNlL21l
bW9yeTogaW1wcm92ZSBhZGRfYm9vdF9tZW1vcnlfYmxvY2soKSIpLgpJdCBjYXVzZXMgdW5u
ZWNlc3Nhcnkgb3ZlcmhlYWQgd2hlbiB0aGUgcHJlc2VudCBzZWN0aW9ucyBhcmUgcmVhbGx5
CnNwYXJzZS4gbmV4dF9wcmVzZW50X3NlY3Rpb25fbnIoKSBjYWxsZWQgYnkgdGhlIG1hY3Jv
IGZpbmRzIHRoZSBuZXh0CnByZXNlbnQgc2VjdGlvbiwgd2hpY2ggaXMgZmFyIGF3YXkgZnJv
bSB0aGUgc3Bhbm5pbmcgc2VjdGlvbnMgaW4gdGhlCnNwZWNpZmllZCBibG9jay4gVG9vIG11
Y2ggdGltZSBjb25zdW1lZCBieSBuZXh0X3ByZXNlbnRfc2VjdGlvbl9ucigpCmluIHRoaXMg
Y2FzZSwgd2hpY2ggY2FuIGxlYWQgdG8gc29mdGxvY2t1cCBhcyBvYnNlcnZlZCBieSBBZGl0
eWEgR3VwdGEKb24gSUJNIFBvd2VyMTAgbWFjaGluZS4KCiAgd2F0Y2hkb2c6IEJVRzogc29m
dCBsb2NrdXAgLSBDUFUjMjQ4IHN0dWNrIGZvciAyMnMhIFtzd2FwcGVyLzI0ODoxXQogIE1v
ZHVsZXMgbGlua2VkIGluOgogIENQVTogMjQ4IFVJRDogMCBQSUQ6IDEgQ29tbTogc3dhcHBl
ci8yNDggTm90IHRhaW50ZWQgNi4xNS4wLXJjMS1uZXh0LTIwMjUwNDA4ICMxIFZPTFVOVEFS
WQogIEhhcmR3YXJlIG5hbWU6IDkxMDUtMjJBIFBPV0VSMTAgKHJhdykgMHg4MDAyMDAgb3Bh
bDp2Ny4xLTEwNy1nZmRhNzVkMTIxOTQyIFBvd2VyTlYKICBOSVA6ICBjMDAwMDAwMDAyMDky
MThjIExSOiBjMDAwMDAwMDAyMDkyMjA0IENUUjogMDAwMDAwMDAwMDAwMDAwMAogIFJFR1M6
IGMwMDA0MDAwMDQxOGZhMzAgVFJBUDogMDkwMCAgIE5vdCB0YWludGVkICAoNi4xNS4wLXJj
MS1uZXh0LTIwMjUwNDA4KQogIE1TUjogIDkwMDAwMDAwMDIwMDkwMzMgPFNGLEhWLFZFQyxF
RSxNRSxJUixEUixSSSxMRT4gIENSOiAyODAwMDQyOCAgWEVSOiAwMDAwMDAwMAogIENGQVI6
IDAwMDAwMDAwMDAwMDAwMDAgSVJRTUFTSzogMAogIEdQUjAwOiBjMDAwMDAwMDAyMDkyMjA0
IGMwMDA0MDAwMDQxOGZjZDAgYzAwMDAwMDAwMWIwODEwMCAwMDAwMDAwMDAwMDAwMDQwCiAg
R1BSMDQ6IDAwMDAwMDAwMDAwMTNlMDAgYzAwMGMwM2ZmZWJhYmIwMCAwMDAwMDAwMDAwYzAz
ZmZmIGMwMDA0MDBmZmY1ODdmODAKICBHUFIwODogMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAw
MDAwMTE5NmY3IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAyODAwMDQyOAogIEdQUjEyOiAw
MDAwMDAwMDAwMDAwMDAwIGMwMDAwMDAwMDJlODAwMDAgYzAwMDAwMDAwMDAxMDA3YyAwMDAw
MDAwMDAwMDAwMDAwCiAgR1BSMTY6IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAw
MCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAKICBHUFIyMDogMDAwMDAwMDAw
MDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAw
MDAwMAogIEdQUjI0OiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAw
MDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwCiAgR1BSMjg6IGMwMDAwMDAwMDJkZjdmNzAg
MDAwMDAwMDAwMDAxM2RjMCBjMDAwMDAwMDAxMWRkODk4IDAwMDAwMDAwMDgwMDAwMDAKICBO
SVAgW2MwMDAwMDAwMDIwOTIxOGNdIG1lbW9yeV9kZXZfaW5pdCsweDExNC8weDFlMAogIExS
IFtjMDAwMDAwMDAyMDkyMjA0XSBtZW1vcnlfZGV2X2luaXQrMHgxOGMvMHgxZTAKICBDYWxs
IFRyYWNlOgogIFtjMDAwNDAwMDA0MThmY2QwXSBbYzAwMDAwMDAwMjA5MjIwNF0gbWVtb3J5
X2Rldl9pbml0KzB4MThjLzB4MWUwICh1bnJlbGlhYmxlKQogIFtjMDAwNDAwMDA0MThmZDUw
XSBbYzAwMDAwMDAwMjA5MTM0OF0gZHJpdmVyX2luaXQrMHg3OC8weGE0CiAgW2MwMDA0MDAw
MDQxOGZkNzBdIFtjMDAwMDAwMDAyMDA2M2FjXSBrZXJuZWxfaW5pdF9mcmVlYWJsZSsweDIy
Yy8weDM3MAogIFtjMDAwNDAwMDA0MThmZGUwXSBbYzAwMDAwMDAwMDAxMDBhOF0ga2VybmVs
X2luaXQrMHgzNC8weDI1YwogIFtjMDAwNDAwMDA0MThmZTUwXSBbYzAwMDAwMDAwMDAwY2Q5
NF0gcmV0X2Zyb21fa2VybmVsX3VzZXJfdGhyZWFkKzB4MTQvMHgxYwoKQXZvaWQgdGhlIG92
ZXJoZWFkIGJ5IGZvbGRpbmcgZm9yX2VhY2hfcHJlc2VudF9zZWN0aW9uX25yKCkgdG8gdGhl
IG91dGVyCmxvb3AuIGFkZF9ib290X21lbW9yeV9ibG9jaygpIGlzIGRyb3BwZWQgYWZ0ZXIg
dGhhdC4KCkZpeGVzOiA2MTY1OWVmZGIzNWMgKCJkcml2ZXJzL2Jhc2UvbWVtb3J5OiBpbXBy
b3ZlIGFkZF9ib290X21lbW9yeV9ibG9jaygpIikKQ2xvc2VzOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1tbS8yMDI1MDQwOTE4MDM0NC40Nzc5MTYtMS1hZGl0eWFnQGxpbnV4
LmlibS5jb20KUmVwb3J0ZWQtYnk6IEFkaXR5YSBHdXB0YSA8YWRpdHlhZ0BsaW51eC5pYm0u
Y29tPgpTaWduZWQtb2ZmLWJ5OiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPgotLS0K
IGRyaXZlcnMvYmFzZS9tZW1vcnkuYyB8IDM0ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jhc2UvbWVtb3J5LmMgYi9kcml2ZXJzL2Jh
c2UvbWVtb3J5LmMKaW5kZXggOGYzYTQxZDliZmFhLi40MzNhNWZlOTYzMDQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvYmFzZS9tZW1vcnkuYworKysgYi9kcml2ZXJzL2Jhc2UvbWVtb3J5LmMK
QEAgLTgxNiwyMSArODE2LDYgQEAgc3RhdGljIGludCBhZGRfbWVtb3J5X2Jsb2NrKHVuc2ln
bmVkIGxvbmcgYmxvY2tfaWQsIHVuc2lnbmVkIGxvbmcgc3RhdGUsCiAJcmV0dXJuIDA7CiB9
CiAKLXN0YXRpYyBpbnQgX19pbml0IGFkZF9ib290X21lbW9yeV9ibG9jayh1bnNpZ25lZCBs
b25nIGJhc2Vfc2VjdGlvbl9ucikKLXsKLQl1bnNpZ25lZCBsb25nIG5yOwotCi0JZm9yX2Vh
Y2hfcHJlc2VudF9zZWN0aW9uX25yKGJhc2Vfc2VjdGlvbl9uciwgbnIpIHsKLQkJaWYgKG5y
ID49IChiYXNlX3NlY3Rpb25fbnIgKyBzZWN0aW9uc19wZXJfYmxvY2spKQotCQkJYnJlYWs7
Ci0KLQkJcmV0dXJuIGFkZF9tZW1vcnlfYmxvY2sobWVtb3J5X2Jsb2NrX2lkKGJhc2Vfc2Vj
dGlvbl9uciksCi0JCQkJCU1FTV9PTkxJTkUsIE5VTEwsIE5VTEwpOwotCX0KLQotCXJldHVy
biAwOwotfQotCiBzdGF0aWMgaW50IGFkZF9ob3RwbHVnX21lbW9yeV9ibG9jayh1bnNpZ25l
ZCBsb25nIGJsb2NrX2lkLAogCQkJCSAgICBzdHJ1Y3Qgdm1lbV9hbHRtYXAgKmFsdG1hcCwK
IAkJCQkgICAgc3RydWN0IG1lbW9yeV9ncm91cCAqZ3JvdXApCkBAIC05NTcsNyArOTQyLDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgKm1lbW9yeV9yb290X2F0
dHJfZ3JvdXBzW10gPSB7CiB2b2lkIF9faW5pdCBtZW1vcnlfZGV2X2luaXQodm9pZCkKIHsK
IAlpbnQgcmV0OwotCXVuc2lnbmVkIGxvbmcgYmxvY2tfc3osIG5yOworCXVuc2lnbmVkIGxv
bmcgYmxvY2tfc3osIGJsb2NrX2lkLCBucjsKIAogCS8qIFZhbGlkYXRlIHRoZSBjb25maWd1
cmVkIG1lbW9yeSBibG9jayBzaXplICovCiAJYmxvY2tfc3ogPSBtZW1vcnlfYmxvY2tfc2l6
ZV9ieXRlcygpOwpAQCAtOTczLDEyICs5NTgsMTcgQEAgdm9pZCBfX2luaXQgbWVtb3J5X2Rl
dl9pbml0KHZvaWQpCiAJICogQ3JlYXRlIGVudHJpZXMgZm9yIG1lbW9yeSBzZWN0aW9ucyB0
aGF0IHdlcmUgZm91bmQKIAkgKiBkdXJpbmcgYm9vdCBhbmQgaGF2ZSBiZWVuIGluaXRpYWxp
emVkCiAJICovCi0JZm9yIChuciA9IDA7IG5yIDw9IF9faGlnaGVzdF9wcmVzZW50X3NlY3Rp
b25fbnI7Ci0JICAgICBuciArPSBzZWN0aW9uc19wZXJfYmxvY2spIHsKLQkJcmV0ID0gYWRk
X2Jvb3RfbWVtb3J5X2Jsb2NrKG5yKTsKLQkJaWYgKHJldCkKLQkJCXBhbmljKCIlcygpIGZh
aWxlZCB0byBhZGQgbWVtb3J5IGJsb2NrOiAlZFxuIiwgX19mdW5jX18sCi0JCQkgICAgICBy
ZXQpOworCWJsb2NrX2lkID0gVUxPTkdfTUFYOworCWZvcl9lYWNoX3ByZXNlbnRfc2VjdGlv
bl9ucigwLCBucikgeworCQlpZiAoYmxvY2tfaWQgIT0gVUxPTkdfTUFYICYmIG1lbW9yeV9i
bG9ja19pZChucikgPT0gYmxvY2tfaWQpCisJCQljb250aW51ZTsKKworCQlibG9ja19pZCA9
IG1lbW9yeV9ibG9ja19pZChucik7CisJCXJldCA9IGFkZF9tZW1vcnlfYmxvY2soYmxvY2tf
aWQsIE1FTV9PTkxJTkUsIE5VTEwsIE5VTEwpOworCQlpZiAocmV0KSB7CisJCQlwYW5pYygi
JXMoKSBmYWlsZWQgdG8gYWRkIG1lbW9yeSBibG9jazogJWRcbiIsCisJCQkgICAgICBfX2Z1
bmNfXywgcmV0KTsKKwkJfQogCX0KIH0KIAotLSAKMi40OC4xCgo=

--------------yA93nCaLSOuFbq850TxYzJ7D--

