Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04B02C1E0D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 20:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745354914; cv=none; b=Tl8yVvv2gTCSox7xku0zD4nRG017qwR4DPZEk15X6pLCDhN2LvN+Wb4jDuZv53cx3kmxyKkplJgCD8v8WHukffvB5WqHz9M0PB09oaUzpXXjk6aEnAPsguQvkJkpFlManhpNIDBC2O/6oLvilT6cQwLGnKjjiem9M9a8gHb7lQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745354914; c=relaxed/simple;
	bh=1PMa1GtjPwOhkh5xt3apZJJy6KX7lzmKPmF/1MnQ4LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EH1u1V74zNtYUABgbKVwB2MuigPU3WECAP50ltMUT9uvkwv4dsvQcFtpJu/+ZBqy4Ga1TYwBiECcxYAFMVVOvxjAPm/o7yBHmUJEIf1nv9JbsYFrEsot4SCyikDla1jtZrW1phQjBEpjgI7b6OXnFPQ88Gc5ULlZSuZq1kCGlWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=Wm/+baGi; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="Wm/+baGi"
Received: from eig-obgw-6003a.ext.cloudfilter.net ([10.0.30.151])
	by cmsmtp with ESMTPS
	id 7BIBuUTmqVkcR7KXZuq5YW; Tue, 22 Apr 2025 20:48:25 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 7KXYuyxO1h9Zx7KXZuaLLR; Tue, 22 Apr 2025 20:48:25 +0000
X-Authority-Analysis: v=2.4 cv=GODDEfNK c=1 sm=1 tr=0 ts=68080099
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=DefJii25N9YVshmqbOOoLg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=23CoqXQl36Z2fpCMmvIA:9 a=QEXdDO2ut3YA:10 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KI0PP+6EV2eaVRZJdCLayQWjV4cEDbdXMHWY2GBxKW0=; b=Wm/+baGiTsQWqiYdaFX+w/QNL0
	fCPKk8W4MTU5MFe4EcZ/hb9xpM/b5NituU2IfrtVzBAGJeFajnhqmK3EtRna3LQvb0HbwMdErY6BZ
	xmshg1VRZ9qQOiAxEicbDdNDrTHXxO5Ncz5wLCdDmrMNRXn+Mx374mtIcC2IqJkkZknrz+0AQsGGP
	tm3Rc865Y3xiZY/lxrUQ3pDUJugQqW/zg1NXUiWQwt5lfzv+0xsi9CBbW7HzvUNtREDWOhruUNRLc
	Cn5t2abklVWiMbTZj0kCHDPkkOJZ6cIyPs6/V/r9NQZzDRr8btlu5ZzRF40hsA8Xjv/VdQT6l87uC
	ewdB3Oew==;
Received: from [201.172.174.139] (port=36052 helo=[192.168.15.14])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1u7KXX-00000001GYy-3AYh;
	Tue, 22 Apr 2025 15:48:24 -0500
Message-ID: <90038621-0c42-404e-b9e5-0c2b8ea53b5a@embeddedor.com>
Date: Tue, 22 Apr 2025 14:48:11 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2][next] kunit/overflow: Add tests for
 STACK_FLEX_ARRAY_SIZE() helper
To: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1745342381.git.gustavoars@kernel.org>
 <8cf48c3f9d8ef9b999d87cc0a822ffe539bf7a64.1745342381.git.gustavoars@kernel.org>
 <202504221339.65ED2943C@keescook>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <202504221339.65ED2943C@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.174.139
X-Source-L: No
X-Exim-ID: 1u7KXX-00000001GYy-3AYh
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.14]) [201.172.174.139]:36052
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLb4rvYEyl7Zzs67i5IaNyeo6btSB0CGMleSIdcpIgISct6M1jG369SzPvtD83KaJKf9gAFDgYzc+kavi6PQqPFPkVLMcgzMCJN/8on+/1A+3Gu45sHT
 TZrd/zghujld8xINrKatO2+f2WZwwrn9JDEF/ym6BG/yXuCMb9FM5AaBPhJOsVmowK9sD1Zif+i7PlExM83tIpPNe7YPacQbkL5ImBIFG01yO62vIb+5GY6G



On 22/04/25 14:39, Kees Cook wrote:
> On Tue, Apr 22, 2025 at 11:22:08AM -0600, Gustavo A. R. Silva wrote:
>> Add a couple of tests for new STACK_FLEX_ARRAY_SIZE() helper.
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> ---
>>   lib/tests/overflow_kunit.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/lib/tests/overflow_kunit.c b/lib/tests/overflow_kunit.c
>> index 894691b4411a..3beb497a44be 100644
>> --- a/lib/tests/overflow_kunit.c
>> +++ b/lib/tests/overflow_kunit.c
>> @@ -1210,6 +1210,9 @@ static void DEFINE_FLEX_test(struct kunit *test)
>>   	KUNIT_EXPECT_EQ(test, __struct_size(empty->array), 0);
>>   	KUNIT_EXPECT_EQ(test, __member_size(empty->array), 0);
>>   
>> +	KUNIT_EXPECT_EQ(test, STACK_FLEX_ARRAY_SIZE(two, array), 2);
>> +	KUNIT_EXPECT_EQ(test, STACK_FLEX_ARRAY_SIZE(eight, array), 8);
> 
> Nice! Can you add a 0 test for "empty" as well?

Sure thing. I had actually added it, but for some reason I removed at the last
minute.

-Gustavo
