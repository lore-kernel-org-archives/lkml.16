Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB5328EA42
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 20:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649304; cv=none; b=uUDyJiX6FvYq4w+QIHt93uUisWsjxsWmb9hD2qBgCKE3TewKaMyphh7mR6c+Vow+ictw0+S7oA97dBY+m7WfjDZtwANRomxDFGsJ5rrxXS1nBAjcZi3a2bj9hxgTIR6HPv8HlalvSySPjTpGTpmXQmHUAa/ITzSHPzouDmAl8x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649304; c=relaxed/simple;
	bh=kmy2mO6Ztn6qNHvc650CO/TU77xJs8QmHOrwIvavFW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EYI7rpqG8yyCWuRN26xnTWimU3/r3WDHbWMHg8G2BRWlrVGi4CmVo006rFhUEju9xcs/Qam0w/3087XAC/ITmxglCERBWfE5RjFhKpdCwE2o302r8LOBVe76DfvMg3k2wVSgAqfRDTqV7xDf7cxDWgXu9nBst8pVhIIYVrVChng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ii9kHMeM; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ii9kHMeM"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-309d2e8c20cso422437a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 13:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649300; x=1747254100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kmy2mO6Ztn6qNHvc650CO/TU77xJs8QmHOrwIvavFW0=;
        b=Ii9kHMeMctS492xmSTaclibCC3DCqty9v0JMq+cm3YNisVKGVOkTIURueoKGlRmPX9
         4UZni1hM8ngpI+VjTrAKzhbRPAHx7ANNzfLQaf1ohn0IjVM7/4YvXRfsUTjZ9uzX8b2A
         oOkxEfqklSlZQeuFNqCUIEs4nJ+fBKPp9DjrIaCxpEOmZ/BKuKHhpeTG4B+MBWZmYQtz
         rdsnfpngSFNO2H27ROPT4GEbGXJK9zYrZTsKl0+y810+hi5TQB4SZMxG0mS+jcBB1ds7
         zU94B9BiK+oGCU2j02tIwnZPmEuQLH5F9BfV/9Zf8tddnP97Vv1h7OCMRw0SxQqgNTrX
         Ug+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649300; x=1747254100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kmy2mO6Ztn6qNHvc650CO/TU77xJs8QmHOrwIvavFW0=;
        b=QAiX9kgtA/ickj9qma2k/+HGco/ctsbK7a4NVQ15cmd/fX6+IZ8XIbhlyQdApsQoSq
         otTUU97Ct4xaLVu8iVY8s45kyjkJ8L332Q1Mfd1rlrhmRCG3LR6XOAc6Vkkln4ywaw+o
         /9Sbzjj6Wntk4C9kRjmomQHPCdhSyx4B2lYK+GlOfXwO69rktpZpnmPKl4Lzn3VUhz/g
         I+5qQ8990DBIYyWVxs08bJVWfsNPM/trJ34bkHCCkz1+Mt1kDlDF6Sw2vwjq5QFwInnW
         ccKRfbaSaZm9mkPvMseXhzmFIKRSAo2KyigwLKdx6E4xyU6S8Jxe2RLTLSZXSXnmATqb
         uz5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzbzGIAxrwn1i9M2wPsT5ojkpvu0KY+6pE/JIxbvt0sukVs39tlpA9peKUNkbBV3y8lJyfFKFvnAI1QDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYapDzVP2JRqbZbfgyHl839u5KWDJK30+435kdNlDook/TpCeQ
	lFrGWTiyh7Lubx6uukAA8DQWTwLxe/SolhsBJsvUpgoqbdUCuqbOc93Erw==
X-Gm-Gg: ASbGncuzaXSo8UP+qVWcDbfRr2sBlVZIOxaMnyLWzXY/m4hUIJh1mc8nVVyLakS+N/O
	eQoOMff8TwTlM9JbGHwLCXmc7/hv0qwsbBbecVUSBn7tT4eaLid/CWPjkz/cTzHGCJL7LTPsstb
	IybUBdXexHtxSsfbzqyqmdSADGlsG9EAVVXwDL7R7SeN2CueSNDHIqDnURuCZoWzoJMSDWaB9gd
	MyKcylx8ZAo30bGgn9wdFythtpCGv7PISDbGpSQtMhCgjGlU1mDirXQpIpod+QT+0lGOX/HaBlR
	Dq8waAOrI19dXGlMer5tTHpOFn1gQuE7oCB4bcEd+lh7lumaje6yaoGHH2+FsJGX3/Xwdpd3/C3
	2aKJ6Y0/I0U2wl3bnuzMEVATG98yr
X-Google-Smtp-Source: AGHT+IH50ZmiNGVsjt2Zye2X/K7EjFUlpoPhg/I1GJs+zyuQ58zFo4jUoSiEL3C5E0IuAAmPzn6ZHQ==
X-Received: by 2002:a05:6870:e995:b0:2b7:bd7f:f4d6 with SMTP id 586e51a60fabf-2db5c133eb2mr2810783fac.37.1746649289308;
        Wed, 07 May 2025 13:21:29 -0700 (PDT)
Received: from ?IPV6:2600:100c:b2a7:c99a:12d7:b0e2:f546:4c3b? ([2600:100c:b2a7:c99a:12d7:b0e2:f546:4c3b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2db5d0e53dfsm858669fac.45.2025.05.07.13.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 13:21:28 -0700 (PDT)
Message-ID: <7e6ffff3-30ec-49ff-b6a8-f36b61119ae0@gmail.com>
Date: Wed, 7 May 2025 14:56:42 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/panic: Add x86_panic_handler as default
 post-panic behavior
To: John Ogness <john.ogness@linutronix.de>, carlos.bilbao@kernel.org,
 tglx@linutronix.de, seanjc@google.com, jan.glauber@gmail.com
Cc: bilbao@vt.edu, pmladek@suse.com, akpm@linux-foundation.org,
 jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, takakura@valinux.co.jp
References: <20250428215952.1332985-1-carlos.bilbao@kernel.org>
 <20250428215952.1332985-3-carlos.bilbao@kernel.org>
 <84ldri7vv0.fsf@jogness.linutronix.de>
 <781ef1d7-f9c6-4a15-b94d-c735e83e7d01@gmail.com>
 <84bjseozci.fsf@jogness.linutronix.de>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <84bjseozci.fsf@jogness.linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On 4/30/25 02:58, John Ogness wrote:
> On 2025-04-29, Carlos Bilbao <carlos.bilbao.osdev@gmail.com> wrote:
>>> I see no reason why you don't just use safe_halt() as your panic
>>> handler.
>> Yes, in my original implementation I simply used halt, but I was
>> trying to be cautious in case any remaining messages hadn't flushed. I
>> wonder, can we be certain that, as you said, all output (e.g., a
>> backtrace) has already been displayed on screen at this point? I'm not
>> sure.
> Well, without this series, the kernel goes into an infinite loop. So if
> the messages are not all out, they won't magically appear during the
> infinite loop either.


I thought there may be some async stuff going on :)


>
> John


Thanks,

Carlos

