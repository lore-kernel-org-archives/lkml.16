Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2A426657E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744211935; cv=none; b=UUrvew/bv6QvIcvgD360vZERrxoweT9hAVcFwFfMdwJ23oMpuCvU/2fr4j8SLlk3eUJZQcXnuVfNu+9qEDRrv5ikVK3er1jFtfAlSdMEMqm+E4koPUopiYSCWnZwd8+bI/bk0L82c2286Ko9s7+XE61PYJUSPIw4UQe0u1KAssg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744211935; c=relaxed/simple;
	bh=neMBjAfQvFLiQGn9l5qtqonTP5JJPsOXzqJ5oJj7+S4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CiZHr+dQW1BIda42T6SlXKKres1HtIbfI7jaeXYIQ5EVBDQ5q+JhUxVxBv5dbSNc5k/QT+AO2uWB6chWGTRTeHRgdfT1GmYxWmOmzDjK5Q/jByssnpaf+IdaGJUoYroVn2/jI8O1lGktopB1QZQtYSvQBDQ/O6R6S5fQuNP+iSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Atepkl2u; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Atepkl2u"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf680d351so5892385e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 08:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744211931; x=1744816731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DIx/sSq+dGHJdaQfwcLez7458y2PCQ4hjTFY5rQhv8A=;
        b=Atepkl2u9GX51rJ2+jWMMqOMHlA9CXIlv49qKsofXECfyjR0DLODgfDJawseVW3rUK
         R1fQaui7q83fZ+okdNeopcdse1LgvWMTrucG68fh40jjfIaeP411TRMoCoeP027/qBzD
         BogwmZml5sAfgkz+3t1iVNrDhLHXVi2yOrX0MlCj+/1g4SOPjH0VN7DO/zTKa14+zLHu
         MXZccbUheQo7HA3F9yewKDK0lRPjqAbQAKL1juiYdW+QaqdpMZgxASkMwxdLY/B7s9pq
         uRqvyz6IyT5GRI40qc4dTXKW080YzxpuB6Bov7F/aBu0bpmo1XrvavtKhzTVkacgB+Dg
         0I4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744211931; x=1744816731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DIx/sSq+dGHJdaQfwcLez7458y2PCQ4hjTFY5rQhv8A=;
        b=noaM3i+c40jOJZtdQLUN+0EUKs3zMs36iZUJqKCdO/BvxJ3oT/n0I5B8WAfOcLgaMA
         skXpAciUIriTuabRlhIMxYk/32mUH8BOtsNCxuyUA8kS4EUksxKtQ2zvzSDlDNSgle+h
         fg1CiS88AWPwCnfpoTTLp7QkVBSeM9lZqFVrCXaOx6HZbqdvWb7Qf2V+ytu/9RMguQsp
         e40s9+N/+qosFYtmjIfEmsYAH5HkSKftXgqn9cNP0lhaEZJr/YCKuAqP93+JcW1+Np+y
         mNMX3ZD7372ruSD5KcVY+I6dMIDqhRU/b0G7MRKBpaSxXzVVrOq7GhPUI5IAX5Pqw5JZ
         JcjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGH4USt8MyXktBIHMTCYwel8nXYQgkvFilYU8O9dKDNHakhy8j2/m3pqLcji1+o5JJzaMPdZwPf21/25M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWE4l22FcwhMwo23UGKS9W3x1tSpYf34rvqhjZWgLXsbTsK+hE
	xtelO/PV035JUJ9Drsom+EHokMBiutj51itfMBnh47EXOgHGuBnvPVcfP6jRPC8=
X-Gm-Gg: ASbGncuDZsaZZ6hN7fNjM5s23vaUifMoJmA6cqqExyKQVKa/YzfYw717a4/gulJB74L
	dACOGKhmk3QqqQdsTgITUM+iKVdNkI6bR8WUdGvcqbqUrRYw5VwBoGnFwt412FarSCJsyMGp1g4
	FcVwTmJZdstqIJxR5QL8jL/LDEN1gMdU5XqVfGCns4if1YLA7KKbA63aowDDV54QgfotwpJVYR8
	Hx2yQ2HjSWiQ5KBOLaqV0HoSa0SSJ8LemzV2gmmwYMhWTu08SSPUY6qBzrbc2BinFV/msLAXf6X
	bU/cc1/1RvijzJk3ZRE748GmKt0uRVfolNuQ+2680W0Zmw==
X-Google-Smtp-Source: AGHT+IH0W2q+QLXgY50bsUbLBMvi45RCcTvwgobZWuIbFNKFA/xqikUTmik8xCbwlkIbPAogtMZxiA==
X-Received: by 2002:a5d:64cf:0:b0:391:865:5a93 with SMTP id ffacd0b85a97d-39d87ff0a02mr3195457f8f.22.1744211930617;
        Wed, 09 Apr 2025 08:18:50 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.133.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d894001a4sm1916107f8f.98.2025.04.09.08.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 08:18:50 -0700 (PDT)
Message-ID: <472d6a3e-2d87-438f-b75b-c0e4eb0141d9@suse.com>
Date: Wed, 9 Apr 2025 18:18:49 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] lockdown: Switch implementation to using bitmap
To: sergeh@kernel.org
Cc: linux-security-module@vger.kernel.org, paul@paul-moore.com,
 serge@hallyn.com, kees@kernel.org, linux-kernel@vger.kernel.org,
 kirill.shutemov@linux.intel.com, linux-coco@lists.linux.dev
References: <20250321102422.640271-1-nik.borisov@suse.com>
 <20250321102422.640271-2-nik.borisov@suse.com> <Z93NW3za1ilzVxLK@lei>
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <Z93NW3za1ilzVxLK@lei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 21.03.25 г. 22:34 ч., sergeh@kernel.org wrote:
> On Fri, Mar 21, 2025 at 12:24:20PM +0200, Nikolay Borisov wrote:
>> Tracking the lockdown at the depth granularity rather than at the
>> individual is somewhat inflexible as it provides an "all or nothing"
>> approach. Instead there are use cases where it  will be useful to be
>> able to lockdown individual features - TDX for example wants to disable
>> access to just /dev/mem.
>>
>> To accommodate this use case switch the internal implementation to using
>> a bitmap so that individual lockdown features can be turned on. At the
>> same time retain the existing semantic where
>> INTEGRITY_MAX/CONFIDENTIALITY_MAX are treated as wildcards meaning "lock
>> everything below me".
>>
>> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> 
> Reviewed-by: Serge Hallyn <sergeh@kernel.org>
> 
> but one comment below
> 
>> ---
>>   security/lockdown/lockdown.c | 19 ++++++++++++-------
>>   1 file changed, 12 insertions(+), 7 deletions(-)
>>
>> diff --git a/security/lockdown/lockdown.c b/security/lockdown/lockdown.c
>> index cf83afa1d879..5014d18c423f 100644
>> --- a/security/lockdown/lockdown.c
>> +++ b/security/lockdown/lockdown.c
>> @@ -10,12 +10,13 @@
>>    * 2 of the Licence, or (at your option) any later version.
>>    */
>>   
>> +#include <linux/bitmap.h>
>>   #include <linux/security.h>
>>   #include <linux/export.h>
>>   #include <linux/lsm_hooks.h>
>>   #include <uapi/linux/lsm.h>
>>   
>> -static enum lockdown_reason kernel_locked_down;
>> +static DECLARE_BITMAP(kernel_locked_down, LOCKDOWN_CONFIDENTIALITY_MAX);
>>   
>>   static const enum lockdown_reason lockdown_levels[] = {LOCKDOWN_NONE,
>>   						 LOCKDOWN_INTEGRITY_MAX,
>> @@ -26,10 +27,15 @@ static const enum lockdown_reason lockdown_levels[] = {LOCKDOWN_NONE,
>>    */
>>   static int lock_kernel_down(const char *where, enum lockdown_reason level)
>>   {
>> -	if (kernel_locked_down >= level)
>> -		return -EPERM;
>>   
>> -	kernel_locked_down = level;
>> +	if (level > LOCKDOWN_CONFIDENTIALITY_MAX)
>> +		return -EINVAL;
>> +
>> +	if (level == LOCKDOWN_INTEGRITY_MAX || level == LOCKDOWN_CONFIDENTIALITY_MAX)
>> +		bitmap_set(kernel_locked_down, 1, level);
>> +	else
>> +		bitmap_set(kernel_locked_down, level, 1);
>> +
>>   	pr_notice("Kernel is locked down from %s; see man kernel_lockdown.7\n",
>>   		  where);
>>   	return 0;
>> @@ -62,13 +68,12 @@ static int lockdown_is_locked_down(enum lockdown_reason what)
>>   		 "Invalid lockdown reason"))
>>   		return -EPERM;
>>   
>> -	if (kernel_locked_down >= what) {
>> +	if (test_bit(what, kernel_locked_down)) {
>>   		if (lockdown_reasons[what])
>>   			pr_notice_ratelimited("Lockdown: %s: %s is restricted; see man kernel_lockdown.7\n",
>>   				  current->comm, lockdown_reasons[what]);
>>   		return -EPERM;
>>   	}
>> -
>>   	return 0;
>>   }
>>   
>> @@ -105,7 +110,7 @@ static ssize_t lockdown_read(struct file *filp, char __user *buf, size_t count,
> 
> Context here is:
> 
> static ssize_t lockdown_read(struct file *filp, char __user *buf, size_t count,
>                               loff_t *ppos)
> {
>          char temp[80] = "";
>          int i, offset = 0;
> 
>          for (i = 0; i < ARRAY_SIZE(lockdown_levels); i++) {
>                  enum lockdown_reason level = lockdown_levels[i];
> 
> ...
> 
>>   		if (lockdown_reasons[level]) {
>>   			const char *label = lockdown_reasons[level];
>>   
>> -			if (kernel_locked_down == level)
>> +			if (test_bit(level, kernel_locked_down))
> 
> Right now this is still just looping over the lockdown_levels, and so
> it can't get longer than "none [integrity] [confidentiality]" which fits
> easily into the 80 chars of temp.  But I'm worried that someone will
> change this loop i a way that violates that.  Could you just switch
> this to a snprintf that checks its result for < 0 and >= n , or some
> other sanity check?

How about the following:

diff --git a/security/lockdown/lockdown.c b/security/lockdown/lockdown.c
index 412184121279..47b47c4f7b98 100644
--- a/security/lockdown/lockdown.c
+++ b/security/lockdown/lockdown.c
@@ -114,9 +114,9 @@ static ssize_t lockdown_read(struct file *filp, char __user *buf, size_t count,
                         const char *label = lockdown_reasons[level];
  
                         if (test_bit(level, kernel_locked_down))
-                               offset += sprintf(temp+offset, "[%s] ", label);
+                               offset += snprintf(temp+offset, 80-offset, "[%s] ", label);
                         else
-                               offset += sprintf(temp+offset, "%s ", label);
+                               offset += snprintf(temp+offset, 80-offset, "%s ", label);
                 }
         }

It prevents buffer overflow but doesn't prevent buffer truncation.

> 
>>   				offset += sprintf(temp+offset, "[%s] ", label);
>>   			else
>>   				offset += sprintf(temp+offset, "%s ", label);
>> -- 
>> 2.43.0
>>

