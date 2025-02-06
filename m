Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51983802
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 01:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738804896; cv=none; b=mMORH7778eZlxCwil5VdbI6UevAq+Cqcq6g9W4d0wREvYvxuuWA3nJQ4938HBpDAyR7eor/bBaGnqDGAHa0Gk4ftBJVWTVLQ2rpiiFq2FFb9AlJ2U29dKKFCU8xzkzB4vxdib7uKgmubelO/kfjMyC6huep9l/xIIv8aUkEdsvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738804896; c=relaxed/simple;
	bh=85j0cLEH3Jun0j/a1VtVPQqXQhGntDxL37pEEZAMYpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cupHxmZ7OC9464yov30nixqdwmSkJQZLf59woUHL8oe7atbknokrw3k4Onc1iXBw3Wq8wd5vweSBHL7krn2iAjrGA2SqY4ZQ9w+RLWwEhLsTLDl2XR46i484QTwvRrbtFVolk2qvwB6ppLvkogXcXlUqUiZ0i9V83qDSI90hQsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=Nt2egcsK; arc=none smtp.client-ip=35.89.44.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="Nt2egcsK"
Received: from eig-obgw-5002a.ext.cloudfilter.net ([10.0.29.215])
	by cmsmtp with ESMTPS
	id fTystlaTlf1UXfqaDtskuf; Thu, 06 Feb 2025 01:21:33 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id fqaCtqd1MdY0ffqaCtxQMq; Thu, 06 Feb 2025 01:21:32 +0000
X-Authority-Analysis: v=2.4 cv=NoUacNdJ c=1 sm=1 tr=0 ts=67a40e9c
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=6Vi/Wpy7sgpXGMLew8oZcg==:17
 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=7T7KSl7uo7wA:10
 a=Jz-cYIOdNbgjfAwdiPwA:9 a=QEXdDO2ut3YA:10 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dJiZry27tB91UlxKqxiEn2cr9OPE+9eec0f5I/cTcDQ=; b=Nt2egcsKTMzNithWbglF+twmWZ
	6MUw7W2PF0UEbz/421fpnTmVzcuKK8sGBKhI4Stsggmn6Ec3WcaM5kpVGNfKJFcb5iQZ7qRD/uASg
	TaEVwSN49B4MQ9SnqJiFB/mGpPqV+cvoneGIL7ekM2HaxcXOJLrfSeHexkG/wrhO+36f1mcNB7bNW
	IlwaraHn1KwGSXwu+UbDg1mShqSlEwQgUo/HlgIBm/qx8mMHvHipW6KbtHyZ5BUwDoRwZzfQoIac8
	Rno32jjDnLFPhavYys0R9Nv5/DhrHIoSN3U5RDpZNhRWQyHEL9b6sJRW6xG+2Y6Bm9G6JL3s6DBw/
	jYHoceyA==;
Received: from [45.124.203.140] (port=54605 helo=[192.168.0.152])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1tfqaB-00102L-1x;
	Wed, 05 Feb 2025 19:21:31 -0600
Message-ID: <08963f1d-7ae8-4fc4-a7dd-133e314c0fb0@embeddedor.com>
Date: Thu, 6 Feb 2025 11:51:12 +1030
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] fs: hpfs: Avoid multiple
 -Wflex-array-member-not-at-end warnings
To: Al Viro <viro@zeniv.linux.org.uk>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <Z6GM6WIg8f0Ql30E@kspp> <20250205130308.GC1977892@ZenIV>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20250205130308.GC1977892@ZenIV>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 45.124.203.140
X-Source-L: No
X-Exim-ID: 1tfqaB-00102L-1x
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.152]) [45.124.203.140]:54605
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKQOrDfy3Gi6E3Iw01S1cMSqZVmnpukOqrPVqNu6ZLyciLcPfI/CUb/TUeMuKKCn/CqvhB5KS0Ylwys7JPYdxHHxxBN42kPLF1eO7nJL6FMDXaO6XWv3
 GEOW9gjh6ROWUxbKqo+exdGeLFiDMKMkQdWGnQvkQSP9cgx+8OlLYiJHU1Si7kseqtARC9dHoID8sf5B8utUSXFKXrdPZZYN4n/8IhaKRsHwKvNyUdhxdH5t



On 05/02/25 23:33, Al Viro wrote:
> On Tue, Feb 04, 2025 at 02:13:37PM +1030, Gustavo A. R. Silva wrote:
> 
>> +#define anode_btree	container_of(&anode->btree, struct bplus_header, __hdr)
>> +#define ranode_btree	container_of(&ranode->btree, struct bplus_header, __hdr)
>> +#define fnode_btree	container_of(&fnode->btree, struct bplus_header, __hdr)
>> +
>>   /* Find a sector in allocation tree */
>>   
>>   secno hpfs_bplus_lookup(struct super_block *s, struct inode *inode,
>> @@ -27,7 +31,7 @@ secno hpfs_bplus_lookup(struct super_block *s, struct inode *inode,
>>   				a = le32_to_cpu(btree->u.internal[i].down);
>>   				brelse(bh);
>>   				if (!(anode = hpfs_map_anode(s, a, &bh))) return -1;
>> -				btree = &anode->btree;
>> +				btree = anode_btree;
> 
> Just for this - NAK.  And then you proceed to add dozens more of the same.
> 
> If it looks like a variable name, it must not turn out to be a bloody macro;
> if a macro expansion depends upon a local variable with given name existing
> in scope of its use, make that name an explicit argument.  You manage to
> violate both.
> 

Yeah, so the story is that I originally wrote this patch using container_of()
to directly replace all those instances of `&anode->btree`, `&ranoce->btree`
and `&fnode->btree`. But I really didn't like how it turned out, so I changed
it to this form at the last minute, and well, as you pointed out, that wasn't
the best decision.

OK, so the options I see are either using container_of() directly (as I
originally had it), or write a small wrapper to keep the lines shorter.
Probably something like this:

#define GET_BTREE(ptr) \
	container_of(ptr, struct bplus_header, __hdr);

and then of course just using it like this:

	btree = GET_BTREE(&anode->btree);

-Gustavo




