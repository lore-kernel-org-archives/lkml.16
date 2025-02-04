Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B72121127D;
	Tue,  4 Feb 2025 13:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738674420; cv=none; b=aNryl5CLgnXSjcwlk7lmLCXS1xEcdYo+FXwHHCjaXFoKi42AqhwnRaKXvtz1qBrd4gm34+7Lt5K3PsBsvRoFEwm//Dsvt6/Gaexh0gooA/lii1U5klKEspDrH5VDdgRsTAVHQOPcmRt1I4EfR/kKW+TGL4j2XkBd9pLKTbop+O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738674420; c=relaxed/simple;
	bh=2yjIa/gYvxvIpPrLvTh6dm6Hw5rnrXT7n/EHoV/hjSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LSEqTmyLcnuq1cc7v2z5tHDudxv5ynQsZ2iCbDPHB0s0zQfO8Hy9TYespba9EtSOKWvk4bULl3cnQfyryZTNcWthR6IJmhmbNQ1H7JkEjoTVKXu8PGH2mcExt5q1cP4KfDWrHHfQw6/ssA9DO74PGjRkoAciSaawbcWl3zUarOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QwuqUM+Z; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QwuqUM+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1738674385; x=1739279185; i=w_armin@gmx.de;
	bh=3nMUmjZ6SzIybrs1YTTzsTCpRbyyW9/v2yB7+kADQMA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QwuqUM+ZtDW2d8djGS9nj7OQIye3qZgIfHpP944B22rnwJ4ryOIYtTTwan9cchTd
	 jHzoSyrD03HzYBXZJG9Wu65f+H08wzeo0go1lP2DsZRv5wV8l8YUnMCj/BPHzBNzt
	 hA17DdG9i8ga6lL2eLKDAIEQR3VkIFBlLmZh6GxtMSc/8AZ5ylLXcnuy/IK2NdK38
	 yMtsIHWvNMP8W8E7y+AGT+5e6mPlfTOtECjgfmUO/BnImYo2Tn7aNsyRKmb05FrlP
	 AzsBjjjgknJFVp0mu+f6wwERvy1CuyYbODOajvSsh3JyPlXVw4WKXeiA5CGk7GFTO
	 uQLWtILrHX7WyhPUbw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.20.206] ([141.76.8.142]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MK3Rs-1tzjQt0wgw-00PByQ; Tue, 04
 Feb 2025 14:06:25 +0100
Message-ID: <cbea0f2a-a66f-4ed8-9b19-6010b188f69f@gmx.de>
Date: Tue, 4 Feb 2025 14:06:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] platform/x86: hp-bioscfg: Use wmi_instance_count()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: james@equiv.tech, markpearson@lenovo.com, jorge.lopez2@hp.com,
 jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 platform-driver-x86@vger.kernel.org, corbet@lwn.net,
 linux-doc@vger.kernel.org
References: <20250203182322.384883-1-W_Armin@gmx.de>
 <20250203182322.384883-5-W_Armin@gmx.de>
 <a02aa367-2ce8-ba6d-adc7-b91552566142@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <a02aa367-2ce8-ba6d-adc7-b91552566142@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pbyC/Aj0TUVRa0zJcatrDoyo2v/HsbWObtnz3K8eJ2AiNZ4WoQD
 2XfPhyXxGMrZ5D+z3YlPpy7bOATjGNzNpkvDnkpLw/Fcd7O7brSsbCZRDw3PC6pBvLTMS6t
 cfdkWqMGwsDm3/+9cHpJUana/GP6v0kMQmXoU2G1BnM5pAws5/QQA34dXYPYBlFfFZtNeOh
 LzMcv33+rXUj4nOjSEnOA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:42e13bcLyAc=;1+JDnpgQpq8HwvUMrz+coya/Rjb
 hgGa1S+/WqNZqjdNnC3rr9ig3oA+kYSVv3VEXchmAz0Qm/SuiHNthmuCPqmmZFlN/K9KsmRPC
 fQhSQ1maq2kCCTp4ijqM6aKxx0nVYzqAnDhFZZBqh1z5fYWKo21wEdRbuJN65FNo5I7PEijrO
 eC7xFU/JbX9ic3c3zsmrmNa6EufU/3e+Mpt7jVTkLQLuOAogWtkuaZthHQXrvT9SAFNd840d6
 Oixy7LxWcMAAgLWUhAa7EdwpbLTDeo3yJULLD0TC6zLEH4pKwiuVcTPBCnzSTGaJEfO4rk4fr
 /mWKlpX758gNjafPGGEHpvaSIwXcSM+weOTpIAfGq9gr6FS68xmIga6ZB0OoeNiyZNMd6Adyx
 x7ZH25dU4up3n+mvRrvAYeMToZhrFlAtEKoNwIssR/RzjhC2K93HmPcgBRaC7Yg7UHreUexoo
 lLqXJoT8qjHle44LVQetzf/N2mXF5RuDwru9rwY6X91EHKF9P4jtq8iYT/gdRXW0v79IBFe3H
 RzcPI+yPNFYXRZZnaNf5nakc2FyGHQ7h4XH/1Mu2bYPt7TO5NNDZ/zRf3IfIEqanPA5oaEoRD
 bfdJ8g3bmzOh/WgCEHBW3ynz80YADJQ2Zecr2Key386hooXYBWwobsdKLVyQBEeJrNpke8tqN
 oASM74ywAtWeRoPZywWjNpGBpVABTxbw56ake+scOQ4DKCnSDSEqfyziuDtq0Nf33IBLFgcjp
 r0/OJxqp/H/fWSM+yeNylUQxXUVr5Aqnp3F0U46/nYuCT+J5QhyzNCnB2wYwPjQCKsVKFL6DL
 6ovtPddDNJiNU0CDXqocDfG7um6HU2kb67CpXKcaFRBvflodUJ9bF130iT4lW7Uvv25OaQ4fp
 RaaQr/fkwEwkaiwtihqmYqtxIMSGGYrJj4vzkBPeQ4y8Ig/V7czVZO9UWwNVLrRx+WPNqJdUs
 ZTFMDJDI8GdH93YwYhR/XEpekUiJaEwcUrWMKF5rmCNtnkETUqX5lumPn3zW6YgJj56McEAwx
 uBtBQKw5ehLkSJFAuDP+hRet3Fa91RloOSLUG0AziHEcnGfG0WjmtHw9gZXjDvxHS3PPdOnob
 1kDrwV5u/MKTBw+I91ePB+q1/XsO4pHA+wjLgSj6BieFWmmvzUJiYycetd5nGf/hbGhvfJpcu
 JZckGmvWJGOKgl30c2RI1iTYZ0Y0pS4VvfyJlW3b7BZM5ozelldPLQY/y2vE5d7goFrJBIYcC
 RMPeWxYQQHq6nENU2q36GTg8TNCy+Pz3oVaURrLjw1Az0/9ANOQFL5oAXiDXRaDxyjH3YZH8a
 ktCKBpsSJFGR01QsiqpbP/kTr27bL1hG7bMKzqdlKznOhqBl5mQLjki3VQ1aclHOGcWI55i1i
 lrShun8DQCOV8liBy5rDFSK0gTHAYYCyoAmucX5/O/YzTXH4MStP9EVQtmWNgte5NLuOSjpRC
 wtM9SyjMyyoNxfCvjJ/XFHVSHKNI=

Am 04.02.25 um 11:37 schrieb Ilpo J=C3=A4rvinen:

> On Mon, 3 Feb 2025, Armin Wolf wrote:
>
>> The WMI core already knows the instance count of a WMI guid.
>> Use this information instead of querying all possible instances
>> which is slow and might be unreliable.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 13 +++++--------
>>   1 file changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/pla=
tform/x86/hp/hp-bioscfg/bioscfg.c
>> index 0b277b7e37dd..63c78b4d8258 100644
>> --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
>> +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
>> @@ -388,16 +388,13 @@ union acpi_object *hp_get_wmiobj_pointer(int inst=
ance_id, const char *guid_strin
>>    */
>>   int hp_get_instance_count(const char *guid_string)
>>   {
>> -	union acpi_object *wmi_obj =3D NULL;
>> -	int i =3D 0;
>> +	int ret;
>>
>> -	do {
>> -		kfree(wmi_obj);
>> -		wmi_obj =3D hp_get_wmiobj_pointer(i, guid_string);
>> -		i++;
>> -	} while (wmi_obj);
>> +	ret =3D wmi_instance_count(guid_string);
>> +	if (ret < 0)
>> +		return 0;
>>
>> -	return i - 1;
>> +	return ret;
>>   }
> Hi Armin,
>
> While it is the existing way of doing things, I don't like how the error
> is not properly passed on here. And if the error handling is pushed
> upwards to the calling sites, then this entire function becomes useless
> and wmi_instance_count() could be used directly in the callers.
>
The thing is that for the hp-bioscfg driver, a missing WMI GUID is not an =
error.
In this case 0 instances are available.

I would keep this function for now.

Thanks,
Armin Wolf

