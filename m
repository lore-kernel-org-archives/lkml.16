Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224611E9B24
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739257423; cv=none; b=RzsfxJ8FFcPCL02DdAPee+2jYCETpCabtZ2RoAEtflkBD5KpDGBQfHZOy01dX36CcKSOQ26kCdfGO4gJRBYmVUuINL1JEeZAICXwo4B4i1R+VYNy+W7ZdirPwPbKAXI7sW7yYZKcMZYinJc+tmIDnxba5roDgJal30HU9xirk6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739257423; c=relaxed/simple;
	bh=vZLXZjjOPjiqAyN1pMAP9QZspcSLtGUZeLCcavpZogk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qnnyCbUqFx3KATcIVm/czc8GO2XSdyqmKlgJVNYCJIkDl5tcHc+CgoV2F3YksFmZVJqj4JRA6MV4dzPzjoa8gIafPRErQmQEePXb5PAsx5LUNGSRrsDBGMeButsqdGcbUoVsIsZ/OrP0/NjLnY2rLpid561ld1dwYpodyDsHgkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=OcOrIuDk; arc=none smtp.client-ip=44.202.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="OcOrIuDk"
Received: from eig-obgw-6001a.ext.cloudfilter.net ([10.0.30.140])
	by cmsmtp with ESMTPS
	id hjJUtYh6IzZPahkIvtZPVP; Tue, 11 Feb 2025 07:03:33 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hkItteAl02Zy0hkIutaO2m; Tue, 11 Feb 2025 07:03:32 +0000
X-Authority-Analysis: v=2.4 cv=Q4EZ4J2a c=1 sm=1 tr=0 ts=67aaf644
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=6Vi/Wpy7sgpXGMLew8oZcg==:17
 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=7T7KSl7uo7wA:10
 a=PX_z9cZZlryqIJpxFbEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZAqk/kPjeF1znOItEkmi2wBaDhf/+EtLCrTaF/cU7Eo=; b=OcOrIuDkLC299Gj8idUtnL1VW9
	TqiW36pf5h+tnVNYjjtCRvpQrQCKj1h+UScGZc2atMBJrL6GgSFaDqQhWC+J4X3RspYozlNEiBAgd
	Ksu06uzGLhjbcMM5HBYE3CQN6m1SdA38rb/+nG/sodd6mdNmXPY4DFrd87uJjbMNeaSrjRwqaRPZf
	eJgqyKsivAdZquDbp271nrwAhzs94o3kONqHVWIz2GMyrKda85xHVbMRHGUydxsSxqmoS6e5EYSoQ
	rPJNTctoFog1Ieys0IUP9L2bEnHU6QqGN5UBgEVO9MHdLPonU7XXwrmI4nk6rT6UVbFf0hHGsuzFm
	35jt3xCA==;
Received: from [45.124.203.140] (port=54947 helo=[192.168.0.153])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1thkIs-000XwA-26;
	Tue, 11 Feb 2025 01:03:31 -0600
Message-ID: <55e010d1-4f98-40f1-b009-78580f895b86@embeddedor.com>
Date: Tue, 11 Feb 2025 17:32:57 +1030
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3][next] tty: tty_buffer: Avoid hundreds of
 -Wflex-array-member-not-at-end warnings
To: Jiri Slaby <jirislaby@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <Z6QvAZxiQusdaDkH@kspp>
 <daea13b0-137c-4ab5-8388-1d46919b8609@kernel.org>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <daea13b0-137c-4ab5-8388-1d46919b8609@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 45.124.203.140
X-Source-L: No
X-Exim-ID: 1thkIs-000XwA-26
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.153]) [45.124.203.140]:54947
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKl5YbjWZoANRm3Kj1hDuUKxOjE+CyPNZXI5jD3bJ+5CGxZZ9YtTM7ICOK/VobNvHOo8zL3YRRUuN96nk9BLx9VTMXu5C1TJa91QqADgvv29e7YPlHJj
 L+V8oGKB0BczzMqlHGsRbdTM8C3OkiH2LIAoGxAxcSmA1Zl35QldDCzDfr1f0U8N4vjXaQTlXx5Zgqmc+dHLwRJGCVrpM9V064JgyUIhHONApBhX+6iZdn7H




> 
>> @@ -576,11 +579,14 @@ int tty_insert_flip_string_and_push_buffer(struct tty_port *port,
>>   void tty_buffer_init(struct tty_port *port)
>>   {
>>       struct tty_bufhead *buf = &port->buf;
>> +    struct tty_buffer *buf_sentinel;
>> +
>> +    buf_sentinel = container_of(&buf->sentinel, struct tty_buffer, hdr);
> 
> Bah, so this is ugly and even dangerous if someone adds a member to tty_buffer outside _hdr.
> 
> We should link headers in the list, it appears.

What should that patch look like?

--
Gustavo
