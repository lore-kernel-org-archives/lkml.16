Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DAA7E9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745965343; cv=none; b=W/C7rMuCVdp7wMHn/vN1SDEtxAjDOIlLWnEBnkA4vdmwRcmVVp1Efa/b/Xl7N+dHamXob8SmlDyZxtpXoSmjHsXZQRQ6A0Zh5XVXO/XnAEs4l9FX0/2Xw5q7G6colJyuPkFZUqHIywIKvIen4K89M5ixT27dQ7mHNZKgzdndskk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745965343; c=relaxed/simple;
	bh=fTKkUgDxt9wIwMolenpn+6qEdHQEp8p09AKod6Ezkn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IknYR1Kyru+bZM9QgOO4De7zcb3Q7t7EQ1jhooNcrQS0qzwadqrYq2GOmZOOK119EET9gT5qWZ+zBE9jU3sLs2wshU0hoLz7ng8PEzPd6FEYjVnkC3dC0bDVHw4UNfcSqPZi+JMiPODd9tRm2+LDGt+AwFgc84Itu1XBHDgoc3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=kcyVeqF2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="kcyVeqF2"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so59383745e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745965339; x=1746570139; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fTKkUgDxt9wIwMolenpn+6qEdHQEp8p09AKod6Ezkn0=;
        b=kcyVeqF2CC3lqFUQQ+3DJb1tjpVcc9QNGCIXXEjMwn3/pyKjfp7l0BoSe9W5R0DwhY
         m4yq8Uj+eg79PJBPkGNwMJ3V51Zg5lIYk97o22Muv9JXp7oYE3bpGnJebgEzkNFTYxqA
         54xzdIiLsOkTmRMp+I15JuGMt2/o9U3N1CqvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745965339; x=1746570139;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTKkUgDxt9wIwMolenpn+6qEdHQEp8p09AKod6Ezkn0=;
        b=PaNNEuThl6MvxkWu0HO2l6xijJhIRrWhjKZy8s5fY6DU9r6WMVw4j00o3RrQuj7VOy
         qp+O6lNnW0YAc4arkSKFkcMeVnmO71TeUWLpZ8Ct5M9rOapTnFxpFlueqnMBY5eJ1bFv
         4mrguZUvrrxRq1h0Xqwpgeh7IxjmzKBqee5F2Pi7heAATSQxuuDikycf3dxaD6TTS91i
         8VZfrPYQxWY56d/AzvnHSsx2+CqKaXGXwiCLPV1+Uqyq6heGKSm/DG6HJP1t2XHrxvOa
         dTPtrqgWFTCDEV0xRc/9edrTL6+BRjiOBXCEbckUlXTfShldKFxk0CI2bi4KrsHpeQG7
         EzFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEy+I0JOy5LApGeLipReqsNGuQLSibAdQhQ74G+DRHD3vJ5IfSzDPD84bWkQ1vcJEUQnaOgo3bEXZKndY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBdbuIWVITADL+EFHSx28xg2RYc0oUzNpxBbgFQuYdsyjncYSP
	gg83Za9fVlNIxVk19y7PJoRBkRNa5Bcun0kbZ33u251ibTOBaSioxBQouYpXtKA=
X-Gm-Gg: ASbGncvp+yc9g65p7jp5iDGo8VvNFmJv4lR6p4ayX2GFr0nnbERzpbexCJuBISYol81
	mQyfAr6d9ykBou8pd2ju2XI15XLG/AAPp83evQpOpn0qd6HIS2f7f5u4IIhe+fszY6eUIgDDPYc
	zPBJn97Cx7bg+oldjy1Hqrk8UnwSkGsIgYpdXOKXPzWY+oQZ3CT7ilfV/a2sr+AsQ4jejAkWmPT
	6XMhGB3Hv25oJ1XVoYqcp6WdYJFOIt00zatJjWSMAhBDra/Adlq6mGfnXoXOr3XSI/EsTiqCfsz
	XnMYTCAKUpvV6Om/tZbap3+5OrDqari6dlugL66a3M+7iJwUspn80wbhDHDaF0RhCVFEMXmG7tI
	PZPHSiw==
X-Google-Smtp-Source: AGHT+IFsVJ0IWld4MsfXHqlyT8E1bTztNwNDAoknj/kqVrMo6crnC+YordlPvb6QVow4T3K8s9IKTw==
X-Received: by 2002:a05:600c:4e09:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-441b1f35b4amr7287325e9.12.1745965339628;
        Tue, 29 Apr 2025 15:22:19 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ba48b0sm1715855e9.10.2025.04.29.15.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 15:22:19 -0700 (PDT)
Message-ID: <7e0c2b99-00c1-4e64-ac68-50ba7500fd20@citrix.com>
Date: Tue, 29 Apr 2025 23:22:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case
 handling to C
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
 Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250425141740.734030-1-arnd@kernel.org>
 <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com>
 <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
 <B364FF6D-DFCC-42A7-ACA1-6A74E27EE57E@zytor.com>
 <67be5eee-b67b-409a-8309-829f891b9944@citrix.com>
 <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com>
 <e5e97ff8-9670-40d1-a0fa-69504d34c4c4@citrix.com>
 <956DB0ED-F3DB-456D-8D06-6F40DBDB815A@zytor.com>
 <06d04c13-76e8-45fb-a563-e365e1f19362@citrix.com>
 <CAHk-=wig1E4B-e1_6=it1LfVQ64DJsVgO6f6Ytnbzm2qChbAdw@mail.gmail.com>
 <81ed8b53-1a40-4777-ab87-4f4abe032dbc@citrix.com>
 <CAHk-=wiAPQFf-RUr=8ra1sYdfGPGLb4QbV8THE9zY3n820L94g@mail.gmail.com>
 <72078B8D-F03E-4783-8AC2-A36464A4B6A1@zytor.com>
 <CAHk-=wi=nuDW6yCXSA-dEztZhXNuzLOaH--s_V7GOAE7n6RsRw@mail.gmail.com>
 <565ac06a-005f-4b77-930e-d63285c025b9@citrix.com>
 <CAHk-=wiMN7eMYE=SiA07f2aFFeuEV0YJ-ewoW4rJ3yQfbviuJA@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAHk-=wiMN7eMYE=SiA07f2aFFeuEV0YJ-ewoW4rJ3yQfbviuJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/04/2025 11:04 pm, Linus Torvalds wrote:
> On Tue, 29 Apr 2025 at 14:59, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> do_variable_ffs() doesn't quite work.
>>
>> REP BSF is LZCNT, and unconditionally writes it's output operand, and
>> defeats the attempt to preload with -1.
>>
>> Drop the REP prefix, and it should work as intended.
> Bah. That's what I get for just doing it blindly without actually
> looking at the kernel source. I just copied the __ffs() thing - and
> there the 'rep' is not for the zero case - which we don't care about -
> but because lzcnt performs better on newer CPUs.

Oh, I didn't realise there was also a perf difference too, but Agner Fog
agrees.

Apparently in Zen4, BSF and friends have become a single uop with a
sensible latency.  Previously they were 6-8 uops with a latency to match.

Intel appear to have have had them as a single uop since SandyBridge, so
quite a long time now.

~Andrew
