Received: from mta-outp-cfd-1.case.edu (mta-outp-cfd-1.case.edu [129.22.103.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC8325D1FC
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=129.22.103.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038205; cv=pass; b=TZXLtHZIvx2s+uuRL5plItfwoToG64a6IL/caUxlm0PkeG5Y7XOc6DxSK5C24dBzT/mw83t9i5yDnmSRsA8tqlEK14Tl4TNZPjEBVWEDPtDZSu71dZy3rGg9j3X/5KPG3rG7/H9l9R3nuAC7f5HCbSxZZbgeHRxalD848OBUrWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038205; c=relaxed/simple;
	bh=EU6XUdX+aqjSGI5nezCzcOSTMPFuEyMvb8G98jawzGk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eMDzB+XbOPvjC+ATJC37S5d4H7T3pQMxjvOURxp257wzQjGbO9mQGzbZ2Xa11WxBghGb2TlHZsMS+Aa/3DyTvMe8bjD31Drs7rU26RgxXuKk26CYJ1ycO9hedC6P7OA2GDYPvC3MI0a8CYZ/LP5lh1cOvM86G9tTsBTgLtKEnUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=case.edu; spf=pass smtp.mailfrom=case.edu; dkim=pass (2048-bit key) header.d=case.edu header.i=@case.edu header.b=WMob1Uuk; arc=pass smtp.client-ip=129.22.103.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=case.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=case.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=case.edu header.i=@case.edu header.b="WMob1Uuk"
Authentication-Results: mta-outp-cfd-1;
       spf=pass (mta-outp-cfd-1.case.edu: domain of case.edu designates 209.85.219.69 as permitted sender) smtp.mailfrom=case.edu ;
       dkim=pass (Good 2048 bit rsa-sha256 signature) header.d=case.edu header.i=None header.s=g-case;
       dmarc=pass (p=REJECT sp=Undefined pct=100 dis=NONE) header.from=case.edu;
ARC-Filter: OpenARC Filter v1.0.0 mta-outp-cfd-1.case.edu 692581564
Authentication-Results: mta-outp-cfd-1; arc=none smtp.remote-ip=129.22.103.228
ARC-Seal: i=1; a=rsa-sha256; d=case.edu; s=cwru-mta; t=1746038201; cv=none;
	b=gDTTkMomE2GajE6tnM4Npy2kygmHS/WeKzdtGUKXd9rCoQIgALC8+B2RkK56IBrIV3yWnLdxoDoZ0HajZxsCpFamUwapUOKoJJASm2rGJhoazQ+/BkZ+5nAKFDb8sr+sJoTxBcx823pZ3flbG4OplmMPb15IAEKmjpXE5L0Rf1LE2Y5YWCPNTXClTTy2xidh+ZY29NQHik70qzIgKwEA9qCNdcq9s7EFgFe2GTqOqabx02fVfp7DCwUD76AWplNpg7tXNmRAP214/0UcgHABFTpPI1VGcwaJ+uGVxa1TPeVUBCMljdiaBc4X6Oc+QsnNaJ2ceZLP3F+h5iKKYG5wcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=case.edu; s=cwru-mta;
	t=1746038201; c=relaxed/simple;
	bh=EU6XUdX+aqjSGI5nezCzcOSTMPFuEyMvb8G98jawzGk=;
	h=DKIM-Signature:Message-ID:Date:MIME-Version:Subject:To:From:to:
	 subject:message-id:date:from:mime-version:dkim-signature; b=EAVnsOI+rmIcx2+V28sV+0nPLQRt2XEWxKA/VA/+m0k1mY9FfSh/apgfZqn/bnaTMk8rH3ZuzJ3f0wLM4DA7eBYeukMMx/xJcRGawOGA4VRDeQx/3QZVBAusKkbkLv6H0NIM1nfWAixl2xjFxodaOC7ps1HBkoBDyTFkdn4gTP3MJEFVC+ZR/KBpoOOm32r3Gj7u6Y8ic/ylVGhDDJJPr68eDDr8M773lPuwrXHkD8cZ9SwcCSBLuezPtyMKLRZBaPbnYkbO3ntbUza3yfyHBT8bI95HdIemn7LaFy36uNLlzb2VyAEk+lGJKkUSRUrlQxUMh5nUXZr5y7R9IO0oPA==
ARC-Authentication-Results: i=1; mta-outp-cfd-1; spf=pass (mta-outp-cfd-1.case.edu: domain of case.edu designates 209.85.219.69 as permitted sender) smtp.mailfrom=case.edu; dkim=pass (Good 2048 bit rsa-sha256 signature) header.d=case.edu header.i=None header.s=g-case; dmarc=pass (p=REJECT sp=Undefined pct=100 dis=NONE) header.from=case.edu
Received-SPF: Pass (mta-outp-cfd-1.case.edu: domain of case.edu designates 209.85.219.69 as permitted sender) client-ip=209.85.219.69
Received: from mpv-out-ksl-1.case.edu (mpv-out-ksl-1.case.edu [129.22.103.228])
	by mta-outp-cfd-1.case.edu (Postfix) with ESMTPS id 692581564
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:36:41 -0400 (EDT)
Received: from mpv-in-cfd-1.case.edu (EHLO mpv-in-cfd-1.case.edu) ([129.22.103.211])
	by mpv-out-ksl-1.case.edu (MOS 4.4.8-GA FastPath queued)
	with ESMTP id DCC26241;
	Wed, 30 Apr 2025 14:36:41 -0400 (EDT)
Received: from mail-qv1-f69.google.com (EHLO mail-qv1-f69.google.com) ([209.85.219.69])
	by mpv-in-cfd-1.case.edu (MOS 4.4.8-GA FastPath queued)
	with ESMTP id PDU47045;
	Wed, 30 Apr 2025 14:36:40 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8ed78717eso3731506d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=case.edu; s=g-case; t=1746038200; x=1746643000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:cc:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4A2sHSHRpt5kileLgP7Ygf59P4BM8A8KvqW9VICqQJ8=;
        b=WMob1UukXzW73wYrbME5SBj3K7wdeURDsWauKblE6OIkwshVOcmvhcifdwFCJONENV
         3ss1w5x+g0tmVKo4xFUTPE2pCCiCoLe3H4GbCYe0t8EIape7NXi5FNaWIbMIB2yLG/tz
         hQ1s16gJci1x+/HpH6XpQdD6FiE9BZK00826CNK2pbc3CaElM0yGO4iYijVckVr+m+uT
         SiJKN9NpR2SKpqVrkGZV7r/HK340iwFiDqE+zq4mmzzEja8wdG+ERQrUcM4j20qLu+78
         SojBmASWxXpQEmr3eAJiYaxfa3u6qoVOHELrhJVEt19GG5Tg553u0ZDx/MDkOTZDVmqD
         0y1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038200; x=1746643000;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:cc:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4A2sHSHRpt5kileLgP7Ygf59P4BM8A8KvqW9VICqQJ8=;
        b=Yd6nemCSXmVoiFPMnHymSSRP9j1lecfIEDgEx32G7h7nsfJtMhbinif2YMwEmFPVVC
         tTJk3nz3WavgOK0zyFkfAZDfZApSvddqiR1sl1pUe4FDWO4IiqBMUzomxlJl7l9x+Y+Z
         gu9llTCKdCT8FNwFKPgE9ilGI7P4Sgi5ltqaVvrU9XEaeL0OFQWygojqKuURkWrQqSuS
         5IKsNNlnc9ztPDwS6+6HZIjTeBy0SVc1i+Fi9JrXeT0Pth14SakRPMykel0Htrv6pNR3
         BdWV7HcYhX6Js176VT/kkTGmrST0MPNZMjxK+jg+9EG6tzzJB0qeGIrAyZ/Y9voryM2J
         WMRw==
X-Forwarded-Encrypted: i=1; AJvYcCXphnusEaUQ7hyL7Gp+y5BaDhjruVJQ12jM8fla6zS1vqdOAMCT0TBec43uvLRKZyyo6Im1uc4sXMd2lu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsDTLSPvZonGTGEWc0WpK/kHQeqGtwH8XHi40DGa290Lws9MWN
	imiyQItRt5xN7GD34mxlXKmvse33w6/MpyWsM9Yls9On7GhouBvPo77Hi31wIqGqFYfdO4WbdAG
	5l7SJWaEnN2kFPtE72XfBvOc27BOREwZIbx3MJNAb+Whbx8TKFbtc7LkxCE7mjSg=
X-Gm-Gg: ASbGncuOKMRMCXeAynpvi6PoDfRa4uN5J9wOzKnp0JTavYi4VZJJxOwyoIbRrEEgL6Z
	V7sVrvUIxoy6rX5yH8gMJU2eGKWuHT4kAq/jnAxJmZC/wfZse8emwF40CfDYjFSinuvXp0BUFOs
	N8kDXZIadHi3ygqZ7HNzfGfAP9RxGYpVoHDMuCjyVvbmS5FnlRTWg2sDH0pOxtsndeCEaYUJXuR
	OVgEvccG+/y0k1aNPl0YNIDgWRNpXWoTKb9RMWMUY9jqtsXqPzGcVQekOP0awOz6A5r3Ypw5Gqj
	/Ryxt+euCEy1koHuv1fA58atjlaGNmYMNQpqjVs=
X-Received: by 2002:a05:6214:2608:b0:6d8:ada3:26c9 with SMTP id 6a1803df08f44-6f4fce82c1cmr75631046d6.10.1746038199755;
        Wed, 30 Apr 2025 11:36:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH35qCABhwlYLbQIDwzv5bajwn1aPMXtEgjqFfvGVkAXgxHfM/i/R5Qp8C0mRFyalrWwP4+4w==
X-Received: by 2002:a05:6214:2608:b0:6d8:ada3:26c9 with SMTP id 6a1803df08f44-6f4fce82c1cmr75630596d6.10.1746038199357;
        Wed, 30 Apr 2025 11:36:39 -0700 (PDT)
Received: from [129.22.8.211] (caleb.INS.CWRU.Edu. [129.22.8.211])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4fe70a07esm11327886d6.57.2025.04.30.11.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 11:36:38 -0700 (PDT)
Message-ID: <b548ee65-3a54-43d7-aa6d-36e31cbf16f9@case.edu>
Date: Wed, 30 Apr 2025 14:36:37 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: chet.ramey@case.edu
Cc: chet.ramey@case.edu, Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        Etienne Champetier <champetier.etienne@gmail.com>,
        Marc Dionne <marc.dionne@auristor.com>,
        Steve French <sfrench@samba.org>, linux-afs@lists.infradead.org,
        openafs-devel@openafs.org, linux-cifs@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] afs, bash: Fix open(O_CREAT) on an extant AFS file in a
 sticky dir
Content-Language: en-US
To: Jeffrey E Altman <jaltman@auristor.com>,
        David Howells <dhowells@redhat.com>
References: <473bad0c-9e38-4f8b-9939-c70c52890cd2@case.edu>
 <433928.1745944651@warthog.procyon.org.uk>
 <3d19dc03-72aa-46de-a6cc-4426cc84eb51@auristor.com>
 <666533.1746029681@warthog.procyon.org.uk>
 <8f6bd09c-c3d8-4142-938a-3fab5df7bd64@auristor.com>
From: Chet Ramey <chet.ramey@case.edu>
Autocrypt: addr=chet.ramey@case.edu; keydata=
 xsDiBEEOsGwRBACFa0A1oa71HSZLWxAx0svXzhOZNQZOzqHmSuGOG92jIpQpr8DpvgRh40Yp
 AwdcXb8QG1J5yGAKeevNE1zCFaA725vGSdHUyypHouV0xoWwukYO6qlyyX+2BZU+okBUqoWQ
 koWxiYaCSfzB2Ln7pmdys1fJhcgBKf3VjWCjd2XJTwCgoFJOwyBFJdugjfwjSoRSwDOIMf0D
 /iQKqlWhIO1LGpMrGX0il0/x4zj0NAcSwAk7LaPZbN4UPjn5pqGEHBlf1+xDDQCkAoZ/VqES
 GZragl4VqJfxBr29Ag0UDvNbUbXoxQsARdero1M8GiAIRc50hj7HXFoERwenbNDJL86GPLAQ
 OTGOCa4W2o29nFfFjQrsrrYHzVtyA/9oyKvTeEMJ7NA3VJdWcmn7gOu0FxEmSNhSoV1T4vP2
 1Wf7f5niCCRKQLNyUy0wEApQi4tSysdz+AbgAc0b/bHYVzIf2uO2lIEZQNNt+3g2bmXgloWm
 W5fsm/di50Gm1l1Na63d3RZ00SeFQos6WEwLUHEB0yp6KXluXLLIZitEJM0gQ2hldCBSYW1l
 eSA8Y2hldC5yYW1leUBjYXNlLmVkdT7CYQQTEQIAIQIbAwYLCQgHAwIDFQIDAxYCAQIeAQIX
 gAUCRX3FIgIZAQAKCRC7WGnwZOp0q069AKCNDRn+zzN/AHbaynls/Lvq1kH/RQCgkLvF8bDs
 maUHSxSIPqzlGuKWDxbOwE0EQQ6wbxAEAJCukwDigRDPhAuI+lf+6P64lWanIFOXIndqhvU1
 3cDbQ/Wt5LwPzm2QTvd7F+fcHOgZ8KOFScbDpjJaRqwIybMTcIN0B2pBLX/C10W1aY+cUrXZ
 gXUGVISEMmpaP9v02auToo7XXVEHC+XLO9IU7/xaU98FL69l6/K4xeNSBRM/AAMHA/wNAmRB
 pcyK0+VggZ5esQaIP/LyolAm2qwcmrd3dZi+g24s7yjV0EUwvRP7xHRDQFgkAo6++QbuecU/
 J90lxrVnQwucZmfz9zgWDkT/MpfB/CNRSKLFjhYq2yHmHWT6vEjw9Ry/hF6Pc0oh1a62USdf
 aKAiim0nVxxQmPmiRvtCmcJJBBgRAgAJBQJBDrBvAhsMAAoJELtYafBk6nSr43AAn2ZZFQg8
 Gs/zUzvXMt7evaFqVTzcAJ0cHtKpP1i/4H4R9+OsYeQdxxWxTQ==
In-Reply-To: <8f6bd09c-c3d8-4142-938a-3fab5df7bd64@auristor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mirapoint-Received-SPF: 209.85.219.69 mail-qv1-f69.google.com chet.ramey@case.edu 5 none
X-Mirapoint-Received-SPF: 129.22.103.211 mpv-in-cfd-1.case.edu chet.ramey@case.edu 5 none
X-Junkmail-Status: score=10/90, host=mpv-out-ksl-1.case.edu
X-Junkmail-Signature-Raw: score=unknown,
	refid=str=0001.0A002105.68126DB9.0024,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
	ip=0.0.0.0,
	so=2016-11-06 16:00:04,
	dmn=2013-03-21 17:37:32,
	mode=single engine
X-Junkmail-IWF: false

On 4/30/25 1:26 PM, Jeffrey E Altman wrote:
> On 4/30/2025 12:14 PM, David Howells wrote:
>> Chet Ramey <chet.ramey@case.edu> wrote:
>>
>>> Well, except for CMU's report.
>> Do you know of any link for that?  I'm guessing that is it was 1992, 
>> there may
>> be no online record of it.
>>
>> David
> 
> https://groups.google.com/g/gnu.bash.bug/c/6PPTfOgFdL4/m/2AQU-S1N76UJ?hl=en

Which of course just claims they reported it, but doesn't include the
report itself.

But Jeffrey's message seems to indicate that IBM addressed this particular
issue in AFS 3.2.

-- 
``The lyf so short, the craft so long to lerne.'' - Chaucer
		 ``Ars longa, vita brevis'' - Hippocrates
Chet Ramey, UTech, CWRU    chet@case.edu    http://tiswww.cwru.edu/~chet/
