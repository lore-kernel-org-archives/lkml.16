Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599271AC42B
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 23:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738193871; cv=none; b=GdD14X4W8v/MKqwA0ZYoq+pwUXw9VEGwA3u31vgwU6rS6ABCLIpfM81OGZQeO7n0uAvb5MMlZYJ5N3aJHJRsSQ3yy1g3xhFkS72lALfujDfMmTTgweMLJGREw20xoTn1Ze00KqO7O3Me1Nmmwe3sBWIPlbat34dMD33Tf9OD/BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738193871; c=relaxed/simple;
	bh=jMDBRsPaOHcFhnUw/Wv69LKyrOF6jC1i9MALjXLdOoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LJEaNLJ7fttdhEIUiCXbLc8HJtURJMMxcPpvdyAFLA47OtgZKPfsoEL1zXtk7ZauWDLSF3Nzh84uZYRUfabY2/LQtapxAdltgxSCMjess4fBVzevRYC+5H6olbWZJ2+5y4TfTxGZAz7ejXj1tGjqS26E5yZ424L077Zv4jmYiV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=y5uVgPnL; arc=none smtp.client-ip=35.89.44.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="y5uVgPnL"
Received: from eig-obgw-5001a.ext.cloudfilter.net ([10.0.29.139])
	by cmsmtp with ESMTPS
	id d8c1tBR9qf1UXdHbRtyFfa; Wed, 29 Jan 2025 23:36:13 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id dHbPtWAQWHEACdHbPt7jh7; Wed, 29 Jan 2025 23:36:11 +0000
X-Authority-Analysis: v=2.4 cv=HdLfTTE8 c=1 sm=1 tr=0 ts=679abb6b
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=3GLQtCDrk5mhnYkuwPoHkA==:17
 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=TBnyChJfKI2p-A7FU4wA:9 a=QEXdDO2ut3YA:10 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cqLhnexwQeVTpKw6kDdMPge95PVCfboLdmw4Sd7tyBk=; b=y5uVgPnL5JZOF2lNG0FIwzQT+T
	wO8/rTfUJcpIjRMoKUxPvIzfZ9FeKJcpLnxSy7MBADV4G6F4UkX5QAWrrTcUlXQF7qa0qeTk6OCnI
	WZqVihVPlZ14gzu82uRKI7/statE0rUTjJ2ToNs/wCuY/MLZDdBTfA/x7btNfvVLkHQdwwUp2wNoh
	bbUz1NZyosiBeOMRqZp2MUtVYkCrf87JwjzXAHk7l+lKz/uzM345nykQ9Ouw27xogIayyMetK5UwY
	LTrHwU3bXDkh1/n5iyqnEY+vuz/OnKiaRwjKphtLcy46ztUwjGn3jrufLIyGN50kXRR0X9VOP3dtH
	AeDrHw4Q==;
Received: from [45.124.203.141] (port=55136 helo=[192.168.0.153])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1tdHbO-003ScQ-2D;
	Wed, 29 Jan 2025 17:36:10 -0600
Message-ID: <7f165e66-a0ff-48e2-a3f3-d5405a66c867@embeddedor.com>
Date: Thu, 30 Jan 2025 10:06:00 +1030
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2][next] container_of: add container_first() macro
To: Greg KH <gregkh@linuxfoundation.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <Z5m76U5zh34WbeQY@kspp>
 <2025012955-hypnotic-patronize-8931@gregkh>
 <f6e24dfa-450e-4de6-87a6-6fcf7d83888d@embeddedor.com>
 <2025012921-dense-unplanted-952b@gregkh>
 <06aa1194-a7aa-4a5a-adb8-f6cd447d35d9@stanley.mountain>
 <2025012951-plenty-clang-1e2b@gregkh>
 <3979f87d-b7d7-48bb-b6ab-cd8165dbc3cc@stanley.mountain>
 <2025012940-hardhat-usual-fbc6@gregkh>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <2025012940-hardhat-usual-fbc6@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 45.124.203.141
X-Source-L: No
X-Exim-ID: 1tdHbO-003ScQ-2D
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.153]) [45.124.203.141]:55136
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAS08Vanqu0lWKyF2Jf4ari8VgCwqLGlb6x1lOR2E9jHtVxyshIEBtUFFUcoZ3+dseqZUqP9rIXtY7g2T2S9rTNlHT31mGEZkTGHNQMlJSgdL5uIVjbG
 /wEIFSnf6vOa8ODMjvNrDrw1sFvMuCco6JS4iQfWeJDf7ZJsAQaZXCPxsmC4YWtBEb6+jDDYpcZYLtWU0uRlVlWaZADO/qQ0hDW346rGSKf1t2LnTcc5NVTr



On 30/01/25 02:38, Greg KH wrote:
> On Wed, Jan 29, 2025 at 05:06:54PM +0300, Dan Carpenter wrote:
>> On Wed, Jan 29, 2025 at 02:14:14PM +0100, Greg KH wrote:
>>> On Wed, Jan 29, 2025 at 01:39:27PM +0300, Dan Carpenter wrote:
>>>> On Wed, Jan 29, 2025 at 09:34:07AM +0100, Greg KH wrote:
>>>>> On Wed, Jan 29, 2025 at 06:35:18PM +1030, Gustavo A. R. Silva wrote:
>>>>>>
>>>>>>
>>>>>> On 29/01/25 16:24, Greg KH wrote:
>>>>>>> On Wed, Jan 29, 2025 at 03:56:01PM +1030, Gustavo A. R. Silva wrote:
>>>>>>>> This is like container_of_const() but it contains an assert to
>>>>>>>> ensure that it's using the first member in the structure.
>>>>>>>
>>>>>>> But why?  If you "know" it's the first member, just do a normal cast.
>>>>>>> If you don't, then you probably shouldn't be caring about this anyway,
>>>>>>> right?
>>>>>>
>>>>>> This is more about the cases where the member _must_ be first in the
>>>>>> structure. See below for an example related to -Wflex-array-member-not-at-end
>>>>>
>>>>> That's fine, but that's a build-time issue, you should enforce that in
>>>>> the structure itself, why are you forcing people to remember to use this
>>>>> macro when you want to use the field?  There's nothing preventing anyone
>>>>> from using container_of() instead here, and nothing will catch that from
>>>>> what I can tell.
>>>>
>>>> The new definition has a static_assert() in it so it's enforced about
>>>> build time.
>>>
>>> Yes, but that forces you to "know" to do that in the .c file.  How do
>>> you know to use this, and if you remove it or change it to
>>> container_of(), it works just fine again.
>>>
>>
>> I guess my use case is different from Gustavo's.  For him, using
>> container_of() is fine.  We probably don't even need an assert because
>> once you see a struct_group_tagged() then you know the order is important.
> 
> Who knows this?  The developer?  What are they supposed to "know" here?
> I sure don't :)
> 
> Having some sort of "__must_be_first" marking for a field is fine and
> break the build if that doesn't happen.  Otherwise this is something
> that is not going to be used properly over time.

I'm currently dealing with this situation in the following way:

  struct libipw_hdr_3addr {
-	__le16 frame_ctl;
-	__le16 duration_id;
-	u8 addr1[ETH_ALEN];
-	u8 addr2[ETH_ALEN];
-	u8 addr3[ETH_ALEN];
-	__le16 seq_ctl;
+	/* New members MUST be added within the __struct_group() macro below. */
+	__struct_group(libipw_hdr_3addr_hdr, hdr, __packed,
+		__le16 frame_ctl;
+		__le16 duration_id;
+		u8 addr1[ETH_ALEN];
+		u8 addr2[ETH_ALEN];
+		u8 addr3[ETH_ALEN];
+		__le16 seq_ctl;
+	);
  	u8 payload[];
  } __packed;
+static_assert(offsetof(struct libipw_hdr_3addr, payload) == sizeof(struct libipw_hdr_3addr_hdr),
+	      "struct member likely outside of __struct_group()");

"We also want to ensure that when new members need to be added to the
flexible structure, they are always included within the newly created
tagged struct. For this, we use `static_assert()`. This ensures that the
memory layout for both the flexible structure and the new tagged struct
is the same after any changes." [1]

We could probably create struct_group_first() instead of container_first().

Anyways, so far so good.  For some reason I was under the impression
that you two guys wanted the container_first() macro.

OK, that's it from my side.

Have a good one!
-Gustavo

[1] https://git.kernel.org/linus/089332e703b681c8

> 
>> For me, it's code like I mentioned which does:
>>
>> 	p = container_of();
>> 	if (IS_ERR(p))
>> 		...
>>
>> And I did see you suggest that people re-write that kind of code, but no
>> one is going to do that.  :P  People know that container_of() is just a
>> cast in that case.  It works fine.  It's just a bit ugly.
> 
> It doesn't work if the field isn't first, so no, it shouldn't be working
> fine, and that should be flagged and fixed and never allowed to come
> back again.  Can't we do that with coccinelle?
> 
> thanks,
> 
> greg k-h
> 

